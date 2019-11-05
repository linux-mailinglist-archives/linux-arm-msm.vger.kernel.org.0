Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80077EFA7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 11:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbfKEKIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 05:08:06 -0500
Received: from onstation.org ([52.200.56.107]:46082 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730699AbfKEKIG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 05:08:06 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D806B3E8F7;
        Tue,  5 Nov 2019 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1572948485;
        bh=KfnIsJjT3r6plldCySNd3bmNluaRX31wCcNiy0r6Xts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IxBhVMZS5/JpU1eXgyW7Fv/ilzktRpbORgO1mzIb3PZ5lNrugn5u3ATQ9cNwuha1E
         noZYlzhYK/Q5PDYDmWXe/MuCrmSuA6oFs/5vz/dn1UZEm8jAVoAAiQ1PjB7Q+oTFs4
         O1twcRr93yW/W5G65ZNSOc5vHZAcwId3oMz6ZtSs=
Date:   Tue, 5 Nov 2019 05:08:04 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191105100804.GA9492@onstation.org>
References: <20191105000129.GA6536@onstation.org>
 <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 04, 2019 at 04:19:07PM -0800, Rob Clark wrote:
> On Mon, Nov 4, 2019 at 4:01 PM Brian Masney <masneyb@onstation.org> wrote:
> >
> > Hey Rob,
> >
> > Since commit 2d99ced787e3 ("drm/msm: async commit support"), the frame
> > buffer console on my Nexus 5 began throwing these errors:
> >
> > msm fd900000.mdss: pp done time out, lm=0
> >
> > The display still works.
> >
> > I see that mdp5_flush_commit() was introduced in commit 9f6b65642bd2
> > ("drm/msm: add kms->flush_commit()") with a TODO comment and the commit
> > description mentions flushing registers. I assume that this is the
> > proper fix. If so, can you point me to where these registers are
> > defined and I can work on the mdp5 implementation.
> 
> See mdp5_ctl_commit(), which writes the CTL_FLUSH registers.. the idea
> would be to defer writing CTL_FLUSH[ctl_id] = flush_mask until
> kms->flush() (which happens from a timer shortly before vblank).
> 
> But I think the async flush case should not come up with fbcon?  It
> was really added to cope with hwcursor updates (and userspace that
> assumes it can do an unlimited # of cursor updates per frame).. the
> intention was that nothing should change in the sequence for mdp5 (but
> I guess that was not the case).

The 'pp done time out' errors go away if I revert the following three
commits:

cd6d923167b1 ("drm/msm/dpu: async commit support")
d934a712c5e6 ("drm/msm: add atomic traces")
2d99ced787e3 ("drm/msm: async commit support")

I reverted the first one to fix a compiler error, and the second one so
that the last patch can be reverted without any merge conflicts.

I see that crtc_flush() calls mdp5_ctl_commit(). I tried to use
crtc_flush_all() in mdp5_flush_commit() and the contents of the frame
buffer dance around the screen like its out of sync. I renamed
crtc_flush_all() to mdp5_crtc_flush_all() and removed the static
declaration. Here's the relevant part of what I tried:

--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -171,7 +171,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
 
 static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
-       /* TODO */
+       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+       struct drm_crtc *crtc;
+
+       for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask) {
+               if (!crtc->state->active)
+                       continue;
+
+               mdp5_crtc_flush_all(crtc);
+       }
 }

Any tips would be appreciated.

Brian
