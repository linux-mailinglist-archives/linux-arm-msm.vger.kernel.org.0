Return-Path: <linux-arm-msm+bounces-45295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED61A13E10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 16:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626C7188C429
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A31A22BAA9;
	Thu, 16 Jan 2025 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqWVjF7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACF322B8D9;
	Thu, 16 Jan 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042257; cv=none; b=NxWEyCsyGRDYDFl9H/HLWMPtr8SqHjJh4RIbyt+1ed4SjKcEq8YF7lB2ZjM79tsKQk3hJ7odZBvZEV/nOmr+sA7i91J6EztuPadTgfT/qRaQwm04iSK1j+a/CCMDsPI8b1gbAfkD3HGqUuPktKqWXRbdDpWPVVj+GOKTibipF7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042257; c=relaxed/simple;
	bh=VGRMjq9nGOup27TqZFLY71yztP1pzJGehCHR9/bnj6U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GR6JgqFeRpRpJtBNnGLAXjyBjLCYYBaMH4fJF4uJsxIVQSgR9aOjETV0z4dHNKXModR+AuULofYxntbvwvDa9L35+qiOSJwXjL9KRVR+6k4EfM5YRtuhnCV17w/U6Xxd2MJKpMfELZmWVCNbzDitwNa4yH/LY3bJggQyDR5QE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqWVjF7q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA3CC4CED6;
	Thu, 16 Jan 2025 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737042256;
	bh=VGRMjq9nGOup27TqZFLY71yztP1pzJGehCHR9/bnj6U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qqWVjF7qWQtPyxJYbdzIMbk8eDJcTZL4YBfmbJ80h9NQqF0S4F54uEsxHOVlf1VnZ
	 82nAxLcAn8oPWLpIEz6fKW0NDbvA/3S6jO867wb1AG4nHD3QEUmWVzpfpm1nbCjy67
	 4Wi7hNvMhU7RAwRJCkAzVTsVhd81zfSgdUPD0H4llXrNn/s+g0beTYDy9NjFoihMLd
	 9yo4PqNlyCCF+z8XRJL//gq7PIBU1xbagkd8/RsXATlu/Nx6cqZQi7TUAixm3yOyT0
	 aJqXHdv88QRj9xBktReFT2G8zSboZcQxj6s9mQt90crhkp0bVS79KSfKN24Y4AWIyr
	 b6Vy1Om7iMSOg==
Date: Thu, 16 Jan 2025 09:44:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_fenglinw@quicinc.com, 
 Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
 quic_tingweiz@quicinc.com
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <20250116-fix-kernel-test-robot-unexpected-property-issue-v1-1-b1f4cc2c52d5@quicinc.com>
References: <20250116-fix-kernel-test-robot-unexpected-property-issue-v1-1-b1f4cc2c52d5@quicinc.com>
Message-Id: <173704211854.2583033.13690426903892251830.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Fix kernel test robot issue
 in SPMI


