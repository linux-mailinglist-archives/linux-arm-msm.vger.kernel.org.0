Return-Path: <linux-arm-msm+bounces-10507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB0850432
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 12:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9E19B24B90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC8E3D3A8;
	Sat, 10 Feb 2024 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eEiymRx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF773D0CE
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564617; cv=none; b=pBsw7jJrP1fLQ/HDkK7OBQffNiy9rUNMRQCTLXeIQDmTRYvq2XkT26GKdxrvifo2mzIWRzoPaxh1/zNBeAryK8+7Q5EXxojrfoGrWI2WbEvbnnJ5p3I8yO2VgyPbdlHHjXw3ti60I8nTFsKrVRX1fozEpOjIIFCspEPi77Yo5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564617; c=relaxed/simple;
	bh=r6mXK5irgXYNwUXBuVJYyBaJOtQdkAx2B8SbD35wMVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n90bsGLpLV4hZrttpND2nW3v5dfDKLoHimX1aYvbcE+2tfmPDlH1eP/19GEzJXGfjJN/J5rznyDmmVsWxO9PW6fUu9yehEHUdX0Mm2x3nRxjSTXKrhDhrSy/lSk3x/CvMDqLX9dodBGkQ/wSKGnDvnPeNN8VG3rQNpws7YN7QaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eEiymRx3; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc746ddc43bso1875367276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707564614; x=1708169414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yfrY9Su7sNaNkmujlfv39yppTC8UzE/IjGvqkySYy7M=;
        b=eEiymRx3LFgJU9ddDSIWhSKFdLLpenAEx7hnova7BFXM+UTm4lGDxCbpTxUR1xIRUr
         HWEvk/QWw81c7n2tXQlihY7om5KWFGUqUlT+XfAyqVcx8ZouuUVzTqP0paA5XMAecWHp
         ZV33xFHMXXdOwooTEMaRYT+FLAsQHVIw5RyiDfMptJZff0BG5S1vdNkK7exPR7BqNp1S
         bVQ6yWHe5BQo3tFY/i6PKd76WlTKSew1lJpXjGmF+uXn3dT7RAf83FoadTIkixnfhQNq
         nLGtet1A/Ip2U5/FvukxQidbmDe5z+SyzcSrQuz+BcuZzWJ1tgicATsyeE38lUFlycab
         Wj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707564614; x=1708169414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfrY9Su7sNaNkmujlfv39yppTC8UzE/IjGvqkySYy7M=;
        b=kV9nk+pRyPm5M5Eg/mi8/3NsGHSmCEDUpox442vJ5LD7R5GpK7Frf5tgBjIjmuJWy+
         bDjqGWSOgAQgqSsZJaYvTHhSeZFWesvpTTftAnNWFMDfdnt/ye8LKd9w8O11f4407xiV
         j55y6dvnc+720OH24WMnDxil0KHfh6aRmrq/SgzZPdxJhN6mga0uivFfqLMT9IQ0T7Jx
         kwuKL2o1BAii0lmhPv1VbrC6ofycguNgT8+gr0odQSEXtnUNsO4+ccBH6jl3roltxbsR
         8oElMhnxVq2LaE/JUQgOVIab+06XjIn2q4CjGYljX5KhMRhlj05YkAca0Rf4c3XTLOn/
         Y8yA==
X-Forwarded-Encrypted: i=1; AJvYcCUM2U2+O+rKcRDDkDBqDiGes01YWcSXwBgYHfxu2u8OMoe+zMlDYZ1S59l2GxLcKtJ61cjkzR8YuYThUcQsPVJKgvTJuF8d+TWe0TKmnw==
X-Gm-Message-State: AOJu0Yya5ynjW20jUtMvZT8vwcHl4qOJ/AFx1XZc3FVHody3bAglkD3M
	roh1+yDACEEefUvgCIRrYWdbTE/OfPK1Gupr/vjoo8jWZbPwu4OIuUxRGAV8B4rF1WSNeaB1k7P
	HwiGoDoWO2u4NVVssKjbAZKE67dGe4WUi6TL+ZQ==
