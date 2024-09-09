Return-Path: <linux-arm-msm+bounces-31358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D0F971EE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 18:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA220285837
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708C413A879;
	Mon,  9 Sep 2024 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1Il1hia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF27C156;
	Mon,  9 Sep 2024 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898563; cv=none; b=Xh/e5DzdqgF3OMYb09TVefZfDYTvwo/O9MHRKduNtBsU/JCRmgMIuk0sQTrDz5iMuztHr3r0DYakvBo1he7k2Pus+yP1ij2ki7ee/oVQhNckf9V6Xef4MDSsJ2ZO1MSFUpDf2UcjkOXU5MBBw3rkEnzYJYRm0EqlyC4hHlVyANs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898563; c=relaxed/simple;
	bh=Ls7yNYiJTmMO2LUOs5edmUDMG2W06CnY5cBWHeqDVh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hmGVIzVPU7DXJnwx5UIi+UHFYn5pAPkdGnWrg2AcM/Yg8b4SvMWd8Uh+WOh+8E8Rc+2wD2MPAKsknS9O278j0a+ii/RiXBGP9pP8XR/q9SX+Q3sBiE1b6DwYDHH87elgS1ZFeaaAPwdtXIuaGq65XVW+GnquBlNVyWpn6Xq4Zzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1Il1hia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAABC4CEC5;
	Mon,  9 Sep 2024 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725898562;
	bh=Ls7yNYiJTmMO2LUOs5edmUDMG2W06CnY5cBWHeqDVh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1Il1hiaDR85pEccsSxKJx4hwcoizwSgnKS/STKWucygQg3CRqCAoVLH0KGEPT0ot
	 /k+T8Ed20mV46zrf5iBAm31+kQfMLeaiqFSRz2Rk60P5RYZe7k8djYPSjbLA5XC+0d
	 LrFVap4Kyrf/avuR0ABliJ4fEI8YZbmrXVJ3u1rav+SY3m5sEstYHZ7al1eWVPw8fV
	 c50JhN8Or5dtRjg0WVd3TcaANC4hfy8SuWhi4dLSSLM0foi9+jxq6Zrkj2fKbN3R8W
	 U0jV2L1RBKdlTmXIsRJzFzm5mtWM3VKILKlPJzA0keX7u1sR+X2J/9tQx3iHz9rJl/
	 s2PPsi2mfaTnw==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 0/7] arm64: qcom: sda660-ifc6560: enable GPU and WiFi support
Date: Mon,  9 Sep 2024 17:15:44 +0100
Message-Id: <172589162139.2623853.11488233830217103643.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 07 Sep 2024 21:48:11 +0300, Dmitry Baryshkov wrote:
> Follow the MSM8998 example and limit num_context_banks on SDM630 /
> SDM660 platforms. This allows Linux to make use of the A2NOC and KGSL
> SMMU, making it possible to enable GPU and WiFi on those platforms, and,
> in particular, Inforce IFC6560 SBC.
> 
> Note, while WiFI starts up and can work for a short amount of time, MSS
> starts crashing with the following message:
> 
> [...]

Applied SMMU driver change to will (for-joerg/arm-smmu/updates), thanks!

[1/7] iommu/arm-smmu-qcom: apply num_context_bank fixes for SDM630 / SDM660
      https://git.kernel.org/will/c/19eb465c969f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

