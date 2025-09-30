Return-Path: <linux-arm-msm+bounces-75603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED1BAD375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3086C17867D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6298F2F3636;
	Tue, 30 Sep 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzyJ/aCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B2238C1A;
	Tue, 30 Sep 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759243192; cv=none; b=ECcX/XmOXr/ulLahC/AXkUQUsrZgxM0f3jOsqkjRWjNbQ8JwRAk7J3Dhp80Z2y9xjebAM9Z2XYPUhGA/dn8neLq1Xhz7Xl/JPHj+HE/pn/be2vTw2PABfpViK7zB+twReE/HbB/PKxeaGjA0OmIU9B55f0mpEvW0yJyXkBCixWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759243192; c=relaxed/simple;
	bh=ihFaXtdVVUlUG7hfw3rHQjCICd3rBzbwQLJxeFRX17s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qfvDOnW5dFMKl6nJDVcZvfp1rZwzb3uvDtprfgtgp/n5CNJ4RLWF2CLAQ2ff0iFZBvvtFYhJVBGlumUkZdet6HZuQYd/OajoDjoEIFXV+DFPW5J22ZJDBrIJyo80r+ODKpE2QIX5Z3pcQX80ptnrEXak8DFZtrmSwMEDDNc+LCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzyJ/aCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A295AC4CEF0;
	Tue, 30 Sep 2025 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759243192;
	bh=ihFaXtdVVUlUG7hfw3rHQjCICd3rBzbwQLJxeFRX17s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PzyJ/aCjGV1W79pflJ+lkRmt5RjH/TFLxI0Qpe/5Z9bV1z6hw1qoDgN0qtJ4PRLe8
	 1r0+HsWo4VTPBhju0pYfxLJ/fFDHEvKLvimcAgisNHsrmJAbgcooYq61Esv1IVRM6y
	 rVDupy4a1z6iJT+s/H8VnJ5154eMHpdgepGskcsnUZXGrFQ3OzLuLSUSzG+wBUX7Ym
	 lTAVCAH4xxGqopdkTAFsSa/atVj4rESvUjEDyAPm9A/LSo6GqQm8HIWU3iXb0Iz5Rc
	 D8VoF0exySAhQB3H5GbIwS8pqrymdAkCpGHTdl2P2d1b3hq/DVsIeTAz9fhc4EV+Mf
	 ZzEmwbkHgIFAA==
Date: Tue, 30 Sep 2025 09:39:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <20250930132556.266434-1-xerikasxx@gmail.com>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
Message-Id: <175924309102.2873936.15229478304818862622.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree


On Tue, 30 Sep 2025 16:20:08 +0300, Erikas Bitovtas wrote:
> This dts adds support for Asus ZenFone 2 Laser/Selfie (1080p) smartphone
> released in 2015.
> 
> Add an initial device tree support for Z00T with support for:
> - GPIO keys
> - SDHCI (Internal and external storage)
> - WCNSS (WiFi/BT)
> - Sensors (accelerometer and magnetometer)
> - Touchscreen
> - Audio input and output
> - Vibrator
> 
> Erikas Bitovtas (2):
>   dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
>   arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 255 ++++++++++++++++++
>  3 files changed, 257 insertions(+)
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
 Base: tags/next-20250929 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250930132556.266434-1-xerikasxx@gmail.com:

arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dtb: iommu@1f08000 (qcom,msm8916-iommu): clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dtb: iommu@1f08000 (qcom,msm8916-iommu): clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#






