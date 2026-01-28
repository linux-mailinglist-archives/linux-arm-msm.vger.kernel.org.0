Return-Path: <linux-arm-msm+bounces-90954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHCuCdfteWkF1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:07:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5609FF01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6D0E30234EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9234A33C530;
	Wed, 28 Jan 2026 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn9UA/5Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC323370EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598404; cv=pass; b=IC/Hi1tL0+5waqgfzKW8xVQsZnh9iaLHGdsFl9SaSo2ipkP14Q/7+a+rjBCVciQMOewmhB2hjPS5i9m0kLDN2eRU/G5BFSYHcq57l2QHl8IZNasw/4bgwRd3G/7cPXAgO39Xce3SQaBuwCmZRjffd4CDvqhYATxuKXiXi+c2/1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598404; c=relaxed/simple;
	bh=tlZJZJQSKkXNiO3oRmcJll4fZrpIYlUyn8nDv7x6yCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENepwK6j6ocL9Xz+maS3cVzlpHMzbFLd6U+gvgIb/LLDdtCcmpmg5aOU9B1Jbkc9aAKWff9BGcb1u0FDheksKHP5aZeEUJxsmCYsuYqm/5Cv0reznD22elOWx8YeVDrYdp/vTG6kW2AlfORP/uaVMv1/kusBOSNoUItAFLnCWgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn9UA/5Y; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso2366052a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769598402; cv=none;
        d=google.com; s=arc-20240605;
        b=KtMlmo0wLVCtPz2PZJLbnRlwaSH9Q9LYMIcax3eIKb+Jjsz0Mnl/RJgxKFLhgIfoAC
         DZat/7urIfdR2XMb9O9G+oyPWaNblbFoBPtQ2zfeRLdAiCE6TdDtIH7JC7djf+sBB7BC
         XMmXAcdjouycuNa7SSdYnznXPuEC1w4fc3mlWygivaWcJJjTA7n/88ghWw8jjBlJrZfQ
         A1CY6TmSy8NdHI7HKxV1hLswC8MDAJlxbvh1JupwcHRF+angNmM1hmSaLsCKMxG5AuGk
         rHdpllzKtgh5pC76SUAucdYEs4Eb1lwtbhC/8vslsYf5GrwBIwghiT4GUXBgnBgYEVRX
         1OJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iehbJd+UIDp8Q1SlQdBUTNiTOO6DfX7pubCoSt3jyY=;
        fh=v7I1nm1gOsuBFGVWyrMe28QNrSMWwU+3Utw/hu0OOA4=;
        b=E7vi+NlkzaThvttnZCToIloOlcf6lw0/N1978bkpQsijjrtQ7B+OQSEWUC9R7a7tES
         ck9mR9Regfu76WiOI+g6oGvDYB/au8RSQkKKdLX7aE6CY16THkp7wSjhFcXhcdfBzuj/
         yjjmUHrDe8Ay4axWiJs1eRAGnjhXGvrTNecqYvnKMOn+ZOw8sccSJE/V82dCsUURLGm4
         IThaOUug1tSwq9Bo8oSVfTWzAWvKx4t7W9//YnMfOCrPv57QLeGVIZc9i9lveINiVLiy
         tTAM27F8Afjzo99qB/9hB7jac2hOvVkxotqb9oXLXmK9oaLPpAsl6EF/xQPyWhkf/8p0
         TjJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769598402; x=1770203202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iehbJd+UIDp8Q1SlQdBUTNiTOO6DfX7pubCoSt3jyY=;
        b=Tn9UA/5YPyCSpQ0OSVlsaaUimKJ2DToGxNz7wmSnIIV3mXFT/6BZVyMQE41RnuHIqC
         GXjX8I2NqeTuS3tLoITl3PGbGdplNSGoPNMc70UeAH6zHyeoINh9cf4q5oXJzv1NRjLC
         wS6oIIJJKkTIcOasn0C7L37MOYTkCCb4NBhiEg46RYAMtONocQ3DU11Pagx7ocLnKyP5
         +X3G5zcvcabGtAQl1bhk0MCQYfQYsO1AI53kVf3L/7LrfaZ7ciodKxvb7gkRXcniKcBY
         Gd3P92C4NNPdkGWGYzrrLJ/fN/Ev46nQ2GDa3688xGKaPtjIZHGAvmQOLJqirjZOMaPK
         1Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769598402; x=1770203202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6iehbJd+UIDp8Q1SlQdBUTNiTOO6DfX7pubCoSt3jyY=;
        b=OxLiOW0aT/GmHjfjDpBh9PBGHjo6EhCoT2zXhj+7QVDUUF1Y2zdRgKN19XBmHXtkVQ
         OObLPQDzk/R+cqWcbEh1Hx9Gx3sqIqKJuZnhOtADjHXUwsZGPM9nQUlrYUj7zfZF4M1X
         Ym60SYOpJNsSIBtYOOC1aBB7UghI6d5SAOQn/syYrkr1Ww5VeFPBZ7cNLQRvpdnBal8m
         C880MmVR3XsQwOhKiSEhjJkeCF0VIDy91Vka2J+UvbAneTE/kDe/qB5aefRjAUoxeD+M
         04OGORI+R1Adkh5i8iwFjTn0RENALed1bP9DS7rbpve1CEPVfR6SpyIXTnOk0Gtta9A8
         6mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjoYVOOToHPxAtUUWwgf6Mlw36E2vKxmQn77FEeK8t4Qu3SDtHdnLDWW1Z7fmnXkrYo4Wk+qheN2rOW6/G@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4lENeLg8dBX59TDA+owu6FcEKGGZcVHLANMpJzhzBWOyjKBT
	AbMydIyebOzoZumhrrpcu94ylggZstif/1BfFbuhoXGrWyNutHUkhy5xWiMSwAGOGZyR/PdJMyv
	VaLVmdzP11pvt+Gy1OC77eqvJfopH8hs=
