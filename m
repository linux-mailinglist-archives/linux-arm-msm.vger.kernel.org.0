Return-Path: <linux-arm-msm+bounces-87467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A63CF40C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F374A303507A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E7B2F5A10;
	Mon,  5 Jan 2026 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGHcmXje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E325A359;
	Mon,  5 Jan 2026 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622080; cv=none; b=A9cOgd3b4KGkn8rGCBMvtfR/mAY0Ti67uuPcB+4d6FEF7yNt7lkxv72z0gKHY38SiyAeHkrqf70doldXC9GgYQ1ccndDLXXgX2Fi6dX971A35cBkhFR82uIjx9nO7ae4wYocjdTf4eutUkljqVAId8SXE6V+hcUBNm3Bpi4uxew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622080; c=relaxed/simple;
	bh=J2xKr+Z+bwBWGq1zdULnSjAKfR1Mlx4TuyXjwav/Dc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahBbynl3yeBfKrvh4Hwyk5k8+/VqupWSlD2+he/PbS674NX7VwhLzHSy+rVkM+ffEfpDXM6YxSukVGv9RrNV9TeUtMjSCAJbvpxciAJdCwPTRN2TD1dw2twR0gPYFSqJyhPKOIwCez4ylLDVrIl4dpBHan4EZGMpR5mO3J4sRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGHcmXje; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB85FC116D0;
	Mon,  5 Jan 2026 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622080;
	bh=J2xKr+Z+bwBWGq1zdULnSjAKfR1Mlx4TuyXjwav/Dc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGHcmXje8eEtXueVsvAjprq+dTmtM+B6wTUVOYY/nsrS/B6QqQoWu+F3btRn6qpDR
	 LMkl/DpMEyujM15tNbDmH+CrrWxjd8vElq1M9cfoq+HCNYzC5UO7p2yvNI3LR0z8aa
	 /9R6ra6tV4NS2U5pcjfp1B5pNkucvK2pHvCcH9GQFoS1u+tLZCoXTjXYqR9QW17Vtv
	 flwfVfQSNywAOmVIqu2fHB8VPtmtfxGALS8D4AKjVFhFLV96RrRnfkYXY8jjTON2jX
	 OWGu77UHa0Q8lHXHSsFbyAR6jjWkIN+hT5ekurlayENfAs498DIN0SAVeqm8ApoGPO
	 fwQSq8R/+8FAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Regulator adjustments for OnePlus 6 and 6T
Date: Mon,  5 Jan 2026 08:07:14 -0600
Message-ID: <176762206411.2923194.1176119791295581298.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Nov 2025 15:52:24 +0100, David Heidelberg wrote:
> Small regulators adjustments, tested on sdm845-mainline and sdm845-next
> tree with recently fixed (6) and upstreamed (6T) drivers.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
      commit: c9b98b9dad9749bf2eb7336a6fca31a6af1039d7
[2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator always on
      commit: 45d1f42d3e84b5880cf9fab1eb24a7818320eeb7
[3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on
      commit: ad33ee060be46794a03d033894c9db3a9d6c1a0f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

