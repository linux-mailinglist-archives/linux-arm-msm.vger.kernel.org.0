Return-Path: <linux-arm-msm+bounces-30763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC4C96C40D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79273B21DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6211DCB12;
	Wed,  4 Sep 2024 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU19ASe2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585142BD0D;
	Wed,  4 Sep 2024 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725467088; cv=none; b=sx8VROYGvISYtNu27FmNe7YUNmM77ZarysmNV9kiW8FkIRuqBigZqtiVJCgq9ED5Wmw1cEBWKzttasXrJHiMwgFGL1F2UmoGweSwVb0B99xMqcwgWXdh98U2ZhJ8UvNtgMOoSJFagn/grUtBxrBSYJPLIvMFsGWKzNbOqjR0+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725467088; c=relaxed/simple;
	bh=/7cDYAlEqe7bWicn0Va7ROpOHLi0iVmUDmVo+jOORyY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n7QwOQlsoENaiqX0eNhSYtZjthf4XZDi5IEQGDCV9VIdfg0m6Yoz7aTsh4j2ToYpY6zIc0161Mq3TVUxCKHL8k7kd0WnctBjoPjT7KyBVxjAg1eaVm8xPpCoL7vmngtGXW+MfQ4Adz9qfufuyx9XZ8BLJKsZUZesXyZjSL3XOIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XU19ASe2; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-82a24deca03so241424239f.0;
        Wed, 04 Sep 2024 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725467086; x=1726071886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+KkAQjjotCRZ4CfWuR8BuZVWPds5hg7Zc/7KBaAAyJM=;
        b=XU19ASe2NP2Zo5G9ctHPlyLYAqNFUCeR0zn5VtW18GXzvQbNIQ10r/fHNxPmYPik0X
         RoAVpYxVpBJpdctrvDSYhfrW00hj5ZGNvMufZV4Rq/Dqce4GUt61Cye08rgzoitUHt5x
         pNubeZPmmh6VOdcO5rfEHkBY8sHyUolm5M3GpUrEUWF4vY+w3+9EYPU9jrrjlSZAsDju
         2Eb+Dv6Mg7NUbyvTTuv8V+TUzwGiud+YinuwntOdRGAP1s/mWZvY9T0jHKTXGH7I9C0T
         5b5J5/Xk/GmTZNK5CrQKzjB4HETZec1geFhJetb+GJ/CZSf79VcKN5qDB6B1UqEDUHfl
         hH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725467086; x=1726071886;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KkAQjjotCRZ4CfWuR8BuZVWPds5hg7Zc/7KBaAAyJM=;
        b=hxYDaQT6ZgVcYHTQr85co/rIx2jfMIwuX3eGIO8W3BAjWK+JdJFm6i4fjnz7mmfYob
         drjFXa38EbcaTJf32/sq/2qq9lLnp7q+Xhwkl819Djg0HVZnjLR98d7mnrB4uiSsgAwS
         QsHWOJXF692psXN6SWG0nq1hlE1NNsTdoyJck7haN438TriePvecjSXuIv8040bYJSKF
         3TBfD7zIAgeva5Ej76ji1rEMwXV/OQNZs+cE14X24AujywKFI9XiSEtZwXpAbAcWRY1+
         iINnQpxi+t5P/q3OJ7Aioywr1EoaTrZcSUFMHOuEe5c6QyEXgBy2exMirfltAzY7Csr2
         TDEg==
X-Forwarded-Encrypted: i=1; AJvYcCUq2w8H2w10C0Hio01JPjmPSNCf3UqZQk3xHNhoMDQjZTuZ0KQgFrRCcPRWiR9118SIwlIKkvejftSDmI0=@vger.kernel.org, AJvYcCXZgFVOeIT6EAsuRJZeL7k+VKxqxvtzYqy9/BH+WtBGBFVgE0d8FxU9Jh+COIofd0QSAO4ARb6trmJPyJu8@vger.kernel.org, AJvYcCXdoMsYkUd8d3GEqY/D7ICecsgtNu01J4jv8e4yZ1ehYgMG+IMXDbkTi1u+WbLU++w7Cda+MRvhp08Sr9rm@vger.kernel.org
X-Gm-Message-State: AOJu0YxCd7+c+A06QfluBvsCY8hXPSNZo6j+t8nB3j3QK1ImWPKEUIZI
	pzPVglCM1KYKkWdTSpV+MvIKwphBDCUWQWp/PK2G1Gm/1T+v8KwLsAjvQo6SMReZjIxALEgmwdQ
	KAWrR0Bv+E7ICcR0lRxmUKDyZhOy8Ij5S
X-Google-Smtp-Source: AGHT+IG7Vz+T5qXl228WIdHsyu+M/jpDgswlSvzOewXBN7HGjjAubTwZpX8iIycVwNxPh5j/KRpzh0cJdVcgtU6Cnww=
X-Received: by 2002:a05:6e02:b2c:b0:39a:e9f4:87b7 with SMTP id
 e9e14a558f8ab-39f4f6ca345mr177420315ab.26.1725467086333; Wed, 04 Sep 2024
 09:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Sep 2024 09:24:34 -0700
Message-ID: <CAF6AEGvAEgFeoaxpkNw52fkt73RFg4g8+nhdR++m0ZhVsis=mA@mail.gmail.com>
Subject: Re: [PATCH V4] iommu/io-pgtable-arm: Optimise non-coherent unmap
To: amhetre@nvidia.com
Cc: "open list:IOMMU DRIVERS" <iommu@lists.linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:TEGRA IOMMU DRIVERS" <linux-tegra@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Btw, this seems to be causing iommu faults for me for what (according
to a sw pgtable walk) should be a valid mapping, indicating
missing/incomplete tlb invalidation.  This is with drm/msm (which
probably matters, since it implements it's own iommu_flush_ops) on
x1e80100 (which probably doesn't matter.. but it is an mmu-500 in case
it does).

I _think_ what is causing this is the change in ordering of
__arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
this patch is supposed to work correctly in the face of other
concurrent translations (to buffers unrelated to the one being
unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
stale data read back into the tlb.

How is this supposed to work?

BR,
-R

