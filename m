Return-Path: <linux-arm-msm+bounces-100780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK8DJxhgymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:35:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D248A35A5A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52346308F8FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFB33BE621;
	Mon, 30 Mar 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7j9GP3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD23B637E;
	Mon, 30 Mar 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870010; cv=none; b=OLCMQlcmuONf69s22N8XKKrOiPtPQKxQry3KVBddJAwkiMj6mHLjsd7rD2IGiGRZ5HgT0bQ45DwLbYOIwzN7U7IdYLPag9EbTNqdO31JtoVOmyU+L83j2n23vKSXA4X0AyzWO3Nt/In19gjcuq/+f7pPDTfVOx8foUgXjTUgmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870010; c=relaxed/simple;
	bh=y36sGtm1IUDYNF4bUlFgHWHswKOkPJLcGuqUNj+hXv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1N4Yz4o88lKV1qvViZmqGFv1ovIURmt9KcToR5pOdk/Nz+wcAF80IQhx6OhNtKZ4CckhdRbFXh3eHKShHknXwfSIrt1RJ5Un2q9pX0hReOSCpV/2UWu5q+kH4xDS9GEhptXSTdMTDzrhmhpf9kdEjO/9uvSd4cU0BWWNwxAeic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7j9GP3v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062CFC4CEF7;
	Mon, 30 Mar 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774870010;
	bh=y36sGtm1IUDYNF4bUlFgHWHswKOkPJLcGuqUNj+hXv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7j9GP3vOBqylqofJSJOR+h+lhnHs+az4Y0DcXnuYxqnqBGiHI4qLw6rdu4ogHquM
	 yhzpBnfib2RAHPmtbl5OkjdHu7CJGPHtcriSrw1puRVOWf2QdfaVAbJrCEzao6hPHd
	 hR0HRVvhCmIJ7UDLhohMTlqDVRZ+8i8htZVmQN0FN0C7R4Goy2G7HPutcPZNKvbhwn
	 /tY+MWWcp674nuFPVg1cu07XqvwKbnJFCrwvNRHmP+x9GLLbtYhgYtztcgfhPQbOK2
	 jn7o3rZUEMsYetcLyZXNP6G6DDhClJkxc807zj1ANsWoMg7U1MEuGJayYT/1TMpcm3
	 EwmIWHlNKrnzg==
Date: Mon, 30 Mar 2026 16:56:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: andersson@kernel.org, Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: hamoa: Fix incomplete Root Port
 property migration
Message-ID: <a7hrfxiro5s5zepr4e3hpcbqc3iehxfhg35tz4mk7ffjx4ox3v@zj5jud72564f>
References: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: D248A35A5A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:09:34AM +0800, Ziyue Zhang wrote:
> Historically, the Qualcomm PCIe controller node (Host bridge) described
> all Root Port properties, such as PHY, PERST#, and WAKE#. But to provide
> a more accurate hardware description and to support future multi-Root Port
> controllers, these properties were moved to the Root Port node in the
> devicetree bindings.
> 
> Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> initiated this transition for the Hamoa platform by moving the PHY
> property to the Root Port node in hamoa.dtsi. However, it only updated
> some platform specific DTS files for PERST# and WAKE#, leaving others in
> a "mixed" binding state.
> 
> While the PCIe controller driver supports both legacy and Root Port
> bindings, It cannot correctly handle a mix of both. In these cases, the
> driver parses the PHY from the Root Port node, but fails to find the
> PERST# property (which it then assumes is not present, as it is optional).
> Consequently, the controller probe succeeds, but PERST# remains
> uncontrolled, preventing PCIe endpoints from functioning.
> 
> So, fix the incomplete migration by moving the PERST# and WAKE# properties
> from the controller node to the Root Port node in all remaining Hamoa
> platform DTS files.
> 
> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

FWIW: Bjorn, this is an -rc candidate.

- Mani

> ---
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 16 ++++++++-----
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi          | 24 ++++++++++++-------
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 14 ++++++-----
>  .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     | 14 ++++++-----
>  .../boot/dts/qcom/x1-microsoft-denali.dtsi    |  8 ++++---
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 ++---
>  .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 14 +++++------
>  .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 ++++++-----
>  8 files changed, 64 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> index cd062f844b2d..66d566808f58 100644
> --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> @@ -1079,9 +1079,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1095,10 +1092,12 @@ &pcie4_phy {
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
> @@ -1114,6 +1113,11 @@ &pcie6a_phy {
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
> index 485dcd946757..a9c5c523575e 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -1248,15 +1248,17 @@ &mdss_dp3_phy {
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
> @@ -1265,9 +1267,6 @@ &pcie4_phy {
>  };
>  
>  &pcie5 {
> -	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&vreg_wwan>;
>  
>  	pinctrl-0 = <&pcie5_default>;
> @@ -1283,10 +1282,12 @@ &pcie5_phy {
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
> @@ -1302,6 +1303,11 @@ &pcie6a_phy {
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
> index 343844cc62f2..0d9a324cc6cc 100644
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
> index 16437139d336..b773a4976d1b 100644
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
> index 6ab595b6ea30..dd2de1f723b0 100644
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
> index bd0e3009fb41..beb1475d7fa0 100644
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
> index 763efb9e070d..23a298248a29 100644
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
> @@ -1086,6 +1081,11 @@ &pcie6a_phy {
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
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> index ab309d547ed5..500809772097 100644
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

-- 
மணிவண்ணன் சதாசிவம்

