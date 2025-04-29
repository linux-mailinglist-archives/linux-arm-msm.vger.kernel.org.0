Return-Path: <linux-arm-msm+bounces-56135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A2AA0E01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE30916A392
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845B02C375E;
	Tue, 29 Apr 2025 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed3uUJKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C895211A0B;
	Tue, 29 Apr 2025 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935127; cv=none; b=CZOEWxsPaBhsg9ckI67/cAgbSgecYliH8mLNztbKgB/CGjz+i5xMVEm/xc9QPN7XpvSck5CJ/Q+itpPG1TUAjWY8G9WXTsWAyBDJ0gi1SY3DOv6Nw24Le7wAFOhq0D4Ce0KCTzZqKkCVsn4RVEpedd9DXwyqbYkEAdjkNE9tQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935127; c=relaxed/simple;
	bh=nvBMgGeZibW7tTb4cTtSNnJdMYbzMXuEkRCa7/y/kAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYHOW3RcupJNMxyku35TG6rdz4YNVu2pHv4FTxfd5Y3S4GBtPuFsU2Y7bbLq4fxgbzYFpkflTHpagZIXKthFze3dLWXLHZyIeE8QESsQL9QFbMLt0nt9rChFRbSR5S/ax4iIwS0Z0kRolS9xsEQlNPEzxcElgawDYOVH0Jd6XkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed3uUJKD; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d81cba18e1so51246475ab.3;
        Tue, 29 Apr 2025 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745935124; x=1746539924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=;
        b=Ed3uUJKD82AXEbAVXmwfYeietbs7kKR+dKIba6Vu8YLyy/LV/QMl3PTHDFme/jy3ZL
         +1VBw3kkXa2sbpuE/9qQWhqxRzhSqFD0wzr7h7qSKZLWujHBMElu5tR5D6KCm4O3JH8N
         yMQ1BMMCfEk4VbRE6YpcndJlFSPnTP8Hsa0KtiXXG4FP81/UygTwYexpw/OM4gBI+FIh
         JT0WiK+YkIvGtb2D2ofEg5fbHVLVUCO676mQFdJU3avpRySByHsPZEplM9iz3X8g8RjA
         YkELJTWMJE19rIKsCU6Eof7RDSckqvRoKsHMrO3qccsqbiuWg8QP5gJ1RvDBubgYaJp0
         8VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935124; x=1746539924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=;
        b=p3xyhaVzdqGh1zzRm24lY5rtjoceAMgkYyiyVJY/MTryimD3daOUfMsEGL43bxorgr
         4E3ENKspzh7q4ndGxWk9YsVFzNuMuwbK5miftESKFUn6gfWU89EzYjWEyBbfC/Q0dvwl
         L+saAp08cOqz3k+PRyt8xxTMg3KFr6dTqQTzNSFyyUbW2bnsvENyMryBJio6YrjDmqke
         koiDmSVGrO7I4z0nw3aCh5cx3FKKjIVNWV4maN7HGayo1RpHeG2HUMDDTdTZ85ljahT3
         2c1tO4K3+7vA4iOLK3IREf1s7L+d8lqrmRsy3eAFkqwVVofXNtAphkBzHe3g4pX259+T
         XsYA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+cBkztDDS1S8mL+1FsfCzGVT1T1YkAMGZcU351cjcObnsFEj6ZDqHGNATNU5ysCLuojUX9Z6ii0UQikR@vger.kernel.org, AJvYcCVp64/c7+BsB0uTRMhnAqlRr03EgfVXPYlqKRVitp9429yO8KoD/ChSF7wk+9+jXww5heOyAHbVvS3rkJ/2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hvW9SO+mvTi6ZDJ0fMUAPwK20ye+PXOcCFNRUmCHNqh+A9+d
	QaMZSeN4uvZwVuVrFZvzLedj5zhUZZIGaMTP92HzOzf+cVs2LEm90p94dwmxD8CBxk/XW2I+Vqr
	eDT3DJjx9dEEpqy6AyEZb0oa3DA4=
X-Gm-Gg: ASbGncugtpgoPMiPV/ryj9tVNAUWxtYYqHRK4W2+rlSdYQ4TO/uM/PjjultBvIsCqaI
	mExN3rltJDe8doc5RG0h4sS4XOUxUjKFsM1UYnCJqePxTpMN/VV1YS9dBFLn50Nf8EGRkbRaQWa
	zWjyIDAvDiJeJndKRuR0KPvwMizGvnSNeRKiQDvLvl8G4TfFfUSKVg0KF8/hDD7A==
X-Google-Smtp-Source: AGHT+IH1nUpjoSz6b/R8czY4xnY2bsj4Qtmd4LwhtuxBaf5F+Zjq1Yfe6RP1zEzp5FQni5VkJn1doj3WcQsEWRWuaUQ=
X-Received: by 2002:a05:6e02:194f:b0:3d4:e6:d872 with SMTP id
 e9e14a558f8ab-3d95d262d3amr36052445ab.9.1745935123936; Tue, 29 Apr 2025
 06:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428205619.227835-1-robdclark@gmail.com> <20250428205619.227835-4-robdclark@gmail.com>
 <20250429122834.GA2260621@ziepe.ca>
In-Reply-To: <20250429122834.GA2260621@ziepe.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Apr 2025 06:58:32 -0700
X-Gm-Features: ATxdqUGRQLIGoOBhYNTDnXlEra9K_SUIOqCbRuVfNJ5xIkADqjZJJUiOpnz8BvY
Message-ID: <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:28=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping squence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
>
> I think if you want to do something like that using the iommu API the
> expectation is for the caller to do a iova_to_phys to check what is
> mapped first? That seems kind of lame..
>
> Maybe page table driver should not not be doing these WARNs at all. If
> we want to check for that the core iommu code should have the WARN_ON?
>
> eg iommufd already has a WARN_ON around iommu_unmap failures so having
> one in the ARM page table is a double WARN.
>
> Don't really like using a quirk to change the API contract.

I'd also be ok to have the WARN_ON instead in the iommu code.  In the
case where this quirk is needed, I'm using the io_pgtable helpers
directly, not going via the iommu layer.

BR,
-R

