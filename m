Return-Path: <linux-arm-msm+bounces-43917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD2A00EB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 21:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802353A45C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 20:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC631BDA8D;
	Fri,  3 Jan 2025 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhZPWMO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E91B6D0E;
	Fri,  3 Jan 2025 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735934447; cv=none; b=G/vj3W2zxgW4Cj9QrzqoCxJ/2CJ/1Tg/hn8qypwLy4LgjVIG5SpmvmuCdu4KR4ETtlyEP6kxkcCB6ZbIhV05xn7Qy+kih0183Jv4OhjET07EbWm40Ntdx2d2zS0iHMynRdWoZhBIlJsgHXlfTHu0e/Yb2tfLJ4o4PUCfQNHfKqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735934447; c=relaxed/simple;
	bh=lPiwIgHY70n88hTYezEE9bWSVK8nci5DAwG5vMB+PZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQ984o7cXPYzCBtRcCAsNYOC8BVuf3422ntzkGWBxw1yrp1SEKDsKUVAG/vvj45Z1b3rSXkNttXxBsgxNqcZRC8igVsTf7MfEn/kBSl8u7OO6LAiKgbKF9MBH5KdwtQiQC8hyylvfziIj38bF7J5voGi5Cl6DNYtDm8MUJZN41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhZPWMO2; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a7d690479eso98124255ab.0;
        Fri, 03 Jan 2025 12:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735934443; x=1736539243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7wuDd0xlXsCU1o5ipDHo4c+yTMvQtddZn/L3DYIfc0=;
        b=fhZPWMO2kDPJIaZP1DsjfDwpC5Wo7BeT9ZB6W9KEw6doVHPlab2wukmFKwD70jbFwD
         ffvP8aasA3MIX9lNFScUUVYdBFK5U+YM/vA1wHqPdMVY9EUqm1uYdRsS/YlKCEwV64Up
         g3BtbQ7vare+LnJIejHMOOp6XSmuGS75AbPYeyfFxNwU7XRVekI+faHTuF2eNZ9593U3
         WbuAtZ3sgmihyLDn39lFWvqorzZeU6zTOwluFTfdHAp7YefV2E2LUKsMb0K3kfUD6x0f
         vkcoGhygNSdMjs3H9Xp3Y4AwiHzUgR3lOTmxpoSH2ln2YZmfGn4vaUM59tBTQ/9cyUHm
         QCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735934443; x=1736539243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7wuDd0xlXsCU1o5ipDHo4c+yTMvQtddZn/L3DYIfc0=;
        b=jgbC7uTqQjYoNzQWv5pWUdsid4cm4nfzRtfXA3SHBFdQ0wtroib74lAmyerQ3S7iZk
         ZoAF3uaqjSBQk4x/7PU87TLc2aO/BSjAuCv/BHgtnNOc4x2Mwj3eVw/RheJL0nZq/quG
         xYuZmr8k9x7kYEHAT9iG1ZVziYf9+d+NSfPjyJpt6eAg7bJPH4NbFOTaeGadK1T/GYci
         +dhJ9LwwJENAujz71puxkVkdK1b5QsIG/oodb7ErRViz17j3nRhR+l9s1B7vO3FwxwBb
         XpKHVBtQFyplgtFn912gWppIP3M4AX/I81gzRnQ75PwZ8cjRTMJRHIjUMRESthLQ8xLM
         TAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/d/0uNYSsqB3wG+pDnIaQHB3r7IA8SKTSsnIyX8OBttambjiI8j0mPumtWvmY89CVuyA3gAykP4LJLbkzqA==@vger.kernel.org, AJvYcCX1oR5C9T+BaVDAR/OALcCzaBlGVHJT4QJ2BpP8FQLLB4+pkeo8zewUleY+Zcb5h3ckCqJ2QVSIMpaEO8OZ@vger.kernel.org, AJvYcCXI0zvnSaOfTp8SCaLnkf+awJSe9sG4F8UgCak9ujFI+Gw1yRvsfr9Rqw8EyeA/89T6lvFRzQygdmZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwYqVKl84VAEpp5A8HL3N8rXoaraujt8pp0zWR/3qybvmLWFedR
	jK3x2XMUsD+HsX2azMwsYVtdveZAXr9d2ZK8Yog9Dbp15T2RCrqdJXReKpctH4jS1RHc9D+AFeP
	dVCYWbCq2l1+ZnKkSwJv1fqYGeb0=
