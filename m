Return-Path: <linux-arm-msm+bounces-17228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143A8A13D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 14:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3404F1C213F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1BD14AD25;
	Thu, 11 Apr 2024 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="Vy41shpt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33383143898
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712836922; cv=none; b=dFUt0cmEUpSyTfW7l29DjU4NyCgSQWUY22R47LHkOezL9hTP8FK4GZyu+1y0nqr8+POEEwUJr1qeehBUXMZT+iTj6MM+GBdS0noRvR1CWAnQsLKswW1OyUqQSEHNFUoe/pRPLg3ROMAaeJcxHyIOL7aWFiswlaw4v0qx2YHTrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712836922; c=relaxed/simple;
	bh=doOhwiBjpxxQqY1rLrcrBqjVSCV6vzFMDlK3AJSyZz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y90wMXnfbA3H9fP7bL6bggcOXzpQnKx7rHbnhbvtJE0UZCvclGjWOUOd8I7cosZAND6/rGyQCSASy5BBatxaPG7H7R9XtI51nO0JK1VR2+kkz5fGoskdfijxyVhcUhvfUwE4Yz/sJFyj7+MEawyX+5BSXAXoHwAd5fZNYeBjIaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=Vy41shpt; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d895138ce6so51908491fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 05:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1712836918; x=1713441718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwD98CwQhR7Q3CQUV5z/ptQ0GppSR1Tt0Ic2tF4GPa0=;
        b=Vy41shptEKfU5rCAyH+3FZAL8D8PLEiJTcwl3inQUK1eQCHT2Ak7pvx9Lp8ImtbWv9
         AmD5kh3pNIVHeVnu2tghHGdjCXbxROAcx8AhSPLPEaDCAOqFtmaIQnfY5zNpk1gpyi87
         Fic19HkC2LoQVXRfpSCdGVz7nMy1xmMgMDRtufH/RSlgLNV57gv/GH0B4oVbJaNIKMbQ
         tTIBwpamKEyGaqYcxsZgJUy/bMs4Bk5ucCKLSwN6ZMo9I/0YtXDPojiez9Vr7+IoS3OE
         U4EyCkZOAjqG093+X5eQejtbOcPOqSXqdevL7/GsPYT42RJLABwkesHCI9i7qEg7iBP+
         cTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712836918; x=1713441718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwD98CwQhR7Q3CQUV5z/ptQ0GppSR1Tt0Ic2tF4GPa0=;
        b=Gmhf/1ZwuiYcDh59gANc44aAmbu8WPTYU+1PlE/NF+EbTO5ZzdiOcpEZddhwIRR5sZ
         NlLTEeS/G+6T6yF1OlZJ+0+PKvRgZlPTq5UpWBQqI+zZ98+mU0SPbHJSUKD1ZCyV2FW3
         GD+5uavcKUI6Iukn0rwjQLymZCPEuxN2pI0gaJfNJni+MhW9DvqIMEYiZ15r0YpIv1fh
         bvUrhV+rReEuiRsQx83zbxdDTBHFpN/wfy5mUFbo/PnkW+Y7QrRCKVveT6EpCyibcb8P
         lqO7tYOKAk/dtkA05RTKl1J5q+Ra2UhKqQaic5NK9z2hrPxFJS31C2/rtKXVO5ENn4x+
         ix1g==
X-Forwarded-Encrypted: i=1; AJvYcCX06dHJprKLtafy8lybnr0Gg3t5HRLV4a17jqmoNn8c97JDoKwmgkAVeR43pLJdyq9MbZM0ptjYduRQtQ094pAu7s2ce7C+jjmYLAmeTA==
X-Gm-Message-State: AOJu0YwagXktzbd83eFkejeHS8N0BeWxLv1iG4yWgoiFl6eYHN+3duDB
	JXUqgp0QM35cWNqZyY4V97iEobFKOVrVkBkUZzOesKS6mJkp3gkW1GLMFQoY2dM=
