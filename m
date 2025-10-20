Return-Path: <linux-arm-msm+bounces-77978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC78BF0B0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21DC34E0376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA71253957;
	Mon, 20 Oct 2025 10:57:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFEF246783;
	Mon, 20 Oct 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957829; cv=none; b=BiiA4aDieEqQ5ScG4n+jRZmJugbEwvswxuAtq66rpPXjXU7jaxosm9WZRhjqHYed5Zdm0dpEgX8cogIdDA+Fx70MiQsTRRA+yYB9oIS0lowlsr87v6ko4g29m0Jbcx4n7bG+u+lTx6Bdx7+SMHn5ysxn3JLoryml2Vac785K7ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957829; c=relaxed/simple;
	bh=GqzSWhkRofkBTmEG+bUCXlI1T/uWvGXwQ0mCqIaJJe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkLIRbIGLwA449tVAjGKbvvQ6WlNP2WmLYHtuPXwZ4RtH5YzcqbStRIDmgWeDlU25Lv/Mk4K+DNaFlnaPpuC+seHL0EY1m1nYlwAYNZtUier6kBJ6uvXJSkOnhijJWyMRpY/ew6AHofUxuHXpPRNewFpQ3+WYvoxUToNp8HWFlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BA451063;
	Mon, 20 Oct 2025 03:56:59 -0700 (PDT)
Received: from [10.57.65.154] (unknown [10.57.65.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E80313F66E;
	Mon, 20 Oct 2025 03:57:05 -0700 (PDT)
Message-ID: <9cb7bead-d0c0-4edc-a8e3-a77731e8dc8c@arm.com>
Date: Mon, 20 Oct 2025 11:57:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
 <5a95ad38-0b32-4889-a8fb-af7e79c2e862@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <5a95ad38-0b32-4889-a8fb-af7e79c2e862@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/2025 11:18, Jie Gan wrote:
> 
> 
> On 10/20/2025 5:06 PM, Xiaoqi Zhuang wrote:
>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
>> and enabled again, currently sysfs_buf will point to the newly
>> allocated memory(buf_new) and free the old memory(buf_old). But the
>> etr_buf that is being used by the ETR remains pointed to buf_old, not
>> updated to buf_new. In this case, it will result in a memory
>> use-after-free issue.
>>
>> Fix this by checking ETR's mode before updating and releasing buf_old,
>> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
>>
> 
> I think we need a fix tag for the fix patch:
> Fixes: de5461970b3e ("coresight: tmc: allocating memory when needed")
> 
> minor comment:
> Since ETR is enabled, we can't switch the sysfs buffer, can we exit 
> earlier by checking the CS_MODE to avoid allocating memory unnecessarily?

+1

Something like this:

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c 
b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..a9ddb05c10d9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1252,6 +1252,12 @@ static struct etr_buf 
*tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
         raw_spin_lock_irqsave(&drvdata->spinlock, flags);
         sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
         if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
+               /*
+                * If the ETR is already enabled, continue with the existing
+                * buffer.
+                */
+               if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+                       goto out;
                 raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

                 /* Allocate memory with the locks released */

Suzuki>
> Besides,
> Looks good to me.
> 
> Thanks,
> Jie
> 
>> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index b07fcdb3fe1a..3e73cf2c38a3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1268,6 +1268,13 @@ static struct etr_buf 
>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>           goto out;
>>       }
>> +    /*
>> +     * Since this sink is already enabled, the existing buffer should 
>> not
>> +     * be released even if the buffer size has changed.
>> +     */
>> +    if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
>> +        goto out;
>> +
>>       /*
>>        * If we don't have a buffer or it doesn't match the requested 
>> size,
>>        * use the buffer allocated above. Otherwise reuse the existing 
>> buffer.
>>
>> ---
>> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
>> change-id: 20251020-fix_etr_issue-02c706dbc899
>>
>> Best regards,
> 


