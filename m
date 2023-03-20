Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9C16C0E86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 11:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjCTKSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 06:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCTKSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 06:18:15 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB9511E8B
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:18:12 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so44513209ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679307491;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9QmThArlU3j/do0x0/HOKynN3iklRKOHG46pnLsnHw=;
        b=cfKIOkAWt2qSqihZu+iJRamjO6lMQhnDcRYEV6P8j561vRc+Apj+CESbo74m4MU+20
         z9OBbShtAEkZXCjwdfPwxH/ywg1w5QPwP9bau6B9z4Q/oH49tCRBl8T+BkWeKhLPydnM
         lnzyhQdu7Vb9qPzNsdiq1JFCZoZzQO4X8acut3VxbpUKfcKZuLNLV+0Z3L5DqNDZ+xsK
         JnHhYXCM5S9UEVNvGNen4IMgdSyYhxc2QKDgIBv0N2CAk6ckjDpirwCHmctbEqCf1bmS
         T/4zDrlak6vMHplZHupoUBnpvz8So809N2GkYn2G45EMTc8ETGSxAl64KotQ1g3KGbwp
         8/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307491;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9QmThArlU3j/do0x0/HOKynN3iklRKOHG46pnLsnHw=;
        b=05DhqE1H65688Wxx0H+4n2zv0iHq/zABJ5C4hWA7/eS7pV6ndm18WFlX+ERsdif6+E
         oOpjs7WD0X6XzuZJQkX3zfVDkZMd8WuCP29l0R/qejH1sgJDNzn5jKswvB8QuEq5gH8M
         pyiUPVc5Ic9XdOJHuzX2IAIiSBYXSK3guzGyUEaM1gTvnlnvzh25jORdmrwtHh/a13BU
         AVTbwfi1jkm4KIk8sk6QB9zktZZtnQj5LwAlvRaL5C0NfIulG2XH3ZazuzhyV9qeU2WX
         Tavxa6Qd47zbH3qOpjsRanFWIaxoCV6K/FWYjGHNyD33010LTbOZ/QuCNdINrvO8VrAk
         slqg==
X-Gm-Message-State: AO0yUKX+8M3CeeZAdSfTnInyTOlvAac/bP6scgAjqxhXhDEVGoMhOVDM
        SWYuqJk6bHZdLQ/R2ALFlU3B5g==
X-Google-Smtp-Source: AK7set+TovgWorTvh0ACBLoB6PXtYdY+uBaQ+fhbXWNdFqjwNLDcjjjMwN+Ujio9D2J6NyIVvckFig==
X-Received: by 2002:a05:6402:12c1:b0:4ff:844a:ed4c with SMTP id k1-20020a05640212c100b004ff844aed4cmr12664996edx.0.1679307491486;
        Mon, 20 Mar 2023 03:18:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id o2-20020a509b02000000b004faa1636758sm4633214edi.68.2023.03.20.03.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:18:11 -0700 (PDT)
Message-ID: <713745fe-4963-6008-89b8-f0fb68c8056c@linaro.org>
Date:   Mon, 20 Mar 2023 11:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5332: add few device nodes
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230320094450.8015-1-quic_kathirav@quicinc.com>
 <20230320094450.8015-3-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320094450.8015-3-quic_kathirav@quicinc.com>
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

On 20/03/2023 10:44, Kathiravan T wrote:
> Add the nodes for QUP peripheral, PRNG and WDOG. While at it, enable the
> I2C device for MI01.2 board.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts | 14 +++++
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 67 +++++++++++++++++++++
>  2 files changed, 81 insertions(+)

Thank you for your patch. There is something to discuss/improve.

> +
>  		blsp1_uart0: serial@78af000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0x078af000 0x200>;
> @@ -201,6 +218,48 @@
>  			status = "disabled";
>  		};
>  
> +		blsp1_spi0: spi@78b5000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x078b5000 0x600>;

Please keep the reg as second property, after compatible.


Best regards,
Krzysztof

