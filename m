Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92EB168CAF3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 01:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjBGAKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 19:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBGAJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 19:09:59 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A942A142
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 16:09:57 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id hx15so38950229ejc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnIIRXNNYlbMS+AKrVcuwW+ggQvVh27JkJUI6nfQ0MQ=;
        b=cpXNtAjLa90makN/MpR70G1uYmNEVo2+ZDDovdnbSJu5CWMsNBrjIGXLj7VFyI4ldv
         ea+ktCBwqoh9zHBsASAkRnXacG52+rl54sQKTFXoPj+8BeR1BCxt2ckgHbVmT/jxsASc
         vOeY6clNWoKZwHlUM603+FWMbO/GhjMLmiW2YdfpqxQvmj0ZgglLXV/TTubrq0tPMHro
         uyPM5Zi3cj2pYbBFVj3uaON20wGwmLCrt4rPBPPbqtoTqWbqR4XWOZhXppP/EpJB6Jpv
         t5DkqAWXEOROup6Qk55iAM6RWtz8e5WhWyF9ShI+LJ19fmsKbJG8aQoSM6SCZaeQFXXg
         2hOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnIIRXNNYlbMS+AKrVcuwW+ggQvVh27JkJUI6nfQ0MQ=;
        b=hE3ixMUZveAOWnItpKkGnnrj6apl76SFbQAEYxmCRI2ziYkot6KIPo8tMw7InPegg0
         f0PB+1Tf0k9NSuMrjDB1tgnETEvfrgEUhg7p+c1/A8DTZmJVr84Z/6+DiCgZIKfpcO/d
         DhOH5dkQmMhLJmc72KXAgwRlZLpVjYV8n8NeqV3G76Id1WRRbyKMW8Oynk3sHP79XlgX
         vCpdND8YpaodaNY3Oe0QZLof0Zt92MNWblj7Io2LLRzuGgKmA9cnyZaFM+Ujp2R8LUsc
         Bbs0KU8Q4hczcZakVC7wLeQJMIPPyz75ogj8Rx4J2aRMEBTxvQhDfGInqJ7GAxOXGpkk
         k6uQ==
X-Gm-Message-State: AO0yUKXsDzixp7+4lqILwXuhXOBzqh7RbCCWrxI9hbH1XN6lBDNKU5oV
        SrLJH459SbXHhTaOIujihMzsfw==
X-Google-Smtp-Source: AK7set9qV0Y3DZ6p2CpnFdQWe1PUbhGAVj0rNBuYH3BNrqGE+HfUqEoNudXjmW33fH4HsAVd2ldcbA==
X-Received: by 2002:a17:906:8a6b:b0:882:2027:c8e2 with SMTP id hy11-20020a1709068a6b00b008822027c8e2mr1250153ejc.56.1675728596296;
        Mon, 06 Feb 2023 16:09:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gx25-20020a170906f1d900b008a322d4cab8sm2018316ejb.183.2023.02.06.16.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 16:09:55 -0800 (PST)
Message-ID: <f5559aa0-5f87-6c15-b8f6-9a25176c0eaa@linaro.org>
Date:   Tue, 7 Feb 2023 02:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/3] dt-bindings: power: supply: Add Lenovo Yoga C630
 EC
Content-Language: en-GB
To:     Brian Masney <bmasney@redhat.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230205152809.2233436-1-dmitry.baryshkov@linaro.org>
 <20230205152809.2233436-2-dmitry.baryshkov@linaro.org> <Y+FElkPUkfasI0yU@x1>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y+FElkPUkfasI0yU@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 20:19, Brian Masney wrote:
> On Sun, Feb 05, 2023 at 05:28:07PM +0200, Dmitry Baryshkov wrote:
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> Add binding for the Embedded Controller found in the Qualcomm
>> Snapdragon-based Lenovo Yoga C630.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../power/supply/lenovo,yoga-c630-ec.yaml     | 83 +++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
>> new file mode 100644
>> index 000000000000..37977344f157
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/supply/lenovo,yoga-c630-ec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Lenovo Yoga C630 Embedded Controller.
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Since this is new: Should this be updated with Bjorn's kernel.org
> address? Last I checked, this address doesn't exist anymore.

Ack, nice catch.

> 
> Brian
> 

-- 
With best wishes
Dmitry

