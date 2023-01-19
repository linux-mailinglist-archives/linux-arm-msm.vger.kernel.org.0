Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E04673B03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjASOCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjASOCZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:02:25 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A657E69E
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:02:00 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id bk15so5861581ejb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2x8S9tVFIZqDRv9aHkQ6xKCyTS3jpAIYNRHtCcpELmw=;
        b=PJhN37dt3vvxsYzj0Eg4zdSaSMqu97099U86iUJCurKx6eBfan8IS3fZiG0zE3ZsUW
         VMQGbhgeqbtfRVUTXp7RqFepqE5o1L0xd8vpdc9YZajcYqEiMN3+tJPBQM7Ussvhb8AW
         bLnMSjmvJLHQQKSuR/OOaVoq86Mu1IBCf2yPVX7Cv0c57eP4KRmsjUq0L9rZSLNzgwkL
         Kwmui1y9eZhv3kNQXXDfFV+r/8OnWAxKtT+FBr7voZg/KLXRAWqC/vLc6PPv9Rd4S17i
         WrUIikWJcFcp4haP0Qhao2VCQh5Qtp0ofPPehKsz493kPFTc6fGwAAfpscGVOH4A4Mnc
         o5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2x8S9tVFIZqDRv9aHkQ6xKCyTS3jpAIYNRHtCcpELmw=;
        b=aqWeUKFhVCpt3yPXbzS2WUlayvm752VEfs+jeXQ6WRG8SFYMAnJW1BWy9JiaRQhGBX
         mK76HlKhEYJ8wyFrF5jmhbXQBSB8NQj/ukUZzkAEbT/fvUesV0/brqD3opYBgBEhiimM
         PZY5TvFuTlpag05EfGpzac10Jwi5kfywWxEuW69NQLGuRYKiYq3e7lKsCbI4RgPQOU2f
         sNyQ98XXZJXvoq1MLEw71M+ERLOqpIGB5gPg4+Uuq3pLVbuWVLdBb/zdi0u20It3cSi1
         rPDfGpizvDAS/355ByIiVbNjIh7UB+T1Naf1D5VfNjZdkgU7QmFV6sOnqwFgG5NXeDhX
         yhIA==
X-Gm-Message-State: AFqh2kocQsm+3+gV35tQA9k05wtpBn460hQ9sGmErw3nXpSa172u//iu
        QetnXpP3wHYGFowU8zubxpqsQw==
X-Google-Smtp-Source: AMrXdXtxY4A4oBDtDd979MmrlD50V8QEnayPnQI0J2QTJ0QFspExAuwf02HDsF7SIivQLI4+nCtuxw==
X-Received: by 2002:a17:907:d15:b0:862:e612:effe with SMTP id gn21-20020a1709070d1500b00862e612effemr16052636ejc.14.1674136918662;
        Thu, 19 Jan 2023 06:01:58 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm6522221ejg.223.2023.01.19.06.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 06:01:58 -0800 (PST)
Message-ID: <efd3d3df-4d0e-8cd4-24f5-11aeb4682948@linaro.org>
Date:   Thu, 19 Jan 2023 15:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> On MSM8960 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8960 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> index c3e7ff45e52a..cb35a297afbd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> @@ -422,8 +422,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct hdmi_pll_8960 *pll;
> -	struct clk *clk;
> -	int i;
> +	int i, ret;
>  
>  	/* sanity check: */
>  	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
> @@ -443,10 +442,16 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  	pll->pdev = pdev;
>  	pll->clk_hw.init = &pll_init;
>  
> -	clk = devm_clk_register(dev, &pll->clk_hw);
> -	if (IS_ERR(clk)) {
> +	ret = devm_clk_hw_register(dev, &pll->clk_hw);
> +	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
> -		return -EINVAL;
> +		return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
> +		return ret;
>  	}
>  
>  	return 0;
