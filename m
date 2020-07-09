Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73624219D06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 12:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgGIKIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 06:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgGIKIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 06:08:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9658C061A0B
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 03:08:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k6so1728528wrn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=JjKVHO1k5x52mPl9MQPkeK0c6PmSLam18blFZkKOw/o=;
        b=Qn/Yqd4sMNB1Dt3OO0i55SPIfFAoJlwYB8ZQBscEDiY6iVKMZLcUhWVYnovxjTSkOi
         MVe6Ix2mUDb3Sxfgt+fL+u/h8xnSpfc7WjdzTz/YaImys+o8IOxRIcalTZCMonT9JiNU
         d4EkZ48hD0Srbjk62AUGu/4atgEaJjCLQPQ08nM5bWHGnVh7z8b87aVmhfFgXHJidVJa
         R8/ke1nR45bLvZf7o0A+Qq8RK3/dpCJDHNUD7+19cIRKx5OkW3mln8yAf//JVais7LtZ
         ziGYMXsSjPuXi9ERpNeDO6yEwtldJlV4P2LVn2czFZ2HWwKlzF2yC64Ly0XbOF4sw5Zw
         NEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JjKVHO1k5x52mPl9MQPkeK0c6PmSLam18blFZkKOw/o=;
        b=nK7g+uaFKT4Q9Q/j08tHYd5KbcXMXbtymrBhbbgEabf7wz5d+2HbUOH7q7aSuIgJsz
         2gjwyNKBUdlIua4UvyO6AMz8nxSVK+vUjiErtYI4MXbcmUIbd3mJED1rK4sIInOZgzuV
         t7IeENoD2Gq7H9kSRwsVQCV4mfJLibl4SIyW2IezXy36Mo8SSN5G/N4efsFwj6SGD+zl
         iRid+ptJF3q8uGIIViQbujhwNJ3VrSIQvmPFet52lyO8UnfHdL4z/Q029gDbfcT5TVzq
         RixwTPP/hM9nTnnl3QUzLLEQ02LAR6O8wvnRNfnvRln3AqCdymYKEy3pnPi7jUTvleFg
         DHLQ==
X-Gm-Message-State: AOAM530up5/OeAoVd2Cpxr3Rn9A9uU7YL6G7NSmdtsaIPqbsT58UQMvB
        XFq6h4r8llxShgkZw/yrlmiKog==
X-Google-Smtp-Source: ABdhPJzsyr80M22TsA9o73abnx9q/28mo6g8jAZPiIIkKycC86esPT4I01tjiaBvuW/qUrs/Pt+xmg==
X-Received: by 2002:adf:9524:: with SMTP id 33mr61596613wrs.156.1594289285409;
        Thu, 09 Jul 2020 03:08:05 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id p14sm5216290wrj.14.2020.07.09.03.08.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:08:04 -0700 (PDT)
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
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
Date:   Thu, 9 Jul 2020 11:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/07/2020 11:01, Rohit Kumar wrote:
> 
> On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/07/2020 06:08, Rohit kumar wrote:
>>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>>
>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> index 32c2cdb..04e34cc 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power 
>>> Audio SubSystem (LPASS).
>>>     Required properties:
>>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>> +              "qcom,lpass-cpu-sc7180"
>>>   - clocks        : Must contain an entry for each entry in clock-names.
>>>   - clock-names        : A list which must include the following 
>>> entries:
>>>                   * "ahbix-clk"
>>
>> Can you also list the clocks that are mandatory for this SoC.
>>
>> --srini
>>
> Will it be fine if I update it in patch 8 only where we have moved to 
> yaml format?
> 
May be reverse the order, Convert to Yaml first and then add sc7180!

--srini
> Thanks,
> 
> Rohit
> 
>>
>>>
