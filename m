Return-Path: <linux-arm-msm+bounces-87292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5E9CEFBDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 07:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9098430090BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 06:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9333224501B;
	Sat,  3 Jan 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQDJ6q41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1ED6A33B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767422274; cv=none; b=D8KRCcysiylQUk2r7kTvUMAVvV1HgREV713ecVgDbsE3CQHK3hTH9tM3oMoMVcmQgDL/MJiKPPLtJAoUwu1BNIRPdukOFwc2oT8xYATG8elSztNXYx+IHWTm3CPIyo7nGA7ZKdxXtYpwEIkGXFH3P+4KELeh7Qm7rSTo3PNuQnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767422274; c=relaxed/simple;
	bh=/nMoLJ/dyPVGEpQSrvqRiwlY70NtMwi/5VrgfX+iNVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0v3Ubd5WXNGCPQHco4AqpzlJYitBcR2thR0aESEzou1UY6BAV8gyAB4r9GtMvyMS40LDV4IR9lkAXDSroO3YX/8BxC03wkqTI8Vg9ewFZuPrZPfkG15oO4194eXQt2Xoem3J39pCKmqV2pbaX+LfeGQnPTmykBkHw4PprOozwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQDJ6q41; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so11177044b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767422272; x=1768027072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=;
        b=WQDJ6q417xM1akNGv/vEXpgRcOAE6CQ+684eDDzE+IEHl57UMbXSwjRl31sEXaX2zK
         r5/G2dUfXLGx7UnJ19NQXhC4fOP7+FtKnpoH9UJTLB/NqeJKFdA5ubIUAqp6TJkI1NRK
         edfwEYIxaUWZwYhKqcfG1BXSezqmkG+nIayYooZKzWf6dzyjvQXTJU9kGI5LCKbMphSO
         3XZUeeuY3lQrm8K8Pqg1MtP7zXE+/jIKFlm4Gu19eLpEgf8tg3T++2O94bDjvs1+Oi1h
         ll4DnoYyTrI4sHmAocP3nJmdlQ/MVEPrLugxcpIWd6A69yJZc+ekktm6h6pfSROFeWDs
         gReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767422272; x=1768027072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=;
        b=Z9EV1Ubhz8eGfRwl/mOBJQhcvJfLl07NQlwnrl1Wm2bZ99GThPYN9LDXYb/zG/5Tz/
         M0fSd/jOPK0eAXZkapzIJDZiJeRPXbXPnPT6mG2vUwZazO54VGzgZNaVlNf6WXQQkjln
         reG4oImX7t3ELNd148pi5mbMPjOs/bat6D3JgJylP/j7ciR25bTUWipn0EcaWiDAG05K
         4sD3eC7HK1RCWo1O2cTWRQxGCZLwBWW3/KEfzsc4+Ly+c4qTQdan3/2thflVJY9apKpk
         LYgzETvbN3gX0+vag5kQbNaSrPUqeZLZT8g7RCKWH3uJ4SfM8UxhXxvhwN7bf5EO+xrZ
         Qijw==
X-Gm-Message-State: AOJu0YzQj1AQWbfrCKHDcyiLhMamfZucwBPYP49bmVMCr/X8iRDkECF+
	Mq4l9nmCN45Tsd9T/TWmWhJt27cNuSegZ3i4XGAM/rhfiSR7sUvD8S0HT+uf3Y3NTs8=
X-Gm-Gg: AY/fxX51c4+3wCLtt/s2KoyMLxJLKwApqyKRXFPM3HqLjkVa6aLa4spkonv0+CVsGd/
	5vWZbzsfE9LW7XOvNBYmiut/ySZ3yccKZBqTPJtRpZw+dROBjrV6cGrF2h0RI5UArZAbLzjOqEU
	7QR2DzgBlG/KMtL7+yGPGS0AKNsoo6YBGuMJQdW0tm2s0lgUOg/gA4lAGniV63XgzBNM2aojrYs
	yOEZq5yphKEjslUv/2sWpoEjFPI+nSTKKoMdXQ+KmZFOoeIMpaVLqSR0/fMp5h48dyKr97vKfmU
	2NbKHL+xuj2/iWYhens4LbyjF2BxwAODoLy203kZxZmrNOjnIj7mhMYh+Rj9yEM+xlzIwkasxRx
	aqcMn2dU5oO0baDv4WVySdPcXTgt/wOUzcR6uqiN/Wv22oPcZWBJ9J/tjV8Fv5vh+N0IvbiKGrN
	5kfxHSlxsShDYKkSJEVB3s3MTlDEpsur2cavNiBoje9wx9qzb4g65yoq+5FJPvBXz0
X-Google-Smtp-Source: AGHT+IHOn/shxgu6O9AbZYxbJun3BCH+nZYMReTx1ZUY3Ku/Rcc6T4HDI4a+cvUWlCqKmwFxIHrgIA==
X-Received: by 2002:a05:6a20:12c6:b0:366:14ac:e205 with SMTP id adf61e73a8af0-376aa8ffdb4mr41042704637.67.1767422272279;
        Fri, 02 Jan 2026 22:37:52 -0800 (PST)
Received: from ?IPV6:2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf? ([2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961c130sm36229897a12.3.2026.01.02.22.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 22:37:51 -0800 (PST)
Message-ID: <8c7fcd35-3b29-4621-b4e1-df0c88a00cba@linaro.org>
Date: Sat, 3 Jan 2026 08:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] mm/numa: Register information into meminspect
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-20-eugen.hristev@linaro.org>
 <aVImhhgEsHInebeh@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aVImhhgEsHInebeh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/29/25 08:58, Mike Rapoport wrote:
> Hi Eugen,
> 
> On Wed, Nov 19, 2025 at 05:44:20PM +0200, Eugen Hristev wrote:
>> Register dynamic information into meminspect:
>>  - dynamic node data for each node
>>
>> This information is being allocated for each node, as physical address,
>> so call memblock_mark_inspect that will mark the block accordingly.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>  mm/numa.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/numa.c b/mm/numa.c
>> index 7d5e06fe5bd4..379065dd633e 100644
>> --- a/mm/numa.c
>> +++ b/mm/numa.c
>> @@ -4,6 +4,7 @@
>>  #include <linux/printk.h>
>>  #include <linux/numa.h>
>>  #include <linux/numa_memblks.h>
>> +#include <linux/meminspect.h>
>>  
>>  struct pglist_data *node_data[MAX_NUMNODES];
>>  EXPORT_SYMBOL(node_data);
>> @@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
>>  	if (!nd_pa)
>>  		panic("Cannot allocate %zu bytes for node %d data\n",
>>  		      nd_size, nid);
>> +	memblock_mark_inspect(nd_pa, nd_size);
> 
> Won't plain meminspect_register_pa() work here?

Yes it would work, but as explained in the other email, it would not go
through memblock API.
We can continue the discussion there

> 
>>  	/* report and initialize */
>>  	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
>> -- 
>> 2.43.0
>>
> 


