Return-Path: <linux-arm-msm+bounces-32754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B01989DD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 11:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79AB21C22570
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C101885B5;
	Mon, 30 Sep 2024 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjHARq36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0E1898FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727687739; cv=none; b=RCqJUGa+QsuXtz8dgj3ihPIAnGznAFD794BK4qzRxVdKVjddFR2XyVptmNlAReP8PYTuWcLCzNCNd9fmQQVoqE1UIXf1/F52iQOmk4vQvQ7Jia0NjLa6qQ1Nye/I6Iab+XH6Tb0H2icc8qKosxYmCgvHSeZTvztzMvq+nrI5b6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727687739; c=relaxed/simple;
	bh=UbBHS64c6Wi8n1M3dVOKwos2H9V7LSNLZVx5hUr5kXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7RPY6nE+rf9SUEy6TAGQHzNzGqtHfYhYUCqXOKq6YqsezdRmG8G5YgK5xymGj6uiWfiCTDLucAkgbqRYoxEDMflSWiTIBzpQGBRIxAUbZEuZmyrgr7qfxAcmp1F11MuxaneczbTSHJJLY+UCZHjrbyJlYOba4DZSI1VYHuls6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjHARq36; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53992c176a9so142704e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727687736; x=1728292536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7IuWb65l3XdqWv3HG68RFWkgEd17Jyp/g3HQMeyfnc=;
        b=KjHARq36sz4YS0CZ7rjcaWOcglRkv6ECH7OFu+EPRPQtIneoAgOQc3yXS4Ow4tkZrE
         a9XNAhlXNGfJpxcJGKKtHaphnBEJtJQkXLE28qG9UfM4yxr8mmdGN+JQTPvU75f8dALh
         x950iLSW3J+D97xxp2E8swv5EvIWMCWaFbBCuYzYuBB4VVvrimv/nyrs/kBkBlwhMm/f
         /j5/Eg0FFHUNH/McEn1mGlgfPIUBceV7/cMP2KQRx6LfmJ+QA3A0DIZAwWasFLJ4bDvT
         Svdz1k29NkBQRUDmePzyiTNFRrZUQEMqwvPqhuWdM4PsREbEzIp4EHFF8PAJEqba6Zmf
         LFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687736; x=1728292536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7IuWb65l3XdqWv3HG68RFWkgEd17Jyp/g3HQMeyfnc=;
        b=KnzZ6sYWQZhA0GMRrP6sXialnCCPz0QvKfHsffL2a0L23QGvOT7HGgOX8zLZ3rzBb/
         DVqziR6w0d1228OisDKn37dgFBGGgm95mhyL1HiPEA9R/3UH0urlzlPiypo7Lo9LfbIu
         /1WJLJVWPUTrCO62paofwgMB2y1mn6cRysUpVzg2dH239wCpPpAWqWnl1+5WzXtodUyO
         mqy8buiLbDarlg8LXJuxOECk43VZyPPJYiUh6DhoYKgJM6VV7RvzKh7dEwMQrMx5ELxD
         28fLjJVUVJzx6q6bRy8TWiKYmDHhjktGWYAJVo7MgmlmuC57yuzeeWunXyPcYTDpSfio
         Xulg==
X-Gm-Message-State: AOJu0YwXYB2Fv5eSlmZl69pNKWYCUoB9SjKnp7je9nYCI5ea67JgrbsY
	H/G6X+R44O0+d+yBgXj4vuSz5okJyysPSJaHV2pbqlAi62YGE9bBIpq5+SSuBmg=
X-Google-Smtp-Source: AGHT+IHoDBM0F8HfaXei+pIBhMva3coZxKb4n2uikIXCUZY6Hd0eeV1ER5KctDKqMCKvJrm7sF515g==
X-Received: by 2002:a05:6512:3d28:b0:536:9efb:bb19 with SMTP id 2adb3069b0e04-5398c2e4579mr908003e87.3.1727687735833;
        Mon, 30 Sep 2024 02:15:35 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5df91sm1191807e87.82.2024.09.30.02.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 02:15:35 -0700 (PDT)
