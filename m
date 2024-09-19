Return-Path: <linux-arm-msm+bounces-32024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FF897CBA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 17:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288B82851A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 15:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F92819DF52;
	Thu, 19 Sep 2024 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fi8cxGJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6AA19CD01
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726760215; cv=none; b=T5gYSSaarpbMzJzahjNNTVk3Cv7Nlpnv8mHRxyqDdV78QwCvnPXVhjPNKoZYFe0rWtgraBzltTm0JZEreYd5/88Z89jBgYqt8Zh45nxCvEpLtBjO4KEyAGAh2H1XuIFq3hF4PthGJQbcZpzaSpHs5JckfWbKkrEwBLJ+hxFNSoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726760215; c=relaxed/simple;
	bh=879HNooIMaIFioLy2pe7lTtGackRZjg3s0MWDuVebRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtB5QyIQey4SesICKSQUEXJyGv1GW/iYdZh6CD9ecJnyrkAhYiDJVJwngbkkEINFoZXMtzejoerjgIspJjcz7a4haHyQ7Ii15s9P2Wqa+ftmUXe0aQZHMlMhNiDyxPJeediDTWjBBwzFMNnwygH7SP2Vs98aC8Cyo9+kzT+Lhfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fi8cxGJD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24EC4CEC4;
	Thu, 19 Sep 2024 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726760215;
	bh=879HNooIMaIFioLy2pe7lTtGackRZjg3s0MWDuVebRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fi8cxGJDY3PMreguRD7elAhgNd+m4RWAMVBbZ3Kj2iGrTnRHfRoXzRIln7hreIMpQ
	 RjmJemV7tpNVtaWXkD6A7G+Zl0sNZaZZKDFgaiCNSTQ46Zycj54iywIDJYdoLwVnrj
	 MUhe1R3N/Le/qLB5gtZtzcn8zHpj9xuRI1rVnRjitRv9IAfiEe4h1GtEzCGmN8F5bv
	 N6SUZwUMyOVvWTfmaaklOxfAvFeZ8wg1pdYKg4xrQ1je85M2yLi+SpmSNozp4aham0
	 e99t6NYnjU+LL0K8HAyZZPBiggehlbBcxU2jNGOHd4PohmtqCWtX5t4pz/cpatA6z2
	 zpE1AVM8cGGhQ==
Message-ID: <9e45c5ba-0095-4d36-96c9-ac3c3db0bd0b@kernel.org>
Date: Thu, 19 Sep 2024 17:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, andersson@kernel.org,
 jacek.lawrynowicz@linux.intel.com, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
 <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
 <5e173c63-ff79-d61c-3c85-887dc08a3fff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <5e173c63-ff79-d61c-3c85-887dc08a3fff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.09.2024 5:00 PM, Jeffrey Hugo wrote:
> On 9/18/2024 5:41 PM, Konrad Dybcio wrote:
>> On 18.09.2024 5:52 PM, Jeffrey Hugo wrote:
>>> The Sahara protocol has a crashdump functionality. In the hello
>>> exchange, the device can advertise it has a memory dump available for
>>> the host to collect. Instead of the device making requests of the host,
>>> the host requests data from the device which can be later analyzed.
>>>
>>> Implement this functionality and utilize the devcoredump framework for
>>> handing the dump over to userspace.
>>>
>>> Similar to how firmware loading in Sahara involves multiple files,
>>> crashdump can consist of multiple files for different parts of the dump.
>>> Structure these into a single buffer that userspace can parse and
>>> extract the original files from.
>>>
>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>> ---
>>
>> I gave this a brief read, but.. aren't you dumping however much DRAM the
>> AIC100 has (and then some SRAM) onto the host machine without the user
>> asking for it (i.e. immediately after the AIC crashes)?
> 
> I'm not entirely clear what the concern is.  Too much host RAM usage maybe?

Yes

> In short, I think the direct answer is yes and no.
> 
> We put the dump content in the host RAM and allow the user to decide if they want to save it.  The user has 5 minutes to do something with the dump, then the devcoredump framework automatically frees the content in RAM.  Typically the user would access the sysfs file provided by devcoredump, and save the contents to the file system for offline processing.
> 
> There are a few other GPUs and several other devices that do the same. Panfrost appears to save every BO the user allocated into the dump, which would suggest that the user could create an arbitrarily large dump.

Right, freedreno does something similar. Perhaps a user concerned about this
could simply disable CONFIG_DEVCOREDUMP.

> 
> In the case of AIC100, it is technically possible for the entire device DRAM and SRAM to be offloaded.  That is up to the FW to decide if all of that is relevant.  Current implementation of the FW is heavily aggressive on what it selects for the dump, and current dumps are in the 100-200MB range.

OK this basically invalidates my concerns.. other boards I had ramdump on me
just spat out all the 16 or however much gigabytes of RAM they have..


> It feels like you are implying the user should somehow request the dump by having devcoredump publish something, and then hook into the user's reads of the sysfs to go collect the dump.  I worry that means the driver would then need to determine when there is no user interested in collecting the dump, in order to continue the reboot process.  I expect that would be a 5 minute delay (devcoredump deciding there is no user interest after 5 minutes).  I worry that users would object to such a delay given customer feedback we've had on getting the devices into service quickly.

Yeah no, this wouldn't be good.

Konrad

