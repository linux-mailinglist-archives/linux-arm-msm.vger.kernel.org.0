Return-Path: <linux-arm-msm+bounces-62831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C810AEBC0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357441782AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFC619D093;
	Fri, 27 Jun 2025 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="seiUzu0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27602750E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038505; cv=none; b=t51BMQAuCiN//ZBHLE8dvSqvHsRFck5Cun9baeQj5xs26dTL7KLbLuiv1YgzrDEfCgHtkpe5utiBNkXLuTx/+mcE4vFGqr0Y24KTiaKR4wVIzZMD25ot6qmzdm1za3bv5KqcJIJKWLkHQezdFaDxdDCaHEbEhJTjtNuUmq/1ZBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038505; c=relaxed/simple;
	bh=AcJS8zEIgvrM6xzr9e5LCAw5uvraDFnTURDqSsoCQFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGIwpxgv5SguCWimX/QcI+dsNTnjp/zkDdLeaxh6Ivr6wGLUYj4XBRPuHRnRG/GVoGdSGXOXwP1NldAMQxEVIhFnI6otb1nxwwVC1mi3b9Z5jw5XPJnAwwxwUZcCb2FbcLMkN/0AIe/FOj9dMUjvYMDyiUOnJebKjXmTUSV5wf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=seiUzu0J; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 14CDF4EFDE;
	Fri, 27 Jun 2025 17:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751038496;
	bh=AcJS8zEIgvrM6xzr9e5LCAw5uvraDFnTURDqSsoCQFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seiUzu0J5pF91dl7UmH+KL0pOHeL6IhLuTDNG5qV4eYBzeMpYjoOQxPYKAUdQ/zSB
	 p/1Q+kRTegEsF4EeKflXx2BbKlxe3TXbX7ID+4m86Xb4Z7LGOEMAG8U75pNF7TAcQY
	 zzDXOO9Iwd2oBTFQLoNOkxr8Z9vDf2h5wuLP7+XIZrsM6xDdLlME+3DnUhOYvJKmob
	 XlTz0nlSn3SlHfXEux0utyU+DxxUBtfbLI4uqipNciicL5w7xY0iQLqdgaOCfLhwZG
	 5lZv8qEaTnkoeyTRTUVK7MPftthtuCwLvBvGf4mgdD9EZc8gwQdYmEAuSlMIvEVBY7
	 n9Zm58rrh4sBg==
Date: Fri, 27 Jun 2025 17:34:54 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	patches@lists.linux.dev
Subject: Re: [PATCH] iommu/msm: Remove ops->pgsize_bitmap
Message-ID: <aF66Hifxw2FWOnP9@8bytes.org>
References: <0-v1-662aad101e51+45-iommu_rm_ops_pgsize_msm_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-662aad101e51+45-iommu_rm_ops_pgsize_msm_jgg@nvidia.com>

On Fri, Jun 27, 2025 at 10:02:10AM -0300, Jason Gunthorpe wrote:
> This driver just uses a constant, put it in domain_alloc_paging and use
> the domain's value instead of ops during finalise.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/msm_iommu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied, thanks.

Queued it right before "iommu: Remove ops->pgsize_bitmap" in the core
branch.

