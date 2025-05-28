Return-Path: <linux-arm-msm+bounces-59699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ADEAC6972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037B14E47C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848BD285406;
	Wed, 28 May 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahn71tbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555E279789;
	Wed, 28 May 2025 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435842; cv=none; b=O9kyihJnAbWLs9W/m3/Bo/NcTmkEhyo86nyhvizOa5CrHBXd3ejiQgXXQMA5YIIAFYu5EF2/+eyyoC0Bg8yzeQvGdgd0t7NLCHxVhWwKxMUDgTt8GFdRr6X4GgHgpxYlntXNmNQLWLyZQ+bZyyhmV0nECsR/dzlpOhOT6R9Ap2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435842; c=relaxed/simple;
	bh=4wndtLFFbNEebfg/C0AU/VLVN5six3gi8aYkQ4FdXMs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RRIe+q8XO0fMDAcSLQZOdK7irxg0xZiVXpv/mheNExbuu7BCDnvalq5iBmVSjx5qR77aJFtVKNBzSBwdSODiZfLJI7KTm10Xu4QkFnJO+2G331PyfgbCOpjNZvfE0SXSANvjWiad5D7BE0ByGaVj0/rV+dmW7ILRdOWHdtD+rlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahn71tbf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1EAC4CEED;
	Wed, 28 May 2025 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435840;
	bh=4wndtLFFbNEebfg/C0AU/VLVN5six3gi8aYkQ4FdXMs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ahn71tbfqHirEZbiqqUG6b+e3sTdM2N9VoVBdSL0ehNSC4w1wTsLWmANNJnPHXSHh
	 nhhYhDswb808IV7zbfH4L4c14LW6bRQF1A4q7XPXn+P7yEYrr+Uq4wIEpDAYLlnlXw
	 qFY6+v+c/8msgA23VGOiAaW+X0e91xBaWdkbPFmnQwY4I3BZ16G/oJyn5Ihn7uLPfe
	 tflaC55nk6v+YJbgceh8y/W8CPG+WHki9h6BhvujCtsYmfxqP5orN2MHgf22lkkNNA
	 lMErMvGtJiHS0MZaaSy1GqfMh6Ot6gmDMDzxbqCTIe+sCZWFnP134Fbvyi/NS1YT+i
	 ABVKGx4tPy7wA==
Date: Wed, 28 May 2025 07:37:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Message-Id: <174843567392.3636631.15770445244907568991.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode


On Tue, 27 May 2025 22:40:02 +0200, Konrad Dybcio wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> The patchset also includes bindings changes and DT changes.
> 
> This has been successfully tested on an SM8550 board, but the
> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> as expected.
> 
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name = msm_dp
> 	drm_dp_link
> 		rate = 540000
> 		num_lanes = 4
> ...
> 
> This patchset depends on [1] to allow broadcasting the type-c mode
> to the PHY, otherwise the PHY will keep the combo state while the
> retimer would setup the 4 lanes in DP mode.
> 
> [1] https://lore.kernel.org/all/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org/
> Changes in v3:
> - Take the series from Neil
> - Rebase
> - Rename many variables
> - Test on X1E & X13s
> - Apply a number of small cosmetic/codestyle changes
> - Remove some unused variables
> - Some smaller bugfixes
> - Link to v2: https://lore.kernel.org/lkml/20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org/
> Changes in v2:
> - Reference usb-switch.yaml in bindings patch
> - Fix switch/case indenting
> - Check svid for USB_TYPEC_DP_SID
> - Fix X13s patch subject
> - Update SM8650 patch to enable 4 lanes on HDK aswell
> - Link to v1: https://lore.kernel.org/r/20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (1):
>       phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
> 
> Neil Armstrong (5):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
>       phy: qcom: qmp-combo: store DP phy power state
>       phy: qcom: qmp-combo: introduce QMPPHY_MODE
>       phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE
>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP
> 
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   7 +-
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 182 +++++++++++++++++++--
>  3 files changed, 173 insertions(+), 22 deletions(-)
> ---
> base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
> change-id: 20250527-topic-4ln_dp_respin-c6924a8825ce
> 
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 Base: using specified base-commit 460178e842c7a1e48a06df684c66eb5fd630bcf7

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#






