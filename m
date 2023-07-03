Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF548745B81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjGCLrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjGCLrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:47:45 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7460011F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:47:44 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b69ff54321so68731771fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688384863; x=1690976863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrZqXbMULCzgMdQRGdrGAnOVYCA+2+CvfjxWieey9kA=;
        b=VSWJtK7oBEJMyq9z+9pb/ZdSXzZbkKLUBDxakxIfQY0Yc1ROH9tGfO2KxdQjd0rcTl
         iNoiNARklCpHakv0pMID6wP1RojXeLk8uiecoYY4QAp1zXEzfkMnb0r3XPV2Mc1nwV0F
         8+qK26L6BrGQKUJcAh7QQWgXaTuu8E4KCcHhSpTCj8HfLD9WDmKxMpVL/WYMhr9Bpa4T
         d6m+GkCN7hTOr2ItToKHRDVnZV98puPaqyHLXlQzVFx0iLI10NPe2D4yQND44sUxCPy3
         AC2E3cFKBQKuRK7Aek2bWXUGT02fAWWEk0Cde8eAD+qcsdjGHyyje9vPJdwSU+tvrVWj
         GxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384863; x=1690976863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrZqXbMULCzgMdQRGdrGAnOVYCA+2+CvfjxWieey9kA=;
        b=UY49KqWjbC3WAyNHPDA2t5R7ON7N+im7+SuDUQETBwUxIqEI3wpUtCiqJAxXhE2A+v
         gwCD0ZSQGU+ffXrneyVxVMU8hHBPoLcXQ2LF1TMEYbYkXk+fBlIokAi0D9yffRH+GZ1Q
         lccVqCncPj1eo2BFOs64aOwHhKSBzVyAaRnVRz6qfa9Qcsu8t6cm8gRtmFSZY/zEq/xT
         hX/9vTikqd5bPPFq5CqgP8T46XJmq1JiMvSELOTx8jsG0n/1go/rMoP9U8iuwccQJ+YG
         uynmTNcjipHARMmJ8hKUrDapJxT0zthxEMXcZk1xSiAbR2EK8Oj3ApC5lw0Ne8Yj8q+z
         RoEA==
X-Gm-Message-State: ABy/qLbxVT38J+hYnyugLBFlaxHE8xHAt/DGKiSVI2HM0HbtWLvCNOoN
        HyPuzI26wap8PYd0oaL4aunr/GioF2Iqlvo9jYWANw==
X-Google-Smtp-Source: APBJJlEn0CB3Pv0NJ/u3/l6HMZ8obHmy7fBBkAvbNzq/ZjSiRfM4/4JF02IIVMYOMMPoAXRA7EKtXw==
X-Received: by 2002:a2e:7318:0:b0:2b6:ec2a:a67e with SMTP id o24-20020a2e7318000000b002b6ec2aa67emr1359111ljc.53.1688384862706;
        Mon, 03 Jul 2023 04:47:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id t8-20020a2e9c48000000b002b6a824d65fsm3908420ljj.0.2023.07.03.04.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:47:42 -0700 (PDT)
Message-ID: <f4543f7b-9cc6-4dad-5eb5-7ca1286c4bf7@linaro.org>
Date:   Mon, 3 Jul 2023 13:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 10/27] ARM: dts: qcom: msm8960: fix PMIC node labels
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> Change PM8921 node labels to start with pm8921_ prefix, following other
> Qualcomm PMIC device nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 913bc6afd0a1..6b8d90d02146 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -264,7 +264,7 @@ ssbi@500000 {
>  			reg = <0x500000 0x1000>;
>  			qcom,controller-type = "pmic-arbiter";
>  
> -			pmicintc: pmic {
> +			pm8921: pmic {
>  				compatible = "qcom,pm8921";
>  				interrupt-parent = <&msmgpio>;
>  				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
> @@ -276,7 +276,7 @@ pmicintc: pmic {
>  				pwrkey@1c {
>  					compatible = "qcom,pm8921-pwrkey";
>  					reg = <0x1c>;
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8921>;
>  					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
>  						     <51 IRQ_TYPE_EDGE_RISING>;
>  					debounce = <15625>;
> @@ -286,7 +286,7 @@ pwrkey@1c {
>  				pm8921_keypad: keypad@148 {
>  					compatible = "qcom,pm8921-keypad";
>  					reg = <0x148>;
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8921>;
>  					interrupts = <74 IRQ_TYPE_EDGE_RISING>,
>  						     <75 IRQ_TYPE_EDGE_RISING>;
>  					debounce = <15>;
> @@ -296,7 +296,7 @@ pm8921_keypad: keypad@148 {
>  
>  				rtc@11d {
>  					compatible = "qcom,pm8921-rtc";
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8921>;
>  					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
>  					reg = <0x11d>;
>  					allow-set-time;
