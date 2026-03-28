Return-Path: <linux-arm-msm+bounces-100529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDeIAMGPx2l2ZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 09:22:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39F34DCBE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 09:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 149F4302DB73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 08:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA2336AB77;
	Sat, 28 Mar 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="JxhzCGeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD32C21DD
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686142; cv=none; b=ffcHTkzTXFtjP+jmXtSYVsuNqS5OGk23P2hM5s4BVkpgr29JrawOQGEbQFnLtpRxhwd/sOirKlFTlPY5YWPm8No6lYNkSRCX8h2kJQrGW8k2ASrT/RSZ6onovnRQEBZpG687KRCj/AdBuOQJWqujunQUV9qYa9KbO4WeciNTTv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686142; c=relaxed/simple;
	bh=Be+hfXS0+oA4TyoSNFCSOnIxtlg9LmLDkoiIsipDyUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YptpOvIm+TZpe3TKjDUpBQSNafRlLOn519B45CV7GERDaJNjh5Ndco7tbYAgMiQmJjn6nhtXyXjprrIaRwpNi5Rc9D8LQY5zGim0mKn+CY/nxhtgrgxD5MYyPZGm3i5MAlyQxTembnpA7GjHOmGE6Ydt4m3yG9jsyll1iqAQO5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=JxhzCGeN; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <3b968230-c64a-41dd-a145-81b4e68dd39b@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774686128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fX+9bAQHy7d724x0bps6NZLEAxnQxD4hcWumn7cv9vg=;
	b=JxhzCGeNN9XHn5nuxHyIVnEg9uUyaRhelE23HoTcYZQubWLwr9vM+6xSvOsErYc0dHq7nb
	x+2v2inVESgxbDhojZhZeDFHYWIQAczcKupmVwpf7car2PeygWD2xJQXwqrVtZ+FWnSp2j
	MbEx8QKrQg+lXMT3H0GOP8M7suakJM6KmPqWSNGoD4jJsFZ1RZJfM9bDffcYL0Nb18OPwu
	Zh7RAr8x9aH7WHDIYSA3r5HOgwk+DdYLwMIIfEB1XX0PvvHF5CxrHfHPltEU/wpZxMWzI7
	fijnPailCMVJudSj0850FV7fuyNdA8HZrySvHSLqyLDutE4Mo4IE3o75AGTfXw==
Date: Sat, 28 Mar 2026 05:22:00 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 jie.gan@oss.qualcomm.com
References: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
 <ao4jf5guszon6iuyyvzmkuaf2iaa56y3b33srx2w3whtyo2u3r@k74fxy3ktsyo>
 <aalhik53l4ioxiLx@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <aalhik53l4ioxiLx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100529-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F39F34DCBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/5/26 7:57 AM, Stephan Gerhold wrote:
> On Wed, Mar 04, 2026 at 02:16:55PM -0600, Bjorn Andersson wrote:
>> On Sun, Feb 01, 2026 at 09:54:36PM -0800, Xin Liu wrote:
>>> All the existing variants Hamoa boards are using Gunyah hypervisor
>>> which means that, so far, Linux-based OS could only boot in EL1 on
>>> those devices. However, it is possible for us to boot Linux at EL2
>>> on these devices [1].
>>>
>> Lots of people are running Linux at EL2 on their Hamoa laptops, but
>> then there's no PAS. I presume adding iommu properties won't "hurt" in
>> that case, but can you confirm that with this change remoteproc is fully
>> working somewhere (i.e. [1] refers to a firmware for which the Glymur
>> PAS/PIL changes has been backported?)
>>
> On the contrary, I would expect that this will break the existing EL2
> setup people have on their Hamoa laptops. I have last tested this half a
> year ago (and I don't have a suitable device for testing this anymore),
> but I don't think much has changed in this area:

It did break and I just spent like 3 hours debugging before realizing I 
shouldn't've just merged x1-el2 like that…

It first showed up as a "weird" hang when booting into EL2, as soon as 
SMMU related lines started showing up on the framebuffer console it 
slowed down to a crawl for a couple of these lines and then totally froze.

Disabling qebspil (i.e. having only adsp-lite loaded) let the output 
proceed for a little bit more and I saw the faults (tens of thousands of 
faults, all fsr=0x402, iova=0x86b020c0, fsynr=0x600040, SID=0x1000) and 
a hard LOCKUP being detected.

> Since we can't start/stop remoteprocs without PAS,
(Can someone at Qualcomm ask how Windows does it?)
> everyone using EL2
> with the old (non-PAS) firmware currently relies on remoteprocs that are
> already started by the boot firmware before Linux is started. This can
> be just the "lite" ADSP that is started by UEFI for initial charging and
> USB-C detection, or even the full ADSP/CDSP via a custom UEFI driver
> (qebspil [1]). All of these will stay running even if we fail to
> stop/start them via PAS. Without extra kernel patches, we can't make use
> of the remoteprocs, but the lite ADSP firmware will probably continue
> doing its work in the background, i.e. it will start/stop charging as
> needed, you just won't be able to observe the status from Linux.
>
> We manage the full IOMMU even when there is no PAS. The reason why
> people are not running into issues is that the bootloader handover code
> inside arm-smmu-qcom.c qcom_smmu_cfg_probe() configures bypass for all
> SIDs used by the boot firmware, which includes the SIDs for all the
> remoteprocs. Adding these SIDs in the "iommus" property of an actual
> device will replace the bypass with a translated context, which
> currently won't be set up anywhere for the non-PAS use case.

hm, maybe the patches supporting the handover could be updated to set up 
the context in the non-PAS case?

> In addition, even on newer firmware with PAS support I would expect that
> special care is required to "atomically" handover the IOMMU
> configuration from the bootloader. If the lite ADSP remains running on
> these firmware versions as well, the bypass or suitable mappings must be
> maintained until the lite ADSP firmware is stopped.
> […]
Thanks,
~val

