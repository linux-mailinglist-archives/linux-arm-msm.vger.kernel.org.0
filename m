Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25EE219D49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 12:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgGIKOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 06:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgGIKOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 06:14:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84969C061A0B
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 03:14:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a6so5922205wmm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=EdJcMELcthlDuY9xHxoVencJsrBLCFGF9m0johet/ww=;
        b=UJZ3Pq2lQvZrHoPFy83st7M+51QEIC/LQ8bp4CFNl2fiPjmceby6B6CHhX7QamJY2B
         SiYp/zULqND+soVhhncku29XgNcrRjS+mYHjV1F/fK2ijnFpTPN/AhCpqHRfKaWDVnQ0
         f591hcJu6xxqPGzIXIrZSP7WGg0Cr3j9sYhXCqOwyRJAoPfgXKUdTAeApXqQedAjEiLb
         tuUdsOA/KZ0qzgVw5aC96BMI6xhxiwIoWB23tHrYBPx8rJ1pBXytYApVTWEYJX+vIUSV
         Cv6LMrdoMX4TMj35h84hKB/jRN+H9zZzqWAnl/94YEshyidC4BxPXHDqbaNrdT6UICTC
         2jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EdJcMELcthlDuY9xHxoVencJsrBLCFGF9m0johet/ww=;
        b=fbC4HNXCVCV/X70OEVxKnnnBjf37ermBsUDlpb8CxCKlU/AY5S89WFqSumRn5Bfhb7
         q5v4uR0zpUyCc5Bcft8nBzQbYydFoz9ZKQ9jrcYcIe1xsI2OxJMC+ix/qVl3Lh0kr9+n
         s1f8qPZBWNE/6O2N1IDrFWeSMEcvs61isFsuaA4DECbVEk5IdQBXGxm/LYvi51PBDt1k
         O3yriCRYquYrq/P/bXJbo5DvUkJATPqUDFzHnYSTI2Ojz1GvgYX9USNI6WfT49Gmo63H
         EIeOVIHDvGrpH1rqg7NRMPg57o2jhnnJkYUxlM2PdLHCyRCwzQFKOd7+RKiFLQLAkJJD
         qNzA==
X-Gm-Message-State: AOAM531tNn+8d4aV/nkmGi/9fNE4zv22VSpwbFGM7xlnfegnQlzlDjX1
        bydqxKqC4DzjYbgy/cElGLZWjQ==
X-Google-Smtp-Source: ABdhPJw3r/2yonhG+vBITS/6ocpyqi7TtjJdFCT1TGe0KMLudE/GdnjQXeNN8r3mG71V18tFHSeGWA==
X-Received: by 2002:a1c:1d93:: with SMTP id d141mr12930034wmd.14.1594289662140;
        Thu, 09 Jul 2020 03:14:22 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id h84sm4367967wme.22.2020.07.09.03.14.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:14:21 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To:     Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
 <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
 <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
 <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <78a55ead-d6c1-578c-0fb6-78dd0ef117b6@linaro.org>
Date:   Thu, 9 Jul 2020 11:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/07/2020 11:12, Rohit Kumar wrote:
> 
> On 7/9/2020 3:38 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 09/07/2020 11:01, Rohit Kumar wrote:
>>>
>>> On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 08/07/2020 06:08, Rohit kumar wrote:
>>>>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>>>>
>>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>>>>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>> index 32c2cdb..04e34cc 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies 
>>>>> Low-Power Audio SubSystem (LPASS).
>>>>>     Required properties:
>>>>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>>>>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>>>> +              "qcom,lpass-cpu-sc7180"
>>>>>   - clocks        : Must contain an entry for each entry in 
>>>>> clock-names.
>>>>>   - clock-names        : A list which must include the following 
>>>>> entries:
>>>>>                   * "ahbix-clk"
>>>>
>>>> Can you also list the clocks that are mandatory for this SoC.
>>>>
>>>> --srini
>>>>
>>> Will it be fine if I update it in patch 8 only where we have moved to 
>>> yaml format?
>>>
>> May be reverse the order, Convert to Yaml first and then add sc7180!
> 
> Actually Mark suggested to keep yaml change at the end of patch series 
> as there
> 
> are pending yaml patch reviews and it might take time. If we keep yaml 
> change before sc7180
> 
> change, then it will get blocked until yaml review. For now, I can 
> update in exisiting
> 
> documentation. Please suggest.
Then these clocks need to be documented in this patch itself!

--srini
> 
> Thanks
> 
>>
>> --srini
>>> Thanks,
>>>
>>> Rohit
>>>
>>>>
>>>>>
