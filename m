Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF2C58105F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 11:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238584AbiGZJw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 05:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238572AbiGZJw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 05:52:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049662CCAC
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 02:52:55 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id p21so8269484ljh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CaAorG4BYFUosNioD1hfjI7j/Y8uoX4/ARwNzmf43cw=;
        b=p3n5O0GtUJad0vTXMoPkX2ckqhPr5UafevVhNH5JTi6wy0W2gaHkP5DNy6FGqEQt4M
         nRj5+HKbZtTmwcspNWsbBHOax1/QKpF9A1DEebDg+AhMGTJZV/1jVkV5Re8w06P8ug1U
         MVIgkg0hAHBI+L37PvNiuBhkonn2AZ4NsygjD0SYIkK2InScTRd7KBXo4Vej/NLpT+Pt
         WpNC+P0tYihyUQq4ISoWfY0V54NbhEgLbFafQfclvnZbr8MBqLzEphCRdPTmt8gmHCEH
         rN+LnAOMeOxqgpFM3cB3vdMDRCMJ9Vj5vE917dvA0Lu9IRYzBQn/xOmRMrtmXEnI7YQ5
         exww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CaAorG4BYFUosNioD1hfjI7j/Y8uoX4/ARwNzmf43cw=;
        b=PoJt7x3euI09pxy2HG+K/Q6sdhd5RPkbkfE8fis6DeJ9gh8C8kL9ITzA3BZp7Elecv
         tVZ9lf9lTuBKwypzLioq99/hAXmfTLpgDRPyr/k3COut848X/43JBjfvkijUE4J0Eu66
         zW42Eoo2CzK3XfdEuw2tmnB0H5z/t1mZ9fR9Zj7yi8pnhLZWRK4R7vfrEWSUMZMdrrkx
         i0J9Go5pFXx30HDDS1zcwbB4tqQQw8iJomRvaabsf9CntdoOaG07VSMODh2K+yVr2Hve
         MFVbqqnsqx2p11dUon5HtA918RDKL5Ye40iQnYuZcmg6ijHnFd8SK8okX7PGykoeczFm
         rBRg==
X-Gm-Message-State: AJIora+I7zAxDgKgxPjqtJVOETAeTRtnom96fkosP+aXWH7HcKo8mAUD
        sJ/cZZIzoNkYYfvSDtBLYEbIIA==
X-Google-Smtp-Source: AGRyM1s2pQcpuLM9fC6b+Zd3+Jbq+kcT6qzOKl33aqkCPVY4TqWYt34qInfm8Exho2TYRp9M+VOrdw==
X-Received: by 2002:a2e:8e2c:0:b0:25d:e021:ba8f with SMTP id r12-20020a2e8e2c000000b0025de021ba8fmr5533140ljk.491.1658829173391;
        Tue, 26 Jul 2022 02:52:53 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b0048a8f097713sm1035410lfc.80.2022.07.26.02.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 02:52:52 -0700 (PDT)
Message-ID: <cdb5ede1-20b3-223c-efd3-21edb8e715a5@linaro.org>
Date:   Tue, 26 Jul 2022 11:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add SM6375 QCOM global clock
 bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220723100135.91784-1-konrad.dybcio@somainline.org>
 <20220723100135.91784-2-konrad.dybcio@somainline.org>
 <27154a09-d79b-7814-22ec-c84496596abc@linaro.org>
 <6a33d026-9f30-358e-8498-dbe315fccc5b@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6a33d026-9f30-358e-8498-dbe315fccc5b@somainline.org>
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

On 23/07/2022 22:56, Konrad Dybcio wrote:
> 
> 
> On 23.07.2022 19:46, Krzysztof Kozlowski wrote:
>> On 23/07/2022 12:01, Konrad Dybcio wrote:
>>> Add device tree bindings for global clock controller for SM6375 SoCs.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> ---
>>> Changes since v2:
>>> - reference qcom,gcc.yaml
>>>
>>>  .../bindings/clock/qcom,sm6375-gcc.yaml       |  48 ++++
>>>  include/dt-bindings/clock/qcom,sm6375-gcc.h   | 234 ++++++++++++++++++
>>>  2 files changed, 282 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>>  create mode 100644 include/dt-bindings/clock/qcom,sm6375-gcc.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>> new file mode 100644
>>> index 000000000000..fb1c36888d18
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>> @@ -0,0 +1,48 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller Binding for SM6375
>>> +
>>> +maintainers:
>>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>> +  power domains on SM6375
>>> +
>>> +  See also:
>>> +  - dt-bindings/clock/qcom,sm6375-gcc.h
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,sm6375-gcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Board XO Active-Only source
>>> +      - description: Sleep clock source
>>
>> What happened to clock-names?
>>
>>> +
>>
>> I would assume these are required for the clock controller... and they
>> were before, so what happened?
> I dropped them in v2, as with switching the .c driver to use the
> index matching, they are no longer used.

OK, but what about clocks as required? Why aren't these now required?


Best regards,
Krzysztof
