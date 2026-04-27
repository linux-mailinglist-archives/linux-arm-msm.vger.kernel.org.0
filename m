Return-Path: <linux-arm-msm+bounces-104776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLpxCN2e72nwDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5302A477BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6928302F680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF63D3E1CF8;
	Mon, 27 Apr 2026 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+fUzGe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A53A1699
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311179; cv=pass; b=OogekQIOQOQb/OnpF8rahy4WZV9xPPd/w3Ugl++cEJVGKoKg450pQzYvNRknix8MhZ5NIiz0EqIgP3cpZpMNCYlmNgplouVWQnGIGZ/UyurrZ6c8W9QoEOsBYZ75x5av8YzUTobqkNW8OuSYrILrhXPeGqoS3WVAFHc+PRQ3ol8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311179; c=relaxed/simple;
	bh=DEaHIjde2rWQVcukmPbcCg6DBKxDOko3C8ZJqFbHS7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrgMNhmbfH8xsQMKQBh1gIlp0WTaUoNzR+/z84cDr7GYVdmqiO2jgRiEh33sJ12OZ0syEM9B3ivMZlL7L6eeKz+UT1cs+n6ZJyVpyA28uFzKNo+AODdhh7sLHDFXklgBEnCB+X9NWqG3WqaQ9vRP0ywOE+vg7zvo4JSkktluVNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+fUzGe4; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so10532628e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777311176; cv=none;
        d=google.com; s=arc-20240605;
        b=TLXm3R8X6fKYWPXgziNo7rxu5HcdEoEZICACD2jepP9vQUBlAMnHxEo0eXK6dWVAOz
         AjFkPJaPOIUHdDpMnbPKpyBR2pkteUioqAVepKC0BfjdiBhrRMv/OddKbgbTk/3Aw+rL
         WvFe9Z7aSRUsgqrTJD3nTP0KCA21v4j2Hm2hzSKomu711Y4uSAThlUwXoDcQSiQJw+Rj
         C3QvLSgkhInrtFpCEHdmH09CePZphqQ1ychSGJLx+uUC7Rp3hfkgd0ooT2AzLT1rlu96
         63y6dhudlr3If26/R7CKdgCaifAipOgea2k2R48MYQKYngriSyrQ4t6n9UrvdHx0lpwh
         jaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tr7/1KiVLnLIdVAaap8zvEgM4/GvQO6ELzEn1RpMrRk=;
        fh=SoZBZAh5/nGBQ4VCo8Z5L/ZAmgMT/JvCIQ+W4UkAfzo=;
        b=bjE6x1TFg2IwpHK6EmayzrgL/1jRo7277N6JjxDaF9Ercq0XWFBEq5lpOxA5cBrmdK
         afIRoL0uL3gdBKbQNVZx8AoyHznufwkqh7/Q2tHpRevdvMlXL+SLHkT4JBuAAIv4F4sI
         YwrEzefD/x/gx1GTJOdvR6FCZGvNacbZuzE+2KCIE6X4JuVZW+f2xv1ajrawoHl/kb+6
         puF+JcCuIpPv0NpHBOvwrObWkPz2dBSUrBg/Td4cNmK0mh2hujISWYhd3PKB0z0fu6bY
         329TAZzQECHn0vZOzyQjkQe01LpqSzc5wHehrZzndI8olF5ctNDH73VgPFAvBSt47eb1
         86WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311176; x=1777915976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr7/1KiVLnLIdVAaap8zvEgM4/GvQO6ELzEn1RpMrRk=;
        b=b+fUzGe4AzIL0vqtIBfA4A9eylZVt7O3OODNSg52hJrFRfI1KrZbyVefAxdT1JMEqE
         Pd4ZZl7gLhqOlNzn6mzw3vUo8B/5LW3Wk/nQsvAKzTP/Pfj6lBor7nrmbmC5UmxAx4GU
         IJiOtytHfQpR0aeHbZn3qJcWN4WbKKd98ZBCV5F6K6Rs+B28i5vU6J7bSm/8KEn8kvBp
         sluRi4TwsrwIeM2zXcdIi7xGIphDKkGfxPE/2m/1JjuIk8Y2g2+KVnxHxVBu883Y0N8w
         TWGHqy9eD6eMammMwC0nk34l7XIh6a+7V6P6O7sTJ/WH7hlHxEMSPXjjSxcCodEiR88w
         hang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311176; x=1777915976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tr7/1KiVLnLIdVAaap8zvEgM4/GvQO6ELzEn1RpMrRk=;
        b=spRa37bXP9qtRUoebZAJTAIFnsAjLOTjvPG19FxHLQ6ZTCPdp0MNnVOB4M1V5pXFuy
         0HzQTRsuY8nTIJvM3jU/nRwsVHDiLzv+c2cCdv5WpDD3au95lZYGF9CGzSAOf5VBhKna
         RfxoP0HUh0cpSMElCZahMM86s70fwvfxc4g7PHKmCwRn2MMOYvfLPCaJTY26y0smrUkd
         lVkmB+DEXoMs3D3CliIp1X5lhFBFhck7BLAwcBlcNpRfVFbSPJ7/pkQDclgEHipt5r4k
         91jAuiKBHlwDc9SWV8fANRoA3xpBS4oVlGBXYMkERQp/RvEEPumQHupXYJAxBrBzoWWo
         AiKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pP0gOwdZTnZwf5mYFJYmEklrtvUGgJINb85SUoiRR8OGi++YNDMvuYKC1ak4wK3/S5l9FEqmUs3XNH3NX@vger.kernel.org
