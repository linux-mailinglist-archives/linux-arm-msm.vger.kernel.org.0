Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256F6773DA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 18:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjHHQUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 12:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjHHQSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 12:18:50 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C9A86B0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:48:41 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a7a60b10d0so175020b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691509720; x=1692114520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=if5VWB18nVWwRp6UCb6aPEiH47g9I/o9CGJnGCggs6I=;
        b=JSSm4JO2bXZJohxLybsbhO5SZW8N9mUwrNtqhGrl0+lUvld6WJ1BM07dY/UZZj3Y6K
         BY2JDSvFXEFuOVyKr5gRC+RtYc4kbL/ftxXaYKKdPir+xyR2wks3EdRzAtO/Z/aHEYOl
         LRNFq0sEvkquwD0cSXzA4fQ2/UYOYRYhChPyDoLlWITxXX9NlXpBnNv9q8BE7qB5jm2v
         4Erew1AC+cMXHydJrWohS//UEuA7DX6Fr0za6rD3ugxOFwsd6jNRU1yFoY/8SzDWk81F
         WvtcLMukkJmOJdPs2/CE6sd/fNzoIMElHP9HV+Y2p6gZJt682yvcHR2Fdsw/Aoqg00lr
         Ddhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509720; x=1692114520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=if5VWB18nVWwRp6UCb6aPEiH47g9I/o9CGJnGCggs6I=;
        b=RtyzRESBMeFyTB/KoqDQZq4BWCSjmur9TXFlUXtYDUt9vJ41tekX9i1ZAUDgY+M42K
         wyyo25SNyAW+hGM/kK/N2mxxm7s1HFGGY4d9p+YjnKZUw0OHzTqPJoWuGW84Uy3eFcef
         rgLidgHFsbGi2fK4yGltS7FSeR0uirWGtt7kGtfmJD9YrI5AX+m5Yseeuqp3y7bmyMss
         LjGyoh+E4bcWs1pxmqy2urL5CmM0LbP54d2sn3McwwPoP4TKqSa8sLrAZJsoKsmMMoq+
         rNvgXslMAFBdMeqpCeoTpOanxshYmXmdJLp5QrNmLSJWNEY5P485PYHX4BkrzpJyZVZF
         0UYQ==
X-Gm-Message-State: AOJu0YwjlBXhi+vpA1V43FKAosdm7z7wnrhCKaly6DcFV80Pq0ZYK+GF
        MW7zbm2yzGtrpXGzguT1tB64JORFPFVhCTszNno=
X-Google-Smtp-Source: AGHT+IGrIAD/R1XG8iT7hZdid4m31qfruz9y309af9L0+sAELwy0z1r+YzLKvbiH8nyqlY1j6mrYWw==
X-Received: by 2002:a92:2802:0:b0:349:7518:4877 with SMTP id l2-20020a922802000000b0034975184877mr3215795ilf.0.1691479385787;
        Tue, 08 Aug 2023 00:23:05 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id s15-20020a63af4f000000b00564ca424f79sm4948391pgo.48.2023.08.08.00.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:23:05 -0700 (PDT)
Message-ID: <0fdb926c-0d61-d81f-1a52-4ef634b51804@bytedance.com>
Date:   Tue, 8 Aug 2023 15:22:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 45/48] mm: shrinker: make global slab shrink lockless
Content-Language: en-US
To:     Dave Chinner <david@fromorbit.com>
Cc:     akpm@linux-foundation.org, tkhai@ya.ru, vbabka@suse.cz,
        roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
        paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
        cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
        gregkh@linuxfoundation.org, muchun.song@linux.dev,
        simon.horman@corigine.com, dlemoal@kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-erofs@lists.ozlabs.org,
        linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
        linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
        rcu@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dm-devel@redhat.com, linux-raid@vger.kernel.org,
        linux-bcache@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-46-zhengqi.arch@bytedance.com>
 <ZNGnSbiPN0lDLpSW@dread.disaster.area>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZNGnSbiPN0lDLpSW@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

