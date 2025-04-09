Return-Path: <linux-arm-msm+bounces-53633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F735A8248E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6C11BC0988
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 12:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BC625E835;
	Wed,  9 Apr 2025 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="MF6636WL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2D253B47;
	Wed,  9 Apr 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201344; cv=pass; b=OviZH8GePRoNQtxu4KJ7gFmaVR0f93LbUDE8Qe0ojOPSZvTasjDSgSc1XHkeSWzXkgV8SFDcx3s7Ds+rGjnqs7qfxddNb5/ReTS2Ame6ZRCQuBv2nrA/ZGtYCe0ZqfGiBKNEP1UGgrX/Zsc6TIk/acM3Snj/HkhvVWyW3bYvD/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201344; c=relaxed/simple;
	bh=6yBf8W8vO2hACh1SC+eLkO+C14WaO1cr6vh8aqgfWO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiwGwR7oS17769p+4iefU3tRhkNIatqpdVVQpoz+DQGtgWni6GEcbE9LJWaJNPfbHCsNKJNwsxMq2xxoE/wM+ZT1jCnGGkGqlTaRjXeLR1D13BSy17zqoAiUN8VV9r1uMy205lnFvKv9zxerks9h029VyeTvGlK8EOOjXBNebXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=MF6636WL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744201319; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kpWWeEwnHlweCrW89qn+jAQTjQVGZhvmP8/cFimLLascz97YoI3FxPQVZXG6LBoIfPHmGosGzXluJgXr2HrvBosTm1z5/LENKx6Pj1bmgC+kEO+ACF+uDjFhP5b9eBvLgo3FhIvHbP50EgmKOeTHe78KJOxBMpXRLScC9tCl238=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744201319; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0sj+DuIzdkG+cv5QyQfQu6z2szFxnb+cJQRXL5LW4yI=; 
	b=mk9LFpWj6grcuOh2VEn/wiC0tp18XA+XwOahS+fleFd5AeqKOvxRb2IiJQwztBj9uiQ8nh/3D+Jdo/U0D6gfUw0iFvnnqxE9g6MoIoB2ubJFnCEtoPHxfWdfaujVVc0YYzKi97Mng0u2WBRLQRnDzUfwRcJV2mgO1pdwqjy9Z8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744201318;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0sj+DuIzdkG+cv5QyQfQu6z2szFxnb+cJQRXL5LW4yI=;
	b=MF6636WLv1EvVDc9ZrjCcq7EnD1Nmm0Kuc3uZwnwuDv/CkRPgDTS6aonR5rMX5/r
	QXmPRg2O7+FqF9UrvCl9WUThMPW4jZrxtbTTghezOuC8lP0IHGSlUcMkMkR2E71d73P
	FR1E3ZwQhRGi5owN/AYfHmTd4rfsmwKifs3rOqJ8=
Received: by mx.zohomail.com with SMTPS id 1744201317620751.9922453113006;
	Wed, 9 Apr 2025 05:21:57 -0700 (PDT)
Message-ID: <08e71d7d-5da6-4dfe-a504-190e7633df12@collabora.com>
Date: Wed, 9 Apr 2025 17:21:49 +0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] bus: mhi: host: don't free bhie tables during power
 off
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
 Qiang Yu <quic_qianyu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kunwu Chan <chentao@kylinos.cn>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>,
 Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250409082444.582295-1-usama.anjum@collabora.com>
 <56f4b9fc-69ba-c867-653b-7ea28ad8ab0b@quicinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <56f4b9fc-69ba-c867-653b-7ea28ad8ab0b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Krishna,

Thank you for reviewing.

On 4/9/25 4:25 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/9/2025 1:54 PM, Muhammad Usama Anjum wrote:
>> Fix dma_direct_alloc() failure at resume time during bhie_table
>> allocation. There is a crash report where at resume time, the memory
>> from the dma doesn't get allocated and MHI fails to re-initialize.
>> There may be fragmentation of some kind which fails the allocation
>> call.
>>
>> To fix it, don't free the memory at power down. Use the same allocated
>> memory again and again after every resume/hibernation. This patch has
>> been tested with resume and hibernation both.
> How do you handle the mhi un-register case, in that case all the MHI
> memory needs to be freed.
I'm working on fixing it. I'll post a v2.

