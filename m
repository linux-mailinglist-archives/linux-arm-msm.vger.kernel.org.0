Return-Path: <linux-arm-msm+bounces-39843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB749DFF7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDA84162162
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75B31FCD13;
	Mon,  2 Dec 2024 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPL5fPpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526E1FC0E5;
	Mon,  2 Dec 2024 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137124; cv=none; b=bQHPU7Xr0YWs5iNFH91a488iomkuZMsy9r000zt3A4EQrrxQVfRGVwGdM4/3vMo0b5VCqaA3YCfAMKVy8pZf9QTGkvrG26jMPVX1ceRmGk6x2Q7/p/od0cYxrg1FeL0i5ix8Eo7BIubOslcGLzUawewQjFkekOEpZJK+ZASEKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137124; c=relaxed/simple;
	bh=+nxRREVnR5y0I112w/Jah180rKSxFhlYFjfn7aw/klk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkm537L7/2VyCHpXkrHMURQokyz0txh+GQsW+ckuGInK2vecy4YZm1xAGrqXL1Hwz71Lp9cCObD/Zw8/P65tduSvehqIp4MMkzfCMein5TqNODgg3KNEXPO0HLfuAw/gJYPvsu21xc65i5iduKL3r4Xpga5g2ltdgRRtn74fnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPL5fPpI; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4af09420293so1304401137.1;
        Mon, 02 Dec 2024 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733137122; x=1733741922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gfoa7bD2f01l4BmRlAhSCsAqRh96RlqgXzfDjBF8Dfk=;
        b=QPL5fPpIJiquzpBrUucQcQ7OAAKHQEs3Aj7TRZuxwBIrRVdFkia7+8Z8SrFOi+SCju
         n0g6KLQH4ncn4U001Y1RpoW2QGxmmNOk0s6dic4ODFhsvDvZsj2J4vxbf8HfeQIy9PvG
         wgEr6bRnha7Qjy+fvAa5ITCjp66YlFaYtNmfoiza3YR2Dxat73TI6z2aPsJ95mFRYTJg
         s8+XlinQd2C9dNCZzy7J+ENOzPQUbCePEr/sceoMd9gW3p9BpxwOGve+dQr+zrua7CM6
         jYae8fgfIm21FmR1ok0HNOav6z7TRQTuYb5FppT7Yzp1SN74B4Jnla1axJZhLP23Sbr9
         eeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137122; x=1733741922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gfoa7bD2f01l4BmRlAhSCsAqRh96RlqgXzfDjBF8Dfk=;
        b=fKRAMGJjk89zUQbbbLrTWt4kZGElSzdkIjzMf0nC790vXk9zXab8saLdg1WFBl/4du
         22qek+JWKRa7CtGSEWHYC9UVjA/yTgc4ChCfrnjXYMYkyNZXJU+Fjr+rzcxpagcdGZUu
         KT+UPoAeMSYnxN35oO0l5P5qp1w+hR2Pmz4rbBF8qnsMS2ihxRLlIn81lcqnNj5UQDnY
         xnw2lvXzq7xEbnFdx9GcrSLYqtgWPkCU82mJWCJYQHg36m8YYm/Oc1hvFmkr6a5N8Afa
         6SY/HliazBJEhMCVVOngaYsxfjc+JcmuTniMIWKFC2fQyqo7geZ42HsGqrK837XIAGCH
         rxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9GJmp15QkoE6nkrgPMC3BC3SbaM/+ELjV8ybr5MyhWcPhTT/HqGhL9mzTvuW/j2fjTqkVa1DQHbCn3AatMQ==@vger.kernel.org, AJvYcCUAzFOf561QTAep+elvlzk2db108hCc76l+AzjhCQWSQGun17yVQO6Gp0X7Nue01a1exVcoGBD4i7VU@vger.kernel.org, AJvYcCVx28qH10R+4SsE2XmW0iaWSHSo6wTAqyJJb0MP/gPfvp2Dp+LOb+B862hcKdyCIg0dKkv1l7RXsMcmX6rm@vger.kernel.org
X-Gm-Message-State: AOJu0YxB6xUgyLTAjpeWHe/0ECTESSUeTygLsBdGAkXjnkyJ5vbY1DgM
	/BFImWBfA5gfsl54XZaGDD7j24jhniH16rap32PgdJZf80GSj7B0IN41QV2jdnXtGVELZlBcdrl
	YpcKJlHTZMD4aXtroJZRT0SclzCg=
X-Gm-Gg: ASbGncvu9u3odfqdFzEGmRYmFavWUPMs7n1z62A0Jp07GouP0HHiU6rRT6EGdrA5DOO
	ztxM6s6dlWD2NMUNDyR2npo2aLvN6EA==
X-Google-Smtp-Source: AGHT+IFlB8c06w2axw6TQWoIQCxm3r13lXyNDj8VZnMYRZPeMarHkdmhyheKxlRQAhwFATF1p/9Mtr8ic9XojWNVB4Q=
X-Received: by 2002:a05:6102:c4c:b0:4ad:a437:c41a with SMTP id
 ada2fe7eead31-4af44a0ab7bmr25948208137.19.1733137122399; Mon, 02 Dec 2024
 02:58:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-6-5445365d3052@gmail.com> <9ac43c69-b3db-4f0f-a562-b8ef7d30530c@oss.qualcomm.com>
In-Reply-To: <9ac43c69-b3db-4f0f-a562-b8ef7d30530c@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 13:58:31 +0300
Message-ID: <CABTCjFDV1Afz8YmpkPVvpC_Y77qLexCBueMt5vk98L=VRmUz-g@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] arm64: dts: qcom: sdm845-starqltechn: add gpio keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 26 =D0=BE=D0=BA=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 13:38, Kon=
rad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> > Add support for phone buttons.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >
> > ---
(...)
> > +                     gpios =3D <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
> > +                     linux,code =3D <KEY_VOLUMEUP>;
> > +                     debounce-interval =3D <15>;
> > +             };
> > +
> > +             key-wink {
> > +                     label =3D "key_wink";
>
> What's this key? Bixby?

Yes, I'll rename to 'Bixby'

>
> Konrad

--=20

Best regards and thanks for review,
Dzmitry

