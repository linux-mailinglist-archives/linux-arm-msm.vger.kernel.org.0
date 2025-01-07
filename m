Return-Path: <linux-arm-msm+bounces-44135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335AA03FFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C7C165810
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D5F1F03CB;
	Tue,  7 Jan 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HWddNx2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987C41E521
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254565; cv=none; b=OCXGk/+jzhUbIjRuS69oQgq5q5f2eAl+/dvK2oPBE0MJPavz74YQipKNsVRt/q096KsSZPmrMr+be5C7z4/SLdugbZHzy4grb4xF5oOVcOtsXdWH/6VxCy+mwk198/TStkSTZpUHbgNpKb0c5vKFhadVmUVdP/9NHbj1hPv1gfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254565; c=relaxed/simple;
	bh=6c0tGgmq2VHFAd0FPZKcrOIoxEX7i1zayzPfZhXJWjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVxjsT073Yul0r74O6ywek1P1TJsWQqlbOjd2e9FrnTUHJaqdfvtdJosPTSppHW62owRaD1+71KNP73FnDM8ymhO3OM3V/lgLYLj8yjrBchHVPDsdKgqzDw3UhaNdA1rhtWT5lecR3YT46kiOE4ZSLEIplkgNN95m9Rtky9aEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HWddNx2u; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso45385e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 04:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736254559; x=1736859359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
        b=HWddNx2ukNIpkyGPEAlBOxkCW3cfxXk3WegzpCrw4KLRdl8ua+yBa7XwsMV0wYKju6
         0fJeGjGy2wBmAMhjs1VsD6IQfTsX6ybfvuk320bcn5BeDRdOHucpkoR1hPAWGyuUBr+L
         ZYDXulNLa7ufKnB0Mzwl9vVxKVgbFG/+ZfsO3pvYlSxefn6uS39Y18nXKA9UeCwWGqEM
         adrKTTFdtTzT8Aeo1WyDWLl24HNFM/UdawG2+IMRWTCCqMzqDWGs3O83hQLDcUedggrh
         RNyCr6aj76kCOd6s9L4NdvM53N7me6h6WA3NnczcrhwsRg8vgxnZhKPrL1wxQ7O1huTr
         ld4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254559; x=1736859359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
        b=YaNhvDAjR7bxIchBC8ibVPvCi+r+YqDEWXZXeVsCkwjLN2WcNIoLDnz3QHzC8Sl+5J
         XnD42WHWQA4oe9x5466iAJjshVvIVOgdZNmiLZSsRtLOIpagevZpcgVPsDFAIgXya4Ab
         Qn5qI0IWkcRTqjO0YhVwqdECVFnt/x0vwpRZnrFHRsFYN54eGxCEIGxzwHLAKByVkwsY
         VtyFHHWn24vfRozknPPBC9g2WpBeFlg+kXpmJKbtWBlVwvPcd3uJcwnZttAqB4ggrVHb
         YZd7xZ8yYBGaMi/kBos9Rlhvu4b1ViP5+Vs06cCucEy3LujIlbsQreCiD3EeEi6uqr+F
         +a1g==
X-Forwarded-Encrypted: i=1; AJvYcCXHNB9D1Bm+ThZttBPCPS/dt4Z+1lkHYsygcuFslxBmoyAj774gLAuAqICM/hQpegKqqlvTz9KI03KFlsOD@vger.kernel.org
X-Gm-Message-State: AOJu0YypqpIqSZY7P+lGXNjDKumMV63xtJ7Gbwwe12HzSLpzoFf07yV9
	TnPhHqEScE9UvNuAqDWy5F+es87zhsWuWrAYJcxQvKRKcHV85HGxq9jho/vNTQ==
X-Gm-Gg: ASbGnctmgLE1bWgqWovkslah0oiuNgvNR+ImarUejbyx6l/IwiecZ+6o0H5zq29ZH7h
	m3zECEcmwmA9v5RKO7K1VQEZ3wLCXnNJPylIMeKLLbNbuJG4wtG+sybNjJ9Prlaa6jjpTOAXpIJ
	lJLZnzhopoHChyijA+7zx7ZlkJEYat22zlNc3Hzrf1I5Wy8pNmQ/5ormy0tlv5KAqVgwi/M5POq
	1wevVcfZXgPmxB88G8SISv516V8LJcgw1qWPrU/XG89NOwwnlVhYRg4KBdgtCt4ZUqARSi/fKVe
	XMLZL4O53hscfSopU50=
X-Google-Smtp-Source: AGHT+IGshgYKYU49AS8Yt3DzTbm9jzfDb1zOfiYsDlqWPz/kk/iuG9opzk/qyzVKRNqNypOg626I8w==
X-Received: by 2002:a05:600c:4f8f:b0:434:c967:e4b5 with SMTP id 5b1f17b1804b1-436dcf7356fmr901395e9.1.1736254559456;
        Tue, 07 Jan 2025 04:55:59 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2e25edbbsm42740762f8f.110.2025.01.07.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:55:58 -0800 (PST)
Date: Tue, 7 Jan 2025 12:55:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <Z30kWxVxwJXO_z2_@google.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>

Hi Rob,

On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2:  Fix an armv7/32b build error in the last patch
> v3:  Incorperate Will Deacon's suggestion to make the interface
>      callback based.
> v4:  Actually wire up the callback
> v5:  Drop the callback approach
> v6:  Make walk-data struct pgtable specific and rename
>      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8:  Pass pte pointer to callback so it can modify the actual pte
> v9:  Fix selftests_running case
> v10: Call visit cb for all nodes traversed, leave the decision about
>      whether to care about non-leaf nodes to the callback
> v11: Adjust logic in 3/4 [smostafa@]

I see the level initialization was not removed as it was in the diff[1], so it
seems to me that’s redundant as the level is set anyway in the callback, and
actually looking at that I see it’s not used or printed from the driver,
so may it can be removed all together, anyway that’s nit that may be Will can
fix it up while merging.

Otherwise, For the whole series
Reviewed-by: Mostafa Saleh <smostafa@google.com>

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ed3ba47df350..a884af8fb101 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,7 +731,6 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 {
 	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
 	data->ptes[lvl] = *ptep;
-	data->level = lvl + 1;
 	return 0;
 }
 
@@ -746,8 +745,6 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 		.end = iova + 1,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 0f17a38a304d..c62e344a4058 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -190,7 +190,6 @@ struct io_pgtable_cfg {
  */
 struct arm_lpae_io_pgtable_walk_data {
 	u64 ptes[4];
-	int level;
 };
 
 /**



[1]https://lore.kernel.org/all/Z1AtDgLD0SDUxDHl@google.com/

Thanks,
Mostafa

> 
> Rob Clark (4):
>   iommu/io-pgtable-arm: Make pgtable walker more generic
>   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
>   iommu/io-pgtable-arm: Add way to debug pgtable walk
>   drm/msm: Extend gpu devcore dumps with pgtbl info
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
>  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
>  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
>  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
>  drivers/iommu/io-pgtable-arm.c          | 157 +++++++++++++++---------
>  include/linux/io-pgtable.h              |  15 +++
>  7 files changed, 167 insertions(+), 57 deletions(-)
> 
> -- 
> 2.47.1
> 

