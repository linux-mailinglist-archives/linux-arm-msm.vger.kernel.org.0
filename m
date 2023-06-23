Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6391273BA1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 16:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjFWO1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 10:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbjFWO1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 10:27:42 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DE82129
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 07:27:40 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-570284c7e61so5980017b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687530460; x=1690122460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OQtb36B/jvSIQVsAQjuWBSNS8FYoy6k1fXAvh6DjJWU=;
        b=d9TJKMT0jhdEIFlPgQaFIgnoTU1VhVDBh73nPF21AhG4NA44pTsUED0hFjmw6fN8dG
         x+b3cRAOSqab2ZU1NdDXbVDLcRJJPIAOKardDtOgMtc10KrkEgRVY1O4xLeB0e67aLWq
         avG9/SeA7RzUHVQg6Mjf2LN+vKT6etXWMIhzjABkepeYdouKedS9s0935nw1BAULqlQY
         u+U1w1pW3VRvVbrIZaoFs7mcQrjz7ohX2M9uNsTdivV3IACDyKWqebqueAs3WzSZmpzg
         CkssqyuHx08h3sw7YdIhW+Lp3sQElqFfmCwsACpvJIhhgIqAeFNG5SqAVFCpsMDFklix
         qmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687530460; x=1690122460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQtb36B/jvSIQVsAQjuWBSNS8FYoy6k1fXAvh6DjJWU=;
        b=RZXt+oT3i/scdDpG8js2iE22j+DFNaP/uh4uienVZ2p7yTUdV2NRtQysAm87UNeu8C
         2ore890DGZfZZlW9aCzfolEdbzukX6uoFH+lb0vZPvgCBPyYXnYnhxqqP8PEOo0jsa9E
         F70+SrxYZFRFHTrjwmpQZeX9mbbc8Xf7/HtAeKbTnFcx3DVgenKjyjAeadQOM4luzxrk
         xJpsr1Tf6wgqsxO3Y2oEBBLVLxDzy4H48uUOggmwKL1U5S6HjxzR2IXihkgeOyi4Cq72
         usFhozqN4mivB+rVzPI6ANzwRa0iQvqZ9N2T1kDgF2xX1I6CTJ/xSxNI2yLGfmk8d2V4
         /HLQ==
X-Gm-Message-State: AC+VfDywPj7Pj/Sl0RXLCNtTUiwHFOV17Ib92kw/xAAHHvQGexh6M8Lq
        SWlrDteBsJj8v6uOTcVoRprOFJzqQ+WUby8/1241Vg==
X-Google-Smtp-Source: ACHHUZ5kMQAnD6EY+L3gDgzquKsrJeqG1YVbA96Uisdx1C0UvHubtW5tjteiehWebdIfcwmUMCE3M9jwMvmkNNX4mhE=
X-Received: by 2002:a25:9385:0:b0:bea:918f:2efb with SMTP id
 a5-20020a259385000000b00bea918f2efbmr16899693ybm.3.1687530459776; Fri, 23 Jun
 2023 07:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230623141806.13388-1-quic_kbajaj@quicinc.com> <20230623141806.13388-7-quic_kbajaj@quicinc.com>
In-Reply-To: <20230623141806.13388-7-quic_kbajaj@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 23 Jun 2023 17:27:28 +0300
Message-ID: <CAA8EJprPLt2bumvFvCMNL0DQs9XFxLfcrBxrrJHk6NFhNBJx_g@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] soc: qcom: llcc: Add QDU1000 and QRU1000 LLCC support
To:     Komal Bajaj <quic_kbajaj@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 23 Jun 2023 at 17:19, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Add LLCC configuration data for QDU1000 and QRU1000 SoCs
> and updating macro name for LLCC_DRE to LLCC_ECC as per
> the latest specification.

Two commits please.

