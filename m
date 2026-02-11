Return-Path: <linux-arm-msm+bounces-92629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFlkB7MEjWlVxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 23:37:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 873BE128299
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 23:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9ADBA303ABC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 22:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01076314B9D;
	Wed, 11 Feb 2026 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk3+Web+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1E3563C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 22:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770849432; cv=pass; b=pJ9fMrbq5wjcLhhSG21WTbl6pthkTj6IYuuENHs/GUXK4bF8CaYRt1M5sXG+I4z054agQh7AW3Ezd6YCn4ITKdDoq/HPADSlc4Hqua4/j6nyeBmWLXbGe3utvg+nUAjNSbK/rnBoP9ESFtojJcQd+Igl+diMFkkK+R0ZsW/UF/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770849432; c=relaxed/simple;
	bh=6T/ikvHMlOYTLQYFaudB2xCLFqG7v7kDfO5+WLaLkts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sS0bYttSZQk+Ym2/xmYGfKSTsn64Hev35IYg/wla7aHN6YztGkSPNXgh/GwWmMjjSX/UmYHQWb5hr3i2bvZgzzX+7GIUMW7Q0z1HlwnIVyDhKdWA+8CE35ifNX6v5s+tZbS48nYc/BokC3SmzKeeEaJo44wkxhtnhh/ichSukF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk3+Web+; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-385cfc572f1so21816241fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 14:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770849429; cv=none;
        d=google.com; s=arc-20240605;
        b=AWSwsbE54JdYHIplmGGDK5TETQalRfjtxpsbr4wtioV+0KXs3qsYqMw/1eGG1KoC8j
         Vtmve0x/z04Z9dyZegnKJkmkOyuBesUuIwaaol2YVmUrdncqAoYskL1OVCXEWKDUYBwE
         enTKLkRW6m0BxRtj0vVT3RrxNP6bZKC8TuYuHW2IiyDbKHiXaSAP/tKwFq7wXqOh4mth
         JxgP6h00XOxnyIU3iEAFhCfXG+05WDd1zqzQBMw2OP3AcgMtAmmmHE3qG0BMzrNIPg10
         YYB0JH35/nSgg6IyMgp3qhDnR8w78keV2vnva4NZ5s3bgFSMLp5UwfanQjzCqPZX0/WD
         HXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xxRS13aj1UT3Xoxhw6gPSgMuVGY8Xee+/X95ZwB2/v0=;
        fh=WcL+22sOGqYy27OtXJLbOhc+QFwbvHG4bu5Zy3dB64g=;
        b=hdyzKv4+cV9jheIJkB7QdyfOvLapXW7lEGb9IUAdcPjFiRyuMDeLXAjguu4x1BUZ1g
         a50TJOgEoZlbf/qNmZGIpF7OX/Jh4rLvqXR2NE6LcbxLpI86cf/GFIM3Exiw3aUeAXRa
         XpAUvjy2Ur6WcRGzoudJPikEPGi5i+BfaExwaMC2i9xsFt8pZJmTK55iSHuzHsoNklb3
         xyJHjVy0YdvshDfwZJnpzVfkgIa8+4O2wI95u8/BXSTX65RD6JEerSo2YGiy4eaOLctV
         0Awn8OLVmdy44Zm7LHtwv86xYgQ8Q1AqCxTkf0vUcmM8QPRjn4lEcT2tqWnwOS2l4/nO
         YY0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770849429; x=1771454229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxRS13aj1UT3Xoxhw6gPSgMuVGY8Xee+/X95ZwB2/v0=;
        b=Xk3+Web+E7O6ii9gAUZGCCbKeHns3yXmlVDn6e2f3SzG+8ENMWC9yMDjZcKlL8m1As
         HWSJLAVD2GGqpJZ0Nyp7YhsSEvyoYO0pYxW8Be2oDxn5xotkjtRWQgXVUt+YLdhoO8Nl
         q92QuFYCfC7PE9uivn98YV6mMfEHmK3wxGnFqvovRieJssSGAzH4Xdy09I7PpPzAdEBM
         KMtvafe++lqRIf5dfgufo9UeaQxUsQsd2rZZ6AFZtGoyZ+osMtd3gyYh2WISUPTqPwDK
         4eDjo3M4FSMLtoTVtpMaMvekSdSi7Eamu2RAGglbGFxDyqxA4Xi86VZtu1iLAxNvQX2+
         DZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770849429; x=1771454229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxRS13aj1UT3Xoxhw6gPSgMuVGY8Xee+/X95ZwB2/v0=;
        b=e3t9FYAZTdUQBphI4yVf5g519/MqpPmtuKs3sKG1e/nXiAGM8wtuWwOkSEdwk6pen/
         966AN+FPY3Qz4DGZRSbs0ViFtJgJU0MxYQiO3V3hxuYOMjgOKSyvO+3x7vyPS5JkyTbP
         UlZsH03PNN+ol8nhz87Gr93aqeua4LEw8IRyNngt5p0OSXEuWqvHM3NAYMGsPAHqsm3T
         eT5n5T8iBq0pz79rwKX0CUApsyEX7PkmWc3KyMlaRyoQdAPI7fXy1A86Eb10EiUQhguR
         DeI44szkeahY+Y2Q0ARA+Npz2qYLYKCOjttPDrxbyoOI7PhYSB+tRituhyRI5vYQ4rAi
         pCww==
