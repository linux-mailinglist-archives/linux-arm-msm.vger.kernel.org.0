Return-Path: <linux-arm-msm+bounces-46333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E4BA20592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 09:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B633A48A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456E01DE891;
	Tue, 28 Jan 2025 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsv2se+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344B8462
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051545; cv=none; b=c/Jft+sDsNXrDRjTR8+D6FsCrO0aSV7TlInmU4L+YOV3WfKBVm+tkIYsz22Qat5/aHYZ+vw53pd1KNKXeuoOnvTQbg5+E4IFZ//V6Pa0JonsuuYqnxyI3WUhG3dr9IcZayioUFXbLpSoLfrzeX9DAYaqgMLo1uYVgC3s6rN7X3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051545; c=relaxed/simple;
	bh=Q0YF0DVZeFVEE1vVCuvD4EYSrmuqlryjxIBMgxE8T2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKb3kRSKqxv0Pbul2jlR6eX32XjnJHkxY21xjY4Q0rV0pydbxFLQgE6q08chvPJPEjfUxH2YYNwBbhSrTys6DLCYK3iOAbz8BU/Qv4MAmaPTauwThlxwCDotii+0VBwhmLlkwQH7ypq+lLwSN/w7OgZZHgMNYL6aGAsBj+4VSmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsv2se+q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436341f575fso58121615e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738051541; x=1738656341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEMfYzXmSLIgnMJtxwb+i6Gd8d/iSboKcUt4HSkm4vw=;
        b=gsv2se+qhy/112hYZDKgd5EDkOr8F4BBLakH2jhMiA6UQzjRw9XiYMrOUuUDaMQ9Y3
         RptUlttdNbH+Gg7ih/4N1XYfFNlB8aXzmBXh429dOOaMxrcGfjnBpS8qlYrlHOa6wFx1
         obS4FCUo8owNau6u/Tyog+VERxUJOv+CudOXIh/iQ83Z1iRYJS+kcnEWltSNXC8rLTG8
         PTgoBv9wMYQ/gqbjZ+N/NXwqY0dYx3FycemQrbwI0L61aWmfWqciPKNT6tGxeFJZGD3h
         VJy8k1Z9b9kdGSpTBINcYQoU2ulz+IBoajFzHcP+zWANpC3ey4hPypJpueaBeHa76/2S
         FSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051541; x=1738656341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEMfYzXmSLIgnMJtxwb+i6Gd8d/iSboKcUt4HSkm4vw=;
        b=mqm6sk7bx5OMsPY5W4sz+q2hiElF7gEqe8newFE0szPKByAEqtNBOm6Qo2Lb4pUmXr
         fCF7VspfYcmHkP2DpAlunfpmuuGQnzA6tWjyzHmSf8NpQZiSRi6Q+UhPbLXZ9V+w5e9o
         rlvizZ4CSPR4lkkoMygYBVesrVtwriMBgJuLpNbx31n9KbOfpexk6TJLeNm8cQ2XHCOX
         lmtPK9X/5N3IJRw0jjTaYwUiyG5AcoiyIf4EBitfmEV2vd+eo8v/PwbZBkmlKwcOUxYe
         hod2kLMt0ZIC8GtsX9PfnL/6pZj0ae0Gb+pjaX7H6lZd8IkSm+/CsDM3xwukJ9eFTw7J
         VYcg==
X-Forwarded-Encrypted: i=1; AJvYcCUr2oSwz3zRwWhUmd4GH7nSyzvIf4C50mFyesJ6Te0Vy85YnCDLkILeyQKns6vXHev0stGpM+ygXjBHc8Ja@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5ZPjFHG6spC9d+FPq/f+pMTWnTgEgN/2Qf5jGRl3KMC2IUv+
	/pg9yho7JryT4I1w0R9kpHeAMuOzLjb+nhR9AQckV0ylggMiDWlY+TMmNOrCivQ3sd6IauokRkS
	t
X-Gm-Gg: ASbGncv7fJlL05OshMua1FZNpZ1Yei7FaVnyA8hPO/XE1E1Pc97lGWz95bFydl+EvLe
	kFa/lT5t4yWv/MyWpeqIDMylq6ro4ccYyWsm5TpKx5VDpJ2DVx62F0dTO9H2BSqbUO/qbvbZ1JK
	fcYoXuwLupRKCLrGqPoJbLUXRTzX/dx7Gh1YKyq+hAqx/R5XB5n1ErgDw3KwsvKCuHq/WS3w9wE
	HyUgmwAlexb6RaDn5mqJ+JkAaxg2JJqyNPRJTXcFnPFVncCcqXnp+1TtQZMllOqbF3/wsxz0BUj
	k00tQalblesfOv+AwUjmaek9hFs=
