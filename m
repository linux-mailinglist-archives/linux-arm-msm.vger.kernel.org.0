Return-Path: <linux-arm-msm+bounces-40844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E73EF9E7A1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 21:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66D9281F43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 20:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49111F63F0;
	Fri,  6 Dec 2024 20:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBi9HbMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A11C549F;
	Fri,  6 Dec 2024 20:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733517757; cv=none; b=NJiIMHGVIgQN4Y4hY0c6Q2ZGP5RNb0u4a9aBOF5nK5L509Je41tWLJzJnOAP4NPWn2tuUcBw9mhFJrHPHUYyrgF03Hp0+XRwpWDGiGuIpm98mgxuVv3maTenxKNOiWbDucMzroNkTZaQesuuXbRH/St0EZOk6bzohCNgNSfYqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733517757; c=relaxed/simple;
	bh=7FMBJvtBDWTo+KIE2Hy4+YE3DFqzJBO80QHhIdJI0Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM+qw6UYkG1cpmy6z+5r+vTPP/VxrsO/6a7inXcQP/+yPQVS5fl+TQhJ8qHeJhG4QduSdw29ptOgBjB0a+/UhJi/LL/gvUZI45RPu9EtcxKwBsk5TMtpswagTteKkLz2G0XeGDstgdMHFNj/6UdU74gDHzh1DWwBaQdgAYBjUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBi9HbMl; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so7093137.0;
        Fri, 06 Dec 2024 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733517755; x=1734122555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FMBJvtBDWTo+KIE2Hy4+YE3DFqzJBO80QHhIdJI0Bg=;
        b=mBi9HbMlrIToGwKFVNW4TDkXqCV+HWlg6rulpEDqy6AINH+6YOVRjq9IZx6pUQAJWk
         LbPn+1If+MxMxxIQlU3vu86X1CcZV9Vuwqr+n2HirmXgWryWEkPn/dliMSjPpPdj2ZG3
         zKHIs7pRprMYnyGDkJkDfnQELDrDbvR8ypkt6n91HIlwj1ukaPxPY4kWzTYUvWXzHCFr
         Nv4Jhg6E5ZjPaahuoxHnfCgDMz8sZ7eFlqZaBPT2J3GgtC0Vyghx9Hva22m1UPUya9E6
         ikMJ40mxaTpMkHeR2YJcswFwbPKROlJmAEaSjLV3OpZ+Z6iDCsTye3KUWf5gVzKUykcJ
         atbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733517755; x=1734122555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FMBJvtBDWTo+KIE2Hy4+YE3DFqzJBO80QHhIdJI0Bg=;
        b=A1j6qJevO6CLgxDUSUCady/1hVC/6EI+rdquHD4c2ZyxP77fuk0yiPyjUlF/4FXcbz
         VXTwAsnU53SLAMN5DCqgt+PMIC7vRbyaKVEARwafnMXLedmD481Iu3M0mnzhnxgxdusP
         j4yTRIg+XATtk5LXUHjbk+S/1QNfZXeVmFPEZF4jN3wC+nLqco2sOpjpIBSl0txxAD5l
         i8oV1bsTVu0673TpIN0I+NXdPhibNM/RU0tt71Jv8RMfHcx8dmQuXMMwT/d2DdT915V3
         3+pzX27LxVB0xSrZHcIwsva3gWOfHxrnRP3KU5ruv1qrm/2cxKpSZNV9ZZUpRe9ucRaU
         GyCg==
X-Forwarded-Encrypted: i=1; AJvYcCV7EPJX20VC6wHX/K2ldGleCEvRnRjQsvNQNEbr6ehbFcbcpNsOcAaZGmAN+nRr+WvNehNi5SZ0hCAPyojb@vger.kernel.org, AJvYcCVXKsnC/O9a2xdteEGGcbVIUW9NaLVUzPvvwBF02Wta7Q+T4LS7M6oP2KA8Zok+9MdSG35Pf/8DhO84@vger.kernel.org, AJvYcCWKvwKGuDEJrMjFpOA5EQ2fuEOWhT3WRybPGVW0yxNEW+SPwdrY1S4kOv+mOaykH7KI1eRKf+rCfST+wxWeeQ==@vger.kernel.org, AJvYcCXG8E/I03EZ+bHMRgv4ed43mlN6YRzwX8aqAdct+peV2AModXgQNWCICWGOFD91oeuhVT6MgntmXp4I+Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoHBTlfj0M7HbqEMvkIbgaJPMk+eAaNUIJkTa1p7j/PvGolWRP
	6xXrOG/7qbHyIFiXnjz6s4D7e9PJ0gWXfeCI+vWieiT9zvsJs/ESjQKMEnQWzyJTZ/vH3yoBJ0T
	8ehpgl5UmFtjP0aohNCxlYcWsyg57shCd
X-Gm-Gg: ASbGncsEY3jM0luCaLUco+JukiFkplKUyvFlSwrqZtbrndNS89xmdBUQUbqMLWsamZn
	bfjSHFdpGiGw6ZO8Hdx3tsbbATiflGA==
X-Google-Smtp-Source: AGHT+IFAc0eiukV4w2HsnxXwh119RzhcP435O4SRLXGkUh5TImPlsVPMnvFdkUldt52feLqWQVqNzSjYSdXVodDyWuk=
X-Received: by 2002:a05:6102:3909:b0:4af:4974:a489 with SMTP id
 ada2fe7eead31-4afcaaecdb6mr5723337137.20.1733517755127; Fri, 06 Dec 2024
 12:42:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
 <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk> <CABTCjFA9DyRzca93qoS5_+sfc2RLfNVNqN14WVfKODjHykwGJQ@mail.gmail.com>
 <08e07421-8a9b-4535-9cd5-9383ca9024b3@sirena.org.uk>
In-Reply-To: <08e07421-8a9b-4535-9cd5-9383ca9024b3@sirena.org.uk>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 6 Dec 2024 23:42:24 +0300
Message-ID: <CABTCjFB7XiR6_+r375h0fJipA+OC2i94ruTG-sWB=s=0qYRReQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=B4=D0=B5=D0=BA. 2024=E2=80=AF=D0=B3. =D0=B2 16:31, Mark=
 Brown <broonie@kernel.org>:
>
> On Thu, Dec 05, 2024 at 04:29:45PM +0300, Dzmitry Sankouski wrote:
>
> > This is the 1st patch in series, and NUM_CODEC_DAIS redefine from bindi=
ngs
> > is deleted in the 2nd one.
>
> I know, that still means this change is broken.

How to avoid broken change, when moving constant from dt-binding to*.c
file, given we have constraint of separate patch for bindings?

--=20
Best regards,
Dzmitry

