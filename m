Return-Path: <linux-arm-msm+bounces-59886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E1AC8FAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51113189740B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B3A23505A;
	Fri, 30 May 2025 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhlJJVin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443522F768;
	Fri, 30 May 2025 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609530; cv=none; b=bIa3E8wy8f3rCsCKBOtCfh9vRC8jeqejiNbfPdYqcKBaohAWtvHyE+6Ut+CrOyK9arEZ78mD/rlxFYOXrswfNe0FMF7/rbLSYJFlIXZLVPiM2mTRzuu6LiPkL/hM3+4sIqc3OY0nwgi6Nj4o4RnFughtAr8vo9YM8Ox8gaQYfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609530; c=relaxed/simple;
	bh=vbUIxTpe1zbcbSy7TQWDtXfyWVmK9Ungp1cZ3wVutZI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pQialUIvg4PZhqxcixizXR9BVm9M+t3/knsra+R3c4DTBYMNpTzQCvhamke6fZGOvhX+h4H824fb5Fv2Okxo7OnkhaxG7XqJUBQnL5oJdpjhwtE9L/sumN/ElwE/sYz8ikwk8W+5Ng2p/ziy+NHoPkJu+D9xiboy80M8M4/q5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhlJJVin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B092C4CEE9;
	Fri, 30 May 2025 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748609529;
	bh=vbUIxTpe1zbcbSy7TQWDtXfyWVmK9Ungp1cZ3wVutZI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qhlJJVin5RFa7yO8R5H8UGOT0CkNT7TI6hGOv5mDSz2J6YPbjSXgIiMXFyzCtL9d+
	 +9Pb4pxsu18H8La9IkoO6mDvQMvWTYsoMpAXNofU4zPZ+yVjY2BjupcZ9jAHq1xbve
	 Vlykj+XHRS0hs+Emh0Gq17NjKBofCXrFrpFD8NoaRlT9bcXsJFIJeXvM+yFei2j91E
	 WpiV78+M4fhJ6AxrhGtT2z4dwR7YJtbA/4tlmwrWU6Gp+36wHBnYIBzflT6leEZiHn
	 1i6O3p2aqZJFZi9zTNBiJ+wDPfrcSyPm1PvlVNaWXgljZuYSG26Dr4XkowCCgHxHZk
	 NNPkDBG0ahj/A==
Date: Fri, 30 May 2025 07:52:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com, kernel@quicinc.com, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
In-Reply-To: <20250530092850.631831-1-quic_wasimn@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
Message-Id: <174860938794.1572015.9910193757044372380.robh@kernel.org>
Subject: Re: [PATCH v9 0/4] qcom: Add support for IQ-9075-evk board


On Fri, 30 May 2025 14:58:43 +0530, Wasim Nazir wrote:
> This series:
> 
> Add support for Qualcomm's iq9-evk board using QCS9075 SOC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SOC.
> Unlike QCS9100, it doesn't have safety monitoring feature of
> Safety-Island(SAIL) subsystem, which affects thermal management.
> 
> In QCS9100 SOC, the safety subsystem monitors all thermal sensors and
> does corrective action for each subsystem based on sensor violation
> to comply safety standards. But as QCS9075 is non-safe SOC it requires
> conventional thermal mitigation for thermal management.
> In this series thermal mitigation changes are not included as it needs
> more discussion whether to include the change in DT or in drivers.
> 
> Below are detailed informations on IQ-9075-evk HW:
> ------------------------------------------------------
> QCS9075 SOM is stacked on top of IQ-9075-evk board.
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
> v9:
>   - Retain earlier tags from Rob Herring [1] & Krzysztof Kozlowski [2]
>   - v8-link: [3]
> 
> v8:
>   - Squash UFS support [4] into initial board support patch.
>   - Remove uart10 pinctrl settings from board, it is moved to sa8775p.dtsi.
>   - Arrange ufs nodes in alphabetical order.
>   - v7-link: [5]
> 
> [1] https://lore.kernel.org/all/173142574295.951085.7523517676553074543.robh@kernel.org/
> [2] https://lore.kernel.org/all/20250430-enlightened-enchanted-jellyfish-7049d0@kuoka/
> [3] https://lore.kernel.org/all/20250528122753.3623570-1-quic_wasimn@quicinc.com/
> [4] https://lore.kernel.org/all/20250513084309.10275-1-quic_sayalil@quicinc.com/
> [5] https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/
> 
> 
> Pratyush Brahma (1):
>   arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075
> 
> Wasim Nazir (3):
>   dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
>   arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
>   arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 +++++++
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 289 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-som.dtsi     |  10 +
>  5 files changed, 420 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> 
> 
> base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
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
 Base: using specified base-commit 3be1a7a31fbda82f3604b6c31e4f390110de1b46

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250530092850.631831-1-quic_wasimn@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#






