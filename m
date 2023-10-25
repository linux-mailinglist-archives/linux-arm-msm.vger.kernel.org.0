Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB377D662C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbjJYJEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbjJYJEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:04:00 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D2C186
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:03:58 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ce2ee17cb5so3369899a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698224637; x=1698829437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bwqtBumwvsSky/L+7g/MDCUKQ2coD9udsLw+AiD5Cb0=;
        b=XHbwfGLrVxK6+Ef396LR+e6Bug/QJSsc9Y/K0BZ5k26c5Cs8OGtJq68Tji+IoBm4Dr
         4lgc8E7Y4i0oN1rDkke9+WILPRApkbhSzEn/3tvHlzqchK4RP5x65ZOpAkKMZtipLXwc
         GcnolUSbUvhvAf5NfBQdPbN18FlSpCDROQ2xFbeINFQq/dhG6bD5gVpgAN4J9rOXIkE0
         SHsDxh7pZCVs+ApUoWUvTUjtdbJvENcqWAr2W31Ux9Un7mjtXk5iVgXAW17hGjqcbvqN
         d9t3LQ6F/aqVn/PMDhzXA26Gn1CRCIcbQPrlyjhItHv8VBTM+wVY36dv5xxsWrqld8Mq
         L+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698224637; x=1698829437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwqtBumwvsSky/L+7g/MDCUKQ2coD9udsLw+AiD5Cb0=;
        b=cmLtpbSApbGyIvNFQYV58Te0arAaQ/QeoMp1l6H1CLGkRMffgMAelz9Hh8no9847zo
         7+Le2Kmm1/d9OgKSBpwy77ZhBkulAN736IPzLdtf7YRMhuh5ADoMNRAMcTwDFYH+tnXA
         VpvoNoNu13D9qLBIsEdWCL/Jae3rUuQ2O2k6QLWj8sp0ZhcjVq3RM5Mz21h6McR8ZKjF
         7Tnvc80Gfc/kjYK4PJ8jdNhyVoFRdjRXougljdCnu/8utpeOmeTsQIo/AX6HIxMF/3Gi
         eXGOHmvEZl/wrtvlIqjfb1JA05yTYzHxLiXXBBjL6TNutOtfa/XZoHezFpCroe6XMkdr
         jLAA==
X-Gm-Message-State: AOJu0YzUKEs8ehufM/F47RdW+/byZguPG/5Ab3W3pVeexiZHuLQsTS3B
        FK8keeZRobdqI/tPfZWXJqWpDR5m/1CHiXzB+0EtCQ==
X-Google-Smtp-Source: AGHT+IEVIC1O7Uj9okmSZfyNhI8ZQ5frn4HpZXmUj1Ce0d/AdwYQELzFjyyUJdVf8niK+m8+rQ/HVR/xj6N1i7olT5U=
X-Received: by 2002:a05:6830:3499:b0:6ce:28e6:cf41 with SMTP id
 c25-20020a056830349900b006ce28e6cf41mr19967197otu.3.1698224637525; Wed, 25
 Oct 2023 02:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-dt-v1-0-a821712af62f@linaro.org> <20231025-topic-sm8650-upstream-dt-v1-3-a821712af62f@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-dt-v1-3-a821712af62f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 12:03:46 +0300
Message-ID: <CAA8EJprqeVr=28uDJ6u2_JgHFqzr4qB2DpdPvUc=Xf-q2g-TBg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/8] arm64: dts: qcom: pm8550ve: make PMK8550VE SID configurable
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 11:00, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The pm8550ve can be found with a different SID on SM8650 platforms,
> make it configurable.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8550ve.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
> index c47646a467be..fbd8a386cef2 100644
> --- a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
> @@ -6,6 +6,11 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
>
> +/* (Sadly) this PMIC can be configured to be at different SIDs */
> +#ifndef PMK8550VE_SID
> +       #define PMK8550VE_SID 5
> +#endif

Please drop the #ifndef wrapping and move the define to all files
including this dtsi.

> +
>  / {
>         thermal-zones {
>                 pm8550ve-thermal {
> @@ -33,16 +38,16 @@ trip1 {
>
>
>  &spmi_bus {
> -       pm8550ve: pmic@5 {
> +       pm8550ve: pmic@PMK8550VE_SID {
>                 compatible = "qcom,pm8550", "qcom,spmi-pmic";
> -               reg = <0x5 SPMI_USID>;
> +               reg = <PMK8550VE_SID SPMI_USID>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 pm8550ve_temp_alarm: temp-alarm@a00 {
>                         compatible = "qcom,spmi-temp-alarm";
>                         reg = <0xa00>;
> -                       interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +                       interrupts = <PMK8550VE_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>                         #thermal-sensor-cells = <0>;
>                 };
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
