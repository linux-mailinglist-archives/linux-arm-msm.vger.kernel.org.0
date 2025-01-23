Return-Path: <linux-arm-msm+bounces-46006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEDA1A96C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 19:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8D60188BDA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 18:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593FB153835;
	Thu, 23 Jan 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW6mm4tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FC5FEE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737655787; cv=none; b=OswA6mhin1kWSf50XI7UxvHMxiBVcKbtsLU+dTEZwkrmglw6KBLbkRSFkdlXKw6C5hsOXn8+Soscmq82IbYDTu0OlypPMvvQa2MzouJaDDeXNsQDyWucsVSjyv2b0wduwBlZCuPdGbfkPUMZRkPwGQkJdlSi7uW1QB5aBQWtONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737655787; c=relaxed/simple;
	bh=eNwgn6ZLmHc8pxNg3e34+QuWfh+bej1rf0MzQIEo6U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8R62f2m3KHQ/2tSRmuu8s0m9eHoTpajxlsFgSwKjzNytlMUjK7873RFBRoU/fNYKXL0sDHHGLofZMe8Jg1zG6tOhY+pfowP/Y10yh4waqk2DZPqYiHOasS5NCp4r6zIaLB+MtXpA/HqGiwp2NAa3fEn9dC3be6yGZ3Ou6vVNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW6mm4tu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f440e152fdso289929a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737655785; x=1738260585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyKfEZgI2q04ubHRnQeM6mRxNH8f7N8tmMhgcpNLYwE=;
        b=kW6mm4tut1hPw+9D26LkNzlyBLjjmNiLhv/0XJyay/gVrq6ofi0OHkIbjPqWWL8Djr
         JjPyHjXT1L9lXnrBRXyg8pxBFyq4+uoAoVv0DYkRoteeNeaxyeuRNlLtWqtvkVg47T8x
         WwTn05z1sBhPBcatKgKzrebXY83D+mi5BfaLwNZ1feNgUcv8zS6VFjwLrfUwLpcQ7VPc
         Hur9jeKr1bRiyM4zSPflu5OW+Q2g2oh4SzV19jpLQtLZJrUGOteWPjHrBMLCJuiJd7M5
         i3naSZ/zdpgCQwZvsYLvAsOUEefBT7EbcrjmSHdRLrlU0mrNPcrsN5fc3cc9EvpkKEk0
         gKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737655785; x=1738260585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyKfEZgI2q04ubHRnQeM6mRxNH8f7N8tmMhgcpNLYwE=;
        b=oLsqHmmkfcRsjloCNjBU0dahcb8jU7Dktxtrx0PawY6C6ksiUj8xmoGOIo0Z7t1wwy
         NUCmS3yAMSH0Z75yZoqQ/7XleGRHj2jbN146wSbNFgNFCMLgt7ROJnbWLvNyoGneZm48
         nIf12giQRKppNwxOU4YFVNIo6eKJAJck81YSO8g2AEjxQXtzFmESpCOnB0mKBjAYIfHY
         pxdsqRXEtnLQW9BKDCH35SuYbiJRtOCBMaWk/M/zS72P33CAExcQZqD8qDtn1s25V6fC
         67+Xj/S53tV1Sk0IAv6trWHo46/7JETMq+CCa8UJ4ezLXdrqUE4eJaEhGsDj4X3Vogyg
         +wWw==
X-Forwarded-Encrypted: i=1; AJvYcCUdC1fkZfKa6FDhY2HKFDMP6Yn/A+rWOjcsKvSo/c1jW+FVQNPtlPmjhGAzu3zYH+UK/0VJw2TLO7ng0suA@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsrnqGDKQMxZmb8WLDAUsYVgEivtQxiDl5w40RmW/s5YXTnoI
	sgfE/f5QY5juEVyT50QCGom+iP/chaMM/PUupvhcz9DP2SxrdqiwHn0TERoOSFGfdf0nENq0Txk
	GJpkZurxSw6WyhFqxQzsIuUmIU/g=
X-Gm-Gg: ASbGncs1uAb8Jo6g6oBtfuDWtN9Q1CLGrvtWcdIWvV0ORQ9YLJLTClM9+hJXkkApitK
	kbd/7seN9FEdjJXMq0AVvnuolewdsjKVQHVhIXzX1BKbP8IrYP8V5jLKBVGaseg==
X-Google-Smtp-Source: AGHT+IEEH3PHsFVxMvB++p2z2cLrzhfGijMDaM+Tji/bw29FKBGdgLy//H/LRds0MsXyeSdRL2jN0EV6I288KPRLGZ0=
X-Received: by 2002:a05:6a00:850:b0:725:d9b6:3938 with SMTP id
 d2e1a72fcca58-72dafb71a44mr14883468b3a.3.1737655784773; Thu, 23 Jan 2025
 10:09:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <b593ac5e-cb29-473a-af1b-214168968679@arm.com>
 <Z5J9wpooIH5/Ccrt@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5J9wpooIH5/Ccrt@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 13:09:33 -0500
