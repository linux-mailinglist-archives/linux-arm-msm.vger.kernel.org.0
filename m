Return-Path: <linux-arm-msm+bounces-26331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 416DE932629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1E2D28300F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB661CA9F;
	Tue, 16 Jul 2024 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a2He631p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE0B198857
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131578; cv=none; b=SKwMB6xed6qKrPuSqFCeYpfzSuIXzvxrSV+7mWnOz2Suy6It0e+bRBkjC/M6d5ha73k2VYpE5crM/nhdDZkK4d0glBhQ7sut5QxDyudonQ0sFMGmdX/DQq5tNjHRe5RsLhY8f2hB7FtDLD7jEfTcEdkTZunGskNUDsJNL/yg+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131578; c=relaxed/simple;
	bh=n782T7h+02g1mc6ge/roaPDCLEZTPuQnrUqCVqCcf14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPf/Kq02UaD1SIN12drHbbpBDpZcuHz4IwVAylaqqr9h+UoMrR0B/M3LjE/Fcuhqj1WNA3Tk7XWXVUFnDq2cgdIvVFQlIhyyBYYTSP1xZ4X6ab03IpKMj9z3T8grFs4JtSNIUbqwSlaRFXsr+US8Hc4KXP5RbE9aQbWr1JqsS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a2He631p; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ed741fe46so2297752e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721131574; x=1721736374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocsignr/nvawl0jQHFR0CEaSXqr4vVO85JAIikTyjZ0=;
        b=a2He631pcp4pzywKY9p4bTW4krrbal9MnkUpo/eF6/ExpggEkhaaItMvaAGhGltt6I
         0yKCHNSTiBc7sZ9ULoLeQDNV5o9Y5u7m3mjbDiO3gmJHbK7qdIPZqpLnJOO90JvHYpKZ
         HG7g7oTySKVm5PTbCmbW5ysfLNezyFnAdQVp8IEbETLj2mVF1CdPMFlA1ptdZ6/WyF/7
         MX67LPIgpGtSjOuNfKEqromEjpLZWT9HdUu2Ly6iC0RZgGOFYe+1bMxEkJBe5KIT+8L9
         GkkH8gvOReD1o4Y937F0FPtyz1WRPiUXuzADmBAy2IBlkfo6ayNvdEFPDmt+yfiv+NcY
         A1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721131574; x=1721736374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocsignr/nvawl0jQHFR0CEaSXqr4vVO85JAIikTyjZ0=;
        b=T3wXIh/MGmmnXhgC7NLz2Z60ECa+cIsRh4z81lkBc6tnoBu9wHkcQSPk89w+86tIJQ
         GJEMqM3sg7Jursjn1h7sPqP9jfdETpwMqi3yzi3qyaS+BjXyJHmsjtCDBnZwqycYyvOz
         UZSSK2HLRCEHh6UE6L5CzgUxGTQLLyP8J9aw0NIcuKfFp9+zvf7681b7wDfAe246nBu8
         01J6MN0sehw7dExU0tB0z9+HIdX2wfN0NIbFfX0MYtHXDFkuZTq2JI4BwbrHN58A7SJt
         lcAROS/h35CX4waF+PD6k7UhQBSbMLQEfr3vwWkVQnpw9IA/BvSuw69xFwggpxitCZ21
         eT5A==
X-Forwarded-Encrypted: i=1; AJvYcCXtAVIRRDVF2Q97kg6IblBTk4A8bHHv8gghBE0t8xSMVkA66SNxq6dZ53ixcXvercQ2xBP9V71FfdMDi/InJcUJLh31aRecU0oWb6qodQ==
X-Gm-Message-State: AOJu0YxMkGi+sHBxFGR4APF0lzFpsgkTdrVyJm/N04zfKfi3f2471mjx
	YkKKJl/R+Nc9n1HtJyFp7TsqfxLVZR3g2eBra86ukJ+64vJqR425LDPuCP3XTb4Dm/6A00Uap4c
	swImQPGP1dO/AtJE1Ihq3dNyekhZTMPNLJqxLHFe4j1v25flh
X-Google-Smtp-Source: AGHT+IHQkWukYzzeysse6GyDGTpm4Go8NkOdv1U0kWFvPW5EmkgZO13EEqDl/YlMIiN+HSC7RTkOxGEwEX9VG6reBiA=
X-Received: by 2002:a05:6512:3d15:b0:52c:850b:cfc6 with SMTP id
 2adb3069b0e04-52edf01caf1mr1503628e87.38.1721131574187; Tue, 16 Jul 2024
 05:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-0-67b3755edf6a@linaro.org>
 <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-2-67b3755edf6a@linaro.org>
In-Reply-To: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-2-67b3755edf6a@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Jul 2024 14:06:02 +0200
Message-ID: <CAMRc=McjheYOKzp7fjqk8HXWMza2EsZkerkXCBV6d=PFgVbEPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550-qrd: use the PMU to power up bluetooth
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 11:45=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Change the HW model in sm8550-qrd.dts to a one closer to reality - where
> the WLAN and Bluetooth modules of the WCN7850 are powered by the PMU
> inside the package.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-qrd.dts
> index 774bdfcffec3..6052dd922ec5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -219,13 +219,10 @@ wcn7850-pmu {
>                 compatible =3D "qcom,wcn7850-pmu";
>
>                 pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&wlan_en>, <&pmk8550_sleep_clk>;
> +               pinctrl-0 =3D <&wlan_en>, <&bt_default>, <&pmk8550_sleep_=
clk>;
>
>                 wlan-enable-gpios =3D <&tlmm 80 GPIO_ACTIVE_HIGH>;
> -               /*
> -                * TODO Add bt-enable-gpios once the Bluetooth driver is
> -                * converted to using the power sequencer.
> -                */
> +               bt-enable-gpios =3D <&tlmm 81 GPIO_ACTIVE_HIGH>;
>
>                 vdd-supply =3D <&vreg_s5g_0p85>;
>                 vddio-supply =3D <&vreg_l15b_1p8>;
> @@ -1175,20 +1172,15 @@ &uart14 {
>         bluetooth {
>                 compatible =3D "qcom,wcn7850-bt";
>
> -               vddio-supply =3D <&vreg_l15b_1p8>;
> -               vddaon-supply =3D <&vreg_s4e_0p95>;
> -               vdddig-supply =3D <&vreg_s4e_0p95>;
> -               vddrfa0p8-supply =3D <&vreg_s4e_0p95>;
> -               vddrfa1p2-supply =3D <&vreg_s4g_1p25>;
> -               vddrfa1p9-supply =3D <&vreg_s6g_1p86>;
> +               vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> +               vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> +               vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> +               vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> +               vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> +               vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> +               vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
>
>                 max-speed =3D <3200000>;
> -
> -               enable-gpios =3D <&tlmm 81 GPIO_ACTIVE_HIGH>;
> -               swctrl-gpios =3D <&tlmm 82 GPIO_ACTIVE_HIGH>;
> -
> -               pinctrl-0 =3D <&bt_default>;
> -               pinctrl-names =3D "default";
>         };
>  };
>
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

