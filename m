Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B41660084
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 13:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbjAFMuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 07:50:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjAFMuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 07:50:16 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32C7714A1
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 04:50:14 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso3443348wms.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUIS6SmkysnB3UXQjFumo6hNyNDdSpsyP8yE4FP7S3c=;
        b=MDQeyJ3SboTHYR0T2xJeuCrx0MPDfaPZLFtJR3xeiLajG6gfgoNAY8lLj5Es3+HCPd
         o28yrWtGd+/kYk2k0lRnmZkgV1+AOsTwTKi/ZOcks1Oc3nNSjdvYpXDn+7mSsdFGrq1G
         /xWB6zxiLE/6GBSqjkWl+/WmztMWCcLVTOYi5+1++RVZ6bvkxxOf60RbpVMEZy5hJBVF
         eBGLyooten9bxs1atVKDeZPCdgi8OqvP0yhOJ2K++RzXw7slW5vZOhtkT/cx3eHgZHif
         cR+fz+Gj0XhDF9HB+tmnFef5Vq07r7nbi+QI9jEpxQCt/SPesT+7SB06nmoVdADiEyUD
         zGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUIS6SmkysnB3UXQjFumo6hNyNDdSpsyP8yE4FP7S3c=;
        b=z2vEBIRCn7x09R+HlIIey2lQQxuWgDW5ZQvAy23Xd2z6cAJpBnvypTn9K9GMB9F02O
         ljH74ZtJW+TyNNLKXnipT5V+/8shCm1I0mA4IGbgihBa+u1maqvTmFkEI8r/1s33FwUb
         J/S5IR9BHksQpBo09Y1L+UbSiwG/Xj5PzD4qwm1l/k5PaGVDiXddsOluWIMhzqK5Cy9X
         tu3rH0jUpFLqgDEO+5YvuqfJMElLdI/1tV8bt3iHwhJI5UGzQ7Sx7qOso9kABnof+qIo
         MdMAYsA5+A+Ecm1TTo9BKQIB4In4sl2iDb8nJFiZ5STqbBibzDzwWxvKvzhpGxBnwigp
         nKmA==
X-Gm-Message-State: AFqh2kp9sJ1lngL83lMEqCho2dxNQXhPqkIkNRwI3671eHto63GbzHpm
        wz/ejLLhwuyEHYA0IwvUvwY6eQ==
X-Google-Smtp-Source: AMrXdXtqZk9mS3V5EE91ZCbC1GgkN8SNyLeAxaHiDHejYWYXE8w9b0h0uK3rG2IAumFpD4/pIexVbA==
X-Received: by 2002:a7b:c447:0:b0:3c6:e63d:adaf with SMTP id l7-20020a7bc447000000b003c6e63dadafmr40049807wmi.31.1673009413606;
        Fri, 06 Jan 2023 04:50:13 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b003c6f1732f65sm6779760wmq.38.2023.01.06.04.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:50:12 -0800 (PST)
Message-ID: <65eaad51-c64c-b3b6-850a-9e988d29fe80@linaro.org>
Date:   Fri, 6 Jan 2023 13:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom,gcc-apq8084: define
 clocks/clock-names
Content-Language: en-US
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
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
 <20230105134133.1550618-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105134133.1550618-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/01/2023 14:41, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the GCC device node to be used
> on APQ8084 platform.
> 
> Note: the driver uses a single pcie_pipe clock, however most probably
> there are two pipe clocks, one from each of PCIe QMP PHYs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-apq8084.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> index 8ade176c24f4..732b6770b46e 100644
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
> @@ -32,11 +56,35 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    /* UFS PHY on APQ8084 is not supported (yet), so these bindings just serve an example */
> +    #define UFS_PHY_RX_SYMBOL_0 0
> +    #define UFS_PHY_RX_SYMBOL_1 1
> +    #define UFS_PHY_TX_SYMBOL_0 2

Use numbers in example instead.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

