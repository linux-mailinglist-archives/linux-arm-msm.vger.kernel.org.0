Return-Path: <linux-arm-msm+bounces-6997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D786282A68C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 04:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55EC6B22EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 03:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DCCECD;
	Thu, 11 Jan 2024 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YGRD47wE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127D3EC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbeff495c16so3492463276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704944297; x=1705549097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pAKdqWiRt7Jt8ttzovOLnTm2MmS1cXyP0ylsS3FmwGc=;
        b=YGRD47wEjY7pYsUEox5Yh+/B60QM2XFJD+T3COZ5FUGGoMC0IfSvCOYZObj73/6UMR
         DEEKtP3Lp/mfRCwDH+iV8CgH+nLK0AX0RyK/JzKh5m1YeEoALJGZTaZ2Uk32eZuwJIjI
         5T/Z4FIciwQ5pJLe4/9LISQojjAsDdKD8XLeOGJja+m3ZZ5AftiOSASp9It51PwY4ZdN
         cGXDtYTuuj+ZVHQBlrQhP75zGJKGyJOxdT9GEZtIjIz+kfQX0Dpmfenx2znCUmeaOxi+
         XC9dfpDN03l+kGFp2wpFgrMo75EXd/oUkVstBhPtQTwadHVuHJHXLIqIRmEHxh+SmKhL
         ZYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704944297; x=1705549097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAKdqWiRt7Jt8ttzovOLnTm2MmS1cXyP0ylsS3FmwGc=;
        b=PEhRCQ2U7Ly/dJtbm4/LpnrZTqURyd0IiMZbYa8NNtqWXR8UeKXfZLcKRgk+u5UJcU
         mmiog3HQN3ABvS8HrGjWmhq3Iwo78TAKkoef/NyyILyHcaj/WB5S2sPEItV+kxg1Ost4
         rM9aC/05DkhOo7fw5aIRXyRpKojADiAdwgy5SmCzvlekswgwTmYqjYFIxrAuny6UzJgl
         XNgEg1Tgzyhr7nNEn0XSBscH5T4lx3K/WnaZVBC7ThjpZKXYhqrVBq7LdQx4a97NfUw8
         ce564jGR9LryFmLwa/WvWsjtU45d9G3rMisqeRNqI3nwIBwSxqSXpROhnJnG9GAmkVq8
         DYKg==
X-Gm-Message-State: AOJu0YwSBdNyF2RNEvBAttcTw7Oulq6xAvhs3E2hky7ggaJcEN5ppqqf
	oFRkrpQGDtTB2cSXhhpOonkl6JH8Kw/5y/y3UQD+CqKFpwwzsw==
X-Google-Smtp-Source: AGHT+IFUPrQKhx3J+D6Zwfbk/UcEPw4iBwmtCyH6Ehsmm5XNg5mxGl9snqDtKuIKAJQbpgFkfIkXaDarbOEB6KttQ4Q=
X-Received: by 2002:a25:ea4b:0:b0:dbd:bf0d:d97f with SMTP id
 o11-20020a25ea4b000000b00dbdbf0dd97fmr493340ybe.126.1704944296914; Wed, 10
 Jan 2024 19:38:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111-lpg-v3-1-811c9e82dae4@quicinc.com>
In-Reply-To: <20240111-lpg-v3-1-811c9e82dae4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 05:38:05 +0200
Message-ID: <CAA8EJpq-hYrM-JzJ5-0iSfH3gYYJawsDWDj51N1H7_fCJQvaCA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] arm64: dts: qcom: qcs6490-idp: Add definition
 for three LEDs.
To: quic_huliu@quicinc.com
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jan 2024 at 04:54, Hui Liu via B4 Relay
<devnull+quic_huliu.quicinc.com@kernel.org> wrote:
>
> From: Hui Liu <quic_huliu@quicinc.com>
>
> Add definition for three LEDs to make sure they can
> be enabled base on QCOM LPG LED driver.
>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v3:
> - Rephrased commit text and updated the nodes to qcm6490-idp board file.

The commit message is the same as in v2.

Commit subject mentions non-existing board, "qcs6490-idp"

> - Link to v2: https://lore.kernel.org/all/20231110-qcom_leds-v2-1-3cad1fbbc65a@quicinc.com/
>
> Changes in v2:
> - Rephrased commit text and updated the nodes to board file.
> - Link to v1: https://lore.kernel.org/r/20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 37c91fdf3ab9..f801144a1556 100644
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
> @@ -414,6 +415,30 @@ vreg_bob_3p296: bob {
>         };
>  };
>
> +&pm8350c_pwm {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       led@1 {
> +               reg = <1>;
> +               color = <LED_COLOR_ID_RED>;
> +               label = "red";

Is there any reason why Krzysztof's review for v2 was ignored? Let me
repeat it here: "Drop labels. You already have color, so you miss
function."


> +       };
> +
> +       led@2 {
> +               reg = <2>;
> +               color = <LED_COLOR_ID_GREEN>;
> +               label = "green";
> +       };
> +
> +       led@3 {
> +               reg = <3>;
> +               color = <LED_COLOR_ID_BLUE>;
> +               label = "blue";
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