X-Gm-Message-State: AOJu0YyV9jMjtt6cr1oTRqNkHqZPXQCAp++v8c8yRLSUevIy9oQ2vfI6
	cvxyRKnzLlcWfzVyTIDWcWcXsIJnQfWBJaS9fho8ww7OnSgpA1itP7ldsG1P94ZjiDiPWqTL3pX
	GOZyv0S3AYbPIGC1KI8vzhU4jKSMykIs=
X-Gm-Gg: AeBDiesi4lLfILYE1c80As+6wN7szlqycXpPB9SoSIpL/KjfnnNnMfiMooyvHHF5QKp
	ZBCJpKMkjwDpY/3YsJBpDXBgQLVqHboq8/ufs8bx8D/oCOMW5H2ArglS6F70fbncrzUIrq2v8dp
	XhEXiLiedQvkxZq6r4gOvsTOHFep3jPza4tAgUq8n8S7fGHSyq940MDNO5sidw5K+U1eDYHP9BW
	cj/6Nz85tisAgsic9x4E3ljByT+g45X2ozx4IpsLUTwHNBv4j+xJ0uP/NJCP+G2dUq3kVA1c0dk
	DDIVmp9FYbJK84fM3WfzgjVjJPqYu7M8sgHi+zNpY57EkI3ongBNrlDgeHjJp0ta2bl2T75AGd6
	x1Ao=
X-Received: by 2002:a05:6512:1248:b0:5a1:1074:e1ed with SMTP id
 2adb3069b0e04-5a745e3b8b8mr69372e87.11.1777311176097; Mon, 27 Apr 2026
 10:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com> <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
 <CALHNRZ-8r9KSpAEsv6F1YfSjWUfJihwKfzdeDTkRsPJfwr_s5Q@mail.gmail.com> <06cef5c0-3473-4e3a-81f2-37a41216f67a@oss.qualcomm.com>
In-Reply-To: <06cef5c0-3473-4e3a-81f2-37a41216f67a@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 27 Apr 2026 12:32:44 -0500
X-Gm-Features: AVHnY4JuIhO-peAFLy29ECv7gAaIDDSgLIGnGy-SoVGVhJK9GRSX-0GN50ZzCiY
Message-ID: <CALHNRZ_+wgtKdZ+m4LC36BFPZCXVTo6nb8Qwa-TpchzQ5mquEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5302A477BD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104776-lists,linux-arm-msm=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sobir.in:email]

On Mon, Apr 27, 2026 at 9:45=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 12:01 AM, Aaron Kling wrote:
> > On Fri, Apr 24, 2026 at 7:11=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> >>> From: Teguh Sobirin <teguh@sobir.in>
> >>>
> >>> This contains everything common between the AYN QCS8550 devices. It w=
ill
> >>> be included by device specific dts'.
> >>>
> >>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> >>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
>
> [...]
> >>> +&pm8550_gpios {
> >>> +     fan_pwm_active: fan-pwm-active-state {
> >>> +             pins =3D "gpio8";
> >>> +             function =3D "func1";
> >>> +             input-disable;
> >>> +             output-enable;
> >>> +             output-low;
> >>
> >> Looks like this should be a regulator then, probably?
> >
> > Mmm, what would it be tied to, then? The fan already has a reg. I
> > presume just modeling it as an always on reg tied to nothing is
> > undesirable. I also have no idea what the voltage would be.
>
> Or maybe it's some sort of reset/enable GPIO. Or an enable pin to
> whatever feeds into VDD_FAN_5V0. It's hard to tell indeed.

Talking to someone working on the downstream kernel for these devices,
the purpose of this is to set the pin to 'func1' or pwm4 output. It's
not a regulator or reset or something that needs otherwise modeled.

> >
> >> [...]
> >>
> >>> +     wcd_default: wcd-reset-n-active-state {
> >>> +             pins =3D "gpio108";
> >>> +             function =3D "gpio";
> >>> +             drive-strength =3D <16>;
> >>> +             bias-disable;
> >>> +             output-low;
> >>
> >> no need for this property
> >
> > I'll start with saying that I know basically nothing about qcom
> > hardware design and what the average pinmuxing layout looks like. But
> > I do note that a lot of existing devices have this exact same node,
> > for example the sm8550 hdk [0]. Is there something that makes these
> > devices different? Or is this unnecessary everywhere?
>
> That's my understanding.
>
> [...]
>
> >>> +     usb0_sbu_default: usb0-sbu-state {
> >>> +             oe-n-pins {
> >>> +                     pins =3D "gpio140";
> >>> +                     function =3D "gpio";
> >>> +                     bias-disable;
> >>> +                     drive-strength =3D <16>;
> >>> +                     output-high;
> >>
> >> This is probably not required too.. unless there's a hw bug?
> >>
> >> fwiw 16 mA is a very high drive-strength - does this come from vendor
> >> sources?
> >
> > I do not see any pinmux for gpio140 in the downstream dt or anything
> > matching pi3usb102 at all, I'm not sure how it's handled there. The
> > original source of this dt was written before there was a public gpl
> > code release from AYN. I do see other qcom users of the pi3usb102
> > doing similar however, for example the sc8280xp crd [1]. So I've got
> > the same question as above: is there something different here, or is
> > it possible other existing copies of this are also wrong?
>
> You can retrieve the settings from your device at runtime,
> /sys/kernel/debug/gpio will read back the hw settings
>
> As for the CRD, I don't know. It may as well be board-specific.

I got pointed in the right direction to see this on downstream. The
active drive strength on gpio140/141 is 8. Does this seem more
reasonable?

Aaron

