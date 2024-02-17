Return-Path: <linux-arm-msm+bounces-11552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5178591F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 20:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCA0B1C22B6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 19:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6404E7E564;
	Sat, 17 Feb 2024 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t6aBFFOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB47E119
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708196963; cv=none; b=Db2cQSXjePsii5UsFwbatoHQqP4UkjU8sEOq5D79mJifdgHiyvsTo7NGZKEf7Zsoi9f0JoPfeTWoVBsaG+OkkwvsbVghv4pSXj24LVRutQ+0/ylxithis2quGTIasDst+/qs2HXF538ePgI1pMkgYmakl0daiNxYkuGFO5JjTpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708196963; c=relaxed/simple;
	bh=mHUrGkPYsyhxxlsBdHCbeAqoSBC0CP7Nshe0XTvKC8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIbGPD5LmXTDdmGe+eqqPCh2+GmM1frHBemsQMN/gIePMOafLO8CxsbysRfX8dmyloaSKqCYsKdrYd9vT3Ytu65Poa7yDxQkv9+A3dOC4A+L/9nIiJS4e2Qtvonh88koEdz1/0ByUFt64jWRTsmRfirsn8qRe6KzReb0cT8UxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t6aBFFOg; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4c99ff3763bso4868e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 11:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708196959; x=1708801759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ez+Cdi6g3dY2Nbfzh/DEfLOxMJ0SyIO8GaFN/UW2ig=;
        b=t6aBFFOgA66oyp+Hi6Uujb4ucrAPWFqrxWHw8ZSwIdCIjqhFbfgnY/o2jWOflxnfiV
         qak9AeXEKYFNH8StbZSVM+p75mT3J4fUFNtuOIzTESlqVvCAm/s2Sxqev6cLm+XE4icd
         VcZG/XqbawIPmwmMiCfwNaA+w6VO3o7ReTBuqFHhyWRHEkWg8PYhR1IqO75qKafCNKEa
         N6OopR6nCwhKUgxBzTk2xgmihjHnLMGDzHNb6SXTZsL244FdPtmret7dzHQWvnCzqLQp
         6+o7pnjZ2vmCcQlyjC6NqZXIjq2V+vQSvcKbB7u+Us604ONI44cN3ysM+M6wYO+pCtRB
         l3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708196959; x=1708801759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ez+Cdi6g3dY2Nbfzh/DEfLOxMJ0SyIO8GaFN/UW2ig=;
        b=VBhdRHae+otePESaPSpXFxWEqq06jRcMmOOCbeQPjBwYTD0yPmE0ncuOQnfY9iyWCN
         EtEfvizLFCdRGC1htW7aP7Fj5MSb0MD8FuNPusTrinVnPQhwFg1JFBnrJzoWDiUORACl
         tDBQ9sDzESrIVRogWGe6+gfUSh5+pm9/+U/ftY5PHTVSTcle+f1N1AFBBGsmld6fXry/
         lY2QANQ6Dw2RuO4Xp6fT+iDm4EFcsJtrka2CEddBiDSqB72gBbkCO6CKCpFFEWuGVYwU
         jeC7t8/0JhKoIv27m+RVKOlv4wrRFqPzylce7qXtBULqTVBUu1CKPeZz3jR4ybq5cn5V
         VyRw==
X-Forwarded-Encrypted: i=1; AJvYcCWl3ESlIqNb2gkSKpmNNQzAj+OXzzWfBi7K6j5CRYDl/uPV+InrtkoHqzvsdVs7w6RdkLB8GQSd/sq2yP87zDYs5l4+6juizAaDdYmkKw==
X-Gm-Message-State: AOJu0YykYqc/DciLI5HkM3BPUPB+iHaDh7TIonsrdnKuRsXMBl3R5BSE
	aVm+zQCfoy+6eWIHtZyi6ZYwpjzikup0VB8pvtfjHYxGREStzTQz4N8sCVVfnlDE9H9EL1knkGn
	jov8oypqVRsXP5sa2t2nTejCtewZ2atlh73FhvA==
X-Google-Smtp-Source: AGHT+IH3Shnpaid7W3lEIMwMHXlQC60MXaDAqAi1jiC4M9FRxflkXYH/2cjpGpJq/yL/ljPvWt26+2tM/6Tzhki2Rkc=
X-Received: by 2002:a05:6122:45a0:b0:4c1:149b:fd18 with SMTP id
 de32-20020a05612245a000b004c1149bfd18mr9363330vkb.7.1708196959474; Sat, 17
 Feb 2024 11:09:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-17-brgl@bgdev.pl>
 <CAA8EJpo=LFcw8PbFRvGwd9nS5ECazOHiBMWRsqfEpY-v0iQLLA@mail.gmail.com>
In-Reply-To: <CAA8EJpo=LFcw8PbFRvGwd9nS5ECazOHiBMWRsqfEpY-v0iQLLA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Feb 2024 20:09:08 +0100
Message-ID: <CAMRc=Mdsg5gDCKD-=ok=mfYJoFpUVpTGFUE+om+WPYvQOc0rzA@mail.gmail.com>
Subject: Re: [PATCH v5 16/18] power: pwrseq: add a driver for the QCA6390 PMU module
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 12:17=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 16 Feb 2024 at 22:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This adds the power sequencing driver for the QCA6390's PMU module. It
> > uses the pwrseq subsystem and knows how to match the sequencer to the
> > consumer device by verifying the relevant properties and DT layout.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

[snip]

> > +
> > +static const struct pwrseq_qca6390_vreg pwrseq_qca6390_vregs_common[] =
=3D {
> > +       {
> > +               .name =3D "vddio",
> > +               .load_uA =3D 20000,
> > +       },
> > +       {
> > +               .name =3D "vddaon",
> > +               .load_uA =3D 100000,
> > +       },
> > +       {
> > +               .name =3D "vddpmu",
> > +               .load_uA =3D 1250000,
> > +       },
> > +       {
> > +               .name =3D "vddrfa0p95",
> > +               .load_uA =3D 200000,
> > +       },
> > +       {
> > +               .name =3D "vddrfa1p3",
> > +               .load_uA =3D 400000,
> > +       },
> > +       {
> > +               .name =3D "vddrfa1p9",
> > +               .load_uA =3D 400000,
> > +       },
> > +};
> > +
> > +static const struct pwrseq_qca6390_vreg pwrseq_qca6390_vregs_wlan[] =
=3D {
> > +       {
> > +               .name =3D "vddpcie1p3",
> > +               .load_uA =3D 35000,
> > +       },
> > +       {
> > +               .name =3D "vddpcie1p9",
> > +               .load_uA =3D 15000,
> > +       },
> > +};
>
> I thought that we had discussed this already. According to the docs,
> all PMU supplies should be powered on when the chip is being switched
> on, no matter whether it is for the WiFi or for the BT.
>

I know, I mostly did it to make Bjorn happy because he was adamant we
don't need the PCIe regulators for BT and when I checked, it does work
in practice so I thought: whatever. But indeed, the docs say
otherwise. Noted for v6.

[snip]

> > +
> > +static const struct pwrseq_unit_data pwrseq_qca6390_bt_unit_data =3D {
> > +       .name =3D "bluetooth-enable",
> > +       .deps =3D pwrseq_qca6390_unit_deps,
>
> Can we call corresponding regulator_bulk functions from bt and wlan
> enable/disable? This will save us from building the tree-like
> structures (and possible loops inside that tree).
>

Can we? Sure, but the dependency graph (yeah, we should enforce it to
be acyclic) is what makes this code future-proof and allows it to
avoid repeating calls in different targets.

[snip]

Bart

