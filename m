Return-Path: <linux-arm-msm+bounces-39885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BD59E03C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6922819FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961341FF7DD;
	Mon,  2 Dec 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdVL44YO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC341FF7AD;
	Mon,  2 Dec 2024 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146873; cv=none; b=s1+lydgLxHID5kj2Tn7xjpNKbumxaQfhvOe9miiaIcidj76fQyHlbbPF08uG5ttSBZYrIHsqTSj3YgMYse4dZ+9G1lBHxDUX8ynjlSGrvNNMtTjmOJeFP5AmO5kSrbdB9aSDm9UK9IIAgBVlTqieOtg8iCcE6tr4h89LoTLzPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146873; c=relaxed/simple;
	bh=LCfNSPlMUD/kqu8SE4a82o6X8loD/j5Z+2jmH99MAAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dp+BYe312/rk+q3IO9r56yD0O6+GHPserGoJmuiLHQhD0Av1rgI9bgWS8WotqBjm3kPra28TcFNsj5Wk9R5QgBb5XFoINUOpGMX6Mz6TwucrABLPqC8ZZAf3rPk1A65rhvW1akLeePuBGdo3RrPMf/LB8PrwrZEIa0YlxdZ0JeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdVL44YO; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29e61fcc3d2so865123fac.2;
        Mon, 02 Dec 2024 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733146871; x=1733751671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUYIZ2ydxDwLVYAeG6jV9nAoFWZtZeFvJf0Vki0Iops=;
        b=bdVL44YObS5VrDfaXesaemeXxtpsGDcig+y+sE1F2zYTh2XlT+JLnJ0ko7nu89A7f/
         8z5N92zrpHjbwlWo+dgyG1XQEcW+yjyjZiXSzuSdJj6Z+7a9Re7xC2WaRyK78SVwhuco
         6yp4QBh+SyeGxNSaKDUR4iddWsyZiuImM4uOxAD9iiwCQcb3g4yklt4FvafkUhZk6bp5
         vFu7Rtf+uN/brgEojif/ftF8PxN/ybCQ0qf+RGHXlGgl39+SAosPohkTHVCZZlPzLOWa
         Ga4wCi5HSf6N2wyZT0d5heMcpaQJHkZwZCNmdckTld7CVPCG9EPXf7IuKd56GQBT1WUK
         g6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733146871; x=1733751671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUYIZ2ydxDwLVYAeG6jV9nAoFWZtZeFvJf0Vki0Iops=;
        b=PyyrhkFiMa1mX8iVHexCA1nGZ8KoEK3hNOpBEmyeCIYDPesDeriPj/mg9DPNkqI0TT
         pRfELHvADQjgLt6PIlWSdctotZMJCR6KyDRB+OgKByBU97PAGTDZIlEBs6tjpij3pHSf
         hlu/elDlESwmtSObC37DL19HKMsPYQtr1+y35PIToS+j/4Jn6uhT/FC2HCTo8Z/InYze
         OhgCQdff0hjFGKqJb/OE0obFh1WdeBfxa1cMd/uzMMgIUgn8TDM/DxwLQZYaB5Yfz2VQ
         0SR6oJWeXqAzstZnNYkHmNGkdCcXSwvbRU0pY8Gn1bXLreI/AWFuuurEbKkjNyQskwNz
         +35A==
X-Forwarded-Encrypted: i=1; AJvYcCU+iHf6lorQDJ+uiGzkt6/YlrKtfl1lXpr9bPV+xfWeQ8YOVBKCdmhzwRY1aFkpOU5O+G6+mRkIvTaw@vger.kernel.org, AJvYcCWCEkwZKoppFRWHviXQDwLmyYU9nARgu/IKWrpZK39Azip6A+AbZqrqmng+2qxGg0ipa55fgxtvbi7307ns1Q==@vger.kernel.org, AJvYcCWgvSOZRoTTtiun04tdMLEfghSYHmutCqY7YXsWZtNu2ZQe34hsLblEWzI4hLarVd+M7VwsLBoRD+/PTF2W@vger.kernel.org
X-Gm-Message-State: AOJu0YyLoX6HzfBiugLetvR0hic61rapLRctnhsmV+4lQyFb1MfTmYSR
	COd58qEpLgjTqL0vLsYiMoWTNoZFGSNejmshKh3co5mLkm0suyFE93qhH5kZtoc0nrzCLgPWYVX
	T7viMIej/6hs0hUdLz9MzkPDz15E=
X-Gm-Gg: ASbGncsujnBj5N9cGlSf9kUGLLt/sLGqCfgc49uMZcI6oJ+00rY10+dSIJsqQ3/5Uqx
	A8GA5jfuDgBdW2lyjzxM8WcNXxCmSVg==
X-Google-Smtp-Source: AGHT+IGPj/GY+jCbhbdEdoPHQRBT3R11lJWFYCs1Inn00vxYoVG9APhbHVCybk7MXBCd0TqoaGD2Mo2/0wOkdEPCJYQ=
X-Received: by 2002:a05:6358:4b12:b0:1ca:9dcc:e6af with SMTP id
 e5c5f4694b2df-1cab15a79fbmr648012355d.6.1733146871036; Mon, 02 Dec 2024
 05:41:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-3-5445365d3052@gmail.com> <33e14868-e6ee-45ca-b36c-c553e0dcfbef@oss.qualcomm.com>
In-Reply-To: <33e14868-e6ee-45ca-b36c-c553e0dcfbef@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 16:41:00 +0300
Message-ID: <CABTCjFCTggnU7UvqcKYq53iRLACBxWE7C1TKRi7dr42o-=0Mqg@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 26 =D0=BE=D0=BA=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 13:41, Kon=
rad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> > Usb regulator was wrongly pointed to vreg_l1a_0p875.
> > However, on starqltechn it's powered from vreg_l5a_0p8.
> >
> > Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device=
 tree for starqltechn")
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >
> > ---
>
> I really really doubt that the supplies for on-SoC PHYs were altered,
> given these regulators are assigned based on their specific characteristi=
cs
>

From rooted android system from klabit87 on starqltechn:

```
starqltechn:/ # cat /proc/cpuinfo | grep Hardware
Hardware        : Qualcomm Technologies, Inc SDM845
starqltechn:/ # uname -a
Linux localhost 4.9.186-klabitV6.5 #1 SMP PREEMPT Thu Dec 10 19:42:53
CST 2020 aarch64
starqltechn:/ # cat
/sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa1-pm8998_l1/consumers
Device-Supply                    EN    Min_uV   Max_uV  load_uA
ae90000.qcom,dp_display-vdda-0p9 N     880000   880000        0
1d87000.ufsphy_mem-vdda-phy      Y     880000   880000    62900
ae96400.qcom,mdss_dsi_phy0-vdda-0p9 N          0        0        0
ae94400.qcom,mdss_dsi_phy0-vdda-0p9 Y     880000   880000    36000
1c00000.qcom,pcie-vreg-0.9       Y     880000   880000    24000
pm8998_l1                        N          0        0        0
starqltechn:/ # cat
/sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa5-pm8998_l5/consumers
Device-Supply                    EN    Min_uV   Max_uV  load_uA
ae90000.qcom,dp_display-vdda-usb1-ss-core N          0        0        0
88e2000.qusb-vdd                 Y     800000   800000        0
88e8000.ssphy-vdd                Y     800000   800000        0
pm8998_l5                        N          0        0        0
```

I also downloaded kernel source from Samsung, to check its dts,
and it also powers qusb@88e2000 and ssphy@88e8000 from 'pm8998_l5' regulato=
r.

--=20
Best regards and thanks for review,
Dzmitry

