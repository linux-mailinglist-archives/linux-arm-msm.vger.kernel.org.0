Return-Path: <linux-arm-msm+bounces-20688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476C8D12C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85BF51C219E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B7813C3D7;
	Tue, 28 May 2024 03:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESkmF3jP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22E18EB8;
	Tue, 28 May 2024 03:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867179; cv=none; b=fhb2CQ4gQSnS79zEMXqlKuIPFTreyR5xDXNoSTFzlmM0hER684M9AjM9JeRPshjuABjrWHg+1AxP6snWuje4m4MjI/SLxmuOpjXOcTp8dTUNPLpxdHvDb7G62AeTdo5Vqao+JsmmAMdEKjOJIA5jHv/9Iimx3ldprneLYum10b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867179; c=relaxed/simple;
	bh=K/dKkVUCW1Ko2qX++OZ/wrP6GisymfeJxvVh1lCuZSA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwgLbEyncj9tixcYi8UYtV5K4sD1Yp8bga/mTfpyo3w9FhNDaC2rl+KAAenKGKTQC7cmuyB0lZIZp+AOy79uDVedNuhgzhVf96rathN0K+iyM9nxdvz7K7LJQ/zc1YgmkZm7YSViX1YMtroM/faR7uud6AbgrOSvV4hx2ukkPDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESkmF3jP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F799C4AF07;
	Tue, 28 May 2024 03:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867179;
	bh=K/dKkVUCW1Ko2qX++OZ/wrP6GisymfeJxvVh1lCuZSA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ESkmF3jPCF3GnUwJZUHzC60RKIcfNsoGa9tHWxglROixfeSaZCIgrigL9fNBIdgdq
	 QFauLNlmIGUp17XpN8c0O4crGgJdxkKE6WWYmd9CqV3q4JiykT43BuojHUkSmtbvpV
	 LZU0CIG3pDMTjkR3MkSQelcjizDSBPKhQUaUobBgBivupvga3Mml8VMvhdIixv8SlG
	 HolRrw8jRJNlw0NxeC9H0JXZsew/H8RdzB9HimiJDiomDIEmZo0iIaqHFzLxKLtRxK
	 ZOxNqD6fVLwpYDqZmoJdr2eTZ5j8D5GE7bMY3IdBJeckQzX3ErXab8YlDG8dcKNZri
	 rp+mu2PDxjzfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] SDM670 shared memory and socinfo
Date: Mon, 27 May 2024 22:32:21 -0500
Message-ID: <171686715143.523693.6811535821413799635.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240524012023.318965-5-mailingradian@gmail.com>
References: <20240524012023.318965-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 21:20:24 -0400, Richard Acayan wrote:
> This adds the smem region to the SDM670 device tree and adds the SDM670
> SoC ID to the socinfo driver. In addition to socinfo, the shared memory
> region is also used for SMP2P and the remote processors, but they are
> not added yet.
> 
> Richard Acayan (3):
>   dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
>   soc: qcom: socinfo: Add SDM670 SoC ID table entry
>   arm64: dts: qcom: sdm670: add smem region
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm670: add smem region
      commit: 265d9989df5012adc5bec8e894dff0572c195a0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

