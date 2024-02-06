Return-Path: <linux-arm-msm+bounces-9900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C256784AE3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 06:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75F5A2864F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 05:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC258004B;
	Tue,  6 Feb 2024 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4RtbnBf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D57F470
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707199071; cv=none; b=ZlFXl3ngark3ZgTF73fpwrCtM7elAxrpZJ0Pf/EkPFtBXjdx7q5iFfmoJa/480YJeEUE6RVL9sJm3HAUGgrAXuzyj5cNWtpSQThCidRFrQv30nELIov0O7LHxgG8BG99XvKDVWT+3R39Dwx7ArB9ZF3tzY44mBJWo1pdQGCG3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707199071; c=relaxed/simple;
	bh=ysU08zj4Hg/RYgoGDggCvO60aVp5MmHmJq2MC6dL0VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=En4BrtMLmtEUdo1nBglVeAwjjptZqDJx5LTvGS+bbNojaz7bZlFTGZJaF/GA01yaatH7vXia60dexeetkrfEj+dnHoR8YCC4ZC9Pt+ZynGR/SS7E0WBJ2Bl/Bwn/OcypQy5M9V0Udn/AYvf6ktgqqryfUv6hdLKIJGge9wWVl5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h4RtbnBf; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-604713c4ee5so9747767b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 21:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707199068; x=1707803868; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmo8OZ+RD3WMbukSfHahLE4n7rr4rX9TbI2saroDAe0=;
        b=h4RtbnBf/uLQ1ZRD7HxSb6mBzYQu3mAkqU9cQTbgxzMPx/pGpAbAJYSTlYMXwRGXND
         JIPRf3jhDnfqca3+yu4CeADEF1IZ2ApOSWRR99KbVYWaWFfATFGggxQetXJfYxLBmfgW
         ssZbBrIP/oOb3fSy29goQlQ6m3NFaNzse0bylewfER9h1HoGs9B/WH15ZSDeY8Oh6rB0
         2E8o4byt0fIGH2B7mKq5B+mvWC1xgx8ebEbugI9bEWQo8YMsz2uZhS8HKegbn6VraONY
         4BFxibQvTmYgu/Kf0pCui1PROFwWEXXwGaiDTTjH1ZjSLP6ZHk22lrsH24mmcwWzTH+G
         PZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707199068; x=1707803868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wmo8OZ+RD3WMbukSfHahLE4n7rr4rX9TbI2saroDAe0=;
        b=jbt/5CUFfAx76V/YcGIZN60DAifxbidBket5YQnrWOFxEf7gdH4evjk4dKtV3aF2Z/
         jzlrGdkeDFj1YPpFaLjQWuYCipCDO1adM5Cxqn5lbVQAx5gGwoJsfLam157e2xPuiiJ8
         6j6kC4Ha6Ft1hDtzI8v5UDyP3PUY1kjXXY5fH0NPfnLPHL/frLN3L8vR4lKIPK9erRVp
         X7E5Nsr6f3PXnU5MpBlFyfi1M+FVGFwKrTR6EA0hwbqOlCheVhqQ01fLczTxnkzfORjJ
         IHm+/mYPJDCYDICdAwBGeTnTb4A1AnUqGE3iwjkZsyA57DGoyUqL2ySeDNRwP1aoLDc9
         UXmA==
X-Gm-Message-State: AOJu0YxeCb/rPK6Pspybr1DkkX8gxuyThJem7Z7aVryMZbRvK54HKSVp
	BUY3Yv8wBYNXLjXivwI0MQyXDT9fgKB60vojYVxuYdSSTzT5PR1dLXNsbytvzWQBW2pTnKzMnEr
	zfTwujiu74wzVd/hCKmbtm0G1piN0tleByQTesw==
X-Google-Smtp-Source: AGHT+IH+R9/XEh5MDFKwcKvN1122YGkm05bcyEuArFy7J3lbwWjm15zjwXjtYTmM97101cB17yqIknzWzpzCcwMYKxI=
X-Received: by 2002:a81:a882:0:b0:604:76c3:7b3c with SMTP id
 f124-20020a81a882000000b0060476c37b3cmr758325ywh.6.1707199068531; Mon, 05 Feb
 2024 21:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206-gpio-keys-v1-1-7683799daf8d@quicinc.com>
In-Reply-To: <20240206-gpio-keys-v1-1-7683799daf8d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 07:57:37 +0200
Message-ID: <CAA8EJpqo6p+S4JirhGybGsiG0X9Evdb3LEVgorsewEcRT8LMgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Add configurations for gpio-keys
To: quic_huliu@quicinc.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 04:21, Hui Liu via B4 Relay
<devnull+quic_huliu.quicinc.com@kernel.org> wrote:
>
> From: Hui Liu <quic_huliu@quicinc.com>
>
> Add configurations for gpio-keys to enable pon_key and pon_resin
> key.

Configuring gpio-keys is a requirement for enabling the pon_key and
pon_resin, so the commit message is incorrect.




>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
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

pinctrl-names should come after pinctrl-0

LGTM otherwise

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

