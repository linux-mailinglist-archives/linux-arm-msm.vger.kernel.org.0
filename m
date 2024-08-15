Return-Path: <linux-arm-msm+bounces-28684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F25953BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7221F22CD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD2A15B0FF;
	Thu, 15 Aug 2024 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDRocSpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D114D44D;
	Thu, 15 Aug 2024 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754475; cv=none; b=aJyIR46JdLF9zVnOpfxneMmIY8EFskrszTeQv6RbXuTF4vxqqW7CQjwweq2Ic5EXmCxDLB4zTZB/Yfv0MijIbZEP0MBOW+sX1Xb44buiaaUec2r9KAkyw2d0C80P/0ECFdsPSM9eM+WAiD5IGTjXew4DQQY9bN71I9/8Afo5k8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754475; c=relaxed/simple;
	bh=T7q/smXZH5rvp62B7kvBIzUSFOd2b0oNYWH7p7+Ml9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVLbtDuFldIG8DRugNBoY0xEPqeBc1MXUkCNcCdZyX1m7i0M8Wh9p6QoTDqoBvmPPEHPlC2ftaUXSSili1cVuhrrJ45mlzQrHU7yIHEeK/kpWu4vg8RdTzPNiAdsrzqAj7jpjQ25GtDxNi9iFXsIIHV5CYHZtfQL8yh4rnmyXa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDRocSpp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5692FC32786;
	Thu, 15 Aug 2024 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754475;
	bh=T7q/smXZH5rvp62B7kvBIzUSFOd2b0oNYWH7p7+Ml9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDRocSppYqDmppVB1rnt5ZhuvpSHKyLIdYKPut8PkmHzx5QccXzfOMpzCS6wR66di
	 /JyyN0FdFotpBdSHimcoogX6PUOpyihDbXutoCBP6cWdjTmZMFLWD7AEQ/oiFec3Xl
	 S1BGHnIc88SRSdB1VwilePMFrqIgkiOyPhLxSFp1X/XhcH4xYXuNdPVlCYNi6evGTR
	 +b7yYWrSTUPA2E966VRuPfg3awXJ17V0Gyw5sR/AZGbPt2c31PNCIkpkF4zDrxF20K
	 haqL/QsxUGiR8Azl5sSyDHQB19cYG0WQ0BDfDK+AIw39I4hEx570KZvlMi2B9l+rY0
	 NXzCny10rbGxg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	"Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree
Date: Thu, 15 Aug 2024 15:40:30 -0500
Message-ID: <172375444825.1011236.8152323041465572346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804065854.42437-1-linmengbo06890@proton.me>
References: <20240804065854.42437-1-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Aug 2024 06:59:06 +0000, Lin, Meng-Bo wrote:
> The dts and dtsi add support for msm8916 variant of Samsung Galaxy J3
> SM-J320YZ smartphone released in 2016.
> 
> Add a device tree for SM-J320YZ with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART (on USB connector via the SM5703 MUIC)
> - WCNSS (WiFi/BT)
> - Regulators
> - QDSP6 audio
> - Speaker/earpiece/headphones/microphones via digital/analog codec in
>   MSM8916/PM8916
> - WWAN Internet via BAM-DMUX
> - Touchscreen
> - Accelerometer
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: qcom: Document samsung,j3ltetw
      commit: c17427c6ca5e0f7c5d1f9bd9c951cb6827c8c228
[2/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree
      commit: 469fc2e7a995ade8b929c4e2a32c93a231a3844f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

