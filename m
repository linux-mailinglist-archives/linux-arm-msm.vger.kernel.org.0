Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9895EC4FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 15:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiI0Nx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 09:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbiI0Nx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 09:53:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24D113C863
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 06:53:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k10so15827962lfm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fBDINxAKnVMimDBQEi5sLrEjPa2VMBXc9bFx7Koe3Mw=;
        b=WiQaPcFumyj9eMUr9LVhUFc0gQAjHjLqjXn+PVXbpqsKSNACjTC8jlxDyL5nXeirlm
         L7RRwhNk/tciNdpDQ5RSgNgspO0wmb4P5Fe2JpFqLMWDZLuwlkyePgwwmH9w5vqqNcjO
         vR+f9H166qMHTQuPQDQqVakwLx0unppFe8up9QBkDA2bSHmUBzPjLnjsjIsDmNJUg7+A
         Cdp8J7Bwk6aMpwoi03oeZZ3ny1q7+338kBYeQjChvp5EE7wW3+QZBhIm0y8sZJkjVSnl
         9w5IIuz3Zx8AqU58VJthKknqgdKkvMe7B7UWiY97n1LOh0ka5+i406PnMLP+Ug5GL4E7
         38iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fBDINxAKnVMimDBQEi5sLrEjPa2VMBXc9bFx7Koe3Mw=;
        b=wnrcshO52932cqGlvkZhNoaYtp9tFyhXK4sE9EuMB3Gndl3pc98PjCWEriRemXIqMB
         b7XbyMK3r452Vt6BMBStnKxHK404Mt6RrKLCxv+z2zLTjv9rIQQWwD+k3ADRUwqLUXSm
         HzMu2iBW/KWsYs8G8Ga8bn+Nehy4hurh5gzWPmoEQ/VYQQGAhgwqXnR71sQC4MjUd7iT
         bwepB4tDnBvQvDwh0qJlkjH5Rt9wW4oY2Ocs9oUgb/wLD70B6Y95iaMZd27E6k31bPfd
         /DKRTcUlalR09XIsfaLUDIkrvzqTk0dQO4OwEg0lzP19k3JiD9ADmf7uEIrA/82ATIg5
         Ggog==
X-Gm-Message-State: ACrzQf3Jxchi/mXWJYuWudYUDWdEKYLgSk0nFINVSWmDAZmj8DT9z500
        45w7MZgtPeyrpjollQXgApw77Q==
X-Google-Smtp-Source: AMsMyM4apfh7IRPxjykl6TJRH1NidZnJy2ZGSCr4l2uWusE3YY7A8BEw7miOrmS2bQllaV6PqjUybw==
X-Received: by 2002:ac2:4c8d:0:b0:4a0:559c:d40e with SMTP id d13-20020ac24c8d000000b004a0559cd40emr8466481lfl.508.1664286833103;
        Tue, 27 Sep 2022 06:53:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q7-20020a0565123a8700b004a05c425cb7sm168575lfu.184.2022.09.27.06.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:53:52 -0700 (PDT)
Message-ID: <5465c938-57bb-b081-d246-9a9317fff96e@linaro.org>
Date:   Tue, 27 Sep 2022 15:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5] dt-bindings: qcom: document preferred compatible
 naming
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
References: <20220720073326.19591-1-krzysztof.kozlowski@linaro.org>
 <96ef23e9-4bf8-a92a-ea14-990621dfd3ef@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <96ef23e9-4bf8-a92a-ea14-990621dfd3ef@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 13:57, Bhupesh Sharma wrote:
> 
> On 7/20/22 1:03 PM, Krzysztof Kozlowski wrote:
>> Compatibles can come in two formats.  Either "vendor,ip-soc" or
>> "vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
>> DT schema file documenting preferred policy and enforcing it for all new
>> compatibles, except few existing patterns.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> ---
>>
>> Depends on:
>> https://lore.kernel.org/all/20220627143340.477120-1-krzysztof.kozlowski@linaro.org/
>> https://lore.kernel.org/all/20220628092253.21905-1-krzysztof.kozlowski@linaro.org/
>>
>> Changes since v4:
>> 1. Add qcm.
>> 2. Add more qcom,ipq806x exceptions.
>> 3. Add Rob's tag.
>>
>> Changes since v3:
>> 1. Add qcom,kpss-wdt-xxx to pattern for exceptions.
>> 2. Add ipq806x entries to list of exceptions.
>>
>> Changes since v2:
>> 1. Narrow the expected pattern to be followed by dash '-' after model
>>     number (msm8996-) or by two letters and a dash (sc8280xp-).
>> 2. Add qcom,apss-wdt-xxx to list of exceptions.
>> 3. Use comment instead of description in the oneOf list.
>>
>> Changes since v1:
>> 1. Add schema instead of readme (Rob).
>>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: Alex Elder <elder@linaro.org>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>   .../devicetree/bindings/arm/qcom-soc.yaml     | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> new file mode 100644
>> index 000000000000..9918b20e4478
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoC compatibles naming convention
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Please use Bjorn's new email id.

Indeed, thanks!


Best regards,
Krzysztof

