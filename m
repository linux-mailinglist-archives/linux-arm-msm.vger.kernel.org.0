Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2385F2BDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 10:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiJCIcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 04:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiJCIby (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 04:31:54 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4F87FE43
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 01:04:25 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b6so10857934ljr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 01:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eHR2QgoMMUuKS7OLDjdoZFbdNgv1Xu+YNA1WXwRK1CM=;
        b=jtWSJTj7FThxxMEIQaEBiGjssqNRWufiPt1iqtIMhsz5xdGzv6Rhtdyd1p152+AB6M
         fHlMAVw+Z+/rndjcjHVaCILYlfusjwTN/+3wCXE19ZqCp+Ij99W6uAOdnr0mQMje+JzR
         jeQx7pWzkIx4WtecGf1DOBh76pYUqypWPB9ywTGvrFL/o4j8sI6r5l7izZ1RMEqIA5Yd
         zIQ4cT0e28RM8MOIHA/2LPgSka9Apo2cO4/Kl5CC46PSW0NNsQUHYq6zUZQjQqNO6MnI
         CNIJz/bRNDwU0KmhGqA2NPmJNoTGnweq5PZLwEOpfsxV8dgr63OC9+Vt109zdzF2H9oa
         otAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eHR2QgoMMUuKS7OLDjdoZFbdNgv1Xu+YNA1WXwRK1CM=;
        b=Z3RWopgJCN+0y/wUNIwjsi9MZ0dsY4IabJ0qSbqZmFF8rr802f+MvRxjEE/BEmLL2m
         fhE+0ifVC39yyjpqUv6edt1h0U7MhO1H2MniVIccWt77bBtOlzU3z5cD1UvpSGV6V1Qs
         uZdHtqdF0L4QbVbvik+Qzsn4ctu5q01YKOto2x4XM/hWaJd9O04zu2Lg050/FMU7dYTs
         2cNpRMyRE/YYt+vMhPtO8wbDJSUr2B1MsSA+ugF3EDTKufU4c/hG0rTNaYL1EMO9srEM
         4TlSgGFZwG+UT2DfJWj8OpsgaFCH4IHc5kDD9AvypQ00NR9HtpLiKcG0gPuLmsHZC0f7
         SUkA==
X-Gm-Message-State: ACrzQf3PHP2p1aDXKVv7dQsFLxjZbFRnmTD+YKR4//WDkrCndU1XMPmL
        ap0CQX0rc/R2Lhx3g2Z28t8ACw==
X-Google-Smtp-Source: AMsMyM7RGAZ6P3MDq/as0qbW5GpLroDZI5xdw/I09pWfQWGtQnEYhchlxMK5HUYYmov3qAOVBNgh2g==
X-Received: by 2002:a05:651c:158f:b0:26b:dd9c:dca5 with SMTP id h15-20020a05651c158f00b0026bdd9cdca5mr6066893ljq.400.1664784259201;
        Mon, 03 Oct 2022 01:04:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z7-20020a2eb527000000b0026dc69247e8sm348456ljm.99.2022.10.03.01.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 01:04:18 -0700 (PDT)
Message-ID: <f9ecdb22-2827-989e-ada2-9eec95dba687@linaro.org>
Date:   Mon, 3 Oct 2022 10:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
Content-Language: en-US
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
 <f1057c78-39a2-6b26-f3c9-51cd99450dd2@linaro.org>
 <a6e94553-c62f-128a-4122-94483b02bee7@quicinc.com>
 <f7ea53ce-421f-f608-ba50-f107a7f5cb87@linaro.org>
 <d215c841-987a-bf53-0c62-d8688cbd4e6b@quicinc.com>
 <fc390436-92a3-2b2a-0078-cf50a9073b8c@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc390436-92a3-2b2a-0078-cf50a9073b8c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2022 09:59, Manikanta Pubbisetty wrote:
> On 10/3/2022 10:25 AM, Manikanta Pubbisetty wrote:
>> On 9/28/2022 12:17 PM, Krzysztof Kozlowski wrote:
>>> On 28/09/2022 08:00, Manikanta Pubbisetty wrote:
>>>> On 9/26/2022 2:30 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/09/2022 06:57, Manikanta Pubbisetty wrote:
>>>>>> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
>>>>>> WiFi hardware on SC7280 SoC.
>>>>>>
>>>>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>>>>
>>>>> Thank you for your patch. There is something to discuss/improve.
>>>>>
>>>>>
>>>>>> ---
>>>>>> Changes from V1:
>>>>>> - Rebased on ToT
>>>>>>
>>>>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
>>>>>>    1 file changed, 13 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>>>>>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>> index 212580316d3e..3f6a3f575339 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>> @@ -752,6 +752,17 @@ wpss_smp2p_in: slave-kernel {
>>>>>>                interrupt-controller;
>>>>>>                #interrupt-cells = <2>;
>>>>>>            };
>>>>>> +
>>>>>> +        wlan_smp2p_out: wlan-ap-to-wpss {
>>>>>
>>>>> Does not look like you tested the DTS against bindings. Please run 
>>>>> `make
>>>>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>>>>> for instructions).
>>>>>
>>>>
>>>> I'm sorry I was not aware of checking the DTS against bindings. I'll do
>>>> the due diligence going forward. `make dtbs_check is throwing error of
>>>> "No rule to make target". Not sure if we need pass any options to the
>>>> command. I did try to understand the problem but all went in vain. Pls
>>>> help understand if I'm missing anything.
>>>
>>> There is doc explaining possible usage, but in general works perfect
>>> without argument. If you do not have such target, means you run it on
>>> some ancient kernel, so anyway patch cannot be accepted and has to be
>>> rebased. Please always develop on newest kernel - newest mainline rc,
>>> maintainer's for-next branch or linux-next.
>>>
>>
>> I'm working on the latest kernel (ath.git which is maintained by Kalle 
>> Valo for Atheros drivers). I'll give a try on the linux-next branch once.
>>
>> Thanks for the suggestions.
>>
> 
> Hi Krzysztof,
> 
> I have tested the DTS against the bindings. Have used this command `make 
> CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 dtbs_check -m 
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml`.
> 
> `make dtbs_check` did not report any error.

You selected some schema to test, so yes, maybe it passes. It's not a
proof of anything. Run with either applicable bindings (the one which I
commented about) or with all of them.

If you did it, you would see the check will fail. The bindings would
report error. There is no need to engage reviewers if bindings find the
errors for you, right?

Nodes you added here are not allowed.

Best regards,
Krzysztof

