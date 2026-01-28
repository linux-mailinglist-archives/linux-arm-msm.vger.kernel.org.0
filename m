Return-Path: <linux-arm-msm+bounces-90982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J1SA8n1eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:40:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1FBA0A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 127F4302FE55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AE53446CC;
	Wed, 28 Jan 2026 11:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUNU7Kw8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013932C92B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600088; cv=pass; b=hfax35CVDkqxml1/B3UNY6lWg3Fph83oNBfi3Tk3se+8rkeUpDJncrmS2OujyGoTk55lguuLeRz1QsWmS2Ln91E58EwTvHPv/nWeHG6/qvQswLk+7ABw5YorGRZOTQCnnp9ngFLymLRuT+zFPjgJ0u2tv8RLiaJY/3G1lsvcZ1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600088; c=relaxed/simple;
	bh=Oi9kvix2cbbkzfsw4XtXqNYBYsLLQzazNmaxTDKH4uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gku+6zT/vOUPaxFUc59rCc6edW/qyugxeIrps6E+PYBs/9LzWTUFI9HFQmAcpRYm8p/WEPbjumo51MY/aB7DtJQrKRsZBgAs702GVjoe4GeXGl7r/K9w8MSBqBDjJYBEE0uGjP+i30V6Uki9bt0m/DDu8TTi/XN7igAqBfmoNHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUNU7Kw8; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3540266d356so957986a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:34:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769600086; cv=none;
        d=google.com; s=arc-20240605;
        b=Ceeae+y4BRA+ihg06+3QBHM2cFWSZnLR4KeA/2KYq1BO45u8ga+r2Z+XGXTIFd1j2D
         6YlbkKj4e5/cmrflxCV9foSlh/Z7B1noad4s4M4xlGFXhuM2amUZ7hTWCGK6Sy6ay+6v
         +pANJ2/tvBp9BT5rPnoXWKAyM+faCVflwB5BUGedlQ5xKq0VAt+csugs3OTWrHB5Icw/
         cz5AiOCL9X/2veRIVRNaCkK8b8FkC7nwkwgpHhEfZPGkJZroMI8GdYo33Ru3F/fImJh6
         FipWfNRbQL8NNh4WyAfRiwUL1JeewPzGQY91TPETJUdFvKJmOdjuFdC9aHGfcomGnvug
         TGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OUKmfCI2po6iE4Q0mFvGjQolUgtphxp4NQsh75WOJ30=;
        fh=tJ8gd7Urc9vN34npgZ1aTjyglpn1jJJ+Hc541NjOeRs=;
        b=PMK27DdkCjC0c/wU/a6En+TQ4eXMVnteyZZh92Vwki1eXGPl61AmC+Veq1n2utcHjG
         HeDcB2iHYbSe3lC8dDDMkJiPhUrBco4aymrSSKfGX/l59ZsvHbuVDV68glWHp0gCf/c8
         lOHb3luIN/vEFtf1i7U/zEmlOAjTam5tlg70vCw/HfSrk634ndRzM+EZ5E4zd99OrR1y
         KXQOfzuGlqKCLO1rvgVHJTPGf+PZODz5RuxKizkA4AKkJx1grOJZzPq42FhFaQpp8vHx
         Q/6hgGOxpRfH+KUPoiLUQDxWKvXBFB0jpaFbZg731fMJj5vjQxwDH08N/ipkxRRgBAQ/
         2ZSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769600086; x=1770204886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUKmfCI2po6iE4Q0mFvGjQolUgtphxp4NQsh75WOJ30=;
        b=GUNU7Kw8nBkxL26Pg7E9Cuhz7c5/ey/pLcP00dP+frqJmYk8cZTcKUu4+WMquhYtIW
         tSKRJi58Nt2Qc5449R361I+n0lqJa6RPG7PwKSWTKeDM71qgwcv8XJRzVfjYIrPxge88
         wETMTqXwujzO+VLWVyxbjT8/HasOeCtQS9/6BuC21a6hdW8++C+PPQlHRucmw7JIWbKA
         u9lTRK6ybEHJIhEFh9fQMTvnyx3pxGCxHZr/2pKMKWlD/GWamHcUZdddeBhvhp7OGxYt
         rVxhIEFBDbE11FFuwxLSWBzfjbfoK/IXr+ZrMA/8Hs91V7CdTrnByEwt9X4goj8n1BWd
         Y+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600086; x=1770204886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUKmfCI2po6iE4Q0mFvGjQolUgtphxp4NQsh75WOJ30=;
        b=r4yzJSf7ZgDyyr/dVy7IrkEpszVfLboSN6Xwi4UlSSn/9wlftuW4pgCMkl4GsStihv
         AiuseiAbLgjfv5wnweCmrL+MMR8L2N0CJOMRbkOgQ623ThhtLZF6rjMJ4N+XaMQGPmST
         ykL8CePb2ragnwc3H+JH+/9pfANzdCivB2x0c8oVBTIxcpKlEvZrXYyrspQZWorQh/4M
         INpuCb89PEV6Yqhiegl8NPq7J3WQVRQZE+cEpW6e4HH/uhmrhHRdqGXbojrxcyJViSZY
         SokYKoYCH6FnVFDoi484T2uz+X2sqxWE7WSTTF5Sjgo3YMLMns+B1ml8RLL0KfZeVoMd
         hAVA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZUekp2ezFYFtnmMRJYWJKPvoSNb3+a6FNsXUOo23BsmbIa6U7+kx2U7rj6gnUbEIQQwP1CtxLviCCuGf@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+0Irmycq0p7HlB86KO/2rAH2WyDGwZgZ+AH8+o+MyIH+1wUw
	GERxpEtWeCCtBn7A/WZ5FgCQu0Ekg4blgdWb3/9YSc3TInP8GrsJKwDDTBCzf6/+aXycq8ze4El
	iKKk/3vScMO4Je1oQz4/cN7yXBHOaebk=
