Return-Path: <linux-arm-msm+bounces-47445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA23A2F33F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7AF51885640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAB6204859;
	Mon, 10 Feb 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcB4rPQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718381F4639;
	Mon, 10 Feb 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204564; cv=none; b=Ep3Svq65cf+gAQQjVqUXmRMP2YXGmNpkzFZQJhtauPme3+OttCD8t6HFvl3raG0hYEoOP0rMBZmxVOhWwKFMNxPrEwLMSB0R+hNLXGpU9d0K/c08mPgUI0J9i8omTcQpsVRKfN0kM56SKx8+xeFM/xBvRgjERjdcWYdsDkorQmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204564; c=relaxed/simple;
	bh=pXGdmhYk7WaHCM2tK0X0wGnl92yW8776DxyCrGx/Ztk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rojCAit+rq0LyamGh1NIj3EMO9nIrNxNlsNORhp1SC5M0fBlA9X6e3fLqxtUgSfugN0btob+8rY+C4CnZ4WQDwkUOW6hnub/QW7I6vLpdxaJ+zdIcMCLhXH5Ju/zFJn/l7n0GViREDp3dmrfX+pYODPRbBsrxktSOx/Qh0dT7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcB4rPQJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3F2C4CEDF;
	Mon, 10 Feb 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204564;
	bh=pXGdmhYk7WaHCM2tK0X0wGnl92yW8776DxyCrGx/Ztk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LcB4rPQJf8t+Qmpl1lCSu8mqCgZpgs6dO7NKfHbQzi1KODyDXNode0Tcy025YxPdK
	 sdH/PvfF69QciIoR2FRa+gl+e+ul28zv7EXb3HhTRVByJPvawsJNwYDlL7MMArKypA
	 pI6k9vcBTO2fV5mgRhj7ZaeHF+3UHjj4dmonsSPYVtPUXEa32dvcjsQJ/oL/3l9W7t
	 b4vXux3x0dhTOnwDh5m+7oGNluH56tgr79G1DNCNJ+jsmJMMWkkZoGuZOytJZE7yFT
	 msWVfoVTpTAKO873s6YLygCwEGg7++/tuTtSn5GWhfH+qAJt15tf8et8Ie+HWOpiuD
	 PCgkg7/qMHwug==
Date: Mon, 10 Feb 2025 10:22:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, devicetree@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
In-Reply-To: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
References: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
Message-Id: <173920411963.477096.6458317590653327676.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe
 controllers


On Sun, 09 Feb 2025 21:09:40 +0530, Manivannan Sadhasivam wrote:
> 'global' IRQ is used to receive vendor specific events from the PCIe
> controller.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250209153940.3489-1-manivannan.sadhasivam@linaro.org:

arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#






