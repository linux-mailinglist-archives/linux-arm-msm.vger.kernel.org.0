Return-Path: <linux-arm-msm+bounces-105437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DVa5OX/+82n99QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 03:14:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 528AA4A97F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 03:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCAC83031AE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 01:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1683D2BFC7B;
	Fri,  1 May 2026 01:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmYq3UIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762729B781
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 01:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777598074; cv=pass; b=aaVfbV4eoveSN3cYTYxBCJxGETKs/wLYPE/ayLfbXjxi+7Uy22oEuSoYpdQ4+Mgh7vV11X6mL2OUsxDKyFX5sET9UIuZyD8gihHXrHOnsmrixzrU7s6uCQPA6zKSukAIZ4dzHgMTyidZhR9EDydzsfnz9KQM9sqAbL63+yXLzcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777598074; c=relaxed/simple;
	bh=exuSsdHKT+zthWkuRA+gPVVR1CT8EoAl1eoPv1aF30E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5TmBQAIo7kFYUWVj/M77GIF6G/gXbkua+rYMUgzFvrvG+knf6vhxxa9lsqNtyHCSpclxAZc1F7SUgmu7mJs57qecGfDa5xOh52X00+RMQkPQvZHipeiet3kBz6NCxyM0YCY6TSLbvSgCjh0Ug7VosHP0pbVtrdqumS2HsPR7PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmYq3UIj; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so1562621e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 18:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777598070; cv=none;
        d=google.com; s=arc-20240605;
        b=jX5VJfbYOTJK4smmCJKeDirHD4fVN1AFNyhpPBoZi1oLvgop34t3eXoQkaKljRwgWz
         d2VZ0RFmiPQdJaZIeSCX/okdzPykrxaodZ5Z8WvbyivVusIkNGnvGbfQD6IeJj3UyxsP
         bSc+rcUX1xSet7w2ZYoea+IF5j+95fx5aeqeQTdnHrU1EDj7K3rIZoy+bnKkb++2z0c/
         mGYTV8hiyYiOwBPyDgesTi0oO5NuDNRJtWISZMLz/9uCiLAx7U7Z7n8q+dLfBRvaojDH
         DaUSn1SY3VTHzdaePHnJJ4pDcEr2czcBOd9I/Ag06/ngZcmu9sJ4bmi+sS7UVmsYptYq
         Ji9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m28+puEu5Ee66n2KfB2wRWkME3JWmn3lDkS7ebPVgFI=;
        fh=tGArlb7ztMvPsm6zDRcu4oYaguIpbHX06+lJeZ9Ad8s=;
        b=B6SQ2fUgQvYZdJMBkMSYdkZ/K7K8XPARfCOPAL9xqoLcOi8U3aRuhhn3XdPHWy9Fq5
         9tiKOIsPyO5jRQnIXCYzWv6zGK10RqDqxZD1rfPoSwFNZdYSGkDNohk1kpz0tExAlDKf
         kx/JaP0q7bd3zkN3U0g9vggfMkFymj9ZYy12MNacWVZ/jmFulj3vaHIeUf5jMA31OCm1
         2DtgAkcLMwLBxMa/i11MBvfnYHS53/nAAfUHxLZBxbyOsjYPlOPOUg81zzzjlfZfiUtQ
         VB14FnumhLVcQCZ4wviC6JpODHt0XZr12+mSMXzGbgbjI8sYgripndwhx1oUDERESeDz
         qE6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777598070; x=1778202870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m28+puEu5Ee66n2KfB2wRWkME3JWmn3lDkS7ebPVgFI=;
        b=fmYq3UIj6n+1SlEHq0pvOEQYOO7uh4+ufhzeoW6uu2DnQB1l9XXWZj7MnNxlrABMXc
         IoPT82retLbo5VNjEdmQZOT4/TTUYVs+NWLC8BLxCeyNoNyTO9ycDFKy/ofoyh7bWA/j
         MDEWTKDCNzHLN/bQD2k2HW1WOjNOrNbeIt6DhCVU3lavmgMzNit9z9esLsklO0RGVili
         1Jto8HWH6NUQ+3NAxsOGX9xsThf9tcY6ptsTlV51KfkEsgfcjjSAtyt01B2otT0Mj2/H
         MeljtIOglRu7Kfu79at1tCKUwnxDWvXv2yu0qiYw70xif2w9UVZnWyLfCQORasu9iY1L
         uUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777598070; x=1778202870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m28+puEu5Ee66n2KfB2wRWkME3JWmn3lDkS7ebPVgFI=;
        b=rUEu0pn6u+FvFZKx6EeaY51CHe/RPy/dQahX2Q9Zauc0TwPm067U99geRdEH+beP2P
         agtHOaPoIu68EHPbWwEoJSIu/3LKUOXVw/jgu4ljauXmFoJAmRzHO5GEwlS1FdtyidHE
         QtnBdtrtmnkZd1aeQJy8pRAdL0dLvF+sHil5Kbh6LIDwzq7Ss/4iTPFzfPNM+DeWekXb
         kuuk/L/cbjO6zYYZkdOCxwVwoDytROpSOZyxyKkBJa7plxA6jjbjS3w800gpsf8p+KdI
         umGVn0lb4BEYxyQhUNoiHPBgcLMM0AcZe7Y+b52/kISnWJBNMFU5vl+g11SXmNFjH3y0
         fjKw==
