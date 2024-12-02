Return-Path: <linux-arm-msm+bounces-39850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F339E00D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C841620D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96141FA167;
	Mon,  2 Dec 2024 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBqcCjy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0A1D8DFB;
	Mon,  2 Dec 2024 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733139852; cv=none; b=SrX7B0nWd/OGoyIrWWDKMxWUlC7VYOV2vhvlAcjp2XROr/TF1U87eQkTrqztz4aIs9fgAObINPpPW301L/bo1hQ0KBKmJF9msg8+PVomN7x6kA4h2kcp7Pg71bDM674g71JnM4GwA4O+T1z6MqDo9qyAyKbAVhU8G5QQP1bDTvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733139852; c=relaxed/simple;
	bh=GZsoeQW5hdstO/v+cThYbQR7nprHNq50b7WyQzu5d9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTur6QRqsigFR3LJ0r8GxMHH7PHHb1nyzAyzYfPLWzo/Y3KxXA6EFcanQTEhPkB91IEUqZMR0/g0gwftpd/HfgRM47vUw28GZqMgyQgEkKgcqyDhy7mpUtDt2IiCQC2vEkFBGDeb1XdTn0Wfa8HePUVyjU+v5/jc6DcuyNv76H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBqcCjy+; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4aef7d0cc2dso868879137.1;
        Mon, 02 Dec 2024 03:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733139850; x=1733744650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKw95k+5UoWoDfh+G04oOPe4eVhSYepVo1cu+W92jK8=;
        b=dBqcCjy+WDtrC18zopz4vRG1g0OCoNx3b8JEo//BWU+jmb1BRvTXZZEHrfCtkVV7aP
         ePNUo8b3pQa7k5QWvF2iASE5X1rW/Z2vy9yfMsTJvKVVmbZ/y3l00ZrHPItnrmK5JPy6
         RY+svnpnC2DMi8jRohENFNnU1ZXuFHRIs9852IqIz9VXpObxKFEMGFcUcJlYs2hEDaa6
         Y/3KMG0XvlnUD8d1txhOPDCNMfrYiFUU062+KgG9NGrEAM85gTrQHS7zDp+Y24gUIEeE
         tZdwtZgvq+//lGnR2v/cmFblPFr1PhQZOW9Pd5JXABkfKBMYa5rravGxNf38k30kIeL7
         B8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733139850; x=1733744650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKw95k+5UoWoDfh+G04oOPe4eVhSYepVo1cu+W92jK8=;
        b=LbxO59a0UAD+LOCvo76IIgvLZd7uOYBNqFINoFV/dWpRtB9PYnhp6NXzEpazlryDGi
         fApgtIpH1Xle0S+OqpEowtVtLaVwV5gHPfAARldGhaOKDR33t4W9xB51IblCXrjAOJxh
         IQ+ofqKyWr2eUT9Yz0WRBQMyPNCJnxecJ2mRiYph2G13j3OOIDaUviKQI82MHs7dCAcz
         b5l5wvBWudoMehGFr2zoczbj7IuE3jfhQs94Y5J0jpSXBPU/JXuipz26YeYC3z2UQbfF
         6jS+uZ2kx5kSRg+N1JEHrNiZQ7ZuAPn8SrnqyM9vhCI/1d3ID2KRwRvd3cSBSkgUbkXR
         2xvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8tq9/kjs7EHzyslnr3AlrgUBWxfDKDOtLpr1x+ZPWamcWpTmV1VOyqr2PUFoZUrzMvCFEPGJ6881+POPY3A==@vger.kernel.org, AJvYcCX4c+upDoBZ8gAg8CzeSfc72+L+6kiM2XGAc28OAhNF/GgWidsHXJjmenhptslm6QiP34jL0+DOinamjc9w@vger.kernel.org, AJvYcCXKsX/ANem1MyJdti589H5kXoO1j8zwyRKdM+ZHepMW/3YX09H1Kl2BWISdgLkHIioexzWCk+NJcaA9@vger.kernel.org
X-Gm-Message-State: AOJu0YyvAgZJ8suTC1CAhZhI5MxK9M6+d08oybMmTtYuefS/EVvZ3F9d
	rt+vrxv2MawwbO3J8g3iAr0AVyN4bMZW/BmOG9KUyiD1tE1tvdVI4sFCbrOjZIpQ3oY4kxUeXlG
	tx0tVW1adH300NAHbfRjDFvoTM/2tFg==
X-Gm-Gg: ASbGncsiQ3Y+nnKF65vN1v6QQKYM7Ytn8bl/X4i7J1Ko0F/9o3+1QIw1k+0QupeGOlm
	KslcQRyrTJZaH2lprDWw1R6cnZUXNow==
X-Google-Smtp-Source: AGHT+IFQK9mVZMREASLpV6lvotlW3aXUn/QES//1LdyM8DiaRquQ1A0m9N6f1DElbFsTRnQNKQ1EC88tDCGg+NIaJlQ=
X-Received: by 2002:a05:6102:c8f:b0:4af:57c8:5b2a with SMTP id
 ada2fe7eead31-4af57c85bfcmr19692567137.20.1733139849959; Mon, 02 Dec 2024
 03:44:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-10-5445365d3052@gmail.com> <0cdd22af-150a-4dbc-8436-13211d93d417@oss.qualcomm.com>
In-Reply-To: <0cdd22af-150a-4dbc-8436-13211d93d417@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 14:43:59 +0300
Message-ID: <CABTCjFB1oG8TwZcQQzBMhuXUHjQdjE987RdZ9QgG_oi1R8WYoA@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] arm64: dts: qcom: sdm845-starqltechn: add
 initial sound support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 26 =D0=BE=D0=BA=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 13:32, Kon=
rad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> > Add support for sound (headphones and mics only)
> > Also redefine slpi reserved memory, because adsp_mem overlaps with
> > slpi_mem inherited from sdm845.dtsi.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >
> > ---
>
> [...]
>
> > +&sound {
> > +     compatible =3D "qcom,sdm845-sndcard";
> > +     model =3D "Samsung Galaxy S9";
>
> Are spaces cool with userspace?

Yes. Oneplus enchilada is the same.

--=20
Best regards and thanks for review,
Dzmitry

