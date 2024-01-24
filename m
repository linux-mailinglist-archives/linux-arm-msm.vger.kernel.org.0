Return-Path: <linux-arm-msm+bounces-8111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29583A50E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 10:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9BC1F262A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A43817C8D;
	Wed, 24 Jan 2024 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rKJibLBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D989D17C67
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706087889; cv=none; b=SZJ2L2pO429vEXTMiWl+HFbd/Kxsgp/NSrO0+ZWaJ4HqzrZgFBFz0m6smYwn84MH+V6dz5c9sFwrjfzgqjL9ebCB0lU1zGF4g7TpFPMSKCjoOCz3kXb3mEVSZGJCl5nhgFVuGkBCusfw4IxvI3cOp4MNOtZUO57vQW2x/xkBik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706087889; c=relaxed/simple;
	bh=orTsqhBmcbn7tZ4fL70XT6Xh1HZOSt8se/WdKsrOa7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5x6mmNzzA7dlUmrWusY1b7nbcstUB+D7aRjQZ7NDpoxNDnWNHa+eCKy1/AebQLQTtVm2B648gnd2IeFGkofUsjcT1A48zLA1+1Ovvkqpz3geZ+9w5zbifWlh7EZeFw0sIp4c+dN0cdky2kVqivHEdNL/iUIkLekP8Gk0XgT/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rKJibLBm; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cedcea89a0so2302205241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 01:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706087886; x=1706692686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orTsqhBmcbn7tZ4fL70XT6Xh1HZOSt8se/WdKsrOa7I=;
        b=rKJibLBmoebxFdKJGa7ymiLjzPLkmTiwQhZyFuIr1UnGTVyq3yK+Tkw6Rj0cc3E4Nd
         7P6M5OoSj3EjKVGNwDaIb7RR1coaYuPOlcko3JwyftP6jyw9hkmyA6WFY9BbXLySYGth
         P1UCoSWfhbIA9Cu5H81VWqcY06rLM/ZJGgNWu2NUwBiYY6xDNlDEAVEdGZD6R77z2gQI
         8F6Zi/AXRMsOIeIfHrVqQ8dNkdzVPVvctGojtwPOjoi9Gr82Qi0629bRXI3IAkaBzKzL
         xYxVkBYjQYDk8iP5LXF/yPKfyfHiuFCBHmXaL0sq1Guygm9Gbg/Ul2fQW/xnNgMRPm3b
         3n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087886; x=1706692686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orTsqhBmcbn7tZ4fL70XT6Xh1HZOSt8se/WdKsrOa7I=;
        b=SjTntXxIehbbiqeoQxivm2vmjndH7huPAgkRkmWtstnHvQPpfmG/jvKGYfHm7defNt
         wcugYTPAK1X8AwyouhEMDfpNAnTYK1HpqohvDLzpgtnbeG8dFvAQo2Wp4VylWNseo+sn
         0D4ZoCGhYT+jt1GqKFaUTa5oaTonMPGHtfrC52dsFbVPG2/gX8NXo97/pUCTWoYkSTR4
         +Ddy/GpbO9AEBgSn10vvjOQ/WGOMDG0XQkBuSKwP60eh/jbmi97b4LVOkj5ZqKm8JyYq
         nxaS7Xwvx35rMzWBaI3jCz3N3CnO2n9NDvd6az3Vy+R610jJg/JaYQmyCE4W6GYRCUiB
         KNvg==
X-Gm-Message-State: AOJu0YzG5zLV16mgKl8Ntv0hNQMKRNz9Dsgj/Z2o+q+PyK+VAmxos8xr
	P9FEUv4GQtWqt4kW9/R4GkIZGJZ4W/qYwu7rIFIbi3K7bjccCq5QZqrDtlQR+CSYdiDxPYQQfml
	YMMgULckMkE7K+YLpl6bZ/4yFkpQBG284eVwSOg==
X-Google-Smtp-Source: AGHT+IHG877pBPzW7S0+BDJ7eaJIl3acuiydSUdBiq1MTPa5dUB/uz66EzX7+ygCjnIFntJm9W0aYf+boDvIi/bGWOE=
X-Received: by 2002:a05:6122:792:b0:4b6:ce08:cc76 with SMTP id
 k18-20020a056122079200b004b6ce08cc76mr3569517vkr.9.1706087886640; Wed, 24 Jan
 2024 01:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl> <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
 <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com> <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
In-Reply-To: <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jan 2024 10:17:55 +0100
Message-ID: <CAMRc=McuutopBgxZysJTSoHTZ9y6zgQhkaOLNHxeh4Ri49hPvg@mail.gmail.com>
Subject: Re: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 4:34=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>

[snip]

> >
> > Ok, so what does that matter? This is device-tree. What linux does
> > behind the scenes is irrelevant - what is important is that there is
> > an ATH11K module here as represented by this PCI vendor/model codes
> > and that it's supplied by these regulators.
> >
>
> I'm just making guesses about the design and how this fits into previous
> discussions on the subject of PCI power sequencing, because you didn't
> tell me what any of the things in this patch are.
>

I really wanted to limit the discussion to how the device-tree will
look like. I will provide a PoC of the full framework soon.

And the PCI power sequencing will keep on being its own thing - this
time using the global pwrseq as the lower-level abstraction.

Bart