>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 65 +++++++++++++++++++++++++++++-
>  include/linux/soc/qcom/llcc-qcom.h |  2 +-
>  2 files changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 3c29612da1c5..d2826158ae60 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -187,7 +187,7 @@ static const struct llcc_slice_config sc8280xp_data[] = {
>         { LLCC_MMUHWT,   13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
>         { LLCC_DISP,     16, 6144, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
>         { LLCC_AUDHW,    22, 2048, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> -       { LLCC_DRE,      26, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +       { LLCC_ECC,      26, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
>         { LLCC_CVP,      28, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
>         { LLCC_APTCM,    30, 1024, 3, 1, 0x0,   0x1, 1, 0, 0, 1, 0, 0 },
>         { LLCC_WRCACHE,  31, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
> @@ -358,6 +358,36 @@ static const struct llcc_slice_config sm8550_data[] =  {
>         {LLCC_VIDVSP,   28,  256, 4, 1, 0xFFFFFF, 0x0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
>  };
>
> +static const struct llcc_slice_config qdu1000_data_2ch[] = {
> +       {LLCC_MDMHPGRW, 7, 512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_MODHW,    9, 256, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_MDMPNG,  21, 256, 0, 1,   0x3, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_ECC,     26, 512, 3, 1, 0xFFC, 0x0, 0, 0, 0, 0, 1, 0, 0 },
> +       {LLCC_MODPE,   29, 256, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_APTCM,   30, 256, 3, 1,   0x0, 0xC, 1, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_WRCACHE, 31, 128, 1, 1,   0x3, 0x0, 0, 0, 0, 0, 1, 0, 0 },
> +};
> +
> +static const struct llcc_slice_config qdu1000_data_4ch[] = {
> +       {LLCC_MDMHPGRW, 7, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_MODHW,    9, 512,  1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_MDMPNG,  21, 512,  0, 1,   0x3, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_ECC,     26, 1024, 3, 1, 0xFFC, 0x0, 0, 0, 0, 0, 1, 0, 0 },
> +       {LLCC_MODPE,   29, 512,  1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_APTCM,   30, 512,  3, 1,   0x0, 0xC, 1, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_WRCACHE, 31, 256,  1, 1,   0x3, 0x0, 0, 0, 0, 0, 1, 0, 0 },
> +};
> +
> +static const struct llcc_slice_config qdu1000_data_8ch[] = {
> +       {LLCC_MDMHPGRW, 7, 2048, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_MODHW,    9, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_MDMPNG,  21, 1024, 0, 1,   0x3, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_ECC,     26, 2048, 3, 1, 0xFFC, 0x0, 0, 0, 0, 0, 1, 0, 0 },
> +       {LLCC_MODPE,   29, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_APTCM,   30, 1024, 3, 1,   0x0, 0xC, 1, 0, 0, 1, 0, 0, 0 },
> +       {LLCC_WRCACHE, 31, 512,  1, 1,   0x3, 0x0, 0, 0, 0, 0, 1, 0, 0 },
> +};
> +
>  static const struct llcc_edac_reg_offset llcc_v1_edac_reg_offset = {
>         .trp_ecc_error_status0 = 0x20344,
>         .trp_ecc_error_status1 = 0x20348,
> @@ -557,6 +587,38 @@ static const struct qcom_llcc_config sm8550_cfg[] = {
>         { },
>  };
>
> +static const struct qcom_llcc_config qdu1000_cfg[] = {
> +       {
> +               .sct_data       = qdu1000_data_8ch,
> +               .size           = ARRAY_SIZE(qdu1000_data_8ch),
> +               .need_llcc_cfg  = true,
> +               .reg_offset     = llcc_v2_1_reg_offset,
> +               .edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +       },
> +       {
> +               .sct_data       = qdu1000_data_4ch,
> +               .size           = ARRAY_SIZE(qdu1000_data_4ch),
> +               .need_llcc_cfg  = true,
> +               .reg_offset     = llcc_v2_1_reg_offset,
> +               .edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +       },
> +       {
> +               .sct_data       = qdu1000_data_4ch,
> +               .size           = ARRAY_SIZE(qdu1000_data_4ch),
> +               .need_llcc_cfg  = true,
> +               .reg_offset     = llcc_v2_1_reg_offset,
> +               .edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +       },
> +       {
> +               .sct_data       = qdu1000_data_2ch,
> +               .size           = ARRAY_SIZE(qdu1000_data_2ch),
> +               .need_llcc_cfg  = true,
> +               .reg_offset     = llcc_v2_1_reg_offset,
> +               .edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +       },
> +       { },
> +};
> +
>  static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
>
>  /**
> @@ -1114,6 +1176,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id qcom_llcc_of_match[] = {
> +       { .compatible = "qcom,qdu1000-llcc", .data = qdu1000_cfg},
>         { .compatible = "qcom,sc7180-llcc", .data = sc7180_cfg },
>         { .compatible = "qcom,sc7280-llcc", .data = sc7280_cfg },
>         { .compatible = "qcom,sc8180x-llcc", .data = sc8180x_cfg },
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> index 93417ba1ead4..1a886666bbb6 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -30,7 +30,7 @@
>  #define LLCC_NPU         23
>  #define LLCC_WLHW        24
>  #define LLCC_PIMEM       25
> -#define LLCC_DRE         26
> +#define LLCC_ECC         26
>  #define LLCC_CVP         28
>  #define LLCC_MODPE       29
>  #define LLCC_APTCM       30
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
