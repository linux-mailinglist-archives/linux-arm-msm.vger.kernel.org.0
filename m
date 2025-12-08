Return-Path: <linux-arm-msm+bounces-84681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01BBCAD7AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 15:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B459E3022D0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 14:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37115322557;
	Mon,  8 Dec 2025 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTkvY0HF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64489321F39
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203919; cv=none; b=GbQOuc3MW7TODUGmUPO768qGtWjs3vf/oIEmsVMbIHkEFoMMn7nQIMVeSiH8f0gJTuSwskjMIpi6NmeFVYYywkng7ACVIBGnvncRQ8cCcvsiG8ieptjGL8oXq7F6uiJDaYEKjXKF1rwnNXRKINXxc1kIp3ZvXvgmXQoxDZ3miQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203919; c=relaxed/simple;
	bh=6YknpHNSpsd47gssCVt1rVymWmohhzdBn9BFToQbqdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOYZQR2BkEdtk+8+M/+SIofA2tgPcX6chvIrH8DBI/QEAt5WW9pRqWBCRrx1uw0CIO79cJ6EYftBlzEFaGihzarbON3h83qFkg49VsYXKvf69+niVVyUMGOTTYsSTPBm1KgJZRGFQ/4HHRU5RsFOucpyigC1Voyptmn4PvxnjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VTkvY0HF; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2aa1ae006so603261085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203916; x=1765808716; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FM3AQ1FlOuXJ/e1AGMCOoW838tRWe4uRS3PXygGI180=;
        b=VTkvY0HFA+hFGYpnf5lHs5kEagyZXFAURFnz9ENBoyweIMGiL5CHCCaYsW5EOCeTG5
         /+knUGvsp7jmJEkoohOLCsSfiacFFruvL5kT53cRp3lNYJg0haFpu1sbEq1+cvL0Jkau
         DA+jTUorgK0sTOGWCA3gWEGmaIysP53o14KaYwYg+8mQJ3JA+Sts7U76UpvbVfbIbydp
         /KnCVp9eYLFfTFz2hPgaporCIi0Xi2L4ZIJTq6LPkCvtHvXGnSJak36kq4rR+qDELAqY
         ZrGvqloEUofCzh05FYUcgtGz4grSiWibZftnzXTQZSgzCqH1vMLxoDP61NMhmB1xL4PI
         JUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203916; x=1765808716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FM3AQ1FlOuXJ/e1AGMCOoW838tRWe4uRS3PXygGI180=;
        b=JDFOnMXtTqbGCGjklr73L26Mh3X5O/qhtKPQMgMDUG4ncOTn73z5QI4cCG40OHZpiT
         xe4o3Rv6gRCitWdc77FhYyzdIyTzZkqLRAd7fYUPPugH8eRAvsf+oyyCoGUIFaGmrTvE
         meDdK5V8A4YvCxVDLxbB5aDfSXu+SYYBP/PdBNFI1DrHSL7twcCY9HgS4t8LzLiYuwke
         zfRMqhhgwcxlMzG2PQrtwOndLHx0GhVIAH0e4ZfSXvsAT5Hy0Vfp/kfq1Us29jCB2VtP
         G3PevSd8T/48PI7IUagAKakOjbfRLYsHzc9Bncm5dJNLM3F0GvcB41qGnNl7LUNTSgco
         n/pg==
X-Forwarded-Encrypted: i=1; AJvYcCW8AtBXqVI0DLdCi9d7OKm3D9vHjLZO1X52BHWiirgdvfa43bYOOUSy9NZtdoWyotS5qbBE3KSNxgeTTFFn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtr/n+u4MvhcZpnqR3yju4MmGS5MQdYMdWjEZo7zyZ0BeP12i1
	495eqsGO4kl0WAnm4s/XNCKj4I2VQ7E3FQl4pczNhaP7QRE1ssPop5XvlGiNvxrsI65Dmp/MVLY
	zuM07nTL1Pi4g5vJvdoJYb5xQZbCzFPMaleNpksMhoQ==
X-Gm-Gg: ASbGncutkU2YF8CePADoB1qu5wJVCEjY/eTAYnAKvd3u7P8tWN5y55wEQEostmhaXVo
	WvJ9NI0pzFfgskWhj7N8FzEF6K0pwYDTdS8tSq0gDwdNkSVNqrQ+TGM/bV0sEojl7N3k0VOfbeK
	JuNqPURB23onhThUDDexWSDsJXs+WJQcX0KQg6/PDvn0it+Wpqvdi/gBt7xB0TNdnI28Hp8H5um
	PPADf+coUj3yhFLGE5lI89V2melDuAu79TMBz7suj2PwxMH+8whgOs3zbujL4MFBNTbv79nlfd5
	+ix7Aa+EX3+nMeC7H/fsE84sZJt649ga020d1UCoTmh/IgzH5uvyEZBNi28=
