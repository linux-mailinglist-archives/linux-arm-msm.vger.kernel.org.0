Return-Path: <linux-arm-msm+bounces-31079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56DA96EF6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C5C1F240B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBD21C871D;
	Fri,  6 Sep 2024 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jd8ihtF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182341C870C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615449; cv=none; b=h6gduZ9cTqO3KgjV6XnpCatjFdT/WanLZqB0Lkjcq8/DWM4B2ckDVsXUVofnidSkJWN0xIk22CiienZopGffB7YXWgA6h39pDdLQLFGJZeiBe6e6LQEkbdlTD4vftkiwBfMJobtwzaqU+JBMzpzUHrr1XfTswJh94miQe1wx1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615449; c=relaxed/simple;
	bh=LWOgOZVRTlI0I+kz30Uk3gnI+5CCKpMpfD0zAOW0w5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLNlIsTu/y7c81UBXuZlT0md7nUSr7tvKt4q4xWiP7Pw1gNJSNCO05znCBT/YEkYiOHyUgftgMRFw0qylFgPtWnuzVL7hCW3M81/jKhZA5avEtRZKn6HWbCQUqqb5gBCOl+bjtx66gMy1gzIDfpICXx6VGpT7/XrudBARU5tnIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jd8ihtF9; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6db449f274fso6323907b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725615447; x=1726220247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/nsrHcczWHZSZRkMXgJlPhYYjECdjwNlK3z7QSwRB0=;
        b=jd8ihtF9M/rSaDe4k3pztC3A4cqffhs+3614oqVhUla9KFlNgcjBLmaYro4UWPHW5j
         /nEjgegZuxznQvTlfr8Y3ikGjzNuBMnPCwz/7lvWdsyYbGk1q2B0AHjCahWAqj4iRsoM
         ENT/E0kRFXQEc+403nCZTR25LNcbuAQGY4q9Q7R15BBbP8e+P7Uyjx9cE8uyxtWMU2Fa
         K12Ce8/XeZmx2lYNf2sYOdCWCHvRDpDYimbqYcIJqYVjzuIRmdptzpMjCjK41ipScLZr
         osbJcuxLgyvaVhr9z0bt3NDdyq0w9g1776S/4I0ujiB3+jtxW6BQ8cQU9nqy2XUaTojp
         Tu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725615447; x=1726220247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/nsrHcczWHZSZRkMXgJlPhYYjECdjwNlK3z7QSwRB0=;
        b=QImoCjIixSaEOSpzMJYZ9j+R0Y8Run9J0yoBrv65O1iMgQEw/nTah7usCFFPtbFA17
         3+hazYYW5sC6RdR5bXSZ3ruxYUBaeAx8AVJhxCaetSZ2VPwcRHw+tX9o7f2FxqrioiBr
         7XKeVvNXct9q9R1WK+gu3uKqSdSGfmy2SPjullTVwgYRFsZAQHVlHNfToohBYGovRnle
         Y8tkLXLUbtQkGNKqyFW8BDhAW3LCSoHrGH2Dm0lr81A2+R+Jp1R++fAA0TSSAA70u71y
         293euha7boBb1iKl5GNKFGUgns4W1OGs5COU1hFgYp3j1WGKivTEIzQQOdjQbPEQf+lL
         FY7g==
X-Forwarded-Encrypted: i=1; AJvYcCVoI3LYZWtHJDxTa2I2xNy+SmhA5fNAulXCRzt5lwxrp2qSeBxou/bJ7Of9qfwaqoJKVfGjKvP178MGy5Ak@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZ1KoFR5wXeoih5bP2CPWsdompJGZZ8Qkcv2bg3KYYEmiaAWS
	GfY/JME9bbf1Vwk9n+vO2RY8as09hPB63tf+/hx6IqBQoPaSHkYyOXdBv0Mv0lWYuTFLyOwOoHk
	h4zC+APCFn3cwtBZJtzCvBaxC5k73krfRj+Mtdg==
X-Google-Smtp-Source: AGHT+IFZN9hYbTcxM1YGXAqx6TijY45qpQ4RcpRodCBMlcZqtSKVL4Cgbh2pPzb7plTG0Lq3ULZUkDoC4pvzYMrTbRQ=
X-Received: by 2002:a05:690c:d8c:b0:64b:2f31:296b with SMTP id
 00721157ae682-6db44d69aa3mr25692997b3.4.1725615447013; Fri, 06 Sep 2024
 02:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905122023.47251-1-brgl@bgdev.pl> <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org> <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q> <CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 12:37:16 +0300
Message-ID: <CAA8EJppi5Zy82=ZUZ67DW-40Qm7aMerNLu_Mzh3HiUBWqPiHVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Sept 2024 at 10:45, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Sep 5, 2024 at 9:26=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> > > Konrad Dybcio <konradybcio@kernel.org> writes:
> > >
> > > > On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> > > >> On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Dmitry Baryshkov <dbaryshko=
v@gmail.com> wrote:
> > > >>>
> > > >>>>>
> > > >>>>> As you are going to post another revision, please also add
> > > >>>>>
> > > >>>>> qcom,ath11k-calibration-variant
> > > >>>>>
> > > >>>>
> > > >>>> I had it in earlier revisions. The only one we could add here wo=
uld be
> > > >>>> the one from X13s as QCom has not yet released the data for the =
CRD.
> > > >>>> Johan and Konrad were against adding this here if it doesn't ref=
er to
> > > >>>> the correct one so I dropped it.
> > > >>>
> > > >>> As Kalle usually merges data with some delay it's not infrequent =
to
> > > >>> have DTS which names calibration variant, but board-2.bin doesn't=
 have
> > > >>> corresponding data. The driver safely falls back to the data with=
out
> > > >>> variant if it can find it. Als  usually it's us who supply the
> > > >>> calibration name.
> > > >>>
> > > >>
> > > >> Johan, Konrad,
> > > >>
> > > >> What do you think? Do we know the exact name and should I add it o=
r
> > > >> should we wait until it's in board-2.bin?
> > > >
> > > > If we can agree on the string identifier with Kalle in advance, we =
can
> > > > add it even before the boardfile drops
> > >
> > > There have not been really any naming rules for the variant string, i=
t
> > > just needs to be unique so that it doesn't conflict with other varian=
t
> > > strings. What have you been thinking?
> >
> > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (followin=
g
> > marketing name). Or maybe QTI_ instead of QC_. WDYT?
> >
>
> Is there any central authority listing these names? Or are they just
> agreed upon on the mailing list? I honestly don't know where they come
> from.

I think on ath12k these names come from ACPI tables. On all previous
devices it is just being agreed upon. Kalle is the central authority.


--=20
With best wishes
Dmitry

