Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F9F64A2BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 15:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbiLLOAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 09:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiLLOAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 09:00:38 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FAEB4F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 06:00:37 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p36so18708919lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 06:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXNjasCAMqOsg4AwZXK5gy3WyUBRJtec+Tu/Jp4jrQw=;
        b=NxzUJG6T+Im1jq8ga35JuknXDOmmVrmSyRQwnXdaYXpZ5j6jy5eS9o42QegY442r6Y
         SnnKVYmQyXW/0lA2ozQO15CIaHl90jrpDrcRDxaE/BC+5GpLpUVyISUYZ2Lqzj5aUhla
         XOC5f1e61kovwwIlZ2Np2Vw10Uox8NWHw3yc7WyELnbXs+t5G+ZKD4lp9CA1VBbpZeii
         sF+d01ghPWsqCNYOpJWTE0t8NQsRN6mg0y8ub2Yo6CKI61Y9fvA24hZFp/gY8qoc5HDP
         BYo6IOFZPoLfv+oYAgHbWZrRYjWvi1BZz/v6ikJHClpZSIP1FBZf3f2lWE9re/joRPUJ
         0Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXNjasCAMqOsg4AwZXK5gy3WyUBRJtec+Tu/Jp4jrQw=;
        b=iI7h25GpkCgIcqHsQrTfedrkDlMiV+wbaxg7gDFR5dGeXpjOaUYEqYdZh20zCya3S2
         uNB4OBg0vMIQSULwgw5Q7AltSMCamUQfisA+YCaNtiI/bilcjzIQZ9JmH68/N8IcNDpv
         qyWbHkMwAS+zW+9aQTA6Zrc7GbpmROgc2tsxH7H4iT07glkSyF478bNTMlddMXqyyXY2
         MxehKTBbtdFYL84Nu/vW7ozys0k6RA9kHTRVhrevtFwezDCTLlrzl6PzzC+3qXlUGNcT
         NLU4tzs4YZFFLm6I5F+oB1+IJqAi0ZKdyymTt/dVH0A2OJer3RoECuVsxd1KUqs+TUZG
         yYwQ==
X-Gm-Message-State: ANoB5plElR84iAHeLl6PBOcWFNh6AwYqMIUHdIfeIXwSTpZaoPr/6e8E
        O4HKGksE2uhXBmdpC5tvYdGF5g==
X-Google-Smtp-Source: AA0mqf76Z5LgwMdRcetNB2+IXivy9ORSfv9m/zYIe2DUINSY3rYdKIhoflCpAzaW6kN/AOO8Bhuucw==
X-Received: by 2002:a05:6512:250f:b0:4a4:68b9:66d4 with SMTP id be15-20020a056512250f00b004a468b966d4mr4349072lfb.31.1670853635653;
        Mon, 12 Dec 2022 06:00:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k38-20020a0565123da600b004b5a2a33972sm1638305lfv.40.2022.12.12.06.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 06:00:35 -0800 (PST)
Message-ID: <894b930a-797d-3197-0c1a-5253ebb0a3f8@linaro.org>
Date:   Mon, 12 Dec 2022 15:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm845: move DSI/QUP/QSPI opp
 tables out of SoC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
 <20221212100232.138519-4-krzysztof.kozlowski@linaro.org>
 <C262B514-6AB2-41C8-BBBA-CAE3186BBB3D@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <C262B514-6AB2-41C8-BBBA-CAE3186BBB3D@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/12/2022 14:46, Dmitry Baryshkov wrote:
> 
> 
> On 12 December 2022 13:02:30 GMT+03:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> The SoC node is a simple-bus and its schema expect to have nodes only
>> with unit addresses:
>>
>>  sdm850-lenovo-yoga-c630.dtb: soc@0: opp-table-qup: {'compatible': ['operating-points-v2'], 'phandle': [[60]], 'opp-50000000':
>>  ... 'required-opps': [[55]]}} should not be valid under {'type': 'object'}
>>
>> Move to top-level OPP tables:
>> - DSI and QUP which are shared between multiple nodes,
> 
> This makes me rise a question: on other platforms we have been placing the shared dsi opp table into one of DSI nodes (usually into the second one). Should we also move such tables up to the top level?

Hmm, indeed I see SM8250. The location of the table from
shared/non-shared point of view is one, but second problem is that DSI
has address/size cells. DTC has additional checks for certain buses thus
the QSPI table cannot be inside such node with address/size cells:

Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table: missing or empty
reg property

This check is not triggered for DSI, but the concept is the same here -
nodes with address/size cells are expected to have only properties, not
other objects. See simple-bus:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/simple-bus.yaml#L59


Best regards,
Krzysztof

