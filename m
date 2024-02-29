Return-Path: <linux-arm-msm+bounces-12927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47D86BE31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 02:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B691C20F7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 01:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5502557F;
	Thu, 29 Feb 2024 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buonsf7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA2336123
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709169675; cv=none; b=GUrqb0peKf78CHg70ebRq1GDn6AN2AwKcBw0s6h056kbB68lfRlGhUzhy8LZwO3OEyVOBBJKTPZxiW1gQc2L7bsXcMzHJHZgVxQ+EAxqmTGE+y93fixd/UY1R9aA+gaRRbp/1u5EZWjTtlslYaG4HIoY1ylq8wtUx8e8xfKk3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709169675; c=relaxed/simple;
	bh=cEjYY9kFb7uzbm5TaEqlwralx1PFbTgPhxEn94bcWUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pY1jB9HYnBzDsIhBQOIeXsvgWUo9X2GNhHzF0Iw6pqkwqUauWehPV5B1Hut/hWnccuXHPLPpsMefm/lDCp5ytxm/DFWOHUQiC9q4SBSshO9+wR8x7mbSL4HhPOcmB/UrcFAME4laSSEuerk6qxtNCvUi/a1MnJnBx8Z2L1t3Aq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buonsf7v; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607cd210962so4045467b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709169673; x=1709774473; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8pWxbY8bTdABWL4CghYjnRxjnKy4WA9CLN4FaXielgY=;
        b=buonsf7v6bEg7h9To5xqL6Wl2jqeg6sWzd3f8qc9wc3tH4jAn9KgbZb/ZJpw7GvqVV
         4rC9edN24m1wEqL9HPGNoeMJ3iSweJwDhipQWoOV9dfK4gmwVoZ8hwPn9WrwnC3iPLwx
         LXhX1mm4kiDb5R9d9ccWFSlEl0nXweyBUsZCnbiqROGgY5/N2lRPDl9uWK8n0XzCSMYS
         BCJNauGJ9YfdPuxG9AhzM6ZjVTj8N4RgittlCBSwFsjcvjRhGdDt2W1kdrO126rt4FPE
         b6yir9MKjL9KcAcydw2ojys4sOBrCR/jvytdfDL+ROKbk+g7Jn0yPttpBNCSJ4s2Virs
         EDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709169673; x=1709774473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pWxbY8bTdABWL4CghYjnRxjnKy4WA9CLN4FaXielgY=;
        b=WUPgrzXp8BBPAwMRUVjkGIsATVwSCUqIi4rTrfWOQh3LgAoOXSuSkM6D8RWQHTO0XD
         73dvJ3WBa4+vw66mAdwWFvuASChdZx65PTpT49W2UEremO/bqHLjUGAbRu1jCrc+iN0T
         lHu2h+Tmg6FNVBL7cqM890Rs8InanwmKi6kOKooym/G2vG3lsG6uJtL/T1QZzhg3q2Vk
         21xqFiw4xBQ35V3yhp7AQM3eBUhnxnJRZVnlqXTgHMlU9wnWs0n5kBZAflwVUrBtUifJ
         APGVLLEVz2Vs+kHl/SUjSnQFP6aoMV32sXDE4mu7AEgkR/Qck8f+0DRS4JTBNpRoQAWO
         x5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUszJls+4PVqkzzWcLdkkEPdr7Ti+RKFfMkhrgr9jOTBEK3tv6ialfAxisQ3GqBgpBtjQWUa1U1xX0RLo69OYZDamlhKF0+tF3yVJtYeA==
X-Gm-Message-State: AOJu0YwtJQJORh1Vlmq1VfymWUeDxyZ8DqfWFvA6sECoxy1cZoS/uoaI
	19sPeLSgWP8uosnubsg2mCpJ5CfZm2xkir+jBPjT9mD1K9mnyfp0PUNyG7B5Eh/HOV5s7sYBGpE
	S7e4cI1WfRqdh6xKP7EciJVPL5sxi0AHVXtkU8g==
X-Google-Smtp-Source: AGHT+IHOpAZJPyGmQMjmMhQkQsXaBQmwz48/fjNR7YidqlvDqX1bph2DvMHP8sMPv0l6YYgtKS0uBk4CNLftjmfqwAI=
X-Received: by 2002:a25:9f07:0:b0:dc2:48af:bf17 with SMTP id
 n7-20020a259f07000000b00dc248afbf17mr940987ybq.62.1709169672236; Wed, 28 Feb
 2024 17:21:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-gpio-keys-v2-1-3beb60225abe@quicinc.com>
In-Reply-To: <20240228-gpio-keys-v2-1-3beb60225abe@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Feb 2024 03:21:00 +0200
Message-ID: <CAA8EJppHUYZ46Bz48HzY-D9brBRj+TEw_-6j_VUDyMZPxwf8tQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] arm64: dts: qcom: qcm6490-idp: enable pwrkey
 and volume-up/down function
To: quic_huliu@quicinc.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Feb 2024 at 11:57, Hui Liu via B4 Relay
<devnull+quic_huliu.quicinc.com@kernel.org> wrote:
>
> From: Hui Liu <quic_huliu@quicinc.com>
>
> Add configurations to enable pwrkey, volume-up and volume-down function.

Please take a look at how similar patches describe the changes. E.g.
commit bb47bfbd5aa8 ("arm64: dts: qcom: sm8550-qrd: enable PMIC Volume
and Power buttons")



>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v2:
> - Update the commit description.
> - Link to v1: https://lore.kernel.org/r/20240206-gpio-keys-v1-1-7683799daf8d@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 43 ++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index acf145d1d97c..4199ebf667af 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -9,6 +9,7 @@
>  #define PM7250B_SID 8
>  #define PM7250B_SID1 9
>
> +#include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7280.dtsi"
> @@ -39,6 +40,24 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +               label = "gpio-keys";
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&key_vol_up_default>;
> +
> +               key-volume-up {
> +                       label = "volume_up";
> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +                       linux,input-type = <1>;
> +                       linux,code = <KEY_VOLUMEUP>;
> +                       wakeup-source;
> +                       debounce-interval = <15>;
> +                       linux,can-disable;
> +               };
> +       };
> +
>         reserved-memory {
>                 xbl_mem: xbl@80700000 {
>                         reg = <0x0 0x80700000 0x0 0x100000>;
> @@ -421,6 +440,17 @@ vreg_bob_3p296: bob {
>         };
>  };
>
> +&pm7325_gpios {
> +       key_vol_up_default: key-vol-up-state {
> +               pins = "gpio6";
> +               function = "normal";
> +               input-enable;
> +               bias-pull-up;
> +               power-source = <0>;
> +               qcom,drive-strength = <3>;

Why is this property required? Anyway, it should use the defined name
rather than just numeric value.

> +       };
> +};
> +
>  &pm8350c_pwm {
>         status = "okay";
>
> @@ -448,6 +478,19 @@ led@3 {
>         };
>  };
>
> +&pmk8350_pon {
> +       status = "okay";
> +};
> +
> +&pon_pwrkey {
> +       status = "okay";
> +};
> +
> +&pon_resin {
> +       linux,code = <KEY_VOLUMEDOWN>;
> +       status = "okay";
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
>
> ---
> base-commit: 23e11d0318521e8693459b0e4d23aec614b3b68b
> change-id: 20240206-gpio-keys-138bbd850298
>
> Best regards,
> --
> Hui Liu <quic_huliu@quicinc.com>
>
>


-- 
With best wishes
Dmitry

