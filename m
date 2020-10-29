Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B457F29F947
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 00:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJ2Xyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 19:54:45 -0400
Received: from z5.mailgun.us ([104.130.96.5]:49641 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2Xyp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 19:54:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604015684; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=UKnFIdqE4c4/eK5bgPM/Go9F5VvlHNdTmmj4BroznaM=; b=SQWqXp17dfocq4YEeh3nc/snl1h9KzZQoV9g0csmFSN44SwC1GbK5YDue4yxfCvFNVUKfskg
 hxY0AUDA69MCpBuVriQ4otGuxqs14STxH9CL7pno/iGQKBVy7e0SYIYD49qE+8HMCqcuWKKG
 ypBJhEHDsolQOhMNU/X2qvZp2WE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f9b5644c3d7c9858aa41263 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 23:54:44
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38C2CC433F0; Thu, 29 Oct 2020 23:54:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C46BC433C6;
        Thu, 29 Oct 2020 23:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C46BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH v6 2/4] remoteproc: coredump: Add minidump functionality
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
References: <1601690757-25726-1-git-send-email-sidgup@codeaurora.org>
 <1601690757-25726-3-git-send-email-sidgup@codeaurora.org>
 <20201026210912.GA4611@builder.lan>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <ad4c375b-7051-bcce-a86c-febb72267caa@codeaurora.org>
Date:   Thu, 29 Oct 2020 16:54:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201026210912.GA4611@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/26/2020 2:09 PM, Bjorn Andersson wrote:
> On Fri 02 Oct 21:05 CDT 2020, Siddharth Gupta wrote:
>
>> This change adds a new kind of core dump mechanism which instead of dumping
>> entire program segments of the firmware, dumps sections of the remoteproc
>> memory which are sufficient to allow debugging the firmware. This function
>> thus uses section headers instead of program headers during creation of the
>> core dump elf.
>>
>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_coredump.c    | 132 ++++++++++++++++++++++++++++
>>   drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
>>   include/linux/remoteproc.h                  |   1 +
>>   3 files changed, 160 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
>> index bb15a29..e7d1394 100644
>> --- a/drivers/remoteproc/remoteproc_coredump.c
>> +++ b/drivers/remoteproc/remoteproc_coredump.c
>> @@ -13,6 +13,8 @@
>>   #include "remoteproc_internal.h"
>>   #include "remoteproc_elf_helpers.h"
>>   
>> +#define MAX_STRTBL_SIZE 512
>> +
>>   struct rproc_coredump_state {
>>   	struct rproc *rproc;
>>   	void *header;
>> @@ -323,3 +325,133 @@ void rproc_coredump(struct rproc *rproc)
>>   	 */
>>   	wait_for_completion(&dump_state.dump_done);
>>   }
>> +
>> +/**
>> + * rproc_minidump() - perform minidump
>> + * @rproc:	rproc handle
>> + *
>> + * This function will generate an ELF header for the registered sections of
>> + * segments and create a devcoredump device associated with rproc. Based on
>> + * the coredump configuration this function will directly copy the segments
>> + * from device memory to userspace or copy segments from device memory to
>> + * a separate buffer, which can then be read by userspace.
>> + * The first approach avoids using extra vmalloc memory. But it will stall
>> + * recovery flow until dump is read by userspace.
>> + */
>> +void rproc_minidump(struct rproc *rproc)
> Just to confirm, this does the same thing as rproc_coredump() with the
> difference that instead of storing the segments in program headers, you
> reference them using section headers?

Yes, that is correct.

