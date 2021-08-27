Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2F13F983A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 12:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244873AbhH0Krl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 06:47:41 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:46061 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhH0Krj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 06:47:39 -0400
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5BB8320136;
        Fri, 27 Aug 2021 12:46:48 +0200 (CEST)
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
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <9166e1a9-5afa-7ae8-91e5-21704bc7a40f@somainline.org>
Date:   Fri, 27 Aug 2021 12:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827095716.GD31229@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/27/21 11:57 AM, Shawn Guo wrote:
>> [..]
>> PT_LOAD specifies that the segment is to be loaded externally.  The fact
>> that our .mdt file is a tight pack of b00 + b01 is mere convenience, but is
>> it also a given for the future?  Can we rely on this assumption to never
>> change?
> 
> My patch is trying to fix an existing issue, not anything for the
> future.


We both agree that the PT_LOAD assertion here is too strict, but 
removing it altogether makes the function too lenient and allows for 
possible bugs.  To solve your issue in the simple case I have already 
suggested to add an extra bounds check.

>> [..]
>> Alternatively we can try re-spinning the patches from Siddharth while taking
>> review comments, the possible .mdt == .b00 + . b01 packing, and my
>> suggestion to handle the headers generically into account.
> 
> I would suggest this path.  It's been 8 months, so Siddharth probably lost
> the interest here.  It's reasonable that someone picks up the work.
> 
>>
>>>> The aforementioned patch series in qcom_mdt_bins_are_split (and certain
>>>> firmware files from Sony phones) show that it is also possible to read
>>>> PT_NULL headers from external files, as long as the header references a
>>>> range that is out of bounds of the mdt file.
>>>
>>> It's been shown that hashes can be read from .mdt or hash segment, and
>>> independently the hash segment type could be PT_NULL or PT_LOAD.  With
>>> Siddharth's patch, instead of using the hash duplication in .mdt, hash
>>> will be read from hash segment.  But again, to resolve my problem, the
>>> assertion that hash segment type cannot be PT_LOAD has to be dropped.
>>> And that's the only thing my patch is doing.
>>
>> Correct.  If I were to respin Siddharth's patchset, I'd write
>> qcom_mdt_read_metadata as follows:
>>
>> 1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
>>     and PT_LOAD);
>> 2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
>>     the mdt file can be used as-is for metadata;
>> 3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
>>     `p_offset + p_filesz` does not fit inside the .mdt, this is (a
>>     variant of) split-firmware, and the hash needs to be loaded from an
>>     external file and appended to the ELF header.
>> 4. If none of the above, this is a non-split firmware file.  Concatenate
>>     the ELF and hash headers by reading them directly from the firmware.
> 
> Looks good to me.  I will be happy to review patches if you pick up the
> work.


I'll try to get this going over the weekend or next week.  I don't think 
I can salvage anything from Siddharth's patchset and will likely start 
from scratch as I'm not confident "just detecting split firmware" is 
enough, but favour generic handling of the program headers as described 
above instead (for both the hash and firmware loading itself).

Will keep you posted!

- Marijn
