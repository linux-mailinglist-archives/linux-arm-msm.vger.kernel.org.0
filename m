Return-Path: <linux-arm-msm+bounces-33928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0B99944B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 23:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCCB284766
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288AE1CDFD8;
	Thu, 10 Oct 2024 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST452Cah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DFB40C03;
	Thu, 10 Oct 2024 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595095; cv=none; b=F6rf+FVD3w2jkVHJUKqzWiXJm/nmK7WlWORnMCRyqSYPoeK9arWC/pYGTx3yR3DCTiuVJ2ttTdzVLtn6Xjfs89Om8u6N4dsHRBdVb1n+Q56LvBUGiLBN3gIOrBuza9Vllej42E+ID4w1qHs92AFYQ+DvVSbZ6SI+HRUJ3G89mYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595095; c=relaxed/simple;
	bh=FcuSlW53WgqovRjICzIDSUMea9NRqIRhOb8YTIi6CPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAu4x/fAgdPSyfaERAemH+JbOljAwuYTWmpPnbr1YhoZhpAvzze60W5egGtfjbGWKQlF5SpiV6L/D4g7l1z5EWl9+Ac22Sv2/RcolhGMpsF9dMJKcPuZN6yd/5ZpdPKGkSHyz/iUHy5Lb2NKXFup9JNN+rdnx6v2sNrE+x1Bvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ST452Cah; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9944c4d5d4so197736666b.0;
        Thu, 10 Oct 2024 14:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595092; x=1729199892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NauSHKeAvgpwTcQ1aKIngRfqQGp/N22b0tcNK2HfLP8=;
        b=ST452CahTR8HZRsDJFKrC6R/qarUhWB4oKHlcmdj79BVUfVUCoOfq4P3NS9taigLKI
         zD9v9qo76QwC1iGi/KJxztvgAN26nxn2398YYS7iD/eNsTF9Ba7ASB2NP3IhbeDNETqY
         pMjR9k1ppcYW6isOuW1+4ntjATM8Uf45sBknszPjDSEZ2JUSKA4z6IoS74/Awh45NogT
         ipzmNI5T2fOu6HJ8lsrYRKwn76c42dJXMg02G/acH+iVHDz4Ni8N1XGyP6WdAmrywCzO
         ildznZx67A4YfkLnsVf5T070UDo0xire5Ijm/Z9uUYrz19D2FLLAlTu0rGvp/HopRHRT
         sVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595092; x=1729199892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NauSHKeAvgpwTcQ1aKIngRfqQGp/N22b0tcNK2HfLP8=;
        b=Lsbl1z0FfZzMB5jm4xIKKTBlnmy0UukuSUDF/KaTJVIDo8bK9gNsve+TYMcHMk/htN
         5Cr+Eg8A2Syk1L6vYivPzXWU8/ergu8zAenvi5X7vXZtH84ihzH0PnskeAqwf5NNUwFg
         wM9XqrGYJvVpJ7cfG3Z+i4Vi4X0ABb3QZJrnQXrK4dpiaMPDFTCMBIMo6bk17X2yJqLC
         RX4ppf7ZRSxHjz0BbK9uLiDi5VwEBLrC27OaM0tNpvAbzSexnA52kCxUdmoKuRr9mFrv
         lwikAFscgp+Z2aG/6SkX8qKmh5+/5DGVrOZOKRhmHx8SoZW8APnuSHoCibr+2L9c68kX
         o5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUYew1sFv1Qyh6dL2VrPupPgTohwjQ7VB7sex/2yGzg1EKCbFiMjn9wv1lmQ9BUqmhBUvq7IbOChdDYDpeE@vger.kernel.org, AJvYcCVkYU5vD5IFoGK+rehgxrJ9rtuPjSl1onUAsUVVS9dYGCHv4HD6V2wgJJ2w3mKuVFKe2QT0Es9vsdba@vger.kernel.org, AJvYcCXB8snEmlc7SkkEzcpAueJt8f7i3BWyyK+8YfgE/djGbk7BFyluxvKBLDzxXTIgF72mhuvmK+0bivbjRdLqsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeyq5s/m0s0oFyaV9HuymGR7In0U2IMKrEsW2ZxtyEoprbVTS
	j7gCcRFk1WHGkH8QD/LwFjAn+NPalv2CmcLG63F0KBKYJMUhp5gsXYcnnmABcWx5MWTpzeQgu+C
	44+StRrcD3thSVmWGjWJUp288Kw5x
X-Google-Smtp-Source: AGHT+IG5yC+VmcHw8pOOXzfv1ag2UEXS5lbU6zfme1Z7unsKiiKWUbPZNOXUKrlqOahelOfhdwSbctYK4LtWJO7Yju0=
X-Received: by 2002:a17:907:948b:b0:a99:8378:b939 with SMTP id
 a640c23a62f3a-a99b931457amr29426266b.2.1728595091526; Thu, 10 Oct 2024
 14:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-6-jerome.debretagne@gmail.com> <ZweV5mcEWHofpF4J@hovoldconsulting.com>
In-Reply-To: <ZweV5mcEWHofpF4J@hovoldconsulting.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 10 Oct 2024 23:17:35 +0200
Message-ID: <CA+kEDGE9fVWNK+3Y8JtM8jG9ki+QCoPAM=8AGC+HARL2CwyJYg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc8280xp: Add Microsoft Surface
 Pro 9 5G
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maximilian Luz <luzmaximilian@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 10 oct. 2024 =C3=A0 10:52, Johan Hovold <johan@kernel.org> a =C3=A9=
crit :
>
> On Mon, Sep 09, 2024 at 12:35:05AM +0200, J=C3=A9r=C3=B4me de Bretagne wr=
ote:
> > Add an initial devicetree for the Microsoft Surface Pro 9 5G, based
> > on SC8280XP.
> >
> > It enables the support for Wi-Fi, NVMe, the two USB Type-C ports,
> > Bluetooth, 5G cellular modem, audio output (via Bluetooth headsets
> > or USB audio), external display via DisplayPort over Type-C (only
> > the bottom USB Type-C port is working so far), charging, the Surface
> > Aggregator Module (SAM) to get keyboard and touchpad working with
> > Surface Type Cover accessories.
> >
> > Some key features not supported yet:
> > - built-in display (but software fallback is working with efifb
> >   when blacklisting the msm module)
> > - built-in display touchscreen
> > - external display with the top USB Type-C port
> > - speakers and microphones
> > - physical volume up and down keys
> > - LID switch detection
> >
> > This devicetree is based on the other SC8280XP ones, for the Lenovo
> > ThinkPad X13s and the Qualcomm CRD.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
>
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024, J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne=
@gmail.com>
> > + */
>
> You mention it in the commit message, but since a lot of this is copied
> from the X13s (and CRD) devicetrees you should probably make that clear
> here as well and include the relevant copyright notices. For example by
> adding:
>
>         Based on ...
>
>         Copyright ...
>
> Johan

Thank you for the suggestion, so it would look like this?

+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Based on sc8280xp-crd.dts and sc8280xp-lenovo-thinkpad-x13s.dts
+ *
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ * Copyright (c) 2024, J=C3=A9r=C3=B4me de Bretagne <...>
+ */

Bjorn,

How do you want me to add this to the patchset?
Should I send a separate fix-up patch?
Or should I create a newer v3 patchset?

Thank you,
J=C3=A9r=C3=B4me