On 2023/8/8 10:24, Dave Chinner wrote:
> On Mon, Aug 07, 2023 at 07:09:33PM +0800, Qi Zheng wrote:
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index eb342994675a..f06225f18531 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -4,6 +4,8 @@
>>   
>>   #include <linux/atomic.h>
>>   #include <linux/types.h>
>> +#include <linux/refcount.h>
>> +#include <linux/completion.h>
>>   
>>   #define SHRINKER_UNIT_BITS	BITS_PER_LONG
>>   
>> @@ -87,6 +89,10 @@ struct shrinker {
>>   	int seeks;	/* seeks to recreate an obj */
>>   	unsigned flags;
>>   
>> +	refcount_t refcount;
>> +	struct completion done;
>> +	struct rcu_head rcu;
> 
> Documentation, please. What does the refcount protect, what does the
> completion provide, etc.

How about the following:

	/*
	 * reference count of this shrinker, holding this can guarantee
	 * that the shrinker will not be released.
	 */
	refcount_t refcount;
	/*
	 * Wait for shrinker::refcount to reach 0, that is, no shrinker
	 * is running or will run again.
	 */
	struct completion done;

> 
>> +
>>   	void *private_data;
>>   
>>   	/* These are for internal use */
>> @@ -120,6 +126,17 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>>   void shrinker_register(struct shrinker *shrinker);
>>   void shrinker_free(struct shrinker *shrinker);
>>   
>> +static inline bool shrinker_try_get(struct shrinker *shrinker)
>> +{
>> +	return refcount_inc_not_zero(&shrinker->refcount);
>> +}
>> +
>> +static inline void shrinker_put(struct shrinker *shrinker)
>> +{
>> +	if (refcount_dec_and_test(&shrinker->refcount))
>> +		complete(&shrinker->done);
>> +}
>> +
>>   #ifdef CONFIG_SHRINKER_DEBUG
>>   extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>>   						  const char *fmt, ...);
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index 1911c06b8af5..d318f5621862 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -2,6 +2,7 @@
>>   #include <linux/memcontrol.h>
>>   #include <linux/rwsem.h>
>>   #include <linux/shrinker.h>
>> +#include <linux/rculist.h>
>>   #include <trace/events/vmscan.h>
>>   
>>   #include "internal.h"
>> @@ -577,33 +578,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>>   	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>>   		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>>   
>> -	if (!down_read_trylock(&shrinker_rwsem))
>> -		goto out;
>> -
>> -	list_for_each_entry(shrinker, &shrinker_list, list) {
>> +	rcu_read_lock();
>> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>>   		struct shrink_control sc = {
>>   			.gfp_mask = gfp_mask,
>>   			.nid = nid,
>>   			.memcg = memcg,
>>   		};
>>   
>> +		if (!shrinker_try_get(shrinker))
>> +			continue;
>> +
>> +		/*
>> +		 * We can safely unlock the RCU lock here since we already
>> +		 * hold the refcount of the shrinker.
>> +		 */
>> +		rcu_read_unlock();
>> +
>>   		ret = do_shrink_slab(&sc, shrinker, priority);
>>   		if (ret == SHRINK_EMPTY)
>>   			ret = 0;
>>   		freed += ret;
>> +
>>   		/*
>> -		 * Bail out if someone want to register a new shrinker to
>> -		 * prevent the registration from being stalled for long periods
>> -		 * by parallel ongoing shrinking.
>> +		 * This shrinker may be deleted from shrinker_list and freed
>> +		 * after the shrinker_put() below, but this shrinker is still
>> +		 * used for the next traversal. So it is necessary to hold the
>> +		 * RCU lock first to prevent this shrinker from being freed,
>> +		 * which also ensures that the next shrinker that is traversed
>> +		 * will not be freed (even if it is deleted from shrinker_list
>> +		 * at the same time).
>>   		 */
> 
> This needs to be moved to the head of the function, and document
> the whole list walk, get, put and completion parts of the algorithm
> that make it safe. There's more to this than "we hold a reference
> count", especially the tricky "we might see the shrinker before it
> is fully initialised" case....

How about moving these documents to before list_for_each_entry_rcu(),
and then go to the head of shrink_slab_memcg() to explain the memcg
slab shrink case.

> 
> 
> .....
>>   void shrinker_free(struct shrinker *shrinker)
>>   {
>>   	struct dentry *debugfs_entry = NULL;
>> @@ -686,9 +712,18 @@ void shrinker_free(struct shrinker *shrinker)
>>   	if (!shrinker)
>>   		return;
>>   
>> +	if (shrinker->flags & SHRINKER_REGISTERED) {
>> +		shrinker_put(shrinker);
>> +		wait_for_completion(&shrinker->done);
>> +	}
> 
> Needs a comment explaining why we need to wait here...

/*
  * Wait for all lookups of the shrinker to complete, after that, no
  * shrinker is running or will run again, then we can safely free
  * the structure where the shrinker is located, such as super_block
  * etc.
  */

>> +
>>   	down_write(&shrinker_rwsem);
>>   	if (shrinker->flags & SHRINKER_REGISTERED) {
>> -		list_del(&shrinker->list);
>> +		/*
>> +		 * Lookups on the shrinker are over and will fail in the future,
>> +		 * so we can now remove it from the lists and free it.
>> +		 */
> 
> .... rather than here after the wait has been done and provided the
> guarantee that no shrinker is running or will run again...

With the above comment, how about simplifying the comment here to the
following:

/*
  * Now we can safely remove it from the shrinker_list and free it.
  */

Thanks,
Qi

> 
> -Dave.
