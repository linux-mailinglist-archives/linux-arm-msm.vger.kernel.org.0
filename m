Return-Path: <linux-arm-msm+bounces-46444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A9A21685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 03:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70934188544E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 02:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B29823DE;
	Wed, 29 Jan 2025 02:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYby6jB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4BC2D627
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738117861; cv=none; b=BKGOm0MfpEanqKkzkA3yQ80kNXYPBUJBMhgZSd7bnZvqYwBRxQWN3PIpTYRi6kxl91Egn5hZl1xBKyr6/ejPAESBwkPKzyEkeDKpjI+LtoSOmukcecVcksfwrXreGa2esL1ls7YWMZmrRaNRVx6XeZwnPBGuQBB2HSqmswv2gjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738117861; c=relaxed/simple;
	bh=A5VajVGVILVmm6TPzJNNXCbTkkxXbO/J7eIt3AyuFw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPMcHUKkgbxYtMc07KWrPTmJy9jrxYaw1GWleVWBM+i+33QC66bRQKXDtTkG5BkrIKa285i8k9zWARhLS+7sFLfS2mXFuyDwYCUCbOg0NotaCpoUkyYyO0QLFFnhXr2zCTs6DbCp4tIV05oaIJSx/LuqaXrzfC6v/9MzSfl1j/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYby6jB7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so1486737a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 18:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738117859; x=1738722659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=;
        b=KYby6jB7fc2kcNqxjdkf7my3lQCSX+eDISK91iaHRk9gkPDAGE3MxGyCnhhjxQuWei
         7xHF0w+Yz1L3eDsEVMqxDK6KMRUbaDMCLduawsIL1pwUaVYaY/ZYnbeZIDCiBNu1GE+C
         RFZkKNskBa0bwwykNUJceqQrU+SY0zxy1ANCGk0jXJ0bqSc3/S/Y+PRPRfMxPVTMxi9e
         OBrkOTnr126ap2/LnImk8Gre0LnVe4+tjxrxXp3oVhKxDF5eIRSHCWUmQpXFNPVxHzuX
         eaYF+ZGrZb/wsc/vo2p3WqdiWMiMT4VTfH2+mx0WYiYQSIwk12ncGChztVKRPk5OCBpI
         gzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738117859; x=1738722659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=;
        b=kLZFdU4qoQXQcZm/Y/GyMG7hWt6aaIqEWWdBLht9fJr4AvJ4IIMo0EFHCzg2yecbHT
         zqmxTAAFSiG6kc0zS6PRCPWYZeqw5sjICycUg0JIqa65d55KrLjR/gpshyOB2CAHxXxK
         TO94MbOKHKWMh6xE5LxPDWzWt5xYwtgWUhCczLwnyZigR4zFi8FlDtzRPgCdU6Qa0r2V
         taBW6Nq0cKiC+xwhtUxSBiEPU1zeLm/ZSKRJvrIi3zAY3lp8FjoQewi76KsggJzEAN2V
         GyHjuntBfRwRyCEff8f/8wbIKKYs9vKsLNHHZ8FBiKx55uGBIXvwCP0nV1uZITMDCoyr
         V36Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpJC+WuG8sidVAwcoG1MQXYGu/w9ttgBvcIUyMLa2bHfrSP9putezqnHNPAdHwrWVxNZsRSUCl2/biEyVy@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3U/79SS780i8gPAbeB0XVZaqWHI39xUZCdA/9/3dcDEuYi8f
	Jqra2AIup6K1Wp/m5bwhWPJhC0Q6Y8Hn+ZklIT4InaayHsYyTcxfh1IPHqg5LNI2qUxFvrahHfT
	nihdYGgrCk3UXXlxh0LL7wOnIYaM=
X-Gm-Gg: ASbGncuvTQ2Ytaym1fpejX5k6BIVXdFjDt6vZVKjB1BGnbX164VEAhdk4p6iOstzVK8
	MWCA4k+5W1KycfSKdpLK/aAPOhzUcEnXflOyvCaQzbvLqzhzf7GfxFHXLPGKqdfpVWeuXaKme
X-Google-Smtp-Source: AGHT+IEjgYmsQ4btVO6NoeAtHUBYo6uBU9FQXTRAoppwQkfpqn+YG0TztYlkbmmr8DweH3LafBf4eykvGJwllpwO6II=
X-Received: by 2002:a05:6a00:3920:b0:72a:83e4:42e2 with SMTP id
 d2e1a72fcca58-72fd0bcee41mr883477b3a.2.1738117859086; Tue, 28 Jan 2025
 18:30:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com> <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 21:30:48 -0500
