Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A944967E4B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjA0MKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjA0MK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:10:27 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A8E8D0BE
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:04:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id x10so4509003edd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXd1Cay0PuoVNLquWy4+5A9Hje1OZ6HIZgO3KYLNKCU=;
        b=EM+BulHUseAsmgsDpFK679ddP8Z3AeuM8tLmktr0DE2abRVZJ5wKMKNsz/nK3VPE30
         OHzifBu8lcuElJLZ/r83ZfXSGbz/jju0ZVtRUuyOodRDgKYRUJVg3dmfiVfNWyqrSvpB
         Vhyu2yeRGICk4vclE5hwkNNByXgNlwuDEHwlaD+n5oYnkWqIBkDPYKPqmnW8l4vBli1y
         jRkIWbUUIFh5eIHXaIBIBByJk7zDU7ESsYtndEVGMKz8BBWorqXSuhHZq4Kysc314DI7
         wWUFay+YPLrKHhMn3KMex813AlP9Q25mxEHDb3rI11K6+kC6SuquhPHXrjKZVaHQHIfJ
         sChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXd1Cay0PuoVNLquWy4+5A9Hje1OZ6HIZgO3KYLNKCU=;
        b=Xk7dqR0VTyf+WXphtYYjihh69hMsEI/HrLpKZmb6RsrFTDV55Y9P+X5h3Lpb10fFKq
         hqhP8AB/P/r7T4uuYCuEJ7BfPa42qn5lGBSUVs8zgKDfK8A7qCrT090WQ0zdzu4bH98b
         Lu71OFuSJAuxde5SPb1Dkoiw7OpKseZdZPW/QFCSPSVYxFcuaxYpFifp2iXnmh8p6UuF
         3UHvb4YoSjKR+BBX5OkSag7QOKHSY3EYfk0vn/16AL78PTsqxoa154B8EVbD0CL9RzfZ
         CXlWrSMo0gYSxUZSz5R/UixMYnAbqe7QkVV9NEsEFmOcgse7VP4C4hfKuNybgNxuGrKh
         vsIw==
X-Gm-Message-State: AO0yUKX73tf1DU9Q47OOzoPdWzMDCwzpT4IhVy3DbQatc3KW2aAUp9s+
        ZNt0Oh/MElPATp3zFjYa+e/JKZ+CbG/sNgwW
X-Google-Smtp-Source: AMrXdXs1krk+6o/FfFny7AmBPlSTXvn2eo0l3icgMKTakzX2LZT41di38a+DLnWs8FhhuiSaNmhY8g==
X-Received: by 2002:a05:600c:4e16:b0:3db:15b1:fafd with SMTP id b22-20020a05600c4e1600b003db15b1fafdmr32933179wmq.24.1674820175891;
        Fri, 27 Jan 2023 03:49:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c2e9400b003d9862ec435sm4075479wmn.20.2023.01.27.03.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:49:35 -0800 (PST)
Message-ID: <9f4666db-9b0b-77d4-e02b-708c2a1ebb4e@linaro.org>
Date:   Fri, 27 Jan 2023 12:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sm8550: Add USB PHYs and
 controller nodes
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
References: <20230126131415.1453741-1-abel.vesa@linaro.org>
 <20230126131415.1453741-8-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126131415.1453741-8-abel.vesa@linaro.org>
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

On 26/01/2023 14:14, Abel Vesa wrote:
> Add USB host controller and PHY nodes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---


(...)

> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8550-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&rpmhcc TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "hs_phy_irq",
> +					  "ss_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "dp_hs_phy_irq";
> +
> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;

This is not accepted, so far. Can we drop it?

Or revive:
https://lore.kernel.org/all/YXcBK7zqny0s4gd4@ripper/

Best regards,
Krzysztof

