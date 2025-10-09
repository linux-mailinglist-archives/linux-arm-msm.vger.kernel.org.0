Return-Path: <linux-arm-msm+bounces-76748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E06BCB024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 00:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2FE48032B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 22:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E374284693;
	Thu,  9 Oct 2025 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geM3ZBad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3E283FFD;
	Thu,  9 Oct 2025 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047423; cv=none; b=dtuPtHrcgm04lZFsI+12aK7tHKIhuzgLrIUFQHdeloWFHH6j7hTur0wrNyA/TKrcw8LXbIUo7XTcV8YxoyK9z0yE7zKjoIuUH0QYSVK0atWowML3rR+aWnPd/HIFnp/YfMpRhvluEGyC5a0+x/oNYwa/myTOOpYI5IlbNJhmneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047423; c=relaxed/simple;
	bh=Naant3+DVN5aKIknLH/h0l05Wkcr6CNf2egBKXHt1Fg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RudETkvBQPaLSXb63wH/LJZDZGOK17qedXx70bBYi4HgvZMLg2NcoUx/4gJHjtP+VnOuW3KRRa7N/rjFLk9iOCECeLaaw3DrgZU8BveuxKQBejbwnf1IbDLFMqyRj54rW1iucUHk0OWSR2sI2+TWhf0wGuNDuhCnCRKkTT2TOCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geM3ZBad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A45C4CEF5;
	Thu,  9 Oct 2025 22:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760047423;
	bh=Naant3+DVN5aKIknLH/h0l05Wkcr6CNf2egBKXHt1Fg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=geM3ZBadakY68lqNrnzv2rvFUGrTp0gdXIY7QM5cMcViEKc2X/47wLd+rTcaqOaUi
	 5II/k3kEOnQJXoXcbgTq6b+2K9c/TKHZKITdwotshVDYFbaP9545ZATnoBapwXHZjL
	 uF9qmjH7G5SfnFINnvUYwE7BFwF2Ipy3MdVIpWmQ03XcJf5HTbUc6N4PAxikRcVCz4
	 8nHAE4Y3H64dwhosJn1ScPVrRZo4v4AA5t9cYm1At0G00BI5mDQltr9QFnMNKeCmfu
	 YsaH5XQtGXkmBjpDwrVhndqOXaO+R6cIF81aPU1QOCsw1UF23aghSvLNYkFmUSrxuZ
	 Zq6YtJOMmxz2Q==
Date: Thu, 09 Oct 2025 17:03:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <20251008182106.217340-1-xerikasxx@gmail.com>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
Message-Id: <176004726783.3398685.3709173362814048798.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: msm8939-asus-z00t: add
 initial device tree


On Wed, 08 Oct 2025 21:20:18 +0300, Erikas Bitovtas wrote:
> This dts adds support for Asus ZenFone 2 Laser/Selfie (1080p) smartphone released in 2015.
> 
> Add an initial device tree support for Z00T with support for:
> - GPIO keys
> - SDHCI (Internal and external storage)
> - WCNSS (WiFi/BT)
> - Sensors (accelerometer and magnetometer)
> - Touchscreen
> - Audio input and output
> - Vibrator
> ---
> Changes in v2:
> - added customary newline before 'status' properties
> - removed odd newlines in pin configuration nodes
> - reordered pin configuration nodes by their 'pins' properties
> Link to v1: https://lore.kernel.org/linux-arm-msm/20250930132556.266434-1-xerikasxx@gmail.com/
> 
> Erikas Bitovtas (2):
>   dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
>   arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 256 ++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> 
> --
> 2.51.0
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
 Base: remotes/arm-soc/qcom/dt64-51-gc11645afb0e2 (best guess, 1/2 blobs matched)
 Base: remotes/arm-soc/qcom/dt64-51-gc11645afb0e2 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251008182106.217340-1-xerikasxx@gmail.com:

arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dtb: iommu@1f08000 (qcom,msm8916-iommu): clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dtb: iommu@1f08000 (qcom,msm8916-iommu): clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#






