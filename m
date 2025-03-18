Return-Path: <linux-arm-msm+bounces-51850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE205A67FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 23:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528D042384E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2F7212FBD;
	Tue, 18 Mar 2025 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFXJ9rDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B02116FE;
	Tue, 18 Mar 2025 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336764; cv=none; b=iyNjavXqNxOiTk/EDExtiWRvMqq61TNHVlHKtmdDbDUTu0ZAK/JzZYEkSjT7+wNwxjiCcJc4nNto82SBlQOa7oWvIVEJlAIjJpe/plZBb+JriJAn2/n6ixSg7El+GLUHceAqYdK8+Ky0XufMByPouw0yELB3Q7Ggx7XJL+U3R44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336764; c=relaxed/simple;
	bh=cUgPqeI33cz9Ef2WxyD7GspkWm9E1yXB2DQjkBv29Qg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VINhbjo4rFBD8yu+dgwXrCpbSZQhKgdMjEIDR9ouqc5w80ufZS4Mm/gVf+FGE0kmzwcrTPBeUFPIPsUBcYD2sLtaWk1pNU5Febl2TpWcD9MVFCL5/p/rVZntokiQEt77Q0GHvT7i+gFUTQagvJbZpDGp6TnDai1W/VxLViq7hD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFXJ9rDz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F50AC4CEEF;
	Tue, 18 Mar 2025 22:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742336763;
	bh=cUgPqeI33cz9Ef2WxyD7GspkWm9E1yXB2DQjkBv29Qg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dFXJ9rDzX0Ka50WCLYaDtE6l4kkUIaNaJf0+YJNzpfqWqKIo1FuAkUfy2KRharZkW
	 LuU68eiYPlMfVWdf59g3h+Ztes1cSMA7QyTufDXyfq6u8xoCduj1RK09dCRr8a30Ar
	 z0ubhKWhogO68XhlknR+HQ/o6jtsboRk9XeeQOH/br/lwEYL0Ddw4BD2OVG/F6Ps0X
	 oyrst5frm+U8kYczMm2iSLg+9JAW+tgeuqhly4NEunoQ8Mwdw/rmXCO9oKQgbDnl3D
	 ag31M5hSZlyZEN5A2D1N+0NGLF+Cr2c6EXKSOBeN1FdC5K2CoSjebkRu136fBwZaq9
	 izKqVxAHlKBhA==
Date: Tue, 18 Mar 2025 17:26:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
 Frank Li <Frank.li@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, linux-arm-msm@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Felipe Balbi <balbi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
Message-Id: <174233664011.4094337.15532864486999752175.robh@kernel.org>
Subject: Re: [PATCH v5 0/7] usb: dwc3: qcom: Flatten dwc3 structure


On Tue, 18 Mar 2025 14:05:00 -0500, Bjorn Andersson wrote:
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
> 
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> 
> Missing from the upstream Qualcomm USB support is proper handling of
> role switching, in which the glue needs to be notified upon DRD mode
> changes. Several attempts has been made through the years to register
> callbacks etc, but they always fall short when it comes to handling of
> the core's probe deferral on resources etc.
> 
> Furhtermore, the DeviceTree binding is a direct representation of the
> Linux driver model, and doesn't necessarily describe "the USB IP-block".
> 
> This series therefor attempts to flatten the driver split, and operate
> the glue and core out of the same platform_device instance. And in order
> to do this, the DeviceTree representation of the IP block is flattened.
> 
> Departing from previous versions' attempts at runtime-convert the
> Devicetree representation is swapped out and instead a snapshot of the
> current dwc3-qcom driver is proposed to be carried for a limited time.
> 
> A patch to convert a single platform - sc8280xp - is included in the
> series. The broader conversion will be submitted in a follow up series.
> 
> ---
> Changes in v5:
> - Moved the snapshot commit first, to get a clean copy
> - Add missing kernel-doc in glue.h
> - Used a local "struct device" variable in PM functions to reduce the
>   patch size
> - Replaced initialization with default values with zero-initalizing the
>   dwc3_probe_data in dwc3_probe()
> - Add TODO about extcon, as a role-switch callback needs to be
>   implemented
> - Corrected &usb_2 mmio region length
> - Changes the timeline expressed in the commit message to suggest the
>   legacy driver to be dropped after next LTS
> - Integrated qcom,dwc3.yaml changes since v4
> - Link to v4: https://lore.kernel.org/r/20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com
> 
> Changes in v4:
> - dwc3_{init,uninit}() renamed to dwc3_core_probe() and dwc3_core_remove()
> - dwc3_{suspend, resume, complete}() changed to dwc3_pm_*()
> - Arguments to dwc3_core_probe() are wrapped in a struct to better
>   handle the expected growing list of parameters.
> - Add the lost call to dwc3_core_remove() from the Qualcomm glue driver
> - Removed now unused cleanup.h, of_address.h, and of_irq.h includes from
>   dwc3-qcom.c
> - Link to v3: https://lore.kernel.org/r/20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com
> 
> Changes in v3:
> - Replaced the handcoded migration logic of compatible, reg, interrupts,
>   phys with overlays.
> - Move the migration logic (and overlays) to a new drivers/of/overlays
>   directory and apply this at postcore, so that it takes effect prior to
>   the relevant platform_devices are created
> - struct dwc3 is embedded in the glue context, rather than having a
>   separate object allocated
> - The hack of using of_address_to_resource() to avoid platform_resource
>   being stale is removed (thanks to applying migration at postcore)
> - Link to v2: https://lore.kernel.org/r/20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com
> 
> Changes in v2:
> - Rewrite after ACPI removal, multiport support and interrupt fixes
> - Completely changed strategy for DeviceTree binding, as previous idea
>   of using snps,dwc3 as a generic fallback required unreasonable changes
>   to that binding.
> - Abandoned idea of supporting both flattened and unflattened device
>   model in the one driver. As Johan pointed out, it will leave the race
>   condition holes and will make the code harder to understand.
>   Furthermore, the role switching logic that we intend to introduce
>   following this would have depended on the user updating their
>   DeviceTree blobs.
> - Per above, introduced the dynamic DeviceTree rewrite
> - Link to v1: https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
> 
> ---
> Bjorn Andersson (7):
>       usb: dwc3: qcom: Snapshot driver for backwards compatibilty
>       dt-bindings: usb: Introduce qcom,snps-dwc3
>       usb: dwc3: core: Expose core driver as library
>       usb: dwc3: core: Don't touch resets and clocks
>       usb: dwc3: qcom: Don't rely on drvdata during probe
>       usb: dwc3: qcom: Transition to flattened model
>       arm64: dts: qcom: sc8280x: Flatten the USB nodes
> 
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 620 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  10 +-
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
>  .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  10 +-
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  18 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 157 ++--
>  drivers/usb/dwc3/Makefile                          |   1 +
>  drivers/usb/dwc3/core.c                            | 160 ++--
>  drivers/usb/dwc3/dwc3-qcom-legacy.c                | 935 +++++++++++++++++++++
>  drivers/usb/dwc3/dwc3-qcom.c                       | 157 ++--
>  drivers/usb/dwc3/glue.h                            |  35 +
>  15 files changed, 1885 insertions(+), 271 deletions(-)
> ---
> base-commit: c4d4884b67802c41fd67399747165d65c770621a
> change-id: 20231016-dwc3-refactor-931e3b08a8b9
> 
> Best regards,
> --
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a800000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a800000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#






