Return-Path: <linux-arm-msm+bounces-115377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AeQlEUieQ2oMdgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F276E3170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UJOB+5zU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115377-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115377-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0D903029AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956F23F660E;
	Tue, 30 Jun 2026 10:43:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A413EFFC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:43:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816194; cv=pass; b=PDlCCMlM4QCvwlemr/DiXSr7mCjwO5sVtZWJeHkSnYr5Of9LIsMuiYg+AlfT0PgnJ1a5afSD3BwvYpL/p4EQQI+nRXclzns3Mz0FVsn8ocL+zBlxwa1i9FpRYQV/re8DlhOMm9+ctUzG8wiFoqDFH9rN3WTNDBWo7XzqXzvTPiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816194; c=relaxed/simple;
	bh=kZuTI4Val6atdatwnnOJuPX+lLeSM3tO4Th0XAESsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LaycqnhrisNsd5JdYbU/S4Wq5jOExIpF89WkJA13x3ZjZ+1W99Bbqze32Oao40HHC++UsNSY3B5u+ORTxsmzgom5IgQMLNAzPb+AfiBuFobX9Ud48ALuuygEIVaxH1G/qf+h/knZHusLxJQp/xSxuo2aVE+Afpt+VHA3R47Laxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJOB+5zU; arc=pass smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so3684958f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782816190; cv=none;
        d=google.com; s=arc-20260327;
        b=UoBwztBKoGaFbPXDcwb2QQITfadY4rty6dUmKTgs84irpgcOgHgoQBF1neTV7MRDKH
         Kq2CpKl9i+5KWx8fqPDslZrDLnE5K4soABspH5BuMxGng3l+mmlSgh2Ao0vQ1CMpN9yO
         /6n12zBaPhynDsICGI+SaB8BMvB8cIT0CJvNFlwd8UZB2Dm3V8Yq1RplSdEHmBRFbv5D
         hBt0E6eNwrkFChyXoH3smXFeyXi9rq/d352dR7MCF27v3aNPvRKkC2ALLH+gtq6LAG65
         J39tVGsALgmgZCKmsOVR89cCQobBDwHjd/X9E9UA/VMB6zMYHN2KjD/Rp/7NGzw2WLQK
         vzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkmUBXDajSN3qSNsXr+nPaq3QE+94PgPpUX4FydW+ZY=;
        fh=QfE85hsXRjbweh3wlHqSrS5B7imVPWQYPBwu3wDr9iE=;
        b=gz6D7wMlHyXuQ+y2LUyjXLO6H5WumQZTzOgnaJUP03wmvIqL5COcIN0jnzmXxnaRCZ
         pKMMidD/T1NJYw2PGWVzAJMzA9kyuoD1Sn5JbvT67eI/nXc9wMOIlmMD58YwN+0vINaw
         /Us0/+xULwStroK5a0kNd3fk/c+J6RvrVcfejVdEVHp7VHszRrQdVb5P+Yj12SUq2o+A
         Iw7c2S/bpAn1iti8nja2OrY03CmhBSb7uT0IH6/sn14kuHP/Wz0i+NJgyXDcUu/Fg4Z5
         RvYxbdz4LW9fSujYxdZ5F8pmi6U5/1y/HOH/BNxkFIAnZVf9YvOF2aH0pQ3H58wOWFQ2
         Miuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816190; x=1783420990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkmUBXDajSN3qSNsXr+nPaq3QE+94PgPpUX4FydW+ZY=;
        b=UJOB+5zUcc/ZYIWMON9uP4zKCeK+qn/pFZRH18YOHuOn9T51o9a2vjgt9SzPtzZrgb
         jJVNjgujdcMr1+IFwOajthLkQPYzHkwENJtBgSHmHKjK1v0+o5onGQZ2+WxWSswDH0Hh
         Ycw3unX8QfeswBIhwMAbzO7hL22C4DTFRTSV4uQcibQZoK38VxKQeQZU99kt179nbYKj
         LfgtVFm3LfJGNAmutvnpgRlukGai64Y9sGH1a7S9HzIOQBlNfg/kgV1D9yxoyu+1/h/N
         BLV6B3miOjnp3cN9Wkg6BzjYk24mbbBKdx9MGpcNGyqyTaR0NxDM2dG7GIR4+0q1gH38
         YkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816190; x=1783420990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkmUBXDajSN3qSNsXr+nPaq3QE+94PgPpUX4FydW+ZY=;
        b=ldIKakqYyQeUmLT91D1FErKhFRtjo0RYVnNR0RaX48USvIollWnFLmGK5XAvqlY4uo
         ZTm5ZsUb4vpmU/Skog5VYDFLNn6AJzQXkkZD25uHerZ95WA8WjJCqgC8hMOboKBhIbtn
         /rAu5H2c86QmuRf+Pgn+h4E+U//M8UNFXkZ+tMGTShFvb10YcAadsWrUL0vgKLW4lMSo
         FLxOuByxZ2N64gYOAi0DZpehxFThlAdPrTt0kUaqO+ir8BnK3cZeLGUv5CuA2R0bk3vU
         qaVlO5scOUv3fjwKqICxrBGTg5jp6LoB16CTulU+kONZGiirKLeexTbJVBozq9GoplE4
         d4rw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ea4wa/tnC1pGCZcB7sT2c3My2FPTGV6Cw820TqnJY18Qu/5dJG8pNYkvFJN7qC/SaIlQzMGrWF01seKyy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YahXQ0MklU62pckwoxF8fRbtNu1XwlFUlwbwnfxKsgevx1BN
	viL3ftedthsriZO4vYjJ/e6XOwM65t8iPYxJZHcPENBd3IlZbrgEpquEbHm2BrF4/20p7lO/NYC
	InxLhxH00T9IaDsyc3TWX9uScf5jOjyNINhfAWt0=
