Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA5D506718
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbiDSIrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 04:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344465AbiDSIrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 04:47:10 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849E421250
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 01:44:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bv19so31427855ejb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HrN9VciOvo2sc5NJIuqyZBPpfFZgYTc0TLFG16RyFkM=;
        b=IElnTneLI0bfJg3GlhBDl03tsabIYpTQ1rdHHYDzm+y9X+cW9vZsvI1+9AEy/xmm45
         0LGL1Mbp5MHXoR36lTew7pOWcnkfYRzC6j4fl4Nhnmq7ewCyDoUB81hmq4zcTNZOsZfm
         ucZ5nvME2xR9YO/YzfJIypZ8gj1Thq7FjiqjiZIRwhxDrSDumDV+XrV+xq4e29j2xvzM
         vAPj8K9yGzd4IuuPySK9CC12JCLspYDQvVGF370rqEU0yqhQ256wd3te8SRHIlQZCo21
         hb6MvCR0yorZNqbZkHP6SO9YVS/OHf6HHhJibWeauwxtTDVeMfALpopTCM66UTdORSXi
         a2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HrN9VciOvo2sc5NJIuqyZBPpfFZgYTc0TLFG16RyFkM=;
        b=RBNhpZXhirbZAB2Tf2QV9o18fq+B5RFrZ9AmrcYxnacNX/NggTJaZyvqrEoQrzx/Au
         9olZ/mELvuIhiIK65LNM3exduB6LgdyMWdipBy3g7CcFdhrdNB2aPAlMy1XmxT9qG0Xl
         vqq7p5R4mx3v0xpWqolM01Fz6V1fMgQt7sBrcjDFktgRDPn9wkxGl5n9rpb3iQls04YN
         H9A74POVMKEg9P7mVqOHZu9lbn4cMmxazLR/SD+4+wLw9hyLlHOHFw1huTXVJMyWNLxt
         YiMT4xWz77jmkwBISOt0hDJ75y+nPeIMoyOhnL4V+K322ndmMlRuyGqTQr228c1N/Tvz
         l/yg==
X-Gm-Message-State: AOAM531mRz1KIaZaAHZuDfwaYa9033aJXzMYfnF1aA+adTZl2H6CD9lg
        6+UVyJtifl+FaSFpHTSDLkX7hg==
X-Google-Smtp-Source: ABdhPJwkDYHLrEVt9DCzHMZ8WzRAlgm3uabio32FY7R2bwJv+YypvefSQnDPWeKnwNalpiz531d4KQ==
X-Received: by 2002:a17:907:9713:b0:6ef:a8a7:14ce with SMTP id jg19-20020a170907971300b006efa8a714cemr8137060ejc.534.1650357865036;
        Tue, 19 Apr 2022 01:44:25 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906520f00b006cd07ba40absm5410044ejm.160.2022.04.19.01.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 01:44:24 -0700 (PDT)
Message-ID: <c7db1dcd-19df-eb94-a49c-4ab75abcf4af@linaro.org>
Date:   Tue, 19 Apr 2022 10:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
 <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
 <f3d50cd9-6b41-a5df-0ccb-b4d02ae5c66a@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f3d50cd9-6b41-a5df-0ccb-b4d02ae5c66a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 10:30, Bryan O'Donoghue wrote:
> On 19/04/2022 08:33, Krzysztof Kozlowski wrote:
>> tx/rx. Please rebase on recent linux-next and run `make dtbs_check` and
>> fix all the errors.
> 
> I did do that, it didn't throw up any errors.
> 
> Must have done it wrong
> 
> Thanks for the review


There are many, many issues:

arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@100: compatible:
['arm,cortex-a53', 'arm,armv8'] is too long


arch/arm64/boot/dts/qcom/apq8039-t2.dtb: idle-states: 'spc' does not
match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'


arch/arm64/boot/dts/qcom/apq8039-t2.dtb: gpu-opp-table: $nodename:0:
'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: thermal-zones:
'venus_camera-thermal' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: soc: hwlock: {'compatible':
['qcom,tcsr-mutex'], 'syscon': [[53, 0, 4096]], '#hwlock-cells': [[1]],
'phandle': [[48]]} should not be valid under {'type': 'object'}



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: soc: codec: {'compatible':
['qcom,msm8916-wcd-digital-codec'], 'reg': [[124895232, 1024]],
'clocks': [[49, 154], [49, 159]], 'clock-names': ['ahbix-clk', 'mclk'],
'#sound-dai-cells': [[1]]} should not be valid under {'type': 'object'}



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: qfprom_cpr@58000: compatible:
['qcom,qfprom'] is too short



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: power-controller@b1b9000:
'#power-domain-cells' is a required property



arch/arm64/boot/dts/qcom/apq8039-t2.dtb:0:0: /soc/syscon@1937000: failed
to match any schema with compatible: ['qcom,tcsr-msm8916', 'syscon']



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: hwlock: 'reg' is a required
property



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: memory@60000: $nodename:0:
'memory@60000' does not match '^sram(@.*)?'



And finally:



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: serial@78af000: dma-names:0:
'tx' was expected

	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml

arch/arm64/boot/dts/qcom/apq8039-t2.dtb: serial@78af000: dma-names:1:
'rx' was expected

	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml



arch/arm64/boot/dts/qcom/apq8039-t2.dtb: spi@78b5000: dma-names:0: 'tx'
was expected

	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml

arch/arm64/boot/dts/qcom/apq8039-t2.dtb: spi@78b5000: dma-names:1: 'rx'
was expected

	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml


I did not list here all needing fixes. Some might be skipped, but most
should be fixed.

Best regards,
Krzysztof
