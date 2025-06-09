Return-Path: <linux-arm-msm+bounces-60660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95CAD21E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3613B4220
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E47219A8C;
	Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUyftA65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E75219A71;
	Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481273; cv=none; b=gogxBjISwZ1v1OJ9ruty5ipCf5swjCPV7zCHMXsfNM7mtmxSn1df47Q3dlMORSp+trzTwnDDaodTENAu0K2YXbkM30WIRViYiEkanlXmcF7ancud0YiQzAELCSR3it/8GEpQEcF4BCarDvtBRKg7f324/Vxnd32zLvVVh+YOu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481273; c=relaxed/simple;
	bh=49cU8Ts94cgb4QkrriKDZFEwuDxhQXvYqP0FbuF4YZQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q76gCHwXWZHEUg8W1CNT9sRjehFQf+kS0bYUYyOwywVgrosSO3bxz/nM36DPBdqbYhESAfgPIqYZJ942j+5q6pPQcut3ku3P8iTNPsPQu0/WAylT3xMbX+6wlXpVYnasf9rj5mYlK40q+lBqvrsk/dgOgRVwmyGAIXjmdIe+qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUyftA65; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332ABC4CEED;
	Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481273;
	bh=49cU8Ts94cgb4QkrriKDZFEwuDxhQXvYqP0FbuF4YZQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pUyftA65BFa7f/aOR3L+uaX+HTauesh20t2Rq7zturUKTtFX0ptHSDOMnDf/100Q+
	 QcTyTIQyuostNjRegk4soHMyzDRavWRNsYNaV6LrNvbTwAB41Yss5dLQgQC7nA0fGe
	 ZQxSFTQmuDg3M3Kmjwj3nD8O/pg9VfbqNhyqc+mVSfuiqjFmPFha940csLTM9mD0TM
	 r2EDzqVF4UgPMBsZ2msvMtuo4z382SszHx4EG9CdoyYDF+6sL+ksgeZ/o7+KLiYXGB
	 7ehe5kT5cEeFpr3HvthoR70OD2nSYeYR/NXollVQCI1GxYNLNSOc66ApvHfojq/zLM
	 OxnxR+j3tZBSA==
Date: Mon, 09 Jun 2025 10:01:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Message-Id: <174948104999.2282575.3222487103979882730.robh@kernel.org>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU


On Sat, 07 Jun 2025 19:44:58 +0530, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
> 
> Tested Glmark & Vkmark on Debian Gnome desktop.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
> 
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
> 
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
 Base: using specified base-commit b3bded85d838336326ce78e394e7818445e11f20

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: opp-table (operating-points-v2-adreno): 'opp-666000000-0', 'opp-666000000-1' do not match any of the regexes: '^opp-[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#