>>
>> Here are the crash logs:
>>
>> [ 3029.338587] mhi mhi0: Requested to power ON
>> [ 3029.338621] mhi mhi0: Power on setup success
>> [ 3029.668654] kworker/u33:8: page allocation failure: order:7,
>> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
>> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted
>> 6.11.11-valve10-1-neptune-611-gb69e902b4338
>> #1ed779c892334112fb968aaa3facf9686b5ff0bd7
>> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112
>> 08/01/2024
>> [ 3029.668694] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
>> [ 3029.668717] Call Trace:
>> [ 3029.668722]  <TASK>
>> [ 3029.668728]  dump_stack_lvl+0x4e/0x70
>> [ 3029.668738]  warn_alloc+0x164/0x190
>> [ 3029.668747]  ? srso_return_thunk+0x5/0x5f
>> [ 3029.668754]  ? __alloc_pages_direct_compact+0xaf/0x360
>> [ 3029.668761]  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
>> [ 3029.668774]  __alloc_pages_noprof+0x321/0x350
>> [ 3029.668782]  __dma_direct_alloc_pages.isra.0+0x14a/0x290
>> [ 3029.668790]  dma_direct_alloc+0x70/0x270
>> [ 3029.668796]  mhi_alloc_bhie_table+0xe8/0x190 [mhi
>> faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668814]  mhi_fw_load_handler+0x1bc/0x310 [mhi
>> faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668830]  mhi_pm_st_worker+0x5c8/0xaa0 [mhi
>> faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668844]  ? srso_return_thunk+0x5/0x5f
>> [ 3029.668853]  process_one_work+0x17e/0x330
>> [ 3029.668861]  worker_thread+0x2ce/0x3f0
>> [ 3029.668868]  ? __pfx_worker_thread+0x10/0x10
>> [ 3029.668873]  kthread+0xd2/0x100
>> [ 3029.668879]  ? __pfx_kthread+0x10/0x10
>> [ 3029.668885]  ret_from_fork+0x34/0x50
>> [ 3029.668892]  ? __pfx_kthread+0x10/0x10
>> [ 3029.668898]  ret_from_fork_asm+0x1a/0x30
>> [ 3029.668910]  </TASK>
>>
>> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-
>> QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>   drivers/bus/mhi/host/boot.c | 11 +++++++----
>>   drivers/bus/mhi/host/init.c | 15 +++------------
>>   2 files changed, 10 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index efa3b6dddf4d2..8b3d2b9d239c3 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -323,6 +323,7 @@ void mhi_free_bhie_table(struct mhi_controller
>> *mhi_cntrl,
>>                     mhi_buf->buf, mhi_buf->dma_addr);
>>         kfree(image_info->mhi_buf);
>> +    image_info->mhi_buf = NULL;
> image_info is getting freed in the next line. why do we need this?
I'll remove this line.

> 
> - Krishna Chaitanya.
>>       kfree(image_info);
>>   }
>>   @@ -584,10 +585,12 @@ void mhi_fw_load_handler(struct mhi_controller
>> *mhi_cntrl)
>>        * device transitioning into MHI READY state
>>        */
>>       if (fw_load_type == MHI_FW_LOAD_FBC) {
>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>> fw_sz);
>> -        if (ret) {
>> -            release_firmware(firmware);
>> -            goto error_fw_load;
>> +        if (!mhi_cntrl->fbc_image) {
>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>> >fbc_image, fw_sz);
>> +            if (ret) {
>> +                release_firmware(firmware);
>> +                goto error_fw_load;
>> +            }
>>           }
>>             /* Load the firmware into BHIE vec table */
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 13e7a55f54ff4..3c20e4541357e 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -1173,8 +1173,9 @@ int mhi_prepare_for_power_up(struct
>> mhi_controller *mhi_cntrl)
>>           /*
>>            * Allocate RDDM table for debugging purpose if specified
>>            */
>> -        mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
>> -                     mhi_cntrl->rddm_size);
>> +        if (!mhi_cntrl->rddm_image)
>> +            mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
>> +                         mhi_cntrl->rddm_size);
>>           if (mhi_cntrl->rddm_image) {
>>               ret = mhi_rddm_prepare(mhi_cntrl,
>>                              mhi_cntrl->rddm_image);
>> @@ -1202,16 +1203,6 @@ EXPORT_SYMBOL_GPL(mhi_prepare_for_power_up);
>>     void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>>   {
>> -    if (mhi_cntrl->fbc_image) {
>> -        mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>> -        mhi_cntrl->fbc_image = NULL;
>> -    }
>> -
>> -    if (mhi_cntrl->rddm_image) {
>> -        mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
>> -        mhi_cntrl->rddm_image = NULL;
>> -    }
>> -
>>       mhi_cntrl->bhi = NULL;
>>       mhi_cntrl->bhie = NULL;
>>   


-- 
Regards,
Usama

