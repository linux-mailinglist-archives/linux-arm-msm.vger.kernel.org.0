Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D09B72DD2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 11:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbjFMJCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 05:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbjFMJCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 05:02:10 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995091A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 02:02:08 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso9153100a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686646927; x=1689238927;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzEfUin2MVF46i22qIi9tbZhydZS19+jfsJuN4LpO/g=;
        b=ODYI3wxpO3HixCRP2frPjqwnfJgRWGk7GFxbW8XuI0pjsZjoLeWd0z1G5BvJ+I7+JL
         n8ZVETj1JHhGMktsnvstHwvO57nZ3cG0SjF9ICovIcLsX+wkdOmZ8DgmnOyI/Dt8a/nQ
         hfDJT79Amt6M0KXz6aEQsCGSYlPnX80va/05Lv9zgH0sCS/pta9RiS+yiDBlFHdmw3bm
         0hwFYL8Lt/gbRd3/2HqYQbBMZ/IyjC7alh8/RshZPLl30pg3ZfOqkRvAIcjqd5EWwvpR
         iTKssaMWwrGlpysA/ENAeFInyW3UPlfwmac2PPTC2fvsdH4OfQWVElneBDWsDBIWjchN
         dVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646927; x=1689238927;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzEfUin2MVF46i22qIi9tbZhydZS19+jfsJuN4LpO/g=;
        b=XvYZlXFNsNsfCX9oxNc9kNCznSXoTld64Og0R508Cln1JYKuVzqP/AfsC/0QZYaP1k
         SQlJ087BpskWf0fFpNbusZDrx+/46QZbgsmJ/QaD5rcObhP8ocbjeZMjTl5BcP9wD5Rv
         OOCZmKE/DYVERXlWwEgpNgY7x/qPUhRAPnKruEQp0o1eBl+8TIFbo7BP1crtSMCzWdj1
         mZM+YF7AqxQxYGJQ8g8AcJlhq+AML0C3nCzXtxVgK58UdxcCzWa03dp2SyEQ4WUvFq5W
         NOw52UzOWI7IEH7YelOSC/tacRZOxf7mnsvGGEgiBHCP9A2IbheT3eK79Fr4BIU5THlp
         67nw==
X-Gm-Message-State: AC+VfDw4cOi6/+slr6e+of4BVlbEH5nIYrK3YQ/vRTbNWKVyR9Z/AXXF
        iHPW/6MsZd/5IL4fPW7dzAK3gA==
X-Google-Smtp-Source: ACHHUZ7okwi/2iEWLqfIUdBxfgLqtlIDCd+KsF1Wji070WQCUC/NtGOsQ/n7XH77XbzKPgQwPgJJYQ==
X-Received: by 2002:aa7:c3c2:0:b0:516:7928:ed70 with SMTP id l2-20020aa7c3c2000000b005167928ed70mr6862259edr.3.1686646927124;
        Tue, 13 Jun 2023 02:02:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b00514a97b6b80sm6137998edo.78.2023.06.13.02.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:02:06 -0700 (PDT)
Message-ID: <9abec6ec-1995-8e20-8926-f57969341932@linaro.org>
Date:   Tue, 13 Jun 2023 11:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/8] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-US
To:     neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cfa788c3-be57-5109-73df-b82099dd17a0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2023 10:54, Neil Armstrong wrote:
> On 13/06/2023 10:13, Krzysztof Kozlowski wrote:
>> On 13/06/2023 09:55, Neil Armstrong wrote:
>>> On some platforms, the Type-C plug orientation is given on a GPIO line.
>>>
>>> Document this optional Type-C connector property, and take the
>>> assumption an active level represents an inverted/flipped orientation.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Rob had here objections as these are bindings for the connector, not
>> PMIC glink/altmode. I still doubt that Qualcomm USB Type-C connectors
>> have such pin exposed. If you open the schematics, the GPIO is actually
>> coming out from PMIC and is nowhere around the connector. Please drop my
>> Ack.
>>
>> This however could be a pin of the PMIC because it clearly is on the
>> schematics.
> 
> Yes it comes from the PMIC, but this part of the PMIC is handled by
> the PMIC_GLINK firmware service, so the logical place would be into
> the pmic_glink node with a gpio array in order to handle multi-ports.

I think all PMICs have only one CC_OUT pin, so this would be now
maxItems: 1, but there will be no problem in growing this later.

Best regards,
Krzysztof

