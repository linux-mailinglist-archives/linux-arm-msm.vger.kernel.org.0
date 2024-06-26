Return-Path: <linux-arm-msm+bounces-24285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFA918273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED54D1C23C4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 13:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1591836E7;
	Wed, 26 Jun 2024 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKqfU17f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B6183098;
	Wed, 26 Jun 2024 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719408692; cv=none; b=U3K7Za04c5MBpiEC3Ta9KtGn7BoO3g8qHc7XMa0jyP7J+wZRyIr24pEkNWVzgCEz2dMGzeVj1LFmuVhAh/2NfIugrPGveIa1qf5adFx3L7FLixISoRdg+Z+VZjJnM8RXoka6edXyyqDszvAg0ETb8qNde+oEjYMkihprei6DHow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719408692; c=relaxed/simple;
	bh=IooSaIwKO+iI7jZmr49oMzicKBnlZBk7V8h98yUmyXY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Q7MStfv0AdOje2yQ3SofcT60LjxsAcIUxHfV08BdZdBfU63D67qc5u9p6gSc3hiQUd250x8gfCzylvu3vt62hXNM58u01Blou7FW5mbs9eDGds/ZQFRhUuUA3SVRvT9KwApjUP+NntZDtii18y6g52fz/MB5377wpPL5rRbtVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKqfU17f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1419C4AF0E;
	Wed, 26 Jun 2024 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719408692;
	bh=IooSaIwKO+iI7jZmr49oMzicKBnlZBk7V8h98yUmyXY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KKqfU17fsaqgBUMVf1eUssHRd9mD4xRECUuuMHga6n+hid24nUZwl8smcC64mRi7F
	 KlxqYlqJXH8zxQ3ym+BZzUQVFJjnAflfH8qqaJfhbru8hbiCNsAVyTwKgTqiHtdUP+
	 SNOUTacMQJk+uzfTgIz42ewuoqT+fdER0ItJvSMlk81TgIZZY/w9ZsmIRSbdZo6HQF
	 LRc8/fB0Eye9y+ApMNosvwbpphNjiF49j75sX/q1KG0ZnU0ebis8T7bB+nwrWOCVeh
	 djTjbx5U3TP6fooeAuwwxU004UwxeJTsZkMxC4Jey4n9NVl1SYJU2R0iLDG7io9jtx
	 tH1xE1P4usN0g==
Date: Wed, 26 Jun 2024 07:31:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240625151430.34024-1-brgl@bgdev.pl>
References: <20240625151430.34024-1-brgl@bgdev.pl>
Message-Id: <171940832800.2961357.8252372269434038796.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sa8775p-ride: support both
 board variants


On Tue, 25 Jun 2024 17:14:27 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Split the current .dts into two: the existing one keeps the name and
> supports revision 2 of the board while patch 2 adds a .dts for revision 3.
> 
> Changes since v1:
> - add a new compatible for Rev3
> 
> Bartosz Golaszewski (3):
>   dt-bindings: arm: qcom: add sa8775p-ride Rev 3
>   arm64: dts: qcom: move common parts for sa8775p-ride variants into a
>     .dtsi
>   arm64: dts: qcom: sa8775p-ride-r3: add new board file
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  47 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 836 +-----------------
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 814 +++++++++++++++++
>  5 files changed, 885 insertions(+), 814 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y qcom/sa8775p-ride-r3.dtb qcom/sa8775p-ride.dtb' for 20240625151430.34024-1-brgl@bgdev.pl:

arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r', '10g-qxgmii']
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: snps,pbl: [32] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r', '10g-qxgmii']
	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r', '10g-qxgmii']
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r', '10g-qxgmii']
	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#






