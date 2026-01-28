Return-Path: <linux-arm-msm+bounces-90902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKHAHwupeWl/yQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:13:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7279D5CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7140300E62A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 06:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC9D335547;
	Wed, 28 Jan 2026 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX5WzGst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2F28D84F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580807; cv=pass; b=FFy9vfdunpRtGNbnAT94LJ/GG2s3dnHtux3dKRclNrdF4gR7bXkUADpNNed09fqeg0SlWz98BEg9wTf0DiQWDMMLd44DoZXd5cdtyLhb/lwJu0iA0sFaBDcuPJYlvi7D4eZxJ++GGKGaLc7cdtyIhZOLfDOtR0z0I3fFSjHdnlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580807; c=relaxed/simple;
	bh=tqddoDCLroltCsSKqC6Nf5CllV6GQ/uqEovi0FtQd8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0aFo5maf6q2DSks5yEPnI+WF8Ne0yVeZVejvphtVjXQmkTTlJapy9+2aMvrAUoWFczDzxC+YVPKFrfkg+CKX7NWFFwFiIzjhFDC1MOtl8sxodpxgYwK/82z4FAkasXVZSp0e9LL7140vSmsVPDgyLyrpJJQPRCO3XHFpigjI44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX5WzGst; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-353576abcfeso2679781a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 22:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769580805; cv=none;
        d=google.com; s=arc-20240605;
        b=Sl8UKPti5SpvWLx0jo77DsGANYeVnFrhCKdHadQaGHgtkGBUMTuXuXxnXOCBEHIXEc
         ZPvnCtnxb+cJ7GuoEKdu5lBlIYhGRAsOEk010zR183cAPXXopZV6dgRWt23g9x6j7pAa
         JjHfwglFTMEIycgkhorNdqaFLuXFuVovoHgM6uC3UUMXtVzDxraqw988e2RV+26X9xwb
         hoGJNPcLE4bJZuIho7LpIKp0f0uORIbr8fy4QMC6ClHSN7sSQTizVDphcRUKqjeKJCfo
         PM8mg6DRLDg66jruhbl+KlIg6TPHZEVQ9x+dLFw3Q1dsqhV4swWapWT68Kgw+3Z5am5o
         ZsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kMYTavVqOvFc0O1j5E4t/g6tpbD/QV7uvM9acJOgDnQ=;
        fh=1qgUABY3tHDU9Rn6U8kXMez1mhIAp+t0938hmJkKFLE=;
        b=QeSvw30o1HpLbYDEXdm37vEkgP1rqm62T2wD9M5xIkh87jp8nDz4cndHeeDqAmaLTD
         WdDwB56APvylCR3nHYg4iHIvZprtFSTt1iVmB7jebGqw8YLzxb7QOxlfBPg5h3rtsCDB
         SYv9mqgUcbsX6zDWxpWV4Zwcj3WZu2pM1PElfXywjwEQoW0EdhaRbZSu8aZFZhZPUdhB
         Nu6lQkFER/1fRLlWQzHkgSvyG66NaLR9PONTUGkP3MjbATwiGDnQXmq9/sYy1F7pF5S0
         0O6ClVxNp8tSlTzARbrHg4IHoFaH6Jyo+iM+zdNRMiURvfltBjiwlLy17s0rTQY5AOIH
         vwtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769580805; x=1770185605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMYTavVqOvFc0O1j5E4t/g6tpbD/QV7uvM9acJOgDnQ=;
        b=XX5WzGstRUTzA2qXpXXtrYpNsmNtcHmyhVt2c0TlBC3ZlD/xY1a+VsgQtw6ALSvoQs
         IL8w5nCEd5BxtOcUEG2RZq3C7jEuRv57OLN9blAxhJnA5MIpx61csvxFLLbxcdrYrbpi
         SaVenK7XqvqnMj11h7aurPPGBeZD4Tnf8378W+ASM+CNm3ZmC+vDBsGx/1ypcZ7TLs3O
         AhUiJ6rsXJQWCbgCv7dnfNpnJYzcgd9MsUz+kRcRDgmAmxYTC3uk3d29U6ipPJ5jN7Fi
         3L2o1SeDLlj1ZG9sxvsyjhLIXlZpjSCLhn3WEDfEvjjXSJjINkecTNqotNxVAwEWbW9o
         akvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769580805; x=1770185605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMYTavVqOvFc0O1j5E4t/g6tpbD/QV7uvM9acJOgDnQ=;
        b=SY0FefpQSXtolrrRSsVFuRtxhKcT3lh026xzLqZKVft9DNwGtOogo1frpRKF1ZF5vw
         9IevQ1xnQ6wejlMlfEvSDCX14eImoHdfgURiZTxDs6aywub/Ugg51pbLqAVhcktqPbRL
         5R4S/5O9FvKPgD4NrdCJhUp1J/rNZA+veoC2suf6U2XvPi3WVCHOEcDUz+YAbpf60DP2
         UmHukUaIkKwhwjaZU9+heE57xLZZXyuo1al4pvrYPp5GDAetimERcTsxnXCZvp2s9FCW
         eT5LQg5wdpn848BNh6BNFbY5SrUbgacw5sXyEnpyZcf5tPdFmx9XgCza2229mkAg4JJb
         FKHw==
