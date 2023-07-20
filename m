Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7723775A9C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjGTI5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjGTIoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:44:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59037269F
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:44:08 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992e22c09edso83064066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842647; x=1692434647;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXmQdUSwiEfCeL+TuIOj45mHUtMHTIiqenNRIQ+67SA=;
        b=qFVkXUqOOwTKp2x5hPUx9qm517YCGDqbSztEMSIDzBEAnSmAtIURzG3MZkyK/UNgio
         fSVSgfYdZYKa5t49AcwqEAQJN2PL9RMivXWdoWLrqSmB8AbMwDNjhwa7/pRXv3+L8LMR
         WTvWO7MplpSLjeX4kazfTYjPWufJkz5WXMbFwP8oz8ztOgvzcxFSqAWXA09eVZwNMW22
         +jSgVFvMCTa96XWNdnWTLXj68vbEbEuYLwsc81CTDCr7QCDTB+MlR9PU7B4HFpMmKDrS
         4P/jocRhTkcGjGdokjOI95C7B4mTxyCLo6UfZKyXXG0OiD/fC7oPnjphFZpVaOD4q0z3
         E0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842647; x=1692434647;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXmQdUSwiEfCeL+TuIOj45mHUtMHTIiqenNRIQ+67SA=;
        b=ZMrERfw4mEOpYAEcfVozKDxUhcpRA406Qnbxka8jF+8Uoap7/ZRJN1MjNBSJUeKFpb
         q7fOLaikUrvDCQSRS3kKGwRgM0wiGMx2uRuJHRsEqNARgRqf30z+wvGClB1t4SJQWpIB
         VxEt1uJhNOTNOkEAsqSL33+JcrxVfQdGswunD4AZmmng3zOT+/oAe1riS5bkt/8KCN+0
         +06li7QFgELZT94br/Dd8HfNp2WsRafrmwQp195hsLjpX8d+ptDIKfHJTjI/Y2/R4Qvv
         /QtSNI5Dl6wVw+6AoobS/bSPSxmxg9JQFmsXgeU0yODoteJP0kXMR2KXoEc0UN48Xpqa
         t3Eg==
X-Gm-Message-State: ABy/qLZM1lk6ZF6swM0YEHQOxkFHapxe8LcWI5zMkrBVQpiIrtplCp3H
        eZ4CTW+2BcRZBS7Fi8nkfS+gRQ==
X-Google-Smtp-Source: APBJJlGCXyIDr7nOu/YXOOqrS/2UxOod41KmJxihYP99aWkTW7XDf85MKrLzKtCoVvpT2DMA9KwTTg==
X-Received: by 2002:a17:906:10d2:b0:98e:16b7:e038 with SMTP id v18-20020a17090610d200b0098e16b7e038mr4431998ejv.23.1689842646835;
        Thu, 20 Jul 2023 01:44:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rv7-20020a17090710c700b00993a9a951fasm376950ejb.11.2023.07.20.01.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:44:06 -0700 (PDT)
Message-ID: <53721566-2a85-76cb-a4cf-2819f08dfc85@linaro.org>
Date:   Thu, 20 Jul 2023 10:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v11 5/6] arm64: dts: Add ipq5018 SoC and rdp432-c2 board support
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robimarko@gmail.com,
        andy.shevchenko@gmail.com
References: <20230616101749.2083974-1-quic_srichara@quicinc.com>
 <20230616101749.2083974-6-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616101749.2083974-6-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 12:17, Sricharan Ramabadhran wrote:
> Add initial device tree support for the Qualcomm IPQ5018 SoC and
> rdp432-c2 board.
> 
> Few things like 'reboot' does not work because, couple of more 'SCM'
> APIS are needed to clear some TrustZone settings. Those will be
> posted separately.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Co-developed-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |  72 +++++
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi         | 250 ++++++++++++++++++
>  3 files changed, 323 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5018.dtsi
> 

NAK, please do not merge.

It turns out there are some problems here (pointed out by Hariharan K).

Best regards,
Krzysztof

