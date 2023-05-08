Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F6A6FA0FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 09:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbjEHH1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 03:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjEHH1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 03:27:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC611273F
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 00:27:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f13a72ff53so4607622e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683530867; x=1686122867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWIT3tKT1sQBbkQMfM8DlJGawqUZsqkYk/H8oimS2uc=;
        b=WUiXaHTJ4F0b6KpaDCEbx7fnAGN2W4vLxeyUiU5Emt4RjGYUNMjnlmdrXW7Al/Ovf/
         fdbEHz2c8GuktB5IVl+guXMq9rWllYjBebZE65FbQRbUzXPmZgU0dEKu6e9QGnYYpK/N
         KmjNNGnDrP72roLWCoxsCGxCRpZ306saumW//AkJncAXQv6nbfH1PlBDADb+BCtjii/A
         Ty673Wh0qZXSSGdgAEcnapBL5MtPBsVOOkeQhEAKPpkLtjctYDKYpEh6bR5Xx/rTHTG9
         ttHDG5u02tQW3K2NpKaqsm3n91a6YXJxcV8yWtRgfC7tz2+tz28uw3IgnFJtLLOWqqKE
         k8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683530867; x=1686122867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWIT3tKT1sQBbkQMfM8DlJGawqUZsqkYk/H8oimS2uc=;
        b=G2uOg4ykv8tLpL4abxSePwoqqjYUzE9JBs4m2M3q515y30ZJGQlYvuuMRGtT+AT8gZ
         0k6D1nv5fsoHezdwyziIDxm660RAPKJToAh2GMlxErWznBU7CBurVovE7EPojs+UDmb0
         USzLz0BTpXfefBALaP0Y91jvmymlSnoOviUv26nzEvOcnZ8iQER4g/eg+xSSjLNjSqkr
         8A52h4wQ532tsTrgkRFAcm/aXf9DBFXx869otUtq0o0NnM7AfoqCIQ9pmte6JmEglNgt
         rMuSBPN9uSRIjqvxzgbS9VdZ9eYLzis0fOIyinJNF+eVfqgPfVMY5Q+i7KQrAzNbJJr9
         ZVng==
X-Gm-Message-State: AC+VfDySBsfIWzy4CKJbDwjDT+J1VpPTN4dkvWUx9VIo8XYKvN1xPpp4
        VRVhCzGHq8aLJfPgs7tVWvUa+w==
X-Google-Smtp-Source: ACHHUZ4PSH1A7Sehd9IVsIjG4ut3ss+fHSiFGlVQHCw+aKxVEbjaQBRnyh9lrMih5EfpeQsqh8d3lQ==
X-Received: by 2002:a05:6512:49b:b0:4ec:8524:65a4 with SMTP id v27-20020a056512049b00b004ec852465a4mr2425525lfq.55.1683530867153;
        Mon, 08 May 2023 00:27:47 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n18-20020a195512000000b004cb23904bd9sm1216133lfe.144.2023.05.08.00.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:27:46 -0700 (PDT)
Message-ID: <f8347dc4-f48f-be87-ba12-dd2ca97df6d8@linaro.org>
Date:   Mon, 8 May 2023 09:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/6] soc: qcom: ocmem: Use dev_err_probe where appropriate
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-2-3e24e2724f01@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-2-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 11:12, Luca Weiss wrote:
> Use dev_err_probe in the driver probe function where useful, to simplify
> getting PTR_ERR and to ensure the underlying errors are included in the
> error message.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/ocmem.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index c3e78411c637..a11a955a1327 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -317,18 +317,13 @@ static int ocmem_dev_probe(struct platform_device *pdev)
>  	ocmem->config = device_get_match_data(dev);
>  
>  	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(ocmem_clks), ocmem_clks);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Unable to get clocks\n");
> -
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to get clocks\n");
>  
>  	ocmem->mmio = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> -	if (IS_ERR(ocmem->mmio)) {
> -		dev_err(&pdev->dev, "Failed to ioremap ocmem_ctrl resource\n");
> -		return PTR_ERR(ocmem->mmio);
> -	}
> +	if (IS_ERR(ocmem->mmio))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ocmem->mmio),
> +				     "Failed to ioremap ocmem_ctrl resource\n");
>  
>  	ocmem->memory = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>  						     "mem");
> @@ -341,16 +336,14 @@ static int ocmem_dev_probe(struct platform_device *pdev)
>  	WARN_ON(clk_set_rate(ocmem_clks[OCMEM_CLK_CORE_IDX].clk, 1000) < 0);
>  
>  	ret = clk_bulk_prepare_enable(ARRAY_SIZE(ocmem_clks), ocmem_clks);
> -	if (ret) {
> -		dev_info(ocmem->dev, "Failed to enable clocks\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(ocmem->dev, ret, "Failed to enable clocks\n");
>  
>  	if (qcom_scm_restore_sec_cfg_available()) {
>  		dev_dbg(dev, "configuring scm\n");
>  		ret = qcom_scm_restore_sec_cfg(QCOM_SCM_OCMEM_DEV_ID, 0);
>  		if (ret) {
> -			dev_err(dev, "Could not enable secure configuration\n");
> +			dev_err_probe(dev, ret, "Could not enable secure configuration\n");
>  			goto err_clk_disable;
>  		}
>  	}
> 