X-Forwarded-Encrypted: i=1; AJvYcCUANHRj6fAzUu0gB/TA5u0/9yvob/nUhydIz+durbLbATpLyNUFjXBRxFwP3uYscP9e1kuz7pD9sedldUp7@vger.kernel.org
X-Gm-Message-State: AOJu0YyNyITy3WXlqd/aL5jnn9l+4w3FQ3h7Cn1ZRR2wrGd8FuzYDuRJ
	BD91/8ZBrz2CGjchjsqKRMSgPgrJSH5KGqYP3UZ3yRD45U/FqZg5u6PHM/e6abKswRzjgY5rYkP
	R6/F8nN6xRKLPFgUn1Zhb4nuR82CMHn8=
X-Gm-Gg: AZuq6aKkGnO8eBqoT3QqwAfUyPAQ8XLJSh6ltn8AVcq/K3Cv/DQg6bGYLLEG9IaRrQf
	vO/oi0WaSioH2/zgWA9cld9/+pS/Cr9AGeIag1S/IWIb/ilA1vznPpfImZPexuX5AoFreOGsEbr
	7iblwqBComzZJ/Cmsy8Btqgsjqt/pe9civ4mXaX2zTUe2f1fHs77EmRN+WL2U7awyDVRxXtPwg1
	ICVI/7TWK63YAoxFFlPTz5ENP856dbY0FGl9EkMskfQgJZymsQ7jOxTG3yF8xOvOYyPu/hawYyR
	SsBwYN8xrvbEDX/20JXgmAxn1hUA
X-Received: by 2002:a17:90b:1c09:b0:352:ec7b:3cc2 with SMTP id
 98e67ed59e1d1-353febc19d3mr3681624a91.0.1769580805194; Tue, 27 Jan 2026
 22:13:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127165024.46156-1-bjsaikiran@gmail.com> <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain> <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com> <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org>
In-Reply-To: <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Wed, 28 Jan 2026 11:43:13 +0530
X-Gm-Features: AZwV_Qh31WtryGKOQ1R27LZTnjCf9ALrDGyqgp9cHGYIF0LyFQJIOvAqI2H-CWk
Message-ID: <CAAFDt1sn=bj+DoJZ37pVkARLHvzyY3M-nU0ehLnJ6DmLXNqawQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and timing
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com, 
	bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org, 
	mchehab@kernel.org, stable@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-90902-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,kernel.org,gmail.com,linaro.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE7279D5CE
X-Rspamd-Action: no action

> Does this reset fix the problem for you though?

The reset cleanup in this patch (v4) is for correctness (to match T1), but =
the
primary stability fix for my platform is indeed handling the regulator brow=
nout.

> It is also possible active-discharge is not set on the LDOs ... I guess o=
ne way
> to know for sure ... is to never turn the regulators off.

You are spot on. My testing confirms exactly this: if the rail doesn't togg=
le
(or is given enough time to discharge like right now when I'm using
delay in my dt) -
tested and proven in my v2 patchset
where I kept the regulator on after initial toggle and just handled the cam=
era
via software reset - the sensor works perfectly - which confirms that
the brownout
is actually happening.

The failure only occurs if we toggle the regulator off and on again too fas=
t for
the bulk capacitors to discharge (passive discharge).

