Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89A2327BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 11:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhCAKXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 05:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbhCAKXC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 05:23:02 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4C7C06121F
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 02:22:17 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u14so15508962wri.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 02:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n67NnnL0Ol15mU1Rsw9KIVhUj530csvN7yeEP5UJgNs=;
        b=riBdydpLJl/cY0BbxUTkDqQixZM6WyYXjDSaHFJmKP7rnk9qlBs1WtTjW3Z/TgL0LD
         Ck3sloHTW/MdgNs+1MK0y35HKtGSDAKmFbz/eCmhj2Xatt8xGGAipebOHfh2vtgTOG6F
         vwbnnXP2BfIwkxnuiO6VWHjSZKNXD889CatTfH9FSlHb8zqCMl/CQLSUe2CzdpHiOIuC
         gzz9O1wjR0j0gonKYELx2EhSko5J6zEiDruF/lBOgAVpJuXfbYAF0PHfo1+1+39zaIuU
         eF2ASSu1kTr1sfH3OiU5TDYXOQmv+cjE25gwMTllAUyYJzFYDAurTO93gRhOKyd2wbhz
         jq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n67NnnL0Ol15mU1Rsw9KIVhUj530csvN7yeEP5UJgNs=;
        b=FPEtXaOdaRE+xNiSaWnn1nxFGyKAeyZ8V6a0VPjpb7lgpemNd6CGpwqXT455Ez9JLM
         U8pE0H8j20fMpA5ofbiHmmsPD84LNJNuYZ8urMkMulTlgBa4bZI4yu2Dl0he7Vd9cV/2
         H6bq2FYdBjYea0V3N/AurhhBgolaIF5Klo0Ll2Qr3MMAhq4Uc4+H83be/I7wb9No/B0A
         g0pJnyuox1XE3e34AmwD68YLHSDQp0owiFOsPt9iMBD39GhceVprS4+57AgpucsFG/SH
         uxxcOGofYYIec2YVnkG9nW9A+bf7RUpCy1k6fyUJ6WD8r/ZxYOCNXTZNPNT8nXhijOPJ
         XEVA==
X-Gm-Message-State: AOAM531KZqORxv84OEqmtyQjK/O6krJjuN/pZAczjW1yySf8YI+tOdV4
        jitDm66Myw4AC+X3nnJpY3XIYg==
X-Google-Smtp-Source: ABdhPJygXANWXMuz6ByUsQNjFLNc/MDZAmooj4TUgPHyytUoAGgfD0PKf93m4df6tqTx/kj5YsuGsQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr16005949wrq.69.1614594136625;
        Mon, 01 Mar 2021 02:22:16 -0800 (PST)
Received: from [192.168.0.4] (hst-221-20.medicom.bg. [84.238.221.20])
        by smtp.googlemail.com with ESMTPSA id l22sm25362695wrb.4.2021.03.01.02.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 02:22:16 -0800 (PST)
Subject: Re: [PATCH] media: venus: use contig vb2 ops
To:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
References: <20201214125703.866998-1-acourbot@chromium.org>
 <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org>
 <CAAFQd5AQ8VHiRYkzkd5ZJBPT5_5WO0tyQrwqBEfnMVKYiTugTA@mail.gmail.com>
 <b5d35bbd-ae50-7a09-9edf-ca23d1a4b168@linaro.org>
 <bc42c936d7a67609b9dc4212b5a34b0d761676ed.camel@ndufresne.ca>
 <CAAFQd5BQv2vu_FSxJjVZLpgcuFi1WHVem_O-0x-vkG1KZJi0eA@mail.gmail.com>
 <CAAFQd5BAT2Xe+_swAe+hMqm_cQVbWJUzkH3dS+8-QHknV=KTjw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b62575fd-7aac-57fe-b6f7-cf1e94f909f2@linaro.org>
