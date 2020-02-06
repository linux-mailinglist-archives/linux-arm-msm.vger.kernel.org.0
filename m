Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D6A154BB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 20:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgBFTMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 14:12:41 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:36058 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbgBFTMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 14:12:41 -0500
Received: by mail-io1-f68.google.com with SMTP id d15so7494129iog.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 11:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ru+inu1PmEIJ9vDnJLv1Qr4gQtvZqrjXnMpeSc0T07w=;
        b=dOu8k7co1W3I1l1ud/O4tNq6yrR8hg9NmPtIwy/s1Z6lQY342ZljFEmid3M8nHnKoE
         o6EgzYmkeJe2Zuz2J3Vz99vNyFGmG5pEZQddN+ZtJBEGBSrIGW1REL64YKWw0eC4HOF2
         8IkPafFKv5Gs9Dp6vgisxTnweTLTpT+i5SCPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ru+inu1PmEIJ9vDnJLv1Qr4gQtvZqrjXnMpeSc0T07w=;
        b=LyKREeYuY3q/Bxg/Lnr2tHM4jMPqGw+bUM8lBx0vuJINHoDKib9CHMtQhZHm9NAGB7
         23CG7e0pN23qU50rXSo4M4QBqbYcOnl82kJvitAe910dn3CBgqmqNd7BZSk1xYa+HVS0
         sV1ZtTthiopQKN8kTGfgfM49pTl95Aom6711/gQD32gK9AbxT6fl+ju26XD0G99Z1/K0
         fWmb0vhz5mk1ns0pgiCAiheU14vL5znKQ3JKnvKdepfklns5DrwTwJW/l53bkdbpDCdw
         G4fL9ymlXu7HZRbZzi4Pp4ZDhFzHKS95fzEd9Xr297Y01gmWfXZ/O/Dg2G1v2wOHNp+9
         Q4ng==
X-Gm-Message-State: APjAAAVvgtYyT2Md6kM6xgxbOrA3nThyPH2VDcIlLOyymsut4xr83w+i
        EladIoUqyP7p6/qSTezVaqmOkW60DRA=
X-Google-Smtp-Source: APXvYqwxoXAldB0vq70+bzz6L3a6ziGgheri1F4WRoS3GwgGdLPFFA0mxv7DhP3o75LMid7o4keW/A==
X-Received: by 2002:a6b:6604:: with SMTP id a4mr35471728ioc.300.1581016358420;
        Thu, 06 Feb 2020 11:12:38 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id 75sm218023ila.61.2020.02.06.11.12.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 11:12:38 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id t17so6118887ilm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 11:12:36 -0800 (PST)
X-Received: by 2002:a92:508:: with SMTP id q8mr5345001ile.187.1581016355450;
 Thu, 06 Feb 2020 11:12:35 -0800 (PST)
MIME-Version: 1.0
References: <1580935697-28195-1-git-send-email-jcrouse@codeaurora.org> <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
In-Reply-To: <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Feb 2020 11:12:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7iWY1z5mwS0FyHyAA5EoFkAYzL-HKRaFMbRkMu6ffkg@mail.gmail.com>
Message-ID: <CAD=FV=U7iWY1z5mwS0FyHyAA5EoFkAYzL-HKRaFMbRkMu6ffkg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix a6xx GMU shutdown sequence
To:     Rob Clark <robdclark@gmail.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 5, 2020 at 1:00 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Feb 5, 2020 at 12:48 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> > updating the VBIF flush in a6xx_gmu_shutdown and instead
> > inserted the new sequence into a6xx_pm_suspend along with a redundant
> > GMU idle.
> >
> > Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> > the appropriate place in the shutdown routine and remove the redundant
> > idle call.
> >
> > v2: Remove newly unused variable that was triggering a warning
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Without this patch I'm seeing some really bad behavior where the whole
system will pause for a bit, especially if it has been idle.  After
this patch things are much better.  Thus:

Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")
Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
