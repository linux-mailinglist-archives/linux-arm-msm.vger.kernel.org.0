Return-Path: <linux-arm-msm+bounces-86883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C365CCE8249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B17DA30133CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAD22D3737;
	Mon, 29 Dec 2025 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3T1pC6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247B2C21F0;
	Mon, 29 Dec 2025 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040770; cv=none; b=bDrDYH52tw5L5KP+ARVhsB10s+nk5h+mHKMJfU9dnos57aoa24CZYK2disYEoLt4Tdp3fzi2sv9mK78GZN3wcgo+yLKnZMfHAKemLzFzZSWeZndArcQwJJNOc251SkmRI+UkS4L35N3aykXUz38vPfSJ69t3TFnwiu3uR3EAMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040770; c=relaxed/simple;
	bh=XGh5orjYJVOlb27ci2eCjWYMdfOs+ekovdXWlKs6kbU=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cU21HXvIjiofmOCnRKC0MsTFMHKpJmu7jKMZWFvyOvR8hdA/LYdZfine/xp4LpEt77CyFDutEXjTmxOKNXF+scfKpAlH74H+EHUiZS8QDX/DP0iBssECjSguR5jwzI9hKVuea3oRPQDx9W27YV6wzK3yyzaJjsfNtxJbWq/TCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3T1pC6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA48C4CEF7;
	Mon, 29 Dec 2025 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040769;
	bh=XGh5orjYJVOlb27ci2eCjWYMdfOs+ekovdXWlKs6kbU=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=t3T1pC6BqU8OuNqrTMYMnfQhQIBVP1CPcQpvFMSVu7TaI4h47TdyqX+ZVOHXJGLGT
	 33PVTHdntWqSVNXkv/lJHNt21EB92iQmiUVCfjy8OA/e4rWu0UsESEVydkaNYKzuMH
	 tiyQFTE+xTgytmQGJ5Pu9l8VDHc7cccEtD8Id7wwjo3Bvm39u7XW+3EghS7z7K1o0a
	 vbDi5OgT9g45uxoL1SjnC3TNnxQk5FnnLSbwdxjRGQD39eXfg0okyLHScUZdZTOqir
	 KVxymUqzlsU4b1Nsrjq33XW0++IVw1HvbiHIhWEjmF+kJaQDlb9tXEgLn7uuNJVGz8
	 4p6GmsgyoL0pw==
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Dec 2025 14:39:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: vkoul@kernel.org, nitin.rawat@oss.qualcomm.com, conor+dt@kernel.org, 
 konradybcio@kernel.org, linux-phy@lists.infradead.org, 
 taniya.das@oss.qualcomm.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-scsi@vger.kernel.org, neil.armstrong@linaro.org, 
 martin.petersen@oracle.com, linux-kernel@vger.kernel.org, 
 andersson@kernel.org
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
Message-Id: <176703895745.2172976.13195227223157301598.robh@kernel.org>
Subject: Re: [PATCH V1 0/4] Add UFS support for Hamoa SoC