X-Forwarded-Encrypted: i=1; AFNElJ9PoowV1TG+zlh7vtkGCWGbwoNxF86TpB93bIAZ0MMucUEcw1WEQjQ6AQPeZrlbrgNcFKQb9n5dQYt95EgJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34FkqBxGq+9/0m95Ok1Ziu38OwQaMg0CW5qHP+eLcNswHx4YU
	0COEPfwIAxP5iEe7M9eVbD8jnQ5Q7/Gs5f3LF6LiekD2c0C/fgaw2DB1TKwD45XAl/uSqTo9z8c
	uTcpKz+UHFh/Tz0PV2r/K02FEv8S8XlA=
X-Gm-Gg: AeBDievPa2AJIKpr55ib+ebGZ7lRboo6c04yL2rLSGy7JcO3241+q/Bw5RHtaKG4uwE
	v+OganAz4QenfkxWsQ/+42SAb2W8rnCJITAJQKM+4qVFlQaqrwtwc0mrqC4vrIaq75IJOhMxSDZ
	ucfrzsEmHOQ7U38A+ZCZtij+w/jUeotwJX0bEQIUxZqACbbAwfEQe4j3AnZT+tp0iVedNxR8YMb
	ZNORMd37YjukQMMGkw+ZsSsAOdo/ZYJyRWn6JrthJRlbVK6J5t1fNUUMhx5veVXnImEjhD71ilA
	UYX3hUoPr6UPOtTjBqN44zQAgb+zXD6rI3CPT4DmQypS/V427PI2ryxy8GOsVTYm1XAcpgR00XA
	KbEc=
X-Received: by 2002:a05:6512:2385:b0:5a8:53c4:f8b7 with SMTP id
 2adb3069b0e04-5a85aea76edmr271048e87.27.1777598070239; Thu, 30 Apr 2026
 18:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
 <20260430-ayn-qcs8550-v7-3-591a96735fa3@gmail.com> <51eb35d3-5390-4f3b-9cb7-8d289151a650@packett.cool>
In-Reply-To: <51eb35d3-5390-4f3b-9cb7-8d289151a650@packett.cool>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 30 Apr 2026 20:14:19 -0500
X-Gm-Features: AVHnY4IqGOmz8R89G_6Rz307FJq6ErM4oOGk3cUhVY1gE5fm-FmCr4i0j-Ja4HU
Message-ID: <CALHNRZ_dG4KGoeCp0Qkqd667U90FfPXvO9UELnC5d=SwjxXLWQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 528AA4A97F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-105437-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.34:email,0.0.0.35:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,sobir.in:email,packett.cool:email]

On Thu, Apr 30, 2026 at 6:59=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 4/30/26 3:43 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This contains everything common between the AYN QCS8550 devices. It wil=
l
> > be included by device specific dts'.
> > [..]
> > +
> > +     /* The tzlog label is required by ABL to apply a dtbo, but it can=
 be on any node */