X-Forwarded-Encrypted: i=1; AJvYcCUcSVlWvZvV2vyKrH7tfg6+icku0lMrlE5b+7wwWdJ5ESs3q7gAL7HKp7ndJ/t6CF+iXB119qb9pCZkXcHm@vger.kernel.org
X-Gm-Message-State: AOJu0YzekcukIRBCmQPA34CdE3vw8sBRtBfMR4ArkntD3Ja9inlEQJKE
	q0fLBCxot2FYQNGRdAgoPTSoWgFeNYUBO4Nka3qUqZgLwpGO82+DAWpKxnU/T2RbeZYMifL/CZy
	kgb6Acksz1IoSuJcTIg62VdiDkAYJwDo=
X-Gm-Gg: AZuq6aL72yTe89rKcFRJimZZWn42iloz34BPZgB7g9X6WNWjoJYqybOETxJNVu9jdVt
	wOU5TUIHKZqQ2vje/WEPFwhVsilTJKjux9WUEUxEZVSZpKAUOuQTDCNuvoGuDb/VEwIj7cHvbqe
	iUomJ+AQ4m/Ls8uIgK9TXEasH5Pu4Nd9RjlaVluZD2MWTgBLWC71Jw9Lbx074hAFWslH0vZIcHy
	GeILTuPGUhf02up6ehRP75frAM+zLFfXUEhH43URIcBTUbnlPspalCQCgXsuSgfSirgCA6WKy9K
	7zmiBs4XdLU8/FZSdsbr59hE9efD6aMOhpFmqY3MLVlyDu/q5lOK5PB/XUm61Jt0Uuj5
X-Received: by 2002:a2e:bcc1:0:b0:387:384:923e with SMTP id
 38308e7fff4ca-38712b93f62mr623591fa.37.1770849429292; Wed, 11 Feb 2026
 14:37:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
 <20260207-sm8550-ddr-bw-scaling-v1-1-d96c3f39ac4b@gmail.com> <a745718d-1960-401b-b8cf-fb7b56dae933@oss.qualcomm.com>
In-Reply-To: <a745718d-1960-401b-b8cf-fb7b56dae933@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Feb 2026 16:36:58 -0600
X-Gm-Features: AZwV_QiE8SSuF6b8a6D2WT0Vl5F8W8vkMWkANkHgxY3SvVJmLzsNQFZVTZ0Gm2k
Message-ID: <CALHNRZ8n0sQvUuXcmiq7pc+e_hQsVgwRCMnx9FF8n6SGhCNxLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: add OSM L3 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92629-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,17d90000:email]
X-Rspamd-Queue-Id: 873BE128299
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 3:04=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/8/26 2:28 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add the OSC L3 Cache controller node.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts=
/qcom/sm8550.dtsi
> > index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..80fc437c9874fd5009ff1ea=
f4227b75bec5fe883 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -5437,6 +5437,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
> >                       };
> >               };
> >
> > +             epss_l3: interconnect@17d90000 {
> > +                     compatible =3D "qcom,sm8650-epss-l3", "qcom,epss-=
l3";
>                                              ^ this
> should definitely be changed to say 8550 instead (it's going to require
> an addition to dt-bindings too)

I missed this in my copy-pasta. Will fix for v2.

Aaron