X-Google-Smtp-Source: AGHT+IEUh1KxWHB9u86+B2/y74R2MigmbSK1pRU1jrbd6wN67RRwueEsOCnR5xhqWQ9cL9gUplaNNg==
X-Received: by 2002:a05:600c:8712:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-438913ce0b7mr434865235e9.7.1738051541203;
        Tue, 28 Jan 2025 00:05:41 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507fe8sm157336445e9.24.2025.01.28.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:05:40 -0800 (PST)
Date: Tue, 28 Jan 2025 09:05:38 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/13] ARM: dts: qcom: msm8226: Add modem remoteproc
 node
Message-ID: <Z5iP0nEm3P1RhLUu@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-9-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-9-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:41PM +0100, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
>  .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 82 ++++++++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
>  4 files changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
> index 7d519156d91d156d801c477711751aba66cc3224..a8543ca7b5569549418683b6be320784eba1768c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
> @@ -12,6 +12,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  /delete-node/ &smem_region;
>  
>  / {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index a15a44fc0181bf23e7531ecdc8978505ca48189d..fbd568c7d6b7415d240aa1a2329d07cf9135274c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -8,6 +8,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  /delete-node/ &smem_region;
>  
>  / {
> @@ -145,12 +147,12 @@ framebuffer@3200000 {
>  			no-map;
>  		};
>  
> -		mpss@8400000 {
> +		mpss_region: mpss@8400000 {
>  			reg = <0x08400000 0x1f00000>;
>  			no-map;
>  		};
>  
> -		mba@a300000 {
> +		mba_region: mba@a300000 {
>  			reg = <0x0a300000 0x100000>;
>  			no-map;
>  		};
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index 7e0838af6c2d0dc26e0082471b70578bc627491d..55bb070dcf489064f5b14902da1acd2762232ef9 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -213,6 +213,18 @@ smem_region: smem@3000000 {
>  			no-map;
>  		};
>  
> +		mpss_region: mpss@8000000 {
> +			reg = <0x08000000 0x5100000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
> +		mba_region: mba@d100000 {
> +			reg = <0x0d100000 0x100000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
>  		adsp_region: adsp@dc00000 {
>  			reg = <0x0dc00000 0x1900000>;
>  			no-map;
> @@ -253,6 +265,31 @@ adsp_smp2p_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-modem {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs 14>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		modem_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		modem_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	smsm {
>  		compatible = "qcom,smsm";
>  		#address-cells = <1>;
> @@ -879,6 +916,51 @@ spmi_bus: spmi@fc4cf000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> +		modem: remoteproc@fc880000 {
> +			compatible = "qcom,msm8226-mss-pil";
> +			reg = <0xfc880000 0x100>,
> +			      <0xfc820000 0x020>;
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
> +
> +			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> +				 <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				 <&xo_board>;
> +			clock-names = "iface", "bus", "mem", "xo";
> +
> +			resets = <&gcc GCC_MSS_RESTART>;
> +			reset-names = "mss_restart";
> +
> +			power-domains = <&rpmpd MSM8226_VDDCX>;
> +			power-domain-names = "cx";
> +
> +			qcom,ext-bhs-reg = <&tcsr_regs_1 0x194>;
> +			qcom,halt-regs = <&tcsr_regs_1 0x180 0x200 0x280>;
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			memory-region = <&mba_region>, <&mpss_region>;
> +
> +			status = "disabled";
> +
> +			smd-edge {
> +				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
> +
> +				mboxes = <&apcs 12>;
> +				qcom,smd-edge = <0>;
> +
> +				label = "modem";
> +			};
> +		};
> +
>  		tcsr_mutex: hwlock@fd484000 {
>  			compatible = "qcom,msm8226-tcsr-mutex", "qcom,tcsr-mutex";
>  			reg = <0xfd484000 0x1000>;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> index 3037344eb24055071cc77c9cfce0f1d0f95de921..18396623a91dd4bf4b66f01c1d983c391722f3b5 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> @@ -9,6 +9,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  /delete-node/ &smem_region;
>  
>  / {
> 
> -- 
> 2.48.1
> 

