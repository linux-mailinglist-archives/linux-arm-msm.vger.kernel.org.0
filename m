Return-Path: <linux-arm-msm+bounces-116615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qWx2MJXdSmpYIwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 00:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0C70BAA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 00:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HzgEiX44;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39263006B15
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 22:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D7334A791;
	Sun,  5 Jul 2026 22:41:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA21347521;
	Sun,  5 Jul 2026 22:41:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783291283; cv=none; b=qbfv+aIU9FLNcRa3fmC0mmwzWkrEuVR8uoQBQutICo1jzUk/oZg7ml7p9HYYuJBa9CL/HOYRCKbSYke74bQPfdaYiC9XRQvTgdxGJLS9MvHn+aqIVi/8bqTTHCW+Mv/i9IWTHlshSzmYoxYA+pYlERME27rVdwSZzeE1H4wuNe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783291283; c=relaxed/simple;
	bh=kba8kSwdTckBwN1tVe0dcvcMljaqLJccycGXKRptzqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyjJvUfabLOmB/tgrhBGQ7tjtQMP+9uwkkDfq0blqe8k9gCL4jx5FgiYeFA1Kcd6OziT6wDnF45RbRPObCIpDuUvimR00eYjwHnZR97o43go9xELQ4gJRMR6ts3GMGtvuo7TdvyO9TY10x1yjenfNVkCVbdMefHVNH3WQr2xiRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzgEiX44; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D051F000E9;
	Sun,  5 Jul 2026 22:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783291281;
	bh=11NQSXvFm50O+jiNQyv3kvtaXCMRUb1E6joMQYk9qvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HzgEiX44FIAtGxEh/18gXxfOFHeRGmLbsYpjadwumKeHp/XzRXJSNLDyYAcQ7hMkv
	 Du6rTdjulPOlbs4gnxnuX48Q3Gr6E7/TGMmxNOH3fq0vU5qZIgPDpONEel25D6DkED
	 Ny+wjcWJ+dfIM+4X7Z9wqCVajeFYLkZX621j5g4WKc8ZkvFkVYMLAWR05OW5xxj6dN
	 xZHUr1Q6tjJzjiaoFaJ84K0xPkGLzha6O7zzup/AhGQNh8YuEGSvhBLgU7BbDBG4kl
	 2n//RvjyfucAjrUngI44E+uuyJ7/9FvL16eau19BLL4OWR7plHyl5XrlVgVtt8SkcP
	 FUl7qrjHFUVww==
Date: Sun, 5 Jul 2026 17:41:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <akra6zR_Z5_D0xi8@baldur>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ananthu.cv@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116615-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18D0C70BAA6

On Fri, Jul 03, 2026 at 05:31:13AM -0700, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

This sounds like a good description of the SoCCP, excellent start of the
commit message.

> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention.

But, not only did the first sentence come to a full stop, this sentence
is also trying to describe the purpose of the SoCCP - but the scope
doesn't seem to overlap, so this seems to hint that there's more to it
than what was first established...

Please fix.

> Add PAS loader for SoCCP on Glymur DT.

And once you have established the problem description across multiple
sentences, break the paragraph to give the reader some
breathing/thinking room, before documenting the "user-visible change" of
the patch.

Regards,
Bjorn

> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e784b538f42e..328eb513140f 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -585,6 +585,13 @@ &remoteproc_cdsp {
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
> index 5f44f68efde2..bc259dfbaf0e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		remoteproc_soccp: remoteproc@d00000 {
> +			compatible = "qcom,glymur-soccp-pas";
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
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <19>;
> +				label = "soccp";
> +			};
> +		};
> +
>  		usb_hs_phy: phy@fa0000 {
>  			compatible = "qcom,glymur-m31-eusb2-phy",
>  				     "qcom,sm8750-m31-eusb2-phy";
> 
> -- 
> 2.43.0
> 