On Mon, 29 Dec 2025 11:36:38 +0530, Pradeep P V K wrote:
> Add UFSPHY, UFSHC compatible binding names and UFS devicetree
> enablement changes for Qualcomm Hamoa SoC.
> 
> Pradeep P V K (4):
>   scsi: ufs: phy: dt-bindings: Add QMP UFS PHY compatible for Hamoa
>   scsi: ufs: qcom: dt-bindings: Add UFSHC compatible for Hamoa
>   arm64: dts: qcom: hamoa: Add UFS nodes for hamoa SoC
>   arm64: dts: qcom: hamoa-iot-evk: Enable UFS
> 
>  .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   4 +
>  .../bindings/ufs/qcom,sc7180-ufshc.yaml       |   6 +-
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  18 +++
>  arch/arm64/boot/dts/qcom/hamoa.dtsi           | 119 +++++++++++++++++-
>  4 files changed, 145 insertions(+), 2 deletions(-)
> 
> --
> 2.34.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20251219 (exact match)
 Base: tags/next-20251219 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: ufshc@1d84000 (qcom,sm8550-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8550-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: ufshc@1d84000 (qcom,sm8550-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8550-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: ufshc@1d84000 (qcom,sm8550-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8550-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: clock-controller@100000 (qcom,x1p42100-gcc): clocks: [[40], [41], [42], [43], [44], [45], [0], [46, 0], [47, 0], [48, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [49, 0], [49, 1], [49, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: ufshc@1d84000 (qcom,sm8350-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8350-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8350-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: ufshc@1d84000 (qcom,sm8550-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8550-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ufshc@1d84000 (qcom,sa8775p-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sa8775p-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ufshc@1d84000 (qcom,sa8775p-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sa8775p-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: ufshc@1d84000 (qcom,sc8180x-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8180x-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8180x-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: clock-controller@100000 (qcom,x1p42100-gcc): clocks: [[40], [41], [42], [43], [44], [45], [0], [46, 0], [47, 0], [48, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [49, 0], [49, 1], [49, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: ufshc@1d84000 (qcom,sm8350-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8350-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8350-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ufshc@1d84000 (qcom,sa8775p-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sa8775p-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/monaco-evk.dtb: ufs@1d84000 (qcom,qcs8300-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs8300-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,qcs8300-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: ufshc@1d84000 (qcom,sm8350-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8350-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8350-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000 (qcom,sm8450-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8450-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8450-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000 (qcom,sm8450-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8450-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8450-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: ufshc@1d84000 (qcom,sc8180x-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8180x-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8180x-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: clock-controller@100000 (qcom,x1p42100-gcc): clocks: [[40], [41], [42], [43], [44], [45], [0], [46, 0], [47, 0], [48, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [49, 0], [49, 1], [49, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ufshc@1d84000 (qcom,sa8775p-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sa8775p-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: ufshc@1d84000 (qcom,sm8450-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8450-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8450-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: ufs@1d84000 (qcom,qcs8300-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs8300-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,qcs8300-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/lemans-evk.dtb: ufshc@1d84000 (qcom,sa8775p-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sa8775p-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: clock-controller@100000 (qcom,x1p42100-gcc): clocks: [[40], [41], [42], [43], [44], [45], [0], [46, 0], [47, 0], [48, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [49, 0], [49, 1], [49, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: ufshc@1d84000 (qcom,sm8550-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8550-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: clock-controller@100000 (qcom,x1e80100-gcc): clocks: [[50], [51], [52], [53], [54], [55], [0], [56, 0], [57, 0], [58, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [59, 0], [59, 1], [59, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: clock-controller@100000 (qcom,x1p42100-gcc): clocks: [[40], [41], [42], [43], [44], [45], [0], [46, 0], [47, 0], [48, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [49, 0], [49, 1], [49, 2]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,x1e80100-gcc.yaml
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: ufs@1d84000 (qcom,hamoa-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,hamoa-ufshc', 'qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,hamoa-ufshc' is not one of ['qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: ufshc@1d84000 (qcom,sm8250-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8250-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8250-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: ufshc@1d84000 (qcom,sm8350-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8350-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8350-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ufshc@1d84000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ufshc@1da4000 (qcom,sc8280xp-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc8280xp-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: ufshc@1d84000 (qcom,sm8350-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8350-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8350-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: ufshc@1d84000 (qcom,sm8550-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8550-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8550-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: ufshc@1da4000 (qcom,msm8998-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,msm8998-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,msm8998-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: ufshc@1d84000 (qcom,sc7280-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7280-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7280-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: ufshc@1d84000 (qcom,sc7180-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc7180-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sc7180-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ufshc@1d84000 (qcom,sm8450-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8450-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8450-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ufshc@1d84000 (qcom,sm8450-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8450-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8450-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml






