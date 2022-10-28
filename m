Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7856F61071A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 03:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiJ1BJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 21:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbiJ1BJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 21:09:48 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A881E731
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 18:09:45 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id f8so2559990qkg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 18:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqWJUv7RHF72o6asga23lrHNA3l+QNl6qrRvFoALfC0=;
        b=xNY+5H8aLsuLqj5SHMC6+3oVJMnmAwJEywEYQRhVfMYTHImPvFLQ1xjheNghCtawx8
         56u0KNrtfK/g27UvusPueR/KF+K0f7KKxD2H5uB9+4U04yCt+S7gzcs6oywD133JgKsu
         Q8H6qc46rDkbKEMdsrwc8e8qyTA4h1RpAs1o1/HMLpvz6w7DvSMdyD87akjaamsTYhYe
         2xBP5vgryWZx2R/CvvkPgqsgOJ33A/Nz57081y7dR8uSEASI/EsV1kZte7vHpuUsdVMC
         I0LLf8BW5MDDbWK3FiB75Kg3Cmj5vndNRaNrlljvEs9edA6C1UvBTkis9pyEoEMn4oEa
         E0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqWJUv7RHF72o6asga23lrHNA3l+QNl6qrRvFoALfC0=;
        b=vWT3AP4wV+aIT4xEzjJLgF3sq3mAoRVXtpAlRP013OHTOzUJbMK861uRsqgqLwD7qt
         COOkUFXuK6evG7J4mrBQw9iS4Le+NA681cWUWmIlbl5fS+1STe4Jj9qS8vCtFIZeD60u
         vjMq9a93inwj3tsAHQGCXQpBUBgp/TviWyhT+whjJExD2W9T9WAQscb5E1JDeKwHragb
         aHqItcfVR0vqO/x/Sc1rgcoJYfQuTMI9buZY+m6T2zkax7fyCmZLE9u1if7mRxDuDn6j
         0MASB3Kbr9nP3Q9x2i/W6PmDIX/1DRj+KHSRZURyiIKirsgkVmPNtJIuIxRWMv1eF3VY
         pq6Q==
X-Gm-Message-State: ACrzQf1z/fs1G05ivHN0YF+7k9vRg7Vm81SVB7zC4f59F2wmCLHEE1ht
        TCxGC5mtPM04Ptaf8qZqmxLGKQ==
X-Google-Smtp-Source: AMsMyM4BLpfVzD9/T6Vh002ms5kTcmfVgy8ChfBo+r70aLAfiUIOQMVATnUfpTdIW3jfsHWmvZVK1g==
X-Received: by 2002:a37:ab0c:0:b0:6ec:e84f:7487 with SMTP id u12-20020a37ab0c000000b006ece84f7487mr37406434qke.522.1666919384782;
        Thu, 27 Oct 2022 18:09:44 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bl24-20020a05620a1a9800b006ed61f18651sm1988799qkb.16.2022.10.27.18.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 18:09:44 -0700 (PDT)
Message-ID: <f6293fb0-9892-1f94-47a6-a9275231d741@linaro.org>
Date:   Thu, 27 Oct 2022 21:09:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: Add RPMHCC bindings for
 QDU1000 and QRU1000
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-3-quic_molvera@quicinc.com>
 <de2cd5c0-1c3d-5d47-4896-82e32f3c0d88@linaro.org>
 <52cf61ed-88bd-b04e-1596-15013d613c4c@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <52cf61ed-88bd-b04e-1596-15013d613c4c@quicinc.com>
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

On 27/10/2022 21:04, Melody Olvera wrote:
> 
> 
> On 10/27/2022 8:57 AM, Krzysztof Kozlowski wrote:
>> On 26/10/2022 15:04, Melody Olvera wrote:
>>> Add compatible strings for RPMHCC for QDU1000 and QRU1000.
>>>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>> This looks correct except:
>> 1. redundant bindings in subject
>> 2. not cc-ing all maintainers
>>
>> so still not tag.
>>
>>
> Not sure what you mean by redundant bindings; should I remove
> "QRU1000"? "Compatible strings"? Please advise.

In the subject please drop second 'bindings' word, because it is
redundant so:

dt-bindings: clock: Add RPMHCC for QDU1000 and QRU1000
or
dt-bindings: clock: Add QDU1000/QRU1000 RPMHCC

> 
> Also, I got maintainers from running get_maintainers.pl on
> linux-next/master; is this wrong? Not sure what I'm missing here.

You miss some of Qualcomm maintainers. Maybe more, I did not check every
possible output for every patchset. I just spotted missing Konrad,
because it sticks out. If you copy the output of some commands, be sure
you copy everything. Otherwise, just automate it so there will be no
chances for mistakes.

Best regards,
Krzysztof

