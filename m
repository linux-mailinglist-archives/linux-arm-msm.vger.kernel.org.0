Return-Path: <linux-arm-msm+bounces-7087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC282B9FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 04:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E521C2382A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 03:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BDE1A73C;
	Fri, 12 Jan 2024 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4joe22e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0541A737
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 03:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f2aab1c0c5so55313867b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 19:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705030608; x=1705635408; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GEYe0U4gORZBXN1j3b/LGEmE8U+x0Ew9Qh5xXurgWGw=;
        b=Y4joe22eo1SrfigjCJx8/zwIDfIOhVhcoK27HnXQBLg9lQRsDiyHoCM7w7j+RwoFdH
         Z+v8KpEH4EMN6Z2oj62H7JqYldHyjUepOmJU691AZWpP48VKtk6R3l8NWylqoHt0k0vm
         r02GAewzm0NXksiORO/2tR7iu3Qh5UkF5zLLyJ0BmDTOF8nIPOm2zoAnBjIyKcGPFxwH
         BMXclz4mefJ7sE7MnwXenleI4NiXVBhOiYP4AiFsJI8GFSGgVH5rMBSol4glEqnnpdEq
         /gMsQ6FxBYhUWYcx/x1HyRGPDi0Nnmln9ltMlk5T0SGTyUQyX3ziqiZewlDvTo7uQp45
         L7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705030608; x=1705635408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEYe0U4gORZBXN1j3b/LGEmE8U+x0Ew9Qh5xXurgWGw=;
        b=DuwJWlfEpgsn3xgPOpRQTftHtwREqsL1VolkGPC9hyfiboh+BUx4wRGC7F2RuP8uEX
         Ebv6I3pNsaGMlsC+7zwqHxlLuFxCCBtX45ZfHgiC9mD5zR4s8mtuzDuEZjPnat0fLLv0
         V2ozeac/112Mc1ThMazL/DZtrpjReWDt3O7hDvE99bKJYMo7b1FNNRz//PX2Ph7Bsoju
         sk47pQfSxTUkAW6Wvcx3Yg6BZAoAJHaX1P3ZAy1Lq7wAfvVF64Nnf7ceV/MbcGHpq0zO
         z9VG5pwKkyQAy5u3mxzStJpdyUahE0hYAnGM9SQFeUdUuw2fDe6y9hfvdI/rRFIcS2Rw
         kEUg==
X-Gm-Message-State: AOJu0YzY2eMmL6HI3crAcbqyE0A4x4lhtcm15sWhxhIys4/F0M2xezMu
	AahxuHA9UDHSv6TgjaVio+M8H+su/3VxjkEoQkmply6EN9O8wQ==
X-Google-Smtp-Source: AGHT+IFWS7RDvOXQIhqh60aLsH3T1/KMPFvHobCssgGPky7B5SPWl831YOqQfs6r6SRgYCi9tMwT87VGR+S3cDUc3/Y=
X-Received: by 2002:a81:b610:0:b0:5e5:3342:c600 with SMTP id
 u16-20020a81b610000000b005e53342c600mr1050213ywh.9.1705030607689; Thu, 11 Jan
 2024 19:36:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112-lpg-v4-1-c4004026686b@quicinc.com>
In-Reply-To: <20240112-lpg-v4-1-c4004026686b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Jan 2024 05:36:37 +0200
Message-ID: <CAA8EJppdjVRpzrdqm4VOZwUO+khjTdRbY6jN2E2VGmCKSd8inA@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-idp: Add definition for
 three LEDs.
To: quic_huliu@quicinc.com
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jan 2024 at 05:07, Hui Liu via B4 Relay
<devnull+quic_huliu.quicinc.com@kernel.org> wrote:
>
> From: Hui Liu <quic_huliu@quicinc.com>
>
> Add definition for three LEDs to make sure they can
> be enabled base on QCOM LPG LED driver.
>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v4:
> - Removed "label" definition and added "function" definition.

You have removed "label", but you didn't add "function".

BTW: the commit subject is still wrong. Compare "qmp6490-idp" vs "qcs6490-idp"

> - Link to v3: https://lore.kernel.org/r/20231215-lpg-v3-1-4e2db0c6df5f@quicinc.com
>
> Changes in v3:
> - Rephrased commit text and updated the nodes to qcm6490-idp board file.
> - Link to v2: https://lore.kernel.org/all/20231110-qcom_leds-v2-1-3cad1fbbc65a@quicinc.com/
>
> Changes in v2:
> - Rephrased commit text and updated the nodes to board file.
> - Link to v1: https://lore.kernel.org/r/20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 37c91fdf3ab9..8268fad505e7 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -5,6 +5,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7280.dtsi"
>  #include "pm7325.dtsi"
> @@ -414,6 +415,28 @@ vreg_bob_3p296: bob {
>         };
>  };
>
> +&pm8350c_pwm {
> +       function = LED_FUNCTION_STATUS;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       led@1 {
> +               reg = <1>;
> +               color = <LED_COLOR_ID_RED>;
> +       };
> +
> +       led@2 {
> +               reg = <2>;
> +               color = <LED_COLOR_ID_GREEN>;
> +       };
> +
> +       led@3 {
> +               reg = <3>;
> +               color = <LED_COLOR_ID_BLUE>;
> +       };
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
>
> ---
> base-commit: 17cb8a20bde66a520a2ca7aad1063e1ce7382240
> change-id: 20231215-lpg-4aadd374811a
>
> Best regards,
> --
> Hui Liu <quic_huliu@quicinc.com>
>
>


-- 
With best wishes
Dmitry

