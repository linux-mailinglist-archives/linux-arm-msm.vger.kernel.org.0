Return-Path: <linux-arm-msm+bounces-9950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340AB84B641
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 14:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CCCC1F26DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CBE130AE1;
	Tue,  6 Feb 2024 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKomjMaa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C2130AE8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707225898; cv=none; b=pBIo7tMsSD9kNQuxA3S1NkVvPIs4KocxoTRRngwZWE3N4ba4CoGQo6BkMwCrWJBZCWrYQT8Jsk8n2Fj7R+Gw30l7zCn8jo/60Vroq3jFa+7r0j5uutT9bGijO+u1L+IT3pKq8cGT6yOo27cV8MUxG0lvGM3V7ovfAvig9A8hpHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707225898; c=relaxed/simple;
	bh=0ODBZ0bKH/+4Qy9gatNTHZmyTBY0YATZdj+RldTZHyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEd96K2x0WH5Pn4k47pY1Mmuca3gesGLKiBwVWsa2kDnBpHJ0bWHIgAfxy2keXdR/6zIP+o/6IpBXtMLO4Qta1AO8Z/hNSuPIkUcr2inGxfc7v1vv2N4eyEuoaZ0D1dpgjhQABWly07ot+VJo9RKS1hGtAGPL8VOs+woFrHBazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKomjMaa; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ffdf06e009so49450607b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 05:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707225896; x=1707830696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNYfeRHplSwy9onZWV3mvxR3r7VxC5IicrOwRsKxWIk=;
        b=OKomjMaaf+cX3n72ippMsSkhpG2sCFYgF+9V+cmevhmO4pVqJ5OljqpauSEr3Pnsos
         yw560KNo8pjtOQetVX87XNcHFn2iFDnOUS80CyK7jivlnTE+m07YutJH24EJvnytK9rv
         lZc/YKjy3FClmozo+GPWTTK4jIJ9xroNSjE4s9dr3UVELSDUMiVAhVdwHASxqVJOfZb1
         /yv6/qFdcSiXJfADA23N1Sw4nKsY+jv96gQsBxPK/sTMFK/lGGXOB3etUZrtptOsC2xa
         jnhQi7aFNBmti8JDU9k3BTkaTJyhWx0uP6KuCwrT5URbqQVt8B5Ga3cdC6ovxALugXNL
         tOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225896; x=1707830696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNYfeRHplSwy9onZWV3mvxR3r7VxC5IicrOwRsKxWIk=;
        b=FS3XDlRC/9V3ZC1BwekCdSKAnv5Ad+sQNHfiBUMYK8UseIfte/fdU2VdwbZ1bUJU7s
         gMZCha/MpI7WGZaCBh7XSNksY25i5tJMEfLFfDaJY4S4RB7077rc5wIhFk0rIz/YMU/0
         A9KgAUn+tIYF4zN+RGO8kquPFG5oqDe+1bX1sceNMIXv6wjJ1HjAiyZKEeVY5hoReOc+
         DHd66rgSy8mLzNI00ho3JNSETzb8run2WmOXNa1sqd0a9QF1jFi1reXpCifyBaDkan2/
         Q+xLmuAhyXU2plKlkCkafx63c5H1gXSBD38Z5wxpAoEQf2CKOmkrTQBWLAudqpDGq9bF
         bWEQ==
X-Gm-Message-State: AOJu0YzHa32/9WWZUmkp3MMATeqgBnoBrsQmUBkY3NFQDMENTjtgvcd6
	8kA1gGj9vH+GOCC1m0d3Kc7VWYdiEX0t/MhwrlgSb+Q9xMFlFvPG4hszkHmXIAjC1XMX8fUiKf8
	a6b4+B0Y9qGq1XcdN6BAVdsIi/iatxnkeD45Xvw==
X-Google-Smtp-Source: AGHT+IHdpCXRaHmDnwQ9pkUygZiBMY/U6bxr90P/Qd0dgUaOhK74+cKws4zPxWQ4ux9U2cXRyya7XLx56BkLEIzQP0o=
X-Received: by 2002:a81:ed0c:0:b0:5ff:6319:6b0e with SMTP id
 k12-20020a81ed0c000000b005ff63196b0emr1590646ywm.21.1707225896133; Tue, 06
 Feb 2024 05:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206114745.1388491-1-quic_kriskura@quicinc.com>
 <20240206114745.1388491-3-quic_kriskura@quicinc.com> <CAA8EJpoed-hu4hPXAcwQxmJAaNRwJ2y5q9qybWaPP8bdMnz_oA@mail.gmail.com>
 <0470a930-d629-4467-b619-58d3e76f59a7@quicinc.com>
