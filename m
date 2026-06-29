Return-Path: <linux-arm-msm+bounces-114984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EONPBpdMQmpx4QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:44:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A316D907D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:44:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=JKpSgQhg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114984-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114984-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07BD7300EF68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5553E3BA246;
	Mon, 29 Jun 2026 10:44:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0548A35A393;
	Mon, 29 Jun 2026 10:44:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729860; cv=none; b=anc+sSKhepdZQKXa/JHrHvqkpovTBYZzhQYNvb/RX+0L+JGiFkYCprtyhLqBhkNU7pFWceOqgyMSqzda188NVxYZZ4vnOLM/7s6uzM1Y83yyYAOOWoEMuaCQZZDiRMhMiXHrRxTqKKRgTQsp3sAEvKWsdl/Ke4sFCrtHHTWpR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729860; c=relaxed/simple;
	bh=UrkKKcK7pnTq/Fb/9UsUrAYXCMMsm0da+M9gKv9FKR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sItR6FJJRjtQ4JVT4uCZvYdeTzlNWkMXhF5v2EkoZl7RqmSgDWnIUMQCgPnARG3lc2IxiDQw7tcVf4lK1tbSDQVBtatwCnKQpzkVrKVMHtybQo2pyBrubDYq3ZoZH+KM8/7d+9g8s67+2NlA1YxRA2FAVa8g6BVF0Kle179bFAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JKpSgQhg; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6EC3176C;
	Mon, 29 Jun 2026 03:44:13 -0700 (PDT)
Received: from [10.1.37.47] (Suzukis-MBP.cambridge.arm.com [10.1.37.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A29F3F836;
	Mon, 29 Jun 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782729858; bh=UrkKKcK7pnTq/Fb/9UsUrAYXCMMsm0da+M9gKv9FKR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JKpSgQhgh4ePCnA2/5BaQm4UuepM7qZpdL6L59co1VlGySQGcwtqbiR6eamAS1Caa
	 nJz5RT8Te5qAKaE6MweNw1jjqJldcxWOEXrrZ8b22H5DwYNtaO7i+KPl/rVuhkyOgW
	 IlSPL/bZJHpFP6qr96Kte3VmZkW3WPME1GY7/dAY=
Message-ID: <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Date: Mon, 29 Jun 2026 11:44:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
Content-Language: en-GB
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
 mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
 <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114984-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:songwei.chai@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89A316D907D

Hello,

On 29/06/2026 11:17, Songwei.Chai wrote:
> 
> On 6/29/2026 12:22 PM, Greg KH wrote:
>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>> Hi Greg & Alexander,
>>>
>>> Apologies for interrupting again.
>>>
>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>> design, I
>>> would greatly appreciate it if you could kindly take some time to review
>>> this at your earliest convenience.
>> The merge window _just_ closed, please give us a chance to catch up.
>>
>> Also, why us?  Surely you have other reviewers for this code, right?
> 
> Hi Greg,
> 
> Understood, thanks for letting us know.
> 
> Regarding your question: since this introduces a new drivers/hwtracing/ 
> qcom directory, there is no existing maintainer for it.
> Given your scope (and Alexander's), we believe you are the most relevant 
> reviewers.
> 
> The reason for creating the qcom directory is as follows:
> 
> /We previously tried to upstream this driver under drivers/hwtracing/ 
> coresight,/
> /but it was not accepted as it is considered Qualcomm-specific and not 
> tightly/
> /coupled with the CoreSight subsystem. Based on this feedback, we are 

Some clarification here: This device is not CoreSight  so we denied
keeping this under drivers/hwtracing/coresight/ - Not because it is 
Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
subsystem, which are all Qualcomm specific for e.g.

That said, there are other drivers in drivers/hwtracing/ which I usually
merge and push to Greg, after some reviews/acks from the respective
people (e.g., PTT HiSilicon PCIe Tune and Trace).

But, your proposal was that there were other maintainers for your new 
subtree and you were going to push this via ,linux-arm-msm ? to which I
didn't have any objections.

That said, I am fine with pushing this to Greg via the CoreSight pull
requests (similar to Hisilicon PTT driver), but would need someone to
Maintain/Review the driver (with entries in MAINTAINERS, similar to
PTT).


Thoughts ?

Kind regards
Suzuki



> exploring/
> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, to 
> better/
> /support this and future Qualcomm hwtracing drivers./
> 
> More details can be found in “[PATCH v14 0/7] -- Why we are proposing 
> this”.
> 
> Thanks,
> Songwei
> 
>>
>> thanks,
>>
>> greg k-h


