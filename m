Return-Path: <linux-arm-msm+bounces-60868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B2AD4247
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4E73A4641
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FB424EA85;
	Tue, 10 Jun 2025 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNRxAH3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082E24DD14
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581593; cv=none; b=kmcww4NoJnj2TSLY4TKelYmZ7eLyXdGfecWCFS0o/ggecx5qpmXF8G349Hg7j7u9EbIP1VbtRU8JFHmc/JKmK9B3ltp+x8B+DCxXUoKngSu03fDc4ENMkSeCFk9PxQDvJbJNOChaeN7drGg06HlvGvhXsxyueCDZqACCYV20nlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581593; c=relaxed/simple;
	bh=bTAnFIxWZfvZUu1WkNJ1+cIFzEXbVV1YkuS7ekLhsJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIetklCfAWIrEIj5/TokXgRu2J180ygx5LnnOz/pScfHUIuhZ93GZamGOupIMVHSErTqd1O4jpr3wSb0ZsDUsVe8km6WekmbzSLKxyQpfqayTk/AvdzqkfyPBXHJwmoUHlNF/B1Pmov9Bnl2WXi9gtmKDd9oSQps1gzlEoqrZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNRxAH3Y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so49234205e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749581590; x=1750186390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=limngthPrrojQ4KJ65LcFySdaULZ71w81rid/pfz/0g=;
        b=lNRxAH3YutBNRQBr1IGPA+6VxEAr+9dQek0sm0rJQS35st/Iea99nwktDeQwKh+h0a
         8ewkzxubd29f71Xb/N1FWCAlHeX0IhGfKHcVYQt9063W9Ei71gCbHuvv/tPfABVBhWpC
         lPcKsbjsg9nZBStucqkIivj0lG0INEF4iNOGla1x2tuL/jDtXxtrGCWOsdL3QBZaXdK1
         Q4Yuu6cBpZVXPLSooemJ8ek3+rIrOJ7vaZIPZD9HpyDYS7yUyiwSmx6hbsYO1tHY/xzf
         GXb7KuHEaLpX57Z1457UR7K8qa2PyKIkNP1Y/pxc8XJxPGffUhFXgbRAxVIfhu5t47US
         aUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581590; x=1750186390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=limngthPrrojQ4KJ65LcFySdaULZ71w81rid/pfz/0g=;
        b=f51BLPQn7VSi+GQg1HjXjEkQUgHCIZZcBQIBfD59YU4DSdlNAS0w0QsjGzKbOdJme0
         183C4dZy6K6L6xlqEkhbcf/8AA+Wvd/gB/UjKeb4JQC66nZxYLw0bDRzb3FAI3+VHpab
         ADly2TP5zwlUu+72a0xWKxm2uvc8LGaA/9IPIiE2ePLw4sPeN0PrbGgTz/WOhdX5JS7X
         jbO0EkRt50KMpEpuDJZ+fF3Z6cYiFZYAgWJTqNttbqDN4RNStsJWG/cEd2nid2yqdAKc
         oOIwsRWF0qd4ID6EBcMDee2SoYLRlS/QWC9TOigGnHFCj2ZuEY2MFz84J0+xfBDoHwKC
         SSug==
X-Forwarded-Encrypted: i=1; AJvYcCU7vTn1P6WGU+PuN2r2pcS0JkGLOIYVzQ7+IpuTlrgRjNdI+tWtQpm2i9hw/Gqa4kQ1FFbK/YQKr232bFGI@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUu9hASc2xjPKASnaWOYvOoyPBqF8ciiLEmOinXx5MqNIvvnY
	M7wiQEoi+1rKs7W7GAemH3MbCj30nGEuMOqULDzDnvfy6N3ZzXvyh/vbbhIvV0yeqH4=
X-Gm-Gg: ASbGncu7olv6kQ8b9uDbraVDzAPHyGjRvLGPrbvXCDTStIcg3C11UZONqw4NGmBtBiu
	CMHOqScbUyZByuNzCpHf5GL8z3zD8T7ll+s5DAkASZ47Z/+aKrxOeutWxjlMuIbrjEyWgHQwW0V
	fV4WVMniA9HAm2l8R6GGXZGulV3szyNHv5G+oHh6keSdifwggWCUBgkU93AWZKvU0NXd0pK++L6
	aH64nRFY+1W6jbpEZ4t0w+SeWO1wzp34zBMU5ZoftmjE+nvMRB6ZfyfmJ1MXDIK8IRb3M96sbts
	Q6HPv8eTznnTbXit5C5agrIn48PD+iK6CCZMZkWDQCanoCvi8O2mnFlZLYwIeek+AD556mwkZKs
	zSkaos3uV+eho8GpVALlk2vC/S5I=
X-Google-Smtp-Source: AGHT+IE53EfjobCw1+L2Lvsy4dC5WiBeht46Qa92GXpv6iuXucxwSOzWMWrssqASfQwPAZ73oiRu9A==
X-Received: by 2002:a05:600c:5022:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-4532487e899mr2101255e9.9.1749581590269;
        Tue, 10 Jun 2025 11:53:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453247cbb1dsm2091305e9.13.2025.06.10.11.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 11:53:09 -0700 (PDT)
Message-ID: <bc139945-2fe7-46da-8929-2098d77e155a@linaro.org>
Date: Tue, 10 Jun 2025 19:53:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 18:26, Vladimir Zapolskiy wrote:
> On 5/13/25 17:23, Vladimir Zapolskiy wrote:
>> The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.
>>
>> For simplicity of continuing my reviews of CAMSS paches add myself as
>> a reviewer, as well it will simplify the work of syncing and avoiding
>> patch conflicts between work oin CAMSS done by others and myself.
>>
>> Vladimir Zapolskiy (9):
>>    media: qcom: camss: cleanup media device allocated resource on 
>> error path
>>    media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
>>    media: qcom: camss: remove .link_entities
>>    media: qcom: camss: register camss media device before subdevices
>>    media: qcom: camss: unconditionally set async notifier of subdevices
>>    media: qcom: camss: simplify camss_subdev_notifier_complete() function
>>    media: qcom: camss: change internals of endpoint parsing to fwnode 
>> handling
>>    media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() 
>> function
>>    MAINTAINERS: add myself as a CAMSS patch reviewer
>>
>>   MAINTAINERS                                   |   1 +
>>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
>>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
>>   drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
>>   drivers/media/platform/qcom/camss/camss.h     |   1 -
>>   5 files changed, 71 insertions(+), 119 deletions(-)
>>
> 
> The changeset is left unreviewed for 4 weeks...
> 
> May I ask linux-media maintainers to take care of the patchset?..
> 
> -- 
> Best wishes,
> Vladimir

I haven't forgotten about your series, thanks for the ping.

---
bod

