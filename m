Return-Path: <linux-arm-msm+bounces-8110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A083A4DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 10:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38FB31C2048C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BAF17983;
	Wed, 24 Jan 2024 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zhk9/IlM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0817BB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706087190; cv=none; b=s0/T2tC4YUM2j2SoFyX9D8AsIN7HI+gEyw/m+BFsERvQ6lOxqqlKG/oP6ECvsDjKmWowfC5awBl7lNsOKBqzgHpcSM0/IB99WocpwapIoIdg4iDWyRCIG5wuE5O0VxqnzaW/cCnRtI5wlgbyczprTzLKYKY/WdZH3oNxz1SKfMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706087190; c=relaxed/simple;
	bh=SvgzQJOVzKFyo5y2yWHlyqTgiruwQ3Jo4sTlJ8GKWt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbRgkXyzpcZHFJ0lHq0Kr/hT+qHhrfcdXLYzt9cuXhOnCqExdVQqNM/wCDTU4p6q+YUFnag4zCLR5q1JLIWjzIb/3EJF36d1Mx07US54YvirF55auHyXyXdo3c7K/pgy2Cqb+euBD/zP1+nKEK3BiDABGhrNTjLbNBVIK9Kdg18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zhk9/IlM; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7d2e16b552dso1420290241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706087187; x=1706691987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ztK8J8dy9UJ3zTKlyFYgnCK60E5swTIPybg3C/yykI=;
        b=Zhk9/IlM+eJFgWIBIv1CEVTDz4VLq7Tz2yASdIe5ahp/3ECMDFfpeSs2jukphuHmxC
         1kRBZQD4nh0hReUumhORV2C/1tMcvGnswCgGpsuZh3H3qaFMBLX2fMIBfo/LD9Gc7+r/
         dEwt+d2e/8VQs2A3EnK3vzYCGdqyOqzs1WiARiCo/VWy1n3qGRsf25Q4MTTZrAdnK1tB
         5gsuhtGWsyVolarg2lLn4ZJEvAbLOnjPBZWyDN0DfQkFIxifQSU7Eps5SlgDrS8Zty1k
         dYNSnmoruho4ETnheWGQvQ4qVbYWGFr/AGP5ln50uQg2jGTDw2dopRBLxdbMJv6pBa2h
         tVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087187; x=1706691987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ztK8J8dy9UJ3zTKlyFYgnCK60E5swTIPybg3C/yykI=;
        b=Q8Dz+dF1KrGRfcU7gkyu5F0CujculxfDy2EhdMiKUJtalhCNsKVJT7pQb8TdMsMy/6
         BLSu8SmcJJ3jwRgaFUiH09p1SrLykHdq9FrXKco4eRnRTXiam1dQGJEubtK37oQbfU70
         O4JQEc3ck8ag2K0F4m7ArY7Y9BWRRsOD+MPvlNGaiDgtQJA3TNjlEgz3kSnwZAxjABjh
         46AIVAT9wbbUW3lNf+btjRdU9bkywh6iXH8sA+pmxawDSKGy9swIv3AbZInB6ZIQ29I7
         jFA2iBoRzjIFt1T271UzNTDV67L1gf4l9C8SmGrKgEk3zdsvK1x8yCXqkvsQaVlolx01
         nlTg==
X-Gm-Message-State: AOJu0YxP9aVmX/PV4WiRq0d1wkfhVL0EHCyYrHd12Eu85c6/6+k+ce7i
	3UyjsFw9RZKWFRcTcPAhn09GuQhil8i18NcoQmj1GVdjThYIgkrivz/Y/oMcakQSEQztnCxUeVy
	+kED3kck4ieGIB5qAKxqlYpoKzdbbKddEBYWDiQ==
X-Google-Smtp-Source: AGHT+IFmlZa8u1vWsikjPEa/ZKvG9X/VTqqnRlaxfxP/RqrWVVKEcn8oSxoOrEJ8CzuIeRSGacDYYe0KzaF1QGEiD1E=
X-Received: by 2002:a67:ec4c:0:b0:469:a699:3273 with SMTP id
 z12-20020a67ec4c000000b00469a6993273mr4574253vso.1.1706087187440; Wed, 24 Jan
 2024 01:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl> <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
 <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com>
 <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5> <6786954e-096c-4216-94a4-71f090d7eead@linaro.org>
In-Reply-To: <6786954e-096c-4216-94a4-71f090d7eead@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jan 2024 10:06:16 +0100
Message-ID: <CAMRc=MckG32DQv7b1AQL-mbnYdx4fsdYWtLwCyXc5Ma7EeSAKw@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 4:49=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>

[snip]

> >
> >>>> +
> >>>> +             regulators {
> >>>> +                     vreg_pmu_rfa_cmn: ldo0 {
> >>>> +                             regulator-name =3D "vreg_pmu_rfa_cmn";
> >>>> +                             regulator-min-microvolt =3D <760000>;
> >>>> +                             regulator-max-microvolt =3D <840000>;
> >>>
> >>> These limits should be applied to &vreg_s2f_0p95 (although I'm just
> >>> guessing how this maps to the upstream supply...
> >>
> >> I'm not following. Why?
> >>
> >
> > Are you saying that the PMU contains a set of LDOs or similar that
> > alter the voltage from what's provided on the external pads?
>
> It's what I observe on WCN785x, on one side we have the usual VDD_AON/VDD=
_PMU/VDD_RFA/...
> and on the other side the WCN internal PMU generates the VDDXX_PMU_XXX vo=
ltages that
> are consumed by the WCN785x again.
> The schematics is clearly split into different entities of the WCN785x:
> - PMU
> - VSS
> - GND
> - PWR
> - CONFIG
> - GPIO
> - RFA
> - PCIE
>
> Neil
>

To be precise: it's page 33 of the QCA6391 datasheet and it defines
"power inputs from host" and "LDO power outputs" with different
voltages.

Bart

[snip]

