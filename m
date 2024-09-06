Return-Path: <linux-arm-msm+bounces-31133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8756696F769
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 16:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3DC2B26252
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 14:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5200F188A31;
	Fri,  6 Sep 2024 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8g3T29g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504B1D174E;
	Fri,  6 Sep 2024 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634200; cv=none; b=kCIFMxP8bCyJxH4LMH1xifTSIw4ci+uNErzQVhJnxGw0k2u2GE/BdIej7k6oyBRiZjjt3ZkQSQs+2BVyTqplA6H/wkN15u616BUdC4nh36Rkn2WARMMh0MBh7n3XIE2Eyk58MuOdnMbybosd3oXbB9VCKdk782ceeiiBWaFAOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634200; c=relaxed/simple;
	bh=JZpdIce8FGZIaniHLDF8bwjk0Wwb6VEN1meqkW4lD1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Du3DunaZd13wS3sxAT5hR9/x3Sc1u3uy3xCZNS0V9vjkr9tMYhDM1UDoOZ+UINJ+GO4ddoCsz1oq/8pUKYXEY9Rhc6HyAjsceT7lix/ABaTUYfUiILFRadl37pdHdXqmEIyha3KU/93BxuzWKPH6LlTQ3wlrwaBFk1BpEnyt/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8g3T29g; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-81f9339e534so82151939f.3;
        Fri, 06 Sep 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725634197; x=1726238997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiU9IZHhVnUquHSWM6EXfjGaXokDouEcllR2dgh+6Fg=;
        b=O8g3T29gebi3lDe5fghTJyhTXvsE9LiDJCvJ5TNs6/Y85K4aRlpWQxY1ds4K0fQd9o
         O/guP5CFrQZy8nOP7xkaIY4ltxJLxonLkmx7VH+FCk+YKy5aSSW1KYMNo0aPIfyRrcLx
         DGc/4aX2V0ozWzfbsBB0ubOEdk2yWMnjDMsp8T/cWn0rH3D2RRbXmRIL0kMB/fcGU79J
         cXnX1NKiQ9UaIWLnseiovFqciVVo6lBn9XUGkbiwHmUbXyQjOUUg3ibXyZRCUeVL50n1
         lxGOrFgpCxUfH7YLM9JoDOLcCJ/jTDzXI36k0OXzYO+CAhshatm5FhK4ilsdCi9k3Mn8
         DZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725634197; x=1726238997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiU9IZHhVnUquHSWM6EXfjGaXokDouEcllR2dgh+6Fg=;
        b=Ff/J70UgqbBWAJ0LYgqZYOO32KVj6tJJ0WDcCXSCNo9QgRe8/gyhVgpB21IRnpmZnz
         PXYBtkMBnRmfSkHUoGQzRsMMrtNKqkJcAnGV8H98Y0H6Z7FLPGhzPTftkDMv+KkFnzvj
         ajZ4bRRNhl2PC5wvju3b9ALWCK7smpd1Et80/74Te9HMWou6vFqfPDk7qQyjIoq1rsMF
         fcr2xbjrodelWEDOgn8VqzXqKLpFV+jgRMahT5BYNH88jNZMZsrRpNVIXutx2RSyPj+o
         wxiJhnKwd3+MSy1b92CUgEoAItrHLJNvC8M9bjozm7K32J/B+JU9NIs0/Jj0eOuzzS62
         2c6A==
X-Forwarded-Encrypted: i=1; AJvYcCUFHRbpCkBTgSgk1bVQOAfgWxPBvv+P0psB4fuajj02df2xSFSrtuQdw3JXVoUzckz5uncyw2c+KpalIt4V@vger.kernel.org, AJvYcCWiobJtv7Pc9w7ZeTXyBq/yYUqu1vf8pzoG7LArRAEaPK3KlbDrOKucQHFWl7gRxN0AgFNzT/9wtkPmqxxq@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWhMo205s7nvRWJQrem0nKc24WMjOucntQnScWTC2r2OzgfN/
	0+lUzB+rx6xhXRrxKScQ+ZysRa1oiHhaZf8GmahiBgQ9Gf80NPTdOMPvk3ua/AV1IgciwUVcyJh
	igOB+wZOJh2Qy58x5c3FoaBDzY5o=
