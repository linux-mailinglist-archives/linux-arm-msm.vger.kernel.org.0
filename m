Return-Path: <linux-arm-msm+bounces-92697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCl3A4TNjWn87AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:54:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90312D9BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5056E3003832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF9135B159;
	Thu, 12 Feb 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="DUud3H8+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BEF358D1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900813; cv=pass; b=fXZxiuNF39zXQ7wiy3nnA33xxhUqXKipVx43svvw3QMUdLVpV90vPR1UOawb97C7SjwBuIA8XpQyQJVzYKQ7+tFNVeCiWBfpyKqCqo6X8UD10ZK2DTAgE7jTutUPRy3XJli40wrsaxgQoRCwHK14J8/XxgZ1hWhlptFLgpfl2nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900813; c=relaxed/simple;
	bh=/EAivQ+ZOwOkIc4BLrlfK2r3M81UGYwVaeh81T5Fj8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YE81AF0qF9R1KIOgosPFwarkXDItlb28odIEogZVgWmGOdnFrZ+ASxzPvUYDoZ6koYtgi05qmAz1EhqlKr3Nvjap0GbJ93dt/rDoa8ajG5YhY502PGR+84ug2IkA94ye99MUv7MBmBAM2Vlv3xp01rUF1zDDfpOWxkxSiFY1ZJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=DUud3H8+; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e6b7b11ebso151860e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770900811; cv=none;
        d=google.com; s=arc-20240605;
        b=SyqMiZwCET4NQXsfmi6a0t7tSvNPk1sUICDSIGRpGxiNq71JT7cY8+kpemndcVAgBx
         4AF+nNAsHBSM2bmZquFXhSTeIkdnjeMKF+iMb+uwudpdE4T9Vd19/HkzVeJ4crUmkjyE
         MDz2OACBXL9kEDm4r3S0ykElq062ZfLxlbnCanXn5cOhN6d4fDrory2pEXBBD+VJZFtF
         JmkbyXZzJnKbsIm23BWzz1tnWEsy1DyxTGr9pe+G1dIZUvx2LUTY6D+6K1SUqWqrH/SA
         Mro2KzhuNnbWVxnZB5lc5vm1jENs/rFEsB5qNJfpg4onpqtnU0bfEvvHSId+8f2+Dhfa
         zxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bf/qENqOCRmmJNr9ag54Z8HX70ovzWa5oYbu2Y1woKc=;
        fh=DGbGMT1aB4pj68Vk84qzb6fAi2enLcUVnT7qlk5XZP0=;
        b=j6HjL6O4fCxd9WC1j85Xn1d9AvCDaZZKgiT5vcrs+FsReDlPeMG0xigR2e4ns26ra7
         2OVx4RkIfIHbMErL9XOrqVYeJ7P4ZblvXtvTn7YLZ612tcAnSbgFhjqjRk3/8I8TX6BW
         VrM5KWia/GpDPu/Ka0M0Gkt5EcoX29Ucpe6Vf6q++M7G8IBdm614nZPt95hv7PmFqtuB
         R1EqWXl4X8a+aJ1FcYHXZWgzdiJ1/6lvOXWnyz7LUB318T+2zHKwOW7M09sg9NUCmZMe
         nU956ASYNygp9GGaOWSnpOZcGpTRrLMXRzxfN5SqaGyJ/flxYk2/vwUluUlmcv7BAJp0
         5vtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1770900811; x=1771505611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf/qENqOCRmmJNr9ag54Z8HX70ovzWa5oYbu2Y1woKc=;
        b=DUud3H8+s3RBN759qZ5T+i16QNhtpsI/xLore8+CLmrRSqZpKSCA9mbmE8y40cAwDv
         NECUqz3iK+ct/0FrPwq84ESNEGQvJJUSiQ+kjU6xENw8ZNWn2yEpIHRVmaXZ50gRjsfF
         q3cZolOgdM8kBtrAqSDOnnFky/Fl6woeTQEQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770900811; x=1771505611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bf/qENqOCRmmJNr9ag54Z8HX70ovzWa5oYbu2Y1woKc=;
        b=XJsO3HdazaQM0JS6/0rRzwuwXg4izGKkaN5fJkYA730PhhMmT1B99zFpf8iflahj36
         /+9PhfoLpBqJc6zBipCVbIQiYI605GGsdxUu8J2b2LxSWgBv3oURlrawmjucSp613dPi
         nSHSdw9QxS1Zc7HPdXb+Uv1dfqq67DsJIesi3oZEG/ZsfrAHT7n2OCnesmJ8z/pQPY+1
         iFFbmgl0umzn5qpLQMBeY5jzHseFE4gO2Q9fazUFf3Uzcp9ZODyNQKNuHSqFC2+1ertU
         3CNTIoYR+2l19zAAmn/PCUx/RSwfgwfSoXzpsWoKfamm6k8RgyHDcBYaKbT83INl2PDE
         50Bw==
X-Forwarded-Encrypted: i=1; AJvYcCX07TLUKcm7tfJNedOxzqzuHiM45BXRj/vI2X02bz6CVQvkEJBDKX/aPvN1s4X/Isvdgry9fMplWT/zR/iD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7DDvLM49hTe1ULuehc+e0kecdOYD8HDIQtEdopc2w/67GVMg
	GLd3TeDcn5ptY6Mql2Nk/hCYMZoWcmtJj4He5AejeSVXPJFayxmeaKaQVasLM/gO2pbfAgDM3gW
	C2WjAu4VYNhoa4MdNFRF1Qg2X4SPdRveex/c3qWjhPQ==
X-Gm-Gg: AZuq6aJS0jxk8OrF82IagEgbFkN2d+NO9UOyEA9OTwEHlXN39Gf+HHGftn6tXqrWKnF
	0IELoomnGHXQw1+DN34irLQiPN7o9yQM66kKRozVJZipQ1d3cBMrCywec5JSNqI9NhIcWctsWw3
	iualMf4nQ8kLRLw7ile8XebokTOYckJJAU7nndOM98BnzHKsbafWb7Gxi/SQqlzVBqbln5Ktsl7
	Hs5hHJjafaWNQJ8yqjx7ryqCN2EopW5HuYsb7Y0iPC1nUwASAKrVfq1soB90rv7n8h/pT4JAsqd
	wOQImQ==
X-Received: by 2002:a05:6512:b84:b0:59e:429:932a with SMTP id
 2adb3069b0e04-59e640136cbmr778546e87.1.1770900810703; Thu, 12 Feb 2026
 04:53:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210103933.27228-1-r.mereu.kernel@arduino.cc> <fb7028cc-f27f-4a4a-8001-f862a55ea528@oss.qualcomm.com>
In-Reply-To: <fb7028cc-f27f-4a4a-8001-f862a55ea528@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Thu, 12 Feb 2026 13:53:18 +0100
X-Gm-Features: AZwV_QgO94a9UGBqDK8F7KWK9SrjC8-T_6teOpOtzziJwCdXcOGv3FVyPyN9mE0
Message-ID: <CAKA1JhbxcDywJr05prZtBj0dQ_f-6TSFa37_P9zxh6-nrM8uKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: arduino-imola: fix faulty spidev node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alexey.klimov@linaro.org, 
	srinivas.kandagatla@oss.qualcomm.com, m.facchin@arduino.cc, 
	Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,arduino.cc:dkim,mail.gmail.com:mid,qualcomm.com:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92697-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[arduino.cc:+]
X-Rspamd-Queue-Id: 2E90312D9BD
X-Rspamd-Action: no action

Sorry forgot about it.
Thanks

Best wishes.
Riccardo

On Thu, Feb 12, 2026 at 1:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/10/26 11:39 AM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > CS pin added on pinctrl0 property is causing spidev to return -ENODEV
> > since that GPIO is already part of spi5 pinmuxing.
> >
> > Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino un=
oq")
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/=
arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > index 197ab6eb1666..d2c3359dd814 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > @@ -328,18 +328,11 @@ &spi5 {
> >       spidev@0 {
> >               reg =3D <0>;
> >               compatible =3D "arduino,unoq-mcu";
> > -             pinctrl-0 =3D <&spidev_cs>;
> >               pinctrl-names =3D "default";
>
> You should delete this line too
>
> Konrad

