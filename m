Return-Path: <linux-arm-msm+bounces-75604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11949BAD383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936643A15D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B8B304989;
	Tue, 30 Sep 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riRM2w/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D5303C9D;
	Tue, 30 Sep 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759243195; cv=none; b=QFrh4R+TmilR+/PdhpKnKXYlM07WkwjJm0LqQ9I10dw9MIqwqhuleeOK1vq+PcyzlIREg87uNewuNgaI82GmYgvle3n1na8W6X0WIKg+aIjwWXpfpDANWYIyqLbBoiG8rGMlYaTfCsjWfVrPxefzi3Y4z9p65IAFEK6woXBAKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759243195; c=relaxed/simple;
	bh=l45BtsyJKOD0lBkLJnhS7wBvc+VDTM+3H1xN6KRb5nY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Fjln1aOd9/eBhG6ct7H8vE0CcHUNNc2W6yq0EeBYCjyxvv99OR/wD9phlzF3kWZoBqV6jMUOXfnVR40wc0C8iF0Ig+WO9X+pkO1Gi+LAVwnOgTktqCJKyPdxrE6fYn1arQLCvHNAYRm9iucjvo25ONzXmV720WZiHlvgDwt0qpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riRM2w/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1685EC4CEF0;
	Tue, 30 Sep 2025 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759243195;
	bh=l45BtsyJKOD0lBkLJnhS7wBvc+VDTM+3H1xN6KRb5nY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=riRM2w/NT7e2FCDWoxPo+nYpEEmRQkDlx4LY2xBE6BBxxxY/S29TvMA4NGHCq3ZVk
	 qOSPb+zhd2uifbFQOoJ0oTEop42EuyBwHC+gGZk3mAYXPv1BAZXa9SIg6frr1WWiRK
	 9k9KyuCBRw0CfyIV0Ubvs5o9JDyUujJysycrca/QiBsXydRiIF6of749qpCI6YL+LE
	 1L/NiR/b5LevIuGDyBIscF8SvPS4nakhBOhzxhMviyQlBhbv0h0zw/dhCpe/UYFBIF
	 7mUYuDG4foH9xBXEuqu7sCfxJ/H0ibuAdMKxkelgdZqBwoMx/nuQj93ClZP5Uvl5Ub
	 Jr42/fylI6GrA==
Date: Tue, 30 Sep 2025 09:39:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-phy@lists.infradead.org
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
Message-Id: <175924309302.2874001.421334027462702971.robh@kernel.org>
Subject: Re: [PATCH v4 0/3] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add
 support for HDMI output


On Tue, 30 Sep 2025 09:39:46 +0200, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 1/2 DP + 2 USB3
> - 1/2/4 DP
> - 2 USB3
> 
> We need be able to specify the lanes mapping to DisplayPort
> and/or USB3 peripherals when not connected to a Type-C complex.
> 
> Add the documentation for data-lanes in the out endpoints amd
> use those in the driver to setup the right PHY mode and
> orientation.
> 
> Finally Add all the data routing in DT, disable mode switching and specify
> the QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
> the underlying DP phy.
> 
> Depends on:
> - [1] https://lore.kernel.org/all/20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Add definition for single lane DP
> - Fix lanes mapping for DP in bindings and driver
> - Add documentation on how to interpret the data-lanes numbers
> - Rewrite driver support for be simpler and split into helpers
> - Rebase DT on next and drop phy.h include, and use proper mapping
> - Link to v3: https://lore.kernel.org/r/20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org
> 
> Changes in v3:
> - Move the static lanes mapping in data-lanes in the out endpoints
> 	- new bindings
> 	- new drivewr implementation
> 	- new DT layout
> - rebased on next, fixed simple bridge rebase
> - added link frequencies for dp2
> - Link to v2: https://lore.kernel.org/r/20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org
> 
> Changes in v2:
> - Model the HDMI transceiver as a simple bridge
> - Switch to a static lanes mapping property
> - Link to v1: https://lore.kernel.org/r/20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org
> 
> ---
> Neil Armstrong (3):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document lanes mapping when not using in USB-C complex
>       phy: qcom: qmp-combo: get the USB3 & DisplayPort lanes mapping from DT
>       arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes
> 
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  67 +++++++++-
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  81 ++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 145 +++++++++++++++++++--
>  3 files changed, 284 insertions(+), 9 deletions(-)
> ---
> base-commit: 4513b3b1a91546d0dd02c5c0eb507933b328021c
> change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
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
 Base: base-commit 4513b3b1a91546d0dd02c5c0eb507933b328021c not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250929 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8550-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8550-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8550-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8550-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8150-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc8180x-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/phy@88ee000: failed to match any schema with compatible: ['qcom,sc8180x-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8150-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8650-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8450-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8450-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm6350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8150-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8150-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc8180x-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/phy@88ee000: failed to match any schema with compatible: ['qcom,sc8180x-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8150-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8450-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8650-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/phy@fd5000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/phy@fda000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/phy@fdf000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8550-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm6350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8150-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8250-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8650-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/phy@88eb000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/phy@8903000: failed to match any schema with compatible: ['qcom,sc8280xp-qmp-usb43dp-phy']
arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8550-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8350-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7280-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sdm845-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8450-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sm8450-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sc7180-qmp-usb3-dp-phy']






