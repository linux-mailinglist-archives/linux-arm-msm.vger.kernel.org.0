Return-Path: <linux-arm-msm+bounces-73605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E680B5813B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 17:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19CB9188D137
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE8B2264DB;
	Mon, 15 Sep 2025 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BraxM08z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173D223DFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757951196; cv=none; b=OkaDjARoibfampK3A6Y5NRbj1c4rpPQbYjGgYmkyS5u+GFt2VvaDEAUjgp7hCenNaGmR84oYb9j6TDQDHdpvDyd+lEW2I5VAw16rCcQweSKcu9A7lRlvrvo4Ym1yUb82ZV7L3z9Mvr6u3vY28Nng1e59RuvFYnfRKUsAKLAfBTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757951196; c=relaxed/simple;
	bh=vw5V22u1zW3vlZNq8JfLJlKIAtukVQu3dc2tIRfzTS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieCz7MPJjjTvwce0OX+4HgnHQqSXAihtICGFQlj5SYOCvl4NfpprgK5T12SP3RWgmXAEnCtcKgCpYapRwQ21CSizw8rbJNGuVVyC56AhTzowzoBszb8HKW6U3iUHFN4dtTe4zGDLEmNfvHQQu2fMd3rm5iRWjptzCVK7l99MJus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BraxM08z; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-52e231e3d48so1641064137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757951194; x=1758555994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6uUAh+LuL/fPSRTdR/xbny0tMCspdITXSiqvbosN1A=;
        b=BraxM08zeJpDQLAKovmzoRQ5Ccq6Ww8lJS7m8EHQOPiYzJieBEwprRVdx9gWyDHsEz
         hcWoA649eYqL2ZJ14oKzoTNsN+9J8HT56Z5Kk4GClqXOm065irgdWwiEmopGHCQb4uCW
         XiqXgF6G32PhwQXCWw+nAkXpPOpbOZ0OTtg2CgrLpvs+vbBYIUdVH3WSYJ9HDotvtUOx
         vMovhDGCUN53bdiLZrc/OQZCY/i9+28NFTfWEW5ys8MydhAwcx27tdpyKB7hEsKYmvwW
         N8x2/MH7jdkjXgkWUD1VxVaW7drks8shOmw1ddqWznQckJyAM7YP0BqUAUwb41pFher3
         G+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757951194; x=1758555994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6uUAh+LuL/fPSRTdR/xbny0tMCspdITXSiqvbosN1A=;
        b=WFVVMaSKjCuz6DGoGaXjy/89+3RAufgHD3uUQ+OMU60t/CRKOelBFsCqYjD6keor7C
         PmoIpHAWZc3HxfpwxUFoQuh9Zc26qcz9dDFMwEvYQqjqGIgVWQj8LoU3kIupSQGZJqIA
         RoBNj3qLlZcNk/W9SEjoTgsYWwdbq3e76QT3zP44NFxknMCanpLsQJ4YdLKiUqQgyYsM
         96QhFqsALyLSUsNIUidD+WrcRJobw1eQ8wi40saW/6UzB2bKH8jPIcYLb4Drv//qsSUM
         +SZrZWgg42R9uYFMsf4+v1bYKJTKIM3xr47HsOovHMna4B18/PLCOiYEVahIJ0Gbi1z0
         l5pw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EODlSNgP6yTF0j8HHRj+HGiTK249Jl6tjFYe8aIvlhGy3VAdH+hiFPWJoGdmTCU8WFuM3P+I4N/+E6tB@vger.kernel.org
X-Gm-Message-State: AOJu0YysDLKHjn1KrN462BtCYhlo3COkCITWofFKFzjZvXzui0LSMOLk
	dO8JgN2vogj8rU6F7oBAYYf3wSnSKX5hDSEzVI+EsRpxxWHi1niz9udMKCHZwUsdC/H7xwMVfBp
	sU2Z2QDY5btUQK18g/QLWEwNRl3Cga3o=
X-Gm-Gg: ASbGncvgPl1A3Kf5bpS+GO8W1oOuPbbUP1eunJXtQ9qRbH7rrHjbhNPsNDR2Usw0TPP
	jIg02rNjFjNySnqzA11K+Pz1ePtI1kO5LU/ZgS2OzwdukA2gUIPWwH3FlNP3GgW1kNHa9xhmMgP
	7hQUEpiWxQQC9zspYlm4RAUfruFv8LxxPv/2jkguMyu8cSO3LC+SCc3I48gKLNlL/cehVV9D2LH
	Kzyjv0=
X-Google-Smtp-Source: AGHT+IFUJEUTCYa/7AfbKYcfE5drkKeFqkZxqfSfzL9+OIjs2x42tPAl7dXl36fVlFfhVYJxnO21hWH4lbS2NuxFcq0=
X-Received: by 2002:a05:6102:161f:b0:520:c9fc:4cd6 with SMTP id
 ada2fe7eead31-55610dc11bamr3869950137.31.1757951193544; Mon, 15 Sep 2025
 08:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
 <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com> <a3ce0aa6-41d3-4ce8-adff-14c767d7f871@oss.qualcomm.com>
In-Reply-To: <a3ce0aa6-41d3-4ce8-adff-14c767d7f871@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 15 Sep 2025 18:46:22 +0300
X-Gm-Features: AS18NWDb8W6Zs9BKh7Ic6_AGKZLW7SnWJ6ItgKboSdNTYCSuYztfbS17zB0U_7k
Message-ID: <CABTCjFAO=iLauq37M7LOXOmrgAnPxh210bcoujUsL4zEC3634A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: max77705: add interrupt-controller node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 15 =D1=81=D0=B5=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 10:4=
9, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> > +      The driver implements an interrupt controller for the sub device=
s.
> > +      The interrupt number mapping is as follows
> > +      0 - charger
> > +      1 - topsys
> > +      2 - fuelgauge
> > +      3 - usb type-c management block.
>
> The MFD driver registers one more interrupt, and these don't seem
> to be what you say here:
>
> static const struct regmap_irq max77705_topsys_irqs[] =3D {
>         { .mask =3D MAX77705_SYSTEM_IRQ_BSTEN_INT, },
>         { .mask =3D MAX77705_SYSTEM_IRQ_SYSUVLO_INT, },
>         { .mask =3D MAX77705_SYSTEM_IRQ_SYSOVLO_INT, },
>         { .mask =3D MAX77705_SYSTEM_IRQ_TSHDN_INT, },
>         { .mask =3D MAX77705_SYSTEM_IRQ_TM_INT, },
> };

MAX77705_SYSTEM_IRQ_TM_INT(and others you mentioned) is a part of 'topsys' =
irqs,
which is kinda MFD own irqs. They are unused at the moment.

See also [max77705 rework interrupt patches](https://lkml.org/lkml/2025/8/3=
1/27)

--=20
Best regards and thanks for review,
Dzmitry

