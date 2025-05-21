Return-Path: <linux-arm-msm+bounces-58883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2BABF243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43F6F3A2E8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FDB1F1302;
	Wed, 21 May 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR//G+ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1184B1E7B;
	Wed, 21 May 2025 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825286; cv=none; b=eBCElib1bZ1/+gnH9ivM9WBBWQUblBLAxO+croGxtd1h7WmcyUzBdKyJdoD+Q2efqTrEsueysf8FQs8GyV14ta9pY8s8qdpxzspcXoI4x0gryU/x8oc1zfPNnVnghnQgYbh2oZgSuSQruYU4HBKNLhMW9/i5Lr2WooNe/oK/NIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825286; c=relaxed/simple;
	bh=r1/Lj3aBtMU6yVgyPDJKVl5vYOZFzl7ANqCIVliCoFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2Shm4Aw3REC/QGKizqzytblYxFCUeE6amfmwL0U7FpMc+ebvEQcsRJoj3ognEl/Rj7ywvH9SQKJqZDYmdJUEB9/sJ0GfWh33gcxVhcGxHFn310wTpy56K+uFUyPceikwZFqluLlKxyBhyQpvpDSn0cDRB8OS3JK4Pk/bzq0TlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR//G+ay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11329C4CEED;
	Wed, 21 May 2025 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747825285;
	bh=r1/Lj3aBtMU6yVgyPDJKVl5vYOZFzl7ANqCIVliCoFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HR//G+ayZ/fHI/yyn+TC97knjRgGdaWgs2GwNlgfKquYDDWWlZhTTV8iY0N7Cxe+G
	 6QElKLXLuBsarxEA/oySb5opjI0WecLjavgxq9JJIJyj2En6GBv52sQruOndlTejp9
	 94VU4S18850jDs0DS6h/TNqMmLgGyFbszooWqxw4F2AuV+tCsDhsEWJAw1AkUdqrIX
	 M98rMv1WFVyMP5FMkF7E4nUamyww/ocajjGDXjT+X+U9sImU1rovrGeokTE7D7Hu3T
	 Tg9ppgkwFpx7dukynX06w/MTqCoT5t+vNX+kj4v5gUnmm89aYjozedQ5IcCckbOQoV
	 X+519zbizVaqQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Connor Abbott <cwabbott0@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 21 May 2025 12:01:17 +0100
Message-Id: <174782058731.37848.9736429299251401095.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 20 May 2025 15:08:53 -0400, Connor Abbott wrote:
> drm/msm uses the stall-on-fault model to record the GPU state on the
> first GPU page fault to help debugging. On systems where the GPU is
> paired with a MMU-500, there were two problems:
> 
> 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
>    resumed, which led to a storm of interrupts until the fault handler
>    was called. If we got unlucky and the fault handler was on the same
>    CPU as the interrupt, there was a deadlock.
> 2. The GPU is capable of generating page faults much faster than we can
>    resume them. GMU (GPU Management Unit) shares the same context bank
>    as the GPU, so if there was a sudden spurt of page faults it would be
>    effectively starved and would trigger a watchdog reset, made even
>    worse because the GPU cannot be reset while there's a pending
>    transaction leaving the GPU permanently wedged.
> 
> [...]

Applied first three SMMU driver changes to iommu (arm/smmu/updates), thanks!

[1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno SMMUv2/MMU500
      https://git.kernel.org/iommu/c/1650620774fa
[2/7] iommu/arm-smmu: Move handing of RESUME to the context fault handler
      https://git.kernel.org/iommu/c/3053a2c5086d
[3/7] iommu/arm-smmu-qcom: Make set_stall work when the device is on
      https://git.kernel.org/iommu/c/70892277ca2d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

