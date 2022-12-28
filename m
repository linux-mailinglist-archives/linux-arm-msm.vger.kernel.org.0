Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B129065754D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 11:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbiL1KaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 05:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiL1KaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 05:30:20 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3198DDC
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 02:30:18 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bq39so15260508lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nPSbBF3msVMuWzevYV4EugkSSaHkMBJx9fPUzPBtfk=;
        b=PRJaWoaVlCs0q+DnquL7DYvFahZ1m04vbvJKPAYE6b2a0CXt631NmaqQCPYoM9zkAS
         Hyj2vu/xuq9mydT2ICDMfvuFm9c3xcsd/J0KZLG2PQUeSniterC048diZvcj/GxCy7dw
         0g/2C+dsKYvhnBK8k+CozC9n1YAg3qx6/Yr7T/ZxXSE81tTEBNJY0YvK1hOjxghpSX6p
         O0R720UGrywxkhsps//PiCGwmSO+lSTaO1rnfGn2DB/gllZDrwVcc5JQwjnDv8a0BDRE
         gzh1ZYRZphpKdjj7I6Tccgr2RrEHkz1Fi9txwm5Sv1fGQUvHFKH6fSWdnQLIaONFfJoV
         R8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nPSbBF3msVMuWzevYV4EugkSSaHkMBJx9fPUzPBtfk=;
        b=UYOqJVr7Bjp4V0qxXg/IsVVlHYEPrgglBgYesA5ZT7rC7KPNDe/5IVmNuNAubTFpiA
         zHwBGjt2cyCDyKUS7ex6yWLMj2VndryjFKDMckIiLdaeXuywIYAzITqpw48mInNqU+Xs
         yRBx/UqAHMg3uF/PHaMkN3lPWF4lwBKdnMDv3W82BcNSAdWaRhBZgvak1/o3+CwJEZlt
         rLlMDgBHyJdz/qRHqpriUW3oMvrGc4wVYLTYc1AlD29ImAKvzCZA70FNDMqRz0d3aAEZ
         D/v3xr1eqh7GtCF3sRMnp9jcMVNsMV+NrOJR+UJraYqESoFw6emVQiNWfW332AzqUewX
         nlVQ==
X-Gm-Message-State: AFqh2kpIcYOTLjOIx/qY4Xd7JkMf53L6H31PTeFIvilyskQO693PK8Me
        aUrsS1GSGAFcLNBaJbXLfbIekw==
X-Google-Smtp-Source: AMrXdXtXxdaNvh4g+EtYDpLxYoj0OiScsVjPE6/B/8gnSnJkB7/VG0EiuChkO0RcO3ZtiraZXg3ZCg==
X-Received: by 2002:a05:6512:3901:b0:4a4:68b7:e71c with SMTP id a1-20020a056512390100b004a468b7e71cmr6832469lfu.6.1672223417287;
        Wed, 28 Dec 2022 02:30:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l28-20020ac24a9c000000b004b50b4f63b7sm2593666lfp.170.2022.12.28.02.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 02:30:16 -0800 (PST)
Message-ID: <262fb9c4-c7d3-989f-c3fb-3e36da26b081@linaro.org>
Date:   Wed, 28 Dec 2022 11:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 01/12] dt-bindings: clock: qcom,gcc-apq8084: define
 clocks/clock-names
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227013225.2847382-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/12/2022 02:32, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the GCC device node to be used
> on APQ8084 platform.
> 
> Note: the driver uses a single pcie_pipe clock, however most probably
> there are two pipe clocks, one from each of PCIe QMP PHYs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-apq8084.yaml      | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> index 8ade176c24f4..02a856f14fbe 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> @@ -25,6 +25,30 @@ properties:
>    compatible:
>      const: qcom,gcc-apq8084
>  
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +      - description: UFS RX symbol 0 clock
> +      - description: UFS RX symbol 1 clock
> +      - description: UFS TX symbol 0 clock
> +      - description: UFS TX symbol 1 clock
> +      - description: SATA ASIC0 clock
> +      - description: SATA RX clock
> +      - description: PCIe PIPE clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +      - const: ufs_rx_symbol_0_clk_src
> +      - const: ufs_rx_symbol_1_clk_src
> +      - const: ufs_tx_symbol_0_clk_src
> +      - const: ufs_tx_symbol_1_clk_src
> +      - const: sata_asic0_clk
> +      - const: sata_rx_clk
> +      - const: pcie_pipe
> +
>  required:
>    - compatible
>  
> @@ -38,5 +62,24 @@ examples:
>          #clock-cells = <1>;
>          #reset-cells = <1>;
>          #power-domain-cells = <1>;
> +
> +        clocks = <&xo_board>,
> +                 <&sleep_clk>,
> +                 <&ufsphy 0>,

No IDs available yet?

Best regards,
Krzysztof

