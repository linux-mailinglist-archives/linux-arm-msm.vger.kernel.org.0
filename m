Return-Path: <linux-arm-msm+bounces-68587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B562FB21929
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2086846291A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A126E261593;
	Mon, 11 Aug 2025 23:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxKKFoph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D93255E34;
	Mon, 11 Aug 2025 23:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954839; cv=none; b=HAyOuao66erJOWkvcG5x2t2AdvHwP2/d9+gexZhgRMmGFHKPrwdsUSl+vewS5Gg5SJN71niyPnHREtArBdeeTIxgczCm6pL8n7uu0p6NRYkM84bQH20Lb4uGsHBX8Eens89LurEfzjYEvkGuDKXGq6cDxco3ifSuQ4d3gMIxDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954839; c=relaxed/simple;
	bh=oEKIeomaSLSmtb9O+c6vF8ODZah1fEMj2JS83zzAivQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ub4NpgyAAn2iuhMdzlEYDW90s6vVApyyeDVRFLIYFcWR+LK+3BDmYAXTM6Hy+824LGtrM0sSIHd6EOEBv0HhfFQwZOLAsgAd9zPDV3xky557011c4ynSEbUpJlZkhcHYsYED1lg/KYffgr/C2BrFde96Imb+Uw5KQCYpvK1seeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxKKFoph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C94C4CEED;
	Mon, 11 Aug 2025 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954839;
	bh=oEKIeomaSLSmtb9O+c6vF8ODZah1fEMj2JS83zzAivQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YxKKFophfNKsCis96v2TvoKgAxJ8+nIXOxcVQP+MYFENjvBPX44HTZQO6F/maNMJH
	 yuX+GA248dEI7XTKQ8Sw1CNycBBCNEWPiabM1U2Yupe3YtzSLMvTJHEKYaLmpijMRg
	 aWYekWA0lZc+uq6zQZTvp5LrcEez/h50/rTsCUJy6VrOmKwil/mIDrLZYKgKjpxAMi
	 bdu6BYG1uLtsjyi5jysGN20ZWaQ1cnkmqrdBSiiuZ3DMQg92TNAJtCD62MldCi3FNi
	 LGQp/WK9uIh44wOhPlUrOc5RQh7JoiB0oCwcUpu3JNFEtAphjLuaf9VsoXrHVqNnO4
	 Cuom2gBvMBR8w==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Retire SDM845-cheza devboards
Date: Mon, 11 Aug 2025 18:26:55 -0500
Message-ID: <175495482455.157244.15046215797350240153.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Jul 2025 12:16:06 +0200, Konrad Dybcio wrote:
> Cheza was a prototype class of boards, based on the 2017 SDM845 SoC,
> used for bringing up ChromiumOS on Snapdragon platforms.
> 
> Today, almost none are left in existence, and the small amount of
> remaining ones don't get any real use.
> 
> To ease maintenance burden, remove it from the kernel tree.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: Remove sdm845-cheza boards
      commit: 5e4ca587f56319c3c9800b9d1a97443b9c364a15
[2/4] dt-bindings: arm: qcom: Remove sdm845-cheza
      commit: bae72efa3ca6674ff99668b00290376babae10f5
[3/4] dt-bindings: arm-smmu: Remove sdm845-cheza specific entry
      (no commit info)
[4/4] MAINTAINERS: Remove sdm845-cheza device trees
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

