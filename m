Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0F0477030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 12:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236729AbhLPL1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 06:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhLPL1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 06:27:50 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A21C06173F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 03:27:49 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j9so11469489wrc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 03:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9fWCRnVdOOzFGcrBXpfhDFH9QuGHzW7m91vqKatt5Iw=;
        b=YIEoFioLtC+SI0StojlZcJvyL1PmlKMDlhsop5A/+JXq2B5MGddC5wLf2dOjH5mnui
         4s/izDJgJBn1nMVNvbtpJkVGYOGmkLQhkqcdPb31W+jWF/Gd00V+iwUoy7IBowhmXLtB
         amkBrniO0wftVBiPtf1Ovq5SUHhvBWyRuzaUmRMDgDQd90hTk3bsTlMfWrrV0FmTE/OG
         41SRgC6kNzdvIQGjysWBLPbb7d/PG0pdpuTYpv/C9r/OQ6H0f0ZzBhFWV8UvrJ5oOdCf
         WGWMdM1rEDPk/bI8NBy5W0VuEOusFIUCOX02/DGbDkbLBje0w04XsX2qAdJDOAs1N5wy
         RxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9fWCRnVdOOzFGcrBXpfhDFH9QuGHzW7m91vqKatt5Iw=;
        b=CgIwV9WiBcd34cNfmsVcBHsdX0S8PNgff/yy1F3RMbMKoR9rNk0Ub1sfgvSel/W1hD
         WKZxUIRgsEnPkBE5YMiFC+4hVtIdc3tnU/dh+nejAPFtjth+61rcf+93Q7GLNa0zM4FB
         ldXuToj3pzTQYxgdHUum2Vx+ABHUCmOWCEfrkDpvgBd5qnnLYoURu9n5A1hqsOaNDsBT
         3xNtcO4GIBq+UYMwt5E9zC4rBPBCgt5b7IXZNznf+w88qlqPg5aQFSw7lF63+UX0bIBt
         pqX7vcWF+nyTMuVvrNBTvkz7hiE4/rZVkXpKpPDWTKlbOoW0yejYW6epPVXzP8aPOaL2
         atYQ==
X-Gm-Message-State: AOAM530ZphXqZ75ZAX/5nbYuR0vHBeVi/TRkUsiYW6P5ggLMtpaKpFws
        8znx6b0A6PC2Q5ZKzzEFSSBlbpra4ijIFw==
X-Google-Smtp-Source: ABdhPJxXTVKkdm9aLStthz8vf0frLQ9O2+kupvdzyWPxYXoRjLLnWixOIlal+sdFIAgvo07KsKgxBA==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr8146112wrw.146.1639654068241;
        Thu, 16 Dec 2021 03:27:48 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id v1sm865876wru.45.2021.12.16.03.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 03:27:47 -0800 (PST)
Subject: Re: [PATCH v2 5/8] dt-bindings: misc: add property to support
 non-secure DSP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
 <20211209120626.26373-6-srinivas.kandagatla@linaro.org>
 <Ybdq4qAeqK8C8Yvc@ripper>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4fd726d7-608f-0ddd-7338-6f8cac3ef775@linaro.org>
Date:   Thu, 16 Dec 2021 11:27:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybdq4qAeqK8C8Yvc@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/12/2021 15:46, Bjorn Andersson wrote:
> On Thu 09 Dec 04:06 PST 2021, Srinivas Kandagatla wrote:
> 
>> From: Jeya R <jeyr@codeaurora.org>
>>
>> Add property to set DSP domain as non-secure.
>>
>> ADSP/MDSP/SDSP are by default secured, where as CDSP can be either be
>> secured/unsecured.
>> non-secured Compute DSP would allow users to load unsigned process
>> and run hexagon instructions, but limiting access to secured hardware
>> within the DSP.
>>
>> Based on this flag device nodes for secured and unsecured are created.
>>
>> Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>
>> This patch has dependency this yaml conversion patch:
>> https://lore.kernel.org/lkml/20211208101508.24582-1-david@ixit.cz/T/
>>
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index f42ab208a7fc..f0df0a3bf69f 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -29,6 +29,11 @@ properties:
>>           - sdsp
>>           - cdsp
>>   
>> +  qcom,non-secure-domain:
>> +    type: boolean
>> +    description: >
>> +      Property to specify that dsp domain is non-secure.

> 
> "non-secure" feels vague, how about expressing it as "Specifies that the
> domains of this DSP instance may run unsigned programs."

TBH I dont mind either of this, but looking at some existing bindings I 
see similar pattern of properties like.. "st,non-secure-otp"

> 
> Perhaps even go so far to name the property
> qcom,allow-unsigned-programs? (Or some other word for "program"?)

Do you think adding more details in the description would help?

--srini
> 
> Regards,
> Bjorn
> 
>> +
>>     '#address-cells':
>>       const: 1
>>   
>> -- 
>> 2.21.0
>>
