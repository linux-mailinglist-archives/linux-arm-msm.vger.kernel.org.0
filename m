Return-Path: <linux-arm-msm+bounces-85826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F0CCF6E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CCC8307E8BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728F130C61A;
	Fri, 19 Dec 2025 10:28:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28F530C613;
	Fri, 19 Dec 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140087; cv=none; b=EVCIRlEuShwiZ8GQgxJRNZehqoccgnIIw1/+1m0YnbPEgoZ/rK4yswUTEv/QAwB38JA9i+r36QDD3xuB9TQ+gfYcGx4tPoeW465q+GgTxJOT9Gnrvv6BpK3cM4XWAI7D5cekxtTBlKmfwlBRzAfVA4lv0N4X9vKtfbukaK9ip+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140087; c=relaxed/simple;
	bh=DBkOZYDNrFqDL6fapsRIk7StmcdcQiuyxUV0LIm540E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDKXN+yFDzsPsCBVUkVEKy1bp9uCkbAnFN4NbPZ9dXoZqDpsd1dvQ9ANo3rpPgB+oJ6dyHyol2W+uAobpGndFkutq5k/XsjHKzIXyHHVC1ZcrZr0u20c9Kor8H5r9wmyfeotoS0oPO1XmtQGVbknVbKUKxvmNtW6FwBNhNUjuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61753106F;
	Fri, 19 Dec 2025 02:27:58 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34BA43F5CA;
	Fri, 19 Dec 2025 02:28:03 -0800 (PST)
Message-ID: <e9df1140-989f-46e3-8edc-2013e520bfed@arm.com>
Date: Fri, 19 Dec 2025 10:28:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Sudeep Holla <sudeep.holla@arm.com>,
 yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2025 10:21, Sudeep Holla wrote:
> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>
>>
>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>> domains. These components require special handling due to power domain
>>>> constraints.
>>>>
>>>
>>> Could you clarify why PSCI-based power domains associated with clusters in
>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>> OSI mode was originally intended to support them? My understanding of this
>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>> to be a flaw that should be corrected.
>>
>> It is due to the particular characteristics of the CPU cluster power
>> domain.Runtime PM for CPU devices works little different, it is mostly used
>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>> framework to manage the last CPU handling in cluster.
> 
> That is indeed the intended design. Could you clarify which specific
> characteristics differentiate it here?
> 
>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>> .power_on/.power_off) callback implemented which gets invoked from
>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>
> 
> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
> correctly, all of this complexity is meant to ensure that the cluster power
> domain is enabled before any of the funnel registers are accessed. Is that
> correct?
> 
> If so, and if the cluster domains are already defined as the power domains for
> these funnel devices, then they should be requested to power on automatically
> before any register access occurs. Is that not the case?
> 
> What am I missing in this reasoning?

Exactly, this is what I am too. But then you get the "pre-formated 
standard response" without answering our questions.

Suzuki

