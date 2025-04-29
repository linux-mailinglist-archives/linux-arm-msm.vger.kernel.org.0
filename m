Return-Path: <linux-arm-msm+bounces-56149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB9AA0F55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C18D3A5850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230942192E2;
	Tue, 29 Apr 2025 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eROCJpyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9091218EB0;
	Tue, 29 Apr 2025 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937862; cv=none; b=QfQg2rlpdQijoLd5ROVtZ0hE+iiOYsh+PeQ+nhd8Hm5MwwM5j/zZdrX5Cf9uE+vEPXETuBRlm/dKRdAO49Le6eNlRS5p2ffdv/HJd2oX0guzh4lXLof8CTTkemg2rzjZtAmr9X1XwAQy+WzfrYtfMQAsbLq8DBR8QpxHJ0OCLMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937862; c=relaxed/simple;
	bh=LHVJVK0rbY6GuJWRAkZUQjBOHR1SKdIg9gY/iiK7q28=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QT/Ifex2Xx3VTEDjB+ku4PNvpovKhraNoylPPydhaIoS6XhYNNWfvh8O4B5dLQbD7Hpcv6bWeUZM7oUQyh0h3e2lFJ1Y90RcWIIZ4FBjkvzsdbISX3Zzh2QgiukWP3v77P9yZgCuQMld0R6NESfDOwszgSemzoc45tMWIzdbUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eROCJpyZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD25C4CEE3;
	Tue, 29 Apr 2025 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937861;
	bh=LHVJVK0rbY6GuJWRAkZUQjBOHR1SKdIg9gY/iiK7q28=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eROCJpyZ6M1RRu0FWP6gQWum9pIVYbL7D3H4SwVrn/vlFrOCnLvi2vRd6GL+LTruT
	 OrsA2GLe9B+NOIivQ1cD8CuH+Uu0CfrQYnZY6+nRVJtIFQesD/zjvFj1hdXE4Smm+n
	 x1vf1hIrY0WeJM7uJ11ACLt2t6bBSYzU9eR20XXPTR5lOuAbJpDO6uiU2JeuvPpEBL
	 STceqralhlhi2eJGt2cEUHZ9COKigTXkcSM9Pkp66ntCzCYkbytjmM/gizD8rMUpu2
	 HyH34nDipMDM0JDCUt50pXLNwE0W4huyiXi3W/WPqK+3twNJllyo8TlFtn20kClvRN
	 /9Vkyoo0YNoQw==
Date: Tue, 29 Apr 2025 09:44:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@quicinc.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 kernel@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
In-Reply-To: <20250429054906.113317-1-quic_wasimn@quicinc.com>
References: <20250429054906.113317-1-quic_wasimn@quicinc.com>
Message-Id: <174593770411.4057763.3388930802601980727.robh@kernel.org>
Subject: Re: [PATCH v6 0/4] qcom: Add support for IQ-9075-evk board


On Tue, 29 Apr 2025 11:19:00 +0530, Wasim Nazir wrote:
> This series:
> 
> Add support for Qualcomm's iq9-evk board using QCS9075 SoC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.
> Unlike QCS9100, it doesn't have safety monitoring feature of
> Safety-Island(SAIL) subsystem, which affects thermal management.
> 
> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> does corrective action for each subsystem based on sensor violation
> to comply safety standards. But as QCS9075 is non-safe SoC it requires
> conventional thermal mitigation for thermal management.
> In this series thermal mitigation changes are not included as it needs
> more discussion whether to include the change in DT or in drivers.
> 
> Below are detailed informations on IQ-9075-evk HW:
> ------------------------------------------------------
> QCS9075M SoM is stacked on top of IQ-9075-evk board.
> On top of IQ-9075-evk board additional mezzanine boards can be stacked
> in future.
> IQ-9075-evk is single board supporting these peripherals:
>   - Storage: 2 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>     eMMC on mezzanine card
>   - Audio/Video, Camera & Display ports
>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
>   - Sensors: IMU
>   - PCIe ports
>   - USB & UART ports
> 
> Currently basic features are enabled to support 'boot to shell'.
> 
> ---
> Changelog:
> 
> v6:
>   - Splitting v5 and bringing only rb8/IQ-9075-evk changes.
>   - IQ-9075-evk is the new marketing/product name for RB8 and files are
>     renamed accordingly.
>   - Introduce SoM for qcs9075 SoC.
>   - Introduce Memory map changes for IQ9 boards, currently enabled
>     for qcs9075 based boards only.
>   - Remove l4c regulator as it needs more validation with UFS for
>     over-current check.
>   - Remove thermal mitigation change, needs more discussion for final
>     change.
>   - v5:
>     https://lore.kernel.org/all/20241229152332.3068172-1-quic_wasimn@quicinc.com/
> 
> Pratyush Brahma (1):
>   arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075
> 
> Wasim Nazir (3):
>   dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
>   arm64: dts: qcom: qcs9075: Introduce QCS9075M SOM
>   arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   8 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 108 +++++++
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 268 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-som.dtsi     |  10 +
>  5 files changed, 395 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> 
> 
> base-commit: 33035b665157558254b3c21c3f049fd728e72368
> --
> 2.49.0
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
 Base: using specified base-commit 33035b665157558254b3c21c3f049fd728e72368

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250429054906.113317-1-quic_wasimn@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#






