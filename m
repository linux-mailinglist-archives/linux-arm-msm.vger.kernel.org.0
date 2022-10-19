Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D869E6045F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 14:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbiJSMwm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 08:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbiJSMwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 08:52:02 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D504164BE9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 05:34:12 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id p7so17546764vsr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMNFqQ1cKYZraeOUh2laCGjFrCge3hBVt6vY/kYdzro=;
        b=uCAZEUah1GXTO/Dhr3QPK4COCoFCeM8+Jjxsh4MLnKf1kiS4gCYn1tFEbS+Qx0GQZr
         lBKbx4uC7EboNj0hJmSxCxX7dYXYKZ6TMcAjDHAZvSUj8/wRjt9NaqPlLU1drz+/1cth
         A0SDNx2KUz3G2e5yuejO1SKwBWH0Xq/88Oo8IpcpmMYdLk8GLJcz8xf85uJDV+HoXfhs
         q0ctj00NM7PQDZemzH7QSJyup22Fz1Lh6PN2gCzIp+Gsu5+9wiKeEM7kiw2zYcFA5eAk
         bXoQip1KEgt9apacmG85i9WjsEXPBj1xloNylB25uCs0tHmqknYZuWAgfPq+lquO777l
         cKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMNFqQ1cKYZraeOUh2laCGjFrCge3hBVt6vY/kYdzro=;
        b=rSqqD55hAht2Fli/AZDRUYvnR+yKJKLCJGLaNU0xjTLkB5TuGJMIPy5/OOfblIH/Xp
         UAMcQrX9kr9k27sammPMfB6w/MgBWcLzbLUPs7+c/AQKudqoZrkvFww6vZ+Ra/mt9mBT
         XsrL/DUuOdEDW87U0m66HlwIJYTAPaIt5Aeu13YLuR91HpkFTrDsrAmOi0pZMJ5kJbgB
         zNzWjBoaLrgSqDqw9jNW5yiUjXiEj80vgSMUZLknVXvXUFMCAF4LB+dY4Lcoj9VlnJ7p
         3NJ+/aAE8fkZfZKej/mbShk61nEXzvhFXcgLET9PUg0V6BvkvVt7vquNBB3AQp8IjeVl
         tAVA==
X-Gm-Message-State: ACrzQf1FEaneZr2ts3L1ZkRL5K8CGUqxso7IrtHDJS11xVcIlILllCUP
        JhOArqnuIgkJzZC2oyMTH5pOOmgYb2MuBJCzcdr1FRqXF02qIQ==
X-Google-Smtp-Source: AMsMyM6WQNKXibXuVfWu8N49gAxdnh4vFghljtoHG++6NQujmf4jWPdnvyEXOs837QKkhfJvV65lOWL+4b+PAZmI4Cs=
X-Received: by 2002:a17:903:246:b0:179:96b5:1ad2 with SMTP id
 j6-20020a170903024600b0017996b51ad2mr7993669plh.37.1666180690956; Wed, 19 Oct
 2022 04:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221018145348.4051809-1-amit.pundir@linaro.org>
In-Reply-To: <20221018145348.4051809-1-amit.pundir@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 19 Oct 2022 13:57:34 +0200
Message-ID: <CAPDyKFoBMB9OMUrcoPCV0of1fj2dimEwPyHGW=ydjJ2M0ubM8Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: Disable cpuidle states
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Oct 2022 at 16:53, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> Disable cpuidle states for RB5. These cpuidle states
> made the device highly unstable and it runs into the
> following crash frequently:
>
> [    T1] vreg_l11c_3p3: failed to enable: -ETIMEDOUT
> [    T1] qcom-rpmh-regulator 18200000.rsc:pm8150l-rpmh-regulators: ldo11: devm_regulator_register() failed, ret=-110
> [    T1] qcom-rpmh-regulator: probe of 18200000.rsc:pm8150l-rpmh-regulators failed with error -110
>
> Fixes: 32bc936d7321 ("arm64: dts: qcom: sm8250: Add cpuidle states")
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index cc003535a3c5..f936c41bfbea 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -251,6 +251,14 @@ qca639x: qca639x {
>
>  };
>
> +&LITTLE_CPU_SLEEP_0 {
> +       status = "disabled";
> +};
> +
> +&BIG_CPU_SLEEP_0 {
> +       status = "disabled";
> +};
> +
>  &adsp {
>         status = "okay";
>         firmware-name = "qcom/sm8250/adsp.mbn";
> --
> 2.25.1

Disabling the CPU idlestates, will revert us back to using only the WFI state.

An option that probably works too is to just drop the idlestate for
the CPU cluster. Would you mind trying the below and see if that works
too?

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c32227ea40f9..c707a49e8001 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -700,7 +700,6 @@ CPU_PD7: cpu7 {

                CLUSTER_PD: cpu-cluster0 {
                        #power-domain-cells = <0>;
-                       domain-idle-states = <&CLUSTER_SLEEP_0>;
                };
        };

Kind regards
Uffe