X-Google-Smtp-Source: AGHT+IH2V8kqjqZuzSiTu4xQgwjYHiNYJlnlag3YQqW/lfLyCQXUGePymWo0HTTtWi+nAbzXenEPCYoGuvVe1VR7+es=
X-Received: by 2002:a05:6e02:526:b0:39f:4f85:3ae6 with SMTP id
 e9e14a558f8ab-39f4f853c36mr199765265ab.1.1725634196676; Fri, 06 Sep 2024
 07:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com> <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com> <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
 <CAF6AEGsqdxO4+kaz6jOLBS_syjEkZg-7Veqh3j-o=RiGNcBH8A@mail.gmail.com> <a30d3968-5fb8-423d-9524-0e694930a6b1@arm.com>
In-Reply-To: <a30d3968-5fb8-423d-9524-0e694930a6b1@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 6 Sep 2024 07:49:43 -0700
Message-ID: <CAF6AEGueETnUhcf8KA8SNEWBieZ=OvYg7jJ4bgd3wJzT7_D7hA@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 5:24=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2024-09-05 6:10 pm, Rob Clark wrote:
> > On Thu, Sep 5, 2024 at 10:00=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Thu, Sep 5, 2024 at 9:27=E2=80=AFAM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>>
> >>> On 05/09/2024 4:53 pm, Will Deacon wrote:
> >>>> Hi Rob,
> >>>>
> >>>> On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> >>>>>
> >>>>> It was causing gpu smmu faults on x1e80100.
> >>>>>
> >>>>> I _think_ what is causing this is the change in ordering of
> >>>>> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> >>>>> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> >>>>> this patch is supposed to work correctly in the face of other
> >>>>> concurrent translations (to buffers unrelated to the one being
> >>>>> unmapped(), because after the io_pgtable_tlb_flush_walk() we can ha=
ve
> >>>>> stale data read back into the tlb.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>>    drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++--------------=
---
> >>>>>    1 file changed, 14 insertions(+), 17 deletions(-)
> >>>>
> >>>> Please can you try the diff below, instead?
> >>>
> >>> Given that the GPU driver's .tlb_add_page is a no-op, I can't see thi=
s
> >>> making a difference. In fact, given that msm_iommu_pagetable_unmap()
> >>> still does a brute-force iommu_flush_iotlb_all() after io-pgtable
> >>> returns, and in fact only recently made .tlb_flush_walk start doing
> >>> anything either for the sake of the map path, I'm now really wonderin=
g
> >>> how this patch has had any effect at all... :/
> >>
> >> Yeah..  and unfortunately the TBU code only supports two devices so
> >> far, so I can't easily repro with TBU enabled atm.  Hmm..
> >> __arm_lpae_unmap() is also called in the ->map() path, although not
> >> sure how that changes things.
> >
> > Ok, an update.. after a reboot, still with this patch reverted, I once
> > again see faults.  So I guess that vindicates the original patch, and
> > leaves me still searching..
> >
> > fwiw, fault info from the gpu devcore:
> >
> > -------------
> > fault-info:
> >    - ttbr0=3D0000000919306000
> >    - iova=3D0000000100c17000
> >    - dir=3DWRITE
> >    - type=3DUNKNOWN
> >    - source=3DCP
> > pgtable-fault-info:
> >    - ttbr0: 000000090ca40000
> >    - asid: 0
> >    - ptes: 000000095db47003 000000095db48003 0000000914c8f003 00000008f=
d7f0f47
> > -------------
> >
> > the 'ptes' part shows the table walk, which looks ok to me..
>
> But is it the right pagetable at all, given that the "ttbr0" values
> appear to be indicating different places?

hmm, the gpu does seem to be switching to the new table before it is
done with the old one..

BR,
-R

