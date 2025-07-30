Return-Path: <linux-arm-msm+bounces-67198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3DB167D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 22:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B7E3AC3C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55145215191;
	Wed, 30 Jul 2025 20:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2Ln6bVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466810F1;
	Wed, 30 Jul 2025 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753908873; cv=none; b=j75mtADX1/xPfuHS1xN44ri8N8vwfE9Qe9fKYyDkgw6/3n1GCwZ1upoeuQhHJwv0I1b6BPFigYdX0mMwNjWQpQFTk4YG1M5R72ZqoMTX8TQW6XrgldAauzrCnKY5dQ1QpotGlhSeg6k+QeRgzSWXuiNjTx1DLP3yq/QmAesGHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753908873; c=relaxed/simple;
	bh=B9Knq1s0O26WBoCrK4ngNaXKjfNel1u/fAqF4ihbGHQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZOJaSRW7gwVOx3G6fBzLckZ6tqIWdSP9GkknDJCUQQqDJjdHmKRTrNOLcn1Fck6Sj5SYCtrheW4GjISr75Kv71ak8qdm3b9VfdzRc8Wrs8a+HQ9LfQj6hlnDMY+5DQF0x1ubFqGBe1N9QMNSTFX78QRw2kHeaGpKKNAhF9hKbb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2Ln6bVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851D3C4CEE3;
	Wed, 30 Jul 2025 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753908872;
	bh=B9Knq1s0O26WBoCrK4ngNaXKjfNel1u/fAqF4ihbGHQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=L2Ln6bVt/h0wYsggt/SFzmeV0u0bc1tDHG5anl/9kTHup2cT8AdhbxyFd8vJ2iQ8Z
	 eYJcql0twEt6pEg+F13mmyPSLArY0rQ5yL0g+spZpyPI4RkaBCpEuNZ6JWDoI3Ta0D
	 tz7VQTd/RZhZP3yDdEdRpXdJ+v8O+5S3tYvTs0MW5pHcIIGWO3308B4TuQ2a4IMsqD
	 LXfyNUetI9LCHpNOHQcMDmY0bUVOrpzQUUOBoWP73pHPe/VUjjr1vJArW4j79+tCSv
	 xcrmOPXz68Dvq/jkdnMdIA6sAdvZOphvz9/jPD7ErXiOomRrboVk6JG4wdF9+bx2Xk
	 4SP5IYmlVhp+w==
Date: Wed, 30 Jul 2025 15:54:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, stable@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org>
References: <20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org>
Message-Id: <175390856538.1725252.16820505469946792548.robh@kernel.org>
Subject: Re: [PATCH 0/3] phy: qcom: edp: Add missing refclk clock to
 x1e80100


On Wed, 30 Jul 2025 14:46:47 +0300, Abel Vesa wrote:
> According to documentation, the eDP PHY on x1e80100 has another clock
> called refclk. Rework the driver to allow different number of clocks
> based on match data and add this refclk to the x1e80100. Fix the
> dt-bindings schema and add the clock to the DT node as well.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (3):
>       dt-bindings: phy: qcom-edp: Add missing clock for X Elite
>       phy: qcom: edp: Add missing refclk for X1E80100
>       arm64: dts: qcom: Add missing TCSR refclk to the eDP PHY
> 
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 23 +++++++++++-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  6 ++-
>  drivers/phy/qualcomm/phy-qcom-edp.c                | 43 ++++++++++++++++++----
>  3 files changed, 62 insertions(+), 10 deletions(-)
> ---
> base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
> change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7
> 
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>
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
 Base: using specified base-commit 79fb37f39b77bbf9a56304e9af843cd93a7a1916

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#






