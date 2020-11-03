Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00C72A4C03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 17:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgKCQxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 11:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgKCQxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 11:53:36 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73E7C0613D1;
        Tue,  3 Nov 2020 08:53:36 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id s14so15243095qkg.11;
        Tue, 03 Nov 2020 08:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rOoP2fWtBXqSw4r+2p1MaKzqZjSJnhx6ffXaf9QlVk=;
        b=idUuY1I/7/Dsp/4V6KdBy9e68cpsernin93UYfooKQagDBRrwQ0KaQ+9GJTmtvv/mG
         ulgBnE42Wr+iSUmVIuUzN3/ysFAaXO8xltucoFfH1diTuBWjpKtk+P0pbKrZZ0qdbqQj
         RyLjefqx/uzE+yRAHEH096sLCNoi8g71eiqO4/07JhRWriWTrDUmsovBz04G+Vq9cSF5
         S6GScFHctzEQlaSnrCG6G/5+xB5VB5LcnVOJbpY+2KSuCr0wTxjF1msZC0afrkApwS3+
         +uAvoyOBf9Sp8n5AUmsEtgaS8HXlkVuHxeQClMIEjVVr4atNPefQCReKjZ+iCpmsDFKX
         rLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rOoP2fWtBXqSw4r+2p1MaKzqZjSJnhx6ffXaf9QlVk=;
        b=bQ2mKVoN7MkgjcYRDQTdEngWGvm3z7WzmQTv/42mdad5GjEJCcvOWU1Wv6ZYYyX99o
         fZDm0OeeELtMcAQRFb057DqxlAPDCfiOijl7dvEJYTezdtAswGW9PRUcWeu0SsplJnpD
         7rkLqCm7yVXyxu047f19ujuwYDtGgHFkZ13rC+nYEziBRKXRhu24IdGz57ZL2ntZhHky
         4KrvFvNmxpvIkGUJMxDCAfHTCBoBQEC3DPUMwpglOT56ZLa3SucKhLhPoB1ttgNUyLMu
         cxH/o5DmKiHyz8PdTTuVk+EsNtKbF0sQJrT8nQDVYF0aQwslStBPp+WIeegQAX7pmY9h
         7oyA==
X-Gm-Message-State: AOAM533qko3JhutFSsnoA8OutVS8Tqh+2zu8hMt/xOQrzuhP6dheMTIE
        +Klfm/iy0sNUS5nud37UCRXubOgdR01rIMDmR2c=
X-Google-Smtp-Source: ABdhPJwHZQ/SuWWjX2a7/T2uWhTDgyqi0D7QJ327tEhGpJR6MJSjoTNFKlerViL4vMV6iTYKSx3eZqV9iBL7TFnY5UY=
X-Received: by 2002:a37:664a:: with SMTP id a71mr15022946qkc.370.1604422415844;
 Tue, 03 Nov 2020 08:53:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKWwwMhUPk3hAs6oPKHxvV7jVgHh4WP3bvZGYOkPaSF9fRRh9Q@mail.gmail.com>
In-Reply-To: <CAKWwwMhUPk3hAs6oPKHxvV7jVgHh4WP3bvZGYOkPaSF9fRRh9Q@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 3 Nov 2020 08:53:24 -0800
Message-ID: <CAF6AEGt_tNO2uPZk_rA=q-haUSgvcvbHE53gyrOjpdVOqr1J0g@mail.gmail.com>
Subject: Re: [PATCH] drivers: drm: fix msm_drv.h warning
To:     dev god <g0d3ph@gmail.com>
Cc:     trivial@kernel.org, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Vara Reddy <varar@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Zheng Bin <zhengbin13@huawei.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Should be fixed by:

https://patchwork.freedesktop.org/patch/397039/?series=83038&rev=1

On Mon, Nov 2, 2020 at 7:44 PM dev god <g0d3ph@gmail.com> wrote:
>
> Hi
>
> fix implicit declaration of function error.
>
> >> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1229:7: error: implicit declaration of function 'msm_dp_display_pre_disable' [-Werror,-Wimplicit-function-declaration]
>                    if (msm_dp_display_pre_disable(priv->dp, drm_enc))
>                        ^
>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1229:7: note: did you mean 'msm_dp_display_disable'?
>    drivers/gpu/drm/msm/msm_drv.h:420:19: note: 'msm_dp_display_disable' declared here
>    static inline int msm_dp_display_disable(struct msm_dp *dp,
>                      ^
>    1 error generated.
>
> Signed-off-by: Gah0 <g0d3ph@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c258b553..52d9a82fb64f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,7 +14,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
>
> -#include "msm_drv.h"
> +#include "../../msm_drv.h"
>  #include "dpu_kms.h"
>  #include "dpu_hwio.h"
>  #include "dpu_hw_catalog.h"
> --
> 2.25.1