X-Gm-Gg: AZuq6aJrRWUhjNNUjB0kVuLi4mTRGP1awQNZ2TIlDcVTkYoyaiztTyC2+bIILfL8rfu
	ooLRrRvUCZzMoPmRCHQASbIA63dIVuy74QkhDaMANYUI1O2zETQlPYc22/wWTlM2CibrFKl13r7
	/5KbnAJfiO8tpgLumTIqgE++bc8Yi/SCRTuYuhiRh8xrwgn4nudwv34vu2cRM8XcFUQmNC0L810
	9lA5Ms1pHchqYYS9en51cz6Agzot/xRxb25uHGTIbst84+JthOjg4pS7fxG0NO8PXii9PJ2ywvX
	zFUsq6idJ1VYgibzUWSphVwIxfuXGw==
X-Received: by 2002:a17:90b:1fce:b0:33b:bed8:891c with SMTP id
 98e67ed59e1d1-353fed7583dmr4882896a91.23.1769598402141; Wed, 28 Jan 2026
 03:06:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127165024.46156-1-bjsaikiran@gmail.com> <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain> <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
 <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org> <MZajBkG4hU2kIZFDZbpq0WZOF_tJmASpmGr-7IH_qheO0We0Z45KNZPrQY4UmoqsWKOX3lSx1W_hnLtfKocXPw==@protonmail.internalid>
 <CAAFDt1vmXg9L6axsDN6kpCQKZifOCRxtQeDpmRpHyejS1ORR+Q@mail.gmail.com>
 <92131a67-471e-41e8-83d6-4f802103db7b@kernel.org> <CAAFDt1sqh=O-CpxbdcWueyqbiq4qyCrJHVH-_SS+KjEC9CyRhg@mail.gmail.com>
 <6692ca5f-216f-428c-96b2-511fdd769f04@linaro.org>
