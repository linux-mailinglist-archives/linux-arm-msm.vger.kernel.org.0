Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BD33F8FEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 23:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhHZUxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 16:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243568AbhHZUxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 16:53:12 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D59C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:52:24 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9F1F4200D9;
        Thu, 26 Aug 2021 22:52:21 +0200 (CEST)
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
Date:   Thu, 26 Aug 2021 22:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826141826.GB31229@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/26/21 4:18 PM, Shawn Guo wrote:
> Hi Marijn,
> 
> Thanks much for the information!
> 
> On Tue, Aug 24, 2021 at 05:18:05PM +0200, Marijn Suijten wrote:
>> Hi Shawn,
>>
>> On 8/24/21 11:41 AM, Shawn Guo wrote:
>>> From: Shawn Guo <shawn.guo@linaro.org>
>>>
>>> It's been observed on Sony Xperia M4 Aqua phone, that wcnss firmware has
>>> the type of the second segment holding hashes just be PT_LOAD.  So drop
>>> the check on phdrs[1].p_type to get it go on that phone.
>>>
>>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>>> ---
>>>    drivers/soc/qcom/mdt_loader.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
>>> index eba7f76f9d61..6034cd8992b0 100644
>>> --- a/drivers/soc/qcom/mdt_loader.c
>>> +++ b/drivers/soc/qcom/mdt_loader.c
>>> @@ -98,7 +98,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>>>    	if (ehdr->e_phnum < 2)
>>>    		return ERR_PTR(-EINVAL);
>>> -	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
>>> +	if (phdrs[0].p_type == PT_LOAD)
>>>    		return ERR_PTR(-EINVAL);
>>>    	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
>>>
>>
>>
>> Konrad (on the CC-list) originally came up with a similar patch to make his
>> Sony phone boot (Xperia XZ, MSM8996).  We however concluded that this
>> solution is wrong, for the simple fact that the code below expects a PT_NULL
>> header with data in the right place.  Skipping this check most likely means
>> that the code below will read out of bounds since the mdt file isn't large
>> enough; this data is supposed to be read from an external file as indicated
>> by the meaning of PT_LOAD.  We built a solution for this, and fortunately
>> CAF independently submitted a similar solution to the lists a while ago
>> which is more thorough:
>>
>> https://lore.kernel.org/linux-arm-msm/1609968211-7579-1-git-send-email-sidgup@codeaurora.org/
> 
> While a thorough solution is good, I do not think my patch makes
> anything worse or breaks anything, while fixing my issue on Sony Xperia
> M4 Aqua.  All the current assumptions hold true for my WCNSS firmware,
> only except that phdrs[1] gets a PT_LOAD type.


It's not up to me to choose between a thorough or quick solution, but 
this patch seems to open up the possibility for an out-of-bounds read. 
The assertion was placed in this function for a reason after all.

> There is a blog[1] illustrating the situation quite nicely.  Again, the
> only thing my WCNSS firmware differs from the illustration is that
> hash segment gets a PT_LOAD type.


Yes, that blog post nicely explains the format but it doesn't cover that 
the hash is encoded in the second program header nor that it can be 
copied to be packed tightly against the ELF header?  Maybe that only 
applies to newer formats?

> Skipping the check will not cause problem for firmwares we have seen,
> because hash segment is duplicated in .mdt file, and we are using that
> duplication instead of reading from .b01 file.


Can you share some more details about the firmware file you're using: 
size and the program headers as shown by `readelf -l`?  If possible, can 
you also validate whether QCOM_MDT_TYPE_HASH is set in phdrs[1].p_flags 
& QCOM_MDT_TYPE_MASK (using something like GNU poke)?

All the files I'm able to test adhere to `/* Is the header and hash 
already packed */`: `ehdr_size + hash_size == fw->size` (meaning the 
file solely consists of a tightly packed ELF header and hash signature) 
but I won't be surprised if there are firmware files out in the wild 
with different headers or the hash missing, otherwise the else clause 
wouldn't exist.
This else clause causes a read starting at fw->data + phdrs[1].p_offset 
of phdrs[1].p_filesz bytes which is almost certainly out of bounds if 
the program header type is PT_LOAD instead of PT_NONE, otherwise it 
wouldn't need to be loaded from a .bXX file in the first place.

For this quick solution to be valid I propose to reject PT_LOAD in the 
else clause, and otherwise validate that phdrs[1].p_offset + hash_size 
<= fw->size.
The aforementioned patch series in qcom_mdt_bins_are_split (and certain 
firmware files from Sony phones) show that it is also possible to read 
PT_NULL headers from external files, as long as the header references a 
range that is out of bounds of the mdt file.

> Shawn
> 
> [1] http://bits-please.blogspot.com/2016/04/exploring-qualcomms-secure-execution.html
> 

- Marijn
