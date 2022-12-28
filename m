Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525CA657474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 10:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbiL1JIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 04:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiL1JIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 04:08:06 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B83BD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 01:08:03 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bt23so6152537lfb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 01:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HNDGl0CkeiVnfu4DKkljwbpaMCU00subuxv0w1IOF4=;
        b=B2b0rr/+3MbCnHJ7koxvaWUEBxLj7XcfLLDkocukvaP28KWiXboGL3BgqxKn0QaNtm
         w1g7lDbqOG0zMNS3MpaOYFI13h4oTd0w8eMxz3rOnuFxfQVjeKcSD/9710JOunsziCNt
         pxqRa42efjQ62TmVUJRAP+jdj2Tmpt6Yu8XK6y7jZPp4YqB6dxknKOVa9kr6lOJ3hTzY
         Adn0yOLNprf6ZDcGkX7+npRHBLc/qMJFzGEYKa/Q3Ib67fHk+oqoSsj1FbnuSuETN6ua
         jWYeXldEtJOTdXjccGAtFdlVlTtTOnn5z009Fz7kbMdoEPG6N/w+Yz9yrRHSz+QHxv0b
         NiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HNDGl0CkeiVnfu4DKkljwbpaMCU00subuxv0w1IOF4=;
        b=raQ2+GTcG5MbF4qdlb4Wvo/btHJmICTh9E2wQfuc0fnfdMacuxG284q+34Lm8zzKhl
         0gaISK7p+rRw1q4eJhb8B3+W6oEWunaK/HFtTrMNDwVEWVKkCPSLxN5fyA2c6wrNFMmA
         21uThbNo4DC5mkXdmKmFu/BY2nqG1IIso60NMsW3uiic2bourSENRdvQe4K7TEoceO40
         /JAiZK7Mfs08iy9JDTFd3UXsNKuFj17+wCc1T3SwcZzG/XTKVg6kMkD91RTs3B7E/i/H
         CNOK1pA9XLL6CEpWvSbT+RDhgwKznIPbSxZhIsUm4S3D9p4qriiZKWOyStQdk0FcXOsZ
         5zYQ==
X-Gm-Message-State: AFqh2kqmAe3vFPxo2AJztjt6a76B0NEdu2pM3McOhmO3UaliaiJhMFag
        1ULBnYUxEL4dFLUpYitTQteiUg==
X-Google-Smtp-Source: AMrXdXvgnBhT/wBJ+njx2CS8B902YKZjIykvEHjKmdUXjX1vspPf1TvfXGSrKDSbMHha4vZSIRqBXw==
X-Received: by 2002:a05:6512:3ba1:b0:4b5:8fbf:7dd6 with SMTP id g33-20020a0565123ba100b004b58fbf7dd6mr12347056lfv.61.1672218481618;
        Wed, 28 Dec 2022 01:08:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a1-20020a056512200100b004cafe989c6dsm1873287lfb.91.2022.12.28.01.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 01:08:01 -0800 (PST)
Message-ID: <f03e693a-cb65-fef6-2070-7c94230188d3@linaro.org>
Date:   Wed, 28 Dec 2022 10:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add wifi alias for
 SC7280-idp
Content-Language: en-US
To:     "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, quic_mpubbise@quicinc.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221223073353.20612-1-quic_youghand@quicinc.com>
 <8f9ddaeb-5481-85e2-314e-8c2a99bd48c0@linaro.org>
 <50adff46-be9e-7f4f-74dd-7e71b84bd3ac@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <50adff46-be9e-7f4f-74dd-7e71b84bd3ac@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 28/12/2022 08:02, Youghandhar Chintala (Temp) wrote:
> 
> On 12/23/2022 1:29 PM, Krzysztof Kozlowski wrote:
>> On 23/12/2022 08:33, Youghandhar Chintala wrote:
>>> Currently, the boot loader code used in the SC7280 SoC accesses
>>> the WiFi node using node names (wifi@<addr>). Since the bootloader
>>> is a common code that is used in SoCs having different WiFi chipsets,
>>> it is better if the bootloader code accesses the WiFi node using
>>> a WiFi alias. The advantage of this method is that the boot loader
>>> code need not be changed for every new WiFi chip.
>>> Therefore, add wifi alias entry for SC7280-idp device tree
>> Sounds good but which bootloader.
>>
>> Best regards,
>> Krzysztof
> 
> Depth-charge Chrome OS bootloader.

Put it in the commit msg.

Best regards,
Krzysztof

