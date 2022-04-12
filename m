Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F634FE8FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359043AbiDLTn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359100AbiDLTmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:42:24 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1304D63A
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:40:00 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b21so5887680ljf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=KdIHWvqojnl+hhQv1NddoZGquOpYAIy3tu+JSVXI7oI=;
        b=QRgQW2WV/0W7v5dLXmjrbIlUVh6XkuCR1zF1c0yWfP/t9nfxB8sW4ENL0Foq571BPe
         EoIEIQQIhySJI8EyUCd61wCY+i2c8pJLQ64ry7Y3qvvWw8V9M0pp42W1v9illgZ3Sy6m
         oNbBmMQgX1JB/uptjuXdpr1V+Zi5bGF2v2t+XheV7wivdkb9xQ0aL+flmRtkBvaJA4Ab
         ctQ+rKm2eTyZxC0PJnkSUeKDbnCrpSYeQKKHwpOWtr3QaMJZtX/1TtlNlMv6q+gFIFKJ
         r9BCB4BuVBgmAKhdgwXoa1+Y1vpcteq8/VeRmCsWynv8YzpRmvfUaUVNkTBh01irPafe
         gVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=KdIHWvqojnl+hhQv1NddoZGquOpYAIy3tu+JSVXI7oI=;
        b=sO9t1Ub/Mqm1rYQvQYPpZ//Iol9Wt9X8nRmCEudEHzz8k6IZvjyTkH6BOtwWDU/6Ix
         dQ17C+a/exccMKetTR318TcsWUG73GJwS55NT8uFuudT++mYhnyNWh3gFseqqOvubEUW
         oWV26nt32dFRHajonZGuCBZyL+uN6kycqsB1OEMkaafh1y5ZtjwZoD3NulbSayzWZ4TU
         WYzVR1eyLxcpU3sLTLepnmox+YTC+W4d0UKyUDFunTQb5ahFMPxIV0TMkiRZgPzgvjBN
         AWFTM5my/uNAi2ZA+WZkJ5BqUc9Abg3K8Zsd9y6/oukEgFLT24PXwMsBy0L0+tBcHFiX
         +BGQ==
X-Gm-Message-State: AOAM530WF5s8DUONzvgoiQb2Bv7+PldnQjDPXnfOzhflZyW8uyEUUIG1
        vspwd9Mh3rlMoIXMsZDvCb948w==
X-Google-Smtp-Source: ABdhPJyf1LhztmWShF/xkMubxhGcmYwTnnoY73R9m1whl3tKv8dN0dzQfprAv05/zdhUvdbRbB4sXg==
X-Received: by 2002:a05:651c:992:b0:24b:99c:35c with SMTP id b18-20020a05651c099200b0024b099c035cmr24913059ljq.142.1649792399080;
        Tue, 12 Apr 2022 12:39:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s9-20020a197709000000b0046bc30798aesm191382lfc.282.2022.04.12.12.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 12:39:58 -0700 (PDT)
Message-ID: <c48f83a4-ef84-de25-e87c-539c4b0d1a0a@linaro.org>
Date:   Tue, 12 Apr 2022 22:39:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add thermal sensor
 controllers
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
 <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/04/2022 02:44, Dmitry Baryshkov wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> The change adds description of two thermal sensor controllers found
> on SM8450.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Of course:
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 934e29b9e153..b695ce824722 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1021,6 +1021,28 @@ pdc: interrupt-controller@b220000 {
>   			interrupt-controller;
>   		};
>   
> +		tsens0: thermal-sensor@c263000 {
> +			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c263000 0 0x1000>, /* TM */
> +			      <0 0x0c222000 0 0x1000>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens1: thermal-sensor@c265000 {
> +			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c265000 0 0x1000>, /* TM */
> +			      <0 0x0c223000 0 0x1000>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>   		aoss_qmp: power-controller@c300000 {
>   			compatible = "qcom,sm8450-aoss-qmp", "qcom,aoss-qmp";
>   			reg = <0 0x0c300000 0 0x400>;


-- 
With best wishes
Dmitry
