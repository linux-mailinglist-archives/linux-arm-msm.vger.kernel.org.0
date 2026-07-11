Return-Path: <linux-arm-msm+bounces-118461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IEQQHPFlUmpLPQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:49:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F127420AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:49:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cw6EgObb;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118461-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118461-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A3283013245
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA002E7623;
	Sat, 11 Jul 2026 15:49:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A95A13A244;
	Sat, 11 Jul 2026 15:49:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784942; cv=none; b=Km7fVqEiDXqYSl8pwWyGBfLiek7FJWl8gUgrzDFvSP7A7hOvGlVl/tR5odPMc9daVnv81dWMW8H5ptRIkx3Kc5Sq693gUTyCl09O1VfWoBMvJWc9aJgL+wOmQNjv1qLHsGFLaH/h081nkRLMK1w/gN9sXIvN6v0AjDmgEE3MHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784942; c=relaxed/simple;
	bh=KmwCPx82KOYHBGETQZ8/htKDzb6iDy048lxiArJhQNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5TzM/N4KDtHqKCXa4JzD3bERb9Skov6/S8QAhRG2EEQq2RG1MNd5aX1RVMMPZJZNILE65/ZDmEtDkBI3z07BxxEAKxVrp0VMum5xykggcGB5aBLDV4Gm+Xm+1tZaDcboWI4ItvgxgcKsacxnbzdxKuDZ39UP8iejgNMkdxDVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw6EgObb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0831F000E9;
	Sat, 11 Jul 2026 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783784940;
	bh=W/JMotw3LvtbBXA7r3zclPn97kmCOpc9B2PhvRUjNw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cw6EgObb6GO+QRTmHZ9Way21C9iMltiuc0xFt0eNBUiXoHw/SVel9mwwHOAsefYEx
	 C49U5No9VYEQJq4V81/JM8fqEhxRPTnc3qJcdSJTDZSgMNarUv7Ey9PvTuvQkvWarl
	 CP1sADS/sGG43sHS0U/owOiwirdGlTznfiy13WLu2AKmsCqE6n3qv6vNlG6YfNMR6U
	 BtUzkmIi6qCoiojc586RVoSRFPCTmGntDw7YyCFcjg6mOAaUf7VJ9vxAAu1vQWCacy
	 ry+Do2RvqxWYjZtATNaKplwgg1PwJcnIsHVIcGRZ44cMej6L0DmYpxwDW3BwolhGhP
	 sjbk4dRZtJ6lw==
Date: Sat, 11 Jul 2026 10:48:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com, stephan.gerhold@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <alJkSuke2B2SqP9e@baldur>
References: <20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118461-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5F127420AA

On Sat, Jul 11, 2026 at 09:50:17AM +0530, Vishnu Santhosh wrote:
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
> The BAM-DMUX node is placed below the modem remoteproc so that
> userspace can associate the resulting network interfaces with the
> owning remoteproc via udev/sysfs, matching how qcom_q6v5_mss.c
> already handles the equivalent node on older SoCs.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
> This depends on the "arm64: dts: qcom: Extend Shikra device tree
> with CDSP, LPAICP, MPSS remoteproc PAS and peripherals" series [1],
> which is still under review and adds the "remoteproc_mpss" node this
> series now attaches to.
> 
> The corresponding qcom_q6v5_pas.c change that makes the nested
> "qcom,bam-dmux" node actually probe is being sent separately, since
> it has no device tree dependency.
> 
> [1] https://lore.kernel.org/all/20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com/

Patch looks reasonable, if you get no other feedback, please rebase,
retest, and resubmit once the dependencies has landed.

Regards,
Bjorn

> 
> Changes in v2:
> - Move the "bam-dmux" node below the modem remoteproc
>   ("remoteproc_mpss"), instead of at the root, so that userspace can
>   associate the resulting network interfaces with the owning
>   remoteproc via udev/sysfs (Stephan)
> - Add the "shikra-dt-m1" series as a declared prerequisite, since it
>   introduces the "remoteproc_mpss" node this series now depends on
> - Link to v1: https://lore.kernel.org/r/20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 205814c4b349ae19b605688357c6bd71e1ee61e9..246ea74d1fb1e293f0428d342301886dc52cb179 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -498,6 +498,28 @@ modem_smp2p_in: slave-kernel {
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
> @@ -1864,6 +1886,23 @@ glink-edge {
>  				qcom,remote-pid = <1>;
>  				label = "mpss";
>  			};
> +
> +			bam_dmux: bam-dmux {
> +				compatible = "qcom,bam-dmux";
> +
> +				interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
> +						      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
> +				interrupt-names = "pc",
> +						  "pc-ack";
> +
> +				qcom,smem-states = <&apps_smsm 1>,
> +						   <&apps_smsm 11>;
> +				qcom,smem-state-names = "pc",
> +							"pc-ack";
> +
> +				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> +				dma-names = "tx", "rx";
> +			};
>  		};
>  
>  		remoteproc_cdsp: remoteproc@b300000 {
> @@ -1990,6 +2029,18 @@ glink-edge {
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
> base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
> prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
> prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
> prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
> prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
> prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
> prerequisite-change-id: 20260524-shikra_epss_l3-522afe4fb8f5:v3
> prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
> prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
> prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v7
> prerequisite-patch-id: aa4ff7fbddd4c8836ce69aab89f2f91430194fcf
> prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> prerequisite-change-id: 20260525-shikra-dt-m1-082dec382e7f:v5
> prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
> prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
> prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
> prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
> prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
> prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
> prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
> prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
> prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
> prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
> prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd
> 



> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

