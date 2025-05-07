Return-Path: <linux-arm-msm+bounces-57056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19716AAD548
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBD0F7B6A61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E531DF25D;
	Wed,  7 May 2025 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0m7sAq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5931D618E;
	Wed,  7 May 2025 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595975; cv=none; b=WKmaHpWyOCKFMhnGKBA/oUpsiwznHm7X2WPm054dLXKicSPBsDINbdPganIzZHSFWXzz4t1p5DLpdY6nz1bDkLW9c3O6V4rmdO5QnV0/72oI0YKLa34401mqyeT5ZLL85r6AmiR5fftVCFWuSeM3OFUzIb4P7hYLUSRdIerGB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595975; c=relaxed/simple;
	bh=bjgQjoGWDlMiHE9WoqyOdnPxls//ZasLUweveRIFQUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apYsVuxHlZi+L2OmPSJVvbI+jumT63u7xuK8Hj+p5BHAduaBaxilXFt32E0uGUBQqEFp5rlkTTzoFf3rjGcHFQOXpB7hKPV6qYY6Sl2rkllKE4DR8SEo+RCUiJkHhxmF1PrukUgpK2B6da7J8GN4y2LI3EshMG5XUfaKhkBJ3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0m7sAq/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457F2C4CEE7;
	Wed,  7 May 2025 05:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595975;
	bh=bjgQjoGWDlMiHE9WoqyOdnPxls//ZasLUweveRIFQUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q0m7sAq/goUZtQoavLIPgeAmAbZuI84z+TwTrR1JgyiybFg+EBxEhU32nrnT0D20w
	 GbNXnTejNiV5W28uFTmGh9cTTFFJ5mxoLkn/LOGy6jkDZGOtVLwGdHEQxSPDZyv4ih
	 CCxqxn8IjgaB8AnT1BWKIX5NA7CJNjNci5wBAWFeSq2U24IqrywJY8nF/q8t1ZC/En
	 psVaDHZ+YC3atgoB9CHVg2A6wmAs06yIGVoSFpZs8qJyG1ynvcBa+8LZTborLjFHq/
	 6vYQ9SAXStZuDsuxtZFoLNWOzbAq3UHVgSAIEuGBBOFfYP9BSmYU7b7+Eg6Ktt+cwZ
	 OyCNc41n3cQGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Nikita Travkin <nikita@trvn.ru>
Cc: Marc Zyngier <maz@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: Add EL2 overlays for WoA devices
Date: Tue,  6 May 2025 22:32:52 -0700
Message-ID: <174659597008.7675.2301017495937908497.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
References: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 May 2025 15:39:27 +0500, Nikita Travkin wrote:
> WoA devices use firmware very similar to android, which means that Linux
> has to run in EL1 due to the presence of Qualcomm's hypervisor (QHEE or
> Gunyah). However Windows can replace that hypervisor using Secure-Launch
> flow.
> 
> More recently the same approach became possible to be used to boot Linux
> in EL2 on those devices, thanks to a tool called slbounce[1].
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sc7180: Add EL2 overlay for WoA devices
      commit: 0d95f64be4176fc98bcc2b4558239800ee93bf32
[2/5] arm64: dts: qcom: sc8280xp: Add PCIe IOMMU
      commit: 8a401135001c65203f3fd210d482bc7eae1bfc56
[3/5] arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
      commit: 263780f3189730f2efa511181c3970384e54afde
[4/5] arm64: dts: qcom: x1e80100: Add PCIe IOMMU
      commit: 428f95f41f3024a8378bb4c4803fe269fcacaa85
[5/5] arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA devices
      commit: e01acd8f3cc1364b9147d3eb8913fdb935851ecd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

