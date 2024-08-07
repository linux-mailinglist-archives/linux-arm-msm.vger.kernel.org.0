Return-Path: <linux-arm-msm+bounces-28099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA194A9DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 16:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14FB11F2BA33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1EB8060A;
	Wed,  7 Aug 2024 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvMr57gb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F58004E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040228; cv=none; b=mPYkeu0BvzkH/BhN9I2zjAXoqHIgMDFXT7Sq+ax8NnH3GxGuQQmPVPDW/MkYqt/hq99tq6a1F+l2RtE7z3v6AOPt0cWTKsPw3uzgLYn08UMwdkPDlYhH1LP/fvnzByNukifEfPbhvPHzmfqL8r8aA/1ug21Ir8CUVt0W/JmKxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040228; c=relaxed/simple;
	bh=jZ9JY9d5/ukXOrPjdxqkNMZyB1UM8vJUQw68SFnIdto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElsawWTrltFL+2w2b8YQr/VHrTAwB9ZVP8b3DkjUKRE+VaL+++tt6xZYUWJ6n1+Uu3pgrrJS8xuFCCCAXXjFjvaudl5ogkuvfRLfrUHLS0Wha/EiOA4rlZDvItqLUhDsgX6dQ8O1vJE5bmkMXluwdpgVuUrl0tsOcqecxczK4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvMr57gb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-368380828d6so1041662f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723040225; x=1723645025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgVY+SxkVwjf5tj+Vr1m1GSEKcSeAZrctE8HxcpTRF4=;
        b=QvMr57gbi39RJ4Za25eJDxuiMNq6MbbXXIFlOtR/zCGSoniikrbZQ6Cixr94c0xyAQ
         wmWZqj7xuZCGsCk+OoQVn0hVqxdtpaMV9zhTdc8tT8g43y+SVc3ot+qNyoTVaXWPatTt
         o8G561bdAp+eJWIaULllBR6AHIvk4kv9BEs0MecyCDGvbRMNyB+XxizhpPb81HXJKADn
         BIzrbSpcNSLxoX8oXAzWSXT69cFWk5slYlYxpM7iMtct5GPuScNGkPWwL+Nyo04grJSS
         aYVpCUPz1VTatGyyMugwtycXzZYorB0eJ+TFTAW9KFcwkZGKeEFISdVW7sO/EGCLAvkZ
         9PtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723040225; x=1723645025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgVY+SxkVwjf5tj+Vr1m1GSEKcSeAZrctE8HxcpTRF4=;
        b=IZZgVfLZLmwELgcX+8WJP3r8nPnapKmI/zsJ2XCrI09WGykn2iThUg8ypvDbb/P5AJ
         7InsGIU1P76meDKFw3FhMaUyrlOIKF5tABbd/BTyS9SGt4pN3JksmqrfDVXhZH+ef9fq
         ABZpGPKUvLWpg5zXaq3Dw8gsFGqReLjo2a7ihCXECSpkjFGrkjqnwQHl5KkJim0XBSTV
         273D5JqyOkFtNe/lhj012eOUUGx3bYz8ZEW8ZMC3u6s7q6QM25yxO21spX2wSDP6N1D6
         Z+h9Exy7WLOpocxOUJp/H6GdkhIHIpL0PVUpP26nj7p9VDMLgWc9PrSfOFrWe3wH5/JG
         gAOg==
X-Gm-Message-State: AOJu0YwFHizPIQxKNJ4PyFKmAbUAKSKv2ZMZb/971P5yl8kawRwj5LzV
	MPFzUTg73D+Wi8NdrCfXtZrrKEWjeh9026wRCRkgEsWSh0XJRiOXfl/CPzGUfrQ=
