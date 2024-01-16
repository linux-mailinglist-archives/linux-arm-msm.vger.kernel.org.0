Return-Path: <linux-arm-msm+bounces-7362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39B82EF3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 13:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40195B20ADA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3153B1BC31;
	Tue, 16 Jan 2024 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpiPsA9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46111BC28
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5fc2e997804so32594317b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 04:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705409841; x=1706014641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+4hnlJHLnTrXO1n7Q7aJ8E+x3xN9P0SV1tDELdfuOHo=;
        b=UpiPsA9kVNfOKEI9Hx8Q6rHR6LqCzIe3YcvQ1GQ79MwciUwRs4nthuAekM9uUMfKgo
         fgD4vROEI+przSYGnPrnsrt3EIZSlIahDdlNV9xilLaVMWiPpVE1Mq2Jyy+4IJ9BN3Zc
         sjQ2aMa8bH+A2tuJ5pcWlla1DAQzeDa/lkFHjjTu6NjcD5U27Zw4DTX65Us8XF1YG2CW
         1TxgyUh0mHS2TQBlyhtFsYfdRX4R8qPqY6DraCQyzc8CRqJw2Hq9K2wumhVkuVGHjH8m
         cJNV/qMMxI1kAWNi9vv/4elh5HGHVbrHTVjxxUFPJUsHmcAt3Ncr46eSHZkJiKnusMP4
         Alig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705409841; x=1706014641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4hnlJHLnTrXO1n7Q7aJ8E+x3xN9P0SV1tDELdfuOHo=;
        b=BA28pnKwYTu0AhhKmABaExRU1AgpPQ41txCYHL0NLhIm73eC0DfyGYSxQoSOzJks8r
         TN3FIvYCpPzzAogwhaaEvwUqN8cMawburJu2zTNK7jo7qKmtFS+l6c1b3LG/ESO/uYGS
         E9BA9C/0klIyBZgbWhxK4yBdEmt7ChSy/t7XDkHtt/5sdIUaHObjpFs7z57awz0TCNgl
         KQFkrvuQ2pwiTCNSkBePj4XzJ/UWW9xYpjwghA6VtwXCqxubxfUg1MBt05fT+RUYISc3
         HxeILMX9WYCQ4C0VmohwrBlA/fh+uSDDiVez5engz08lUBbJg2TjHHM8ywZRdR+1A8OE
         fPlQ==
X-Gm-Message-State: AOJu0YyF157CwuFwPijqWXEZdicqMUWhXPgCR4fwLl30g9cVW9kEH6mP
	5Quk7bQp8dVE1KrnJnaxWnZRDzhNaw+ICuG9PNQaxOWJa1JDjg==
X-Google-Smtp-Source: AGHT+IFJSpPzQCta/xGi9FB3prrFmLoj2lL23dFFzlosLYEivbq6n6WPE5d4IiKLOD9PuPVR/9iYeVJfZzelyq4KQjg=
X-Received: by 2002:a05:690c:b83:b0:5e7:2cde:276f with SMTP id
 ck3-20020a05690c0b8300b005e72cde276fmr4993915ywb.71.1705409840902; Tue, 16
 Jan 2024 04:57:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116094935.9988-1-quic_riteshk@quicinc.com>
 <20240116094935.9988-3-quic_riteshk@quicinc.com> <20a8efd1-e243-434e-8f75-aa786ac8014f@linaro.org>
In-Reply-To: <20a8efd1-e243-434e-8f75-aa786ac8014f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 14:57:10 +0200
Message-ID: <CAA8EJpqQVuS+yqXQ2y5sNQrRVg7tcQAJ3ywsEjg+O=7TkUZWLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-idp: add display and panel
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, andersson@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jan 2024 at 14:06, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1/16/24 10:49, Ritesh Kumar wrote:
> > Enable Display Subsystem with Novatek NT36672E Panel
> > on qcm6490 idp platform.
> >
> > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> > ---
> >   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 100 +++++++++++++++++++++++
> >   1 file changed, 100 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > index 2a6e4907c5ee..efa5252130a1 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > @@ -9,6 +9,7 @@
> >   #define PM7250B_SID 8
> >   #define PM7250B_SID1 9
> >
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >   #include "sc7280.dtsi"
> >   #include "pm7250b.dtsi"
> > @@ -38,6 +39,25 @@
> >               stdout-path = "serial0:115200n8";
> >       };
> >
> > +     lcd_disp_bias: lcd-disp-bias-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "lcd_disp_bias";
> > +             regulator-min-microvolt = <5500000>;
> > +             regulator-max-microvolt = <5500000>;
> > +             gpio = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&lcd_disp_bias_en>;
>
> property-n
> property-names
>
> all throughout the patch
>
> > +&gpu {
> > +     status = "disabled";
> > +};
>
> Hm.. generally we disable the GPU in the SoC DT, but that doesn't
> seem to have happened here..
>
> Thinking about it more, is disabling it here necessary? Does it
> not fail gracefully?

Missed this.

I'd say, I don't see a reason to disable it at all. The GPU should be
working on sc7280 / qcm4290.



-- 
With best wishes
Dmitry

