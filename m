Return-Path: <linux-arm-msm+bounces-60309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F7ACEF82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 14:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2D418958E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 12:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7F1215077;
	Thu,  5 Jun 2025 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjHe5R7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2171EF39E;
	Thu,  5 Jun 2025 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127772; cv=none; b=iI2l7t4zkbphuP6A3MUbb43wUkCtHHYaZJHmz9QZ59ow4MnJj7b4mR5BrE4ookwvNAalvMAnJP+OMtGNlCUt8oaBnnIhBkmj3DvsfIjJax8BuZntugyKFFP0RhIYeV34I9PKBolcK/Avk6u9LbImUniXwFG93ZqeiG53XbIED9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127772; c=relaxed/simple;
	bh=FvOILfyNj8UJTb7FPFfvG+z1Lzr4xW8GsE4xMxW54h4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GqiR8+VTLEGRZno3bVoTVoBFJH2L5TuTs6wq25UbkaZiIq6vl/EA64BuDzoRzI73Jqexs3rFxwQ43K+LTfy3r7ljRtdUe4xQ2Mp6C/5KAKwCjYmBsSu05AEZCsfOWwnQRDRLRkdrFst9qlRVjpOyGpOIVuu6uELFIRhn2/49wBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjHe5R7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4A3C4CEE7;
	Thu,  5 Jun 2025 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749127771;
	bh=FvOILfyNj8UJTb7FPFfvG+z1Lzr4xW8GsE4xMxW54h4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NjHe5R7Tf3SQqPlLPjtHI7O/pXojvGwfWXjokA84Lm3qjNlaPHItRYDsbnOnsCKis
	 Gju7qE2LD1Eav7ch13jiGpnHdqiYqGPLibTtFRMTlza42h0h96+DfuTkJ3DhPNelGU
	 fmUu++TTOdd6kN3fOmVZEulGe1DCNFJ1c/tWV5wZbWCgE7rqyHNvrcPv90mYBr3c9v
	 AwxkY+WY9jQCtLgAG+hyvwhP7tqi1rdihsPa9xztzgn/N9W41DZiCmtQyLUYX1Sr3i
	 SeUV18sOGSXpaqs7m2Z7tjHZv4+cjmwi+7cIdbh/sw+1cU0ky8RItcpj7pfBgMp3Hf
	 w2Z18+1SAdoUg==
Date: Thu, 05 Jun 2025 07:49:29 -0500
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
In-Reply-To: <20250605054208.402581-1-mitltlatltl@gmail.com>
References: <20250605054208.402581-1-mitltlatltl@gmail.com>
Message-Id: <174912725070.2341072.9335882738214747991.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add GPI DMA configuration


On Thu, 05 Jun 2025 13:42:07 +0800, Pengyu Luo wrote:
> SPI on SC8280XP requires DMA (GSI) mode to function properly. Without it,
> SPI controllers fall back to FIFO mode, which causes:
> 
> [    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
> [    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
> ...
> [   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
> [   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
> [   46.621555] spi_master spi0: failed to transfer one message from queue
> [   46.621568] spi_master spi0: noqueue transfer failed
> [   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
> [   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110
> 
> Therefore, add GPI DMA controller nodes for qup{0,1,2}, and add DMA
> channels for SPI and I2C, UART is excluded for now, as it does not
> yet support this mode.
> 
> Note that, since there is no public schematic, this configuration
> is derived from Windows drivers. The drivers do not expose any DMA
> channel mask information, so all available channels are enabled.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 368 +++++++++++++++++++++++++
>  1 file changed, 368 insertions(+)
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
 Base: tags/next-20250605 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250605054208.402581-1-mitltlatltl@gmail.com:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dma-controller@800000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dma-controller@900000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dma-controller@a00000 (qcom,sc8280xp-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qcs8300-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sa8775p-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,sm8750-gpi-dma', 'qcom,x1e80100-gpi-dma']
	'qcom,sc8280xp-gpi-dma' is not one of ['qcom,qcs615-gpi-dma', 'qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
	'qcom,sdm845-gpi-dma' was expected
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sc8280xp-gpi-dma', 'qcom,sm6350-gpi-dma']