> > +     qcom_tzlog: chosen {
> > [..]
> > +
> > +     /* The arch_timer label is unused here, but is required by ABL to=
 apply a dtbo */
> > +     arch_timer: timer { };
>
> awkwaaard.. Is there any problem with requiring erased dtbo? For phones
> that's generally what's done. Having junk from random dtbos is best avoid=
ed.

This has been discussed like 6 times over at this point, like this [0]
thread for example. The request from there was to make this device
specific, so here it is. My use case needs a variant dtbo in order to
support all AYN qcs8550 devices in one software release. And the
install flow handles the dtbo partition, so for my use case there will
be no random junk. And use cases that don't want dtbo will instruct
users to erase the dtbo, and this doesn't prevent that.

> Also according to the pmOS wiki [1] at least on some of these devices,
> there's no need to boot from ABL at all! There's also U-Boot and you can
> switch between ABL and U-Boot at will (sounds awesome!)

My use case is Android, and shipping something installable by the
average Android custom rom user. Manually replacing bootloaders is not
something I want to force users to do. Especially given that the stock
bootloader supports all the android setup already, I don't want to
have to re-implement all that in u-boot. This has also been re-hashed
several times in series leading up to this.

> > [..]
> > +&i2c_hub_2 {
> > +     clock-frequency =3D <400000>;
> > +
> > +     status =3D "okay";
> > +
> > +     spk_amp_l: amplifier@34 {
> > +             compatible =3D "awinic,aw88166";
> > +             reg =3D <0x34>;
> > +             #sound-dai-cells =3D <0>;
> > +             reset-gpios =3D <&tlmm 103 GPIO_ACTIVE_LOW>;
> > +             awinic,audio-channel =3D <0>;
> > +             awinic,sync-flag;
> > +             sound-name-prefix =3D "SPK_L";
> I guess there's no real standard/convention for the prefixes but maybe
> worth changing to the more readable "Amplifier L" / "Amplifier R" that's
> used on e.g. the fairphone,fp5?

I guess I could.

> > +     };
> > +
> > +     spk_amp_r: amplifier@35 {
> > +             compatible =3D "awinic,aw88166";
> > +             reg =3D <0x35>;
> > +             #sound-dai-cells =3D <0>;
> Also #sound-dai-cells should go last, with a newline before it.

Ack.

> > +             reset-gpios =3D <&tlmm 100 GPIO_ACTIVE_LOW>;
> > +             awinic,audio-channel =3D <1>;
> > +             awinic,sync-flag;
> The awinic properties should also be a newline-separated "block", before
> the # one.

Ack.

> > +             sound-name-prefix =3D "SPK_R";
> > +     };
> > +};
> > [..]
>
> BTW, do these "just work" right now?

I get sound out of the speakers with no additional aw881166 driver
changes or manipulation on the amp alsa controls, so yes. I do have
instability with sound in general, like the active stream will
randomly stop making noise until a pause/resume or something in the
kernel (or adsp?) will start infinite looping, taking down the entire
card. But that appears to be related to the adsp or qcom dsp drivers
and how aosp interacts with them. Still playing whack a mole with
that.

Oh, and these devices also need mi2s clock support. Still waiting on
some version of that support to land. I will have to follow up with
whatever final form the dt plumbing for that ends up being, if any. I
do have to carry out of tree patches for this at the moment.

> If so, I guess you're lucky and the "firmware" / register config binary
> for these devices configures a 16-bit 48kHz format which is the one the
> soc driver forces.. because the aw88166 driver, just like other awinic
> amp drivers, doesn't negotiate the format stuff at all and blatantly
> lies about supporting multiple formats :) I'm currently fixing this for
> aw88261[2] but eventually we'll probably need to actually kinda unify
> these drivers..

I would assume that's what is happening. Having a more robust and
unified driver would be welcome, however.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/20260207-sm8550-abl-dtbo-v2-1-83a=
faa6f3ce9@gmail.com/

