Return-Path: <linux-arm-msm+bounces-118591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3wFAkm1U2oYeAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:39:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FD74537B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T1kR5k5H;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118591-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118591-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B08E43003800
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DAC2C21F2;
	Sun, 12 Jul 2026 15:39:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1ED15687D;
	Sun, 12 Jul 2026 15:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870789; cv=none; b=kuaddYzEj3be4xlQvZ0qnnJiu2J3atihgIFilO/MkjCpz23SOFCQrFolSPcloYXvTD5CjHw6Av6LDGZ1vpmE9dDntwpdxtZLwCObvHVXKh5FBoYVXAt+jb1JUDcSkubYVMVtL1otWV+8lUIRyiYtOlnuO1aKzRfihzF2EfmLCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870789; c=relaxed/simple;
	bh=EfLXGTSwDhtzB33bOgajTZ0EBGXLh4JJX1G64RQUIaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l44kkPRmaomiVp2/E76RGarcg6vkWarUy3AfQoTS+7ztjwH8ec7KKg0Rk6jID5ctkcYgr0B3aVWiUqJDI+ff3WD/0HyoPejG2l5F5O7fug2nv+aU74/v8mY3QHj9kXInRFReWnMlhmTiVqMTwm8eRsiTgKvBH2B0FnDnqHRTOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1kR5k5H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2471F000E9;
	Sun, 12 Jul 2026 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783870787;
	bh=d9w2qfNIP9ZxYDaUYu2yhjqGU+oG0vDxaqK374aXjAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1kR5k5HkIJjeoGkOP0PZv8hC07QX3+5EAXQH8dNasY9vDKh4Mukn68X5zX7CnYZy
	 jlhUZKP/uh8TIJefgxW2UXVtLBFbgYBJTCDe/UDIc9WAhB+0QYUKhIPFgmGaoinQ0B
	 33an3asTqxHnyX/5J/bdoVtOwvXuefe9Zj56cFl4b1y65CzS7OdVtHp6ZwpiUm2wht
	 Et0CmGj/0jaPKhfbKY9Oazb66LdGhLJQl/YvCKJqpuB3VL9+iTaREnsdBKXsjt2joZ
	 6KlDjAXhHRNZbwG5Zs+GmRfzUZK3pOkhikz8fkiTiJs/pXQ+2lb4TgWnR8AgVjLkM5
	 wAwF9/x71/YUQ==
Date: Sun, 12 Jul 2026 10:39:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <alOwD1G9plyy3BO4@baldur>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118591-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F9FD74537B

On Thu, Jul 09, 2026 at 09:20:11PM +0800, Shawn Guo wrote:
> Unlike the GearVM variant, Nord Embedded variant has platform resources
> (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> Linux.

We're writing DeviceTree here, our job is solely to express the hardware
and firmware interfaces using the agreed upon bindings.
As such resources are "directly controlled by the operating system" -
not "Linux".

That said, this is a good structured commit message, starting with
problem description, nicely done.

> Add a separate dtsi file extending the existing top-level
> nord.dtsi with nodes representing these peripherals as well as describing
> how they are wired up with the already defined components.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1731 +++++++++++++++++++
>  1 file changed, 1731 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
[..]
> +/ {
> +	clk_virt: interconnect-clk-virt {
> +		compatible = "qcom,nord-clk-virt";
> +		#interconnect-cells = <2>;
> +		qcom,bcm-voters = <&apps_bcm_voter>;
> +	};
> +
> +	mc_virt: interconnect-mc-virt {
> +		compatible = "qcom,nord-mc-virt";
> +		#interconnect-cells = <2>;
> +		qcom,bcm-voters = <&apps_bcm_voter>;
> +	};
> +};
> +
> +&crypto {

Just to document my concern here as well, splitting the definition of
IP-blocks like this across two separate files makes it very hard for a
human to reason about what the actual platform dtsi looks like.

If the benefit of this reuse is worth the added complexity, I'm
accepting it, but it does means that I expect that any changes to
nord.dtsi will be tested across both models!

> +	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "memory";
> +};
[..]
> +&ufs_mem_hc {
> +	reg = <0x0 0x01d44000 0x0 0x3000>,
> +	      <0x0 0x01d60000 0x0 0x15000>;
> +	reg-names = "std",
> +		    "mcq";

All other changes in this patch directly relates to resource providers,
why does the UFS controller's mmio ranges change?

> +
> +	clocks = <&negcc NE_GCC_UFS_PHY_AXI_CLK>,
> +		 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_AHB_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +		 <&tcsrcc TCSR_UFS_CLKREF_EN>,
> +		 <&negcc NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +	clock-names = "core_clk",
> +		      "bus_aggr_clk",
> +		      "iface_clk",
> +		      "core_clk_unipro",
> +		      "ref_clk",
> +		      "tx_lane0_sync_clk",
> +		      "rx_lane0_sync_clk",
> +		      "rx_lane1_sync_clk";
> +
> +	resets = <&negcc NE_GCC_UFS_PHY_BCR>;
> +	reset-names = "rst";
> +
> +	interconnects = <&aggre1_noc_tile MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +			 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +	interconnect-names = "ufs-ddr",
> +			     "cpu-ufs";
> +
> +	phys = <&ufs_mem_phy>;
> +	phy-names = "ufsphy";
> +
> +	power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
> +	operating-points-v2 = <&ufs_opp_table>;
> +	required-opps = <&rpmhpd_opp_nom>;
> +	qcom,ice = <&ice>;
> +	#reset-cells = <1>;
> +
> +	status = "disabled";
> +
> +	ufs_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <100000000>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-201500000 {
> +			opp-hz = /bits/ 64 <201500000>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <201500000>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-403000000 {
> +			opp-hz = /bits/ 64 <403000000>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <403000000>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>,
> +				 /bits/ 64 <0>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +};
> -- 
> 2.43.0
> 

