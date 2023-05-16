Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870227051FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbjEPPXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbjEPPXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:23:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B11F7A92
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:23:17 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so21815951a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684250596; x=1686842596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veRzPqieD2xIyPWtInPZpay2oq9TezkA6RY5NApQtqk=;
        b=LCLogQMJsTZ6Ovarvk7cE7knhWlL4Yx31pjrraLSRlFTj+nXAiFr/rc4lWLVJxQRx+
         IkZ+BG7UGc10H4JVE37lH3WrCIei63NAoGFL1TUb2QQhIVIiLZsM/K6LWDzmXYd922lk
         eZLVJ8yMiueTaVT/fFnFLompS/D/Fv8J1xCmDI7Y2Dg4rL/tP97QbxRVLCA4prXM1dba
         T2dKyHDKzV9TSOq1cOgxg2RxNcpitnb8jn+NxarGB3/zU7BkNgFmechon7bDB1LjNTeM
         xiVY1JWvKQQ6tj6Pr9GiSITVAvbRRCvi69XV/cI9dUEZEZehVhahgLS/ZCK1BM2zkz8V
         7W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684250596; x=1686842596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veRzPqieD2xIyPWtInPZpay2oq9TezkA6RY5NApQtqk=;
        b=QhJnjI7m3adJJXQYboUIK/tleZG6f+akuOgGe0J8VpX1IsDr0lxEb43bXwwmawvUvW
         cdKIzQ6n9oZ19vo0WqFnKft3H1dnNu2dS/3Z8+5fqEruPeDpGNOvPA8xa0AtYvj0aBYd
         fHPU3wViNrJa+Gnf3IZ2do4s7TJ1wIKy6xSyNZbUbQljzaB9uH+2mlteh7XLCvvAgiYN
         AC1Yr1Gk0UEpttRWnsnSLc3vO4gXywOX3QW0ftLYvTQQBAFEwWtzbVE+SJGMy658Op9D
         Rc1ERwncjbNhgkPbHDz1ikq1bFbImup2UKPlPzlZEqILiFw8zwqO+fSbqa9zJikUWE5q
         1GAg==
X-Gm-Message-State: AC+VfDxNeh88L6YUbELePdtKsjBBa+Iqy2yEOYkJ1B7pA9tEWqXL4SxY
        rn/F5lSYzfMcP2KnHbB+ZjKlDw==
X-Google-Smtp-Source: ACHHUZ71bCaUguxQbo8uXIgrwfdQ91XlJ93Pf3PozcM9swMT7wOvO1lwIeC8RhFNlZOE0pIJXhG+Mw==
X-Received: by 2002:a50:ef0c:0:b0:50b:c42b:b737 with SMTP id m12-20020a50ef0c000000b0050bc42bb737mr28694427eds.37.1684250595768;
        Tue, 16 May 2023 08:23:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id a17-20020aa7d751000000b0050d988bf956sm8425605eds.45.2023.05.16.08.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 08:23:15 -0700 (PDT)
Message-ID: <8b670310-47b3-c301-99ae-84ccb704d733@linaro.org>
Date:   Tue, 16 May 2023 17:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-qrd: add display and panel
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>
References: <20230516151708.213744-1-krzysztof.kozlowski@linaro.org>
 <ecfe4f62-9c54-df5e-cd5d-e7a956510696@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ecfe4f62-9c54-df5e-cd5d-e7a956510696@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 17:20, Konrad Dybcio wrote:
> 
> 
> On 16.05.2023 17:17, Krzysztof Kozlowski wrote:
>> Enable Display Subsystem with Visionox VTDR6130 Panel (same as on
>> MTP8550).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Context in the patch depends on:
>> 1. https://lore.kernel.org/linux-arm-msm/20230516133011.108093-1-krzysztof.kozlowski@linaro.org/T/#t
>> 2. https://lore.kernel.org/linux-arm-msm/20230512160452.206585-1-krzysztof.kozlowski@linaro.org/
>> ---
>>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 76 +++++++++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index 30b36a149125..03bf6bc2db4d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -420,6 +420,10 @@ vreg_l3g_1p2: ldo3 {
>>  	};
>>  };
>>  
>> +&dispcc {
>> +	status = "okay";
>> +};
> Missed this in the bigpatchdrop review.. It makes no sense to keep
> dispcc disabled by default (other than for lazily "solving" UEFI
> framebuffer being shut down)

Sure.

> 
>> +
>>  &gcc {
>>  	clocks = <&bi_tcxo_div2>, <&sleep_clk>,
>>  		 <&pcie0_phy>,
>> @@ -431,6 +435,50 @@ &gcc {
>>  		 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>>  };
>>  
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vreg_l3e_1p2>;
>> +	status = "okay";
>> +
>> +	panel@0 {
>> +		compatible = "visionox,vtdr6130";
>> +		reg = <0>;
>> +
>> +		pinctrl-names = "default", "sleep";
>> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
>> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> property-n
> property-names

Sure, copy-pasta from MTP8550.

>> +
>> +&mdss_mdp {
>> +	status = "okay";
>> +};
> This should also be enabled by default, MDSS is useless when MDP is
> disabled.

But don't we want to disable both when display is not used (not connected)?

Best regards,
Krzysztof

