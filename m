Return-Path: <linux-arm-msm+bounces-56931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69507AAC25F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69F8F1B68529
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 11:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56222798E0;
	Tue,  6 May 2025 11:20:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A01C278750;
	Tue,  6 May 2025 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530450; cv=none; b=RvIQoEiNN1s3sbYLbEf65TH4b7b9qTk3b6hPkYrGlLM9uMyP6cbGEFpl0TYqDmo55I0196a9CzO6G2Fzxi4ZlV9pwPF9Q5MTpvBF9aP+JTyMKLygbUsdW7Uset4uN5yxOODvSixGEjIfZqZUcg7lZ6aDoHv+L2INbjWNNbz+sik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530450; c=relaxed/simple;
	bh=DldxK1O2FUBIV+IGAEiHrzXvmL3t/OtYlTTuOZu0ExM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHy7UGhxd4Sn5XruCYNOD4le42V5i6HoWlfuYqhlaunf1hQM9W+UcJ8UXYvZEil+5vkouCfEy2u1ttLC8YHOcVADbShRGluW7FW07/Z+f0i9rEtEo8onujPXL70UmalMLx2b8tcnqbLVlj9rdAMtseKJ0RyyN6LJpB2vqXIOz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94A9113E;
	Tue,  6 May 2025 04:20:36 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00BD13F58B;
	Tue,  6 May 2025 04:20:44 -0700 (PDT)
Message-ID: <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
Date: Tue, 6 May 2025 12:20:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
 <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
 <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/04/2025 10:16, Yuanfang Zhang wrote:
> 
> 
> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>> which is an integration hierarchy integrating functionalities of TPDA
>>> and funnels. It aggregates the trace and transports to coresight trace
>>> bus.
>>>
>>> Compared to current configuration, it has the following advantages:
>>> 1. Reduce wires between subsystems.
>>> 2. Continue cleaning the infrastructure.
>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>
>>>     +------------------------+                +-------------------------+
>>>     | Video Subsystem        |                |Video Subsystem          |
>>>     |       +-------------+  |                |       +------------+    |
>>>     |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>     |       +-------------+  |                |       +------------+    |
>>>     |            |           |                |              |          |
>>>     |            v           |                |              v          |
>>>     |   +---------------+    |                |        +-----------+    |
>>>     |   | Video funnel  |    |                |        |Video TNOC |    |
>>>     |   +---------------+    |                |        +-----------+    |
>>>     +------------|-----------+                +------------|------------+
>>>                  |                                         |
>>>                  v-----+                                   |
>>> +--------------------|---------+                         |
>>> |  Multimedia        v         |                         |
>>> |  Subsystem   +--------+      |                         |
>>> |              |  TPDA  |      |                         v
>>> |              +----|---+      |              +---------------------+
>>> |                   |          |              |    Aggregator TNOC  |
>>> |                   |          |              +----------|----------+
>>> |                   +--        |                         |
>>> |                     |        |                         |
>>> |                     |        |                         |
>>> |              +------v-----+  |                         |
>>> |              |  Funnel    |  |                         |
>>> |              +------------+  |                         |
>>> +----------------|-------------+                         |
>>>                    |                                       |
>>>                    v                                       v
>>>         +--------------------+                    +------------------+
>>>         |   Coresight Sink   |                    |  Coresight Sink  |
>>>         +--------------------+                    +------------------+
>>
>> If each NOC has TraceID, how do you reliably decode the trace ?
>> Is there a single NOC/TPDA in the path from Source to sink ?
> 
> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
> from Source to sink. In the example, only the aggregator TNOC has traceID.
> Decode trace relying on TraceID + Inport number.
> It can has mutiple TNOC/TPDA in one path.

So do we only describe the TNOCs that need traceId in the DT ? (e.g., 
Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
trace id for it by default, when it is described ?

Suzuki


