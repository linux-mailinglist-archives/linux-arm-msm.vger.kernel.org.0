Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA3F6F908
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 07:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfGVFs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 01:48:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33670 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbfGVFs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 01:48:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0436161791; Mon, 22 Jul 2019 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563774506;
        bh=NU8ZN7RCXpkbFXfaEAk2r5vNN1g36wgevgLSQbO3cMg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Gu4Oq1cjbcuZyc4LoWfO3pG1/cCZgRQ6LtnyayNUz20wtbDBKJDM2HBH2v9+9uiBh
         wDn0QL9SWBLdxWm0VpN9MNTM/75gMP4pMyYiIV1Y0csvrFW3J2SCc6JSfxztr3IvDZ
         iGGkzRdZBPu8CharE/wFibedeDT9yK7FXxa8loWs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3DDCD6043F;
        Mon, 22 Jul 2019 05:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563774504;
        bh=NU8ZN7RCXpkbFXfaEAk2r5vNN1g36wgevgLSQbO3cMg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YP4q1pfw79TVf26gWKKYcYUgfHkh3h80Qms6HqnKL12k8BlVHza26unX+PgIxko/m
         RxMdb4W26v1FDTcACBXBOFbx8FzBBuC+72DU9zV8zz5D8sC2m6SLraPzjSuuoE87WI
         ZkeOUI637eQPbvzYfxxTLon7MORl/MpeVplNWw98=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3DDCD6043F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv8 5/5] coresight: cpu-debug: Add support for Qualcomm Kryo
To:     Leo Yan <leo.yan@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e2c4cc7c6ccaa5695f25af20c8e487ac53b39955.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717165602.GA4271@xps15> <20190721143553.GA25136@leoy-ThinkPad-X240s>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <c4d88fb1-15ae-6e08-bd74-0ffee5a35e1c@codeaurora.org>
Date:   Mon, 22 Jul 2019 11:18:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721143553.GA25136@leoy-ThinkPad-X240s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/21/2019 8:05 PM, Leo Yan wrote:
> On Wed, Jul 17, 2019 at 10:56:02AM -0600, Mathieu Poirier wrote:
>> On Fri, Jul 12, 2019 at 07:46:27PM +0530, Sai Prakash Ranjan wrote:
>>> Add support for coresight CPU debug module on Qualcomm
>>> Kryo CPUs. This patch adds the UCI entries for Kryo CPUs
>>> found on MSM8996 which shares the same PIDs as ETMs.
>>>
>>> Without this, below error is observed on MSM8996:
>>>
>>> [    5.429867] OF: graph: no port node found in /soc/debug@3810000
>>> [    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
>>> [    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
>>> [    5.446474] OF: graph: no port node found in /soc/debug@3910000
>>> [    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
>>> [    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
>>> [    5.487765] OF: graph: no port node found in /soc/debug@3a10000
>>> [    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
>>> [    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
>>> [    5.501802] OF: graph: no port node found in /soc/debug@3b10000
>>> [    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
>>> [    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized
>>>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> ---
>>>   .../hwtracing/coresight/coresight-cpu-debug.c | 33 +++++++++----------
>>>   drivers/hwtracing/coresight/coresight-priv.h  | 10 +++---
>>>   2 files changed, 21 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>>> index 2463aa7ab4f6..96544b348c27 100644
>>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>>> @@ -646,24 +646,23 @@ static int debug_remove(struct amba_device *adev)
>>>   	return 0;
>>>   }
>>>   
>>> +static const struct amba_cs_uci_id uci_id_debug[] = {
>>> +	{
>>> +		/*  CPU Debug UCI data */
>>> +		.devarch	= 0x47706a15,
>>> +		.devarch_mask	= 0xfff0ffff,
>>> +		.devtype	= 0x00000015,
>>> +	}
>>> +};
>>> +
>>>   static const struct amba_id debug_ids[] = {
>>> -	{       /* Debug for Cortex-A53 */
>>> -		.id	= 0x000bbd03,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{       /* Debug for Cortex-A57 */
>>> -		.id	= 0x000bbd07,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{       /* Debug for Cortex-A72 */
>>> -		.id	= 0x000bbd08,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{       /* Debug for Cortex-A73 */
>>> -		.id	= 0x000bbd09,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{ 0, 0 },
>>> +	CS_AMBA_ID(0x000bbd03),				/* Cortex-A53 */
>>> +	CS_AMBA_ID(0x000bbd07),				/* Cortex-A57 */
>>> +	CS_AMBA_ID(0x000bbd08),				/* Cortex-A72 */
>>> +	CS_AMBA_ID(0x000bbd09),				/* Cortex-A73 */
>>> +	CS_AMBA_UCI_ID(0x000f0205, uci_id_debug),	/* Qualcomm Kryo */
>>> +	CS_AMBA_UCI_ID(0x000f0211, uci_id_debug),	/* Qualcomm Kryo */
>>> +	{},
>>>   };
>>>   
>>>   static struct amba_driver debug_driver = {
>>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>>> index 7d401790dd7e..41ae5863104d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>>> @@ -185,11 +185,11 @@ static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
>>>   	}
>>>   
>>>   /* coresight AMBA ID, full UCI structure: id table entry. */
>>> -#define CS_AMBA_UCI_ID(pid, uci_ptr)	\
>>> -	{				\
>>> -		.id	= pid,		\
>>> -		.mask	= 0x000fffff,	\
>>> -		.data	= uci_ptr	\
>>> +#define CS_AMBA_UCI_ID(pid, uci_ptr)		\
>>> +	{					\
>>> +		.id	= pid,			\
>>> +		.mask	= 0x000fffff,		\
>>> +		.data	= (void *)uci_ptr	\
>>>   	}
>>
>> I will pickup this patch - it will show up in my next tree when rc1 comes out.
> 
> I tested this patch on the mainline kernel with latest commit
> f1a3b43cc1f5 ("Merge branch 'for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input"). FWIW:
> 
> Tested-by: Leo Yan <leo.yan@linaro.org>
> 
> P.s. Acutally I tested this patch for 5.2-rcx a few days ago and found
> a regression for CPU debug module: I observed the CPU debug module
> panic dump will stuck.  After I pulled to latest kernel code base the
> CPU debug module can work well; also works well with this patch.  F.Y.I.
> 

Thanks Leo.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
