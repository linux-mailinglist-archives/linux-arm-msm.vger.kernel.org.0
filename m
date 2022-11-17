Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3AD362D767
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 10:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbiKQJrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 04:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbiKQJrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 04:47:53 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694102AC6C
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:47:51 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id t1so981577wmi.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mJE8bZ1d16Soq/u3zXafNtgnkPdOoiLGxDgt0M+ZXuA=;
        b=LxuJaGiRi3GBofhyCy0PMCAzPQdVyvyWx9AX37dIms/Xgg/2EH91lE0RW/4HzaaPiJ
         NDb9kG83yG4+JBTlINwBojFti0v/j+BqGiF3Sv0oRKzvlmuq5aAcJWvO/s72RAy1q8DX
         d2iqPnmY/rOJ3qvZsVDoe61fCsT2glT6txgpJRgOyFQvzd2TD718M7nsPrkDKcsi3W0g
         iM8pE2ne9+VDho8RF0CxLtISIKliPqVbpRKuZmIdXGJnfUnZN84tNANhydhNukBD+Qka
         rdaYy7EqskyGKeC1H2NtefrWLKKy/zYREUJNVv8shrHgwXLCCAY8dSk/wkFY6d4+mg+U
         1H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJE8bZ1d16Soq/u3zXafNtgnkPdOoiLGxDgt0M+ZXuA=;
        b=Zw7R+8RCGKjO1Q0k4raGAs7fPMJdbHGMx+9QLAtGYuPlJuKL8YrmBkfHLxK0TKkP4p
         HpFEuSKdRIR7QyjVsOkSpjwM1ozGUtKX+LD4kGHrXxWgNF+OvTPTTtzhKk2YCFZJ71Gg
         wfzpenkMXHjAfF533YpQDw7eZxSVaO19r9NTKh2xpB+Ob5gLjpPQuvnrEkQKTL4nQfTx
         hbopf4+nUKpc3HrwvttqtACbLwCnqQp8l5o8vO6ChRnnTNM4k/0p1B3on7eEWJsXNSJm
         cBKHr25c0/oy9ZX9d5qXJkRoxh5hpkYseTct/0FEf9u8+FiTrx0z1bhqAHAm5jd3m+zr
         gIHg==
X-Gm-Message-State: ANoB5pmlTIAyQ5pf7ILXr3FtKEyAI9QCQ+FFv53Oy5BPCSHjqGBZbU4H
        NpjlEzhbp4XXJRDHZU6vZn+EFw==
X-Google-Smtp-Source: AA0mqf6GnUIX2gam7adzA/Cn6Eg7pIWME+I/iWVz6m4/uWp50R1x4P8/TKeoURKqMpd7/os5BKfyAw==
X-Received: by 2002:a7b:c00a:0:b0:3cf:e8f0:ad11 with SMTP id c10-20020a7bc00a000000b003cfe8f0ad11mr4777193wmb.65.1668678469971;
        Thu, 17 Nov 2022 01:47:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b? ([2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c19d000b003cf37c5ddc0sm726317wmq.22.2022.11.17.01.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:47:49 -0800 (PST)
Message-ID: <9aa23650-6ae1-3844-7cf3-6812dc023c11@linaro.org>
Date:   Thu, 17 Nov 2022 10:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: reserved-memory: document Qualcomm MPSS
 DSM memory
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-0-158dc2bb6e96@linaro.org>
 <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-1-158dc2bb6e96@linaro.org>
 <38fff21b-3e75-13f9-664e-a115bc527b67@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <38fff21b-3e75-13f9-664e-a115bc527b67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16/11/2022 13:17, Krzysztof Kozlowski wrote:
> On 16/11/2022 11:16, Neil Armstrong wrote:
>> This documents the Qualcomm Modem Processing SubSystem DSM shared memory.
> 
> Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../reserved-memory/qcom,mpss-dsm-mem.yaml         | 37 ++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,mpss-dsm-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,mpss-dsm-mem.yaml
>> new file mode 100644
>> index 000000000000..65f37e1356d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,mpss-dsm-mem.yaml
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/reserved-memory/qcom,mpss-dsm-mem.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> 
> Drop quotes from above.
> 
> I know that this and few further pieces came from existing files...

Yep sorry, I'll clean it up.

> 
>> +
>> +title: Qualcomm Modem Processing SubSystem DSM Memory
>> +
>> +description: |
>> +  This binding describes the Qualcomm Modem Processing SubSystem DSM, which serves the
> 
> Drop "This binding describes"
> 
>> +  purpose of describing the shared memory region used for MPSS remote processors.
> 
> Entire description seems like not wrapped at 80.
> 
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Need to update the address.

Argh

> 
>> +
>> +allOf:
>> +  - $ref: "reserved-memory.yaml"
> 
> Drop quotes.
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,mpss-dsm-mem
> 
> Why do we need dedicated binding and compatible for it instead of using
> memory-region phandle in the device?

So like rmtfs, this memory zone is shared between APPS and the MPSS subsystem.

Like rmtfs it makes no sense to link it to the MPSS PAS, since it's only a launcher,
it doesn't represent the MPSS subsystem.

In the PAS startup process, the resources are released from APPS once the MPSS subsystem
is running, which is not the case with the MPSS DSM where it must be shared during the whole
lifetime of the system.

Neil

> 
>> +
>> +unevaluatedProperties: false
> 
> 
> Best regards,
> Krzysztof
> 

