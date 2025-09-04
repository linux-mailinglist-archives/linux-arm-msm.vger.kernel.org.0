Return-Path: <linux-arm-msm+bounces-72066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 099FBB43E65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 949251C27265
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA913019B3;
	Thu,  4 Sep 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbCncYCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA2D2FFDFC;
	Thu,  4 Sep 2025 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995432; cv=none; b=kM9Q6dVNLJy+KZVXfK0wE28kGV6gnCiiVZ29fdPm2f93hE9b3BnjqzRFec03rB1z68b/1FF63YtZ2/aPyOWNJLgQoDmTCDlyILgMeWZSteCw5ePHRr8MkMfwvsd5QBAI+AkPc6E+p5I1GdZCdy1CyCXZucTDiCzlrdZZA1rb2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995432; c=relaxed/simple;
	bh=aCmXLdx4Hc9zvhSv2FDrd3wLpy0XzPSSkGZRGeb2boA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BXLmUhNlDzOMsNcBBODJim8DqfFtVR88p4AsNorhxCriMOU0JijRprKGsixMuxlNhQPyTD06UwssMLCAMN0SPIel6Q/oaRArH6PKC1QJhnpuAkjxWPJ4lvunuy1WLWTZTpL9mDmtJH3y64e5u5Uqw/KXFFxboqX6/InQMSzDXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbCncYCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBE4C4CEF7;
	Thu,  4 Sep 2025 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995431;
	bh=aCmXLdx4Hc9zvhSv2FDrd3wLpy0XzPSSkGZRGeb2boA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fbCncYCuH+feAgyp4klVWcJckxsLV2tqtxLoEET1EwSHZnewjEFQ3IPZPVDHITnNh
	 rLlu1HZcNBzAZIXOLkyL4x/dNA1MDOupa6hkIuixJdsDhyzPCyBdWmLNNmtfWMpKiG
	 YGR+2N9Q3X/PxPT+0yu5kz+8Oc+0+23YR9gRDiJ90z8HecJK9utEyas9NOK1XyoL84
	 Xsi8IEnnM1lGmBF/6IglpDrlHhh7NMu9W9wTtwFHwcXBqfZCmwVp3cJzck606ry2y1
	 Swdvkhf7DSTmJNJtx3c01hvfCHRR7VjwS1OnLeXzJMqyaJaMo+AjGfzT6rSI3lWBLT
	 t+ATTyJOVVXlA==
Date: Thu, 04 Sep 2025 09:17:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
Message-Id: <175699523750.4060076.15321819933844414302.robh@kernel.org>
Subject: Re: [PATCH v9 0/3] Initial support for Qualcomm Hamoa IOT EVK
 board


On Thu, 04 Sep 2025 15:48:31 +0800, Yijie Yang wrote:
> Introduce the device tree, DT bindings, and driver modifications required
> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
> a UART shell.
> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
> and the HAMOA-IOT-EVK carrier board.
> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
> GPIOs, and PMICs. It is designed to be modular and can be paired with
> various carrier boards to support different use cases.
> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
> It provides essential peripherals such as UART, on-board PMICs, and
> USB-related components.
> Together, these components form a flexible and scalable platform, and this
> patch set enables their initial bring-up through proper device tree
> configuration and driver support.
> 
> Qualcomm SoCs often have multiple product variants, each identified by a
> different SoC ID. For instance, the x1e80100 SoC has closely related
> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
> can lead to confusion and unnecessary maintenance complexity in the device
> tree and related subsystems.
> To address this, code names offer a more consistent and project-agnostic
> way to represent SoC families. They tend to remain stable across
> development efforts.
> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
> Going forward, all x1e80100-related variants—including x1e81000 and others
> in the same family—will be represented under the "hamoa" designation in the
> device tree.
> This improves readability, streamlines future maintenance, and aligns with
> common naming practices across Qualcomm-based platforms.
> 
> Features added and enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (eUSB) repeaters
> - USB Type-C mux
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPort
> - Graphic
> - Audio
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v9:
> - Sort the nodes within the root node in alphabetical order.
> - Add WLAN control pin to the PMU.
> - Link to v8: https://lore.kernel.org/r/20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com
> 
> Changes in v8:
> - Change the style of how collaborators are listed.
> - Link to v7: https://lore.kernel.org/r/20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com
> 
> Changes in v7:
> - Configure the EDP regulator to boot-on.
> - Change back to a year‑less copyright statement.
> - Update base commit.
> - Link to v6: https://lore.kernel.org/r/20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com
> 
> Changes in v6:
> - Restore the full change log for each revision.
> - Merge the changes related to Audio and Graphics into the patch series.
> - Link to v5: https://lore.kernel.org/r/20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com
> 
> Changes in v5:
> - Update base commit.
> - Drop an already merged patch:
> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com
> 
> Changes in v4:
> - Update commit messages.
> - Update base commit.
> - Update the format of the node mdss_dp3_out.
> - Add comments to clarify certain nodes.
> - Update the configuration of regulator-wcn-3p3 from regulator-boot-on to regulator-always-on.
> - Link to v3: https://lore.kernel.org/r/20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com
> 
> Changes in v3:
> - Add compatible string and dt-bindings for SOM.
> - Restore PMU-related regulators to comply with dt-binding rules and enable kernel-level power management.
> - Adjust commit description accordingly.
> - Link to v2: https://lore.kernel.org/r/20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com
> 
> Changes in v2:
> - Merge the compatible rules and remove the compatible string map.
> - Align the ADSP and CDSP firmware paths with other x1e80100 platforms.
> - Remove the regulators on the M.2 card, as well as those managed by UEFI on this board.
> - Merge another patch series that enables USB DisplayPort functionality on this platform: https://lore.kernel.org/all/20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com/
> - Link to v1: https://lore.kernel.org/r/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com
> 
> ---
> Yijie Yang (3):
>       dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
>       arm64: dts: qcom: Add HAMOA-IOT-SOM platform
>       arm64: dts: qcom: Add base HAMOA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 1248 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     |  609 +++++++++++
>  4 files changed, 1864 insertions(+)
> ---
> base-commit: b899981540841e409e496083921f2e5c4c209925
> change-id: 20250604-hamoa_initial-0cd7036d7271
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>
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
 Base: using specified base-commit b899981540841e409e496083921f2e5c4c209925

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: chosen: stdout-path:0: 'serial0: 115200n8' does not match '^[a-zA-Z0-9@/,+\-._]*(:[0-9]*[noe]?[78]?[r]?)?$'
	from schema $id: http://devicetree.org/schemas/chosen.yaml#






