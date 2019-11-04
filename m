Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C951FEEB55
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 22:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfKDVo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 16:44:29 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35595 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729577AbfKDVo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:44:29 -0500
Received: by mail-pg1-f194.google.com with SMTP id q22so4770522pgk.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 13:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=oDBr9/oFH4uj0TcWt5+hNxdLZNFzTGYbiWx7cDw1BXk=;
        b=KQcEZHNmmz0KcwFTyLZr214Hyq78kr87VR/k9odOVNnbzAJL+GLXRuxzL4jRfJ8fAb
         8NDz/wkG7qrmwBW89xK3lrqy7czNP39gNhn5TP44WRi2UhnE916/a8s/Uzu505IjIono
         NdyE0yEXI5SUoDpRq6j3bN9m4KTjeYxyJrmUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=oDBr9/oFH4uj0TcWt5+hNxdLZNFzTGYbiWx7cDw1BXk=;
        b=r/LKDpp4Hf5F7C9nx8PALTOlRLrdwc6/HL9JJyCkfZqgIqUBNv5yzy3XoKRIxfa2NL
         oOaUch4cN1jm6A1n4FaXgTnr1zgQQuujVPnFXfEt6YXn7Veg1DbNr530F8eB9nxBgp69
         mIOA1FNKt/pTyDJ9y5IyPdydrkmwWoxJGdqfnU9f94V6yHWvfmMEhjCATEay1cGjRMs/
         rjkuD+V7TXL6ai4QZt1IeKTxqRg2nhSRZPm67tPE8jrZRq1hxVQ9TNKpyg54Pbaka0iM
         acGlHkHxYeQylot/xa2AigoD/FlmMKKskN71OoVnMhCIBbw6R4ehrhGFGunuh8l1plR1
         mw2g==
X-Gm-Message-State: APjAAAXCTmxb9O049h8Zpn4jYluJRO++vGl55rxCSdCFpwUrYA5C6wJ0
        Y2rL4CY9fJ3nCmEohLkel62VCRjOjwNySQ==
X-Google-Smtp-Source: APXvYqxULdu2yok9osG2dgC/wKOKO0AYP4xnZcw5ULrVYfDMRd3mLMzhSqWhO9gPC7VRZ3QfMrhwrA==
X-Received: by 2002:a65:49c7:: with SMTP id t7mr5242177pgs.431.1572903868384;
        Mon, 04 Nov 2019 13:44:28 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w26sm27836645pfj.123.2019.11.04.13.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:44:27 -0800 (PST)
Message-ID: <5dc09bbb.1c69fb81.196e5.9770@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572610108-1363-2-git-send-email-rkambl@codeaurora.org>
References: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org> <1572610108-1363-2-git-send-email-rkambl@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org,
        sanm@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180:  Add device node support for TSENS in SC7180
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajeshwari <rkambl@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:44:27 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajeshwari (2019-11-01 05:08:28)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 07ea393..06ded1d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -449,6 +465,508 @@
>                 };
>         };
> =20
> +       thermal-zones {
> +               aoss-0-usr {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;

Can we get real polling delays instead of 0?

> +                       thermal-governor =3D "user_space";
> +                       thermal-sensors =3D <&tsens0 0>;
> +                       wake-capable-sensor;

What is this property?

> +                       trips {
> +                               active-config0 {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "passive";
> +                               };
> +                               reset-mon-cfg {
> +                                       temperature =3D <115000>;
> +                                       hysteresis =3D <5000>;
> +                                       type =3D "passive";
> +                               };
> +                       };
> +               };
> +
> +               cpu-0-0-usr {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-governor =3D "user_space";

What is this property?

