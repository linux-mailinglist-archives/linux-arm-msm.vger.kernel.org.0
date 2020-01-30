Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDDC414D8A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 11:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgA3KHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 05:07:34 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:16452 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726873AbgA3KHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 05:07:33 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00UA3B3E002101;
        Thu, 30 Jan 2020 11:07:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xOteWNZ7Ff6UQHGiM84pJCDWGQlrerPhvDSeyaQw1Zg=;
 b=SdLDJbRfmL9Bc9ZSiIQ0ciEft4U2nTsDCp7HurExOwkdCIXtagWov7RuIDvGRaZd201t
 6K0ODT7sXhlhXZgt4osag/yhxURD05kbvimjNldtLF2Zc2C+M//LEqDTDuaczQV87Blt
 Yvw2qHsxzdNKLS/BIkTaVB7gyVHJYAcSSrhDUVtY+Euxg7PiV7PLl/y+zIQyNfBGmM6p
 XuEzTSkaIYJGfOh7pbRyi8y6L3wHE0mQdLLUkLZLVXODCe2YwRh/aDrKsw2ECqtYYtL8
 UyZCsk+wUQgNlqayeRyx2HBq1ZMEF+noPCyHpnO0A8R9ereVaO4KpYLkcSRzZIBf4Vg5 DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrcay7hct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Jan 2020 11:07:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC03210003A;
        Thu, 30 Jan 2020 11:07:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C443B2B1872;
        Thu, 30 Jan 2020 11:07:22 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 11:07:22 +0100
Subject: Re: [PATCH v2 6/8] remoteproc: Introduce "panic" callback in ops
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-7-bjorn.andersson@linaro.org>
 <20200110212307.GC11555@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <13ea6f8e-c017-d4b3-6658-c193cb4d18f1@st.com>
Date:   Thu, 30 Jan 2020 11:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200110212307.GC11555@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-30_02:2020-01-28,2020-01-30 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 1/10/20 10:23 PM, Mathieu Poirier wrote:
> On Thu, Dec 26, 2019 at 09:32:13PM -0800, Bjorn Andersson wrote:
>> Introduce a "panic" function in the remoteproc ops table, to allow
>> remoteproc instances to perform operations needed in order to aid in
>> post mortem system debugging, such as flushing caches etc, when the
>> kernel panics.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>
>> Changes since v1:
>> - None
>>
>>  drivers/remoteproc/remoteproc_core.c | 17 +++++++++++++++++
>>  include/linux/remoteproc.h           |  4 ++++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 307df98347ba..779f19d6d8e7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1832,6 +1832,17 @@ void rproc_shutdown(struct rproc *rproc)
>>  }
>>  EXPORT_SYMBOL(rproc_shutdown);
>>  
>> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
>> +			       void *ptr)
>> +{
>> +	struct rproc *rproc = container_of(nb, struct rproc, panic_nb);
>> +
>> +	if (rproc->state == RPROC_RUNNING)
>> +		rproc->ops->panic(rproc);
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>>  /**
>>   * rproc_get_by_phandle() - find a remote processor by phandle
>>   * @phandle: phandle to the rproc
>> @@ -2057,6 +2068,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>>  	}
>>  
>> +	/* Register panic notifier for remoteprocs with "panic" callback */
>> +	if (rproc->ops->panic) {
>> +		rproc->panic_nb.notifier_call = rproc_panic_handler;
>> +		atomic_notifier_chain_register(&panic_notifier_list, &rproc->panic_nb);
> 
> Line over 80 characters.
atomic_notifier_chain_unregister should be added in rproc_del.

Regards,
Arnaud
> 
>> +	}
>> +
>>  	mutex_init(&rproc->lock);
>>  
>>  	idr_init(&rproc->notifyids);
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 16ad66683ad0..7836c528d309 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -369,6 +369,7 @@ enum rsc_handling_status {
>>   *			expects to find it
>>   * @sanity_check:	sanity check the fw image
>>   * @get_boot_addr:	get boot address to entry point specified in firmware
>> + * @panic:	optional callback to react to system panic
>>   */
>>  struct rproc_ops {
>>  	int (*start)(struct rproc *rproc);
>> @@ -383,6 +384,7 @@ struct rproc_ops {
>>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>>  	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>> +	void (*panic)(struct rproc *rproc);
>>  };
>>  
>>  /**
>> @@ -481,6 +483,7 @@ struct rproc_dump_segment {
>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>   * @dump_segments: list of segments in the firmware
>>   * @nb_vdev: number of vdev currently handled by rproc
>> + * @panic_nb: notifier_block for remoteproc's panic handler
>>   */
>>  struct rproc {
>>  	struct list_head node;
>> @@ -514,6 +517,7 @@ struct rproc {
>>  	bool auto_boot;
>>  	struct list_head dump_segments;
>>  	int nb_vdev;
>> +	struct notifier_block panic_nb;
>>  };
>>  
>>  /**
>> -- 
>> 2.24.0
>>
