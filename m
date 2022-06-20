Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23159551726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbiFTLRz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbiFTLRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:17:54 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDEE1F4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:17:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cf14so4868390edb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zjuWH14e+wkxD4w1B0aCkvtXZVcRPQ+N5JlQKPQ7yO4=;
        b=wYLnqVqi6eog/f2TRRPDq3XpURiiDOL2Pt0BiXeydcY9d5SSQSwzxY1z2f3mdzL+/V
         HlBehqrJ+R7SnZ9RN4mQnmzDqeNbnLBVcWRNz1D6Foto9GiKa71pFc9Spcet55zcHfaO
         e2akv2qNyNs6nqvuvjrpOQVGRxS/M8OznzC4cuek4KZktb7oLaryOcpk+PF1wkGzAYEq
         d61wKSvkuOOUDduHoJTyTJFKK3VZ4U/zmmDbDAQJ9tOVRHnz7PfmDLjmE5B+5r3uzClj
         HOQ30GpG61zk5zttA6aGAbYzNKiKBEbtulg1k4vJ6rR2gPAg9UUHubkYuXge7miWMjln
         eTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zjuWH14e+wkxD4w1B0aCkvtXZVcRPQ+N5JlQKPQ7yO4=;
        b=UoR2PpimfM115SSSbwVLwVqevkVg7HJmAxwtyyCeQ3ARC12/MvYaJTIRbL6hgoLhph
         Huq9p98M21Vfa+0XBhphw+35s2miuwybuJvEGs3RScoVR5T3aq2NUpY1I1MQJsYSMQzy
         RRC0qX4uho6RpnrvTZlkzHsOxl6HVFHE/lPl8C8MDPxSyk32O/NkrjyfCUy06w7LxXSQ
         Wcf05aTs36xMLMRAL/0xA4Cdc5QU+b2fQezrvIyT6pxgcfyl5V2qyfTC9gjMXulnsF1e
         P46cT6B9rVUUWfPwx0j12ge4U+MlGh8NrCKWd8J52SqnFbqzGWxdu/HGaMxDet+Kg8T8
         crNQ==
X-Gm-Message-State: AJIora808bhiQ7kIXBnsKESXqb6h65+pXNvS+2qgoEaPnTQ0WrqBW6YF
        t9uZY0yw05dQY/yWhzO/qBvULA==
X-Google-Smtp-Source: AGRyM1txLPDS2zR8AMZHJ5dJXYBtaJsOP88Tw63VDgO1PL/uodgjAH6YuMwdQ8jo2QsNxlPs2lPkRg==
X-Received: by 2002:a05:6402:201:b0:431:665f:11f1 with SMTP id t1-20020a056402020100b00431665f11f1mr29548937edv.378.1655723870339;
        Mon, 20 Jun 2022 04:17:50 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g20-20020a1709061e1400b007025015599bsm5792645ejj.214.2022.06.20.04.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:17:49 -0700 (PDT)
Message-ID: <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
Date:   Mon, 20 Jun 2022 13:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 13:07, Dmitry Baryshkov wrote:
> Add pxo/cxo clocks to the GCC device tree node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index 47b97daecef1..61e3ab0ebfd3 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -50,13 +50,13 @@ cpu-pmu {
>  	};
>  
>  	clocks {
> -		cxo_board {
> +		cxo_board: cxo_board {

If you touch this line, please correct the naming for node - no
underscores and preferred some prefix or suffix, so:
cxo-board-clk
clk-cxo-board

>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
>  		};
>  
> -		pxo_board {
> +		pxo_board: pxo_board {

The same

>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <27000000>;
> @@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
>  			#power-domain-cells = <1>;
>  			#reset-cells = <1>;
>  			reg = <0x900000 0x4000>;
> +			clocks = <&pxo_board>, <&cxo_board>;
> +			clock-names = "pxo", "cxo";
>  		};
>  
>  		gsbi6: gsbi@16500000 {


Best regards,
Krzysztof