On Thu, 16 Jan 2025 16:31:48 +0800, Tingguo Cheng wrote:
> Fix the kernel test robot issue in qcs615-ride.dtb spmi@c440000 by
> removing the unevaluated 'cell-index' property.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202412272210.GpGmqcPC-lkp@intel.com/
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 -
>  1 file changed, 1 deletion(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250116-fix-kernel-test-robot-unexpected-property-issue-v1-1-b1f4cc2c52d5@quicinc.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[345, 346]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[345, 346]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dma-controller@800000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dma-controller@900000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dma-controller@b00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/dma-controller@b00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: iommu@5040000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too long
	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too short
	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
	'qcom,sdm845-smmu-v2' was expected
	'marvell,ap806-smmu-500' was expected
	'qcom,sdm670-smmu-v2' is not one of ['nvidia,tegra186-smmu', 'nvidia,tegra194-smmu', 'nvidia,tegra234-smmu']
	'arm,mmu-500' was expected
	'qcom,sdm670-smmu-v2' is not one of ['arm,mmu-400', 'arm,mmu-401']
	'qcom,sdm670-smmu-v2' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
	'qcom,smmu-v2' was expected
	'qcom,smmu-500' was expected
	'nvidia,smmu-500' was expected
	'arm,smmu-v2' was expected
	'arm,smmu-v1' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/iommu@5040000: failed to match any schema with compatible: ['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/spmi@c440000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b84000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt'] is too long
	['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt'] is too short
	'qcom,apss-wdt-ipq5424' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
	'qcom,kpss-wdt' was expected
	'qcom,scss-timer' was expected
	'qcom,apss-wdt-ipq5424' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
	'qcom,msm-timer' was expected
	'qcom,kpss-timer' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/watchdog@f410000: failed to match any schema with compatible: ['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dma-controller@800000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dma-controller@900000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dma-controller@b00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/dma-controller@b00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dma-controller@800000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dma-controller@900000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dma-controller@b00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/dma-controller@b00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-gen3x2-pcie-phy']
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-gen3x2-pcie-phy']
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-usb3-dp-phy']
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/qfprom@221c8000: failed to match any schema with compatible: ['qcom,sar2130p-qfprom', 'qcom,qfprom']
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: display-subsystem@ae00000: interconnects: [[134, 7, 0, 88, 1, 0], [134, 8, 0, 88, 1, 0], [89, 2, 3, 90, 16, 3]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: scm: compatible:0: 'qcom,scm-qcs615' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5332', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-mdm9607', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm8916', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,scm-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qcom,scm-msm8998', 'qcom,scm-qcm2290', 'qcom,scm-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p', 'qcom,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm6125', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm8150', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm8550', 'qcom,scm-sm8650', 'qc
 om,scm-sm8750', 'qcom,scm-qcs404', 'qcom,scm-x1e80100']
	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /firmware/scm: failed to match any schema with compatible: ['qcom,scm-qcs615', 'qcom,scm']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: dma-controller@800000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma'] is too long
	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,qcs615-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sm6350-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma'] is too long
	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,qcs615-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sm6350-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pmu@90b6300: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
	'qcom,msm8998-bwmon' was expected
	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
	'qcom,sc7280-llcc-bwmon' was expected
	'qcom,sdm845-llcc-bwmon' was expected
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/pmu@90b6300: failed to match any schema with compatible: ['qcom,qcs615-cpu-bwmon', 'qcom,sdm845-bwmon']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pmu@90cd000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
	'qcom,msm8998-bwmon' was expected
	'qcom,qcs615-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
	'qcom,qcs615-llcc-bwmon' is not one of ['qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
	'qcom,sc7280-llcc-bwmon' was expected
	'qcom,sdm845-llcc-bwmon' was expected
	'qcom,sdm845-bwmon' was expected
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/pmu@90cd000: failed to match any schema with compatible: ['qcom,qcs615-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: compatible:0: 'qcom,qcs615-aoss-qmp' is not one of ['qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/power-controller@c300000: failed to match any schema with compatible: ['qcom,qcs615-aoss-qmp', 'qcom,aoss-qmp']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too short
	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too long
	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,qcs404-apcs-apps-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
	'qcom,ipq6018-apcs-apps-global' was expected
	'qcom,msm8916-apcs-kpss-global' was expected
	'qcom,msm8994-apcs-kpss-global' was expected
	'syscon' was expected
	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/mailbox@17c00000: failed to match any schema with compatible: ['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too long
	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too short
	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
	'qcom,kpss-wdt' was expected
	'qcom,scss-timer' was expected
	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
	'qcom,msm-timer' was expected
	'qcom,kpss-timer' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000: clock-controller:compatible:0: 'qcom,qcs615-rpmh-clk' is not one of ['qcom,qdu1000-rpmh-clk', 'qcom,sa8775p-rpmh-clk', 'qcom,sar2130p-rpmh-clk', 'qcom,sc7180-rpmh-clk', 'qcom,sc7280-rpmh-clk', 'qcom,sc8180x-rpmh-clk', 'qcom,sc8280xp-rpmh-clk', 'qcom,sdm670-rpmh-clk', 'qcom,sdm845-rpmh-clk', 'qcom,sdx55-rpmh-clk', 'qcom,sdx65-rpmh-clk', 'qcom,sdx75-rpmh-clk', 'qcom,sm4450-rpmh-clk', 'qcom,sm6350-rpmh-clk', 'qcom,sm8150-rpmh-clk', 'qcom,sm8250-rpmh-clk', 'qcom,sm8350-rpmh-clk', 'qcom,sm8450-rpmh-clk', 'qcom,sm8550-rpmh-clk', 'qcom,sm8650-rpmh-clk', 'qcom,x1e80100-rpmh-clk']
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/rsc@18200000/clock-controller: failed to match any schema with compatible: ['qcom,qcs615-rpmh-clk']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0: 'qcom,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,qcs615-dwc3', 'qcom,dwc3']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dma-controller@800000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dma-controller@900000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dma-controller@b00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sa8775p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/dma-controller@b00000: failed to match any schema with compatible: ['qcom,sa8775p-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0: 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/efuse@784000: failed to match any schema with compatible: ['qcom,qcs8300-qfprom', 'qcom,qfprom']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: rng@10d2000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs8300-trng', 'qcom,trng'] is too long
	'qcom,qcs8300-trng' is not one of ['qcom,prng', 'qcom,prng-ee']
	'qcom,qcs8300-trng' is not one of ['qcom,sa8255p-trng', 'qcom,sa8775p-trng', 'qcom,sc7280-trng', 'qcom,sm8450-trng', 'qcom,sm8550-trng', 'qcom,sm8650-trng']
	from schema $id: http://devicetree.org/schemas/crypto/qcom,prng.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/rng@10d2000: failed to match any schema with compatible: ['qcom,qcs8300-trng', 'qcom,trng']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs8300-qce', 'qcom,qce'] is too long
	['qcom,qcs8300-qce', 'qcom,qce'] is too short
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,qcs8300-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,qcs8300-qce' is not one of ['qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce']
	'qcom,ipq4019-qce' was expected
	'qcom,sm8150-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,qcs8300-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1d88000: compatible:0: 'qcom,qcs8300-inline-crypto-engine' is not one of ['qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine']
	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1d88000: failed to match any schema with compatible: ['qcom,qcs8300-inline-crypto-engine', 'qcom,inline-crypto-engine']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt'] is too long
	['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt'] is too short
	'qcom,apss-wdt-qcs8300' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
	'qcom,kpss-wdt' was expected
	'qcom,scss-timer' was expected
	'qcom,apss-wdt-qcs8300' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
	'qcom,msm-timer' was expected
	'qcom,kpss-timer' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible:0: 'qcom,qcs8300-gpdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas'] is too long
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@20c00000: failed to match any schema with compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible:0: 'qcom,qcs8300-cdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas'] is too long
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@26300000: failed to match any schema with compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas']
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