X-Gm-Gg: AZuq6aLb8Heg6bghFfNxkslLP7wJbi0ltndidLP0fXeDR8wgmZjRIFLNo/wLTL/n6GF
	XsC54ykeqODool5IgwMx62TPOwji3mWHmQAj/o+Mwde9+Cy2jdGJOKH6/rTNqu+vutRzTuxASt5
	foIDB2+1J7Xd7uEFtL+J+FPIIhgW1kCfLm6ueiUGIApLe1u9dZ5R5WmoNC6LYvYQW2SviXl8QTj
	Ragb2Yvzb9JBMOzuEBE9AOoddZzFnrnSWyEak9czuNnjxuKfzQxuP2a4H1OwlrT2KCM4FRBIvXh
	eGush3ebwLQZHmGaDUFguCUkd/fPrQ==
X-Received: by 2002:a17:90b:384f:b0:34c:99d6:175d with SMTP id
 98e67ed59e1d1-353feccd3cdmr4303891a91.2.1769600086234; Wed, 28 Jan 2026
 03:34:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127173736.82976-1-bjsaikiran@gmail.com> <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
In-Reply-To: <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Wed, 28 Jan 2026 17:04:36 +0530
X-Gm-Features: AZwV_QhdqOpP6ey9p53bmACaidyFct267hS4ZpKGg8GV2Hct53cmTZPXN-Hi0WQ
Message-ID: <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com>
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, andersson@kernel.org, 
	konrad.dybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90982-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E1FBA0A5A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 4:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/27/26 6:37 PM, Saikiran wrote:
> > The core regulator framework supports enforcing a physical off-time via
> > standard properties, but the `qcom-rpmh-regulator` driver currently ign=
ores
> > them. This prevents boards with slow-discharging rails from enforcing s=
afe
> > power-cycling constraints.
> >
> > On the Lenovo Yoga Slim 7x (Snapdragon X Elite), certain camera regulat=
ors
> > rely on passive discharge and require a significant off-time to drop be=
low
> > brownout thresholds. Without this driver support, we cannot enforce thi=
s
> > constraint via Device Tree, leading to sensor initialization failures d=
uring
> > rapid power cycling.
> >
> > Add support for parsing the `regulator-off-on-delay-us` property from
> > the device tree.
> >
> > I have tested this on the Yoga Slim 7x. When the delay property is pres=
ent
> > in the device tree, the regulator core correctly blocks re-enable calls
> > until the delay passes, fixing the camera brownout issues.
> >
> > Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulato=
r/qcom-rpmh-regulator.c
> > index 6e4cb2871fca..aafba61551b3 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -503,6 +503,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vre=
g *vreg, struct device *dev,
> >       vreg->always_wait_for_ack =3D of_property_read_bool(node,
> >                                               "qcom,always-wait-for-ack=
");
> >
> > +     of_property_read_u32(node, "regulator-off-on-delay-us",
> > +                          &vreg->rdesc.off_on_delay);
>
> Would it not be a better fit for of_regulator.c?
>
> Konrad

Hi Konrad,

On Tue, Jan 27, 2026 at 4:00 PM Konrad Dybcio wrote:
> Would it not be a better fit for of_regulator.c?

That was my initial thought as well, but there is a limitation:

The `off_on_delay` field resides in `struct regulator_desc`. For most
regulator drivers, this structure is `static const` (immutable) as it descr=
ibes
fixed silicon characteristics. Generic parsing code in `of_regulator.c`
cannot blindly write to `desc->off_on_delay` without risking a write to
read-only memory.

The `qcom-rpmh-regulator` driver is unique in that it allocates
`vreg->rdesc` dynamically at runtime, which allows us to safely populate
this field from DT.

To support this generically in `of_regulator.c`, we would likely need to
introduce `off_on_delay` into `struct regulator_constraints` instead,
and then update the core regulator handling to check both sources.

I opted for this driver-specific approach to minimize impact on the core
subsystem, given that `qcom-rpmh` is already set up to handle dynamic
descriptors.

Let me know if you would prefer I attempt the core framework change instead=
.

Regards,
Saikiran

