Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC469585B80
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jul 2022 20:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbiG3SID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jul 2022 14:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiG3SID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jul 2022 14:08:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB5E1572E
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jul 2022 11:08:01 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v5so3963508wmj.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jul 2022 11:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DEFqBxpGYalSFZL6OyvPXVJgfc+DfLkkt00YWVhvQvA=;
        b=qs5oQJumRaRtz8lFgAlzeo/WdCMLpZRexyaOC9me35nCrjMyQQXoOSYHCod1Tz1QuZ
         WXkFCx2sOvZJTnLD8wwQcTdyaEwOLyE+ouAIdWkXYSH0FovvG80z3At9m7o6mEp436ZI
         F+vQbpoIjno8ZU7isqApAgB0bxLwgGATfrgYllwYQksROAriG7+vdzH+XoSO9nAGrEHS
         +I1mm/WwGWo2hzlKqakTzvxKF666dn7rm+5/yGLynyJVW0mfKoY5qqfpvWXhCoo/9thY
         nEjxDKMuxIV7i/vqoYr1drhbuez5auYEXErbv4KagE3P8IpKLuf+SURoQKHMttnh8Dps
         aRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DEFqBxpGYalSFZL6OyvPXVJgfc+DfLkkt00YWVhvQvA=;
        b=O4Muyzioa3KDuQmfvNAB7/2BZR0BOe+ke9/DK888jiG+S1jwBMNrCwo9oZ9JYYzhmX
         eBN1S5uW2FlabneZHnxRCDgkjb8ELArtbTawVentHqMFdKFZ9uCdm8GVaCI0qcZ350HC
         3pbqCNFxEeSO4pqZ1/eTzNoTDy7EPp2l2b4TVNp5PxltYsjWF3Wmqg3EXKdbIHTdd6pp
         EgM/pirf1Kst89PVWZexIzUcAWqlMRktJA6M5e3kjqlJG9Qh98/cWKWfwH5lkpY7X9Iw
         Tr62eDAJmKolmM0PZuPhT5XF0R3mdvcmGg9w0qyFt6Ux5sEj6xKuSv7YkINXFTukvpiA
         mdjA==
X-Gm-Message-State: AJIora+7b5ZtssTHgIeGkWrFGEzXVHvDv8B2aYsooeNS+7B2WDv+xsVs
        Xx0AcxZZ13yFSOrvj9tCoDuV2w==
X-Google-Smtp-Source: AGRyM1sdWlbCPaVwiL5pfzStXWu0cIr1reMTk3zcFDoEg0LbWe4fifB89JMFMP8qG8R5r5nNikijxA==
X-Received: by 2002:a05:600c:798:b0:3a3:f03:f80e with SMTP id z24-20020a05600c079800b003a30f03f80emr6504503wmo.33.1659204480128;
        Sat, 30 Jul 2022 11:08:00 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c0a0e00b003a31ca9dfb6sm10442420wmp.32.2022.07.30.11.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 11:07:59 -0700 (PDT)
Date:   Sat, 30 Jul 2022 21:07:58 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Do not fail if regulators are
 not found
Message-ID: <20220730180758.tzgfchqhkqldtm6b@linaro.org>
References: <20220730062834.12780-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730062834.12780-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-30 11:58:34, Manivannan Sadhasivam wrote:
> devm_regulator_get_optional() API will return -ENODEV if the regulator was
> not found. For the optional supplies CX, PX we should not fail in that case
> but rather continue. So let's catch that error and continue silently if
> those regulators are not found.
>
> The commit 3f52d118f992 ("remoteproc: qcom_q6v5_pas: Deal silently with
> optional px and cx regulators") was supposed to do the same but it missed
> the fact that devm_regulator_get_optional() API returns -ENODEV when the
> regulator was not found.
>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 3f52d118f992 ("remoteproc: qcom_q6v5_pas: Deal silently with optional px and cx regulators")
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Yep, makes sense.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 98f133f9bb60..5bf69ef53819 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -362,12 +362,24 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
>  static int adsp_init_regulator(struct qcom_adsp *adsp)
>  {
>  	adsp->cx_supply = devm_regulator_get_optional(adsp->dev, "cx");
> -	if (IS_ERR(adsp->cx_supply))
> -		return PTR_ERR(adsp->cx_supply);
> +	if (IS_ERR(adsp->cx_supply)) {
> +		/* Do not fail if the regulator is not found */

Maybe this comment is redundant.

> +		if (PTR_ERR(adsp->cx_supply) == -ENODEV)
> +			adsp->cx_supply = NULL;
> +		else
> +			return PTR_ERR(adsp->cx_supply);
> +	}
>
> -	regulator_set_load(adsp->cx_supply, 100000);
> +	if (adsp->cx_supply)
> +		regulator_set_load(adsp->cx_supply, 100000);
>
>  	adsp->px_supply = devm_regulator_get_optional(adsp->dev, "px");
> +	if (IS_ERR(adsp->px_supply)) {
> +		/* Do not fail if the regulator is not found */

Same here.

> +		if (PTR_ERR(adsp->px_supply) == -ENODEV)
> +			adsp->px_supply = NULL;
> +	}
> +
>  	return PTR_ERR_OR_ZERO(adsp->px_supply);
>  }
>
> --
> 2.25.1
>
