Return-Path: <linux-arm-msm+bounces-45990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E80A1A55E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C977A4440
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 14:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F00E20F976;
	Thu, 23 Jan 2025 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCfE0VQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF531B66E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737640831; cv=none; b=RDoI9Aydmc3S26Ik/7Q4PTbXSwsUOL7FRn31+A8ZNWMIgPi1MnItYyoWGQ6L5gs7+flBRgjVKcJzPvOX3uztwn+zontuVL9zpT+4I7CEdAZsi7AvABH7Ktbi0ezCvg2nAz8zuDozy69I1/Efn/qiaQd31hYelXMpmNW5Ytbu4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737640831; c=relaxed/simple;
	bh=yr581SX12QudKxpuGtild8L1zEYyc/XAPG0plxE2FCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX9+YSK6Nhs4kthjigqzoaWJ3l02LqYS7QyXCi9pKfoRtJq/Byu4ZMkNOZVzAaT79BqNu3iWRS1EQSP3gJLOukgaymTfLdxjj0VfxtC9CZtkt7k2MJVJbPBANWetWugTXwI3b4ZtEf4Soa/7nKdLWZfRh767L4uGi6r4r4XCu3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCfE0VQr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef79243680so229194a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 06:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737640829; x=1738245629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrivE+jXCcpkJfX31hjpK5tPlRP7KoKj2mnULiizYXQ=;
        b=WCfE0VQro6psuaWIPem464FU5/7BASuJqQ5ClNhWcpHNIbFYkivIf+rQiuOWIQ3S4z
         aeKy4Uyqm4lKJImR1gdB0DeoWDiBlZF088YGuEQPIOGlkY2vBBSNNQgZVqLdNJV13yP1
         Z9JgFaiCdaTfSlc2MOn6HNrJc9OCLurlH8bDb1SxdjOw3yj6NQPqObSuYIu2Rn5W/jYK
         jzrbifpHPY2hAoJWZJrUaFoTriuXJVskWYsUll+Gtm0E6GLthizp9MQPobHgrA+9Jj9h
         SymNXS++rCIzAZhKlWdpGLbRwL+dR7N6hMsHE7QFXHeA/34mWkmzzv5xVuaAP3+zOZyT
         v3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737640829; x=1738245629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrivE+jXCcpkJfX31hjpK5tPlRP7KoKj2mnULiizYXQ=;
        b=sT7i71FL8EX8gNbbV15Zjbhg5V3kuJcY1R+p9OGeaUQGMCvNu3aRXGAmmQOxY9n3/u
         kw3+s2raDH+cv2PHjI7u+0DeQQyU4VxR/J9WgNYYgpvhXhddRxSAc+EBGUArXrBqSSkP
         kwiCwc20KfYlB0WDQD9H1ch5Q7a1/EDwyo0lbP1kBltfrJLfm2BIcD3qa0eAMM10R9Qh
         lrLUQWK99sr6Lnub6dKh65PtTZVldgt4gaSD8qJ3xsRfyemFbho2ap+ePiaTGUaGj5r/
         Eh/PMLXdNc8eMVYQrLrE56MIeH5Gd2Tsj2ZXHdaJEhJwReidMTM/FV9jm5vkJOwBD0sB
         jkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBe5zs+D/ENckgKP82GfUAk5/P/PA5NPLFP5YRufq1tMhpoifuJJf0sWpi+1+goozj9sRB/85yODV8BAxj@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbJ7lsAQLFgSVUVkACqWOVrKaOmdBKcOr9p/FE0TaTO1Db8yf
	hdrRFdNQig0s3DDRUNo3d6Nqlqf4UvMKZ0rLzPolEHKtpMDE1wG4bGx/3732llV5OnYDDnDo/8Y
	0BtPfjkniQUQF1rTUEEkplJU95/E=
X-Gm-Gg: ASbGncuN3HK5m08lHFbUgfMHIxpcPmSBzMU7biFO/31HLQmo7Cp/fHEcGTAomag2ExH
	fEYXxMoPogJc0niSAkNCAgbeoG73OgvXIewXLBg6u4u9Uokn4DHdq2EoKkZYJgg==
X-Google-Smtp-Source: AGHT+IFmTC6qmDF4oUBj7xpD8an7Qpq8DoBkwz2IBfRe4cVvkaz/pes+WZH4kbi478o6Q0jVZbaKQwuX1r2P0uDuuGQ=
X-Received: by 2002:a05:6a00:2406:b0:72a:a7a4:99ca with SMTP id
 d2e1a72fcca58-72daf973e78mr14767252b3a.2.1737640828927; Thu, 23 Jan 2025
 06:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com> <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 09:00:17 -0500