X-Google-Smtp-Source: AGHT+IHvpYWf1y6gmsrIihQRGJm5puA6gKnuYlDBIg7/8UnTVJ0L1Lvo+0jK0yimn4ENDvh19Fda4g==
X-Received: by 2002:adf:e6c7:0:b0:368:6f19:cbf5 with SMTP id ffacd0b85a97d-36bbc0ffb40mr12549828f8f.31.1723040224386;
        Wed, 07 Aug 2024 07:17:04 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059932sm16128847f8f.69.2024.08.07.07.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 07:17:03 -0700 (PDT)
Message-ID: <336e5679-f04e-47aa-9655-df88fde9de21@linaro.org>
Date: Wed, 7 Aug 2024 15:17:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: camss: Add CAMSS block
 definition
To: Depeng Shao <quic_depengs@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240807123333.2056518-1-quic_depengs@quicinc.com>
 <1c0ff0fa-73d3-400f-a58d-15fb9b0574d1@kernel.org>
 <c2a3e578-b098-450f-96f6-a3ae321f2b4c@kernel.org>
 <85cc52aa-4593-49f5-9438-1ee3f09d2d71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <85cc52aa-4593-49f5-9438-1ee3f09d2d71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2024 13:53, Depeng Shao wrote:
> Hi Krzysztof,
> 
> On 8/7/2024 8:43 PM, Krzysztof Kozlowski wrote:
>> On 07/08/2024 14:39, Krzysztof Kozlowski wrote:
>>> On 07/08/2024 14:33, Depeng Shao wrote:
>>>> Add CAMSS block definition for sm8550.
>>>>
>>>> This drop contains definitions for the following components on sm8550:
>>>
>>> 1. Subject: there is no prefix camss. There is no such file, directory
>>> or module.
>>>
> 
> Thanks for the comment, will remove this.
> 
>>> 2. You already sent this, so this should be v2 or v3 or vX. Provide
>>> changelog under ---.
>>>
>>> If there is going to be resend, please fix above.
>>>
> 
> Sure, I thought it might be a new series, so I didn't add v*, will add 
> v1, and v2 change log in new version series.
> 
>>> 3. If this was tested on aim300, I am surprised this being not enabled
>>> on aim300.
>>
> 
> It was tested long times ago, but the patches wasn't sent out for 
> reviewing early due to the team's internal schedule.
> 
>> One more thing, bindings were not accepted, thus this patch should not
>> go in. There were no new bindings, so I assume patchset is using
>> rejected ones.
>>
>> It's fine to send it to get some comments, although would be nice to
>> mention to maintainer that this cannot be picked up as is. :(
>>
> 
> Sure, I will resend the dtsi patch until the bindings are accepted, send 
> this patches because you posted the comments in other series.
> 
> https://lore.kernel.org/all/0324e8e8-2ad4-4ce6-9616-3038b8e02ff9@quicinc.com/
> 
> Thanks,
> Depeng
> 
> 

Recommend

1. Send out your yaml and dts in one series

2. Driver series can be posted in parallel

3. Once #1 and #2 get merged send our your platform dtsi

Make clear in the cover letter with links to previous series such as 
https://lore.kernel.org/all/0324e8e8-2ad4-4ce6-9616-3038b8e02ff9@quicinc.com/ 
that you are breaking the series up for easier/better merging and ensure 
in the cover letters you explain what you've done to address previous 
comments.

One nice way to give someone like Krzysztof an overview is to post a 
complete series to codelinaro or github showing all of your patches 
stacked on top of each other.

The merge order then would be 1 -> 2 -> 3, yaml/dts -> driver -> dtsi

That way you never have missing compat/dts/yaml splats, your driver code 
gets reviewed/tested/merged and only after all of that you "switch it 
on" for your target platform.

The point of making a public tree containing everything is you can 
reasonably point to and endpoint that lets people know whats coming and 
that indeed a target platform intends to be brought in so that we don't 
end up doing a bunch of review/merge work for a platform/dtsi that just 
lives in downstream tree forever.

The ordering of patches is 100% up to you but, I find the 1 -> 2 -> 3 
sequencing easiest.

---
bod

