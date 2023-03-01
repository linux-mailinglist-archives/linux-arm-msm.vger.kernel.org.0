Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C566A6D9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 14:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCAN63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 08:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCAN62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 08:58:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3856206A0;
        Wed,  1 Mar 2023 05:58:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 917FA61300;
        Wed,  1 Mar 2023 13:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AE6C433EF;
        Wed,  1 Mar 2023 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677679105;
        bh=QGo/oP9tKdNBgO0z4vHGbpkzyEW1zEy/oteBVFBvOz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CnocpLmRto/0M2utYFCsaFosjJTjVc5q58Y//xF4WRsS5vd8HK54D4sDDMysglDAk
         5COk3uHVVD0aIJ0hLHqdz8dA/xEzCB1/JmXABrMjIua92t69//yZ8iYAci5Rsvc73Z
         pR7U0iaIxY4YdxzFr8PFkUM3jDAKDM/W3hdTZkS3FWNN11ldHGyLX+kCLamXjTaD1z
         XPYBZQS6gvyAfNkUEmohCase9ercKkxWTybf3fjiJekiqHs03KKGOJJ2GDiwuEHnVS
         YU0EAILjU2FiUXXtjn16L0ZJV1XY/kMSTT6hxyDDlFodnliA5XgvC413TP0eCQ52Tn
         Rs/c7OoTsICdg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pXMyo-0005d0-7O; Wed, 01 Mar 2023 14:58:50 +0100
Date:   Wed, 1 Mar 2023 14:58:50 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <Y/9aGus6jzIHqjoK@hovoldconsulting.com>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
 <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
 <Y8ZWl85gSpOaLgO4@hovoldconsulting.com>
 <Y86vaTQR7INWezyj@hovoldconsulting.com>
 <20230123171749.GA623918@hu-bjorande-lv.qualcomm.com>
 <Y8+SHQ/klPwusQRj@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8+SHQ/klPwusQRj@hovoldconsulting.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 24, 2023 at 09:09:02AM +0100, Johan Hovold wrote:
> On Mon, Jan 23, 2023 at 09:17:49AM -0800, Bjorn Andersson wrote:
> > On Mon, Jan 23, 2023 at 05:01:45PM +0100, Johan Hovold wrote:
> > > On Tue, Jan 17, 2023 at 09:04:39AM +0100, Johan Hovold wrote:
> > > > On Mon, Jan 16, 2023 at 08:51:22PM -0600, Bjorn Andersson wrote:
> 
> > > > > Perhaps we have shuffled other things around to avoid this bug?  Either
> > > > > way, let's this on hold  until further proof that it's still
> > > > > reproducible.
> > > > 
> > > > As I've mentioned off list, I haven't hit the apparent race I reported
> > > > here:
> > > > 
> > > > 	https://lore.kernel.org/all/Y1efJh11B5UQZ0Tz@hovoldconsulting.com/
> > > > 
> > > > since moving to 6.2. I did hit it with both 6.0 and 6.1-rc2, but it
> > > > could very well be that something has changes that fixes (or hides) the
> > > > issue since.
> > > 
> > > For unrelated reasons, I tried enabling async probing, and apart from
> > > apparently causing the panel driver to probe defer indefinitely, I also
> > > again hit the WARN_ON() I had added to catch this:
> > > 
> > > [   13.593235] WARNING: CPU: 0 PID: 125 at drivers/gpu/drm/drm_probe_helper.c:664 drm_kms_helper_hotplug_event+0x48/0x7
> > > 0 [drm_kms_helper]
> 
> > > So the bug still appears to be there (and the MSM DRM driver is fragile
> > > and broken, but we knew that).
> > > 
> > 
> > But the ordering between mode_config.funcs = !NULL and
> > drm_kms_helper_poll_init() in msm_drm_init() seems pretty clear.
> > 
> > And my testing shows that drm_kms_helper_poll_init() is the cause for
> > getting bridge->hpd_cb != NULL.
> > 
> > So the ordering seems legit, unless there's something else causing the
> > assignment of bridge->hpd_cb to happen earlier in this scenario.
> 
> I'm not saying that this patch is correct (indeed it doesn't seem to
> be), but only that the bug I reported still appears to be present in
> 6.2.

So after debugging this issue a third time, I can conclude that it is
still very much present in 6.2.

It appears you looked at the linux-next tree when you concluded that
this patch was not needed. In 6.2 the bridge->hpd_cb callback is set
before mode_config.funcs is initialised as part of
kms->funcs->hw_init(kms).

The hpd DRM changes heading into 6.3 do appear to avoid the NULL-pointer
dereference by moving the bridge->hpd_cb initialisation to
drm_kms_helper_poll_init() as you mention above.

The PMIC GLINK altmode driver still happily forwards notifications
regardless of the DRM driver state though, which can lead to missed
hotplug events. It seems you need to implement the
hpd_enable()/disable() callbacks and either cache or not enable events
in fw until the DRM driver is ready.

Johan
