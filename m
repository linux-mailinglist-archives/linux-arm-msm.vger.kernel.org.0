Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10183FA1EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 01:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhH0Xnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 19:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhH0Xnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 19:43:49 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC9CC0613D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 16:42:59 -0700 (PDT)
Received: from [10.0.20.6] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E01F62019C;
        Sat, 28 Aug 2021 01:42:57 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>, quic_sidgup@quicinc.com
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon> <YSkNqYHLBh4td0bG@builder.lan>
 <64a684c3-74f5-f544-4902-463d31d5374b@somainline.org>
 <YSlYLBC1Q2WCDJ3D@ripper>
Message-ID: <4dabdf60-9978-8e95-73a4-70d5b8728177@somainline.org>
Date:   Sat, 28 Aug 2021 01:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSlYLBC1Q2WCDJ3D@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 8/27/21 11:25 PM, Bjorn Andersson wrote:
> On Fri 27 Aug 10:40 PDT 2021, Marijn Suijten wrote:
 > [..]
>> On 8/27/21 6:07 PM, Bjorn Andersson wrote:
>>> [..]
>>> Prior to 498b98e93900 ("soc: qcom: mdt_loader: Support loading non-split
>>> images") we'd just blindly pass the entire .mdt into the SCM call.
>>>
>>> So reading through your discussion and looking at the problem is that
>>> I assumed (based on the firmware files I looked at) that the hash
>>> segment is explicitly mentioned in the ELF header - i.e. segment 0 and 1
>>> are not PT_LOAD and define the part that should be passed to init_image,
>>> and that this may or may not be packed.
>>>
>>> And the problem we have here is that we have the packed case, but the
>>> hash segment isn't described explicitly in the ELF header.
>>
>>
>> The hash segment is still explicitly described by the presence of
>> QCOM_MDT_TYPE_HASH, and the external file (.b01 when the program header is
>> in slot 1) contains the hash signature.
> 
> But in Shawn's firmware the hashes follows the elf header in the .mdt


Apologies, I wasn't denying that the hash doesn't follow the ELF header 
in the .mdt file (in his example, ELF (.b00) + hash (.b01) == .mdt), 
simply forgot to mention it.

> and both are described in a single program header.


Only the ELF header is described in the first program header, which is 
merely 0x001b4 bytes in size.  The hash segment is described by the 
second header, which loads it from an external file.

The trailing data in the .mdt file directly after the ELF header is 
unspecified by the program headers (all other tables are PT_LOAD after 
all).  As discussed below this seems to be an "ease-of-use" feature of 
the .mdt, doubling as metadata sent directly to SCM.  Its "presence" is 
(seemingly) detected by comparing the size of the mdt file against the 
summed size of the ELF header and the segment containing QCOM_MDT_TYPE_HASH.

> Are you saying that this entry is of type QCOM_MDT_TYPE_HASH?


According to Shawn's validation (matching what I see locally), the 
second program header starting at 0x1000 has the QCOM_MDT_TYPE_HASH bit set.
>> And as Shawn demonstrated,
>> concatenating the ELF header in .b00 and this hash in .b01 results in the
>> .mdt file.  This is the case we can (and already) optimize for, by passing
>> the entire .mdt as-is into SCM if such packing is detected.
>>
> 
> In the other case, where the hash is described by a separate program
> header, we need to ensure that it's concatenated directly following the
> ELF header.


Shawn's case has the hash described in a separate program header as 
well, but it is also appended directly after the ELF header.  The 
program headers do not specify anything about this region in the .mdt 
file though.

> There are three cases here:
> 1) It's already directly following the ELF header and we should send
> ehdr_size + hash_size bytes to PAS.


Ack.

> 2) It's in the loaded file, but it's not tightly packed (this is what we
> see in the .mbn). In this case we need to pack up the two pieces before
> we send them to PAS.


Ack.

> 3) It's not part of the loaded .mdt, in which case we need to read it
> from whichever program header that happens to contain it (might not be
> .b01).


How should we detect that it is not part of the .mdt?  Will the size of 
ELF header + hash segment simply not equal the size of the .mdt file?

> In the case of #1 we should not do #3, because I've seen several cases
> where the signature in .b01 does not match the one present in the .mdt.


Oh, that really complicates matters :(.  It means that SCM will see a 
different signature than what we eventually load into memory (recall 
that the hash bit in a .mdt is not specified in any program header, and 
will hence never be copied to memory.  The "memory size" [p_memsz] of 
the ELF header is zero, and will never be copied either).  Maybe that's 
never read though.

> I do expect that passing the metadata of ELF+hash+b01 will still work,


I don't think we have an ELF+hash+b01 case.  It's always ELF+hash, but 
that hash can come from one of three locations as described in your 
summation below.

> as it would ignore the tailing garbage. Replacing ELF+hash with ELF+b01
> is different from what we've been doing all these years, so that will
> require retesting on all possible platforms...


I don't think we should be doing this replacement (Sid's patch does, 
which seems to have lost this check) and simply keep the ehdr_size + 
hash_size == fw->size predicate for direct ELF+hash reading from a .mdt.

> So I think what we're looking at it the three possible operations:
> 1) init_image(ELF+hash)
> 2) init_image(pack(ELF+hash))
> 3) init_image(pack(ELF+load(b01)))


Correct, and all three cases should be handled by the four steps I 
mentioned to implement qcom_mdt_read_metadata.

> Let's see if Sid agrees.
> 
>>>>> [..]
>>>>> Correct.  If I were to respin Siddharth's patchset, I'd write
>>>>> qcom_mdt_read_metadata as follows:
>>>>>
>>>>> 1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
>>>>>      and PT_LOAD);
>>>>> 2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
>>>>>      the mdt file can be used as-is for metadata;
>>>>> 3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
>>>>>      `p_offset + p_filesz` does not fit inside the .mdt, this is (a
>>>>>      variant of) split-firmware, and the hash needs to be loaded from an
>>>>>      external file and appended to the ELF header.
>>>
>>> I would expect that PT_LOAD denotes that the segment should be loaded
>>> into the final firmware region and that the hash segment would be
>>> PT_NULL regardless of being part of the .mdt, single .mbn or a separate
>>> .bNN segment.
>>
>>
>> I have two mdt files here that load the hash externally, one with PT_LOAD
>> and one with PT_NULL annotation (QCOM_MDT_TYPE_HASH is set). Both have their
>> p_offset and/or p_offset+p_filesz well out of bounds of the .mdt file, but
>> the .mdt file is of the packed variant (.b00 + .b01 == .mdt).
>>
> 
> Ahh, because mdt_phdr_valid() will discard them anyways as we look for
> PT_LOAD segments...


Yes.  Curious how that works for mbn files then, as those should not 
have externally loadable files and hence no PT_LOAD segments?

>> This packing seems to be an optimization, making it possible to send the
>> .mdt contents as-is over SCM without having to load and concatenate the
>> header from a separate file.
>>
> 
> Yes, that's probably the case. I was surprised to see the need for
> repacking the two segments in the .mbn case. I can only assume that
> Windows does this...


I take it the .mbns also do not have a program header defining the 
memory contents directly after the ELF header?  Is this part 
zero-initialized in the file, or is it pre-initialized with the hash 
just like .mdt?

- Marijn
