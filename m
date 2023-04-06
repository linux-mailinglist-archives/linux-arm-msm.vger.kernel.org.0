Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409656D9FD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 20:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240191AbjDFSaC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 14:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240150AbjDFSaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 14:30:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD146618B
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 11:29:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c9so41554564lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 11:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680805798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Neijv2zq96R0GfdQjQwNKcSFKV86CYJRcfc1aaFu1qk=;
        b=XlOX4iBsYDzB8wgJK6e2EygD58sqmxulgjX5qqPLTfJEt8z15r/HdkriynKKcYX2Bq
         Msof2eYI5neCNb+upoBnjZHBmUVqRYQHHGYJctHDxezQ4Cb9QfWZzNAq/MetS9UXCAgd
         AdnCCJmHS/gE6xkAUmP7rR5yETIcYFo5XIMXKbK+khXUj12Jqx5BVIqCi0XL/f+/Wwv6
         lAbd/OFVk9+4dNyuccCRWlfk48MwAQMQga7khS4+oI1Gq1pvaRyvlMYYRM5Uw+Wr8wa5
         4FsvJziidvPZmQeAMtyo6xWUS1iLQaI5TSLJ/dGUfel7N/MHZrd95B0d5YoeFnrHlrJk
         r3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680805798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Neijv2zq96R0GfdQjQwNKcSFKV86CYJRcfc1aaFu1qk=;
        b=LTgRRkACk3DE8pdenieiY31E7qW0ksBFLN/52ud7hoYBuQpOUTdjKXem42gv3j3eNU
         W1VaUqQTJEs5TqQ7gJ5RGj8SJE5N0Q8YcLHrSHD7VBIRMOr2y2fCj1QGexD9IHjMdRHH
         7WOG+5eS/p096sOZe71yutij+kwK0hgkf2L5wqkiI3BrZZiugTajfsCwSM9WKFoNFPj2
         i2InI9FdUwPO77j9MHAoC/Mz3A4M2GlXy5KhCY9ku0XPN2FbNhVrYnlV5SrZgMJM/THw
         qWVYQ1GCKlzWtoyyR1ClcLInNmSq3p05QxnjesFOFo+a0sJwrIw+Vzk7Ss7UZnM7X+nw
         NZoQ==
X-Gm-Message-State: AAQBX9fzseAvyVG+woDUf4TWp9tV2IZrbZOcFB+XuEqJM6MH/9enNzFT
        GwyeQ0F55AFZlu5m0C5hQemUCw==
X-Google-Smtp-Source: AKy350ZEODeEm9sOvgyuO0IIzT81OsrB7gbD3ClS6luG0xT13OBKwnwD8262UKlr8jcIal295NttLw==
X-Received: by 2002:a19:f508:0:b0:4db:3a70:e9f3 with SMTP id j8-20020a19f508000000b004db3a70e9f3mr35061lfb.69.1680805797945;
        Thu, 06 Apr 2023 11:29:57 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id r15-20020ac25a4f000000b004e848782e2esm371641lfn.57.2023.04.06.11.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:29:57 -0700 (PDT)
Message-ID: <eacc380a-aa33-5b1d-0a11-124b584cd1aa@linaro.org>
Date:   Thu, 6 Apr 2023 20:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm6115-j606f: Add ramoops node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230406-topic-lenovo_features-v1-0-c73a5180e48e@linaro.org>
 <20230406-topic-lenovo_features-v1-1-c73a5180e48e@linaro.org>
 <9554be2b-c80d-8c5b-48e3-2508a7b4ecd1@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <9554be2b-c80d-8c5b-48e3-2508a7b4ecd1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.04.2023 19:54, Dmitry Baryshkov wrote:
> On 06/04/2023 18:25, Konrad Dybcio wrote:
>> Add a ramoops node to enable retrieving crash logs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
>> index 10c9d338446c..fd064899791c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
>> @@ -52,6 +52,17 @@ key-volume-up {
>>               wakeup-source;
>>           };
>>       };
>> +
>> +    reserved-memory {
>> +        ramoops@ffc00000 {
>> +            compatible = "ramoops";
>> +            reg = <0x0 0xffc00000 0x0 0x100000>;
>> +            record-size = <0x1000>;
>> +            console-size = <0x40000>;
> 
> no ftrace-size?
It could use some!

> 
>> +            ecc-size = <16>;
>> +            no-map;
> 
> I see that other ramoops defines are not marked with no-map. Is there any reason for that?
Hm, not really. I can get rid of it for v2.

Konrad
> 
>> +        };
>> +    };
>>   };
>>     &dispcc {
>>
> 