X-Google-Smtp-Source: AGHT+IG3nXGqXUvqpQinMeRU4VZSYr+qfgKJd+Lp5hSD72PxIPIMTaz7Kdxvcqdhf3pLsgJBW1+LG7bFtTruCD7BKWw=
X-Received: by 2002:a05:622a:2b44:b0:4ec:f156:883d with SMTP id
 d75a77b69052e-4f03fea37a5mr115385351cf.43.1765203916316; Mon, 08 Dec 2025
 06:25:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
 <20251204104713.GL724103@e132581.arm.com> <CAJ9a7VgV6chvWmeG2xta11YqyNpdRZqx4=EF7vC7k=J2utpRYQ@mail.gmail.com>
 <20251205102720.GP724103@e132581.arm.com>
In-Reply-To: <20251205102720.GP724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 8 Dec 2025 14:25:05 +0000
X-Gm-Features: AQt7F2okEBtfEyCOzornKkjPhmVhUUfg6M88kQWuVbbYdz34lne69R-Qv_-OWhY
Message-ID: <CAJ9a7VgYoSZPsm1jPniVZWZk7MHRAsRJwQGBxyNmndCcfnso2g@mail.gmail.com>
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

Hi Leo,

On Fri, 5 Dec 2025 at 10:27, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Dec 04, 2025 at 03:07:10PM +0000, Mike Leach wrote:
>
> [...]
>
> > > > > > +             /*
> > > > > > +              * QCOM CTI does not implement Claimtag functionality as
> > > > > > +              * per CoreSight specification, but its CLAIMSET register
> > > > > > +              * is incorrectly initialized to 0xF. This can mislead
> > > > > > +              * tools or drivers into thinking the component is claimed.
> > > > > > +              *
> > > > > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > > > > +              */
> > > > > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> > > > >
> > > > > I am confused for this.  If QCOM CTI does not implement claim tag,
> > > > > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> > > > >
> > > > > Should you bypass all claim tag related operations for QCOM CTI case?
> > > > > (I don't see you touch anything for claim and declaim tags).
> > > > >
> > > >
> > > > The patch I have created to handle systems without correct claim tag
> > > > operation is a dependency for this patch set. Thus no need for
> > > > override here as the core code will handle this correctly.
> > > >
> > > > The only issue is ensuring the non-CTI spec implementation will result
> > > > in the correct detection of no claim tags present.
> > >
> > > Your patch works only when a module has implemented claim registers.
> > >
> >
> > Per the Coresight spec - unimplemented registers must be RAZ/WI- so
> > this still works for non implemented claim registers.
>
> QCOM CTI does not follow the spec in two aspects:
>
> - Given the patch's comment: "QCOM CTI does not implement Claim tag
>   functionality as per CoreSight specification", I am suspect the CLAIM
>   registers are not implemented at all in QCOM CTI.
>
> - It neither follows up the "unimplemented registers must be RAZ/WI" -
>   the patch says its reset value is 0xF and then even can write 0 to it.
>

Correct - but my point is that the patch to handle lack of claim tags
does work for both existent claim tags and unimplemented ones, where
the spec is followed.

> > > This leads to two issues: we end up clearing an unknown register in the
> > > CTI driver, and then the coresight core layer assumes it is reading a
> > > claim register even though it is not.
> >
> > Again RAZ will simply read 0x0 - which is an indication that there are
> > no claim bits implemented.
> >
> > >
> > > For QCOM CTI, combined with your patch, I would suggest directly
> > > setting csdev->access.claim_tag_impl to false (perhaps using a helper).
> >
> > That would be a better solution, though as Qcom appear to have
> > implemented a pair of standard RW registers rather than the claim tag
> > functionality, the write solution works for this particular
> > implementation.
>
> If an IP violates both the rules for implemented claim registers and
> the rules for non-implemented claim registers, how can we rely on
> these registers to detect the claim feature?
>
> My feeling is we are building a house on sand - these registers are not
> used for claim tags purpose at all.
>

No they are not, but by either writing the claim tag register with 0,
or by setting the csdev->access.claim_tag_impl to false, this
particular incorrect implementation instance can be made to work with
the existing claim tag code.

There are effectively two issues here:-

1) The existing core code does not correctly handle insufficient claim
tags or none existent claim tag register - per the coresight spec.
This needs fixing for all potential components - not just this one. My
claim tag patch does that.

2) This particular QCom CTI does not implement claim tags correctly.
This particular instance can be made to operate correctly as detailed
above as long as the core code can handle none-existent claim tags.
The alternative is to bracket every claim tag access call with an "if
!qcom_cti" statement. (which is what was happening in earlier
patches).

We need to fix the core code anyway, and the specific QCom CTI can
then be fixed in a single location without changes elsewhere in the
code. This is the cleanest and least disruptive solution.

Regards

Mike


> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

