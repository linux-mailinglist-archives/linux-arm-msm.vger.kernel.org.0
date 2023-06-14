Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBD372F6DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 09:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243592AbjFNHvF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 03:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243576AbjFNHuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 03:50:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C04E1FC4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 00:50:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5149bdb59daso8967037a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686729009; x=1689321009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sru9jI8swiI5mQD6xpMUSIyIvcjQuQVuFa9Dm0VJBKk=;
        b=yOj1QwtZviIzc3neOxEF4d7ffVpV4NbIjsxfbo9yS69Z4mopAHxa8MMV3Rq5s3WA/u
         bh0Dz0saElTq2zBU0FnsybzGqtAmmZFJJGVaPv8DjILx1u73EEFs+GvP+PxjKXHT4VX3
         QKxCTHt8pTEvdRdtiblk8yGXnajBHamOOOFHctL2ow9X7VHh8orN9NW5zqF/7aJ5Ytv6
         XwM0OphMl6gT5w4E2zU9OcKeWH5o5x36NEMSfSjyHWArDIDINEyfqjSnfGP3h+R439x8
         /ogCjl043aK7kSrW63t29sdCXApwhuk2VQv0tADzOLX8fd/FXRsSaSbrQZL2aHxo2lTl
         Z5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686729009; x=1689321009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sru9jI8swiI5mQD6xpMUSIyIvcjQuQVuFa9Dm0VJBKk=;
        b=WTHBMs0FpkW9NQAMSSrVzNt22nHqBkJeSRhX2GN9yBuDwQf21l2fo/xZtyt1Jw2HAI
         TxgqQZjvjyoQOJ4uDtA4E16uuhi4ND02R49t0Nu04aYmtkPADtRRjVBulcavbbk865fP
         RUVo+PfMWH49wpaDCG5lTbdndlJpjEOAyLPzw1RC6++OFzX9ZFAjShpWaT67+Ynd7/2R
         n33L5AJHxUVqkfJm66hCYU9jyQ+fwExlABd9ZcRJ/8MB+IfyQtgMdwx8YLGJc/6PIxjd
         MXIQ+KMWgBDV3XJbMPngvvdLt0SD0RnU5GdfLkdb3mdbzSZ2OQTGjyhHPLbvmfmpfOpI
         y2kQ==
X-Gm-Message-State: AC+VfDxmuHJP+uLncTXrfnUcIdPGIaxVNmUKEM/hgYSu0HToQEZCPaxv
        /0x1ORj0YmE2yYA59+eT84O94/gaYaH6Co9+Om8DhA==
X-Google-Smtp-Source: ACHHUZ7KPipBj0TX5KOt2MeLEl+x5dcPbU8f4JfnNXuUM1vyec01U3CUmNXeQiG0oup/RYKMHTBPlKHBprxqns59q08=
X-Received: by 2002:aa7:d691:0:b0:514:9e26:1f51 with SMTP id
 d17-20020aa7d691000000b005149e261f51mr8488936edr.24.1686729008860; Wed, 14
 Jun 2023 00:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 14 Jun 2023 13:19:57 +0530
Message-ID: <CAO_48GHQ7eu37rnPRz4eN2XsBUEznngz04EZcEPFu5w6ujkLGA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: do not enable
 color-management if DSPPs are not available
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 12 Jun 2023 at 23:55, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
>
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu=
 driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks for your patch, Dmitry. LGTM.

Please feel free to add:
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_=
helper_funcs =3D {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane =
*plane,
>                                 struct drm_plane *cursor)
>  {
> +       struct msm_drm_private *priv =3D dev->dev_private;
> +       struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
>         struct drm_crtc *crtc =3D NULL;
>         struct dpu_crtc *dpu_crtc =3D NULL;
>         int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *d=
ev, struct drm_plane *plane,
>
>         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>
> -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +       if (dpu_kms->catalog->dspp_count)
> +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>
>         /* save user friendly CRTC name for later */
>         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base=
.id);
> --
> 2.39.2
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
