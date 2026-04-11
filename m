Return-Path: <linux-arm-msm+bounces-102756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIIzDw662WnUsQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 05:03:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0FA3DE2DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 05:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0003E3083632
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 02:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2E52C029F;
	Sat, 11 Apr 2026 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCPpB576"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FC2BEC5E;
	Sat, 11 Apr 2026 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875942; cv=none; b=igYQ1mQYFUHi2ihuR/vXPtlnBcL/pEqTVIDf6UfQIU13EKkcKob2TsSpmiR0hija/fuOP0wlQ/SH7ftVtpiE1mfG6Hmf0y+cy57oQ9xMln79BMKIhlML4qoY2MQB7iSVl+6pXvYbe6CoJ0YEavuIB/1fM+MietkzEBKw840nbv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875942; c=relaxed/simple;
	bh=boPsTTHSsc+5fuT3QSJvTlUv71A1yvgY4zIh0l6UDcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bU1GGqn8In/BEtRtesHybsgdzKWDswAzWkg3cufON3rHttyVP2a4MyuzatyGZjtcBrPGQRulnCa2ezQ48IauGq5oDZdwFH22SVRA/ZB8BY/DuPZ3/yt3Hy4P/CIMU720rxprueDjzUEnaHDGPoh4XWMf+jlHWyQnu7hx1wDM+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCPpB576; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A68C19421;
	Sat, 11 Apr 2026 02:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775875941;
	bh=boPsTTHSsc+5fuT3QSJvTlUv71A1yvgY4zIh0l6UDcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCPpB576TYIP80Bm9oSGpf1VzLwBy7Se5Ewy1iZoqZuYOfrzzNOiybcKctleyDa31
	 ePnxOmTcfQt2ejRTdiufyY9cu0ZXU9gAXp9A5pZaL3HLw3s8lwUaZtVdyWPisKOyUe
	 hXhN+AIqk3zW7egCby52VHO40Bm02jaDPu0GmnZaKb9hklpEFYgUz6OIwdK/HSSSzs
	 dna4O78boeNrljdHCz9KVUdkWJg6faMy34BpeMkVDWEJAEBWN9IR5gTsBj9M2QBp+I
	 9bI0MhfnjbKsgxNQwvzGjM/q4XK2eegjpcr1NrB5yGEpst5LNSXCkkGcb3yle5+WqD
	 +Czf0dmxKsn5A==
Date: Fri, 10 Apr 2026 21:52:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <adm2oq_ozs_VUXs0@baldur>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102756-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,fa0000:email,d00000:email]
X-Rspamd-Queue-Id: BD0FA3DE2DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 

Your commit is lacking both subject prefix and commit message.

> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

v3? Where is the changelog?

>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 2852d257ac8c..3fdf8dbbde02 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -560,6 +560,13 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp {
> +	firmware-name = "qcom/glymur/soccp.mbn",
> +			"qcom/glymur/soccp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
>  			       <10 2>, /* OOB UART */
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..f7f3374a5e08 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2264,6 +2264,53 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		remoteproc_soccp: remoteproc-soccp@d00000 {

Isn't remoteproc@ sufficient?

> +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";

This binding hasn't been merged, and yet you don't mention that this
can't be merged?

> +			reg = <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "pong";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "cx",
> +					     "mx";
> +
> +			memory-region = <&soccp_mem>,
> +					<&soccpdtb_mem>;
> +
> +			qcom,smem-states = <&soccp_smp2p_out 0>,
> +					   <&soccp_smp2p_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <19>;
> +				label = "soccp";
> +
> +			};
> +		};
> +
>  		usb_hs_phy: phy@fa0000 {
>  			compatible = "qcom,glymur-m31-eusb2-phy",
>  				     "qcom,sm8750-m31-eusb2-phy";
> 
> ---
> base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> change-id: 20260403-glymur-soccp-2ca25f3b30e2
> prerequisite-message-id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
> prerequisite-patch-id: fa390011ee531589a7ad14250d158f497622efbd
> prerequisite-patch-id: 93e7fca58a5c06edefa624ec2b006dd80f4749a8
> prerequisite-patch-id: 99a3b6a7fcd061267b40097ad25f652ebe0a4c7b

Why isn't this list empty?

Regards,
Bjorn

> 
> Best regards,
> --  
> Ananthu C V <ananthu.cv@oss.qualcomm.com>
> 

