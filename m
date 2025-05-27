Return-Path: <linux-arm-msm+bounces-59500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D947AC4C17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60EC3BA979
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FDD248865;
	Tue, 27 May 2025 10:19:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F6728E0F;
	Tue, 27 May 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341168; cv=none; b=Cc7AYVam4Gpo5XNkXvC1uCKBbykwfXc9SbzNxkSM1nGLGkmOtwGZqqtbZUCUJpIMuajTCLjcftaBQgKdLUqCw+Z2iFcmCOXCQyDSXQpU9Ui0Ioyn5gOFk6I7jN7JsYcnaWfx1p9fhGZ2rrHVUaoGxF3SOxfC1TzFtsd1RSAjPxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341168; c=relaxed/simple;
	bh=+uTkxRwUDOSNmznElaxhvN1iqbqNmStXvWtDR98aiXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1odD9tfLrvzPJCJeLyylH1iQuLTTMizzpNLJuDrw0lJJZqesBUbieNKO1/Qm0v4+ElUqBL/6Asq6z3vvE74I0gP91sN7HVjBUYq0pidzhT7+r8471t0BDtwt6yzU6PakodUqylDWvAeflBIiDWRobbOZFK2oi67sjLc38vQXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4FE114BF;
	Tue, 27 May 2025 03:19:09 -0700 (PDT)
Received: from [10.57.46.233] (unknown [10.57.46.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E2653F5A1;
	Tue, 27 May 2025 03:19:23 -0700 (PDT)
Message-ID: <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
Date: Tue, 27 May 2025 11:19:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250523085655.GD2566836@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/05/2025 09:56, Leo Yan wrote:
> On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:
> 
> [...]
> 
>>>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>>>> +{
>>>> +    int atid;
>>>> +
>>>> +    atid = coresight_trace_id_get_system_id();
>>>> +    if (atid < 0)
>>>> +        return atid;
>>>> +
>>>> +    drvdata->atid = atid;
>>>
>>> Do you need to expose this via sysfs ? Otherwise, how can you map
>>> a trace to a TNOC at decoding ?
>>
>> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
>> this TNOC. so dont expose it on this driver.

But why ? How does that work ? The packets that come via TNOC 
(irrespective of the source(s)) will have the same ATID as that of the 
TNOC. So :

1) How does it help if the source exports the ID that was allocated in 
the TNOC driver ?

2) How does the source driver know the TraceID for exposing via sysfs ?
Does it expose its own traceid ?

> 
> If so, why the ID is not maintained in coresight_path::trace_id?
> 
> A source device allocates ID and maintains in coresight path, then
> this ID is passed (when enabling the link) to TNOC driver to consume it.

Good question, since we have the "path" maintaining the TraceID, we
should use that here for the TNOC. But the other question is, can there 
be multiple sources connected to a single TNOC ? (I am guessing, yes!. 
And thus it may not work with what you are proposing.

Cheers
Suzuki


> 
> Thanks,
> Leo




