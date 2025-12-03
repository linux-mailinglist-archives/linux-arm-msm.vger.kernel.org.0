Return-Path: <linux-arm-msm+bounces-84267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB04CA1BFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 22:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD4EF3009941
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 21:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEA62D978A;
	Wed,  3 Dec 2025 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4OCNr8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9829B239
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764799153; cv=none; b=IiqXF6l52ubeFEUU5igLQt2DX7wqBL+TaK69AsFHSCLMMFkLwaA60itgNZBP0fJ+Mj9eBZbssx1zFNpZf2MbibdUfVS3Mr1dgjc37PZnGatbPlNPx6F9B6nwnHhTN+FN9BemguUOpwTspmPIDOCGZZ3F44zqJnsGlni/YRyCXwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764799153; c=relaxed/simple;
	bh=lEvJr/atOEKDVFkUTOAuD1BGg60pDSo1DOfPqpy6WWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imKAAz91q6nNBv3mrnvGkLkbdEWtzogBwnKWBFwaH6FQaxRI26GrAf/xbTPBtPlbCfVjD/vja4YS47nYKfTjTmLzWM5js0s6v+hi73RpmMF+QKV5ZwbLoQVa/Pw5jku27isALz47Hr2kgkM3dat3JsNHX5+KuNtfqkUTDD4ruic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4OCNr8T; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee328b8e38so3077991cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 13:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764799149; x=1765403949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Yqt1MR+hsWWq29mUarfKjlWGd/wXfWxY3AdiETvuP8=;
        b=b4OCNr8Tt7omkIDI4tSMSH5QGzzBioieU58IEvfMcI283UyaBt6aTJghHMTAmP3AGX
         OUNhniNrsFrRxFLbzHU1ZBQ/njPXPlsIq+Fofz2mPwX6a5mThVK04WhxzJBooEQt6hYh
         LKIbVq40jEANqPMmFdnH0a+5lZZgQBjcbobJapw+YDFyf9OIm5MbbbLBQKirZapIpko5
         VXup+1GFHwRMR9LxWdWWOd7pY0ub7Wf5xrb3zUwsKHxnSiblEGbod9vpvYjIiiHJQsVv
         nU2FWQXCF79okIe8PttMUJ3YBg4b3sZ4rIvUelSshPZtY08RgI1YDrj4Vnnvz5ehjqEy
         zG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764799149; x=1765403949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Yqt1MR+hsWWq29mUarfKjlWGd/wXfWxY3AdiETvuP8=;
        b=cEvPYwjOHmhsZQX3AZO5ysJdWtVG+gcEIFcjDTIrBifV6HUBpLC5USQEQdsNnqMExQ
         zZx90pfnxLYQ9xRdXdIDHzqJAyQWhenNnlO1FcpNNkzmdWPZPma8uI90+fIAO5+bhCQP
         TL8zWEXIn9DpvxWj23HDSQsnUBYWkMO5aNwfUbcIXCLs0UbFY1dpEg5ppDCgEsPDjT+g
         P8rLzcsBAjw5lQwRZJA3T4uxUh+QtCBRF8raAgwSEldN7zMhwMcAHOFq62shh7SpKCjJ
         p2nLtzzZF8dEevIal36V/Lb9NptiGz2uW2Vy8GLjnD9KBeIZJizJOaM6oE9IDXYty2ae
         MsAw==
X-Forwarded-Encrypted: i=1; AJvYcCWl12SNjd0Cy4chEas7gxjYfR3ASQwJmZ1yoIiwmUcsOB+zLGa7ZlATmx7ZPaqwQy8bFc95CghDFVEJE1QN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2p8kBXmsDaT5mMmaYY0V0BtcGXCma0WEYIsX/SVRK9Fjl8GfH
	xF1dkGk1lNwyLYIzDeTRzcNVTNsAschl7KPFqAuexmlP1CGzMGu+JFc1uz2kkrzLGh7EPhbYXGC
	6TTxvYcy+ntnTjpi4GgZB95kIGcgEoQ==
