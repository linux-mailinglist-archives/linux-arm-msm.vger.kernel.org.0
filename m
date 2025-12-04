Return-Path: <linux-arm-msm+bounces-84388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB31CA427D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 16:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 561293019E26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 15:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222262D480F;
	Thu,  4 Dec 2025 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M36EluBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA326C3B0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860845; cv=none; b=EE5Pkpz1zDG1qK/7TVxTQI5Ls6FBJF9Z1fLs9oQ1fzltymMKPBsjtfgOvDclPxMorjeyKl0fGH8VjEQPIYBoUQ+STDQOTP68xfAW3751nZIqCEYbMMicyatR2bJIqImAJpgrgcVokpFBKlLDJwSXCouio89fPzOdn9yr9tTnJMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860845; c=relaxed/simple;
	bh=Ja86UX6/jGWNSnoaSe5E0Lq6L+Ga8DrzI0NIqJ1VnT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r78qIP4TD2UJmtsI/c+L49cjl1XHZn9EIIA9kRgNyUo04mdoVwu3NPueFll7RYfacM+m6OJT0rgm1XQoced1n0uaLMg+t5J05vaCG+Zt3/VQNeWSjAKhWCuePWAnQIcDabvI5VZ4Ki/w88y+qPoeeotSoq4jqZYw/KxIDca3rcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M36EluBw; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2dcdde698so151223685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764860842; x=1765465642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjHwpOaJDmP0t3MeUI8ElolfA57YlcBm5BKDBzuz6TQ=;
        b=M36EluBw6ou/UeHeUD7CB1F//aIKaSLDJuRnkLVOR8hCuiiJD5gKiSsq4bQCmlzM1z
         ocoGJBiHdWvsJvCHFZ4KOoPFeC2p3B+of0Q32PMRdDIQ2n8ue/i3Gb/Me4ViMiMi+car
         K2jJl/nLYjC7lRP0TuhThiu953JvYPK4+vrTpU8qPaaPVcnqnjkAxn8RcCBDS48JZVK3
         EsolzWgawVTq92HrUkD87eldWyPj2qq1zVBWJbaiu1X2gRJiu/yKzSIfdRrWJ5uLeb5f
         85CqpxtYpPbX07or3OrFwE4Cl8Oywcj2Bw4ksL9OOFpllPl3j/DWxh0LCFvX/lWoTECQ
         qovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860842; x=1765465642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjHwpOaJDmP0t3MeUI8ElolfA57YlcBm5BKDBzuz6TQ=;
        b=uiZB9z4PgbTCLutNSA+rsLm3xTBl8GqJJeMh4fwbCOX6gCImc15M1VuBcANCoxJrzK
         DmLEB2XmsmbEd9v1T7VqrlBwhPj7VValxsk1Z/FYpw6ZzpkoihYq/dahV33M5iOZ6D2s
         BIUyiCWTxlHKfgt3xuzcn5cFM0ce86KAZMfa9tSAKluxv/deQzY2zEXT5g7BNjkFyb7m
         zzJgkcVtN4KYeP9sIRgxyRhA5PC2chvaqwFKdDmIW8mYUR5SP1alyolUIUWyPdnoFRCn
         XuVBijwfGOBgNq6jnRxNpkBVhOmM0xYCLtsxbflIGfeIF/5mm2MQx3j32+WyfWaneQb9
         VLkw==
X-Forwarded-Encrypted: i=1; AJvYcCX0tqfQMvYaa0abAZi8dI06EaXLjxyemimcyYlDiicxsEgi7yXNhtZLzPsm4YX/LqIXKRL1ZGBDstm/nIJd@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZrU5Kq3PlKYbqpOksHlL7qWyFRT8FTg9AWZudyHr1NF7cM4J
	3TK8urWTWz2oYAdwi0VJVGqnXTXPrufmyCAE4aVO2I1GJu2XM9ywnM00R0rmIJ3jRdiqR3V4uEh
	rSLmbZFnl404pLw4ltbEyH8or9pcTFNPDtDIp3yzDhAxeMMGqtGfy
X-Gm-Gg: ASbGnct9Dye+UgduvjmiS8nXhjOpGLx57s74p4rLplkEQBiV+lIn/fNlAoXU71qarb/
	TSW664z9/oKXmZ6xP0dn58sGZmVYmr3UJOp2Yb3jRKIHk4WpVFZWSPD/4Be9vm52BnIMPeDh5Ui
	ggMWOFGpbR6Zd3hphwhzUijjr/GWDiBxwo6N+ikAFXW2mp5cUDpZqCp8cvOHVeq0Tsbsfijr51Z
	x3wl5qUwIPNc6tcYpYKq/1yiYQyoY8oAC+UuNu2EX259OdcI99y3NDS5NqRjriglwDtP1TrLFJo
	F4Y4xYeAG1NitMEDcHLO7YSQlhJQ
X-Google-Smtp-Source: AGHT+IGW4QHe/3D4ozEpzDM51LfMiRME80VbqEXFqmEzO/LEeQXjUvDFBWO/0int2YzlU5zMoEDkYH97s+NQOJMcWzc=
X-Received: by 2002:a05:620a:1a9c:b0:8b5:a0fd:fb5c with SMTP id
 af79cd13be357-8b5e6c923dcmr872267685a.57.1764860841778; Thu, 04 Dec 2025
 07:07:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
 <20251204104713.GL724103@e132581.arm.com>
In-Reply-To: <20251204104713.GL724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 15:07:10 +0000
X-Gm-Features: AWmQ_bnB9RPHEhVlkAJoAfLxxhVlrvDqC-dJqQafsxrkuGYt4hiNi28eUPF-ZaM
Message-ID: <CAJ9a7VgV6chvWmeG2xta11YqyNpdRZqx4=EF7vC7k=J2utpRYQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Thu, 4 Dec 2025 at 10:47, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Dec 04, 2025 at 09:15:07AM +0000, Mike Leach wrote:
>
> [...]
>
> > > > +             /*
> > > > +              * QCOM CTI does not implement Claimtag functionality as
> > > > +              * per CoreSight specification, but its CLAIMSET register
> > > > +              * is incorrectly initialized to 0xF. This can mislead
> > > > +              * tools or drivers into thinking the component is claimed.
> > > > +              *
> > > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > > +              */
> > > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> > >
> > > I am confused for this.  If QCOM CTI does not implement claim tag,
> > > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> > >
> > > Should you bypass all claim tag related operations for QCOM CTI case?
> > > (I don't see you touch anything for claim and declaim tags).
> > >
> >
> > The patch I have created to handle systems without correct claim tag
> > operation is a dependency for this patch set. Thus no need for
> > override here as the core code will handle this correctly.
> >
> > The only issue is ensuring the non-CTI spec implementation will result
> > in the correct detection of no claim tags present.
>
> Your patch works only when a module has implemented claim registers.
>

Per the Coresight spec - unimplemented registers must be RAZ/WI- so
this still works for non implemented claim registers.

> This leads to two issues: we end up clearing an unknown register in the
> CTI driver, and then the coresight core layer assumes it is reading a
> claim register even though it is not.

Again RAZ will simply read 0x0 - which is an indication that there are
no claim bits implemented.

>
> For QCOM CTI, combined with your patch, I would suggest directly
> setting csdev->access.claim_tag_impl to false (perhaps using a helper).

That would be a better solution, though as Qcom appear to have
implemented a pair of standard RW registers rather than the claim tag
functionality, the write solution works for this particular
implementation.

Regards

Mike

> This would be much clearer than the "hacking" way.
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

