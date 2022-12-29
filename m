Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BAB658BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 11:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiL2KhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 05:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiL2KhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 05:37:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E09101CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:37:02 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bq39so19194085lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SwWwnfZr+uBEvsIuFz/yYh7XO2beOzaYWIBtOLhwsc=;
        b=wklaEMwa/1iRPi/ZBWVSzDnc15wt+GyNfabUflkM9an6lp25NFZDFPjOih/22pIwKT
         RTZFeyJ4tCIkbJdC7deYC4l1OpDZZtai1Yl/bEibpO6fCQmS67IddAdOl/0ho+cefTBJ
         gbW5Iao4tt0SWG5o+wcYSfbVsLFDtzlHNUda0OCQYvtG8P08ekaSpnJ39en6gZFxH1Dr
         qB6QfqXyIH0Ryhp97Qw0juNvpHGG3ia4AuHoVSLnAUiTNFrlL6aFjOExzh2SFDCypqZX
         ld/Vzr7fvZTNei4uOUru3K7AzXXXXsOrzkNMWOlG55QQKRV3PmTNUf+iSt8XOH/3fb12
         MQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SwWwnfZr+uBEvsIuFz/yYh7XO2beOzaYWIBtOLhwsc=;
        b=jfvZ7yJhvpcT+WY9cGY5hxfMwUKYZDCooPm4LiDkb7o80Ajd1SCTk2CW9octRznSOI
         8hO5QQHD4c4aqpgOAbfbI9p16+FOEFl8VNudK97A0uA9bAV1cQwZmQSET8OCjShVFIm/
         HA3nUMc92xqDkwwN5Uf7KUmaPC/uiOhVpSd2W1SmWgdYemYaHRszeQmgw4zmjpMY5XSz
         3XG+t3T0n4Z/lLghCYU2wnwtJQBPTIpDoH2hIf8NXIjTQY2T06JtwNqhJBDcV4PbEeVu
         xtJsc0CTI2Ojg7F1ozN9QyoCAoBuQhZyugFwQhm+TyXGFPgAG3aLPsHPwTBj6opDTbms
         pVtw==
X-Gm-Message-State: AFqh2kqd3t/xi8CCnMXX/aZY9RKO8f1uMqJ9JZu3KL0qqtJ5ZHbJYipa
        VXZnscAUdCfhkNLTrqDh4ws7NA==
X-Google-Smtp-Source: AMrXdXslPob+FNgzHy2CAfC4/AAEPuPKx+TO27hrbUTcw0/b/25IJF1RaU4L2XRUOCJayuxD5zThNw==
X-Received: by 2002:a05:6512:141:b0:4ca:f887:fe99 with SMTP id m1-20020a056512014100b004caf887fe99mr5516459lfo.25.1672310220931;
        Thu, 29 Dec 2022 02:37:00 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651234d000b004b57a253deasm3014886lfr.162.2022.12.29.02.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 02:37:00 -0800 (PST)
Message-ID: <f0bfcbe0-5053-49b9-5598-7d23dcc4cbb3@linaro.org>
Date:   Thu, 29 Dec 2022 11:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] ARM: dts: qcom: pm8226: add PON device node along
 with resin sub-node
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221228230421.56250-1-rayyan@ansari.sh>
 <20221228230421.56250-3-rayyan@ansari.sh>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228230421.56250-3-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.12.2022 00:04, Rayyan Ansari wrote:
> The PON (Power On) device in PM8226 supports both the power key and
> resin (reset input).
> The reset input is usually connected to a physical volume up/down button.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  arch/arm/boot/dts/qcom-pm8226.dtsi | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
> index a2092569970a..6af259218f63 100644
> --- a/arch/arm/boot/dts/qcom-pm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  #include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
>  
> @@ -10,12 +11,25 @@ pm8226_0: pm8226@0 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		pwrkey@800 {
> -			compatible = "qcom,pm8941-pwrkey";
> +		pon@800 {
> +			compatible = "qcom,pm8916-pon";
>  			reg = <0x800>;
> -			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> -			debounce = <15625>;
> -			bias-pull-up;
> +
> +			pwrkey {
> +				compatible = "qcom,pm8941-pwrkey";
> +				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				linux,code = <KEY_POWER>;
That's redundant, the driver sets this by default if linux,code is
not found.

Konrad
> +			};
> +
> +			pm8226_resin: resin {
> +				compatible = "qcom,pm8941-resin";
> +				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				status = "disabled";
> +			};
>  		};
>  
>  		smbb: charger@1000 {
