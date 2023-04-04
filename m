Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0719B6D5C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 12:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234307AbjDDKFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 06:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbjDDKFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 06:05:18 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9937D1BD6
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 03:05:16 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id i5so128509126eda.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680602715;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjayMEV5QaFKlB9zHmuTXAO/+2Ho8eAyyfq241H9MIY=;
        b=RKX9KBQE7CSenoHERm5grJ39vRS3iy9fJJ/pwJcseqIwRTVP0fWqJmLj+aci3KMDVS
         S4a7SE2FQQF4+vq8p8o4acfQlunAIUHvCcH3uYuN4iE8Nix0eFnMUSGpOHc8x1MsIslT
         w1wDb2P4fR/SIxMeHAV2RFtehd4IqagaT0MlBmt0EgsewKL0h58bG69JgmXFcup5Sf7S
         KJEQQO8dY6KWNDALYRzGw2mWu7/I1oH+DcI50MCIOdBCm/zcxcc9O1sx2CO74ETp20KG
         8rcuxTXfkDVOFjkG0td19AU8HTybYut4GHvrIGjKQap1FDhyAoFpGukV9QkgOgvt7cFV
         L1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680602715;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjayMEV5QaFKlB9zHmuTXAO/+2Ho8eAyyfq241H9MIY=;
        b=XWMDjRrg0UoIWmkKUsRRp5sa4Y/TIuUVlESZBGZnfYjFtkSUwrW2rbr34IFg+ImX/+
         dyVJlvRLJDeA5PpsAacovFhSXJTbRcX6akqkwnpCyeBE9Or57tdDixKTm++NAldXIrea
         eNqW0EP7eOnWropM33EUIVHFThbo06tLZVxtg1mebhkhCMYiHtU7AyIQD2sAMbhZOXNP
         vFey5/W2J9GpdZrAPv4hjKb0J1oNwQ5MqVoySi5g+dN0/AygNjYsH5VyGliOUmINZ8te
         J7eLtpuoUpSK7BL7WaqRJtG0EroS5MBqKontuhsMvDfGqrVHYAlngJvKvvcMdL4jQ7/h
         +Q2Q==
X-Gm-Message-State: AAQBX9eSVec+4ddEX/KwlYSgxUEvsIvxg5s3kSHDes7T2gN0qroHzLWt
        U6/ECu7yO6croDqzMxlp/OXGbg==
X-Google-Smtp-Source: AKy350aCde/xOOCJklU26ryFnCFR5qUYNQqMaoDs9fAXWxmtNfgi1dtlwfM6c6VboJbBGsai2TCqDQ==
X-Received: by 2002:a17:907:7da4:b0:947:793d:b5c4 with SMTP id oz36-20020a1709077da400b00947793db5c4mr1997959ejc.64.1680602715043;
        Tue, 04 Apr 2023 03:05:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:99ed:4575:6001:8bda? ([2a02:810d:15c0:828:99ed:4575:6001:8bda])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906100c00b0093295ea18c4sm5742141ejm.67.2023.04.04.03.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 03:05:14 -0700 (PDT)
Message-ID: <bfdd1603-0e2d-8ad7-5e87-e2a9f94b1c6c@linaro.org>
Date:   Tue, 4 Apr 2023 12:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 8/9] arm64: dts: qcom: qcm2290: Add WCN3990 Wi-Fi node
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
 <20230403-topic-rb1_qcm-v1-8-ca849b62ba07@linaro.org>
 <4816461e-38b7-ba79-dd64-859fa0ee808e@linaro.org>
 <a295af57-f8d1-35c2-77e8-7d29d043e47e@linaro.org>
 <15d590ac-0b50-4190-4e27-d8912e2f66ec@linaro.org>
In-Reply-To: <15d590ac-0b50-4190-4e27-d8912e2f66ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/04/2023 12:04, Krzysztof Kozlowski wrote:
> On 04/04/2023 11:55, Konrad Dybcio wrote:
>>
>>
>> On 4.04.2023 08:08, Krzysztof Kozlowski wrote:
>>> On 03/04/2023 19:36, Konrad Dybcio wrote:
>>>> Add a node for the ATH10K SNoC-managed WCN3990 Wi-Fi.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>
>>> We had these talks a lot... All these 3-8 patches should be two patches:
>>> 1. SoC DTSI
>>> 2. Board DTS.
>>>
>>> Splitting superficially patchset on initial submission does not make
>>> sense. If you sent it in separate patchsets during development - release
>>> early, release often - then of course it would be fine. But hoarding
>>> patches till everything is ready is not the approach we want (and we
>>> made it clear that SM8550 should be the last such platform)
>> That wasn't my intention.
>>
>> This patchset is "feature-rich", as it piggybacks off of Shawn and Loic
>> having submitted the driver parts long long ago and SM6115 being quite
>> well-supported (and almost identical to the QCM). Patches 4-8 were not
>> "held hostage" waiting for full fat platform enablement, but were
>> essentially "copy-paste, adjust, verify" and that does not require a
>> lot of manpower or time.. I split them to ease the review (~850 LoC @
>> PATCH 3, ~1900 LoC @ PATCH 8).
>>
>> In any case, the fact that there's so many features submitted with
>> the initial posting is not related to me holding onto them on
>> purpose, they were created together, probably within 20 minutes of
>> each other.. This should have been posted a long time ago with even
>> more things (like regulators), but there's been some communication
>> issues with Qualcomm..
>>
>> LMK how you want me to proceed with this.
> 
> All these 3-8 patches should be two patches. If you have separate PMIC,
> then could be three patches.

Correction: 3-9 should be combined. 9 is even more surprising, because
it is a four-liner...

Best regards,
Krzysztof

