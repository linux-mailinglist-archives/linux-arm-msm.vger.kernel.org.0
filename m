Return-Path: <linux-arm-msm+bounces-26562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2D934D8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FBC01C219AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 12:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820BE54645;
	Thu, 18 Jul 2024 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kiO1KRkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C113A407
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721307460; cv=none; b=Dfzt44JVYWqQ4rFLXelJtojUOb78wPPGncztJkX9lZQ3iHZAuC/pzxskicVNnsa1/sj3Kt9g0Hsq8in3f4MTpRYab9ls6GFf7M+jlvhJ5o4/NB332ei4TM66MC4aT7KVNpp6+/HtssQK3PTlC99/6SU/dyefRHGPf71AbpWNd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721307460; c=relaxed/simple;
	bh=6t33ExFXMVqeGGgCcowq/z2Ijk+S8jKWguFiKLwxv5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpVjczQ4wjX+XD1Xh7x7wMCmRFBBqES29iV15iTPvUmH0eX5fzG/BQ52gCMziH5U35IZlPRamtGShHD71Sguhlr4bGyvNp7AFzxwLywR1TTcdpMDgULzDiZ4xvCfh9vsQT1l9y3PsGnK5u84v4kRxEyQTUn1kQM0Q7J5ZgVuOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kiO1KRkE; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-48febcc8819so252193137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721307458; x=1721912258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVInjStjvITEQ5VnpuqHo8nXnIumN5+C3sE443bU/vk=;
        b=kiO1KRkEYBJuFPangZqYcEgBuxHChwnPks6T9DCs3EISZWy3O+ndZvHEtNpcx0gBKK
         EP0HKEWtTLKildmILDD9bt9ioOn1AqmIImAzxRmEPgwt3avKiaM293Nr/XeBA0x/8RHy
         jJ7k5Z28GQPZMNskRg+tghM72lDivuvIUKlblrdVCYuKn8jjAVWZgWPSrOs4sQ4jnR/3
         Mt3eY5fN/XZSvGnbzAThs4gEP9T+MJE6vfFmc+D+DobeG9cHLKITmw6ckWvsBdaEVY79
         1mAVLWonBEj2mx7waQGgp3l32zw3t9V/M9gLD9+6Wz7ez5pAhzUX87ySxobzFRDsECRf
         Q8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307458; x=1721912258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVInjStjvITEQ5VnpuqHo8nXnIumN5+C3sE443bU/vk=;
        b=cOh3xwm6K8F+qcYWa6PIZiPge1XXLkuUHiEAm6gJdmzt3lE8dX1chs36x4pRUCAUuK
         YyJkFTm7jTCk1ij6X7t0nXt5dOxkBzoXhIMKQcnWZR/Zqhx8dujjWGyOWQFp/JNyVFGe
         LWXl4CaHmPNb/LwRZrcaQ+RA0AwtHnxFkLaXNF4bpXSzamtELAxV8+bylX21S/Uf0/W4
         OTDeb9YCTxVH9SAEb7GY5/JJ62YvrqoAgBHHPcWDD6zVZrG21yFR5dObma/o7ytfWWNM
         RE6PXEoHS/gbImVEIqdQ4B07yiYWrkU1odfTwcygCaZ39N23PC9LrrsD4U8m9FvUaQs3
         6b+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKAyP2ioz3OUo9M8Ro3mEp34PTHZpVjhHe1e2u9U1pbQrbh6xj6sw3t6zXLtBJPWTe8nZs14hD6dt9izFI548SVM36uy+UD+yqb5y7IA==
X-Gm-Message-State: AOJu0Ywv3OAhSmAOy1TrftDELfRUC+GFM243N2AlKRcgY6hBIeAzLU5O
	NuYcmRC2eBtDuW6HZvxbiw/ILFW/P23XHA5935Z3KSsH8+w8lJKoeUwEOlUDZRmotP7UBOtbDlZ
	nEU8qMeeDwqZDSanbqJrICATA0bjInNGR2SYVLQ==
X-Google-Smtp-Source: AGHT+IE646b9knV3NyerMzOxtymWvWfzL4uzox56mIVkmCycSdvNmnfz7nxmOgZQS2I/2F0Z0lVpvWR4zo+8YyHHc+s=
X-Received: by 2002:a05:6102:571a:b0:48f:a83f:7d10 with SMTP id
 ada2fe7eead31-49159883121mr5585168137.10.1721307457682; Thu, 18 Jul 2024
 05:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702091655.278974-1-amit.pundir@linaro.org> <d3416be5-b97f-4db6-a779-9c436e41dd72@linaro.org>
In-Reply-To: <d3416be5-b97f-4db6-a779-9c436e41dd72@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 18 Jul 2024 18:27:00 +0530
Message-ID: <CAMi1Hd1Tinhd-dXS3dXjvSWqe6rNZgPJF+3kZOXQj03LkuMPcA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-hdk: add the Wifi node
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 15:10, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 02/07/2024 11:16, Amit Pundir wrote:
> > Describe the ath12k WLAN on-board the WCN7850 module present on the
> > board.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> > Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd: add the Wifi node").
> >
> >   arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 97 +++++++++++++++++++++++++
> >   1 file changed, 97 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > index 12d60a0ee095..c453d081a2df 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > @@ -279,6 +279,68 @@ platform {
> >                       };
> >               };
> >       };
> > +
> > +     wcn7850-pmu {
> > +             compatible = "qcom,wcn7850-pmu";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
> > +
> > +             wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > +             /*
> > +              * TODO Add bt-enable-gpios once the Bluetooth driver is
> > +              * converted to using the power sequencer.
> > +              */
>
> <snip>
>
> Now [1] driver & bindings changes were merged, could you resend with the following squashed:

Done. Thank you very much Neil.

>
> [1] https://lore.kernel.org/all/20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org/
>
> ====><=====================================
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 0fa0b79de741..01c921602605 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -284,13 +284,10 @@ wcn7850-pmu {
>                 compatible = "qcom,wcn7850-pmu";
>
>                 pinctrl-names = "default";
> -               pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
> +               pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
>
>                 wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> -               /*
> -                * TODO Add bt-enable-gpios once the Bluetooth driver is
> -                * converted to using the power sequencer.
> -                */
> +               bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
>
>                 vdd-supply = <&vreg_s5g_0p85>;
>                 vddio-supply = <&vreg_l15b_1p8>;
> @@ -1312,20 +1309,15 @@ &uart14 {
>         bluetooth {
>                 compatible = "qcom,wcn7850-bt";
>
> -               vddio-supply = <&vreg_l15b_1p8>;
> -               vddaon-supply = <&vreg_s4e_0p95>;
> -               vdddig-supply = <&vreg_s4e_0p95>;
> -               vddrfa0p8-supply = <&vreg_s4e_0p95>;
> -               vddrfa1p2-supply = <&vreg_s4g_1p25>;
> -               vddrfa1p9-supply = <&vreg_s6g_1p86>;
> +               vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +               vddaon-supply = <&vreg_pmu_aon_0p59>;
> +               vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +               vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +               vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +               vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +               vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>
>                 max-speed = <3200000>;
> -
> -               enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> -               swctrl-gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
> -
> -               pinctrl-0 = <&bt_default>;
> -               pinctrl-names = "default";
>         };
>   };
> ====><=====================================
>
> Thanks,
> Neil

