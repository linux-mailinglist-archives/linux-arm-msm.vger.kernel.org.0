Return-Path: <linux-arm-msm+bounces-51168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 551C6A5E093
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 16:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5ED3BA357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 15:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940A72561BC;
	Wed, 12 Mar 2025 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9YsWQ43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD14256C84;
	Wed, 12 Mar 2025 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793864; cv=none; b=TURfuXGixw0aaFfHFbcvtFOUtxYmR75AzFkQqVqmtm2dVKqKrxuJ/GEnEGZ4pOPmiPndBdZyfC1TH7gDx5LsygViBKa2Iz7lXmn9zTuWywUVZ6RXfeNyW1ZYMcVsKlQci8VpQFWWJXZJbtpnemqnD+aJdHWs82SxVKfe32v0Q0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793864; c=relaxed/simple;
	bh=SDFKqepfa7fKYb89hzpnUMj8TGStA88aAw1BI2H78eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4q8tpmfi1raLJfeyErJKeT/hSqI++Rml7jIDYpYe5ZYG9lC0Jxt0RAGmrltg1eRDt6nL+d8uGaF+j1cYasD1GmuC/1/W/oddSqmYcrU/yiNR5qf+X2O4pJFjmt0EDoUMrNSx8flWdH/dRt1IlgHMOhD4ARxKP7WhTJypIodNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9YsWQ43; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85ad83ba141so606939539f.2;
        Wed, 12 Mar 2025 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741793860; x=1742398660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMrlZ7TtkaQuy37XoBmFTMRDwm8cFmyklhT5/AoAOS0=;
        b=g9YsWQ43CAy29HjATcr4I8IDvSsgMXbq1FAhet32G13Y1hc0Age+PnO8WNC53Y0mDd
         bCp0XQDYT7e9BaxJvVy/6EVJaEVaIo6bQo1CeEqcWWa+z4qhlQ3fx5UDz74A/Ic2WFoU
         y0667HW6Hu6fFRfojVUWl4zn8AakOJWtboU4KF5PjSXSztB5vLObCNqggEb6z5BljhcZ
         BSU0vV382d2+GV4NTQoTCGZWijIUCh2rkSq8t2KHWp+0v/7OJzpfusgnUoiTW4MKOC51
         wX6whWMH8VL0Ufq1LDvnMH5R3v34HdtywCcfSinnBKqS7j5W7CPP0hw/qgvj45ght6Iz
         zMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793860; x=1742398660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMrlZ7TtkaQuy37XoBmFTMRDwm8cFmyklhT5/AoAOS0=;
        b=RN+JPuwjLzEJO7v11isjhJiEDtxCo4pYxEVSd3Jdx7T15fxFdOJVopfhn2st1sM+Hr
         72qHMtuqj1uygnHm0gXgQD+tw34QMUjbokR6jND6rh6UMK659TSDBGMyUWkRDSHMx5FO
         smwnWr2jK+rNUDzUPG6M7rufT9+f8KRoNxanpJ+JjHyHefm+lzuYMpcUs6A3NqlKCGU+
         f9k8JeCQhZLku/TSKsvXDnVRnkcetas5gaw7f8ANzLm2BvUOVoqdbr/DSw/MV1sTM9aK
         55zHcWerzE+SINmGunlJvbw2hvsTfTJ5Z8eHuS2RuEte6dhj3ExUrRl84U/ftvANTsMm
         uAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvAf89Ly77Oq35aULl+ANxcBPtKvyYWuWKhoXsDqh6KMHyrYcdQCNEHq6MH4aSkxJrECLqQVGzFlg7YBX2@vger.kernel.org, AJvYcCXvetJT+/VljJXckQXx4q+RCciFCv1Cd38hZM0l9HsSXAtf+oimSzfknoy5YRUpmdWPbGZUoFHxnzIOUwp1@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhY776gNKb7HueV7s5nGRSS9HPQktmNm5TUtHPZkYDCA5hAWP
	gSvxJVAoSGHF7TpNALb9bbuRZnJBJygq2FmUrY27gpczGN6OypWDSo3+kNumbjx/ZIeSAAQIQtH
	CNvXzC3Bm8NZjIJFUxYxZYJqka18=