Date:   Mon, 1 Mar 2021 12:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BAT2Xe+_swAe+hMqm_cQVbWJUzkH3dS+8-QHknV=KTjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/1/21 11:23 AM, Tomasz Figa wrote:
> Hi Alex, Stanimir,
> 
> On Wed, Dec 16, 2020 at 12:15 PM Tomasz Figa <tfiga@chromium.org> wrote:
>>
>> On Wed, Dec 16, 2020 at 4:21 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>>
>>> Le mardi 15 décembre 2020 à 15:54 +0200, Stanimir Varbanov a écrit :
>>>> Hi Tomasz,
>>>>
>>>> On 12/15/20 1:47 PM, Tomasz Figa wrote:
>>>>> On Tue, Dec 15, 2020 at 8:16 PM Stanimir Varbanov
>>>>> <stanimir.varbanov@linaro.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Cc: Robin
>>>>>>
>>>>>> On 12/14/20 2:57 PM, Alexandre Courbot wrote:
>>>>>>> This driver uses the SG vb2 ops, but effectively only ever accesses the
>>>>>>> first entry of the SG table, indicating that it expects a flat layout.
>>>>>>> Switch it to use the contiguous ops to make sure this expected invariant
>>>>>>
>>>>>> Under what circumstances the sg table will has nents > 1? I came down to
>>>>>> [1] but not sure I got it right.
>>>>>>
>>>>>> I'm afraid that for systems with low amount of system memory and when
>>>>>> the memory become fragmented, the driver will not work. That's why I
>>>>>> started with sg allocator.
>>>>>
>>>>> It is exactly the opposite. The vb2-dma-contig allocator is "contig"
>>>>> in terms of the DMA (aka IOVA) address space. In other words, it
>>>>> guarantees that having one DMA address and length fully describes the
>>>>
>>>> Ahh, I missed that part. Looks like I misunderstood videobu2 contig
>>>> allocator.
>>>
>>> I'm learning everyday too, but I'm surprised I don't see a call to
>>> vb2_dma_contig_set_max_seg_size() in this driver (I could also just have missed
>>> a patch when overlooking this thread) ?
>>>
>>> The reason I'm asking, doc says it should be called by driver supporting IOMMU,
>>> which seems to be the case for such drivers (MFC, exynos4-is, exynos-gsc, mtk-
>>> mdp, s5p-g2d, hantro, rkvdec, zoran, ti-vpe, ..). I posting it, worst case it's
>>> all covered and we are good, otherwise perhaps a downstream patch didn't make it
>>> ?
>>>
>>> /**
>>>  * vb2_dma_contig_set_max_seg_size() - configure DMA max segment size
>>>  * @dev:        device for configuring DMA parameters
>>>  * @size:       size of DMA max segment size to set
>>>  *
>>>  * To allow mapping the scatter-list into a single chunk in the DMA
>>>  * address space, the device is required to have the DMA max segment
>>>  * size parameter set to a value larger than the buffer size. Otherwise,
>>>  * the DMA-mapping subsystem will split the mapping into max segment
>>>  * size chunks. This function sets the DMA max segment size
>>>  * parameter to let DMA-mapping map a buffer as a single chunk in DMA
>>>  * address space.
>>>  * This code assumes that the DMA-mapping subsystem will merge all
>>>  * scatterlist segments if this is really possible (for example when
>>>  * an IOMMU is available and enabled).
>>>  * Ideally, this parameter should be set by the generic bus code, but it
>>>  * is left with the default 64KiB value due to historical litmiations in
>>>  * other subsystems (like limited USB host drivers) and there no good
>>>  * place to set it to the proper value.
>>>  * This function should be called from the drivers, which are known to
>>>  * operate on platforms with IOMMU and provide access to shared buffers
>>>  * (either USERPTR or DMABUF). This should be done before initializing
>>>  * videobuf2 queue.
>>>  */
>>
>> It does call dma_set_max_seg_size() directly:
>> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/core.c#L230
>>
>> Actually, why do we even need a vb2 helper for this?
>>
> 
> What's the plan for this patch?

It will be part of v5.12.

-- 
regards,
Stan
