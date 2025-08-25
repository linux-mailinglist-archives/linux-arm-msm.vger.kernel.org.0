Return-Path: <linux-arm-msm+bounces-70763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402EB34B20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77B6A7B33D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7CF285C83;
	Mon, 25 Aug 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HaGKZuLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06987285C91
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756151491; cv=none; b=CwnzaTTPByOQgstE2C5UAqvBh3mh231Fx26SFApYV6E/Ov4Ox0tfnQrr9LOE2//woT9c3OpYRHqFJlKH3/yyVW3xtRjVl/TSr2tvSW3vlCxu5OAz4s02W0846asOjXLIS6rm7621Rx9VtUTZkSdzlP2Ou9SSLdzbnwiDNagR2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756151491; c=relaxed/simple;
	bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7zWmqdX10OUvBcMvtd6RSsliUB7jnt9CAr3YD27cQ/dGwL6D3/0zvs+25ymA6fDLSpRtMD9VuGEZ0vo4KBO40UGPp0dUWovhCkS2rNroHWkOnpmo+ilBARnvTHJAZpU0+l/qzTPLLa62m8V0xcvJoKnAnK4xEHaWjnpUcpagHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HaGKZuLE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f474af957so1143609e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756151488; x=1756756288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
        b=HaGKZuLE6ZJf5NweBqUmIuGwifT6BYS2i4BLg5mx+ZgR+ON4KD3FyeG291qmjdDpfJ
         +RoEEvKdCiiXxd6ubXNVO2mpJWzfELIb9KZAOMAKunk8HTjxaguQ2pyzhtaDrTWU91n4
         ZswiXHqVFhmkzU+40FgYuatK/oVikkgvdgbL9jh6kuZvumDtxLQUAXwRiokdo5M9ItHA
         d/SLxabybgDP2HfHgo6lu/P7iyEMaQr5wvx4VOtw3BczFU0LG/NHP0YKpuJwkYF4P3gg
         uweGCHAom57JbmfDHLpB/xFQLaFR/hRk5IkNdaoxBhAXINddVrPKkf/6U6VqwrmahyqY
         tdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756151488; x=1756756288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
        b=vXCo5+2TQ27fwau3FKdH+xQjzH9XBfUFTQU7w+voUSv6L8EE7NO4Je27zKax/RFUEj
         ckaOgDnPoylVstvVZ8f8BABe3ZrT0U5LBFOZCOgp4WlK9ZHNP8HxfjaN3cwi0kvmp21w
         WqnJPt0yoCSqBoldln4jaKmN3Fqrs5DMlB8XnO1Hfyz+uzFbzinChe4pFnQ5yqwQmVCw
         7XcRu1LvdPhnyhe2zc8aF1MfF/FU7mALeX2kAjsnO0qS+HWNmrLgULDvHBDixujk6/Xz
         Y6sRocegBvqiz7qpo8SbFENfflCd7XnaJGevVMEULVb7HoS0hJ5GtYUiCj3x7cWnPqPt
         BAzg==
X-Forwarded-Encrypted: i=1; AJvYcCWQTrXd+//UUMM28++NEpisZfNjd+QuB9HO/JJa702ldDetPJ6lWht5NyA1tG8C5AGaALz5j9ypZmKFVNDE@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLjK/yxOw1EqAtC9DwhH9404urygfBPIRrTvNW48nwkvVK83m
	4tuh4PiszgoCW7tcSxF/2r92YG8l+I1j5wCB6/t+YJxtFTZ3+O0wHxJtDUNg8OQsl4jEYsOGr3t
	aHhJaysWE9P6PHN575medWu5dVaWhJtvGht/PPmyuzQ==
X-Gm-Gg: ASbGncvLJzaFNhOOV/i47BWodzMyiT8iwmsunfQ0AhBEm66c9PMI40pz1MY1j861a00
	jTAtkPaEjR8fqM109RhK3zSfnI0dvkNaLSIyf74aCt4hxm/+PpcuEx2sQuVAuL6p9iZkqyaTIFx
	lqUx+iAZPFbJBLRArbfTLN8VImPn/izgpRhhIxvCvK0u4vuoCwjc0zAj4wcStvu9fcqSUZk3Pb1
	+Nnvdt86X7AgcHZgZ1zTqPvPunmouLzQdEw
X-Google-Smtp-Source: AGHT+IHCixJ3swy46ayk8UZ8ky9sJlMNCw4ccH8gYjaEf6aBpjGfhfoC4qmGYIEYeYDaVuoFN7bhmFqiGNvLwJvOuWM=
X-Received: by 2002:a05:6512:440e:b0:55f:42ca:cc03 with SMTP id
 2adb3069b0e04-55f42cacd56mr2238491e87.56.1756151487746; Mon, 25 Aug 2025
 12:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu> <20250818155103.GA1272375-robh@kernel.org>
 <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
In-Reply-To: <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 21:51:16 +0200
X-Gm-Features: Ac12FXzo7Xcs_f8LKjnis--6Fc7OlBNtr01kDZozGbXhIE3-aXJaLXGWXFJlZYg
Message-ID: <CAMRc=Mf5+3KvKKrVJhx9_CmQ-tN69cahkHgjVgL5M7XCZHuNSg@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Rob Herring <robh@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:46=E2=80=AFPM Luca Weiss <luca@lucaweiss.eu> wrot=
e:
>
> Hi Rob,
>
> On 18-08-2025 5:51 p.m., Rob Herring wrote:
> > On Sun, Aug 10, 2025 at 05:37:54PM +0200, Luca Weiss wrote:
> >> Add the compatible for an 64Kb EEPROM from Belling.
> >
> > It is generally not required to add a compatible here assuming
> > "atmel,24c64" is enough to identify the specific device (i.e. read the
> > device's ID registers). If it is not sufficient, then some details here
> > about why would be useful.
>
> I thought DT was meant to describe the hardware, and this specific
> EEPROM on the device is a Belling BL24S64, and it's software-compatible
> to this generic atmel compatible.
> That's why we have compatible =3D "belling,bl24s64", "atmel,24c64";
>
> Am I missing something, or misunderstanding how DT is meant to be written=
?
>

Right, this is what we've been doing historically which is evident by
the number of compatibles we have in the schema that are never
mentioned in the driver C code.

Bartosz

