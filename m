Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908BC7B42A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Sep 2023 19:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbjI3RYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Sep 2023 13:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234641AbjI3RYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Sep 2023 13:24:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CA2E1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Sep 2023 10:24:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50336768615so24843694e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Sep 2023 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696094638; x=1696699438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzpkS5WtBC86fJGuXY0GbjQIu9QUBdjEhDwmlgi2Kew=;
        b=sJArNkk2fydsFcToRYaN/3SyR8jZ5/eeeNw3On6Gxz+WaKtCN9npRsd/RIXHKKH7R0
         9l3ihJUqPGGsBnfBggqaosCeWcCV2K2u1rutCtuspm44jJm79uHEUIFWW3H5AJIyFj8+
         OLSxEZSGF6DLnMJ2XnklNRrwuC9CaEXZkuqYo0YKtIDDJbbIDn3SuzPiHj81ePrqureG
         mDCsNdnslgrPyXnQUdOkU3E/WMESYOKS4bfJop6jq0JxnxPe87aYOxGcAvsqCq69Gy2J
         qGaTvtqHI9hSXNUi4D54zu5+DE2QIeZZw5bS41CD6kk1oqPmK7Vtyi4gId9sV4qlp9Ym
         Lb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696094638; x=1696699438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzpkS5WtBC86fJGuXY0GbjQIu9QUBdjEhDwmlgi2Kew=;
        b=M3vahMBbALEtZqx9iPKbur3KIa6ERB8R5Qpe7PwGtCjW8/DgGXBr65C3MDMgGKnAMs
         t8kdLsusqf63CGzpIZmXvrkdd5RaajZgpVMt8VO+bHg8j1ux4Q+TSxQi2MLsz5HexQLM
         TYB/HkL34WP7n3FyZmK+8mHbcbpRTtnBWxOv9U3fT2o56HtHU2uONghTKuaCXDr9YBIp
         55KACOcPqe7WMITppuZMMOEmAYtw5vQE+esPtZ8sfaE49lKUYwhGTaafD4zXvzQRG+Ea
         Wzq2AnUW5kfzSioV4zUAfMP+qNjwAEjW/ENu673dlau90n5KacQatX2Isq6P/0JgdsHh
         9oeg==
X-Gm-Message-State: AOJu0YwVjBRQVbSG2FsdSQXhsaFbXKgdABwsOv8Ku+C39g4T2e0oz4jl
        wLunowa8iW8nGB0GmZhPPVhE2g==
X-Google-Smtp-Source: AGHT+IGvXNt7OngCsZTWxJNJE2rVMCZJDaC/Er1JEElLoCfYx28zdY6xhS+zm33ksmi5HfdxncMRiw==
X-Received: by 2002:a05:6512:10d0:b0:503:293a:dc1b with SMTP id k16-20020a05651210d000b00503293adc1bmr7471121lfg.30.1696094638327;
        Sat, 30 Sep 2023 10:23:58 -0700 (PDT)
Received: from [192.168.246.189] (85-76-98-178-nat.elisa-mobile.fi. [85.76.98.178])
        by smtp.gmail.com with ESMTPSA id z8-20020ac25de8000000b00500ba43a43asm3994414lfq.86.2023.09.30.10.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 10:23:57 -0700 (PDT)
Message-ID: <c0abfa16-92f3-41e6-afb2-e542131ae67b@linaro.org>
Date:   Sat, 30 Sep 2023 20:23:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: usb: dwc3: Add clocks on Qualcomm
 IPQ5332
Content-Language: en-GB
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
        arnd@arndb.de, neil.armstrong@linaro.org, nfraprado@collabora.com,
        u-kumar1@ti.com, peng.fan@nxp.com, quic_wcheng@quicinc.com,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_kathirav@quicinc.com, quic_nsekar@quicinc.com,
        quic_srichara@quicinc.com
References: <20230929084209.3033093-1-quic_ipkumar@quicinc.com>
 <20230929084209.3033093-5-quic_ipkumar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230929084209.3033093-5-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2023 11:42, Praveenkumar I wrote:
> Add aux and lfps clocks in Qualcomm IPQ5332. These clocks are required
> for USB Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>   .../devicetree/bindings/usb/qcom,dwc3.yaml    | 20 ++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 67591057f234..18af2887b984 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -149,6 +149,25 @@ allOf:
>               - const: sleep
>               - const: mock_utmi
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5332-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: iface
> +            - const: sleep
> +            - const: mock_utmi
> +            - const: aux
> +            - const: lfps

Could you please also describe the lfps clock in the top-level clocks entry?

> +
>     - if:
>         properties:
>           compatible:
> @@ -238,7 +257,6 @@ allOf:
>           compatible:
>             contains:
>               enum:
> -              - qcom,ipq5332-dwc3
>                 - qcom,msm8994-dwc3
>                 - qcom,qcs404-dwc3
>       then:

-- 
With best wishes
Dmitry

