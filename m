Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B2579301C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 22:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbjIEUfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 16:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjIEUft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 16:35:49 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3FFCE
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 13:35:45 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bed101b70so445266266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693946144; x=1694550944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiSmCxQ/EDKcEARhNdmpkXCPW0esRb5+GXQZAdSBUgk=;
        b=eEzIxH+Rr2cqENrqHNHjJ8iWXSwXx0kD5ZVHFDolfdMJ1+xQ3Qe0yFkxPlhJgiTG4A
         GvGpgEyDs57vy5mT+pK1bOOqnWco//IOu3IteGBHutInJlppGe3xxBwhYZToNkKudsXE
         K8ZoHTKObK5BRswaErccxoY4RhbiN77VBlI9X02vk/8ifx4UM8v4toihZROu5BQvrv+K
         jY3IeLYDN1g+iyF91Yy7u92ptqxF2l/YIVgSxHXAaOjnMKhnExC3N3iTardxZldN/+ox
         S9GVMb0MAE89haiRRiz+oGqcQ4AgH48mYtKhClkBwkKudScfIWPyprd2ifDDUo2xeaXN
         1xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693946144; x=1694550944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiSmCxQ/EDKcEARhNdmpkXCPW0esRb5+GXQZAdSBUgk=;
        b=KXxqIC4EB9uOQybOPlhU6xRyekD/X8ovTInLKU4JdkVXCj6WMkftyj7XfDq1MYYTt8
         9isRGE51TxKT8pm7+Q/dhpzpY+/T9RvU3Qj2s4gIqGPty1gLGukJVQLZLVglEom830bS
         /wNDW17KNi9LS7447CfQeA1Vu6ocS4iHnbiJElxE49LSAMEWZv6zEmoUsjaeD1iQ0o6e
         LqqjWRZ6VteSBmEtH3OA7IYW1ATB7BkXpCaECc5+cDr4cDHPcxeVuKNyM8Qit26YAL7x
         BKDPIP3vZcU5WvogIx8p0m92ckxiC+dnaRCcuNgg+gHmH0ZYE6WOKeReKa+cgB+tNC3W
         l8lg==
X-Gm-Message-State: AOJu0YzJmEcvnfnc7Krfe/YJAWqI1CeHdzWFLXK9D6q9lPrg4lqkFt/t
        IKfju3DLdFmvbnwcs/LLOA8GNQ==
X-Google-Smtp-Source: AGHT+IE7rcNuMhGXu4mMQJiB/4NmLmwT0a3++KRDw0wd47NGep+DfyU+NFOr97o9NJb81yuFYh7PkQ==
X-Received: by 2002:a17:906:cc12:b0:969:93f2:259a with SMTP id ml18-20020a170906cc1200b0096993f2259amr649096ejb.73.1693946144056;
        Tue, 05 Sep 2023 13:35:44 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906299800b0099cadcf13cesm8044460eje.66.2023.09.05.13.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 13:35:43 -0700 (PDT)
Message-ID: <35475122-cc40-486d-90a7-09be53588219@linaro.org>
Date:   Tue, 5 Sep 2023 23:35:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: qcom,dwc3: Fix SDX65 clocks
Content-Language: en-GB
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693909838-6682-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693909838-6682-4-git-send-email-quic_rohiagar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1693909838-6682-4-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 13:30, Rohit Agarwal wrote:
> SDX65 has 5 clocks so mention in the bindings.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Fixes tag?

> ---
>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 6759105..018117b 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -180,6 +180,7 @@ allOf:
>                 - qcom,sdm670-dwc3
>                 - qcom,sdm845-dwc3
>                 - qcom,sdx55-dwc3
> +              - qcom,sdx65-dwc3

Is indent correct here?

>                 - qcom,sm6350-dwc3
>       then:
>         properties:

-- 
With best wishes
Dmitry