X-Google-Smtp-Source: AGHT+IEurZPeKh17aFb51dEYvQ9h/gbXT4M0UIujnkjMsVpDjMrgk2goKbLwPQw063dBf0HZNY1mSg==
X-Received: by 2002:a2e:9d06:0:b0:2d8:9487:7588 with SMTP id t6-20020a2e9d06000000b002d894877588mr3768627lji.38.1712836917974;
        Thu, 11 Apr 2024 05:01:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b0041643c9cb0dsm5356812wms.42.2024.04.11.05.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:01:57 -0700 (PDT)
Message-ID: <e2399efa-b326-4921-8115-dbfcecd5f9ed@nexus-software.ie>
Date: Thu, 11 Apr 2024 13:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document
 sc8280xp compatible""
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
 <94779d2c-d159-4429-b0b2-6baa83461bbd@linaro.org>
 <1b4f745b-67d3-4044-9b89-de6c2c496af5@linaro.org>
 <b6d9702d-4736-44cf-9a52-b476af4bf94c@linaro.org>
 <7ef1c0e0-bd28-43f1-a46e-4fa551714e82@linaro.org>
 <d6a92b15-f68e-4e01-aad1-6483d53b9ad9@nexus-software.ie>
 <dee67a35-62bc-4ef0-b57a-d163c6679c6b@linaro.org>
 <acca5b79-6c53-4339-b5eb-5a81b7048139@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <acca5b79-6c53-4339-b5eb-5a81b7048139@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 12:57, Bryan O'Donoghue wrote:
> On 11/04/2024 11:28, Krzysztof Kozlowski wrote:
>> On 11/04/2024 12:24, Bryan O'Donoghue wrote:
>>> On 11/04/2024 11:18, Krzysztof Kozlowski wrote:
>>>> On 11/04/2024 12:16, Krzysztof Kozlowski wrote:
>>>>> On 11/04/2024 12:12, Bryan O'Donoghue wrote:
>>>>>> On 11/04/2024 10:36, Krzysztof Kozlowski wrote:
>>>>>>> On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
>>>>>>>> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
>>>>>>>>
>>>>>>>> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document 
>>>>>>>> sc8280xp compatible")
>>>>>>>> was correct apparently, it is required to describe the sc8280xp-cci
>>>>>>>> controller properly, as well it eliminates dtbs_check warnings.
>>>>>>>>
>>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>>
>>>>>>> I am lost. Not on your patch, because it looks reasonable, but on 
>>>>>>> entire
>>>>>>> history.
>>>>>>>
>>>>>>> Can anyone explain me why original commit was reverted?
>>>>>>>
>>>>>>> https://lore.kernel.org/all/767bc246-a0a0-4dad-badc-81ed50573832@linaro.org/
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>>
>>>>>>
>>>>>> https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195094
>>>>>>
>>>>>> We can you sm8250-cci instead, so dropped the additional compat.
>>>>>
>>>>> I am sorry, but that links point to cover letter and actually the same
>>>>> thread as I linked. What does it prove?
>>>>>
>>>>
>>>> And just to remind because you bring some discussions from driver: we
>>>> talk here *only* about bindings patch. Not driver.
>>>
>>> https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195327
>>>
>>> Konrad pointed out we don't need a new compat because the sm8250 compat
>>> string could be reused.
>>
>> Where did he point that? I see only comment about driver, not bindings.
>> Please point me to his comment (and again, not patchwork which gives you
>> entire discussion and no one knows to which comment you refer, but lore
>> link which leads to specific one email where Konrad said it).
> 
> Konrad made a comment about the compat string in the driver, I looked at 
> the yaml and realised I could reuse the compat string.
> 
> Then asked for a reversion of the add.
> 
> I still think this is the right thing to do, no ?
> 
> ---
> bod
> 

OK I see the confusion.

I forgot to fix the compat string in the submitted dtsi.

commit 7cfa2e758bf4d56e0db5587a88db01ee6fffa259
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Thu Jan 11 17:15:56 2024 +0000

+               cci0: cci@ac4a000 {
+                       compatible = "qcom,sc8280xp-cci"

That should be "qcom,sm8250-cci" since there was no need for a separate 
8280xp compat string.

---
bod

