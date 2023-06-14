Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F176772F6F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 09:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243501AbjFNHxa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 03:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243498AbjFNHxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 03:53:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B116271E
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 00:52:11 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso4569011fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 00:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686729125; x=1689321125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP1DmCAfOtP9kPFM3l+kOjrNEvdlZ7sAWEv+X9b74Lg=;
        b=Psw+D3wqBCGzOv9YOv5VOmbqhST8XyVv5RW9fDDkT6Xq2gVZvxA7O6IzK0KmlSGEwp
         q4eJiLgRza86okJeVz5JVa3Bpk26Tfm/Yq8yJZ8DViZwEsnaGPJQXbBf8GV9hMynP7bq
         NKt0gpcg712d5Lor/CbVkoncAI9UBeXfCBUrRQzMPjNuR34/EwEzOq8iYyVTN7Gc3/Oo
         2PtQ/6ox1XVEXZCgtfh8ViJ8TFIDMpX4kq9DELWCgblXD8M6RzObtUE12K26gQMQ/HUt
         kQB2s9aV5KU8g07hMsziyhEuw++a5VQvej8dHanparVFE14ynW+U4kCyjiZL7tPWQPJ8
         PN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686729125; x=1689321125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP1DmCAfOtP9kPFM3l+kOjrNEvdlZ7sAWEv+X9b74Lg=;
        b=DNtcSvaNjxrCs32U9Z2DqFvEAu4hwsvMx4U1Kj9mzwCi9TLmBupVMQFNmIuSOb3FLO
         yfZxrh4WlhP5me64zT+SjWKXFSrOBtJywVlPn1i5j84pzgNb6Lnrteh1znWvvbeX8cAQ
         +2Bm1oQ1hh1HixkrP/veI5fLDlKMUx+n1wz7+UEZGblOBMG51YnHhS+cJ9sXIwTu+D8t
         SayBm3Vkod+vtNdMx7B8t84PJ/HCjP8jAez+BtVFPT+bQxZzQx5ywUnaqWRxAKehLmR8
         Hr0KADBTOAHPfkfbWj2b7Ma0kpdZU27XCGQSfNUX/o9ZtbG/kv3tr8AAjSoDKWa9eZDP
         Fdug==
X-Gm-Message-State: AC+VfDySTsB3qOKPAYsCcc6BZ06vgOLw/6VHqfdvDWqqV20fha1VL3m5
        U6Ih9VledbvxU3noawtdxlOZXfuKQD8J7wAoE9Jqcg==
X-Google-Smtp-Source: ACHHUZ7ybzoAFrT+JiKy5zoJvkgAVC63J16C3gDhcHxYjz4qg3LzzlshyXtNnNmPeI9NJ91okGlvZsin2ZXTdiY9VN0=
X-Received: by 2002:a2e:9bc7:0:b0:2ad:509a:22b8 with SMTP id
 w7-20020a2e9bc7000000b002ad509a22b8mr5317952ljj.16.1686729125211; Wed, 14 Jun
 2023 00:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org> <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 14 Jun 2023 13:21:53 +0530
Message-ID: <CAO_48GGJiqPk3Df+APzqhuOoqUO5G+eZRD5=N+9GrL4JEX5PEQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks
 found on sdm845
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
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
> Add definitions of DSPP blocks present on the sdm845 platform. This
> should enable color-management on sdm845-bassed devices.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Thanks for your patch, Dmitry. LGTM.

Please feel free to add:
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/dri=
vers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 36ea1af10894..b6098141bb9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] =3D {
>
>  static const struct dpu_lm_cfg sdm845_lm[] =3D {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +               &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>         LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +               &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>         LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> +               &sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
>         LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
> +               &sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
>         LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
>                 &sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>         LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>                 &sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>
> +static const struct dpu_dspp_cfg sdm845_dspp[] =3D {
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +};
> +
>  static const struct dpu_pingpong_cfg sdm845_pp[] =3D {
>         PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MAS=
K, 0, sdm845_pp_sblk_te,
>                         DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg =3D {
>         .sspp =3D sdm845_sspp,
>         .mixer_count =3D ARRAY_SIZE(sdm845_lm),
>         .mixer =3D sdm845_lm,
> +       .dspp_count =3D ARRAY_SIZE(sdm845_dspp),
> +       .dspp =3D sdm845_dspp,
>         .pingpong_count =3D ARRAY_SIZE(sdm845_pp),
>         .pingpong =3D sdm845_pp,
>         .dsc_count =3D ARRAY_SIZE(sdm845_dsc),
> --
> 2.39.2
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
