Return-Path: <linux-arm-msm+bounces-64807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C9B03DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5011517C84B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDDE24A044;
	Mon, 14 Jul 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMXYocwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE22248F7A;
	Mon, 14 Jul 2025 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752494089; cv=none; b=KEYZigeVDOftTaeqe0QO2qvvAW4qqH33gG46f9xvO7oDD0P8LhCl63KoJH3jO85mrvM60h60POja/No1eC/T8T+slX0s10CTAZe+Drua2dfgnHXSozCuB9vN+rFXp117vobclx9leRGvJRs+GnyZuNCGNTPIIofGJbUEVZID540=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752494089; c=relaxed/simple;
	bh=rziu0D+4kGuOhATIk+bxX7lWlGb57GTit+Rc33yBGEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WyOmgaQRD3Zq1f+4aHieZISBIho8SV1f1LJLurWX6Ff6mBBgcOobaPHoyZ1ixuuqZA6oGAplZc64QyijR7mgJSOz44CXyoB6HpZGF67MUQs1/7iKLmHbsoYH2HWusa7dmUuYCbr6ATBYx3PeJQrXAHt7LqYuLv1er5l9+xkWsR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMXYocwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE1EC4CEF7;
	Mon, 14 Jul 2025 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494088;
	bh=rziu0D+4kGuOhATIk+bxX7lWlGb57GTit+Rc33yBGEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMXYocwG9YB2Qbh87IeUgP6bdteXTdaMI0KAmYZ/rhULoDTzhozimbFrHmyq9Xt7O
	 iXKDXnIT5hrIsavkrFJp8ghdJ0fnX0LlpTwP0QErFyRQKNg9meh859pIA9+POS9Giz
	 0cknD/iCa3oJQd1RZZsVtMvaUg/ooE/0NGRdzeMEgzDgdJmre8TAbkfJoPo/w5nRdi
	 JE9VEnBgh1Qf5JIzxjmsUkBrbCaifkF03h/HHQeC2HFjVD+GbU4JlupwYpLrKq5ceS
	 eGOQRccSfr3sO9mZYN9PHZHAon8+zD5qkpLBwTBhQTegnemr+5Ku2EsrEMOP0/HZiJ
	 TQpMejMjkHm4Q==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH] iommu/qcom: Fix pgsize_bitmap
Date: Mon, 14 Jul 2025 12:54:30 +0100
Message-Id: <175249096589.1450216.5497054354220056628.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
References: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Jul 2025 10:16:38 -0300, Jason Gunthorpe wrote:
> qcom uses the ARM_32_LPAE_S1 format which uses the ARM long descriptor
> page table. Eventually arm_32_lpae_alloc_pgtable_s1() will adjust
> the pgsize_bitmap with:
> 
> 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
> 
> So the current declaration is nonsensical. Fix it to be just SZ_4K which
> is what it has actually been using so far. Most likely the qcom driver
> copy and pasted the pgsize_bitmap from something using the ARM_V7S format.
> 
> [...]

Applied to iommu (core), thanks!

[1/1] iommu/qcom: Fix pgsize_bitmap
      https://git.kernel.org/iommu/c/ced24bf4352c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