>
>> +{
>> +	struct rproc_dump_segment *segment;
>> +	void *shdr;
>> +	void *ehdr;
>> +	size_t data_size;
>> +	size_t offset;
>> +	void *data;
>> +	u8 class = rproc->elf_class;
>> +	int shnum;
>> +	struct rproc_coredump_state dump_state;
>> +	unsigned int dump_conf = rproc->dump_conf;
>> +	char *str_tbl = "STR_TBL";
>> +
>> +	if (list_empty(&rproc->dump_segments) ||
>> +	    dump_conf == RPROC_COREDUMP_DISABLED)
>> +		return;
>> +
>> +	if (class == ELFCLASSNONE) {
>> +		dev_err(&rproc->dev, "Elf class is not set\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * We allocate two extra section headers. The first one is null.
>> +	 * Second section header is for the string table. Also space is
>> +	 * allocated for string table.
>> +	 */
>> +	data_size = elf_size_of_hdr(class) + 2 * elf_size_of_shdr(class) +
>> +		    MAX_STRTBL_SIZE;
> Once you start populating the string table there's no checks that this
> isn't overrun.
I will update the code to dynamically allocate space for the STRTBL.
>
> But really
>
>> +	shnum = 2;
>> +
>> +	list_for_each_entry(segment, &rproc->dump_segments, node) {
>> +		data_size += elf_size_of_shdr(class);
>> +		if (dump_conf == RPROC_COREDUMP_DEFAULT)
>> +			data_size += segment->size;
>> +		shnum++;
>> +	}
>> +
>> +	data = vmalloc(data_size);
>> +	if (!data)
>> +		return;
>> +
>> +	ehdr = data;
>> +	memset(ehdr, 0, elf_size_of_hdr(class));
>> +	/* e_ident field is common for both elf32 and elf64 */
>> +	elf_hdr_init_ident(ehdr, class);
>> +
>> +	elf_hdr_set_e_type(class, ehdr, ET_CORE);
>> +	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
>> +	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
>> +	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
>> +	elf_hdr_set_e_shoff(class, ehdr, elf_size_of_hdr(class));
>> +	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
>> +	elf_hdr_set_e_shentsize(class, ehdr, elf_size_of_shdr(class));
>> +	elf_hdr_set_e_shnum(class, ehdr, shnum);
>> +	elf_hdr_set_e_shstrndx(class, ehdr, 1);
>> +
>> +	/* Set the first section header as null and move to the next one. */
>> +	shdr = data + elf_hdr_get_e_shoff(class, ehdr);
>> +	memset(shdr, 0, elf_size_of_shdr(class));
>> +	shdr += elf_size_of_shdr(class);
>> +
>> +	/* Initialize the string table. */
>> +	offset = elf_hdr_get_e_shoff(class, ehdr) +
>> +		 elf_size_of_shdr(class) * elf_hdr_get_e_shnum(class, ehdr);
>> +	memset(data + offset, 0, MAX_STRTBL_SIZE);
>> +
>> +	/* Fill in the string table section header. */
>> +	memset(shdr, 0, elf_size_of_shdr(class));
>> +	elf_shdr_set_sh_type(class, shdr, SHT_STRTAB);
>> +	elf_shdr_set_sh_offset(class, shdr, offset);
>> +	elf_shdr_set_sh_size(class, shdr, MAX_STRTBL_SIZE);
>> +	elf_shdr_set_sh_entsize(class, shdr, 0);
>> +	elf_shdr_set_sh_flags(class, shdr, 0);
>> +	elf_shdr_set_sh_name(class, shdr, set_section_name(str_tbl, ehdr, class));
>> +	offset += elf_shdr_get_sh_size(class, shdr);
>> +	shdr += elf_size_of_shdr(class);
> I assume this last part creates the null entry? How about mentioning
> that in a comment - and perhaps why there needs to be a null entry.
Okay sure. I will add that comment.
>
>> +
>> +	list_for_each_entry(segment, &rproc->dump_segments, node) {
>> +		memset(shdr, 0, elf_size_of_shdr(class));
>> +		elf_shdr_set_sh_type(class, shdr, SHT_PROGBITS);
>> +		elf_shdr_set_sh_offset(class, shdr, offset);
>> +		elf_shdr_set_sh_addr(class, shdr, segment->da);
>> +		elf_shdr_set_sh_size(class, shdr, segment->size);
>> +		elf_shdr_set_sh_entsize(class, shdr, 0);
>> +		elf_shdr_set_sh_flags(class, shdr, SHF_WRITE);
>> +		elf_shdr_set_sh_name(class, shdr,
>> +				     set_section_name(segment->priv, ehdr, class));
>> +
>> +		/* No need to copy segments for inline dumps */
>> +		if (dump_conf == RPROC_COREDUMP_DEFAULT)
>> +			rproc_copy_segment(rproc, data + offset, segment, 0,
>> +					   segment->size);
>> +		offset += elf_shdr_get_sh_size(class, shdr);
>> +		shdr += elf_size_of_shdr(class);
>> +	}
>> +
>> +	if (dump_conf == RPROC_COREDUMP_DEFAULT) {
>> +		dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
>> +		return;
>> +	}
>> +
>> +	/* Initialize the dump state struct to be used by rproc_coredump_read */
>> +	dump_state.rproc = rproc;
>> +	dump_state.header = data;
>> +	init_completion(&dump_state.dump_done);
>> +
>> +	dev_coredumpm(&rproc->dev, NULL, &dump_state, data_size, GFP_KERNEL,
>> +		      rproc_coredump_read, rproc_coredump_free);
>> +
>> +	/* Wait until the dump is read and free is called. Data is freed
>> +	 * by devcoredump framework automatically after 5 minutes.
>> +	 */
>> +	wait_for_completion(&dump_state.dump_done);
>> +}
>> +EXPORT_SYMBOL(rproc_minidump);
>> diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
>> index 4b6be7b..d83ebca 100644
>> --- a/drivers/remoteproc/remoteproc_elf_helpers.h
>> +++ b/drivers/remoteproc/remoteproc_elf_helpers.h
>> @@ -11,6 +11,7 @@
>>   #include <linux/elf.h>
>>   #include <linux/types.h>
>>   
>> +#define MAX_NAME_LENGTH 16
> This name is too generic. Why is it 16?

I will update the name to  MAX_SHDR_NAME_LEN. In our usecase we didn't 
expect a length of the section name to exceed
16 characters (MAX_REGION_NAME_LENGTH defined in qcom_minidump.h in 
patch 03/04). It might change later if users
want to increase the size. What would you prefer the max name length for 
the section header to be?

>
>> +static inline unsigned int set_section_name(const char *name, void *ehdr,
>> +					    u8 class)
>> +{
>> +	u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
>> +	void *shdr;
>> +	char *strtab;
>> +	static int strtable_idx = 1;
> This can't be static as this will only start at 1 on the first
> invocation of rproc_minidump().
>
> I think it would be perfectly fine if you simply scan the string list to
> find the next available slot.
Right. I will update this as well.
>
>> +	int idx, ret = 0;
> No need to initialize ret as the first usage is an assignment.
>
> Regards,
> Bjorn

I will make this change as well.

Thanks,
Siddharth

