Return-Path: <linux-arm-msm+bounces-75518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB86BA9CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 17:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D25A1891E68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 15:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7672930C0F8;
	Mon, 29 Sep 2025 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4qWA1DX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843A30C0F0;
	Mon, 29 Sep 2025 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159741; cv=none; b=gRtcW4IjAhH92VfysgZiyZ+4dRi3KnEIwW8EMi+XHVN/JFea77i1F14hAPbzREO1c1hborvh7x0uUdK9eqhqFeAzLk+tJ4QC2YBqhCS7HJdJRtuR02NGUevxxRzI5MY3W8Rjpfy1XAcNaisJ+df/xWlZnyqCPip8yW0bH+6SDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159741; c=relaxed/simple;
	bh=3pzmtsbiTCR95ZsPE9rXLst/P4KeKZ76MABSMztNLe0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BPI78vpVwX87UJlBTVQ1Ifg7g66xLJFnHX3oTFT6r/4HatsUfyQ31YurkcxnBtfpwo0JLtp/LRTi/cy0XEhNRgUvkUwN+4j1HfHooVU74an2nIwgiaQd8liR7EP8rcxwQoT444boNuQlGnmIBi1MN3zaB+yD2MUzsB7a9glnKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4qWA1DX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC6EC4CEF7;
	Mon, 29 Sep 2025 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759159740;
	bh=3pzmtsbiTCR95ZsPE9rXLst/P4KeKZ76MABSMztNLe0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=L4qWA1DX0ZNMNSox8gWc2YkrJq7qv1bSwXIrWqY3wcqEjdFlfG91Ow1od0E86VHhk
	 Znf1BPX3HTubbz7Qi8vCEZO+w5QDEN12ZlS03wYtehIZSWyFuRa3bi4W9tM7mZ9fPt
	 FRe1qcLgWSV13uR4qKWlM9xX5Uws78X3RFTK9QqIyOF6teuCxzB6Dtql1J7QvasgpO
	 +DyFu2Q8Es6jDJSYCwucZG07V91FPPI26MsI39wGaV6cjGvlW4LO/Guqd/IjNbUzcs
	 5RcKNHU1aqZNy8iYePrMFGCKgquNjlDOiHSkBOYCnqxY8rCxfHIIMyUyHLMydWMucQ
	 LEB4B6gx8HB6g==
Date: Mon, 29 Sep 2025 10:29:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
References: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
Message-Id: <175915953212.54437.14578163410705944523.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa
 Dragon Q6A


On Mon, 29 Sep 2025 14:46:40 +0800, Xilin Wu wrote:
> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
> computer, based on the Qualcomm QCS6490 platform.
> 
> The board ships with a modified version of the Qualcomm Linux boot
> firmware, which is stored on the onboard SPI NOR flash. This allows
> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
> 
> The board schematic is available at [1].
> 
> Features enabled and working:
> 
> - Configurable I2C/SPI/UART from 40-Pin GPIO
> - Three USB-A 2.0 ports
> - RTL8111K Ethernet connected to PCIe0
> - eMMC module
> - SD card
> - M.2 M-Key 2230 PCIe 3.0 x2
> - Headphone jack
> - Onboard thermal sensors
> - QSPI controller for updating boot firmware
> - ADSP remoteproc (Type-C and charging features disabled in firmware)
> - CDSP remoteproc (for AI applications using QNN)
> - Venus video encode and decode accelerator
> 
> Features available with additional DT overlays:
> - CSI cameras
> - DSI display
> 
> Features that will be submitted separately once the required bindings are
> merged:
> 
> - USB-A 3.0 port
> - UFS 3.1 module
> - HDMI 2.0 port including audio
> 
> ALSA UCM and Audioreach topology patches are available at [2] and [3].
> 
> [1]: https://docs.radxa.com/en/dragon/q6a/download
> [2]: https://github.com/alsa-project/alsa-ucm-conf/pull/601
> [3]: https://github.com/linux-msm/audioreach-topology/pull/24
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
> Changes in v5:
> - Change LED default function to panic-indicator
> - Fix line break in sound node
> - Fix status-not-last in usb_2_hsphy
> - Remove unused regulators to avoid potential issues
> - Link to v4: https://lore.kernel.org/r/20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com
> 
> Changes in v4:
> - Change CDSP firmware to use the existing one from linux-firmware
> - Describe onboard USB 2.0 hub and ports
> - Add configurable I2C/SPI/UART QUP controllers
> - Link to v3: https://lore.kernel.org/r/20250915-radxa-dragon-q6a-v3-0-a6c32d988ed7@radxa.com
> 
> Changes in v3:
> - Dropped patches for USB/HDMI, UFS and GPIO.
> - Removed Reviewed-by tag from the board DTS patch as it was significantly
>   modified.
> - Link to v2: https://lore.kernel.org/r/20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com
> 
> Changes in v2:
> - Move codec before cpu in sound node to get sorted.
> - Drop patch dependencies in cover letter
> - Separate the changes that have unmet dependencies, and mark them as DNM
> - Link to v1: https://lore.kernel.org/r/20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com
> 
> ---
> Xilin Wu (2):
>       dt-bindings: arm: qcom: Add Radxa Dragon Q6A
>       arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1095 ++++++++++++++++++++
>  3 files changed, 1097 insertions(+)
> ---
> base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66
> 
> Best regards,
> --
> Xilin Wu <sophon@radxa.com>
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
 Base: using specified base-commit 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com:

arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@9c0000 (qcom,geni-se-qup): i2c@980000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@9c0000 (qcom,geni-se-qup): i2c@988000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@9c0000 (qcom,geni-se-qup): i2c@998000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@9c0000 (qcom,geni-se-qup): spi@99c000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: i2c@980000 (qcom,geni-i2c): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: i2c@988000 (qcom,geni-i2c): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: i2c@998000 (qcom,geni-i2c): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: spi@99c000 (qcom,geni-spi): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@ac0000 (qcom,geni-se-qup): i2c@a88000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@ac0000 (qcom,geni-se-qup): i2c@a94000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@ac0000 (qcom,geni-se-qup): spi@a90000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: geniqup@ac0000 (qcom,geni-se-qup): spi@a98000: Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: i2c@a88000 (qcom,geni-i2c): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: spi@a90000 (qcom,geni-spi): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: i2c@a94000 (qcom,geni-i2c): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: spi@a98000 (qcom,geni-spi): Unevaluated properties are not allowed ('qcom,enable-gsi-dma' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: edp@aea0000 (qcom,sc7280-edp): reg: [[0, 183107584, 0, 512], [0, 183108096, 0, 512], [0, 183108608, 0, 3072], [0, 183111680, 0, 1024]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#






