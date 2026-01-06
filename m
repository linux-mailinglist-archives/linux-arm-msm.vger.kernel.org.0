Return-Path: <linux-arm-msm+bounces-87747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A9CFAB1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B18793153776
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC412D8DC4;
	Tue,  6 Jan 2026 18:51:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A22C311979
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725465; cv=none; b=KdsSjK8f6ieIwTynft6HN4Q88PAzyyDUCigie0Q+YpCqci2Lui6B1lORh19GRUAtsDolPsL4aUKVnQniONf8l75uosFS7jaqeDEjW0CuP4gR059vJrGmxbSqFEqnBP8uo1ehIwwwPRxfCI+NNmPp/KvmTW0GVZs6XVve4HBQ5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725465; c=relaxed/simple;
	bh=7LU2IieSdrwxa9q8owXuIsOk8it20eQCQUVEuE/0NtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjBwjzGsoRBm7KsNFc/ODnneFuiaTBqjpAR06MjwgZhPx9En9cNxPKZ1gKZ93Va6Eh3C5FVu+hDysoetTbqP0KrfVozO40jBRCZZHi4pZeishCpdQK8xtAQU2y2ad15CvzYao7PLTUgquZSJHH4wnpZYxR7HzHoplqaRO4og6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9033A497;
	Tue,  6 Jan 2026 10:50:52 -0800 (PST)
Received: from [10.57.46.241] (unknown [10.57.46.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E77303F6A8;
	Tue,  6 Jan 2026 10:50:57 -0800 (PST)
Message-ID: <9a86120e-c0be-4ed5-a3de-cc7f164da154@arm.com>
Date: Tue, 6 Jan 2026 18:50:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom: iommu: nullpointer dereference on boot on
 apq8064
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>
 <20260105180213.GG125261@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260105180213.GG125261@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-05 6:02 pm, Jason Gunthorpe wrote:
> On Mon, Dec 29, 2025 at 11:26:42PM +0100, Christian Schrefl wrote:
>> Hi everyone,
>>
>> I've found a panic on boot with v6.19-rc3 on the asus-nexus7-flo tablet with a APQ8064 CPU.
>>
>> I've bisected it down to commit bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper
>> probe path"). Reverting the drivers/iommu/iommu.c changes (removing the added if block)
>> fixes the crash, but that presumably exists for a reason.
>> The diff for the fix:
>> ```
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 2ca990dfbb88..9f32d70b207d 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -453,14 +453,6 @@ static int iommu_init_device(struct device *dev)
>>           * already having a driver bound means dma_configure has already run and
>>           * found no IOMMU to wait for, so there's no point calling it again.
>>           */
>> -       if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
>> -               mutex_unlock(&iommu_probe_device_lock);
>> -               dev->bus->dma_configure(dev);
>> -               mutex_lock(&iommu_probe_device_lock);
>> -               /* If another instance finished the job for us, skip it */
>> -               if (!dev->iommu || dev->iommu_group)
>> -                       return -ENODEV;
>> -       }
>>          /*
>>           * At this point, relevant devices either now have a fwspec which will
>>           * match ops registered with a non-NULL fwnode, or we can reasonably
>> ```
> 
>> [    5.900971] Call trace:
>> [    5.900999]  qcom_iommu_of_xlate from of_iommu_xlate+0x7c/0x9c
> 
> Did you look at what line in qcom_iommu_of_xlate() is crashing with
> NULL pointer?
> 
> It wasn't so obvious to me what it could be..

Comparing the "Code:" line from the dump against a local build, this
looks to be the dereference of master->num_mids at the start of the
loop.

> Though this looks really weird:
> 
>          struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
>          int sid;
> 
>          if (list_empty(&(*iommu)->ctx_list)) {
>                  master = kzalloc(sizeof(*master), GFP_ATOMIC);
> 
> So maybe master is NULL and !list_empty()?

AFAICS that could happen if of_xlate has run once, and then for whatever
reason dev->iommu is torn down and the whole process started from
scratch a second time - although I'm struggling to see any obvious cause
for that in the absence of any other visible errors or async probe
races (and assuming that the IOMMUs on this platform ever actually
worked at all, of course...)

However it certainly stands out as a bit wrong that of_xlate is touching
the IOMMU instance itself - that should never have been expected to work
well. Does the diff below help?

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 819add75a665..e57780fc3287 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -360,14 +360,11 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
  /* Must be called under msm_iommu_lock */
  static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
  {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
  	struct msm_iommu_dev *iommu, *ret = NULL;
-	struct msm_iommu_ctx_dev *master;
  
  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
-		master = list_first_entry(&iommu->ctx_list,
-					  struct msm_iommu_ctx_dev,
-					  list);
-		if (master->of_node == dev->of_node) {
+		if (iommu->dev->fwnode == fwspec->iommu_fwnode) {
  			ret = iommu;
  			break;
  		}
@@ -378,6 +375,7 @@ static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
  
  static struct iommu_device *msm_iommu_probe_device(struct device *dev)
  {
+	struct msm_iommu_ctx_dev *master;
  	struct msm_iommu_dev *iommu;
  	unsigned long flags;
  
@@ -388,6 +386,8 @@ static struct iommu_device *msm_iommu_probe_device(struct device *dev)
  	if (!iommu)
  		return ERR_PTR(-ENODEV);
  
+	master = dev_iommu_priv_get(dev);
+	list_add(&master->list, &iommu->ctx_list);
  	return &iommu->iommu;
  }
  
@@ -604,14 +604,13 @@ static int insert_iommu_master(struct device *dev,
  	struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
  	int sid;
  
-	if (list_empty(&(*iommu)->ctx_list)) {
+	if (!master) {
  		master = kzalloc(sizeof(*master), GFP_ATOMIC);
  		if (!master) {
  			dev_err(dev, "Failed to allocate iommu_master\n");
  			return -ENOMEM;
  		}
  		master->of_node = dev->of_node;
-		list_add(&master->list, &(*iommu)->ctx_list);
  		dev_iommu_priv_set(dev, master);
  	}
  


