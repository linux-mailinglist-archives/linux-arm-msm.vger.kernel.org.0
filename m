Return-Path: <linux-arm-msm+bounces-41146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 059DC9E9FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 526DA2826A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411E519ADBF;
	Mon,  9 Dec 2024 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2MvmGLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBAC19ABD8;
	Mon,  9 Dec 2024 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772519; cv=none; b=F0TxLMiTSP4P4XoSWMMqysx5H6g/4tNZTkM80HpAmVPA8XXjdIXYt+oVgrlsycLToY9mLiAt5CCaat5XQA4JMcYVmFQKQ3e1wLmrEpZu34IcnTvlsLdnkFlbq7rvyud7na2SgUIhQq8/d/h2AZA8GHY/lnK/A46WBT7tHFuEmQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772519; c=relaxed/simple;
	bh=kxjlHoUo711933mpUTtj0HnQfOHBC8bMLbNiysZH5eM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WU3Tz8geB1EcC6xr76I+OnagP/0NEQHx8io3ZcGu/MdKPhJ8368wUOs1sxzWm3tj+iNiyPdvykFkm667fD0hyOtAx7+qji+kTUIhe9yLXa2iM1jvGXQVk3wR/WwBz9YyYZOIefThvibedQ9XrGkg7HYghj/ua44zNwWkjYAzqOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2MvmGLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01308C4CEE1;
	Mon,  9 Dec 2024 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733772518;
	bh=kxjlHoUo711933mpUTtj0HnQfOHBC8bMLbNiysZH5eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2MvmGLykulGDGK/G8U63UudI02Eo9dORfFP9Gq6kzYwbrfdQCFVsjr6h+In+tgk1
	 rPYNgGvZioTFM0aS7svo0eqs1xcqv5scwPie60SA+g8N+VY6k/8I01fiHo3gqgRkfX
	 sP77RZRHjTfOD9IdjgNrAxxp+X6Y2bAtZJ7i861sb/wIZd659Wc6vYJNGVDq97ToR3
	 GycyST/vZEc8u6aGUMxCvjfKYRMH3x39nvOxyCLMvnz2p6hffssjNAEJ8N8n2/63Ub
	 sBRph9km/lsTiTE1MO3kmpTMmzozbDy7wTBV9/fGf6Qe3X1nJ4mHGw6RgGxfgobTYu
	 y8s3wR+u92n2A==
From: Will Deacon <will@kernel.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robimarko@gmail.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH 0/2] Add support for GPU SMMU on QCS615
Date: Mon,  9 Dec 2024 19:28:26 +0000
Message-Id: <173377165271.3923447.13887093195540246332.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
References: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Nov 2024 13:19:20 +0530, Qingqing Zhou wrote:
> Enable GPU SMMU function on QCS615 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> device tree dependency:
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> 
> gpucc dependency:
> https://lore.kernel.org/all/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
> https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
> 
> [...]

Applied bindings change to will (for-joerg/arm-smmu/bindings), thanks!

[1/2] dt-bindings: arm-smmu: document QCS615 GPU SMMU
      https://git.kernel.org/will/c/d1e22c7145af

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