X-Gm-Features: AWEUYZkhKWn32H9Mkt-2dMmko580derQXOamfCI9VPysLRLbJNJBREOXqAVlk7w
Message-ID: <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
>
> > @@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(c=
onst void *cookie, bool termina
> >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > -     u32 reg =3D 0;
> > +     u32 reg =3D 0, sctlr;
> > +     unsigned long flags;
> >
> >       if (terminate)
> >               reg |=3D ARM_SMMU_RESUME_TERMINATE;
> >
> > +     spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > +
> >       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> > +
> At this point further transaction can be processed but SCTLR.CFIE is
> cleared so subequent context fault will not generate interrupt till
> SCTLR.CFIE is set.

If you're asking why the spin lock is there, it's because this isn't
true if there's another context bank, they share an interrupt line,
and it happens to fault around the same time. I haven't checked if
that's actually the case for Adreno, but in case this gets used by
other drivers and moved into common code I want it to be as robust as
possible. This is explained in the comment added to
arm_smmu_context_fault(). Also the next commit toggles CFCFG and we
want to serialize against that.

>
> > +     /*
> > +      * Re-enable interrupts after they were disabled by
> > +      * arm_smmu_context_fault().
> > +      */
> > +     sctlr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > +     sctlr |=3D ARM_SMMU_SCTLR_CFIE;
> > +     arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> > +
> > +     spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
> >  }
> >
> >  static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..ca1ff59015a63912f0f9c52=
56452b2b2efa928f1 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -463,13 +463,52 @@ static irqreturn_t arm_smmu_context_fault(int irq=
, void *dev)
> >       if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> >               return IRQ_NONE;
> >
> > +     /*
> > +      * On some implementations FSR.SS asserts a context fault
> > +      * interrupt. We do not want this behavior, because resolving the
> > +      * original context fault typically requires operations that cann=
ot be
> > +      * performed in IRQ context but leaving the stall unacknowledged =
will
> > +      * immediately lead to another spurious interrupt as FSR.SS is st=
ill
> > +      * set. Work around this by disabling interrupts for this context=
 bank.
> > +      * It's expected that interrupts are re-enabled after resuming th=
e
> > +      * translation.
> > +      *
> > +      * We have to do this before report_iommu_fault() so that we don'=
t
> > +      * leave interrupts disabled in case the downstream user decides =
the
> > +      * fault can be resolved inside its fault handler.
> > +      *
> > +      * There is a possible race if there are multiple context banks s=
haring
> > +      * the same interrupt and both signal an interrupt in between wri=
ting
> > +      * RESUME and SCTLR. We could disable interrupts here before we
> > +      * re-enable them in the resume handler, leaving interrupts enabl=
ed.
> > +      * Lock the write to serialize it with the resume handler.
> > +      */
> > +     if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> > +             u32 val;
> > +
> > +             spin_lock(&smmu_domain->cb_lock);
> > +             val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> > +             val &=3D ~ARM_SMMU_SCTLR_CFIE;
> > +             arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> > +             spin_unlock(&smmu_domain->cb_lock);
> > +     }
> > +
> > +     /*
> > +      * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> > +      * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> > +      * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> > +      * first before running the user's fault handler to make sure we =
follow
> > +      * this sequence. It should be ok if there is another fault in th=
e
> > +      * meantime because we have already read the fault info.
> > +      */
> The context would remain stalled till we write to CBn_RESUME. Which is do=
ne
> in qcom_adreno_smmu_resume_translation(). For a stalled context further
> transactions are not processed and we shouldn't see further faults and
> or fault inerrupts. Do you observe faults with stalled context?

Yes. I've observed that on MMU-500 writing RESUME before the interrupt
has been cleared doesn't clear SS. This happened with v2 in the case
where there was already a devcoredump and drm/msm called
qcom_adreno_smmu_resume_translation() immediately from its fault
handler, and we'd get a storm of unhandled interrupts until it was
disabled. Given that the architecture spec says we're supposed to
clear the interrupt first this may have been an attempt to "help"
developers.

>
> > +     arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > +
> >       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> >               cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : =
IOMMU_FAULT_READ);
> >
> >       if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> >               arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> >
> > -     arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> >       return IRQ_HANDLED;
> >  }
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af3742=
6e005241a8288da20 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
> >                                        ARM_SMMU_CB_FSR_TLBLKF)
> >
> >  #define ARM_SMMU_CB_FSR_FAULT                (ARM_SMMU_CB_FSR_MULTI | =
       \
> > -                                      ARM_SMMU_CB_FSR_SS |           \
> Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUME
> does, this seems right. This but can be taken as separate patch.
>
> >                                        ARM_SMMU_CB_FSR_UUT |          \
> >                                        ARM_SMMU_CB_FSR_EF |           \
> >                                        ARM_SMMU_CB_FSR_PF |           \
> >
> > --
> > 2.47.1
> >