X-Gm-Gg: ASbGnctIhtUVEMIgTDQoz/q17nHl4XfHNJpQ6m7glj7GsqcsLUEHNGGWVZHcy9Gn/1m
	dYoECqgl4BDdylCcJtbAGrGTPOVBlgp5n5kjmTma+qqXvCmmPyjvB5n5Xl5TNnlzyTUcFhQSeri
	BTS2Guj5sxosbG0lZecbry9KF+YsrPkIL/SdpUkUjoDsRHpNd0AUaQSimbFkAQsHd2I3w=
X-Google-Smtp-Source: AGHT+IH8sNbtyRtPBc86b6yqtNTtxLe+g14B50y3MAoRxzA6AkWmg3s1QxxNYTJ6OnJNaPf6hfx0HKWOAGJrh4dWDCY=
X-Received: by 2002:a05:6e02:1a05:b0:3d3:d067:73f8 with SMTP id
 e9e14a558f8ab-3d4418d0596mr221485665ab.11.1741793859848; Wed, 12 Mar 2025
 08:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
 <20250311175528.GA5216@willie-the-truck> <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
 <20250312130846.GE6181@willie-the-truck>
In-Reply-To: <20250312130846.GE6181@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 08:37:28 -0700
X-Gm-Features: AQ5f1JovmMWQD_O1PD6cpwLN-pH1HxH4w3bZZDBIgzK7Opj6tqGtZU_Fkjgi4xs
Message-ID: <CAF6AEGtrUKybxPZMxkUgjg8JCxPr7-pRe0noS7=y6UrbHxDzZw@mail.gmail.com>
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, 
	robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, Bibek Kumar Patro <quic_bibekkum@quicinc.com>, 
	catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 6:08=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 01:03:29PM -0700, Rob Clark wrote:
> > On Tue, Mar 11, 2025 at 10:55=E2=80=AFAM Will Deacon <will@kernel.org> =
wrote:
> > >
> > > On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> > > > On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > > > > This patch series consist of six parts and covers the following:
> > > > >
> > > > > 1. Provide option to re-enable context caching to retain prefetch=
er
> > > > >    settings during reset and runtime suspend.
> > > > >
> > > > > 2. Remove cfg inside qcom_smmu structure and replace it with sing=
le
> > > > >    pointer to qcom_smmu_match_data avoiding replication of multip=
le
> > > > >    members from same.
> > > > >
> > > > > [...]
> > > >
> > > > Applied to iommu (arm/smmu/updates), thanks!
> > > >
> > > > [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset opera=
tion
> > > >       https://git.kernel.org/iommu/c/ef4144b1b47d
> > > > [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include singl=
e pointer
> > > >       https://git.kernel.org/iommu/c/445d7a8ed90e
> > > > [3/5] iommu/arm-smmu: Add support for PRR bit setup
> > > >       https://git.kernel.org/iommu/c/7f2ef1bfc758
> > > > [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
> > > >       https://git.kernel.org/iommu/c/9fe18d825a58
> > > > [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
> > > >       https://git.kernel.org/iommu/c/3e35c3e725de
> > >
> > > Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
> > > linux-next yet. Is there something under review, or should I revert t=
his
> > > for now?
> >
> > It is WIP, part of a larger patchset adding sparse binding support in
> > drm/msm.  Please do not revert.
>
> Sure, if it's actively being worked on then I'll leave the hooks in
> place.
>
> Do you have a link to the patchset so that I can follow along, please?
>
> Will

https://patchwork.freedesktop.org/series/142263/

I'm currently working on resolving the shrinker hack, which is the
remaining TODO.  So I'll hopefully be able to drop the RFC tag and
post a new version in a couple of weeks.

BR,
-R

