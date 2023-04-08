Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5CF86DBB6D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 16:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbjDHOD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Apr 2023 10:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbjDHODm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Apr 2023 10:03:42 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127F51207A
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Apr 2023 07:03:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id e9so30563691ljq.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Apr 2023 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680962590;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hb84xjZS8wZm3kthqKZh4HcgllDDIHrKkBqM1Ci73E8=;
        b=Y0TqqrvXtQYXyUPXagUr6LBMsj91exuEzLRnovzvrJBLx2xnImhOb+bm4wBdkwQgaB
         3UFg4QqBydQMFlwmSrCcdoiKYko8MSKhXxdG2ci9N5BKpmq7t2cxPeRVurwtMw3498bZ
         yn+d5XBqxtQ9JUj5tk6uA+ATP+oEXgQ4y5lFWNcX/ujMfVEAnC5pT6OWW2xOMiyj4638
         0laPuwUgbuqLOQo4zgjT0izM1Nsg6kp2Dofd0jeJK8MjPnxc8x0RwWuFiGFqGNSuy0RV
         X87qzZE6UMERJw4+fPFDK4AD6nzlD3Qmipx0Bfq1bdQGytjeLi62uPfgtRPLipGKC6WL
         T2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680962590;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hb84xjZS8wZm3kthqKZh4HcgllDDIHrKkBqM1Ci73E8=;
        b=A24C8tDmARJveaGCbJMwL/vU3YshVq+lx0ATVZoKsnwZp0PLwj6lKIAl4Hbl0WtgH9
         qgERU4dRql/ZIvXfRTAM+k1YjjJJd/GdSIVF1dqpe7qgiQ9tlafUMKuXwgYZB0U2RCwF
         m6lnjrZgUqEfoIqhdiG5TZ3z+CF24x8lnK1A/3kJfnx2tbqiKHQxlyuUBXAfbzRZtQuG
         9jy8W9iZmbiaq1UPU5oEO1YvIpbRYb0+szNkx0mgnZNkpjahYyJRI+ceWpfNedKkN7iP
         2Yion/DPzZpb/E66sHxIbcseshSQuD2RG2hbK1LijsJI7jV3Ie9ZAmyxthl6TYMzBmm6
         Q6eQ==
X-Gm-Message-State: AAQBX9fQdOgCnwE7GdRRXaRid3ck2jyJcpswstuImXyaAC7nukoCRJcH
        30Lxs9L8QthlZDrI/LTPNwEx3A==
X-Google-Smtp-Source: AKy350bxXkQ5zdlyDMQwb1YTGvBPpbcoZxf2ESx7cYkVM6C5RtfwLt1ZgPFLBt4LvoK4feXU4Y/z+Q==
X-Received: by 2002:a2e:a314:0:b0:299:aa15:2df6 with SMTP id l20-20020a2ea314000000b00299aa152df6mr1550315lje.11.1680962590680;
        Sat, 08 Apr 2023 07:03:10 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id n22-20020a2e8796000000b0029573844d03sm1273398lji.109.2023.04.08.07.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 07:03:10 -0700 (PDT)
Message-ID: <4757c33c-7e71-262d-a51a-c5f9fb53ff41@linaro.org>
Date:   Sat, 8 Apr 2023 16:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom,gcc-sc7180: document CX
 power domain
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230408134820.76050-1-krzysztof.kozlowski@linaro.org>
 <20230408134820.76050-2-krzysztof.kozlowski@linaro.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230408134820.76050-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.04.2023 15:48, Krzysztof Kozlowski wrote:
> The GCC clock controller needs CX power domain, at least according to
> DTS:
> 
>   sc7180-trogdor-pompom-r3.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
+CC Rajendra (author of 5d6fc6321db1 ("arm64: dts: qcom:
sc7180: Add required-opps for USB"))

Rajendra, shouldn't SC7180 GCC have PM ops to make sure a vote
is only there when AP is active? Are all GDSCs powered by CX?
If not, wouldn't this also need power-domain-names to
facilitate e.g. potential MX-powered ones?

Konrad
>  .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> index 06dce0c6b7d0..8bf9b6f49550 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> @@ -32,6 +32,10 @@ properties:
>        - const: bi_tcxo_ao
>        - const: sleep_clk
>  
> +  power-domains:
> +    items:
> +      - description: CX domain
> +
>  required:
>    - compatible
>    - clocks
> @@ -45,6 +49,8 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
>      clock-controller@100000 {
>        compatible = "qcom,gcc-sc7180";
>        reg = <0x00100000 0x1f0000>;
> @@ -52,6 +58,7 @@ examples:
>                 <&rpmhcc RPMH_CXO_CLK_A>,
>                 <&sleep_clk>;
>        clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> +      power-domains = <&rpmhpd SC7180_CX>;
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
