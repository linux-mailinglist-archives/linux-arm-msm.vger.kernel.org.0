Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C60567B0D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 12:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbjAYLOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 06:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjAYLN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 06:13:58 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E4858662
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 03:13:47 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so979535wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 03:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azSPw3xKSo7B7wtu20Ypk0qIeinHqT2sve8f6K2slzY=;
        b=laTv96FmGN2CDnMnNgZcThObgd6kGayNKDk5sXPbWY4MlJ8WLZQQUZ/HBZHRlrYwTb
         ngfPj1aP2sq0OwMr8YxypQg/JfRyQHeBBmQmjt81FRPYsG6fNkufWBRb2W2dhF9T+yjb
         Xfur+XUoinDZOLhJuYmKxRxzvP6bKIXQEyF4j4YhQMk8Kdh60FXrFFWoesb3sm1KT9pI
         c5u+GQGEsfxQWk4QKSE+wrA05wedUJN6cW/ePldUoVaEOm/O2MfkJ8jw/ckoOLbMD1iQ
         Ry9DA2Uf0nMc2iQWVDw039CLCPo9L6GbynjpeAn0PljjXOetj0I3C/gsvu7eni4sUKzJ
         mlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azSPw3xKSo7B7wtu20Ypk0qIeinHqT2sve8f6K2slzY=;
        b=VRvdNSEEgrfXTCULyQOa3RjsUn1KUxe5/9Zs4GsKprlYYmJQr0ts/6UulW2UWsyBBw
         sk+qouuKURF6fsi9VeroGLL5tXUQaRyE9aFRVTw5jXI4G/86yDApArG7Kp4jF1zU/Iv9
         U7V6/b4YnZAzrwR9rq1SA1bOaDwnPU4uc/iVbIEpsy2KsYeeoSqzwD7gSbhrGt+JzHv0
         rZATS7IXrXkz515g+vdALEAL1l1S7pT1173rSnZXpq+H/KwpM6uTcwsBeEcikRapgK4W
         MsICvFZ4sC1kI01cMfIv+F4vNrPb3Jx9REMgobjEsFUeBpGcoPtT6L/6AtNYbTW1jZbt
         K76w==
X-Gm-Message-State: AFqh2krZNg7SCDtWncArVr+saNOpOXlhv+Asb11SA8NPz2qXAEnDJeNQ
        ECIDXsvY/82DsSJ3hKfWrQoHsg==
X-Google-Smtp-Source: AMrXdXv/ioghEmSSNlplJGgotjqdQ9osMujFVj2dNQKJWKJWQejUfnANRvec9R3Rbg8+lTOoQBkHxQ==
X-Received: by 2002:a7b:c45a:0:b0:3d1:ed41:57c0 with SMTP id l26-20020a7bc45a000000b003d1ed4157c0mr39148591wmi.30.1674645225637;
        Wed, 25 Jan 2023 03:13:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c5457000000b003da286f8332sm1380553wmi.18.2023.01.25.03.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:13:45 -0800 (PST)
Message-ID: <ccddc46f-b007-4e0c-9c1f-df2c13d459eb@linaro.org>
Date:   Wed, 25 Jan 2023 12:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 04/10] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230125104520.89684-1-quic_kathirav@quicinc.com>
 <20230125104520.89684-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125104520.89684-5-quic_kathirav@quicinc.com>
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

On 25/01/2023 11:45, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +  clocks:
> +    items:
> +      - description: Board XO clock source
> +      - description: Sleep clock source
> +      - description: PCIE 2lane PHY pipe clock source
> +      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
> +      - description: USB PCIE wrapper pipe clock source
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +      - const: pcie_2lane_phy_pipe_clk
> +      - const: pcie_2lane_phy_pipe_clk_x1
> +      - const: usb_pcie_wrapper_pipe_clk
> +
> +required:
> +  - compatible

clocks are required

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@1800000 {
> +      compatible = "qcom,ipq5332-gcc";
> +      reg = <0x01800000 0x80000>;
> +      #clock-cells = <1>;
> +      #power-domain-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5332.h b/include/dt-bindings/clock/qcom,gcc-ipq5332.h
> new file mode 100644
> index 000000000000..a305c648b724
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq5332.h

Filename should match bindings/compatible.



Best regards,
Krzysztof

