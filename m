Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFA54EE11D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 20:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbiCaSy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 14:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbiCaSy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 14:54:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2405A18D29B;
        Thu, 31 Mar 2022 11:53:09 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C8AB41F471DE;
        Thu, 31 Mar 2022 19:53:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648752788;
        bh=iCIU6s94N0rdvtHyebk6zzrjx7sdwliT90RWSSA/PjY=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=QxIKFkb3DId474h3e9jG30gDcVZzCZOMhdNiTb2bcxYnBfHPbWQcgfSvfNMCzkzBK
         f2BjoF5cJEiKaX6jGmrBcILxevzVOe0AkLOznm3SBBQ10jnflEnYxIVylm7a41KBOK
         FmzPJWSeI9oQ+lq7TCNyTXwXpHAdBzKzHhbJz8oQVRNHRI9a9UO+X1QIgubbt4c2rL
         47xFUVvxjWofBY9j6eoh8iJkc7M+1PRnP4fwEDT9d0DowSatnocSwn2y3NbZO07i6n
         kkOQmELV13W1rLuGhsqZlQjqxHXFaLeteQbjCcor+y0BLHmBAiK0ESPCqUnvpoLM/u
         ZyDm0/klPfErQ==
Message-ID: <b7a0347f-7106-f2af-bc63-40d8bdc2bb02@collabora.com>
Date:   Thu, 31 Mar 2022 21:53:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 10/10] drm/msm: Add a way for userspace to allocate GPU
 iova
Content-Language: en-US
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Emma Anholt <emma@anholt.net>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20220330204804.660819-1-robdclark@gmail.com>
 <20220330204804.660819-11-robdclark@gmail.com>
 <ad97096f-cc90-4f20-0f73-f33e9b275f1a@collabora.com>
In-Reply-To: <ad97096f-cc90-4f20-0f73-f33e9b275f1a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/31/22 21:52, Dmitry Osipenko wrote:
> ...
>> +/*
>> + * Get the requested iova but don't pin it.  Fails if the requested iova is
>> + * not available.  Doesn't need a put because iovas are currently valid for
>> + * the life of the object.
>> + *
>> + * Setting an iova of zero will clear the vma.
>> + */
>> +int msm_gem_set_iova(struct drm_gem_object *obj,
>> +		     struct msm_gem_address_space *aspace, uint64_t iova)
>> +{
>> +	int ret = 0;
> 
> nit: No need to initialize the ret
> 
>> +	msm_gem_lock(obj);
>> +	if (!iova) {
>> +		ret = clear_iova(obj, aspace);
>> +	} else {
>> +		struct msm_gem_vma *vma;
>> +		vma = get_vma_locked(obj, aspace, iova, iova + obj->size);
>> +		if (IS_ERR(vma)) {
>> +			ret = PTR_ERR(vma);
>> +		} else if (GEM_WARN_ON(vma->iova != iova)) {
>> +			clear_iova(obj, aspace);
>> +			ret = -ENOSPC;
> 
> The (vma->iova != iova) means that vma is already set, but to a
> different address. Is -ENOSPC really appropriate here? -EBUSY or -EINVAL
> looks more natural to me.
> 
>> +		}
>> +	}
>> +	msm_gem_unlock(obj);
>> +
>> +	return ret;
>> +}
>> +
>>  /*
>>   * Unpin a iova by updating the reference counts. The memory isn't actually
>>   * purged until something else (shrinker, mm_notifier, destroy, etc) decides
>> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
>> index 38d66e1248b1..efa2e5c19f1e 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.h
>> +++ b/drivers/gpu/drm/msm/msm_gem.h
>> @@ -38,6 +38,12 @@ struct msm_gem_address_space {
>>  
>>  	/* @faults: the number of GPU hangs associated with this address space */
>>  	int faults;
>> +
>> +	/** @va_start: lowest possible address to allocate */
>> +	uint64_t va_start;
>> +
>> +	/** @va_size: the size of the address space (in bytes) */
>> +	uint64_t va_size;
>>  };
>>  
>>  struct msm_gem_address_space *
>> @@ -144,6 +150,8 @@ struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
>>  					   struct msm_gem_address_space *aspace);
>>  int msm_gem_get_iova(struct drm_gem_object *obj,
>>  		struct msm_gem_address_space *aspace, uint64_t *iova);
>> +int msm_gem_set_iova(struct drm_gem_object *obj,
>> +		struct msm_gem_address_space *aspace, uint64_t iova);
>>  int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
>>  		struct msm_gem_address_space *aspace, uint64_t *iova,
>>  		u64 range_start, u64 range_end);
> nit: There is an odd mix of uint64_t and u64 (and alike) in the MSM code
> :) The uint64_t variant shouldn't be used by kernel code in general and
> checkpatch should want about it.

s/want/warn/