X-Gm-Features: AWEUYZnXKpZmksZEDv9wE4ehxlAcfC2ZYtvFlEvNuv90BQMKMLlkT9uISLaRedQ
Message-ID: <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Rob Clark <robdclark@gmail.com>
Cc: Prakash Gupta <quic_guptap@quicinc.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@qu=
icinc.com> wrote:
> > > >
> > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_g=
uptap@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wro=
te:
> > > > > > > > The context would remain stalled till we write to CBn_RESUM=
E. Which is done
> > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled con=
text further
> > > > > > > > transactions are not processed and we shouldn't see further=
 faults and
> > > > > > > > or fault inerrupts. Do you observe faults with stalled cont=
ext?
> > > > > > >
> > > > > > > Yes. I've observed that on MMU-500 writing RESUME before the =
interrupt
> > > > > > > has been cleared doesn't clear SS. This happened with v2 in t=
he case
> > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > qcom_adreno_smmu_resume_translation() immediately from its fa=
ult
> > > > > > > handler, and we'd get a storm of unhandled interrupts until i=
t was
> > > > > > > disabled. Given that the architecture spec says we're suppose=
d to
> > > > > > > clear the interrupt first this may have been an attempt to "h=
elp"
> > > > > > > developers.
> > > > > > >
> > > > > >
> > > > > > Just to clarify, present sequence is:
> > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > 2. Report fault to client
> > > > > > 3. resume/terminate stalled transaction
> > > > > > 4. clear FSR
> > > > > >
> > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, i=
s FSR.SS
> > > > > > cleared and interrupt storm is observed.
> > > > >
> > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there =
is no
> > > > > interrupt storm. From this we conclude that MMU-500 does not clea=
r
> > > > > FSR.SS unless #4 happens before #3.
> > > > >
> > > > Thanks Connor for clarification. I get your point now. I think it's
> > > > expected interrupt storm with #2->#3->#4 sequence is expected.  Wit=
h
> > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the seque=
nce of
> > > > #1->#2->#4->#3, which is spec recommended.
> > > >
> > > > so, common fault handler can be modified to follow the same sequenc=
e, but I
> > > > have concern regarding clearing FSR before reporting fault to clien=
t.
> > > > qcom_adreno_smmu_get_fault_info() is an example I gave but other cl=
ient
> > > > handler may have similar expecation of fault register not changed b=
efore
> > > > client fault handler is called.
> > >
> > > Simple solution would be to move the clearing of FSR to after the
> > > fault is reported.  It doesn't really matter if it is before or after=
,
> > > as long as it happens before the irq handler returns, AFAIU.  And
> > > drm/msm will collect the fault info from the irq handler.
> >
> > As I said in the earlier mail: "From this we conclude that MMU-500
> > does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
> > and #3 is writing RESUME. So no, unfortunately it does actually matter
> > and we get a storm of unhandled IRQs if we don't clear FSR first. Your
> > solution is what v2 did and it didn't work.
>
> So, just clear FSR also in the resume path

Then we'd run the risk of incorrectly accepting a second fault if it
happens immediately after we resume. Not terrible for our use-case
where we only really need the first fault to be accurate and we
disable stall-on-fault afterwards, but if you ever leave it on then it
would result in another interrupt storm.

Connor

>
> BR,
> -R
>
> > Connor
> >
> > >
> > > BR,
> > > -R
> > >
> > > > > > The way CFIE disable is helping
> > > > > > with current patch indicates write FSR is unstalling context an=
d subsequent
> > > > > > transactions are faulted.
> > > > >
> > > > > No, it does not indicate that. The interrupt storm happens even w=
hen
> > > > > there is exactly one context fault, and when the interrupt storm
> > > > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > > > prints. Once more, MMU-500 will assert an interrupt when only FSR=
.SS
> > > > > is asserted. This has nothing to do with subsequent transactions.
> > > > >
> > > > > > Do you stop getting interrupt storm after write
> > > > > > RESUME.
> > > > >
> > > > > Yes, as long as the write to RESUME happens after all other bits =
in
> > > > > FSR are cleared.
> > > > >
> > > > > > If you can mention your SCTLR configuration and FSR state in te=
st
> > > > > > sequence, it would be clearer.
> > > > >
> > > > > SCTLR has both HUPCF and CFCFG enabled.
> > > > >
> > > > > >
> > > > > > An aside, If reducing delay between FSR and RESUME write helps =
then both
> > > > > > can be done as part of qcom_adreno_smmu_resume_translation(). T=
his will
> > > > > > follow spec recommendation and also make sure fault registers a=
re not
> > > > > > cleared before reporting fault to client.
> > > > I think this sequence should address the issue you are observing.
> > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Prakash

