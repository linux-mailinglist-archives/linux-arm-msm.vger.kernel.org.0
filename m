Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883472B4EA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbgKPRz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733119AbgKPRz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:55:58 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA373C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:55:58 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id v20so5902428qvx.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E8dVzLq70NYkCDseFzmbLwa/urvtTDPkDdBtFGGN6D0=;
        b=M4o0yAJtuwdwVHCFv76S5VG1YfEGJmnNrFwmo84W1XR7pfDC3QibdJzFpH5AeaIykv
         JeFMb9H78yvKh5jtpNNG/SpXGgI0QOy93BAJNetXtXZuQMUhdUwfqBUFqt0vEyVb6ZB0
         4DR+OG3iowahd0NLee2pdnSouzWtomf5UY91th9YTb3ik0jqNjGGq15pL+7bwdf3/oUb
         EJ9swCP2IfQ8Ec9smzzKfsMfj20TxlfhwB3xALmxlLiiPd20ayVVJCPFfPlLIwm2MJnR
         GrrZx/ZjLa1E+yYmu/Gf3HfimSIaTOl23XtyAwyxQtQuM6lrg7EfrvpfzKzwx6bGvHda
         lHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E8dVzLq70NYkCDseFzmbLwa/urvtTDPkDdBtFGGN6D0=;
        b=BREhwXYTyM82xs+llbYMJiDdVHf98LkbNHfb4OhJbcg+co17UVUxexo7Num3oOA41e
         Qz3YO0d1/2VrPJLFllBeCrRcA620RHCSH+ivN4WmMAfBDzI3rzjEtzIlA1//2xIwdz8j
         opvMhpV92QUAbcMopUkxleZBb34SJHyoQfkDa5zR3rNAPEUSnIuFfWJinhsElI4PXSoN
         BxjamZpYkthqx8R1i+ZrcSrVCzbEuBqilvGNIZBRl3QbLsl3Wd+HoODKcj2ZGjf8qK2k
         Y48rM1SHt0VuHV7SF5QNj+RzNIjk/2VJ9kOnpUg3+ZiGCKwsQJwEjJJ7DSVhAjQEOWpe
         b8Mg==
X-Gm-Message-State: AOAM533fkc0UZMnN+MxpaExzebfS9q2bym51JVdi8Y8sivsTdffao48X
        n4OMxYflVhBK0tRHbchuNti4Ng==
X-Google-Smtp-Source: ABdhPJzaZqMKn8xovkF8P6M/eGyZjGXaTO9LqPdsEfmRScwlIiXF508R9sNXAXVwP+ldTfKElwlGOg==
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr15592022qvf.8.1605549357940;
        Mon, 16 Nov 2020 09:55:57 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id q123sm12890805qke.28.2020.11.16.09.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 09:55:57 -0800 (PST)
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To:     Rob Clark <robdclark@gmail.com>, Christoph Hellwig <hch@lst.de>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
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
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
 <20201116173346.GA24173@lst.de>
 <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <b798d954-d0b5-d968-f03c-b3fe9ffd08fc@marek.ca>
Date:   Mon, 16 Nov 2020 12:52:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/16/20 12:50 PM, Rob Clark wrote:
> On Mon, Nov 16, 2020 at 9:33 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
>>> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
>>> dma_sync_single_for_cpu() does deal in some way with the partial cache line
>>> case, although I'm not sure that means we can have a nonCoherentAtomSize=1.
>>
>> No, it doesn't.  You need to ensure ownership is managed at
>> dma_get_cache_alignment() granularity.
> 
> my guess is nonCoherentAtomSize=1 only works in the case of cache
> coherent buffers
> 

nonCoherentAtomSize doesn't apply to coherent memory (as the name 
implies), I guess qcom's driver is just wrong about having 
nonCoherentAtomSize=1.

Jordan just mentioned there is at least one conformance test for this, I 
wonder if it just doesn't test it well enough, or just doesn't test the 
non-coherent memory type?