X-Gm-Gg: ASbGncvRnuBcQy+W79vGpSv2OabByaJilMNY/j0j8Q6UjzjT6iLKyhblaQ8eBDPV9Bw
	rVjll59MnVlYZwYHODaOUOfojW2vsD6eMABCY9n3OSe8n2NVhuyF/Vi2FmqExV6aYVhpyR5JLep
	T8qRqtu/YuoNNgE202TwTgQ25tJypUdp/GGL93t3jxB/8s38zscv7WIeE9hCnmK3ITlhX4iRHQJ
	/RKPh2DDcGHw62sYfX530Sr5pNLxip/LwqyqgBjDZiTXExsuhnHvP/Bh5H4
X-Google-Smtp-Source: AGHT+IHlMO3En7Qx9p1zVPD2eUUUEVRjdwVMCOHEi+vOdOy+15IoVicHVs7AO7akLj8Z87aJQKISlv9SfCTY/9yu5bE=
X-Received: by 2002:a05:622a:14:b0:4ed:142:ed5d with SMTP id
 d75a77b69052e-4f0175fc826mr53423741cf.50.1764799149405; Wed, 03 Dec 2025
 13:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201011457.17422-1-daleyo@gmail.com> <20251201011457.17422-5-daleyo@gmail.com>
 <ae91cad5-5a0b-4c83-9eb0-6e7baf6a33d0@oss.qualcomm.com> <CA+kEDGHyx7C7PNxQ8votwABiQpKhAAh126os3OLu-W0kDo2ySQ@mail.gmail.com>
 <aad15cca-bd3e-48d2-a70f-f1a66726b50d@oss.qualcomm.com>
In-Reply-To: <aad15cca-bd3e-48d2-a70f-f1a66726b50d@oss.qualcomm.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Wed, 3 Dec 2025 22:58:33 +0100
X-Gm-Features: AWmQ_bmQzqb9krRxDEjipGV6yz4et5aL93ytuyONXvLiXaRzeNqjiBvW1yQcohs
Message-ID: <CA+kEDGGN0074JdhzSoHvihBKCg4ngx3gtGxgUQt+KWRp=PX68w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: Add support for Surface Pro 11
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 3 d=C3=A9c. 2025 =C3=A0 11:56, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>
> On 12/2/25 7:50 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > Hello,
> >
> > As discussed with Dale, I will take over the v3 submission since we've
> > worked on this patchset together until now. Here is my feedback below.
> >
> > Le lun. 1 d=C3=A9c. 2025 =C3=A0 16:35, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
> >>
> >> On 12/1/25 2:14 AM, Dale Whinham wrote:
> >>> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> >>> Pro 11 machines (codenamed 'Denali').
> >>>
> >>> This device is very similar to the Surface Laptop 7 ('Romulus').
> >>>
> >>> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can cre=
ate
> >>> x1e and x1p-specific flavors of the device tree without too much code
> >>> duplication.
> >>
> >> [...]
> >>
> >>> +             pinctrl-0 =3D <&hall_int_n_default>;
> >>> +             pinctrl-names =3D "default";in v3
> >>> +
> >>> +             switch-lid {
> >>> +                     gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> >>> +                     linux,input-type =3D <EV_SW>;
> >>> +                     linux,code =3D <SW_LID>;
> >>
> >> I.. don't think this device has a lid - what triggers this GPIO?
> >
> > When a Surface tablet is connected to a Surface keyboard, opening/closi=
ng
> > the keyboard triggers a wakeup/suspend event. I will double-check if th=
is
> > entry is involved and will remove/keep it in v3 based on this check.
>
> If you have a magnet handy, you can run `evtest` as root and try waving i=
t
> around the screen frame - it's presumably just a hall sensor

After testing tonight, I can confirm that the switch-lid entry is required.

J=C3=A9r=C3=B4me

