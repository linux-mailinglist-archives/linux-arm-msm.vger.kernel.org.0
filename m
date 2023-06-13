Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951BF72DD96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 11:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242010AbjFMJZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 05:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240682AbjFMJYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 05:24:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E76E4A
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 02:24:45 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30fca48b473so902824f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686648284; x=1689240284;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pXZ4aijj1pbGg+3aoennLfPzwPG0hMvQp5jgoTVxVm8=;
        b=GZA9yI5bwW4oCmT4IZAkYKgpuay7dbOmcoOpQ7W/6x4Y5hg97080ZzsiYso50gGdds
         RZVnCyTiL62fr18WkB3y2+DYnLJuuKvblwA0wczGmYyboB3AHOHYXB5FnB+MSxKhbT13
         iuvvq0cYySFYrLTDn5jnNSMntKeNNRkW9tJV3f+xQrPDBUfbCm1K19QHSlDUTHdEYZrJ
         Ncqdt5nwZZlQZFOZb3IvmM2ArE+r3GSK2RrjnUddUO+mNeCMeJkA5mNmzUaOxolhXkx3
         wb1WlbZIuzusH9H6oZEwwRyQFdYOp1lp9jpv1h9RGzXXLrII5l6qLCZx0dbFul+vx9Va
         /zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648284; x=1689240284;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXZ4aijj1pbGg+3aoennLfPzwPG0hMvQp5jgoTVxVm8=;
        b=BZGrgD5XRXsxpWaqCJuL2XdvDlsAfXiTPeVbDfWNlgIwD8W6yH/l2iWE4R1Us57r8i
         rGPmtIl6/2gh/JqRl2fmheGiwwBqI7gFOFvwZCCaG3I3Co47jbik0ifd+KI3sbgH4XV6
         jyzubSxwf1csaWSZJaRC3R5WMWpS8+XTzMZkYqwb2MGpKwXo+7PlrhzssUkpvZgfNbLx
         0Pwwz2IBVTur81e5D0D9OTu+bFhxMeMNCnha/hNpzQw7OOjO9Z1hBVE/AR9XUNfaoAgC
         hnMl09yNEgY0yc5uM/cfQQkshwOoegjyqLbGTuzLbzchiTSQ1icy8+JGrywQE3/968qb
         V/kA==
X-Gm-Message-State: AC+VfDwdM0prxKax/lKYxAaHlTdYpOu+jIghSQZNj1TidrbMk7gTi8Gn
        DtwbnFTq768INXuL3m7BW5Ym2rJ9xJiYly0yFWTpLQ==
X-Google-Smtp-Source: ACHHUZ7PO/tsm9IXmJ7pb3uNDlot07rQqXgOCkR7DPpvfhLhNFDPFPOxgXcEUTv86r3jFpDeqkvMPg==
X-Received: by 2002:a5d:614b:0:b0:30d:f75c:4a68 with SMTP id y11-20020a5d614b000000b0030df75c4a68mr6243782wrt.34.1686648284132;
        Tue, 13 Jun 2023 02:24:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48b:b939:c60e:e1ba? ([2a01:e0a:982:cbb0:48b:b939:c60e:e1ba])
        by smtp.gmail.com with ESMTPSA id t18-20020adfeb92000000b003093a412310sm14770863wrn.92.2023.06.13.02.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:24:43 -0700 (PDT)
Message-ID: <f708a6d3-321e-c425-8048-1c0d2ac7a6f0@linaro.org>
Date:   Tue, 13 Jun 2023 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/8] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v3-1-22c9973012b6@linaro.org>
 <e26878e5-fedc-b2fb-2213-5afd8479de4f@linaro.org>
 <cfa788c3-be57-5109-73df-b82099dd17a0@linaro.org>
 <9abec6ec-1995-8e20-8926-f57969341932@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9abec6ec-1995-8e20-8926-f57969341932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2023 11:02, Krzysztof Kozlowski wrote:
> On 13/06/2023 10:54, Neil Armstrong wrote:
>> On 13/06/2023 10:13, Krzysztof Kozlowski wrote:
>>> On 13/06/2023 09:55, Neil Armstrong wrote:
>>>> On some platforms, the Type-C plug orientation is given on a GPIO line.
>>>>
>>>> Document this optional Type-C connector property, and take the
>>>> assumption an active level represents an inverted/flipped orientation.
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Rob had here objections as these are bindings for the connector, not
>>> PMIC glink/altmode. I still doubt that Qualcomm USB Type-C connectors
>>> have such pin exposed. If you open the schematics, the GPIO is actually
>>> coming out from PMIC and is nowhere around the connector. Please drop my
>>> Ack.
>>>
>>> This however could be a pin of the PMIC because it clearly is on the
>>> schematics.
>>
>> Yes it comes from the PMIC, but this part of the PMIC is handled by
>> the PMIC_GLINK firmware service, so the logical place would be into
>> the pmic_glink node with a gpio array in order to handle multi-ports.
> 
> I think all PMICs have only one CC_OUT pin, so this would be now
> maxItems: 1, but there will be no problem in growing this later.

Yep, I'll only allow for sm8550-pmic-glink and set maxItems: 1 for now
since it's the first occurence.

Neil

> 
> Best regards,
> Krzysztof
> 