In-Reply-To: <0470a930-d629-4467-b619-58d3e76f59a7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 15:24:45 +0200
Message-ID: <CAA8EJppJAdHXoVs_2VqQf=_Wk_LoEcNMY2H-Xzqu8KzeaN8i0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8295p: Enable tertiary controller
 and its 4 USB ports
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 14:28, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 2/6/2024 5:43 PM, Dmitry Baryshkov wrote:
> > On Tue, 6 Feb 2024 at 14:03, Krishna Kurapati <quic_kriskura@quicinc.com> wrote:
> >>
> >> Enable tertiary controller for SA8295P (based on SC8280XP).
> >> Add pinctrl support for usb ports to provide VBUS to connected peripherals.
> >
> > These are not just pinctrl entries. They hide VBUS regulators. Please
> > implement them properly as corresponding vbus regulators.
> >
>
> Hi Dmitry. Apologies, can you elaborate on your comment. I thought this
> implementation was fine as Konrad reviewed it in v13 [1]. I removed his
> RB tag as I made one change of dropping "_state" in labels.

My comment is pretty simple: if I'm not mistaken, your DT doesn't
reflect your hardware design.
You have actual VBUS regulators driven by these GPIO pins. Is this correct?
If so, you should describe them properly in the device tree rather
than describing them just as USB host's pinctrl state.

>
> [1]:
> https://lore.kernel.org/all/7141c2dd-9dcd-4186-ba83-829fe925e464@linaro.org/
>
> Regards,
> Krishna,
>
> >>
> >> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 49 ++++++++++++++++++++++++
> >>   1 file changed, 49 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> >> index fd253942e5e5..6da444042f82 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> >> @@ -9,6 +9,7 @@
> >>   #include <dt-bindings/gpio/gpio.h>
> >>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >>   #include <dt-bindings/spmi/spmi.h>
> >> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >>
> >>   #include "sa8540p.dtsi"
> >>   #include "sa8540p-pmics.dtsi"
> >> @@ -584,6 +585,16 @@ &usb_1_qmpphy {
> >>          status = "okay";
> >>   };
> >>
> >> +&usb_2 {
> >> +       pinctrl-0 = <&usb2_en>,
> >> +                   <&usb3_en>,
> >> +                   <&usb4_en>,
> >> +                   <&usb5_en>;
> >> +       pinctrl-names = "default";
> >> +
> >> +       status = "okay";
> >> +};
> >> +
> >>   &usb_2_hsphy0 {
> >>          vdda-pll-supply = <&vreg_l5a>;
> >>          vdda18-supply = <&vreg_l7g>;
> >> @@ -636,6 +647,44 @@ &xo_board_clk {
> >>
> >>   /* PINCTRL */
> >>
> >> +&pmm8540c_gpios {
> >> +       usb2_en: usb2-en-state {
> >> +               pins = "gpio9";
> >> +               function = "normal";
> >> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> >> +               output-high;
> >> +               power-source = <0>;
> >> +       };
> >> +};
> >> +
> >> +&pmm8540e_gpios {
> >> +       usb3_en: usb3-en-state {
> >> +               pins = "gpio5";
> >> +               function = "normal";
> >> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> >> +               output-high;
> >> +               power-source = <0>;
> >> +       };
> >> +};
> >> +
> >> +&pmm8540g_gpios {
> >> +       usb4_en: usb4-en-state {
> >> +               pins = "gpio5";
> >> +               function = "normal";
> >> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> >> +               output-high;
> >> +               power-source = <0>;
> >> +       };
> >> +
> >> +       usb5_en: usb5-en-state {
> >> +               pins = "gpio9";
> >> +               function = "normal";
> >> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
> >> +               output-high;
> >> +               power-source = <0>;
> >> +       };
> >> +};
> >> +
> >>   &tlmm {
> >>          pcie2a_default: pcie2a-default-state {
> >>                  clkreq-n-pins {
> >> --
> >> 2.34.1
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

