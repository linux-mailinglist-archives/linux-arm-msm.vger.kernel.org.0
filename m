Return-Path: <linux-arm-msm+bounces-36375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 845989B5D06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61541C216E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DF11E0DAC;
	Wed, 30 Oct 2024 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ44T0Of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F885931;
	Wed, 30 Oct 2024 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730273801; cv=none; b=YlmxGF73z4VndlSZYIE0MMBEh5ufUrndYjg0fuo4U46QkRjESQzZcNcieRMz+8EPtq4dNKUR/fwKbptrOK5jLRdvZ7wTW4vwnLQtFhzmGQ0SmXziDujWLGIy/DoWFt4+nozFErNahJT998DSs5PlR4n0LMrr86o9DAi6NtSGJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730273801; c=relaxed/simple;
	bh=j2+oBpfnOxfoZv3A2oAIAab8c4yY5+hmdm19bV/Pioo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lubO7PVbZILVfk9BA/EUe6V4X/ffH2nQVaRIoAwBuhjAjPkcp797MjdXeJ9TCu0Civ0F780rvCbj3TE/uvfle1+71uFJgZIzVbNN3aMBF3bH0tUm+CtPmsT003viZIy2Xd0HGTX6XwdUvfG4rws1Q4IvFjOW3EivKtYZZF6LT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ44T0Of; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63923C4CEE4;
	Wed, 30 Oct 2024 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730273799;
	bh=j2+oBpfnOxfoZv3A2oAIAab8c4yY5+hmdm19bV/Pioo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ44T0OfRUNMMz553RO/cNPlyOLavlBQMszjMUkwX6544yFSwFJz4vC6VGGC7ocZc
	 1Uw2Ag0VbiWhZd/ZIiItoCpuPR7qxjFaBVCcGauzKq9lOxWR4wM7eYtjz7W3BOHUyI
	 ytessGfyB4GbX3JI/fMNsYEL1ckIEh1D9EviCgC7ByzrhFtX9AwqvwsygNl1m3Ov5G
	 B4hPn3z03ywVd5xCuX/r5SS8emvM75BHOHbVfu/I3h4e+kv0iPeAS6ogrghIISBpgW
	 GaPNaQTIkO66LEsLyMgycbkL5wImixMOK4gIoyw8quo6RDFcZl07+X5JrJVpQu2uD7
	 XEm8ZO2qxQ2lQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t63GE-000000007b9-1i1P;
	Wed, 30 Oct 2024 08:36:59 +0100
Date: Wed, 30 Oct 2024 08:36:58 +0100
From: Johan Hovold <johan@kernel.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
Message-ID: <ZyHiGlDnC8uqk_LG@hovoldconsulting.com>
References: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v5-3-830c938437ad@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-jg-blackrock-for-upstream-v5-3-830c938437ad@oldschoolsolutions.biz>

On Wed, Oct 30, 2024 at 08:09:21AM +0100, Jens Glathe via B4 Relay wrote:

> +&pcie2a {
> +	aspm-no-l0s;

There is no such property in the binding (or driver) and L0s is disabled
for all controllers on sc8280xp.

(I think I used a property like this in an early version of the patches
that ultimately disabled L0s however).

> +	max-link-speed = <16>;

That's pretty fast. And not supported as this would indicate PCIe
Gen16...

> +
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +	vdda-supply = <&vreg_l7d>;
> +
> +	pinctrl-0 = <&pcie2a_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie2a_phy {
> +	vdda-phy-supply = <&vreg_l4d>;
> +	vdda-pll-supply = <&vreg_l6d>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	aspm-no-l0s;

As above.

> +	max-link-speed = <2>;
> +
> +	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_wlan>;
> +	vdda-supply = <&vreg_l7d>;
> +
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
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
> +		qcom,ath11k-calibration-variant = "volterra";

IIRC the other calibration variants use all upper case here. And is
Volterra sufficient? No vendor prefix or similar needed?

I think you need to get this acked by the ath11k maintainer (Kalle Valo)
first.

> +	};
> +};

> +&remoteproc_adsp {
> +	firmware-name = "qcom/sc8280xp/microsoft/blackrock/qcadsp8280.mbn";

Shouldn't these paths reflect the DMI values as on the X13s?

> +&usb_0_hsphy {
> +	vdda-pll-supply = <&vreg_l9d>;
> +	vdda-phy-supply = <&vreg_l4d>;

The binding does not include a vdda-phy supply (same for the other HS
PHYs).

Where did this come from?

> +	vdda18-supply = <&vreg_l1c>;
> +	vdda33-supply = <&vreg_l7d>;
> +
> +	status = "okay";
> +};

Johan