In-Reply-To: <6692ca5f-216f-428c-96b2-511fdd769f04@linaro.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Wed, 28 Jan 2026 16:36:32 +0530
X-Gm-Features: AZwV_QjGj33Oe0Ps4oMG4QaXGMTLWPDmeXkw3rvX735y6bmXITlBkYGCSsX6YCw
Message-ID: <CAAFDt1u0uV+KpPxrhtwbvWgAYQET3HLg1nu4u7JgaNPFAKNLWg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and timing
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, rfoss@kernel.org, 
	todor.too@gmail.com, vladimir.zapolskiy@linaro.org, 
	Hans de Goede <hansg@kernel.org>, mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90954-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F5609FF01
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 4:11=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 28/01/2026 10:19, Saikiran B wrote:
> >  > Just to be difficult - I'm specifically asking to test never switchi=
ng
> >  > the regulator off - not having a long delay.
> >
> > To be absolutely clear:
> >
> > ***I have tested exactly this.***
> >
> > In my local v2 testing, I modified the driver to keep the regulators
> > permanently ENABLED and only toggled the software standby/reset lines.
> >
> > Result: The camera was 100% stable over hundreds of cycles.
> >
> > This isolates the issue:
> > 1. CCI Leaking? No. If CCI were leaking, the "Always On" test would
> > eventually
> >     fail or show instability. It did not.
>
> I have to say, I'm not an electrical engineer by profession but, I don't
> believe you can make this blanket statement.
>
> What is the problem with testing the hypothesis ?
>
> > 2. XSHUTDOWN Floating? No. The "Always On" test relies on XSHUTDOWN wor=
king
> >     correctly to wake the sensor. It worked perfectly.
>
> Yes I agree there, if always-on shows no failure then XSHUTDOWN isnt'
> floating.
>
> In which case this patch can be dropped, its not helping.
>
> > The instability ***only*** appears when we physically toggle the PMIC r=
ail.
> >
> >  > Do not believe we have root caused a regulator brown out
> >  > Believe we should interrogate the LDO settings
> >
> > I cannot easily dump raw SPMI registers on my personal machine, but
> > we can derive the LDO state physically from the discharge curve (RC Tim=
e
> > Constant).
>
> ?
>
> I gave you code to do just that. If you can iterate sensor and DTS
> changes - you can use that code to dump out the requested LDO states.
>
> > We know the physics of the PM8550 PMIC:
> > - Active Discharge Resistor (R_active): ~1 k=CE=A9 (Typical)
> > - Bulk Capacitance (C_bulk): ~10 =C2=B5F (Estimated for this rail)
> >
> > Scenario A: If Active Discharge IS set:
> >     Time Constant (T) =3D R * C =3D 1000 * 10e-6 =3D 0.01s (10ms)
> >     Complete discharge (5T) would happen in ~50ms.
> >
> > Scenario B: If Active Discharge is NOT set (Passive Leakage):
> >     The rail discharges through the high-impedance sensor (~200k=CE=A9+=
).
> >     Time Constant (T) =3D 200,000 * 10e-6 =3D 2.0s.
> >
> > My measurements show the rail takes ~2.0s to reach the Brownout Thresho=
ld
> > (failure point) and ~2.3s to reach a clean 0V (success point).
> >
> > This 2.3s duration is physically impossible if the Active Discharge bit
> > was set.
> > It mathematically proves the LDO is in High-Z mode (Passive Discharge).
> >
> > Here are the specific logs capturing the failure at exactly the 2.0s ma=
rk.
> That's great. We should be able to interrogate the PMIC regs and see the
> state of the LDO configuration - code I've shared with you.
>
> If they show active-state isn't set on one or more of our LDOs then we
> can write some platform quirk code to set them.
>
> A 2.3 second delay on every start/stop stream is not an acceptable
> upstream fix.
>
> And please stop top posting !
>
> ---
> bod

Regarding the register dump code you shared:

I have already attempted to use it. It fails to read the registers on this
device. This is a consumer laptop secured by the Gunyah hypervisor
and TrustZone, not an open development board. The SPMI transactions to raw
PMIC addresses are firewalled by the firmware; the Linux HLOS is physically
blocked from reading them.

You mentioned in your previous reply that you are not an electrical enginee=
r.

I am an Electronics Engineer.

The assertion that a 2.3s discharge time proves the absence of Active
Discharge is not a "blanket statement" - it is a fundamental calculation ba=
sed
on the RC time constant. A 1k=CE=A9 active discharge path cannot physically=
 sustain
voltage for 2.3 seconds against a 10=C2=B5F load; it would drain in millise=
conds.
Rejecting this derived data because it relies on physics rather than a
register bit (which the hardware prevents us from reading) is scientificall=
y
unsound.

I have a full-time job and have spent significant personal time debugging t=
his
to the millisecond.

Since we have reached an impasse where the physical
evidence is rejected in favor of impossible diagnostics, I am stopping here=
.

I will keep my patches in my local tree as now my laptop is usable to me.

I am withdrawing this patchset from upstream consideration.

Thank you.

Regards,
Saikiran

