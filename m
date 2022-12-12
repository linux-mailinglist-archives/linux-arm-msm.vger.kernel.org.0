Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E4464A1E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 14:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbiLLNrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 08:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbiLLNqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 08:46:44 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A299214096
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:46:42 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id y4so3593994ljc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxHGtMq5GSN/TzBMFNMESrcfJh01WQBJhakkXVkndX8=;
        b=oYeP7GzOhdz43PVU01F4GAuR16JUjwiXYXR5PMFrtLB7hVLhGGsGcfH5Tr68zU4nFk
         MsKVjBWcCMoQr2lOaep7zvMeiPWG6nnxqvcWJx28OPElIEVDkK2ujtCZYVKhcywKYlFV
         a+seyWGjquCdhjaUgF2gNsL4lr1CkP75b6AFs5dOho1EZ+JtZb8FL17QTT2jfXl9VT/a
         cv9hc88jm4pzca+TuN4uXfAeTkgVVbZmjpJ2FzXMRYfWH3iuSVxQwLmVVD6bl97V4jtF
         /KCNHZvwJsXAmCqfMpalJiHmtdvpGeN2hieF7SDO36EYZD526fqOjYMe/gmaj+Gj6qmW
         iyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxHGtMq5GSN/TzBMFNMESrcfJh01WQBJhakkXVkndX8=;
        b=TgF4ywaCr5ReavBBT5Te8FYz7ogdv9o+sdKLzUrJ8d5gnrP7DvFG+C0NkuCisPnTi1
         GV/kANjRUWqTxk4x0Yx7Cn64n35ZkSNPW7mpyMb8RHJk9/Pz3/FdU9RAUGLX3E1FzoBZ
         kP0iJySCW2Zm+aOZ9PeQADZ8FEpocFOcUNlsdkgTtycMdZpxBnZR7vAcGcI9ViGQZ7T2
         /e6mLPRLKBFEhl6ZvdoH/iteR/qj20nk6Re4btzRfiQxtySyq6iUAkolYiOvk1grCnGC
         Q5/lzka8JxTO/QvjzWX5DvdW51VN0O7E8IvVyuBaE7YjmX0nx+6GdiTwteQv18AHianG
         sLfQ==
X-Gm-Message-State: ANoB5pmv6w7QGt8ZDk2tBJGEu8F1dY4E4GjHk3NSRPLrUlLYoRo9q9KP
        24Q673x1YNb8Jk47sC2mFVki1w==
X-Google-Smtp-Source: AA0mqf5meH8yZGLAtys7fm0t3QYrs/uHUbC8iab3mJrPDQGd04iQ3YgbZrKhKk+Dq3QvQj9WAnThIw==
X-Received: by 2002:a2e:894f:0:b0:27a:2e09:c5be with SMTP id b15-20020a2e894f000000b0027a2e09c5bemr4047601ljk.16.1670852801021;
        Mon, 12 Dec 2022 05:46:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p7-20020a2eb107000000b00279f3c58278sm1215055ljl.51.2022.12.12.05.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 05:46:40 -0800 (PST)
Message-ID: <e9a61363-a43a-5ee9-80d0-129b9b328040@linaro.org>
Date:   Mon, 12 Dec 2022 14:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] arm64: dts: qcom: rename AOSS QMP node to pmu
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
 <20221212133303.39610-4-krzysztof.kozlowski@linaro.org>
 <20fcf298-7d91-0458-489d-4fb65cdff380@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20fcf298-7d91-0458-489d-4fb65cdff380@linaro.org>
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

On 12/12/2022 14:38, Konrad Dybcio wrote:
> 
> 
> On 12.12.2022 14:33, Krzysztof Kozlowski wrote:
>> The Always On Subsystem (AOSS) QMP is not a power domain controller
>> since commit 135780456218 ("arm64: dts: qcom: sc7180: Use QMP property
>> to control load state") and few others.  In fact, it was never a power
>> domain controller but rather control of power state of remote
>> processors.  This power state control is know handled differently, thus
>> the AOSS QMP nodes do not have power-domain-cells:
>>
>>   sc7280-idp.dtb: power-controller@c300000: '#power-domain-cells' is a required property
>>   From schema: Documentation/devicetree/bindings/power/power-domain.yaml
>>
>> AOSS QMP is an interface to the actuall AOSS subsystem responsible for
>> some of power management functions, thus let's call the nodes as "pmu" -
>> Power Management Unit.
> power-management@ is used on apple and rockchip and pmu is very
> ambiguous (power management or performance measurement unit).

Sure, can be power-management. Samsung uses also pmu, but indeed it is
easy to confuse with PMU counters.

Best regards,
Krzysztof