X-Gm-Features: AbW1kvYGAg-AyeJwPcNQQ2QOH2zEJ2YL7TOxF-zPnlJpiWV2i8GmCg2Npquk7J4
Message-ID: <CACu1E7EUQxWxGB_OY+CifUufYZzaomn8nMYrmRvfrr5Oqx5XSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@gmail.com>, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 12:35=E2=80=AFPM Prakash Gupta <quic_guptap@quicinc=
.com> wrote:
>
> On Thu, Jan 23, 2025 at 11:51:27AM +0000, Robin Murphy wrote:
> > On 2025-01-23 11:10 am, Prakash Gupta wrote:
> > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > + /*
> > > > +  * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> > > > +  * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> > > > +  * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> > > > +  * first before running the user's fault handler to make sure we =
follow
> > > > +  * this sequence. It should be ok if there is another fault in th=
e
> > > > +  * meantime because we have already read the fault info.
> > > > +  */
> > > The context would remain stalled till we write to CBn_RESUME. Which i=
s done
> > > in qcom_adreno_smmu_resume_translation(). For a stalled context furth=
er
> > > transactions are not processed and we shouldn't see further faults an=
d
> > > or fault inerrupts. Do you observe faults with stalled context?
> >
> > This aspect isn't exclusive to stalled contexts though - even for "norm=
al"
> > terminated faults, clearing the FSR as soon as we've sampled all the
> > associated fault registers is no bad thing, since if a second fault doe=
s
> > occur while we're still reporting the first, we're then more likely to =
get a
> > full syndrome rather than just the FSR.MULTI bit.
> >
> ARM SMMUv2 spec recommends, in case of reported fault sw should first
> correct the condition which casued the fault, I would interpret this as
> reporting fault to client using callback, and then write CBn_FSR and
> CBn_RESUME in this order. Even in case of reported fault where context is
> not stalled, the first step, IMO, I see no reason why should be any
> different.  I agree that delaying fault clearance can result in FSR.MULTI
> being set, but clearning fault before  prevent clients to use SCTLR.HUPCF
> on subsequent transactions while they take any debug action. The client
> should be reported fault in the same state it occured. Please refer
> qcom_smmu_context_fault() for this sequence.

It's not possible to implement it the way the spec describes because
correcting the condition which caused the fault cannot always be done
in the client's callback. Sometimes it has to be deferred to a handler
not in IRQ context. However we must clear FSR (except for the SS bit)
before leaving the fault handler because while the transaction is
pending we want to be able to distinguish between a subsequent fault
in another context bank (only FSR.SS will be set and we can ignore and
return IRQ_NONE) and this context bank if they share an interrupt
line. So, moving this up generally doesn't hurt and fixes the case
where the client does resume the transaction inside its handler. I
don't think there's really another way to implement this.

And I have no idea why you think this prevents clients from using
HUPCF, we already use HUPCF in drm/msm and it works fine with this
series.

>
> > > > + arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > > > +
> > > >           ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> > > >                   cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_=
WRITE : IOMMU_FAULT_READ);
> > > >           if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> > > >                   arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> > > > - arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > > >           return IRQ_HANDLED;
> > > >   }
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/=
arm/arm-smmu/arm-smmu.h
> > > > index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af=
37426e005241a8288da20 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
> > > >                                            ARM_SMMU_CB_FSR_TLBLKF)
> > > >   #define ARM_SMMU_CB_FSR_FAULT           (ARM_SMMU_CB_FSR_MULTI | =
       \
> > > > -                                  ARM_SMMU_CB_FSR_SS |           \
> > > Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUM=
E
> > > does, this seems right. This but can be taken as separate patch.
> >
> > This change on its own isn't really useful - all that would achieve is =
that
> > instead of constantly re-reporting the FSR.SS "fault", the interrupt go=
es
> > unhandled and the IRQ core ends up disabling it permanently. If anythin=
g
> > that's arguably worse, since the storm of context fault reports does at
> > least give a fairly clear indication of what's gone wrong, rather than
> > having to deduce the cause of an "irq n: nobody cared" message entirely=
 by
> > code inspection.
> >
> Does spec allow or do we see reported fault with just FSR.SS bit.

Yes, the spec allows it and we do see it in practice. After this patch
we may still see it in the case where multiple context banks share an
interrupt and the other bank faults, but the correct action is to
ignore it because we've disabled CFIE for this bank already. This is
why this hunk has to be in this patch.

> If answer
> is no then Keeping FSR_SS would be misleading. Here ARM_SMMU_CB_FSR_FAULT
> is used to clear fault bits or check valid faults. Also validity of this
> is not based on rest of the change.
>
> Thanks,
> Prakash
>
> > >
> > > >                                            ARM_SMMU_CB_FSR_UUT |   =
       \
> > > >                                            ARM_SMMU_CB_FSR_EF |    =
       \
> > > >                                            ARM_SMMU_CB_FSR_PF |    =
       \
> > > >
> > > > --
> > > > 2.47.1
> > > >
> >

