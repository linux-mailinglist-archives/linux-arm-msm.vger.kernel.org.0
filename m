Return-Path: <linux-arm-msm+bounces-71422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F83B3EBE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9F0C4E30BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F17A2DF15E;
	Mon,  1 Sep 2025 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exO2Wsdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C213E02A;
	Mon,  1 Sep 2025 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742823; cv=none; b=eK/yLEEMJstj0tdU6oFx74f+Dn+JY5DA3zWDBamyCj3BAPyr3SfKBtfSq2NzJ1KfblyS2ocPDg9jfSf3Jtyfhq9OmkOE6pF9sMqTiQbHYB1oy0ElmDJ9Ojx4Hpzl956saJ6yLWdwr2qLiHFOyDZx+5mm6pii2C0us1+kw1nTlhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742823; c=relaxed/simple;
	bh=1n8bL3qjuAF4p+1koFRifHNBeybfCeqhb3xbbjrMBGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNqAiiZNNf/Ijy1OwjB8OqOqJSgCXZTH96U4C2RoYOaMgAd+rWUi4HtCItAgvDJCh4kUhH8ZR1jIjF89A6q4RmGTH6jgV5E6AItaSWjhTrrW3onxcjK9H0K9Ige8bk9EYA+JpcTHPsyNYs59hVxrU/FrH8J6hVunXLzgC41Ozbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exO2Wsdd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D78C4CEF0;
	Mon,  1 Sep 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756742822;
	bh=1n8bL3qjuAF4p+1koFRifHNBeybfCeqhb3xbbjrMBGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exO2WsddNgSx8isiIJdfX8l1xUcTKuPRE0G3bM1n9AgVcrKWDK1qXqrvx1lTWVPjD
	 ixZLeIda06WleCny4w4eW408eHvqyljwcYsY88AigjimKwpAuwvFx/ifnJQBrwRlEc
	 FShtGozwtJ2Xri8AsPQu6xJjjGGiLiL5M+lUxLgtz+d6inpDSmWqXKE4yR5pct7L3O
	 d/+qU/J7VCsaLquQ/b8HM5tcaCZV6HtVbBMqkau+y12AykQDZFqf5XCfqImS8XEdmq
	 TT/BTk3jewNKN1eBFCCs98xUWFuTfYOXYQTmIDlu35CX9/90IJBTGE7jSZ+zjLOKmb
	 rDBL23IJn20xQ==
Date: Mon, 1 Sep 2025 11:06:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add support for emergency
 download mode
Message-ID: <vzxop3tp6zjql23juykhnyf6fq6df45ikppw7jwp3oktfrymvg@iys54hjpk65p>
References: <20250828-ipq5424-edl-v1-1-d6a403800023@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-ipq5424-edl-v1-1-d6a403800023@oss.qualcomm.com>

On Thu, Aug 28, 2025 at 01:25:31PM +0530, Kathiravan Thirumoorthy wrote:
> Enable support for the vendor-specific SYSTEM_RESET2 reset in PSCI reboot
> modes. Using "edl" as the reboot mode will reboot the device into emergency
> download mode, allowing image loading via the USB interface at the Primary
> Boot Loader (PBL) stage.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Depends-on:
> https://lore.kernel.org/linux-arm-msm/20250815-arm-psci-system_reset2-vendor-reboots-v14-10-37d29f59ac9a@oss.qualcomm.com/

This hasn't been merged, so there's not much I can do with this patch.
Please resubmit once the dependencies are in linux-next.

Thank you,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 738618551203b9fb58ee3d6f7b7a46b38eea4bf4..b47b0be41a61438c922b1e29d9a2ebc37fca2d70 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -108,6 +108,12 @@ &pcie3_phy {
>  	status = "okay";
>  };
>  
> +&psci {
> +	reboot-mode {
> +		mode-edl = <0 0x1>;
> +	};
> +};
> +
>  &qusb_phy_0 {
>  	vdd-supply = <&vreg_misc_0p925>;
>  	vdda-pll-supply = <&vreg_misc_1p8>;
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 67877fbbdf3a0dcb587e696ed4241f1075000366..8f2ee755d2cc406374faf9e76b0d409d159a7b12 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -184,7 +184,7 @@ pmu-dsu {
>  		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
>  	};
>  
> -	psci {
> +	psci: psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
>  	};
> 
> ---
> base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
> change-id: 20250828-ipq5424-edl-8c826a2af996
> prerequisite-change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf:v14
> prerequisite-patch-id: 38f76a48b6b824f3fa8d8cbc05ae76b43ce79556
> prerequisite-patch-id: ae7ae183210708f64fb3ff4f097de3c8af31680a
> prerequisite-patch-id: 5ba323084ac74aa744696b54ff0c17d34e26b7de
> prerequisite-patch-id: 3a2cedabc1bff24067dc224b2c077373c08b39a0
> prerequisite-patch-id: e30b97929026120277585907cde2dc000a25a621
> prerequisite-patch-id: e3ff400e6c72e835612b733b5573b01b045e7336
> prerequisite-patch-id: 50e081a2a21166aee74af428934bc3b52d3cf43b
> prerequisite-patch-id: a0148031385883a309dc165fac299d3eb5d4bcd4
> prerequisite-patch-id: 3c0f5c0e93261f6dab1d9e7293a1a28ef64e2a66
> prerequisite-patch-id: bb68380b11f9e868eacb0db9f97cc5f3ae8aa29a
> 
> Best regards,
> -- 
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

