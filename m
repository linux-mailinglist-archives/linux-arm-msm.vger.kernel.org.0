Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B324464A12C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 14:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbiLLNgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 08:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiLLNfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 08:35:50 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E498513F5A
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:35:48 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id c1so18604526lfi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrMUnpEF24SXcu2ingnxX8RmvukiOWht+/Yrk1gBHe0=;
        b=HyLE3BaSeyiNr4uDhgY28nhWRDa75w9cB8IKhGseVwXl4s+vAU4jx7aHHwnsMh+aqd
         4WgEVkc9nZUP2nDjGUxdN2Wi7iFYLgBt6t4zynXCA5sgtqkoQRKZ9WgPQTUXeKi24EDa
         hUFq/nX5CEXw+U6DLh/zfrPH6ICqu+MjhUFmIe8bira4PR60Dmw/Z1TCKwgvFBNuz932
         sYCL30UKduCBmUB7CxCNGstmq/x1TnKq4g/hSpqCc8V6J+RuulizcVDnfrhPOSzSckT0
         o6pgQMgJx1fuYI8ezUNB0Q1FvPdpR2vGm8O1/XCkiTWW5U7auSgh7oJKeSJXGIlT1s20
         rq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrMUnpEF24SXcu2ingnxX8RmvukiOWht+/Yrk1gBHe0=;
        b=vPzb0ogd5WAj6oxVugHEYlzL+bl5j4nOkijY0I468SminotqQIm/cVJK4+xMVgRKkT
         LR2GFnuvoI7h9cEM7RVP7UB8EpY+3wmXmDldY5hjXSa5EP+P2+dtnq1rWY7C4C7gTRMS
         26OQbkLD7XDivIOgpVJSP64ufqp+Wm5H+Wen0IrSA2rwaJiyL6wsTLx37T5V8x3lrQbc
         F+lI6yLkbqEgrC2o8+djKQF7IiOtZbtZ+uxp/qS4HpNxzYjcRyxXWcUYx96IzGYFXI0t
         HXevel23SRapmh1DNfxDLdVzQu5mCigjlyN2qCZWaD7GvOA6WnbtAmrUmgPkq7eeQmMp
         7fyA==
X-Gm-Message-State: ANoB5pkaJDxqsTd0ntleqlZJNRQs/aOABDR57QGHLEqYs5puxKNAXuRR
        QadT7PUEpSPnrKie9j6Deu2itA==
X-Google-Smtp-Source: AA0mqf5/QbGs4PEgUCwW/KaFZPuWVkY6A/R9o1MEE5yiLA+GM0oYRSBWkzyqjoUmjoR6Qeqa5MheWA==
X-Received: by 2002:a05:6512:b91:b0:4a4:68b8:c2e4 with SMTP id b17-20020a0565120b9100b004a468b8c2e4mr6740538lfv.59.1670852147282;
        Mon, 12 Dec 2022 05:35:47 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id x1-20020a056512078100b004b4cbc942a3sm1636069lfr.127.2022.12.12.05.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 05:35:46 -0800 (PST)
Message-ID: <1a1e2d8d-5ed4-81d8-5220-5e432c243b0f@linaro.org>
Date:   Mon, 12 Dec 2022 14:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: correct SPMI bus address
 cells
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
 <20221212133303.39610-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221212133303.39610-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.12.2022 14:33, Krzysztof Kozlowski wrote:
> The SPMI bus uses two address cells and zero size cells (secoond reg
secoond, a secoond time

> entry - SPMI_USID - is not the size):
> 
>   spmi@c440000: #address-cells:0:0: 2 was expected
> 
> Fixes: 14abf8dfe364 ("arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 448879d3d5cd..7c24c2129800 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4286,8 +4286,8 @@ spmi_bus: spmi@c440000 {
>  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
>  			qcom,ee = <0>;
>  			qcom,channel = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
>  			interrupt-controller;
>  			#interrupt-cells = <4>;
>  		};
