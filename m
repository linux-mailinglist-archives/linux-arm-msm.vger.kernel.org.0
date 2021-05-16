Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF680381BF2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 03:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhEPBXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 21:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEPBXK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 21:23:10 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31807C061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 18:21:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so1009905pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 18:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SoLXbgYZkv5FkSbOBiV8Z96V28Oxq+j8zJYbMXZmMqc=;
        b=hN/SsP40Kve4+YaC6v+UM3BsAdoWfzF2EK9+FFS91evn7T9gTIavtbi8+itbSj/TH3
         mQcWwk3qUYsQTY7dU6wyVgk6b517rHM+B8d+fOGXm4+hNkG1l6RFpUOm/AfndPQ1ov48
         TnErTfcMhsxacNL6+8/X+3gGoBG4bZDn0FjHANMnAyZcmXZTblf4STcixI4rtL1RSc1A
         QSLpu5AodvH81M2HsHngW81wOG3eAhk55PTYf3buMPWPPk2me17SsDjWqFKNIgfCVxks
         YcZhna/E2jrIVTUy1vDnRU4EZ0ByaMizDVKSC3U/KjUO91g1ttw4FOTD7T0RyWHGj302
         QP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SoLXbgYZkv5FkSbOBiV8Z96V28Oxq+j8zJYbMXZmMqc=;
        b=GqW3x9TMhe+xx1Q2JU8lmorgp6tAxy3uI05pPjdTDnBsMkKxDLWvSCiFTJaa5nRgFX
         /6Uty7TKOr1Z61P9N57Dp8vycmGyAHWNwwdHtqRwz9CZSfPAJ0on9AztBatuaFqAQY86
         qwqDNFm4D6gSUhBfPseuYjK1mXEe6IEcsrnWQ0SZYF/23andBhpZSCbjVFphfjaiheCc
         rSJAxZJfhuWY7nGiqqhxVRIdswJuYAz061oTz91LJaAPFURDJTye0arMAFN62CDVBnJG
         29LjanbX1NY74gSuEqpzOUHAPtS/fiMDPNJb/seHT3ZYx2Cdv+qdv5o8x2mKLHJctsT0
         L5jw==
X-Gm-Message-State: AOAM532G+sxRq3ekBvKuiU/Wrra6weFUPEJJkGnYoMeaG8F87fHioVLY
        n4H0d7bTWExRAdQYI4uYck4TVYa6rXUNBS3f3nI=
X-Google-Smtp-Source: ABdhPJxefDnsWO+LVGNiOiMX/uOXtRC6O8nz0TZcq0ZLx81BswlnwyHgiJCj6DwkzPdHqhCRA77OjRPdybJtCLDVt6Q=
X-Received: by 2002:a17:90b:224e:: with SMTP id hk14mr15006501pjb.29.1621128114379;
 Sat, 15 May 2021 18:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org> <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
From:   Arnaud Vrac <rawoul@gmail.com>
Date:   Sun, 16 May 2021 03:21:43 +0200
Message-ID: <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 5/6] drm/msm/dpu: drop unused lm_max_width
 from RM
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Le dim. 16 mai 2021 =C3=A0 00:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> No code uses lm_max_width from resource manager, so drop it.

I have a pending patch which uses this value to properly determine the
number of LMs to use in the topology. Currently the code uses a
hardcoded value of MAX_HDISPLAY_SPLIT (1080), but in reality I believe
it should be the lm max width (typically 2560). This will avoid using
two LMs to render resolutions like 1280x720 or 1920x1080.

I haven't managed to make hdmi work yet on DPU (testing on MSM8998) so
I'm not ready to send the patch yet, but it doesn't seem to trigger
any error.

-Arnaud


>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
>  2 files changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.c
> index c36700a06ff2..ec4387ad1182 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -88,18 +88,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>                         goto fail;
>                 }
>                 rm->mixer_blks[lm->id - LM_0] =3D &hw->base;
> -
> -               if (!rm->lm_max_width) {
> -                       rm->lm_max_width =3D lm->sblk->maxwidth;
> -               } else if (rm->lm_max_width !=3D lm->sblk->maxwidth) {
> -                       /*
> -                        * Don't expect to have hw where lm max widths di=
ffer.
> -                        * If found, take the min.
> -                        */
> -                       DPU_ERROR("unsupported: lm maxwidth differs\n");
> -                       if (rm->lm_max_width > lm->sblk->maxwidth)
> -                               rm->lm_max_width =3D lm->sblk->maxwidth;
> -               }
>         }
>
>         for (i =3D 0; i < cat->ctl_count; i++) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.h
> index ee90b1233430..0c9113581d71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -17,14 +17,10 @@ struct dpu_global_state;
>   * struct dpu_rm - DPU dynamic hardware resource manager
>   * @mixer_blks: array of layer mixer hardware resources
>   * @ctl_blks: array of ctl hardware resources
> - * @lm_max_width: cached layer mixer maximum width
> - * @rm_lock: resource manager mutex
>   */
>  struct dpu_rm {
>         struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>         struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
> -
> -       uint32_t lm_max_width;
>  };
>
>  struct dpu_kms;
> --
> 2.30.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
