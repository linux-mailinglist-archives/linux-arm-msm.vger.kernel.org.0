Return-Path: <linux-arm-msm+bounces-22559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB990682F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B67B1C23427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 09:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8152713DB83;
	Thu, 13 Jun 2024 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="TuJjJkej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F98713DB88;
	Thu, 13 Jun 2024 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718269839; cv=none; b=hxk04OyoYyDb47a2I+wcMRu4alLAQnY7CDs01TQgmQGZpig5WOUUZ82MKsk77zsE781vnl50rWUhEONCHHRVWNutGK/ZzsXS1NOXIGVsnxBZ3njeU9IUs7K9XSsGdweWc3/E70eikjWe4Y/+ux6Y2M6Kj1DOK8nrfYsMqH+tgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718269839; c=relaxed/simple;
	bh=uwgNIsvKzltZ++YyP8KzyRNwS3DxApijGasjMKyMWAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qlo3TjYwUqdAdXF1OjxMQlVdJdF2rJ5xq/upb/DAG34KCTGAj1ntg+vTlfAdyxzzgMBSrhTGLvbNvbHSskM924XWwj8Vatpd36lV+WLZWH9ieOjq3/1bTQBuI/GgEZ2qfPMRf9FD5GzMG5Fhp96WTqn9bI6+8QeFVf7ftDKBFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=TuJjJkej; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0CA191C8182;
	Thu, 13 Jun 2024 11:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1718269836;
	bh=uwgNIsvKzltZ++YyP8KzyRNwS3DxApijGasjMKyMWAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TuJjJkejGm0MfLgodYlEkxSB3Ynzcf7M+hp6VHakuN4+1vOgGlqd5oczCJuxEsOGu
	 WqIkjKEwvX2haQyyUhbamusFUYwCEwIIRCIF6VlNfmtASHzYFmsyKRIG6pNAZcLWAd
	 pnJcgXXchWIJBOdBNrJSEPf3B6PIWZ9BgiKB50q/eLtIjLHienBaLr1+0JriUp2iwW
	 xk/7D9LdolUZZ5HhoJPZbmDBRZ1sPVJFbIQcrIIU/1NbVcFDt1gPY6qIkLDBDo8Uvq
	 6Qd10LFqV3aJzVyIm3o1i+I+IOwZREW/LL6A2t0dHY5MOTvWP1zx9xBezWuv8oVM9D
	 PNrYHh/Swi8LQ==
Date: Thu, 13 Jun 2024 11:10:34 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <Zmq3iqSc8fFV0N-q@8bytes.org>
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523175227.117984-2-robdclark@gmail.com>

On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
>  include/linux/io-pgtable.h     |  4 +++
>  2 files changed, 46 insertions(+), 9 deletions(-)

Acked-by: Joerg Roedel <jroedel@suse.de>