Regarding Active Discharge: The `qcom-rpmh-regulator` driver currently lack=
s
support for the `regulator-pull-down` property (it doesn't send the require=
d
RPMh resource commands). I plan to investigate adding that support separate=
ly,
as it would be the ideal long-term fix.

For now, I have submitted a patch series to `linux-regulator` to add
`regulator-off-on-delay-us` support to the `qcom-rpmh-regulator` driver.
Mark Brown has already reviewed it and I have just sent v3.

Once that lands, the Yoga Slim 7x DTS will enforce the physical delay at th=
e
regulator level, which resolves the brownout cleanly.

This media series (v4) is now purely to ensure the OV02C10 driver follows
the datasheet power-up sequence correctly, independent of the platform-spec=
ific
brownout.

Thanks & Regards,
Saikiran

On Wed, Jan 28, 2026 at 3:50=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 27/01/2026 17:11, Saikiran B wrote:
> > Hi Sakari,
> >
> > Thanks for the review.
> >
> > On Tue, 27 Jan 2026 at 19:07, Sakari Ailus <sakari.ailus@linux.intel.co=
m> wrote:
> >>> +     /* Assert reset for 5ms to ensure sensor is in reset state */
> >>> +     if (ov02c10->reset) {
> >>> +             gpiod_set_value_cansleep(ov02c10->reset, 1);
> >> Is this needed? Isn't XSHUTDOWN already asserted here?
> >
> > You are correct that "power_off()" asserts the reset line. However,
> > Hans de Goede (Cc'd) suggested explicitly asserting it here to strictly
> > enforce the datasheet's T1 timing requirement (Reset low > 5ms) during
> > the power-on sequence. This ensures the sensor is in a known clean stat=
e
> > before power rails are enabled, even if the prior state was inconsisten=
t.
>
> The data-sheet doesn't specify 5 milliseconds - it specifies T3 as
> infinite that is the period between XSHUTDOWN assert and VDD off is
> called "hardware standby"
>
> Does this reset fix the problem for you though ?
>
> We might try this to stop the reset pin floating
>
> reset-n-pins {
>      pins =3D "gpio237";
>      function =3D "gpio";
>      drive-strength =3D <2>;
>      bias-pull-down;
> };
>
> >
> >>> +             usleep_range(5000, 6000);
> >>> +     }
> >
> >>> -             usleep_range(5000, 5100);
> >>> +             usleep_range(5000, 5500);
> >> According to the datasheet you seem to need 8192 XVCLK cycles after
> >> deasserting XSHUTDOWN before proceeding with I2C access.
> >
> > The 5ms delay covers this requirement with a safe margin.
> > With a standard XVCLK of 19.2 MHz (or even 9.6 MHz), 8192 cycles
> > takes approximately 0.4ms to 0.8ms.
> >
> > The 5ms delay (usleep_range 5000-5500) ensures we are well beyond the
> > 8192 cycle requirement for any supported clock frequency.
> >
> > Thanks & Regards,
> > Saikiran
>
> Adding reset to power-on @ 5 milliseconds if it actually fixes the
> problem is defensible but, be careful about claiming it is being done
> because of hardware requirements, since the data-sheet doesn't mention th=
at.
>
> It sounds to me as if the reset added here isn't ? actually fixing the
> problem for you ?
>
> If so we might try
>
> - Setting bias-pull-down on the reset line
>
> - Making sure the CCI lines aren't supplying voltage
>    I may have missed but, did you give that a try
>
> - And again interrogating the PMIC LDO register states
>    to show if the LDO is on/off when we think
>    Since the RPMh is a firmware which takes cast votes
>    if we have messed up sharing say VDD somehow, it is
>    possible power is on when we think it is not.
>
> - It is also possible active-discharge is not set on the LDOs
>
> I guess one way to know for sure if XSHUTDOWN or regulators is our
> problem is to never turn the regulators off.
>
> bool enabled =3D false;
>
> power_on() {
>         if (!enabled) {
>                 regulator_bulk_set();
>                 enabled =3D true;
>         }
> }
>
> power_off() {
>
> }
>
> If we leave all other delays out - nothing in DT, no changes in ov02c10
> and simply never switch the regulator off, once it has been switched on,
> we'd have some pretty conclusive evidence if brown-out was a thing.
>
> How about it ?
>
> ---
> bod

