Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150D4584FFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jul 2022 14:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiG2MKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jul 2022 08:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbiG2MKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jul 2022 08:10:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7E91AF35
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 05:10:28 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t22so7061490lfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gHztQlY64mdHy2DHLn2nrez1Eoj/Bn3uy1/AUYvzb2k=;
        b=NWLGtpTBA4ComR/ShPK8NB4rg+qYwmLdflgZSKyBXi1mdNnvTPb/KOdW4h0XcNkprg
         zgUHQBbGIWz1Qh3V5jQByxlzb3950PxbpzFm9ZACx+QpVeZfkQ/5RARbUCm37BkVg+rK
         P7YNtVMyQLY/7qJW4aNsuyWudwGjbmkh0eXwA2vVOx7ddvthg5pRg3I7kBKOf2M3FKSR
         62iLc5FulBt+8Hs2ij16FZtAWOfXBT8X4I92DEMl1yeRvaJKsdzwl/y3ooOBVD5pqDky
         dXItprmupElk23rK4U6SNcMCT8s5hsTjEbfwO/fg5MitVV28Ux0JFPfhMEpLLBpoZkG6
         0FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gHztQlY64mdHy2DHLn2nrez1Eoj/Bn3uy1/AUYvzb2k=;
        b=yxxHhXzfiejtjKm4SguIHNkVzU1PBMmwHQgQ9U3YY3oLOa4FuPRd5topqB9lhL/hxm
         8Wenq1gK5wr/KUUJ84j5jh7I4je6IlTjcM3jwogFaG8NXomC7HnAJo+6oBTqOSlU9XiB
         s+ReC8mhE0F827iETXYNtB9pu6G3BVw0VoNu25HjFufsRfoP0g/tZHlq5e5OpQayfuHo
         BIgINaBr+8TabkHIJdChMEl9C4VHYOGk45Uz+wiPbpaaSop/GBOJ4TwzZwmZDBkbSt7w
         Wjyt9Ob/w4RwNyU5GEkcOEHgM3lDDy6/U8lNglK+UYirLiAJ/Nchz1ngDJo0n2UunX0W
         0IWg==
X-Gm-Message-State: AJIora/anR/EGyhUlyYlzdLSI0P/6Mg0kTZwb7g3ypi+aZPFsGWI06ba
        rPyRY5/vXcRyWF7IIZSGwuUPBQ==
X-Google-Smtp-Source: AGRyM1uA4QT+1iLCWuI4nUj/MXORLLJTPvfK4QslVnCSyhfKkIJUNV2Zlx+O/sWn3K+wFK+VZewLwQ==
X-Received: by 2002:a05:6512:a96:b0:485:6bfa:e346 with SMTP id m22-20020a0565120a9600b004856bfae346mr1188284lfu.52.1659096626712;
        Fri, 29 Jul 2022 05:10:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 27-20020ac25f5b000000b0048ae5aa61d7sm81084lfz.3.2022.07.29.05.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 05:10:26 -0700 (PDT)
Message-ID: <8b364bff-f22a-395d-578f-9d32a7555e68@linaro.org>
Date:   Fri, 29 Jul 2022 15:10:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8960: add reference to sleep_clk
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Shinjo Park <peremen@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220728111603.30503-1-peremen@gmail.com>
 <66e15d42-96fd-5b02-b7c8-a284d3f8d21f@linaro.org>
 <f932415d-3bee-0948-a016-a2e837dd7256@linaro.org>
 <f0a4790d-7739-3bc5-b877-2dacbdb5158b@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f0a4790d-7739-3bc5-b877-2dacbdb5158b@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/07/2022 15:01, Konrad Dybcio wrote:
> 
> 
> On 29.07.2022 13:33, Dmitry Baryshkov wrote:
>> On 28/07/2022 14:51, Krzysztof Kozlowski wrote:
>>> On 28/07/2022 13:16, Shinjo Park wrote:
>>>> Change the reference of sleep_clk to the same as qcom-apq8064.dtsi.
>>>
>>> You add label, not change something.
>>>
>>>>
>>>> Signed-off-by: Shinjo Park <peremen@gmail.com>
>>>> Reviewed-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>>    arch/arm/boot/dts/qcom-msm8960.dtsi | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
>>>> index e8cd1c9c0..991eb1948 100644
>>>> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
>>>> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
>>>> @@ -71,7 +71,7 @@ pxo_board: pxo_board {
>>>>                clock-output-names = "pxo_board";
>>>>            };
>>>>    -        sleep_clk {
>>>> +        sleep_clk: sleep_clk {
>>>
>>> Since you touch the line, make the device node sleep-clk (device node
>>> names should not have underscores) and mention this in commit msg.
>>
>>
>> Then we are back to the compat issues, since the gcc expects the 'sleep_clk' clock.
> clock-output-names = "sleep_clk";

Ack then. Didn't notice that msm8960 has one.


-- 
With best wishes
Dmitry
