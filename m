Return-Path: <linux-arm-msm+bounces-33008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC098ED26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 12:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A478C281C54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D43614D2A7;
	Thu,  3 Oct 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aauPPTx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10713D882;
	Thu,  3 Oct 2024 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727952023; cv=none; b=tmK83ONxq1RNSOUed5EmciDgSjeeY9qWKQ+TG4At75iMT0Lq7kK7JGM6py00t8mUmkglD6Ft61n2nYSZwxdeWD/+AOJlBH9aKVSO3YSDZEnbTD2tqQ1XNMEKqG/gcw+eh3md09BOjNxJ3h9H1Ihr0/MNTrAklGu/sLYDIYVLJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727952023; c=relaxed/simple;
	bh=1xeBYKTaSGVfI0BugeSI77i/Cy6QQIpj2vwo8xpRhcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMeNG43u1KKBq7EIfo6iwWdK6pbbHUi71+bOUE1Ya+mLqBsAFGVOn20qAy4df9fIjECUKYkk/s1TMQvW6mxJ9tqU6rPuHwWzxiAgEGUQ4AdqbI8kRhVlEFk+wz+e9Mz7a/S3Dd+5CPRDFEUwilFDc8G4zDIJcIdRscDsodUL4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aauPPTx/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74AAC4CEC5;
	Thu,  3 Oct 2024 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727952022;
	bh=1xeBYKTaSGVfI0BugeSI77i/Cy6QQIpj2vwo8xpRhcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aauPPTx/+VpnYM6pN5IcofkasU95OiDIhyxRAroBOtJ6MSxq9SstvQOFV1Ig7FZ25
	 zgt4FERw9plGY35GpWabfW1UEs7vdRe/tqHMfSoRqA7YAj0To8y7pKN8hB5FVpWy7/
	 AvJRh8TZ5TqF3YqSXsjSp7XRtkLR6DCI4+g99OGyS+ZFBIjN+26+Ec7uNIzdudDMNE
	 qo6myQ1yZxWordI5uz0Lf15ivG6JwOTMx/ya0JS7m1UInBo7qAMqaklpToUBcWTdXu
	 kXMmK7mowqj80J9/6/e6Bx77G8Ib0bACHOmRMM/Gv8uAboYW1Dt6Lht+CbgWK7KQ7r
	 c/Zz6kR78bT1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1swJFv-000000003cx-33tD;
	Thu, 03 Oct 2024 12:40:23 +0200
Date: Thu, 3 Oct 2024 12:40:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <Zv50l7U_Rq91I1Dw@hovoldconsulting.com>
References: <20240930103041.49229-1-brgl@bgdev.pl>
 <20240930103041.49229-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930103041.49229-2-brgl@bgdev.pl>

On Mon, Sep 30, 2024 at 12:30:37PM +0200, Bartosz Golaszewski wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add nodes for the WCN6855 PMU, the WLAN module and relevant regulators
> and pin functions to fully describe how the wifi is actually wired on
> this platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> [Bartosz:
>   - write the commit message,
>   - rebase Konrad's commit,
>   - fix one of the supplies' name]
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

First, make sure to CC people that help review your patches.

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 110 ++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 6020582b0a59..28721570c59f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -177,6 +177,17 @@ vreg_misc_3p3: regulator-misc-3p3 {
>  		regulator-always-on;
>  	};
>  
> +	vreg_s10b: regulator-s10b {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_S10B";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

Again, this is not a fixed regulator. It's an supply from one of the
PMICs that are already described in DT.

> +
>  	vreg_wlan: regulator-wlan {
>  		compatible = "regulator-fixed";
  
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +
> +		qcom,ath11k-calibration-variant = "QC_8280XP_CRD";

Not "SC8280XP"?

> +	};
> +};
> +
>  &pmc8280c_lpg {
>  	status = "okay";
>  };
> @@ -829,6 +933,12 @@ reset-pins {
>  		};
>  	};
>  
> +	wlan_en: wlan-en-state {
> +		pins = "gpio134";
> +		function = "gpio";
> +		bias-pull-down;

We don't want a pull-down enabled on an active high enable signal.

> +	};

Please keep the nodes sorted by name.

> +
>  	nvme_reg_en: nvme-reg-en-state {
>  		pins = "gpio135";
>  		function = "gpio";

Johan

