Return-Path: <linux-arm-msm+bounces-9943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD184B529
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 13:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 211FDB26605
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 12:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C17130AE5;
	Tue,  6 Feb 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcEM1Okx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F452130AFB
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221604; cv=none; b=pxtaxkiP5gl8lxQi9J5t0OZd2Jehz90rbBey7EPl9XM/RbPSKUdidzFNkOBg336/kSQG5oFAVzGkexWm/h0pSPoIUM4K0AfDy60dgvUAiGFrOH0dTiF3bDCjl+MGTfaMYDm8YiJQSNMphegcgjc8sHYWsyLgyGRA0NwagNAY9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221604; c=relaxed/simple;
	bh=kVSEa7MznoMUBu2AWAT4VY/U+2IhwRWGQSLHsHRj5j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2RBepNNqaEA9PNOJvdsA8pO5/Xa5N3E2v7RW2XEuP8YGgTO6ZiFQtay69q8PqzaVP9bSDkL1uN4gFQUbv+hIaHy+JsCqo2Auv4CJhoaFGsJfsTnKLtfLxYPiEvh8LMEVzcnDDLLg2jbbTL6dMl63zGST4/mHwSEy36bfU0MLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcEM1Okx; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60482a5a570so2233657b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707221601; x=1707826401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWZvQfOEZAi4zGBX85k2bSEpbWrY5pCWn77sPDjSgjg=;
        b=FcEM1OkxPXe7jUa0X5dbasdooGSII6UzdymDSIe28PEPzDGsQ5l02WRs8+fxYqG9Vu
         6hDaJHbo1DVBq7IUiw6pUdyymKdwe9qedV92hyfG8aWgwM+cBRVawMij2F+jSLjcCJP1
         B6ZtIWA5xQ65ktskodCWNNCUYTHFFfzlgGdBzXZOeYoGaSKHEF0PFs0n5KjmgFRahn4r
         tztgBAKTF7vDFqhjJYXceACoEFzQbHjW9rhmd5jZ11+9zqZX1y4dkHgyeZO17XhDcvKC
         PnHiixg8JsYR1CorAjYfUNff5wBV4Ab+dz7YMF5miZBRWE8x+q86qPe+t5YsDKkzUAyQ
         eV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221601; x=1707826401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWZvQfOEZAi4zGBX85k2bSEpbWrY5pCWn77sPDjSgjg=;
        b=Dpom5GH2Lnpt7a9MrEMI2A8F6hup0E1pKD39rt+T6Cu+xVdOt82gxkD5zsliGG6UrP
         Y4KM24GCcDv2oT2IE4wbYTX6vP0w3zg3EwOtQ2Mw9oSYe/w+nCGG4Az6lpSesggjoQFd
         h3DkTPRhibA5ceYVA6pq6XK9zklaUO4cO2nwdn1GsIgOlc9pYOBV8padff/BQHy7r5kG
         TKyMSJZP6Ng5uTvadNqNR1sI82nNkwDob2/BRSKj3q8zyipMlul/hKbCNXFWC7V/nEpm
         L9vyoSpILu3O7SyivFc4YOoNpDpta1WWIe1gVe2mULXtMvCCVuSgy31R0adUgXEqLXkC
         O2HA==
X-Gm-Message-State: AOJu0Yx1z6/q6W5qjmfrkIT6Y8Pph2ojFY/bO5885Yn6z3LGWNbvuAOW
	aeveQDU0FU8+keMqtCJu7WIewGOLEnXyP4UEdREazhPjGLjP6wvRIVwdNV9TheEVrwHjoXfFgoA
	IZ6uXaY/K4+I3g5jteWW6goHkUcNEZW+HWIy+OJfyWyQ7kYrZ
X-Google-Smtp-Source: AGHT+IGFOW5KDLRDOGLd3gPgq1+CCiRKnm3K7AZT9XmPnffzdQcYU7PYw5tLG/hItt7BLLAro0o55O1x+/N8tJPYRKw=
X-Received: by 2002:a81:7e14:0:b0:5ff:82fc:9686 with SMTP id
 o20-20020a817e14000000b005ff82fc9686mr1383428ywn.3.1707221601625; Tue, 06 Feb
 2024 04:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206114745.1388491-1-quic_kriskura@quicinc.com> <20240206114745.1388491-3-quic_kriskura@quicinc.com>
In-Reply-To: <20240206114745.1388491-3-quic_kriskura@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 14:13:10 +0200
Message-ID: <CAA8EJpoed-hu4hPXAcwQxmJAaNRwJ2y5q9qybWaPP8bdMnz_oA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8295p: Enable tertiary controller
 and its 4 USB ports
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 14:03, Krishna Kurapati <quic_kriskura@quicinc.com> wrote:
>
> Enable tertiary controller for SA8295P (based on SC8280XP).
> Add pinctrl support for usb ports to provide VBUS to connected peripherals.

These are not just pinctrl entries. They hide VBUS regulators. Please
implement them properly as corresponding vbus regulators.

>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 49 ++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index fd253942e5e5..6da444042f82 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>
>  #include "sa8540p.dtsi"
>  #include "sa8540p-pmics.dtsi"
> @@ -584,6 +585,16 @@ &usb_1_qmpphy {
>         status = "okay";
>  };
>
> +&usb_2 {
> +       pinctrl-0 = <&usb2_en>,
> +                   <&usb3_en>,
> +                   <&usb4_en>,
> +                   <&usb5_en>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
>  &usb_2_hsphy0 {
>         vdda-pll-supply = <&vreg_l5a>;
>         vdda18-supply = <&vreg_l7g>;
> @@ -636,6 +647,44 @@ &xo_board_clk {
>
>  /* PINCTRL */
>
> +&pmm8540c_gpios {
> +       usb2_en: usb2-en-state {
> +               pins = "gpio9";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> +               output-high;
> +               power-source = <0>;
> +       };
> +};
> +
> +&pmm8540e_gpios {
> +       usb3_en: usb3-en-state {
> +               pins = "gpio5";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> +               output-high;
> +               power-source = <0>;
> +       };
> +};
> +
> +&pmm8540g_gpios {
> +       usb4_en: usb4-en-state {
> +               pins = "gpio5";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> +               output-high;
> +               power-source = <0>;
> +       };
> +
> +       usb5_en: usb5-en-state {
> +               pins = "gpio9";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> +               output-high;
> +               power-source = <0>;
> +       };
> +};
> +
>  &tlmm {
>         pcie2a_default: pcie2a-default-state {
>                 clkreq-n-pins {
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

