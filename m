Return-Path: <linux-arm-msm+bounces-97587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E7QOTw/tGlljgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:45:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64776287578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D83763040F82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E4D3C9429;
	Fri, 13 Mar 2026 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbbhXAVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CDD3C873D;
	Fri, 13 Mar 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420344; cv=none; b=WKaf2M3nofJw8JmYhRZg9/B/xRwW9hYlFSmgOwkzkegqDFHVtEBwP0YdTn8L9DLn4hzgr43DrssiyfYSUyT38PpoDgWgTerX7k3vsB6t/KNvrWgwt5We5LexXLOUbCNIe4gJxZmX3+9+8e4pp83/UDEKSnfNkdQbNoLtTcoYl2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420344; c=relaxed/simple;
	bh=1LTeShBu2Hbkjqj4DrZERK+ZoyJpXlXoHJeuBDKwFoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sFpz7/F581Q3p5O4IX9mizvUH0oWDWqrdMvbkRxoHbIJi86jVmFTtWOA5RLdv8O7KmI/9zmOy73XtIIuu3wfwFH3wwj6BF6KfpEOOCQF+0uaNdPffmgws8swO3eV4D0If6rfTPRx1Tuj9opCJn2ET4uX2rxDGr8ike4Zt193hdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbbhXAVN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946CBC19421;
	Fri, 13 Mar 2026 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773420343;
	bh=1LTeShBu2Hbkjqj4DrZERK+ZoyJpXlXoHJeuBDKwFoI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qbbhXAVN4774kGxV+wQMPrx7BLfVNIl1k3cP7gytGjGnzc2xPx9tKOv96sdWRpwF1
	 h7gQqX2tJ+ZLs5ydcaJTHDnJF1XvYj/yBp47qeFWrDoKxG++wyyza6EDvH8+tEuSab
	 i1jRHqSy86s0Fj0cLXeGJJT6Vj7x/YgJ782xj1kvIJZhonphxuUHlziqFeRJ9X9a1S
	 eabTHixtu+c2U6zz99P+wwQ0h90gssiskC3tlKmWax7gUd6OVBEyQYzncswrxYrbaf
	 nio9o5LHzak3oOLacN9zG8dUj/xHL2cxA0h9k6bt/LnSlWJhL4luXz00fGfvMTS/0z
	 bNQpsiHqUgJzg==
Date: Fri, 13 Mar 2026 11:45:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
	kw@linux.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	qiang.yu@oss.qualcomm.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
Message-ID: <20260313164542.GA1405513@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 64776287578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> convert all Hamoa‑based platforms to the new method of defining PERST and
> Wake GPIOs in the PCIe root port nodes.
> 
> Without the change PCIe probe will fail. The probe failure happens because
> the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> to the port nodes.
> 
> This fixes probe failures seen on the following platforms:
>  - x1-hp-omnibook-x14
>  - x1-microsoft-denali
>  - x1e80100-lenovo-yoga-slim7x
>  - x1e80100-medion-sprchrgd-14-s1
>  - x1p42100-lenovo-thinkbook-16
>  - x1-asus-zenbook-a14
>  - x1-crd
>  - x1-dell-thena
> 
> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")

Are you saying that DTs in the field broke because of some kernel
change?  That's not supposed to happen.  Even though PHY, PERST, and
Wake GPIOs should be described in Root Port nodes instead of the Root
Complex node in *future* DTs, the kernel is still supposed to accept
the old style with them described in the Root Complex node.

If that's the case, the Fixes tag should refer to the driver change
that caused probe to fail with old DTs, and the fix is a driver change
to accept both the old style and the new style.

We can't expect users in the field to update their DTs to match a new
kernel.

Nit: Use PCIe spec nomenclature, e.g., "PERST#" and "WAKE#" in subject
and commit logs.

> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 16 ++++++++-----
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi          | 24 ++++++++++++-------
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 14 ++++++-----
>  .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     | 14 ++++++-----
>  .../boot/dts/qcom/x1-microsoft-denali.dtsi    |  8 ++++---
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 ++---
>  .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 15 ++++++------
>  .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 ++++++-----
>  8 files changed, 65 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> index 8e5c5575a532..0a382cc9e643 100644
> --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> @@ -1032,9 +1032,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1048,10 +1045,12 @@ &pcie4_phy {
>  	status = "okay";
>  };
>  
> -&pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +&pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +};
>  
> +&pcie6a {
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-0 = <&pcie6a_default>;
> @@ -1067,6 +1066,11 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pm8550_gpios {
>  	rtmr0_default: rtmr0-reset-n-active-state {
>  		pins = "gpio10";
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index ded96fb43489..2fbf9ec66fb8 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -1216,15 +1216,17 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
>  	status = "okay";
>  };
>  
> +&pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie4_phy {
>  	vdda-phy-supply = <&vreg_l3i_0p8>;
>  	vdda-pll-supply = <&vreg_l3e_1p2>;
> @@ -1233,9 +1235,6 @@ &pcie4_phy {
>  };
>  
>  &pcie5 {
> -	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_wwan>;
>  
>  	pinctrl-0 = <&pcie5_default>;
> @@ -1251,10 +1250,12 @@ &pcie5_phy {
>  	status = "okay";
>  };
>  
> -&pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +&pcie5_port0 {
> +	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +};
>  
> +&pcie6a {
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-names = "default";
> @@ -1270,6 +1271,11 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pm8550_gpios {
>  	kypd_vol_up_n: kypd-vol-up-n-state {
>  		pins = "gpio6";
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> index bf04a12b16bc..217ca8c7d81d 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -1081,9 +1081,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1098,6 +1095,9 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> @@ -1115,9 +1115,6 @@ wifi@0 {
>  };
>  
>  &pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-0 = <&pcie6a_default>;
> @@ -1126,6 +1123,11 @@ &pcie6a {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie6a_phy {
>  	vdda-phy-supply = <&vreg_l1d_0p8>;
>  	vdda-pll-supply = <&vreg_l2j_1p2>;
> diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> index a4075434162a..41063948c583 100644
> --- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> @@ -1065,9 +1065,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1082,6 +1079,9 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> @@ -1099,9 +1099,6 @@ wifi@0 {
>  };
>  
>  &pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-0 = <&pcie6a_default>;
> @@ -1110,6 +1107,11 @@ &pcie6a {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie6a_phy {
>  	vdda-phy-supply = <&vreg_l1d_0p8>;
>  	vdda-pll-supply = <&vreg_l2j_1p2>;
> diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> index d77be02848b5..ba6b7b5a9191 100644
> --- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> @@ -964,9 +964,6 @@ wifi@0 {
>  };
>  
>  &pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-0 = <&pcie6a_default>;
> @@ -982,6 +979,11 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pm8550_gpios {
>  	rtmr0_default: rtmr0-reset-n-active-state {
>  		pins = "gpio10";
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index d6472e5a3f9f..d7938d349205 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -1126,9 +1126,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1143,6 +1140,9 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> index 20a33e6f27ee..3af7f19224ad 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> @@ -1033,9 +1033,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1050,6 +1047,8 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> @@ -1067,10 +1066,6 @@ wifi@0 {
>  };
>  
>  &pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-0 = <&pcie6a_default>;
> @@ -1086,6 +1081,12 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
> +
>  &pm8550_gpios {
>  	rtmr0_default: rtmr0-reset-n-active-state {
>  		pins = "gpio10";
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> index 1e5eb8c5dc98..06747b54a38e 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> @@ -1131,9 +1131,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1148,6 +1145,9 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> @@ -1165,9 +1165,6 @@ wifi@0 {
>  };
>  
>  &pcie6a {
> -	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  
>  	pinctrl-0 = <&pcie6a_default>;
> @@ -1183,6 +1180,11 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pcie6a_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pm8550_pwm {
>  	status = "okay";
>  };
> -- 
> 2.43.0
> 

