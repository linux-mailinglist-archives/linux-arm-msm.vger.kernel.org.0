Return-Path: <linux-arm-msm+bounces-83117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F389C82484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 20:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A5D3AE056
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 19:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4F12DC76E;
	Mon, 24 Nov 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbS4fgbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0E2DC765;
	Mon, 24 Nov 2025 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011932; cv=none; b=D0qMzPF1n/hq53x40Km4Xd6th/11NXVS5kk1lm5k78/2u549idhBMKq2xAZhx8RTHPE/md36wURkhAhd3l055eZt40HRmi/xqKZ4sVJ0tgYce6eM4sz4eM4wOJ982ZqYp7HQkc9k+m5DTw3AfBI/zHbCy5Vvm71z4ATxfaVOTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011932; c=relaxed/simple;
	bh=+Y/rUKkCu/Mru/4AM146q7ufP02f6yIOrug7Q4idQeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RAM/f5KOy7RNPABlVmmGm5A5HsRZI6iwkJoCOmadY763uX5zY0FQ3+8oE3qxsp0hDCdcJSr+DiKfT16swaoE2Mh2Y0R7OpMGQHqfA5KomvruMiABhG/iEefXWJdlrctDfcCTeHlnaJHoK8wj3nF3cHWsXym2m1hkZkJq1FOQXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbS4fgbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C234C4CEF1;
	Mon, 24 Nov 2025 19:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011931;
	bh=+Y/rUKkCu/Mru/4AM146q7ufP02f6yIOrug7Q4idQeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gbS4fgbFVbSkJAETFQ0fD4yylSWtu1g5HHFepTXrzFN7o5aYFpbtSiXBPKnp8t74K
	 470zZrbFnBNqv5Jv9VDylyLcBqu02GUXVJduoQk0xreg19zJcP45rhEpzssHs+AuVl
	 7vGLouIeatGUIUMeqbeytYqljMfvuqP3nCkJHu3Msggvx2PCMe3ar0I+bjpe0LhUPz
	 IroNc08252IK4BfTRUKefy/OY0XJhYdKVj0wPIOudOsk/Xq6EVoSm0ukv0qsQQ0IcR
	 9rFkyF4k/4EhppRjkdJZfi8rNaTx71gLmO9h3ZzBt2NbWpOeTv56JntsTwG3xyaJ7q
	 DG4bUezbQUbUg==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Date: Mon, 24 Nov 2025 19:18:32 +0000
Message-Id: <176400331869.702885.5460533582186170525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251104-topic-qciommu_bindings_fix-v3-1-09c52a1e5ffb@oss.qualcomm.com>
References: <20251104-topic-qciommu_bindings_fix-v3-1-09c52a1e5ffb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 04 Nov 2025 15:47:26 +0100, Konrad Dybcio wrote:
> Some IOMMUs on some platforms (there doesn't seem to be a good denominator
> for this) require the presence of a third clock, specifically relating
> to the instance's Translation Buffer Unit (TBU).
> 
> Stephan Gerhold noted [1] that according to Qualcomm Snapdragon 410E
> Processor (APQ8016E) Technical Reference Manual, SMMU chapter, section
> "8.8.3.1.2 Clock gating", which reads:
> 
> [...]

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
      https://git.kernel.org/iommu/c/fe6262910cd3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

