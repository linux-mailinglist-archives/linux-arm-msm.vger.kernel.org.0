Return-Path: <linux-arm-msm+bounces-90369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAkQAHG4c2n/yAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:05:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE579574
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE2FE301F9A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAEE156F45;
	Fri, 23 Jan 2026 18:02:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1016FBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191336; cv=none; b=BzASTQY1cbktOrUH/0ARBe7VF5I3bQsdotZQPZLfH80mBJ8KM2mSWadIXkVNRQzVbbf8sR4tCEmjc47amBKyh/tN0UH/q5lVhx1lrHeAcEb3KDzNYPb4phIvJkgTYUk3FC+V1jS0eHR815/U69mIRr6RMHcATMQ0T8IuWQO+hKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191336; c=relaxed/simple;
	bh=0tmiboM7R1Bvbms2DadtCBBGohUmyBLzU7D/VDlZMVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stE2w8sj5ICEnfzZZGC7OQzWYBUwSfE6UB98gCRKHPk/0jPDpFLaAQ8va/ym19PldMBl/S6yYDqZy06RQN820CVS2RyMZEEYLNlmUc1jew3uugIol34KcNYimY8HyXC0E5GoQF+Ajd/cYGTE+tZZd+oo15BoyT+CSyz0/e2a8YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03BAF1476;
	Fri, 23 Jan 2026 10:02:06 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AC183F694;
	Fri, 23 Jan 2026 10:02:11 -0800 (PST)
Message-ID: <da3fcb7f-4ac4-41c0-b3ad-055c6766fd5c@arm.com>
Date: Fri, 23 Jan 2026 18:02:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom: iommu: nullpointer dereference on boot on
 apq8064
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>
 <20260105180213.GG125261@ziepe.ca>
 <9a86120e-c0be-4ed5-a3de-cc7f164da154@arm.com>
 <5cab0953-c2a3-4baa-af91-e9519afef092@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5cab0953-c2a3-4baa-af91-e9519afef092@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90369-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56BE579574
X-Rspamd-Action: no action

On 2026-01-15 7:02 pm, Christian Schrefl wrote:
> Hi Robin,
> 
> On 1/6/26 7:50 PM, Robin Murphy wrote:
>> On 2026-01-05 6:02 pm, Jason Gunthorpe wrote:
>>> Though this looks really weird:
>>>
>>>           struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
>>>           int sid;
>>>
>>>           if (list_empty(&(*iommu)->ctx_list)) {
>>>                   master = kzalloc(sizeof(*master), GFP_ATOMIC);
>>>
>>> So maybe master is NULL and !list_empty()?
>>
>> AFAICS that could happen if of_xlate has run once, and then for whatever
>> reason dev->iommu is torn down and the whole process started from
>> scratch a second time - although I'm struggling to see any obvious cause
>> for that in the absence of any other visible errors or async probe
>> races (and assuming that the IOMMUs on this platform ever actually
>> worked at all, of course...)
>>
>> However it certainly stands out as a bit wrong that of_xlate is touching
>> the IOMMU instance itself - that should never have been expected to work
>> well. Does the diff below help?
>>
>> Thanks,
>> Robin.
>>
>> ----->8-----
>> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
>> index 819add75a665..e57780fc3287 100644
>> --- a/drivers/iommu/msm_iommu.c
>> +++ b/drivers/iommu/msm_iommu.c
>> @@ -360,14 +360,11 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
>>   /* Must be called under msm_iommu_lock */
>>   static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>>   {
>> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>       struct msm_iommu_dev *iommu, *ret = NULL;
>> -    struct msm_iommu_ctx_dev *master;
>>   
>>       list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
>> -        master = list_first_entry(&iommu->ctx_list,
>> -                      struct msm_iommu_ctx_dev,
>> -                      list);
>> -        if (master->of_node == dev->of_node) {
>> +        if (iommu->dev->fwnode == fwspec->iommu_fwnode) {
>>               ret = iommu;
>>               break;
>>           }
>> @@ -378,6 +375,7 @@ static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>>   
>>   static struct iommu_device *msm_iommu_probe_device(struct device *dev)
>>   {
>> +    struct msm_iommu_ctx_dev *master;
>>       struct msm_iommu_dev *iommu;
>>       unsigned long flags;
>>   
>> @@ -388,6 +386,8 @@ static struct iommu_device *msm_iommu_probe_device(struct device *dev)
>>       if (!iommu)
>>           return ERR_PTR(-ENODEV);
>>   
>> +    master = dev_iommu_priv_get(dev);
>> +    list_add(&master->list, &iommu->ctx_list);
>>       return &iommu->iommu;
>>   }
>>   
>> @@ -604,14 +604,13 @@ static int insert_iommu_master(struct device *dev,
>>       struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
>>       int sid;
>>   
>> -    if (list_empty(&(*iommu)->ctx_list)) {
>> +    if (!master) {
>>           master = kzalloc(sizeof(*master), GFP_ATOMIC);
>>           if (!master) {
>>               dev_err(dev, "Failed to allocate iommu_master\n");
>>               return -ENOMEM;
>>           }
>>           master->of_node = dev->of_node;
>> -        list_add(&master->list, &(*iommu)->ctx_list);
>>           dev_iommu_priv_set(dev, master);
>>       }
>>   
> 
> Sorry for taking so long until I got to trying it out.
> The patch fixes the crash!

Bah, in the process of writing this up properly I've realised that 
although it fixes the crash, I think it breaks the multi-IOMMU 
functionality, as .add_device will only be called for the first IOMMU 
instance, whereas the current code is cheekily abusing .of_xlate to link 
the device to both instances. And in fact that implies the existing code 
is yet more buggy, as it seems it will leak and reallocate 
dev_iommu_priv the first time it looks up the second instance (whose 
ctx_list will be empty), thus it's only working at all because in all 
cases the DT happens to list all the IDs for one instance before all for 
the other, and both use an identical set of ID values. Oh dear...

Are you using the GPU and/or display device(s) enough to be able to tell 
whether their IOMMUs are working as expected?

Thanks,
Robin.

> 
> Cheers,
> Christian
> 


