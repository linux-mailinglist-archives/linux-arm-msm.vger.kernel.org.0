Return-Path: <linux-arm-msm+bounces-112655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0MrASh4Kmo3qAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:56:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCB670118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ud9Ei39l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112655-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112655-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DEE8302E0F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7163F3BB126;
	Thu, 11 Jun 2026 08:55:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB87036212D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:55:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168133; cv=none; b=ggDcqC1K31OKIwoFkAfcF0RohiPuzskLSr5Te+zlFrpHmn5kSvwD0bnp5/urZwwrXZZkODoF0UgjIz2+8MFe+b+JhooqHgA2CuxSKL1VVUZmbvYl49wmNrSLBEQ2ci14XvyudVADw6hplFZAMRVR9MdYvbBu9RVJ5lp7f56Nurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168133; c=relaxed/simple;
	bh=vegZTJ5stIURfgR2mKRHVprpsIn1kwMB4JrdDzxl6SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPrOzwirLxqRKhNrweW/uefoX8fu+IfdqeQVl8ssBkM/6TQCLmvRMHX3D6//M9SJVWdlUr0Fm3ywjubq1IIBOoQb6xKRM4IaDWopI7eVazHIpn1ufxhCbShqdlWN7KHo/gb64Vy+iuvEEeQ6YHULALnygFyamYve5YsEuYjrzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ud9Ei39l; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so5448125e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781168130; x=1781772930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQRiBzPaWcJR9c/ch6vou1uNViVKhmg03M5U+EBTNzY=;
        b=ud9Ei39ls/70jtAx/FgfWa+uSLkyLwoUjdTZeQDAHQNozKfn7KjBSJUKy/hOIGWthL
         ktwr7+Kc12oQtHFDDnu928b2kc6btA3D0CST43SIsns6mj8ED89sKR0fjHMwOw3yKU9X
         2JhG2uISqNJR6qKpJSO6BKZt3EW4wSbJWIB6+D15/qerlIASEvx7qi6JSqi7yMSdftrE
         3kk0kJjE4vWW7oa6C2OUwFip3jnPxrqt8aBjQVAmUGXKV4j6l5GS++Eu7Vnb2DaJdAl9
         xyV+QEnt2/FttrpgUV4zV56Fx+VWkqYaWqyQ29VAtx0dXBLKL3wIJmEYRLAQRvjDQW4Q
         jIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168130; x=1781772930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQRiBzPaWcJR9c/ch6vou1uNViVKhmg03M5U+EBTNzY=;
        b=osXloP2IdCy+dye9Xjyy4n5pLDIe/HSadz1r2v7tlFiAhpwULq4JqSg7O8SZ1v1OCZ
         naV9JIvzFigp1poCURgsK5is1MPiuBD6F4+a9OVj62Resr1YFtEg2j+wEiD/yizngPlW
         +sEUji3Q44CVXOhFbPKbfwirI8HVq7shmWDDrsHHWlSTk9TXsYOFLEX5xStMwDkr10CH
         5yrmvOUCWcGqg9LAAdYzD3UAE0ZJPJuF8h799Jtzj0kBMomLsw+L1kZpu5MPIlfnT6el
         d349Qq+xoSILKc01VsjURK+bTnGpDRi9OUjA/0mevBpsO6sS3nYHVFKYo8jvGy1tv0B+
         RUjg==
X-Forwarded-Encrypted: i=1; AFNElJ8P5Yto1oQyclaMG+QVGJbhgwI9auHDzPiwitXq4cx+Hc4GgihNICiMZYLsdcn2rScn96xynR6VNMuTpT/6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2BI2thfQbtGJprqou31Y5U6kG522mmbnJnNEhRmG8Xbh+O9z
	B2Jjtag8UDbsR1mDyZZJZF1TyyBg2SAA8s1AKfNZ6sAAnffh2jCzVp+yQ1Vk085lQZw=
X-Gm-Gg: Acq92OFu8THOyiDohzfI+kpbZK+77fuGkVgFtJahCbzWHNnVX+weNqa/iu8pS1XAOV2
	YbQoWlICKVucmYS/w4dClkM4qjNrm1pM583J+mN9+zqtzv4LIhbh2SNXsmYWWqo1ZQe2ooBNLJx
	sd7ETPPPwclyl4w3YFpoWk4r2eblYw+/Pf7QPXsCt2lb7gkxeuabM26NZbK8PhmtffL1ch56TBT
	/nYyncG7itnZsrMA90ftwjNvcQqTMSAfyGosCfshPyQbBRDAi8jnvwMuFMJNY8BfdWE79fEBu1f
	yBb9q8huQcvKr+6gfvesxRosO/HNaLC9enq/h8MBtgHoD3oKHIDZSL3dhlAPWz8sBiGD74DYlbM
	VNwYHSXLLmFiLQor5GgIbxj5yLfb2VReWeixWQLqRjG2VTYnjdbggVn9M2ZZ6KDEm/1ru0btP+0
	I0u6vuwDrWN+6aWyscmacsSNvT6SD6O6jLZtj2ehuvWbz5Tg==
X-Received: by 2002:a05:600c:354b:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-490e528451dmr17995005e9.0.1781168130047;
        Thu, 11 Jun 2026 01:55:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm47321735e9.14.2026.06.11.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:55:29 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:55:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <aip3_fyE8tMtJZIW@linaro.org>
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-112655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BFCB670118

On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
> Qualcomm Shikra SoC.
> 
> The SMSM (Shared Memory State Machine) node provides the power
> control signaling between the AP and modem for BAM-DMUX. The
> BAM DMA controller node describes the A2 modem BAM hardware as a
> standard DMA controller. The BAM-DMUX node references the DMA
> channels and the pc/pc-ack interrupt lines from the modem SMSM
> entry for power control signaling.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

I'm quite surprised to see this 15+ years(?) old hardware block being
brought back to a new SoC. Is Shikra not using IPA?

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..3e59d5f6323c0d857f376316faa26c503e67f6bc 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -17,6 +17,23 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	bam_dmux: bam-dmux {
> +		compatible = "qcom,bam-dmux";
> +
> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
> +		interrupt-names = "pc",
> +				  "pc-ack";
> +
> +		qcom,smem-states = <&apps_smsm 1>,
> +				   <&apps_smsm 11>;
> +		qcom,smem-state-names = "pc",
> +					"pc-ack";
> +
> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> +		dma-names = "tx", "rx";
> +	};

This should be a child node of the modem remoteproc. See msm8916.dtsi
for example.

> +
>  	clocks {
>  		xo_board: xo-board {
>  			compatible = "fixed-clock";
> @@ -314,6 +331,28 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
>  		};
>  	};
>  
> +	smsm {
> +		compatible = "qcom,smsm";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mboxes = <0>, <&apcs_glb 13>;
> +
> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		modem_smsm: modem@1 {
> +			reg = <1>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  
> @@ -640,6 +679,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		bam_dmux_dma: dma-controller@6044000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x0 0x06044000 0x0 0x19000>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +
> +			num-channels = <6>;
> +			qcom,num-ees = <1>;
> +			qcom,powered-remotely;
> +		};
> +
>  		sram@c11e000 {
>  			compatible = "qcom,shikra-imem", "mmio-sram";
>  			reg = <0x0 0x0c11e000 0x0 0x1000>;
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
> prerequisite-message-id: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> 

If the DT isn't merged yet, you can also just squash that into the
existing series that adds the modem remoteproc.

Thanks,
Stephan

