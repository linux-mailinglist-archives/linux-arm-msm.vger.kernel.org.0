Return-Path: <linux-arm-msm+bounces-33136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03BD9905BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71554281B7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72A818EA8;
	Fri,  4 Oct 2024 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MrLPw0QM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635721731D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051318; cv=none; b=e9PS5H6BlWRbMamaLyGKRS7YgPIZCTVI1jm12zsB9YU0nzTf64QWngcngTkRIEcdBL3rF/ul5XFJC++8qb1mFUKgBWVBirLoCwI6Mkcy8TdMzvj6OMJX9OmdRs7pfC8Cq3I/1GEEpOlH7XJT4ZJMgahNCo7Hhh12AcSHO8NePQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051318; c=relaxed/simple;
	bh=QaLBm3l6zlXh/5VEiOSYXnCNE/Sdje7Ib5BKo+wBXVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaNHmFYAKPVg0H8nCj8et7YqqsvFQT7eE09yQyL8WER6tEUJ7lgEVtM8u8nQn+WY+ivfVFQoFdktufxuyx6N+YYi+IansEVFrN104JidYQZW33+MORbZuQJQNEnnC+wDxv6fKhIKEeS7fommhNnkRfGKyPsufHOwu57dEb0vqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MrLPw0QM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so3139821e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 07:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728051315; x=1728656115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaLBm3l6zlXh/5VEiOSYXnCNE/Sdje7Ib5BKo+wBXVk=;
        b=MrLPw0QMqwlp2baPHOlYxwFJK+nK9HCv7xHit/YrkcLbnDLAyUY0vxSR7bXBw5qrJi
         rtupNN9fA8dQpP23WBwLWMmM8d50N0fQgsf8IA/uwxXpQpeM26EWnf1lnp8Kb+qI6MQq
         sEX06CnuJkdaapHGU/TG2rF+u7oWHxoJfotSJ0zf98ykO1ObZBScuTY1fb9wMZnRI2xl
         4FuTzDGDTy9XCJZjKNHj4WBREoKmxHFykr1LJAbmr6E+v5wU2riIPTCOBNzkONlWRhNG
         X6dHc0dpfhORu3DVFoqrvHD8DfPSaXBcg1orlrxW/ZO6Cv/tx7kJ2Mgd7V1LFfnSrfX0
         P8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051315; x=1728656115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaLBm3l6zlXh/5VEiOSYXnCNE/Sdje7Ib5BKo+wBXVk=;
        b=IGkWQlF+AjMeZIWolCgdbdRaWqLJikf/CnxuhhMYu2MP5u7PyTyFaB2JQMj5q2GCMh
         QoH0sHUy2zS2ni4miT0+EcgfW1fhFcuXizqELjRAqX/8mShtHBhc44Aaz9uktWQR+Dvf
         QPcnif74sNE8IJeu8scoRJC2oJDqlNDAYYOzz9Ya7Nh027vhxqcqzTj5IFdrci7Sx7Jl
         vyRZ/EDiTRkOO1cNQwyERFZ4+NtwAdH+a4fGuEfVQQgzTSzEZvwU2UBxBfj0YTVU+LzZ
         OdXkK55CNPV8KqZcbnCqtGS3afBllvd5LrQEcpgpY0pA8Jwg/mfXKVQYkDK8VEGu7Gsd
         S5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUkxMalOoBcxxts8b7Aj8q+H+B7LfPn+OKKaDbBH4bkrnOeQVorUpAnOYCgDV1hw0jhvb+STX1xIuzhX0PA@vger.kernel.org
X-Gm-Message-State: AOJu0YwjEOVoWVK1tLpr0Z3+A9LYkPzbfKs8dK1lym80eUgOtWuWqIO1
	IHNmO+s9DFIHPEbjBL9CDjqj9QrM7Nxxj88pnaw4jW/9SG45evpY2KQgp1I0sTLZMNNBcScOXaR
	24woK0va3F9Yv9jTRdbhJJ1QLU+IAp1zsuZeq5G+iF8KSBJ+D
X-Google-Smtp-Source: AGHT+IGAD66cqDcqJdwpFh7yesyCpUMDApNzYFz5Vd5DY18Ed3ygNNwXJNp+b+GWqEmEAb6lNcuWO7ynlMpQMxrdEew=
X-Received: by 2002:a05:6512:a96:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-539ab84a43cmr2119431e87.3.1728051315249; Fri, 04 Oct 2024
 07:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
 <20241001-wrapped-keys-dts-v7-1-a668519b7ffe@linaro.org> <Zv/2Xgs9o78HkXne@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zv/2Xgs9o78HkXne@hu-bjorande-lv.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Oct 2024 16:15:04 +0200
Message-ID: <CAMRc=MdC2yRMK0Sw+5nJvBsTtxtVW=XbJ=3RixsKp7mQibMTww@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8650: extend the register
 range for UFS ICE
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Om Prakash Singh <quic_omprsing@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Gaurav Kashyap <quic_gaurkash@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 4:06=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Tue, Oct 01, 2024 at 10:35:30AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The Inline Crypto Engine (ICE) for UFS/EMMC supports the Hardware Key
> > Manager (HWKM) to securely manage storage keys. Enable using this
> > hardware on sm8650.
> >
> > This requires us to increase the register range: HWKM is an additional
> > piece of hardware sitting alongside ICE, and extends the old ICE's
> > register space.
> >
>
> This commit message doesn't follow what Neil requested in v5:
>
> https://lore.kernel.org/lkml/109b1e46-f46f-4636-87d5-66266e04ccff@linaro.=
org/
>

Because we have dropped the new property two versions ago as per this
series' cover letter.

> > Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> I unfortunately can't find where Neil provided this.
>
> Is this tag referring to this patch having been tested together with the
> driver changes, so he's saying that HWKM works fine. Or is he saying
> that the old feature set still works after the growth of the register
> region (i.e. what he requested in v5)?
>

I think Neil tested the full functionality of HWKM on sm8650 as per
Gaurav's instructions. I did the same as well.

Bart

