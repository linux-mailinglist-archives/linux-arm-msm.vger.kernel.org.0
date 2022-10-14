Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F9D5FF1F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Oct 2022 18:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiJNQCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Oct 2022 12:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiJNQCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Oct 2022 12:02:39 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2502416C236;
        Fri, 14 Oct 2022 09:02:36 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A66A884EAE;
        Fri, 14 Oct 2022 18:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665763354;
        bh=4QZY273rix2KU23137Kv6VjVkJSrnJrmjDRIoYoYYMI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hWNVIJPGsrCRwR0WpFHKNKj1NHtk5ccMqxWWiNRrgKXUT/Z5ZlpAEbvPP8h/uU+rZ
         xS+gpESJycu/qQScIi6lakYTAxOwiKfVeRl/idv+TDqFluSVhufczlWLZCaPdmFJ2/
         nM5TowIHkdvQpHyhQjDtdU/16nyR53JfEFGWT5FBAQYVXaUi7TVmjmvzynf4xsxrOG
         cVr5zY1cUbaK1BVYFbbhuM0WQ5rOBkNgeWg8yAf4ajII6pUb3ecdY1jR4GsLgb+h+D
         Bn0Nnfr/MdwQyVYMX5qCGUDXTGb/v4pAnTc8TNb6QfcsxHQuLnkXG2vIhbW3ZheVbw
         2Wqt27xGUaD+g==
Message-ID: <09cb3000-14c4-e94f-70e8-36e0ef8ce3fc@denx.de>
Date:   Fri, 14 Oct 2022 18:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: arm,pl18x: Document
 interrupt-names is ignored
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221013221242.218808-1-marex@denx.de>
 <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/14/22 18:01, Krzysztof Kozlowski wrote:
> On 13/10/2022 18:12, Marek Vasut wrote:
>> Due to inconsistency of existing DTs regarding the content of this IP
>> interrupt-names DT property, document this such that interrupt-names
>> is not used by this IP bindings.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Andy Gross <agross@kernel.org>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: Yann Gautier <yann.gautier@foss.st.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-mmc@vger.kernel.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> To: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: Add deprecated:false to interrupts: description
>> ---
>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> index 1e69a5a42439b..1c96da04f0e53 100644
>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> @@ -95,7 +95,9 @@ properties:
>>         PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>>         emptied as part of a bulk read from the card. Some variants have these
>>         two interrupts wired into the same line (logic OR) and in that case
>> -      only one interrupt may be provided.
>> +      only one interrupt may be provided. The interrupt-names property is
>> +      not used due to inconsistency of existing DTs regarding its content.
>> +    deprecated: false
> 
> Why do you add deprecated false? All properties are not deprecated by
> default. Did any other referenced schema make it deprecated?

Rob asked me to add it in V1 .
