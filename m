Return-Path: <linux-arm-msm+bounces-91035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KibEcgXemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:06:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E5A2776
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CBF6307B715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FB636073E;
	Wed, 28 Jan 2026 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsuvMrrn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34455360752
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608788; cv=pass; b=nGa5OtXfqdjmtVkPAmBxLJyZRtK0WovYF1GbiGiiArDrLgC/en8PgsgTIHL8tS5LYmiS5A9FAYq+35o7X/Mk1uhd73geBH2c1YuYaF3Nea04OBxaZGLmUT1bGzHR4ZAFks+bws2vLx4GM1R0+rS1/fQPO5uhpL0gow8jvddzEWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608788; c=relaxed/simple;
	bh=ok4lN3GBDR/o+ur+PaNAJNe72coNVoH02qg97V0yfss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N69vFJx1m4Abn6ELW23f6Sb65hRFOOafb69dMz8o2iGK0yvmN32axJAQThB4/X/tpDQ0kAn0St8VvETTrHrBBTPiDm8Mb6R83N//qvJXeWqvMI6TpbqNqljjRRa9YxR9l4PnQFc6Q8/Tx9U1XB8LFWySI50TawNvILiYMmhp+dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsuvMrrn; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0c20ee83dso62933215ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 05:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769608786; cv=none;
        d=google.com; s=arc-20240605;
        b=Yym2NT4zlEDP/wWzfu1w+Pcg9Iu+Acl8Jds/nRq7iIMnDNzMENNbUEdzuhzbfI/rWD
         OVKEjepsSdOEB/m1uJAgF6GqeVSzos82F8/nfRbUJvMTMhe3zt3QPp9Gjmvy0me8yafi
         VRZxvrGXiVdn0qYrzMzWjO9wX/YohQ5kUpDj1Rf0rgUnJNNByZfF278ZcXXnJhqCsNPT
         ICfM/IWKEXF3XJAHUvgQ37vjdOhLF15o/At3DvVvjBsmtIkg92aEOYGby5w0/WNI+CLL
         c33mhY2zXaz88WgibeHnqmMed8/PnDpnA9fPjmXUy+x2GoGX9zHScjlBTXpaTcFD/3Qr
         Fpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyIMYNpDqg4C/aDlcwtTrC+GLPBzIcHHYJwuiG12S/M=;
        fh=2cDpFweNSTtw+9vKckjdHptLYU6YIydR4w+M+XW6FEQ=;
        b=gh9J3NOX7URUcuAe+IyDkiZwD9WkKYqDXnsGO4yyOuGa8fmf5DOu9m6fZr9r4dmQvJ
         8FMDUHIzA+ndOTtf1+RP/HmriuVL6i29ayeXCb3J4B21yEYNqDgQRrpE2CbEOzJQ3tv8
         s3Qo0jI5lo/XCqxxqylusamJzlZaxFD1MFUCyxQLQz7pG+N/PrE1zzxZKcMg3u32G/Xc
         W2JrrBl/CnrPJ2Z034W0htY/mrAsBDpkbQbY1SUcVw0oIaplL2UfSbM/z1C1zjLGzTHn
         p0q/c1aufQbo3tRdCD2EEbdn2w4feSsI8zhhBYbR5zvCDWRzafuiJSkvu1uZW12Soy/9
         94ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769608786; x=1770213586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyIMYNpDqg4C/aDlcwtTrC+GLPBzIcHHYJwuiG12S/M=;
        b=NsuvMrrnZVxG7lfQNU0OjqvmvLbi1+/73Fp1wMmHFKvsve/oqZdwPVlwUU61fn9U/5
         IUje4rLw76FF/XpZ1mZilDaGzEdpaNUleCL+XwPDgaL7puQe2gTTAGLJUxaiVHJG1Ap6
         L55dbalVJ1TJ4QDpX5tT508jhu9Flk1bKKdf8ocHO1BAhvn0T+vRrNLyqvfGt/bH4Rv+
         cPbxTvBhmMfQNmH9huYmR7uunlyYiqURGtvSWYIP6vHlJoQrNQGemphT6R2gEMTkl0kX
         17eITyeB7PtcyXEpji9NQn1lh8pFWZkcwK5mbDFM9HkhNLB0rUdc0DgvNrtp2KnT+vT0
         uvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769608786; x=1770213586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NyIMYNpDqg4C/aDlcwtTrC+GLPBzIcHHYJwuiG12S/M=;
        b=w4i/io5RfQyNQSq+/Kdq0GUD0RBbt+u+52BkkRpIy2Le4awBgAI6zVji+RwEbEw0qt
         EUHcG3CSA/Ya0Kd+8KLotdaI7Z2GaJmJ3cdGEbN2+99rE6qyeqrdkXN4ARd7VVn6cdrr
         eKY9IHeW67mttWOb2B5zGjAJYYujbB9Gs9R9zhf13lM0BhIrJKBFshRay8A0jF+yVBQJ
         +9aFxnHC9OjF5obNLec+kjbvQuXutzkDDQC3nrpTxM/fP2SWN6Gq+lk8s+Xc/moNsgsE
         Kz7ip21BrkhsLmOU52VpTqHuXFVZBxQTRgbkDNFPrJ5xfy8YLjLJJyDygnfZZdUwAziM
         rXhA==
