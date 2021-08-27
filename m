Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2C43F9E1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 19:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhH0RlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 13:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhH0RlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 13:41:13 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FE6C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 10:40:23 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0AC6D1F550;
        Fri, 27 Aug 2021 19:40:20 +0200 (CEST)
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Shawn Guo <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon> <YSkNqYHLBh4td0bG@builder.lan>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <64a684c3-74f5-f544-4902-463d31d5374b@somainline.org>
Date:   Fri, 27 Aug 2021 19:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSkNqYHLBh4td0bG@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 8/27/21 6:07 PM, Bjorn Andersson wrote:
> On Fri 27 Aug 04:57 CDT 2021, Shawn Guo wrote:
> 
>> On Fri, Aug 27, 2021 at 10:29:59AM +0200, Marijn Suijten wrote:
>>> On 8/27/21 8:24 AM, Shawn Guo wrote:
> [..]
>>>>>
>>>>> For this quick solution to be valid I propose to reject PT_LOAD in the else
>>>>> clause, and otherwise validate that phdrs[1].p_offset + hash_size <=
>>>>> fw->size.
>>>>
>>>> I'm not sure what you propose here are required for non-split firmware.
>>>
>>>
>>> Would it help if I sent a patch based on yours, with this extra validation
>>> and comments + commit message explaining the cases?
>>>
>>> Alternatively we can try re-spinning the patches from Siddharth while taking
>>> review comments, the possible .mdt == .b00 + . b01 packing, and my
>>> suggestion to handle the headers generically into account.
>>
>> I would suggest this path.  It's been 8 months, so Siddharth probably lost
>> the interest here.  It's reasonable that someone picks up the work.
>>
> 
> Prior to 498b98e93900 ("soc: qcom: mdt_loader: Support loading non-split
> images") we'd just blindly pass the entire .mdt into the SCM call.
> 
> So reading through your discussion and looking at the problem is that
> I assumed (based on the firmware files I looked at) that the hash
> segment is explicitly mentioned in the ELF header - i.e. segment 0 and 1
> are not PT_LOAD and define the part that should be passed to init_image,
> and that this may or may not be packed.
> 
> And the problem we have here is that we have the packed case, but the
> hash segment isn't described explicitly in the ELF header.


The hash segment is still explicitly described by the presence of 
QCOM_MDT_TYPE_HASH, and the external file (.b01 when the program header 
is in slot 1) contains the hash signature.  And as Shawn demonstrated, 
concatenating the ELF header in .b00 and this hash in .b01 results in 
the .mdt file.  This is the case we can (and already) optimize for, by 
passing the entire .mdt as-is into SCM if such packing is detected.

>>>>> The aforementioned patch series in qcom_mdt_bins_are_split (and certain
>>>>> firmware files from Sony phones) show that it is also possible to read
>>>>> PT_NULL headers from external files, as long as the header references a
>>>>> range that is out of bounds of the mdt file.
>>>>
>>>> It's been shown that hashes can be read from .mdt or hash segment, and
>>>> independently the hash segment type could be PT_NULL or PT_LOAD.  With
>>>> Siddharth's patch, instead of using the hash duplication in .mdt, hash
>>>> will be read from hash segment.  But again, to resolve my problem, the
>>>> assertion that hash segment type cannot be PT_LOAD has to be dropped.
>>>> And that's the only thing my patch is doing.
>>>
>>> Correct.  If I were to respin Siddharth's patchset, I'd write
>>> qcom_mdt_read_metadata as follows:
>>>
>>> 1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
>>>     and PT_LOAD);
>>> 2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
>>>     the mdt file can be used as-is for metadata;
>>> 3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
>>>     `p_offset + p_filesz` does not fit inside the .mdt, this is (a
>>>     variant of) split-firmware, and the hash needs to be loaded from an
>>>     external file and appended to the ELF header.
> 
> I would expect that PT_LOAD denotes that the segment should be loaded
> into the final firmware region and that the hash segment would be
> PT_NULL regardless of being part of the .mdt, single .mbn or a separate
> .bNN segment.


I have two mdt files here that load the hash externally, one with 
PT_LOAD and one with PT_NULL annotation (QCOM_MDT_TYPE_HASH is set). 
Both have their p_offset and/or p_offset+p_filesz well out of bounds of 
the .mdt file, but the .mdt file is of the packed variant (.b00 + .b01 
== .mdt).

This packing seems to be an optimization, making it possible to send the 
.mdt contents as-is over SCM without having to load and concatenate the 
header from a separate file.

The image produced by __qcom_mdt_load should still be reconstructed 
based on the layout specified in the program headers, of course.

>>> 4. If none of the above, this is a non-split firmware file.  Concatenate
>>>     the ELF and hash headers by reading them directly from the firmware.
>>
> 
> I'm happy with this plan and I think Sid will be as well.
> 
> I hope that we can introduce a change that fixes Shawn's reported
> problem first, so that can be backported to stable, and then add Sid's
> need for loading the additional .bNN after that (same series is fine).


I'm totally for fixing Shawn's reported issue first, before diving into 
extending mdt_loader as per Sid's patches.  In hindsight I'm not sure if 
I should be the person writing that until coming across a 
platform/firmware that needs this setup (hash in a different header, 
hash not included in the packed .mdt file).

Note that backporting needs a Fixes: tag, probably on 498b98e93900.

Shawn, do you want to send your reworded patch with the necessary 
safeguards as v2, or should I send it?

- Marijn
