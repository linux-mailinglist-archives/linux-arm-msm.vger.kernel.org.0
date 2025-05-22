Return-Path: <linux-arm-msm+bounces-59101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1CAC13C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBCD3A8B30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C82B1F1531;
	Thu, 22 May 2025 18:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeJM/mkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520721E1DF8;
	Thu, 22 May 2025 18:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940044; cv=none; b=tZJkqv0PZZEA/+3umj0VenH00HZej/HBk6PYt5W4gtF1Ahu0z0iXPyePfMpOlsAfuUAzMPiy6NfJmGx1xBX5abm0qpKwJKyk96jpvytqyyKeel8WJm2ykG0D7doCLqj338/ziU5UkDn8N1Bw4EZZwXdbK8xDArpkqnaGdroUXbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940044; c=relaxed/simple;
	bh=clW2vqiYiFBjWyRUAF7Hth/z3VbqElw/vfugjhB8GHo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Hfl0ajWhBbTDvAoK7nqsvnfvwRVsU+kRuBh5ffdLS6qp0wPdVOv92ShbqFzF2U1XMeOXtjdb4gzSFkLei9MTm8e2yk37PI7arNrEAKoX5kfaWzFFzOuZPcxR8bQG/rXQfsQpftCt0JlgYrT4VleS/AQhCNePvz37oB5FlDmjTa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeJM/mkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576F9C4CEEA;
	Thu, 22 May 2025 18:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747940043;
	bh=clW2vqiYiFBjWyRUAF7Hth/z3VbqElw/vfugjhB8GHo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OeJM/mkWVfnMxA/mb4D0M6peO3Nj+y88fTKkoph2V9nuMTtHC5msBUOug0i3N0X4e
	 ujcsNdxtBYzga7Gf9aDJSWfjtWHhEMRsdv1+LIDESsMVDuXLpHhqKaEgXQCBlknN3m
	 cWKoCvmp99db/dbrSL9VZWMTwGMdtiu6ggQl8UYCYdzegEJC+yvQURM5mFDcZKkA5p
	 gU+AxNn9CA9+tECFHKK4LlFBfGy9vrwXdinSOcYIXhAWU6OnTCHlwlovXgkEVlWm7N
	 OKGcTRDFHQgw81EM6LsENXwTp48nLI7GPXzxES7jE8tgQN6aD/DYJK3qARo2iSsbv4
	 l7DQwZHfRfACQ==
Date: Thu, 22 May 2025 13:54:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@quicinc.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 kernel@oss.qualcomm.com
To: Wasim Nazir <quic_wasimn@quicinc.com>
In-Reply-To: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
Message-Id: <174793994066.3440151.12999892547242494508.robh@kernel.org>
Subject: Re: [PATCH v7 0/6] qcom: Add support for IQ-9075-evk board


On Wed, 21 May 2025 19:37:59 +0530, Wasim Nazir wrote:
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
> v7:
>   - Add UFS support along with l4c regulator from [1]
>   - Remove "qcom,qcs9075-som" compatible and keep only SOM dtsi file
>   - Increase camera pil size
>   - Update commit text as per new changes
>   - v6-link: [2]
> 
> [1] https://lore.kernel.org/all/20250513084309.10275-1-quic_sayalil@quicinc.com/
> [2] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/
> 
> Pratyush Brahma (1):
>   arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075
> 
> Rakesh Kota (1):
>   arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
> 
> Sayali Lokhande (1):
>   arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
> 
> Wasim Nazir (3):
>   dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
>   arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
>   arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 +++++++
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 295 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-som.dtsi     |  10 +
>  5 files changed, 426 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> 
> 
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
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
 Base: using specified base-commit 8566fc3b96539e3235909d6bdda198e1282beaed

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250521140807.3837019-1-quic_wasimn@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#