Message-ID: <65db109e-ae0b-4709-bbc4-4aad05cc846b@linaro.org>
Date: Mon, 30 Sep 2024 12:15:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Depeng Shao
 <quic_depengs@quicinc.com>, rfoss@kernel.org, todor.too@gmail.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <9ed92660-5f42-4a1a-9261-b8800133972a@linaro.org>
 <ed012367-1bfd-4eef-931b-37e1ac839176@quicinc.com>
 <65e5796a-8b8d-44f0-aef4-e420083b9d52@kernel.org>
 <87419076-c355-4eb9-8bf4-a9f2064e3c0a@linaro.org>
 <c1539cce-92eb-43fc-9267-f6e002611bbb@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c1539cce-92eb-43fc-9267-f6e002611bbb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/24 11:55, Bryan O'Donoghue wrote:
> On 30/09/2024 09:46, Vladimir Zapolskiy wrote:
>> Hello Krzysztof,
>>
>> On 9/30/24 10:16, Krzysztof Kozlowski wrote:
>>> On 25/09/2024 17:13, Depeng Shao wrote:
>>>> Hi Vladimir,
>>>>
>>>> On 9/6/2024 11:56 PM, Vladimir Zapolskiy wrote:
>>>>
>>>>>> +            compatible = "qcom,sm8550-camss";
>>>>>> +
>>>>>> +            reg = <0 0x0acb7000 0 0xd00>,
>>>>>> +                  <0 0x0acb9000 0 0xd00>,
>>>>>> +                  <0 0x0acbb000 0 0xd00>,
>>>>>> +                  <0 0x0acca000 0 0xa00>,
>>>>>> +                  <0 0x0acce000 0 0xa00>,
>>>>>> +                  <0 0x0acb6000 0 0x1000>,
>>>>>> +                  <0 0x0ace4000 0 0x2000>,
>>>>>> +                  <0 0x0ace6000 0 0x2000>,
>>>>>> +                  <0 0x0ace8000 0 0x2000>,
>>>>>> +                  <0 0x0acea000 0 0x2000>,
>>>>>> +                  <0 0x0acec000 0 0x2000>,
>>>>>> +                  <0 0x0acee000 0 0x2000>,
>>>>>> +                  <0 0x0acf0000 0 0x2000>,
>>>>>> +                  <0 0x0acf2000 0 0x2000>,
>>>>>> +                  <0 0x0ac62000 0 0xf000>,
>>>>>> +                  <0 0x0ac71000 0 0xf000>,
>>>>>> +                  <0 0x0ac80000 0 0xf000>,
>>>>>> +                  <0 0x0accb000 0 0x2800>,
>>>>>> +                  <0 0x0accf000 0 0x2800>;
>>>>>
>>>>> Please sort the list above in numerical order, this will change
>>>>> positions
>>>>> of "vfe_lite0", "vfe_lite1" etc.
>>>>>
>>>>> Another note, since it's not possible to map less than a page, so I
>>>>> believe
>>>>> it might make sense to align all sizes to 0x1000.
>>>>>
>>>>
>>>> Sure, I previously sorted by the alphabetical order of reg_name.
>>>> I will update it based on your suggestion. And will also make sure the
>>>> align all sizes to 0x1000.
>>>
>>> If I understood correctly, you want to change the order from existing
>>> devices, so no. You are supposed to keep the same order, as much as
>>> possible.
>>
>> Please elaborate, what do you mean here by the "existing evices"?
>>
>> The list is not sorted by reg values, I ask to sort the list by reg values.
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> We always sort by address:
> 

Thank you for the given confirmation that there is a need to make
the change requested by me.

--
Best wishes,
Vladimir

