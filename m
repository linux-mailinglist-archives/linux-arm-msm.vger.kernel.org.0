Return-Path: <linux-arm-msm+bounces-71946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B97B42C45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 23:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D661890F37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 21:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF552ECD21;
	Wed,  3 Sep 2025 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OToqYEVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1E2857F2;
	Wed,  3 Sep 2025 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936591; cv=none; b=NBn6qIkfptw2RbzugMPfofYUY7QQ7iIHzB+ARtizyXCD0/fSxtCvnsNA9yyDdSArbxFbH881EeuOxHkn3H9/l7fNd9g8ljcepxznGJcmMOukkErO4udPLvJLQlX2DzaddZMvNOYuxgLlKLvLgkgtKM6GQE4dXbJzUa4H69TgNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936591; c=relaxed/simple;
	bh=ctT6dZnRlylbYGiSVZ9XDl+N3XogyE0QpPviVyqaMg8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ma7PS3dCI3bOc5o3jKsAIkB0Cc7NMP8OuEm2Xn76vQUmWAMWz9ZNyNFFSkZYpallLbNFuM0K3DEd9MLJVlsvS/mY1id3rOIw2oJ1d8+FpIj94UIEt0ux0LJdgsBUt7cknd9+7sh0lRmkwz6yejyJdgXOlIp5Y66tn6LIdY6/I00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OToqYEVE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086A3C4CEE7;
	Wed,  3 Sep 2025 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756936591;
	bh=ctT6dZnRlylbYGiSVZ9XDl+N3XogyE0QpPviVyqaMg8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OToqYEVE/2RbdOcvWmobmoZ4UP1zI5juDphhRy2oDxOmAno4pZdS3vgydx7UQVfZp
	 JlsdVIx32EjO2AMllDXZHJt8ksl/XQH0R/G3UVZJWmzHWynFCOvPHM4Xjuoi55CAtW
	 8+4G1rSmRVS3SGDwoM+2JqHoAsaX8sj5Yp9+LZExghQ6aKWbJoSsV8ioOY3uD0U8gx
	 Rd2aF7H381epW7/xYttsRlwho8Ovj5wP2Ei1ahlnfgnZz18OScypc8hz57UkhoGIjg
	 +wuVZPZavG9EN1sWzEvpCdS1rMIkiUQCB0PUPZP+RDAofxQsYtIR+ocEo5uz3/oAvA
	 3oyJOVwfvEq/A==
Date: Wed, 03 Sep 2025 16:56:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, devicetree@vger.kernel.org, 
 Sushrut Shree Trivedi <quic_sushruts@quicinc.com>, 
 Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, netdev@vger.kernel.org, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
Message-Id: <175693646048.2905776.13490150333871403109.robh@kernel.org>
Subject: Re: [PATCH v2 00/13] arm64: dts: qcom: lemans-evk: Extend board
 support for additional peripherals


On Wed, 03 Sep 2025 17:17:01 +0530, Wasim Nazir wrote:
> This series extend support for additional peripherals on the Qualcomm
> Lemans EVK board to enhance overall hardware functionality.
> 
> It includes:
>   - New peripherals like:
>     - I2C based devices like GPIO I/O expander and EEPROM.
>     - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
>       for peripheral communication.
>     - PCIe HW with required regulators and PHYs.
>     - Remoteproc subsystems for supported DSPs.
>     - Iris video codec.
>     - First USB controller in device mode.
>     - SD card support on SDHC v5.
>     - Qca8081 2.5G Ethernet PHY.
>   - Audio change [1] to support capture and playback on I2S.
> 
> Dependency:
>   - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
>     which ethernet will not work.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> ---
> Changes in v2:
> - Split the patch 3/5 in v1 into separate patch per author - Bjorn.
> - Use generic node names for expander - Krzysztof.
> - Change video firmware to 16MB comapatible - Dmitry.
> - SDHC:
>     - Arrange SDHCI-compatible alphanumerically - Dmitry.
>     - Move OPP table and power-domains to lemans.dtsi as these are
>       part of SoC.
>     - Move bus-width to board file - Dmitry.
>     - Change 'states' property to array in vreg_sdc and also re-arrange
>       the other properties.
> - Remove the redundant snps,ps-speed property from the ethernet node as
>   the MAC is actually relying on PCS auto-negotiation to set its speed
>   (via ethqos_configure_sgmii called as part of mac_link_up).
> - Refine commit text for audio patch - Bjorn.
> - Link to v1: https://lore.kernel.org/r/20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com
> 
> ---
> Krishna Kurapati (1):
>       arm64: dts: qcom: lemans-evk: Enable first USB controller in device mode
> 
> Mohammad Rafi Shaik (2):
>       arm64: dts: qcom: lemans: Add gpr node
>       arm64: dts: qcom: lemans-evk: Add sound card
> 
> Mohd Ayaan Anwar (1):
>       arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface
> 
> Monish Chunara (4):
>       dt-bindings: mmc: sdhci-msm: Document the Lemans compatible
>       arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
>       arm64: dts: qcom: lemans-evk: Add nvmem-layout for EEPROM
>       arm64: dts: qcom: lemans-evk: Enable SDHCI for SD Card
> 
> Nirmesh Kumar Singh (1):
>       arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander
> 
> Sushrut Shree Trivedi (1):
>       arm64: dts: qcom: lemans-evk: Enable PCIe support
> 
> Vikash Garodia (1):
>       arm64: dts: qcom: lemans-evk: Enable Iris video codec support
> 
> Viken Dadhaniya (1):
>       arm64: dts: qcom: lemans-evk: Enable GPI DMA and QUPv3 controllers
> 
> Wasim Nazir (1):
>       arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems
> 
>  .../devicetree/bindings/mmc/sdhci-msm.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/lemans-evk.dts            | 415 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi               | 145 +++++++
>  3 files changed, 561 insertions(+)
> ---
> base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
> change-id: 20250814-lemans-evk-bu-ec015ce4080e
> 
> Best regards,
> --
> Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 33bcf93b9a6b028758105680f8b538a31bc563cf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#






