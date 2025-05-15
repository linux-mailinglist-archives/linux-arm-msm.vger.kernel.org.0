Return-Path: <linux-arm-msm+bounces-58069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF5AB89D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 268AB3A4373
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 14:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5C21E3775;
	Thu, 15 May 2025 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Hk2iVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0501A5BAB;
	Thu, 15 May 2025 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320533; cv=none; b=X2LMMzNG4uVYanEntOZIIXHAOUGQ1f7vGXCwkW95rPugagOHBQ+XxrW9KgaNGqzOAq+/IjIcuPTptwuhf55qTG4C6l0dqO/mGBvY40E0RacW4GI069mf6t0QKougbPj56Z8fLOexcoBMzXTN49Htz5w9ukLV6j7cLGdfJ0UDS4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320533; c=relaxed/simple;
	bh=sHAOrLfoP9W72YbPlypXyXEkxapheQXBsW9OcIkElqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZrsw6ta0QQIF+rTwli86uSTrflbNDYpDcLeK29bdke9XMGdmi+9F/sPHUY5INJQ75L7kFB6+coEfpTfVD2yE6xWYnbL6VDGuMSa7Z2lmHGrZevt+6NJrEH0PL/pkT3JSvS/6fGDDuou0PcDTMNMDweBrircCOC/c/EqZRwOAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Hk2iVo; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3da741bcedcso1865435ab.1;
        Thu, 15 May 2025 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747320531; x=1747925331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=;
        b=T0Hk2iVo0dE/9IkwrtMuLl4zEPYrmXemKPB4fTH1MOZA25fPw8j7zkthAKcJKICl+m
         JsdbR0mymBBmJ7QxH3z0mVJwRVFI3MxF38EaqoZMA30Y8sAjY+kfDJtUN8/nZh8rJ1+T
         1qxhpZCpbXF5bMR07/vh7cz/xChNMbfq6ZtaDIKdu3pclao9/44h2AmiYgZtbMPDywGd
         fG9JWk4KLBViH2+pixnvKuH4DxMmsWe87d6KZkFfh25Ugw+4G5lVOzwRWaKyWuIRgGN1
         1Zr2yLoODb1Lu79pXFXe66kKCDWFUFXV0638OtDyz8csnpN1A2pLOP7s0YJuV/aB0NZv
         0vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320531; x=1747925331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=;
        b=gr/z4K2pwLTsZ6JJidwLeY1wqs7K2sf3QIGvQFVW7fC/Bvig+p4gb4GU3LQRKYelcK
         jViN7edHPp6ztprImyJ440VWUB+5EMmmWJg8F9YC4SbDBtcnvlOiuzaivHPqfD8RTCqh
         HZGXJ4CXHjgYgNb7L4hCBPzKG+0jNYb73oFnnmhY2Qo++26npbkT5aJkqAR3AryWRl26
         utIv6iC1x8u6/lo9dWq3rWqfk0moWzcAwVRALokLaT/e33mLVMwWFR7qeba59rrinnKp
         D1et4fom06Tmgi/RBcziuArwENjN3qkvdzq1yMhLVHdBm3YgI3vE30Lu89O5JPt2dtea
         4h0A==
X-Forwarded-Encrypted: i=1; AJvYcCUAjGsXGKjRzUkiUvuUfG5He/G53WOI+5iXIv98TfydeSj0dkC9uwUFfbQdR8Wh54MJMn5u2P+rmsfVVgPu@vger.kernel.org, AJvYcCX9zxXzpOYPvli0w6vEbLbGuzgoePZ/n6nKRVwjnC3OLNikIrLFxhqwWp87fhTqdugMUGT97cxNeksrHprl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LH3w2COk3oG8yx19c4Ws46AR6hWfa/ZeB/yU4XPRUnPVB8FN
	4AMa0MunqEoxgEQ2LeIpy6PE4/hZkL8Ej4aTau5I3d8dEY04jp8lmeGOFLQw4GwuE0wObN46UtU
	SrKaANrbrtay9rW24KmBvZOhiIXA=
X-Gm-Gg: ASbGncsAjLpAumEpi9gxQpOTll2g5YtMV4KfTGDia5qjT8jr02c0UG7LVV77TSUfyUv
	3TBvPnaG5eFwcbXIS4G3kVAWKKlhh7eaiDdaXAg54S+b4MGusZlrlKhCzOwigfZUjED3IKfN3cq
	I+NBuy8segR5SBY4DmRRCXfDi7uoK4oNTUYjc+l3+QZF2wRcG2sjqFAJG+6ooK9w==
X-Google-Smtp-Source: AGHT+IFtWg4FcpaQcpwpTvAAxNygeksmyF1l4sqwxDFcYvvnKFT5/XBtYVHhM71RjDfHHRY+SZGmXPFPj2VfnOhCfgs=
X-Received: by 2002:a05:6e02:5e08:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3db6f7fa0c1mr68163045ab.22.1747320531316; Thu, 15 May 2025
 07:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
In-Reply-To: <20250515143309.GA12165@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 07:48:39 -0700
X-Gm-Features: AX0GCFtBF3BgAWnijILzbnLfQ8NIY_C-HxQIavKJnQ_xQacCvqpfSyafYx2RZYo
Message-ID: <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 7:33=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping sequence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
> >
> > Now that there is a quirk, we can also drop the selftest_running
> > flag, and use the quirk instead for selftests.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
> >  include/linux/io-pgtable.h     |  8 ++++++++
> >  2 files changed, 22 insertions(+), 13 deletions(-)
>
> [...]
>
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index bba2a51c87d2..639b8f4fb87d 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> >        *
> >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pag=
etable.
> >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttr=
s bits
> > +      *
> > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > +      *      mappings, but silently return -EEXISTS.  Normally an atte=
mpt
> > +      *      to map over an existing mapping would indicate some sort =
of
> > +      *      kernel bug, which would justify the WARN_ON().  But for G=
PU
> > +      *      drivers, this could be under control of userspace.  Which
> > +      *      deserves an error return, but not to spam dmesg.
> >        */
> >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
>
> This feels a bit fragile to me:
>   * IOMMU-API users of io-pgtable shouldn't be passing this quirk
>     but might end up doing so to paper over driver bugs.
>
>   * Low-level users of io-pgtable who expose page-table operations to
>     userspace need to pass the quirk, but might well not bother because
>     well-behaved userspace doesn't trigger the warning.
>
> So overall, it's all a bit unsatisfactory. Is there a way we could have
> the warnings only when invoked via the IOMMU API?

iommu drivers _not_ setting this flag seems like a good way to achieve that=
 ;-)

The alternative is to move the warns to the iommu driver... but they
could just as easily remove the WARN_ON()s as they could set the
NO_WARN_ON quirk, so :shrug:?

BR,
-R

