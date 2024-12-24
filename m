Return-Path: <linux-arm-msm+bounces-43175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B19FB928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C86818850F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4284A1494A8;
	Tue, 24 Dec 2024 04:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mz1j4rWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177DA4437A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735013946; cv=none; b=IfM6xX9aafetyCuk1bMVOR0F4ffoyT9Sw47BJx8n/vV+0jwQOIkAkfod+1Ar9TH1Svr5VtvG2vO7++wxQduBhiGJH+y8kZcbeA6e/4tYQd2j+TL6NMTb8afivH9E3CZCGQKtm4db822hi/bgdK1FVV4R04OMIP8TLvFWloTAAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735013946; c=relaxed/simple;
	bh=f9lcj1SWgFQL0TxFT3cUFgka/Ea/Axw8NUPO6qrsqeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itkaA/JbnSZovmTa10kS3II+R0JFu5QUq4gYQbIUvu0uSwitR4IABynm+V+xHKZ/Zpist0IfRZr8wYjjWQ5qSLZ+08DvrEUxLIoXlNsJ/i2dtLKa/Z4tqXoXYbFUGfHhbt1pH51zA/4cdWy81OZGIIxUlVJRewhQUVQ6CwD4N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mz1j4rWj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3003943288bso53162601fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735013942; x=1735618742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=;
        b=Mz1j4rWjidP8sib65C8WZnex2R+51LO0WqfF2jbAogUYIRVwoLUetMiWgwLcTSjRYp
         N9+qIVulPXxW/KKazhnModGUN9+bQwJ8ltyiDxbn3PuPNlG++RH2g1ew7uLXHK7RVyAb
         4Rd0+4aKfsYwENgWLeNV46/N1pdywCTKha09EkWTFH/XPLsdmsAsv9Mo82szq+F2aVGD
         v7H8nxg0oqAtz5BSh1eDBkW/VBZQ/y/tjPKJUFfTvtZ05d2DtpPTssBs4Wcex4zoOmXN
         OLH4soJxlhrawpK9TKt0RZCFjEtRpyEkzr9LQzTo7OyrPN1JiKyTnF1cT9ukVeVa9hiO
         sfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735013942; x=1735618742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=;
        b=jcaRhz8JzwRxXtcS7JtCZq2gXMnMZodGEzBJY8CYAPUkTUOjOiNTEGxgcNmdybidMJ
         EBBU0UwbcsT6IZc3uA0sLUZSs/IVILJRf5uKERZjYPzoOWLPAf+t2rfK0miuDEMgslNZ
         M1mFctNk7AqR1ZAWdkWmBYpjHjDXPLdrp3TnXaBFH14Xgq4Y0KHyzo4y5X8qkKMC3WmW
         s1+S88Un773RUC/DRTmO80tglX4GlSs04x+/7i1KzCbelh/AHkuHxZOlm0tRCxYQpCvo
         Rplsl5sdAa8PxWzCT0UQBvpjD20YOQfTj50dr9rRo3i8KIUFmAyi0PVT+piulwpczmY1
         ZJzw==
X-Forwarded-Encrypted: i=1; AJvYcCXDuRQGwiudyoKHXSpcInenYxkwkLyIXL789pDYXefaVhlfCt5Fmcbtl5efwwtOCl64YavL+8nALuXDBXbs@vger.kernel.org
X-Gm-Message-State: AOJu0YzHUv0ZuVyj5wkfnx+TDChl4g2r59kRk2oA5u2jx0n2LWgxOMmk
	Q75uTxN0WOJVUGY5xXhobCyfAOmU/ppCEhiNF8teuVUeOz9W/51zyeHtXtjjJLg=
X-Gm-Gg: ASbGncvNr08m8V4U8qyw2R7dotpGYCrMkHo3Fhbd/9jQGS9f9WPyicEfTptsi9GZLJ+
	nOsGaVPPxrRXenWVPJEfmsAECUhTjGB3MAJSNKApJhj+/OQxthc1qdgDqGcI17+pU1PdANEQhgI
	xpChABMMg+9ZDFFh4A+SRNoepA+JY57o4gsTlNipD87GwxXNNicKBzSvRLzrk7nlGEr9/i7aMzb
	aVNbTUZXMRFZPpO/WfSvhc/Fhn73jocdFTIucfSkYUaO0LEMr7s9QNsin38BmhQE4vOh7iY353n
	wcPF82VjCx1tZeBz3fxC1zMT1Qzs80+Ak1/8
X-Google-Smtp-Source: AGHT+IENMWxXPIOYhp6GLi6KEvU2mAH3sEt8lO8Lah7Hkc79/YZpEbN2wsmvfsGNSMcgutuOQc9tKg==
X-Received: by 2002:a05:6512:1041:b0:540:1dac:c03d with SMTP id 2adb3069b0e04-54229586ef3mr4768804e87.57.1735013942241;
        Mon, 23 Dec 2024 20:19:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5fa8sm1496276e87.46.2024.12.23.20.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:19:00 -0800 (PST)
Date: Tue, 24 Dec 2024 06:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos: add support for
 EMAC on qcs615 platforms
Message-ID: <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-schema-v2-3-000ea9044c49@quicinc.com>

On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
> qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
> compatible.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
>  	.has_emac_ge_3 = false,
>  };
>  
> +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
> +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
> +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },

lowercase the hex, please.

> +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
> +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
> +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
> +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
> +};
> +
> +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
> +	.por = emac_v2_3_1_por,
> +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
> +	.rgmii_config_loopback_en = true,
> +	.has_emac_ge_3 = false,
> +};

Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
corrected to use qcom,qcs404-ethqos as as fallback entry, making this
patch unused. Please correct the bindings instead.

> +
>  static const struct ethqos_emac_por emac_v3_0_0_por[] = {
>  	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
>  	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
> @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qcom_ethqos_match[] = {
>  	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
>  	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
>  	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
>  	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

