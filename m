Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCEF700D7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 18:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjELQ6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 12:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbjELQ6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 12:58:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B84D041
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:58:11 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94a342f7c4cso1831487766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683910690; x=1686502690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrRZy7k+hmkP8Lh2Yg15UQkRzZXm3nQe96En0tZmJVk=;
        b=EqMoIRhrmVeXCNMWfkwK41ZjdYG/lVPlDVRRQoVS+0hToVID+a03nbL9URFXFRIXc2
         T0mj1y4KoExpfH2ZdS/cPnZ4UD7ECvsw/zEKt2/lkEN42ZB3sCPDiepJHXW71otQUB/P
         BtChxmqWB8MQbrPApetkyW1b9R4dU84j/Ei5iXvJ5l+8ECaa9EYdAMBXpz4ZvTtI/zyf
         FdFhNhfbKdfyQsDTvu/glrDUiK05i5IJ50QDJ5Ng1aM8lEa66HNi3wYQicnE2iGu1m4z
         hZYHAdMJzOIT/iy3sOrvyggl3WNoyU5FFxELfSao7aiQoppVG4K+G7VY9QVM3mTSHidw
         0A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683910690; x=1686502690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrRZy7k+hmkP8Lh2Yg15UQkRzZXm3nQe96En0tZmJVk=;
        b=a7p4gshNje1Tty+wPa1BIL9oz6n8vUq2YBWtPANZSpFa5q/Xg3KdFY1rZ+cd/zDjRF
         pco45SbIRQY8eCFERE+uihqZRDgYdqa8jYS6fZvEpHTevHal/twFvGhORaJ2F9NzieoR
         iWUvlAQ5dAnKc5F+t/hvkrKISI5WlnstinsrPaYgM2C1/rQ+4puEk6tFDJzxxJ5Z2M/q
         Zs1ctVccRwp/TCM9ECZFN/rH00IZR3hkjh1BthtwF+N07UebVm05YwoLOj0XyqhrEVXI
         ia5fEYNr2YdJFQY8M6m3TN84Xg7ilAVj0emICgjTr4kuKQNtWLyCETHm831j4JJJctlP
         jOAA==
X-Gm-Message-State: AC+VfDxBHbv6VpZj3Gox4I/I52DJzJBj2MfQ4NABnfz83hgEtcI0Ba/T
        v4jkOdLkbEOIvdLXZRhSN1u15g==
X-Google-Smtp-Source: ACHHUZ4lobmym7CtlyCou9QfIUS9xOfNDTTYSye6rra7MQiJSJ/zTzraaCZsx976hm7f2OIZ1vQRMA==
X-Received: by 2002:a17:907:5c5:b0:959:af74:4cf7 with SMTP id wg5-20020a17090705c500b00959af744cf7mr22337129ejb.70.1683910690031;
        Fri, 12 May 2023 09:58:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id v16-20020a170906381000b009545230e682sm5630387ejc.91.2023.05.12.09.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:58:09 -0700 (PDT)
Message-ID: <576327d2-14e0-36fc-a758-660cdcacc340@linaro.org>
Date:   Fri, 12 May 2023 18:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 03/10] arm64: dts: qcom: qdu1000: Add properties to
 qfprom for multi channel DDR
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230512122134.24339-1-quic_kbajaj@quicinc.com>
 <20230512122134.24339-4-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512122134.24339-4-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 14:21, Komal Bajaj wrote:
> Add properties to the qfprom node for multi channel DDR.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>

DTS goes to the end of patchset. Better - to separate patchset with
links to bindings.

Subject: drop redundant pieces, it's too long without actual need.
"properties to" can be skipped.

> ---
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 734438113bba..418644f396bc 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1333,6 +1333,18 @@
>  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>  			multi-ch-bit-off = <24 2>;
>  		};
> +
> +		qfprom: efuse@221c8000 {
> +			compatible = "qcom,qdu1000-qfprom", "qcom,qfprom";
> +			reg = <0 0x221c8000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			multi_chan_ddr: multi_chan_ddr@12b {

No underscores in node names.



Best regards,
Krzysztof

