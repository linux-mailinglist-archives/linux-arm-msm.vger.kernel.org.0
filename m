Return-Path: <linux-arm-msm+bounces-58723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A70ABDC89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA0D1BA26D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B495E25393D;
	Tue, 20 May 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xoe6kfQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBC12512E9;
	Tue, 20 May 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750743; cv=none; b=RODTIFMl0PuFbHg50WYsf45wB/lKJh+bV98z6Pv7s2RSy7Qrz/Nw2fgwzNpRcTPMocrDxHOXFNloka64mrP80XtGSLlnaaj7HpzGmI1iW9/IMbw9ifsSPMSgPYsxbQsYv1ZuDdWKdZlAOh2+BbtRVtpgfYhpvAYhQCfCtVHV+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750743; c=relaxed/simple;
	bh=PImC0z23eYKw/vXRVR7ONqgOkNS50/feSR50iDqb2S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqb0gfMhuvgq/9owTWacSEoHXI/k9tz+Dc/lkH2mU1xcqqXlbApjlQe7T4zcm0gs95WSObEScZ3qnitpt+eVqL+Wy+jWfaepDrq4+O71TaVXWwTNNSZAZT26zqCF6vAz69aC4vWRpo+PpFN2iPMP9SR+sWR0nWof8/T4VS1APG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xoe6kfQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A241C4CEE9;
	Tue, 20 May 2025 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747750743;
	bh=PImC0z23eYKw/vXRVR7ONqgOkNS50/feSR50iDqb2S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xoe6kfQRYp0a+bxJMj2n383/MzThfYUb+3NqLxYyAjpZq9cZvg/58X4ngv99tjHBm
	 bFdRgVblrYVt8pKtJhcgSce+lxTAB1Ru4DzEB1lZdHx2WHK80U9fN0QIkgLk/yIhNF
	 1ieIXJMQpqJnmeaA1EUp/mKxFNzpWI392lagsxqeogfTRGiglGCFXiOprBznAfSIEx
	 2bJRBXCbD7K4uEBg+5MGLr/QuosEz2jqoX4MB/JR171XwQkFtDmiZMm3LZPvKn8paM
	 HZEHxRDWn0gBgeCAPgdLu++7AhmEtC3xpOIv5n+2zCFUQy6Di/NwF49W65rk6gPvbb
	 9gLnVcGm3Nl4w==
Date: Tue, 20 May 2025 15:18:57 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Message-ID: <20250520141857.GC18711@willie-the-truck>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Connor,

On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
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
> Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> threaded IRQ and then making drm/msm do its devcoredump work
> synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
> a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
> rid of the resume_fault() callback once we switch resuming to being done
> by the SMMU's fault handler.

Thanks for reworking this; I think it looks much better now from the
SMMU standpoint.

> I've organized the series in the order that it should be picked up:
> 
> - Patches 1-3 need to be applied to the iommu tree first.

Which kernel version did you base these on? I can't see to apply the
second patch, as you seem to have a stale copy of arm-smmu-qcom.c?

Will

