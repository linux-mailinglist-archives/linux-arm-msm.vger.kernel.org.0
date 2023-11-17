Return-Path: <linux-arm-msm+bounces-986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD227EF3B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 14:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0BAC1C203DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 13:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7024D321BF;
	Fri, 17 Nov 2023 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0gVfD82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF1DD50
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 05:26:46 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so6093083a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700227604; x=1700832404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jawcm/PJRbzpwmFul+vZ4SNYw4Uqbd6UDmJz6wRAI2I=;
        b=W0gVfD82iCFWGvb8g88Y9/jri8SAaNSgl8C/flFm5/fnFaO0x13ccEXVTpu/k4a0V1
         MBK2PVNqcqV3Rmw45UoHRbzYwHcZpLQgE+X2D4t3vThNBaU92w63rScPVrEUETU0EXH4
         Yso9V8e5IlFCCUV80tv+sr7xl5Z8AJiB/JfBhwFRdh5VkIzZGutNQwbkPzPKTTW2dd6Q
         YmR43xaiSfM8t+8pymij8nyeWfBOg0osn493AYJhC6VsmZ1ksLebyVAxmY89XRVE1SXI
         4rwvWYvMIyfFH5SErvDbS99+BqI7Uw/N/bNdf6cA4YYu1Waii2JTpN6wM3ZpTB+kwlHD
         h0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700227604; x=1700832404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jawcm/PJRbzpwmFul+vZ4SNYw4Uqbd6UDmJz6wRAI2I=;
        b=LIWN9rW8IQRcgC4pmchKcTnELXSNUs/boNDlhcOHDfjMIEHzaVjDh0/NoHBevxeS91
         P62v+VoJhe6HoGU64RTjtc1hRmzYmme+KcLxMFyjC8U5rxDxTlpcqeliMksJw/dckMBr
         2PqXoUpHIPSdTxraVaP9hgjQ7sIYFf3buoP7jf613OPkqSZERNLsrOZTqRZMHyteJhF0
         ThapYQBocYsLdKGniRXrEvxdy29oR2IbLDOBFyb3HNu2FndcjNHDI34Q+6Ok6RodxMcH
         2luTe9ncRGbr01xXiDUQhhCQdDmxLQPX4Xc/KRDEfcjJVfOcWDff+zSGqhv+h6sIg3lT
         AnKw==
X-Gm-Message-State: AOJu0YyUDEtP6aXnsyirNTDb4wKwCE48YvxBhUYLB25eIXVBOhBymrkb
	71HTf2v1OrbyUx/1x5DFYCMS8g==
X-Google-Smtp-Source: AGHT+IFO27JBmBEWDHEzDSjUSUPSh+vclMluw29xcColu3m2JGs/Oe48OV46cEMi+ZSo5MzjtWWQWA==
X-Received: by 2002:a17:906:aece:b0:9e6:2c5a:450a with SMTP id me14-20020a170906aece00b009e62c5a450amr4580554ejb.26.1700227604645;
        Fri, 17 Nov 2023 05:26:44 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p20-20020a170906a01400b009adc77fe164sm789874ejy.66.2023.11.17.05.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 05:26:44 -0800 (PST)
Message-ID: <d8ef8fe6-2856-40fc-a95e-5bf68c0f1a8b@linaro.org>
Date: Fri, 17 Nov 2023 13:26:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: qcom: q6afe: provide fallback for digital
 codec clock
To: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 linux-arm-msm@vger.kernel.org
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
 <20231029165716.69878-3-otto.pflueger@abscue.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231029165716.69878-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Otto for the patch,

On 29/10/2023 16:57, Otto Pflüger wrote:
> When q6afe is used as a clock provider through q6afe-clocks.c, it uses
> an interface for setting clocks that is not present in older firmware
> versions. However, using Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> as the codec MCLK in the device tree can be useful on older platforms
> too. Provide a fallback that sets this clock using the old method when
> an old firmware version is detected.
> 
> MSM8916 did not need this because of a workaround that controls this
> clock directly through the GCC driver, but newer SoCs do not have this
> clock in their GCC drivers because it is meant to be controlled by the
> DSP.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 91d39f6ad0bd..f14d3b366aa4 100644
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

This redirection of clks looks totally confusing and hacky.
Why can not we do this from machine driver based something like this:

if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7)
	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_DIG_CLK, freq, 0);



--srini
> +		return ret;
> +	}
> +
>   	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
>   	cset.clk_id = clk_id;
>   	cset.clk_freq_in_hz = freq;