X-Forwarded-Encrypted: i=1; AJvYcCXEXvFsNiIpotgJSfx74G13xayKsQPCa0CCe0afm0Lgh1EVWqOrsS4AIRueXJCet537QXpy0r4kz7dA+7Vt@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ52bg+9Z7jm+EkUNcub4vuvUg4+c6zL6sRvLaZ8IumDCCtsmr
	/zzVS8ZOB+mFfzWp0IRg5bl1yV9jSyND8zJ7s3td6RSK7UPZHGX0tmC7f8oRWlAYJFs6dmEB+P9
	C35P3hLHhKIquK3ugX1rs4M3M3ti+iBo=
X-Gm-Gg: AZuq6aKYBJHbg/+H6cMIgn51b2Xv+61YujpOYDb/x2FahX3NHSWGabKsXJquz/jr7ZW
	OK8ssjO+Vq8rjt45PKCGVhy4+qsZaK52Tg9VVgA4njmewbVAIqA1qG5An/uvu6spj2qarU0PmuO
	IlnlEJbxhmJVoCrTozcf/PdU96cDdtykevuEFfiylah7ZxQV82cZuigq8Ab5MaQzMRdlQiaRxzX
	H8rirhQmTWd37SpIv14RfWvj9SFOs6QyEmlsAPrdqjwuOcC0QLWCnI1Fl1/VXPFYNQlwWQjdPZq
	sRRSGTU1d1I0jPOYVEUdQG8WKNMM
X-Received: by 2002:a17:90b:4e90:b0:353:41e:1f51 with SMTP id
 98e67ed59e1d1-353fedb0be5mr4155911a91.32.1769608786326; Wed, 28 Jan 2026
 05:59:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127173736.82976-1-bjsaikiran@gmail.com> <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
 <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com> <93ea039d-c194-47e5-8a4e-975c144a1a25@sirena.org.uk>
In-Reply-To: <93ea039d-c194-47e5-8a4e-975c144a1a25@sirena.org.uk>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Wed, 28 Jan 2026 19:29:34 +0530
X-Gm-Features: AZwV_QjX8JkqmSF8OsGIGjBsX3OsVzW1gTz7F0JUfCDk6JOJuzhsExGRmN-_2Zk
Message-ID: <CAAFDt1vPGS9EFqQHdwSWm9G1NUC-71+-EFuFG_diksJy0=87Zw@mail.gmail.com>
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, lgirdwood@gmail.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91035-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B7E5A2776
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 5:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Jan 28, 2026 at 05:04:36PM +0530, Saikiran B wrote:
>
> > The `off_on_delay` field resides in `struct regulator_desc`. For most
> > regulator drivers, this structure is `static const` (immutable) as it d=
escribes
> > fixed silicon characteristics. Generic parsing code in `of_regulator.c`
> > cannot blindly write to `desc->off_on_delay` without risking a write to
> > read-only memory.
>
> Your reading there is right, generally the expectation was that this
> should be a property of the regulator rather than the system.  This case
> seems pretty unusual thus far but perhaps we'll see more such cases in
> future and should move the property but for now having it enabled per
> driver seems safer.
>
> > The `qcom-rpmh-regulator` driver is unique in that it allocates
> > `vreg->rdesc` dynamically at runtime, which allows us to safely populat=
e
> > this field from DT.
>
> > To support this generically in `of_regulator.c`, we would likely need t=
o
> > introduce `off_on_delay` into `struct regulator_constraints` instead,
> > and then update the core regulator handling to check both sources.
>
> Yes, indeed - if we were supporting the property completely generically
> we'd just not have the driver fill in in the information and store the
> actual value used separately with the DT property overriding the driver
> value (possibly only if it was larger).

Thanks for the confirmation, Mark.

Since the driver-specific approach is architecturally acceptable, I will ke=
ep
this implementation in mind as a fallback.

However, to address the root cause of the camera brownout once and for all,
I am now investigating porting the Active Discharge logic (sending specific
voltage/mode resource commands) from similar Qualcomm sister boards into
`qcom-rpmh-regulator`.

That would be the superior hardware solution, eliminating the need for
arbitrary delays. Since that involves complex RPMh resource handling and
reverse-engineering the specific commands for this PMIC, it will take some
time to implement and validate.

I will hold off on pursuing this delay patch further until I have exhausted
the Active Discharge path.

I thank you and konrad for providing the feedback.

Regards,
Saikiran

