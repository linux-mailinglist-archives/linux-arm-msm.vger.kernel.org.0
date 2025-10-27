Return-Path: <linux-arm-msm+bounces-78861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044DC0CAC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40BA33A38C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF92F2F1FC2;
	Mon, 27 Oct 2025 09:30:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0012F0C6E;
	Mon, 27 Oct 2025 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557404; cv=none; b=eSyIZwFPrsBSyU+f3t3AN30D9Gs/D4Yer6bSt4fuv0NMPe3miopcjZ3uFk313oezHfZSoDOrRDzduZI2EhrJuHpq79NSApBydpo6+ZE+AyEV1ufAX+OrR9lKj/cjjBINdwPx47P/tr7vDR1uL/TAvtmzmEx1Nfepb7bAvXWe5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557404; c=relaxed/simple;
	bh=o5LqZy0ZroT8YS7VapnrsnlMnIJMMjuiF1ifrK8fs3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mFjpSyNJ10gjgc7HTuMjpnTaPPUSvcknNcg7Jac26fmU36mXCCp4seT6XNu7ZeAWx1FBEZ7Oj4vIW5Jf+gHQM31dgWlZP9IUumUrq1/muIJsJltKIRN8FtmIWIOeNZySScxp2v3nSFpxUTG8qfkXPbrX9l/JAqoaGakgUeyz3N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D7C1764;
	Mon, 27 Oct 2025 02:29:54 -0700 (PDT)
Received: from [10.57.67.85] (unknown [10.57.67.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D50373F673;
	Mon, 27 Oct 2025 02:30:00 -0700 (PDT)
Message-ID: <d71e09ff-c063-46d9-8d02-f69c18b6efe5@arm.com>
Date: Mon, 27 Oct 2025 09:29:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/10/2025 01:14, Jie Gan wrote:
> 
> 
> On 8/27/2025 6:55 PM, Jie Gan wrote:
>> Patchset 1 introduces configuration of the cross-trigger registers with
>> appropriate values to enable proper generation of cross-trigger packets.
>>
>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>> which determines the frequency of ASYNC packet generation. These packets
>> assist userspace tools in accurately identifying each valid packet.
>>
>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>> specific port, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
> 
> Gentle reminder.

Please could you fix the dates and version to v6.19 ?

Suzuki

> 
> Thanks,
> Jie
> 
>> Changes in V3:
>> 1. Optimizing codes according to James's comment.
>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Changes in V2:
>> 1. Refactoring the code based on James's comment for optimization.
>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Tao Zhang (3):
>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>    coresight: tpda: add sysfs node to flush specific port
>>
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
> 


