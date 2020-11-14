Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02BB72B308F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 21:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgKNUKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 15:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKNUKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 15:10:36 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB831C0613D1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2020 12:10:36 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id a15so4588780qvk.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2020 12:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=67JIrhUexBLk+euYcRPybCUujGZ256Wpe49XxF/Od8o=;
        b=itpMD3coD5rHj6pDvemIHpnPf4BB39MY7jtbuBua/ljNHEQhqlwauoK9p3NxrAmPlH
         tM1OmSMW5cPdEWV8j5GRMzgTXEvw7OF8+koGttFDhDJAEvy/nEVWtPGba1Pfxkf6rqQA
         xoh67VBTeWFhcjmWz6O70tbT6C91O+JHHO1RwL0HN1pYW2tm265UH57Gr2xCb7jwZ/MW
         91omkj8gLtx3SEJVzCYmCQ3uR6lAX5pD6eGbrv1MVSQZBhvUKuGwljJ4D0JvsGXAMN/I
         1Ogm4wRS+XrQ8Riey+hd9ziYiYF1dr7cWHeYsI40B5poW8sQE5wNRX4wp+ma3w9yVACI
         npZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=67JIrhUexBLk+euYcRPybCUujGZ256Wpe49XxF/Od8o=;
        b=OW3j/sYZMpJ0gjFqK5w+lLpqxMUoRtfykSaIPgf4M+Rn+7KBqNXEWei+F2R5t13iRz
         wV/wSmY+NODrzVQPYvptdyvcRL/GapWHtS+Lhx/mphfAZyuK9dMU+Og8uaOPs4vAxjCQ
         txvnjYzqpIDcAgMg4YW27POhvtHCaRxZvvt6CLgFxrZE1QqYXs94snnZQkxHwH7vPdXy
         7CusADWjFgf9U+9zlTKPHHSl00DlDZ2T6/4EjZMtHwO63IyPDv4H0z1RmPpjP+/RUm9m
         DOKZVV1EPzG1F3junOKu01yhosFBPwo39pVf7X6DIik+9cCkXB0RQMkEuigPE14+TCck
         BQ/Q==
X-Gm-Message-State: AOAM530PVt2Q6nm+7cdRIyhPb3r9/MotB25gU4hyia1e5pez29mseY7A
        hrmZjnI4IFVWIh5b1npbl1JBmsCnL16CLN8zeGM=
X-Google-Smtp-Source: ABdhPJzft9OhFBtteOqZhLQn7egjWtZlERvOrzafk6j36LTCmNIxc3fnqX7jB1KikEADIQ4Qg6oRJA==
X-Received: by 2002:ad4:4bb2:: with SMTP id i18mr8530477qvw.52.1605384635788;
        Sat, 14 Nov 2020 12:10:35 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id k31sm8923935qtd.40.2020.11.14.12.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2020 12:10:35 -0800 (PST)
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To:     Rob Clark <robdclark@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca> <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
Date:   Sat, 14 Nov 2020 15:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/14/20 2:39 PM, Rob Clark wrote:
> On Sat, Nov 14, 2020 at 10:58 AM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> On 11/14/20 1:46 PM, Rob Clark wrote:
>>> On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
>>>>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
>>>>> +             size_t range_start, size_t range_end)
>>>>> +{
>>>>> +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
>>>>> +     struct device *dev = msm_obj->base.dev->dev;
>>>>> +
>>>>> +     /* exit early if get_pages() hasn't been called yet */
>>>>> +     if (!msm_obj->pages)
>>>>> +             return;
>>>>> +
>>>>> +     /* TODO: sync only the specified range */
>>>>> +
>>>>> +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
>>>>> +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
>>>>> +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
>>>>> +     }
>>>>> +
>>>>> +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
>>>>> +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
>>>>> +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
>>>>> +     }
>>>>
>>>> Splitting this helper from the only caller is rather strange, epecially
>>>> with the two unused arguments.  And I think the way this is specified
>>>> to take a range, but ignoring it is actively dangerous.  User space will
>>>> rely on it syncing everything sooner or later and then you are stuck.
>>>> So just define a sync all primitive for now, and if you really need a
>>>> range sync and have actually implemented it add a new ioctl for that.
>>>
>>> We do already have a split of ioctl "layer" which enforces valid ioctl
>>> params, etc, and gem (or other) module code which is called by the
>>> ioctl func.  So I think it is fine to keep this split here.  (Also, I
>>> think at some point there will be a uring type of ioctl alternative
>>> which would re-use the same gem func.)
>>>
>>> But I do agree that the range should be respected or added later..
>>> drm_ioctl() dispatch is well prepared for extending ioctls.
>>>
>>> And I assume there should be some validation that the range is aligned
>>> to cache-line?  Or can we flush a partial cache line?
>>>
>>
>> The range is intended to be "sync at least this range", so that
>> userspace doesn't have to worry about details like that.
>>
> 
> I don't think userspace can *not* worry about details like that.
> Consider a case where the cpu and gpu are simultaneously accessing
> different parts of a buffer (for ex, sub-allocation).  There needs to
> be cache-line separation between the two.
> 

Right.. and it also seems like we can't get away with just 
flushing/invalidating the whole thing.

qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like 
dma_sync_single_for_cpu() does deal in some way with the partial cache 
line case, although I'm not sure that means we can have a 
nonCoherentAtomSize=1.

> BR,
> -R
> 