X-Google-Smtp-Source: AGHT+IEt7Kj+/hZ+wzmZoPbmULWhhsnEm62dhB8EKpEyKJk/XCww+qHhpHGoDPo0BmN3s0+4ysCzQ+Am+6SRT3YGSYI=
X-Received: by 2002:a25:850e:0:b0:dc6:9c4f:9e79 with SMTP id
 w14-20020a25850e000000b00dc69c4f9e79mr1345468ybk.38.1707564614467; Sat, 10
 Feb 2024 03:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206114745.1388491-1-quic_kriskura@quicinc.com>
 <20240206114745.1388491-4-quic_kriskura@quicinc.com> <23824242-1b37-4544-ae9a-0a5a0582580e@linaro.org>
 <CAA8EJpqbXvKMQktGsxMFJnR+fXoOz8hFmm+E3ROPTjjiD0QLvg@mail.gmail.com>
 <6q2ocvrujbli42rjddflyol74xianr7j47jwcgdnnmwjanv25d@uw2da7zulqqd>
 <CAA8EJpr6k8c5C54S9xxQgZvd9NYFoxi5qQrOTz2AMrp0xeZZpw@mail.gmail.com>
 <baw3wxbdvzpkqqb6a7iut2wpt6jgzyqii5uyfkzptzt4ryjvao@4tpee6nqup5w> <b5c25274-9af0-4b3e-ade7-9a55d3cecd29@quicinc.com>
In-Reply-To: <b5c25274-9af0-4b3e-ade7-9a55d3cecd29@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:30:03 +0200
Message-ID: <CAA8EJpqYBQnQRhRLqpOv5Ebdg_8gx0iTG=jWxkU7jy2pz5y8PA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8540-ride: Enable first port of
 tertiary usb controller
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, neil.armstrong@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 12:44, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
> > Krishna, when you make v2 can you update the wording about the USB 2.0
> > mux? Maybe something like "which by default on boot is selected to mux
> > to the external port on the board (with the other option being a test
> > point)." instead of the wording I originally had? That way the
> > information Dmitry requested here is easily accessible in the future.
> >
> >>
> >>>
>
> [...]
>
> >>>>>>    };
> >>>>>
> >>>>> Isn't gpio-hog the preferred way to describe that ?
> >>>>
> >>>> That depends. As this pinctrl describes board configuration, I'd agree
> >>>> with Neil.
> >>>
> >>> I unfortunately don't have the experience with gpio-hog to weigh in
> >>> here, but wouldn't be opposed to Krishna switching it if that's what's
> >>> recommended for this type of thing.
> >>
> >> Quoting gpio.txt:
> >>
> >> The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> >> providing automatic GPIO request and configuration as part of the
> >> gpio-controller's driver probe function.
> >>
> >> See sdm845-pinctrl.yaml for an example of the gpio-hog node.
> >
> > Thanks, that seems like the way to go. Krishna please take note of this
> > for v2!
> >
>
> Hi Andrew,
>
>   Can you help test the following patch. It is just an add-on to your
> original one. I don't have a SA8540P Ride at the moment and getting one
> might take time. Incase you can confirm this patch is working. I can
> push v2 of this series.
>
>
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
> b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
> index ed344deaf8b9..aa42ac5a3197 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
> @@ -36,6 +36,10 @@ patternProperties:
>               $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
>           additionalProperties: false
>
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
>   $defs:
>     qcom-sc8280xp-tlmm-state:
>       type: object
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index b04f72ec097c..aa0cec0b4cc2 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -503,6 +503,18 @@ &usb_2_qmpphy0 {
>          status = "okay";
>   };
>
> +&usb_2 {
> +       pinctrl-0 = <&usb2_en_state>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +       phy-names = "usb2-port0", "usb3-port0";
> +       phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> +};
> +
>   &xo_board_clk {
>          clock-frequency = <38400000>;
>   };
> @@ -655,4 +667,19 @@ wake-pins {
>                          bias-pull-up;
>                  };
>          };
> +
> +       usb2-en-hog {
> +               gpio-hog;
> +               gpios = <24 GPIO_ACTIVE_LOW>;
> +               output-low;
> +       };
> +
> +       usb2_en_state: usb2-en-state {

If you are using gpio-hog, you don't need this state. The pinctrl /
gpio core will use the hog instead.

> +               /* TS3USB221A USB2.0 mux select */
> +               pins = "gpio24";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               bias-disable;
> +               output-low;
> +       };
>
>
> Regards,
> Krishna,



-- 
With best wishes
Dmitry