X-Gm-Gg: AfdE7ckeSorgSlzHLIgSiVfeLwFsMK2Qxgh/orRg8qvpvdfuf9EgaDGIlkFT7tgTiZ4
	JWVNpgRuxEpt4e6RNz8pb8NmEjj1iIS1rVyekuS3In90jAx7WISbtiqX3HeU3A/RO6hXb10D8r/
	cmdsNZhVKItmcz6tkKoOGvcf5gA0xl4LtzDLAE/zPA1Erd0gjQS5pBQtxBt5aE5/rhFDZUSBazy
	S2H880MAPBa7UCP9cdkNuqqv3QqCPVp1Dbq67v5IjNS0D0Y6sTpXzPMlUY8Z7ACgwippwKTMa/7
	r1AU3l7yReUAnlikLyi8dD7+kKyuXA9VI8Xk1vo=
X-Received: by 2002:a05:600c:5392:b0:493:b720:ce11 with SMTP id
 5b1f17b1804b1-493b82b95eamr46268295e9.31.1782816190313; Tue, 30 Jun 2026
 03:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com> <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
In-Reply-To: <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 18:41:40 +0800
X-Gm-Features: AVVi8CdJEbozbW4vdA2vBUciHlr1gDX4-YEEjXIVSnVBH6KJ_r7m3jc4o5HV4ro
Message-ID: <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-115377-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2F276E3170

On Tue, Jun 30, 2026 at 6:34=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 12:30 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> >>> On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>>>> DSI panel driver have been added for a while, so add the DT node to
> >>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSD=
T
> >>>>> describes the wrong, no impact after manual disabling these wrong
> >>>>> supplies.
> >>>>>
> >>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +&mdss0_dsi0 {
> >>>>> +     /* real vdda is unknown */
> >>>>> +
> >>>>
> >>>> L3B: DSI core 1.2 V (both?)
> >>>> L6B: DSI0/1 PLL and core 0.9 V
> >>>>
> >>>
> >>> Yes, that is what I saw in the DSDT, however, I can disable them
> >>> safely (hack the regulator driver to add a sysfs to handle these
> >>> regulators), the panel works well.
> >>
> >> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> >> ends up being on), UFSPHY and USB1_PHY
> >>
> >> L6B additionally powers the same components, minus refgen and USB
> >>
> >
> > No, I confirmed they are totally disabled, since there is a way to chec=
k it now.
> > https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152=
e6c958@oss.qualcomm.com/
>
> This presents you with the status of the votes casted by HLOS, not
> the actual hardware state
>

If so, non-HLOS will vote on some critical regulators to keep them on,
IIRC, once I disabled L9D, system reseted immediately.

> To get the latter, you'd have to dump the SPMI registers
>
I will appreciate it if you provide more information.

Best wishes,
Pengyu

> Konrad

