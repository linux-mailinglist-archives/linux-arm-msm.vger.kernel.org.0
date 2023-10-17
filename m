Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373CE7CC3FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 15:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbjJQNIW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 09:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbjJQNIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 09:08:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFFFB0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 06:08:19 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405497850dbso54823415e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697548098; x=1698152898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZoA1Ego1HM4HIX412AargOJWZVAL/5W3iCMJBbaTKc=;
        b=HI5kj0gco6dmtnXsnYRqsOcGZl/Vo2AStr8hcdhqFWx1JILWA8xypALTkjX3kNpXcD
         8fwPJV3r46QbQtmc0Drk573maKxMxoFaK550kQab29rmAEE1Sj6LtSWWd5jEmf3UWp0w
         Dq1rF9BgoHWVNzq5TQ1aoERgDuMgLTI6lEAd8RSVOevk4qO+Llb+WpBWmbFdPsrqx981
         W1DRNdfVvxISogSSeC+B/NCfeWZtgI1V0gqdFgdx8Bwaoa5r+uwW+VkfhtQQRRN4Z8vp
         H/XpbI1UVSSlWYC+h2MjwkBS3aBvz/+2ItgXE7L9Uj7O0J9hWLO1PisgwrgLibDj7wD+
         4tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548098; x=1698152898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZoA1Ego1HM4HIX412AargOJWZVAL/5W3iCMJBbaTKc=;
        b=uedHeMl0P+3g1bP6+1Y7SmapiBubgXFH3pN5KVltq/JHMOuIPnGTtnu8QO1VF+WhOw
         WHqKqeHC32AQUA+17KC1WeSjefs45YFjC63Nkn7nvLoQJRG01frbjEOC6+2s/N8ygmyx
         Ms+CJd0dkheBSDHc7eHFqSOxn8owWdB2Em9ETnzCBLc0MFjpjwQZeIdXjGAzscoNIem6
         5svRFDEtjyuJrIUz+rzuEtKLjlHJlzheXFlxFqz0R138CLVr9rDexVVbLLy0QmdHO3Yq
         xygecKK3sFPYtFoOF6g5J9aVnIZ8fX/aV8puMwCcMH/Q1loNfUawvec52TFXM3tymSIR
         0SvA==
X-Gm-Message-State: AOJu0Yx6jhRskiHfxsN1Qn32NUB0V0kMpqCfpV3wkJ2P6e/PGIhBLoj7
        O9D2cHtkeBfkmUPbQ+ZTucb7sY+ViZNVVBy7Kds=
X-Google-Smtp-Source: AGHT+IHQQcRJ2l2z5ACeKhLx0EU5+tkVqbX7z2FlB8ExzyQZVxwqvYP3UbLI5+TaHSg9F2rN0eHPvw==
X-Received: by 2002:a05:600c:1906:b0:401:aa8f:7562 with SMTP id j6-20020a05600c190600b00401aa8f7562mr1731260wmq.11.1697548098235;
        Tue, 17 Oct 2023 06:08:18 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id v20-20020a05600c429400b00402d34ea099sm9718777wmc.29.2023.10.17.06.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:08:17 -0700 (PDT)
Message-ID: <7aca4eff-edb9-2ae5-1146-68e4530f76be@linaro.org>
Date:   Tue, 17 Oct 2023 14:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] ASoC: qcom: q6afe: check ADSP version when setting
 clocks
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org
Cc:     Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-3-otto.pflueger@abscue.de>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231014172624.75301-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Otto for the patch,
some comments below

On 14/10/2023 18:26, Otto Pflüger wrote:
> There are two APIs for setting clocks: the old one that uses
> AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG and AFE_PARAM_ID_LPAIF_CLK_CONFIG,
> and the new one which uses AFE_PARAM_ID_CLOCK_SET.
> 
> ADSP firmware version 2.6 only provides the old API, while newer
> firmware versions only provide the new API.
> 
> Implement LPAIF_BIT_CLK and LPAIF_DIG_CLK for both APIs so that users
> don't have to care about the firmware version. Also fall back to
> setting AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG in q6afe_set_lpass_clock
> when setting the new Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> clock is requested to allow specifying it in the device tree on older
> platforms too.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 81 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 91d39f6ad0bd..87bdf741e5f6 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
>   	struct q6afe *afe = dev_get_drvdata(dev->parent);
>   	struct afe_clk_set cset = {0,};
>   
> +	/*
> +	 * v2 clocks specified in the device tree may not be supported by the
> +	 * firmware. If this is the digital codec core clock, fall back to the
> +	 * old method for setting it.
> +	 */
> +	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
> +		struct q6afe_port *port;
> +		struct afe_digital_clk_cfg dcfg = {0,};
> +		int ret;
> +
> +		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
> +			return -EINVAL;
> +

<---
> +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
> +		if (IS_ERR(port))
> +			return PTR_ERR(port);
> +
> +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
> +		dcfg.clk_val = freq;
> +		dcfg.clk_root = 5;
> +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
> +
> +		q6afe_port_put(port);
--->

Could you pl explain what are we doing in this snippet?

Isn't this what is exactly done in q6afe_mi2s_set_sysclk(LPAIF_DIG_CLK...)




> +		return ret;
> +	}
> +
>   	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
>   	cset.clk_id = clk_id;
>   	cset.clk_freq_in_hz = freq;
> @@ -1124,6 +1150,41 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
>   }
>   EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
>   
...

>   int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   			  int clk_src, int clk_root,
>   			  unsigned int freq, int dir)
> @@ -1133,6 +1194,26 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   	struct afe_digital_clk_cfg dcfg = {0,};
>   	int ret;
>   
> +	if (q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7) {
> +		/* Always use the new clock API on newer platforms. */
> +		switch (clk_id) {
> +		case LPAIF_DIG_CLK:
> +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
> +			break;
> +		case LPAIF_BIT_CLK:
> +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +			clk_id = q6afe_get_v2_bit_clk_id(port);
> +			if (clk_id < 0)
> +				return clk_id;
> +			break;
> +		default:
> +			break;
> +		}
> +	}

This should be probably done in machine driver or q6afe-dai, not in q6afe.


> +
>   	switch (clk_id) {
>   	case LPAIF_DIG_CLK:
>   		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