X-Gm-Gg: ASbGncvaUoxft9VDXeEP8zUyF1Yb2BTqC9ffLszzP3h9KlovPqpoOEvUnqT8w/rhcSV
	NGKwTy27wW7pQ48mQEEPJQUOIXFH8rPE6rWBMv7m0XnObYfytDC5mOrhX3wumLrRr1FmI
X-Google-Smtp-Source: AGHT+IEgxD9eZhAjiqwVHAkvgEy8ZT6BNX5qXIBZe+Cpnt9bgTNehJNL4HLrnyRqJeKKGTEH0nz5YYdHDiiRIDBcvjM=
X-Received: by 2002:a05:6e02:12ed:b0:3a7:9860:d7e5 with SMTP id
 e9e14a558f8ab-3c2d5b273e9mr541175525ab.23.1735934443342; Fri, 03 Jan 2025
 12:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
 <20250103-topic-sm8650-thermal-cpu-idle-v1-2-faa1f011ecd9@linaro.org>
In-Reply-To: <20250103-topic-sm8650-thermal-cpu-idle-v1-2-faa1f011ecd9@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2025 12:00:30 -0800
Message-ID: <CAF6AEGtVFo8BBUeg=UQDTCP=LLRHLc-V1roa=wHECpLm=Mh_gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 6:38=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>
> Since the GMU does a better job at maintaining the GPUs temperature in an
> acceptable range by taking in account more parameters like the die
> characteristics or other internal sensors, it makes no sense to try
> and reproduce a similar set of constraints with the Linux devfreq thermal
> core.
>
> Instead, set higher temperatures in the GPU trip points corresponding to
> the temperatures provided by Qualcomm in the dowstream source, which will
> trigger the devfreq thermal core if the GMU cannot handle the temperature
> surge, and try our best to avoid reaching the critical temperature trip
> point which should trigger an inevitable thermal shutdown.

to we need something like this on other recent SoCs, like x1e?

BR,
-R

> Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when ove=
rheating")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 ++++++++++++++++++------------=
------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 448374a32e07151e35727d92fab77356769aea8a..ddcb57886eb5eac2a70d28e6a=
d68fc6820b5dcf1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -6507,19 +6507,19 @@ map0 {
>
>                         trips {
>                                 gpu0_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6540,19 +6540,19 @@ map0 {
>
>                         trips {
>                                 gpu1_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6573,19 +6573,19 @@ map0 {
>
>                         trips {
>                                 gpu2_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6606,19 +6606,19 @@ map0 {
>
>                         trips {
>                                 gpu3_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6639,19 +6639,19 @@ map0 {
>
>                         trips {
>                                 gpu4_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6672,19 +6672,19 @@ map0 {
>
>                         trips {
>                                 gpu5_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6705,19 +6705,19 @@ map0 {
>
>                         trips {
>                                 gpu6_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
> @@ -6738,19 +6738,19 @@ map0 {
>
>                         trips {
>                                 gpu7_alert0: trip-point0 {
> -                                       temperature =3D <85000>;
> +                                       temperature =3D <95000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "passive";
>                                 };
>
>                                 trip-point1 {
> -                                       temperature =3D <90000>;
> +                                       temperature =3D <115000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "hot";
>                                 };
>
>                                 trip-point2 {
> -                                       temperature =3D <110000>;
> +                                       temperature =3D <125000>;
>                                         hysteresis =3D <1000>;
>                                         type =3D "critical";
>                                 };
>
> --
> 2.34.1
>
>

