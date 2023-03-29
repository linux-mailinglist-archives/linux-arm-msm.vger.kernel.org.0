Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A516CD705
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 11:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjC2Jxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 05:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjC2Jxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 05:53:42 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B776744A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 02:53:21 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id e65so18506104ybh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680083595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4X3khqF5xFkGR6ddfCz2qgESEMRppgaegQNKeKhCKME=;
        b=pIDID8ycm1GH79KcllagHYSuh0LHg3M9m+Cg2qN2yDkyy7BL4JsDBuR0ZJySBSbgNC
         FK8/4mr5KhFdlY15orLqTmbSl8Y8kAhNRAgGTICMxtQ0U/R4PzwYwpfb/KgKkX0iWpuu
         XpBNrsb0PiWZ7f6BFCMW6wVf5cRxT7UV02nZ0DI0MP9uuKAoSiRWrMKr7Z9XTu9C+Wb0
         4Z/Zhb19McOVziA+YamBIxv0k7qz5LLszB6uwAS5E8iHudfC1xjAPmZgxxzjdQMF5FA6
         +mSQ00dfyesfzUu1pMU8DFFBDv6ErpspeFu4Vs/sbxXStYxWhHL9jTdniSOGuRzGDV6P
         LXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680083595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X3khqF5xFkGR6ddfCz2qgESEMRppgaegQNKeKhCKME=;
        b=F5FV3LTQeWgvDX/akQcYkqCAMiY3Qlfydsy4SineAxgkcyc79l3p+fjEe4CBfC7v+v
         cREk7dt4CVjtT8QE4LFgxRSf77aT+7R1oujTR4LEuFc2x2rTWKpmo8zkj8niPo8doHfL
         BbdXkWrQqtjMxzBMMLZNY1KNXs54OKeUZX63SD3Wvs3ogfHUQf5FdCIRxIpRU07O+qUJ
         ebXwKpq3O1e3xFD3MGa0hljDIxT7lgKl76/J4/kImKY0AbCSRjYoIR5rbeZoGGxP7bxU
         lci3Gs/xn8g30l5v89iRSNRLQWZh/rZYhCFa94CBrQ9TfmqetPh/5zMcu7DYLsJwHvfF
         iTDw==
X-Gm-Message-State: AAQBX9dZ06PTdk1kInhcLrP7RSV1/PDbShaeUxAh4uKAEOu0zur5MiFq
        Tb+S42MHSzWY919S8y6mh9QPn+MDxE2CNmkWdlMKjw==
X-Google-Smtp-Source: AKy350YCRBqvLwyxmkGTN1H7PLM5ya1V6tDSouGzDj2liGJDjszuMmKMzk5SB23ouJDdK71Yr5sfI3x2GuG2d1uL0Vg=
X-Received: by 2002:a05:6902:72e:b0:b6c:f26c:e5ab with SMTP id
 l14-20020a056902072e00b00b6cf26ce5abmr12849242ybt.3.1680083595433; Wed, 29
 Mar 2023 02:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 29 Mar 2023 11:52:39 +0200
Message-ID: <CAPDyKFqP9LbnnwwK3o7+C4K-xJZmDhM+QbXy20RsKVx+hsCgdA@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250: drop incorrect domain idle
 states properties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 at 08:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Domain idle states do not use 'idle-state-name' and 'local-timer-stop':
>
>   sm8250-hdk.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes: 'pinctrl-[0-9]+'
>
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Link: https://lore.kernel.org/all/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 79d67b466856..9cf2de87c632 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -354,12 +354,10 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>                 domain-idle-states {
>                         CLUSTER_SLEEP_0: cluster-sleep-0 {
>                                 compatible = "domain-idle-state";
> -                               idle-state-name = "cluster-llcc-off";

FYI: If someone wants to add support for this property, I wouldn't mind.

>                                 arm,psci-suspend-param = <0x4100c244>;
>                                 entry-latency-us = <3264>;
>                                 exit-latency-us = <6562>;
>                                 min-residency-us = <9987>;
> -                               local-timer-stop;
>                         };
>                 };
>         };
> --
> 2.34.1
>

Kind regards
Uffe
