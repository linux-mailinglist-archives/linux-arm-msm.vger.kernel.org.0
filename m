Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827BE5ED558
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 08:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbiI1GtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 02:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbiI1Gsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 02:48:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8551F5A34
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 23:47:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o2so18901501lfc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 23:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7C7Gh5iO8tmlmQKsKFP7N50PmWc8XDX+LyCFteb17tw=;
        b=XtgZivkxidkQGoZr99gC9PGUBcFFLZxx94SpLLKqNeFtO9VVs9ByK0toPcKONhDvUn
         gxi9PxJ0Faswd1kXJueS09XKx0BcStX7L5GshgRa++lmqKzPEsbBlVMFA9Ri3f3qIt3J
         Fnu5GWtHMpB1BsGrHsJKefwACCZYv9yu2PGvXG36wn8fnmTJOzE726hQH9p6S6ZnsDsG
         Lso1dUVO4geL4mJB3IEmAvkNsG0UtGW3WnwECyQytNJlOtBmufYTON3Sdsy+aE1ZRqRi
         oLmlhV4RwgaIgX4vm0cOiAwQh3OQA1vczT5RAtwI86NBGbAU3GMZm96QLfQnyLGF4Cfu
         mU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7C7Gh5iO8tmlmQKsKFP7N50PmWc8XDX+LyCFteb17tw=;
        b=Chh/Ckp6hb/zn6mc0k7XstZ29cLUYqYwECMTcSkSs4EkF2RZYLe++qhIKhGCIjn32c
         njcq17Y9TuOTKLwgNzG1I9PNI8oVQS/+ylRKpowWOrFUHo5NPZHeglm8juIGF7PJabUn
         geSniBzKp+R0xLG4mXBmtbT6Ps588zozvlZr+CTWKyFd76lb7ivcZ72RamDaTm7dXjvR
         UOyvNaQ7uFzOqvwKI+wnjp6fQ1vI6t+ZPbgOigOIjuqaRPr4a6JLn6fnmjkW1ymjUn+K
         ggSPnFUc1ogZH7ND0SeV7ePAIGWHoVtXdGuf3TNsQN/dkUgtvsDUSifzdha0FR8f/0hv
         DK+w==
X-Gm-Message-State: ACrzQf1v5ZzXNKI2RgSJ4iNYIdbx/lcr6RuSns7CzCI20GsfuftD6kVl
        bbf7R+i9cATDLKvq0fY3DCCBLoGpBvgZHw==
X-Google-Smtp-Source: AMsMyM4kWC7L7n0CSqtnXqJa/ZYGzj34wMrvdjJt1nZRVEm+xdjwSS/nG6RAF60VDlLdMIRSfdXpXw==
X-Received: by 2002:a05:6512:b08:b0:4a1:d704:fc59 with SMTP id w8-20020a0565120b0800b004a1d704fc59mr5116375lfu.629.1664347629778;
        Tue, 27 Sep 2022 23:47:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id cf32-20020a056512282000b0049adf925d00sm386736lfb.1.2022.09.27.23.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 23:47:08 -0700 (PDT)
Message-ID: <f7ea53ce-421f-f608-ba50-f107a7f5cb87@linaro.org>
Date:   Wed, 28 Sep 2022 08:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
 <f1057c78-39a2-6b26-f3c9-51cd99450dd2@linaro.org>
 <a6e94553-c62f-128a-4122-94483b02bee7@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a6e94553-c62f-128a-4122-94483b02bee7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 08:00, Manikanta Pubbisetty wrote:
> On 9/26/2022 2:30 PM, Krzysztof Kozlowski wrote:
>> On 26/09/2022 06:57, Manikanta Pubbisetty wrote:
>>> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
>>> WiFi hardware on SC7280 SoC.
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>
>>> ---
>>> Changes from V1:
>>> - Rebased on ToT
>>>
>>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> index 212580316d3e..3f6a3f575339 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> @@ -752,6 +752,17 @@ wpss_smp2p_in: slave-kernel {
>>>   			interrupt-controller;
>>>   			#interrupt-cells = <2>;
>>>   		};
>>> +
>>> +		wlan_smp2p_out: wlan-ap-to-wpss {
>>
>> Does not look like you tested the DTS against bindings. Please run `make
>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>> for instructions).
>>
> 
> I'm sorry I was not aware of checking the DTS against bindings. I'll do 
> the due diligence going forward. `make dtbs_check is throwing error of 
> "No rule to make target". Not sure if we need pass any options to the 
> command. I did try to understand the problem but all went in vain. Pls 
> help understand if I'm missing anything.

There is doc explaining possible usage, but in general works perfect
without argument. If you do not have such target, means you run it on
some ancient kernel, so anyway patch cannot be accepted and has to be
rebased. Please always develop on newest kernel - newest mainline rc,
maintainer's for-next branch or linux-next.

Best regards,
Krzysztof

