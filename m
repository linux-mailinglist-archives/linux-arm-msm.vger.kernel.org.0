Return-Path: <linux-arm-msm+bounces-70957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B958FB37572
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77F342A8602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 23:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F40306D2B;
	Tue, 26 Aug 2025 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9HqCg/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6C305E24;
	Tue, 26 Aug 2025 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756250387; cv=none; b=aGUtunq84AcAEli8/n38Oc5gCvyXFLE7D9hGynq3fZoHcgH1tisikjCDsvDWgpV25jSNftTkgvpJ6XryvEgX8yrY4FpvCot2kOO3CZOjBt5DKS/fzFXJzVtfJCMpbKe49wWyaR8Q0cxe6yamAUgw7kd7qksrGdW1Tpxxo7QsN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756250387; c=relaxed/simple;
	bh=zLh8WizEEOD2O7XSqtpVeM4YMDdo/7PIjzbYqeNimzY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Lbdd2v+LdYMuQFWRRVN5rkhYzDS9tuTm2m6VGJd1WyNeKMpNzIAXxQYjcMDGB23mmLTvcRT0/L9wkc/yTKjv0FNDOr29Pij35g+qeCKw9ok19FwIgq+foppdvuazdRWoRc1Si+9CVUtrkiIdl9pSxe2/+msNjMu1l+z43HnNKGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9HqCg/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95708C4AF0C;
	Tue, 26 Aug 2025 23:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756250387;
	bh=zLh8WizEEOD2O7XSqtpVeM4YMDdo/7PIjzbYqeNimzY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c9HqCg/YkJuVZhtoh9ZY3su6EnYr8ZO7arMD1izYLBdxkShCC5i/mNMHmC0RZQzBd
	 r6LvqvXVLfCSofbgsYgHy6Rowi0EsSQXwzrq3x21Mgq+GbDWDb57m7zFaKJDe4bKfm
	 B/9hKF4V5GKL1l5OEwex+apFf+jYnSYEOEVDdNkuzC8UtUFuaoyaQdpg27R4W1p9cI
	 krC3HZtOL8+i1jQhTcg8hJqb7sfmzJzV5S8tYu1ueOAeOUyvp14eVBScasWxuEuHJV
	 3Z+shw+l/9ABZ7Py/LS7ieBjqk9HxSdWy32eX5TPm6nTFvNRpXbgn8mcATBE3J2S0y
	 iBnpM1dIkz9qg==
Date: Tue, 26 Aug 2025 18:19:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
 Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, 
 Vishal Kumar Pal <quic_vispal@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, netdev@vger.kernel.org, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Sushrut Shree Trivedi <quic_sushruts@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Monish Chunara <quic_mchunara@quicinc.com>, kernel@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
In-Reply-To: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
Message-Id: <175625023137.716456.17233441178355576969.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: qcom: lemans-evk: Extend board support
 for additional peripherals


On Tue, 26 Aug 2025 23:50:59 +0530, Wasim Nazir wrote:
> This series extend support for additional peripherals on the Qualcomm
> Lemans EVK board to enhance overall hardware functionality.
> 
> It includes:
>   - New peripherals like:
>     - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
>       for peripheral communication.
>     - PCIe HW with required regulators and PHYs.
>     - I2C based devices like GPIO I/O expander and EEPROM.
>     - USB0 controller in device mode.
>     - Remoteproc subsystems for supported DSPs.
>     - Qca8081 2.5G Ethernet PHY.
>     - Iris video decoder.
>     - SD card support on SDHC v5.
>   - Audio change [1] to support capture and playback on I2S.
> 
> Dependency:
>   - Revert commit b5323835f050 ("OPP: Reorganize _opp_table_find_key()") to
>     avoid regression introduced in linux-next (20250825).
>   - This series depends on the removal of partial changes from patch [2],
>     which are now part of the above commit and are causing boot failures as
>     described in [3].
>   - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
>     which ethernet will not work.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/aKyS0RGZX4bxbjDj@hu-wasimn-hyd.qualcomm.com/
> 
> ---
> Mohammad Rafi Shaik (2):
>       arm64: dts: qcom: lemans: Add gpr node
>       arm64: dts: qcom: lemans-evk: Add sound card
> 
> Monish Chunara (2):
>       dt-bindings: mmc: sdhci-msm: Document the Lemans compatible
>       arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
> 
> Wasim Nazir (1):
>       arm64: dts: qcom: lemans-evk: Extend peripheral and subsystem support
> 
>  .../devicetree/bindings/mmc/sdhci-msm.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/lemans-evk.dts            | 439 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi               | 124 ++++++
>  3 files changed, 564 insertions(+)
> ---
> base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
> change-id: 20250814-lemans-evk-bu-ec015ce4080e
> 
> Best regards,
> --
> Wasim Nazir <wasim.nazir@oss.qualcomm.com>
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
 Base: using specified base-commit d0630b758e593506126e8eda6c3d56097d1847c5

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#






