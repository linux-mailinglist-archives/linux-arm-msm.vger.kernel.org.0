Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C945284C6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgJFNVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 09:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFNVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 09:21:09 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7D9C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 06:21:08 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id s7so10641440qkh.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YRYuE1oST5rCsSRo3ftJBgKrW6I4XszeRlUEeyGTNfA=;
        b=BFD//pwAX/64KPt0LEII7XnZhATo+5u4Ci1QUGZnXAvcyoZpf216nBIukB8S0lNR+o
         /SBnsKFNycdO4FaqhrrvOl8q9yUCUD0kMtxCFrm+T3BuOtGJqNoq/vuatu/yUwFaui3W
         wG/q9rVWqGvQF3DH1sF8weJvvvE2/FsOJioQK368BV9SL2poAmn8GeN+if4sevucB6tf
         8BV+2/e4V/R+9zg6ETBTYxp+Q6woapII4/lMg/2r2Ql9+NA7asVIWxgARtsMmyYoMq2K
         YKB5J7l4MgFdsyryEbJBhC2DmC2IwuvI3od1/Cu2zgJfsaaVHr58x1zSeFV0fZQiWrdf
         Hg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YRYuE1oST5rCsSRo3ftJBgKrW6I4XszeRlUEeyGTNfA=;
        b=eVdvmSZxhmMN8K/Ec4xlNN69YV4TctykbicCKG5EhzKCFhVH/NnAn9e7KqNlf3HMZO
         wuLzAlJCQXGjLP3mJZzH7PZF++g2hToieCGnmi7ZIELy51ceNJU1JO7OSzqy3xKIGWOH
         4pylbncXhPrhyV6FQRx79OT3jNeaSpTHyaB071BV6ZzuPoNtDRYzQBHuBa7g56nnShnL
         JSenXJYEecJNq7iP9tw/1P8el4wN4QKtZK2Moih2RTp7fjGeqr9I9JuNpLn/88eFkDBf
         KcFeRrSYtcM/IKyR7URP+KdDrE0kb2nq63cR4IG/6xhxqLGZ7msycxbDxhZHmZcuwyqI
         MigQ==
X-Gm-Message-State: AOAM531IfP0fG1XGs3VSAejJvRFP4T0qER0fAFVpnmVjVmPxiBPBSW+T
        GRR78huVIvft3CGaPpO0P0VtbQ==
X-Google-Smtp-Source: ABdhPJw4Z7YWS8t/L1IK8utu6wKe+vRmf2v1MdzI4qau8wJptX2TFHJ6aQoGZURrxgM6eCoWFpwqPw==
X-Received: by 2002:a05:620a:1287:: with SMTP id w7mr2490783qki.335.1601990468080;
        Tue, 06 Oct 2020 06:21:08 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 192sm2477887qkm.110.2020.10.06.06.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 06:21:07 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
To:     Christoph Hellwig <hch@infradead.org>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
Date:   Tue, 6 Oct 2020 09:19:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201006072306.GA12834@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/6/20 3:23 AM, Christoph Hellwig wrote:
> On Mon, Oct 05, 2020 at 10:35:43AM -0400, Jonathan Marek wrote:
>> The cache synchronization doesn't have anything to do with IOMMU (for
>> example: cache synchronization would be useful in cases where drm/msm
>> doesn't use IOMMU).
> 
> It has to do with doing DMA.  And we have two frameworks for doing DMA:
> either the DMA API which is for general driver use, and which as part of
> the design includes cache maintainance hidden behind the concept of
> ownership transfers.  And we have the much more bare bones IOMMU API.
> 
> If people want to use the "raw" IOMMU API with not cache coherent
> devices we'll need a cache maintainance API that goes along with it.
> It could either be formally part of the IOMMU API or be separate.
> 
>> What is needed is to call arch_sync_dma_for_{cpu,device} (which is what I
>> went with initially, but then decided to re-use drm/msm's
>> sync_for_{cpu,device}). But you are also saying those functions aren't for
>> driver use, and I doubt IOMMU maintainers will want to add wrappers for
>> these functions just to satisfy this "not for driver use" requirement.
> 
> arch_sync_dma_for_{cpu,device} are low-level helpers (and not very
> great ones at that).  The definitively should not be used by drivers.
> They would be very useful buildblocks for a IOMMU cache maintainance
> API.
> 
> Of course the best outcome would be if we could find a way for the MSM
> drm driver to just use DMA API and not deal with the lower level
> abstractions.  Do you remember why the driver went for use of the IOMMU
> API?
> 

One example why drm/msm can't use DMA API is multiple page table support 
(that is landing in 5.10), which is something that definitely couldn't 
work with DMA API.

Another one is being able to choose the address for mappings, which 
AFAIK DMA API can't do (somewhat related to this: qcom hardware often 
has ranges of allowed addresses, which the dma_mask mechanism fails to 
represent, what I see is drivers using dma_mask as a "maximum address", 
and since addresses are allocated from the top it generally works)

But let us imagine drm/msm switches to using DMA API. a2xx GPUs have 
their own very basic MMU (implemented by msm_gpummu.c), that will need 
to implement dma_map_ops, which will have to call 
arch_sync_dma_for_{cpu,device}. So drm/msm still needs to call 
arch_sync_dma_for_{cpu,device} in that scenario.







