Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9783D3F961E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 10:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhH0Iax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 04:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhH0Iax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 04:30:53 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8352C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 01:30:03 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C78FC20136;
        Fri, 27 Aug 2021 10:29:59 +0200 (CEST)
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
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
Date:   Fri, 27 Aug 2021 10:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827062359.GC31229@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/27/21 8:24 AM, Shawn Guo wrote:
>> [..]
>> It's not up to me to choose between a thorough or quick solution,
> 
> To be clear, Siddharth's series doesn't resolve my problem, as the
> assumption that hash segment type cannot be PT_LOAD is still there.
> I have to add the following change on top to fix my problem.
> 
> @@ -126,8 +126,7 @@ void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, cons
>                  return ERR_PTR(-EINVAL);
>   
>          for (hash_index = 1; hash_index < ehdr->e_phnum; hash_index++) {
> -               if (phdrs[hash_index].p_type != PT_LOAD &&
> -                  (phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
> +               if ((phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
>                          break;
>          }
>          if (hash_index >= ehdr->e_phnum)


Patch 3/3 allows the hash segment to be read from an external file and 
should indeed get rid of this comparison, as external file loading is 
possible with PT_NULL and required with PT_LOAD.  I'd go as far as 
moving the check into the if, next to qcom_mdt_bins_are_split:

  if (phdrs[hash_index].p_type == PT_LOAD || qcom_mdt_bins_are_split(fw))

Unfortunately it seems this patchset lost optimization for the packed 
`ehdr_size + hash_size == fw->size` case, where the hash segment is 
already available in the loaded mbt.

> That said, my patch is merely to break the assumption that hash segment
> type cannot be PT_LOAD, and it's really orthogonal to Siddharth's
> series.


It is fine - correct even - to break that assumption, but it should go 
with extra validation that we are dealing with packed mdt instead.

>> but this
>> patch seems to open up the possibility for an out-of-bounds read. The
>> assertion was placed in this function for a reason after all.
> 
> I would much appreciate it if someone helps to elaborate the reason.


PT_LOAD specifies that the segment is to be loaded externally.  The fact 
that our .mdt file is a tight pack of b00 + b01 is mere convenience, but 
is it also a given for the future?  Can we rely on this assumption to 
never change?

>>> There is a blog[1] illustrating the situation quite nicely.  Again, the
>>> only thing my WCNSS firmware differs from the illustration is that
>>> hash segment gets a PT_LOAD type.
>>
>>
>> Yes, that blog post nicely explains the format but it doesn't cover that the
>> hash is encoded in the second program header nor that it can be copied to be
>> packed tightly against the ELF header?  Maybe that only applies to newer
>> formats?
> 
> Hmm, it does cover the things.  It's been illustrated that .mdt is
> simply a concatenating of .b00 and .b01.  The .b00 includes ELF header
> and program headers, while .b01 is just hash segment.
> 
> $ cat wcnss.b00 wcnss.b01 > wcnss.b00_b01
> $ cmp wcnss.b00_b01 wcnss.mdt
> $
> 
> That said, .mdt = ELF header + program headers + hash


Ack, there's one picture halfway demonstrating the `ehdr_size + 
hash_size == fw->size` case.

>>> Skipping the check will not cause problem for firmwares we have seen,
>>> because hash segment is duplicated in .mdt file, and we are using that
>>> duplication instead of reading from .b01 file.
>>
>>
>> Can you share some more details about the firmware file you're using: size
>> and the program headers as shown by `readelf -l`?
> 
> $ readelf -l wcnss.mdt
> 
> Elf file type is EXEC (Executable file)
> Entry point 0x8b6018d4
> There are 12 program headers, starting at offset 52
> 
> Program Headers:
>    Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>    NULL           0x000000 0x00000000 0x00000000 0x001b4 0x00000     0
>    LOAD           0x001000 0x8bbe0000 0x8bbe0000 0x00c58 0x02000     0x1000
>    LOAD           0x003000 0x8b600000 0x8b600000 0x03308 0x03438 RWE 0x100000
>    LOAD           0x00afcc 0x8b604000 0x8b604000 0x00000 0x08000 RW  0x4000
>    LOAD           0x00afcc 0x8b60c000 0x8b60c000 0x0f000 0x0f000 RW  0x4
>    LOAD           0x019fcc 0x8b61b000 0x8b61b000 0x00000 0x0e000 RW  0x4
>    LOAD           0x019fcc 0x8b629000 0x8b629000 0x32eb04 0x4c2b10 RWE 0x80
>    LOAD           0x348ad0 0x8baebb80 0x8baebb80 0x00000 0x37cf8 RW  0x8
>    LOAD           0x348ad0 0x8baebb80 0x8baebb80 0x00000 0x21c44 RW  0x4
>    LOAD           0x348ad0 0x8bb30000 0x8bb30000 0x00034 0x001a8 RW  0x8
>    LOAD           0x349fcc 0x8bb31000 0x8bb31000 0xa0000 0xa0000 RW  0x1000
>    LOAD           0x3e9fcc 0x8bbd1000 0x8bbd1000 0x0ac3c 0x0ee00 RWE 0x1000
> 
>> If possible, can you also
>> validate whether QCOM_MDT_TYPE_HASH is set in phdrs[1].p_flags &
>> QCOM_MDT_TYPE_MASK (using something like GNU poke)?
> 
> It is set, otherwise the QCOM_MDT_TYPE_HASH check in
> qcom_mdt_read_metadata() will just fail.  To be clear, everything works
> fine for me, as long as I drop the check of (phdrs[1].p_type == PT_LOAD).


Thanks, this all checks out and is similar to what I'm seeing here.  It 
all comes down to the mdt packing b00 and b01 tightly together already.

>> All the files I'm able to test adhere to `/* Is the header and hash already
>> packed */`: `ehdr_size + hash_size == fw->size` (meaning the file solely
>> consists of a tightly packed ELF header and hash signature)
> 
> Yeah, my wcnss firmware is same here.  Actually, all split firmwares I
> have seen are this case.  But bear it in mind there are non-split
> firmware like a single .mbn file.  My understanding is that condition
> (ehdr_size + hash_size == fw->size) is being used to check whether it's
> a split firmware or non-split one.


Is it unreasonable to assume that more configurations besides split and 
non-split firmware might occur in the future (or are already out in the 
wild)?  These program headers allow for a variety of configurations 
which we should - in my opinion - parse and handle in a generic manner. 
  `ehdr_size + hash_size == fw->size` is convenient to have, but not 
something we should rely on.

>> but I won't be
>> surprised if there are firmware files out in the wild with different headers
>> or the hash missing, otherwise the else clause wouldn't exist.
>> This else clause causes a read starting at fw->data + phdrs[1].p_offset of
>> phdrs[1].p_filesz bytes which is almost certainly out of bounds if the
>> program header type is PT_LOAD instead of PT_NONE, otherwise it wouldn't
>> need to be loaded from a .bXX file in the first place.
> 
> So the else clause is there to handle non-split firmware, which has
> everything within fw->size.


Is it too much to ask for extra validation here, instead of always 
assuming either "split" or "non-split" firmware?  As mentioned before 
these program headers allow for a variety of configurations, which is 
confirmed by Siddharth's first patch looking for QCOM_MDT_TYPE_HASH in 
all headers instead of assuming it to reside in the second.

>>
>> For this quick solution to be valid I propose to reject PT_LOAD in the else
>> clause, and otherwise validate that phdrs[1].p_offset + hash_size <=
>> fw->size.
> 
> I'm not sure what you propose here are required for non-split firmware.


Would it help if I sent a patch based on yours, with this extra 
validation and comments + commit message explaining the cases?

Alternatively we can try re-spinning the patches from Siddharth while 
taking review comments, the possible .mdt == .b00 + . b01 packing, and 
my suggestion to handle the headers generically into account.

>> The aforementioned patch series in qcom_mdt_bins_are_split (and certain
>> firmware files from Sony phones) show that it is also possible to read
>> PT_NULL headers from external files, as long as the header references a
>> range that is out of bounds of the mdt file.
> 
> It's been shown that hashes can be read from .mdt or hash segment, and
> independently the hash segment type could be PT_NULL or PT_LOAD.  With
> Siddharth's patch, instead of using the hash duplication in .mdt, hash
> will be read from hash segment.  But again, to resolve my problem, the
> assertion that hash segment type cannot be PT_LOAD has to be dropped.
> And that's the only thing my patch is doing.

Correct.  If I were to respin Siddharth's patchset, I'd write 
qcom_mdt_read_metadata as follows:

1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
    and PT_LOAD);
2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
    the mdt file can be used as-is for metadata;
3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
    `p_offset + p_filesz` does not fit inside the .mdt, this is (a
    variant of) split-firmware, and the hash needs to be loaded from an
    external file and appended to the ELF header.
4. If none of the above, this is a non-split firmware file.  Concatenate
    the ELF and hash headers by reading them directly from the firmware.

- Marijn
