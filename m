Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D321763213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 11:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjGZJaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 05:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233249AbjGZJ3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 05:29:49 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3BA19AF
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-682eef7d752so1495615b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363681; x=1690968481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
        b=VrX61tolI6lx5cf13TzjBUi7Jr7lyRI0PErux25Ugwzya6Gr7la8Z5mF2+cskv3TWz
         UBVd0Z5Poj3PRTux8odPv45l8gQzAXnTFOr3Tf8UDx7d9uUEKzN37AEVIKYy6agrhmgA
         YruSiWL83SB/lZ95d/ocS5Ez1ClN1w8sLcjpu26a2KNj8aWhEC89NaIXAD4IQeJcJzfH
         uYL7oLGt6F17I0XKTtTRSbeLX7ktBDSzYJstMwVG/599hz7kBf24kzbOMqBXrGbap2ZR
         iYE22Dihl4RYEd6b6MxzHd9sXrRhtrB75dhklT8m88pkRrstmkcW4eCpJX3cURQ8vJOi
         rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363681; x=1690968481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
        b=N3/kXDHMhEcon5wfoqoJ2Q3GypOms9irT1LKfUcc2LExFB0CGmrzq1MVZMexFWLVWP
         MM8ADSzIvCDwucHxvwRfE9cJ/ioJm+SNPT7wDzLEyoiRGbwP0boy9o7Cq90o9U0lBmXy
         Kx7R7GnxtZ5t4FJSzDuxV9AiRe3CSW8d6XHV2Yv30GvenqhWINLPPdRCTulrsRRpPmJ0
         ljrlbsVV6g7G1f/R6qGDT4RQ6N+AYMscm1L3ukPL5IU4Zz5KVpP+8KnfTBQw/a4yLYjS
         ZL+6U9WhVO4SLAlDeLrEvr4IWmrS7BGPl7Klwi2JdNgkY1j1wZM40pnFvksbTm7XNML5
         SIyQ==
X-Gm-Message-State: ABy/qLZWaxRd+b22KDwh8lak5ytn7UgHc3LgQhvT6kNvSEPx5XutF5no
        g3UG1SaQuRLRNqhRwVLw3ve8HA==
X-Google-Smtp-Source: APBJJlFbGXVT1jvZWB8OqMMjwV1wWa8tPHrXXzsgQ/SF73jQ8jhDFJz/C4eSTJgkpJW81UF91auuJQ==
X-Received: by 2002:a05:6a20:3c90:b0:134:d4d3:f0a5 with SMTP id b16-20020a056a203c9000b00134d4d3f0a5mr1941746pzj.2.1690363681365;
        Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id l73-20020a633e4c000000b00563da87a52dsm1901427pga.40.2023.07.26.02.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Message-ID: <665ccd89-8434-fc45-4813-c6412ef80c10@bytedance.com>
Date:   Wed, 26 Jul 2023 17:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/47] mm: thp: dynamically allocate the thp-related
 shrinkers
Content-Language: en-US
To:     Muchun Song <muchun.song@linux.dev>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
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
        linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
        akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
        vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
        brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
        steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
        yujie.liu@intel.com, gregkh@linuxfoundation.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-20-zhengqi.arch@bytedance.com>
 <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2023/7/26 15:10, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
>> shrinkers.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 45 insertions(+), 24 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8c94b34024a2..4db5a1834d81 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags 
>> __read_mostly =
>>       (1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
>>       (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
>> -static struct shrinker deferred_split_shrinker;
>> +static struct shrinker *deferred_split_shrinker;
>> +static unsigned long deferred_split_count(struct shrinker *shrink,
>> +                      struct shrink_control *sc);
>> +static unsigned long deferred_split_scan(struct shrinker *shrink,
>> +                     struct shrink_control *sc);
>>   static atomic_t huge_zero_refcount;
>>   struct page *huge_zero_page __read_mostly;
>> @@ -229,11 +233,7 @@ static unsigned long 
>> shrink_huge_zero_page_scan(struct shrinker *shrink,
>>       return 0;
>>   }
>> -static struct shrinker huge_zero_page_shrinker = {
>> -    .count_objects = shrink_huge_zero_page_count,
>> -    .scan_objects = shrink_huge_zero_page_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -};
>> +static struct shrinker *huge_zero_page_shrinker;
> 
> Same as patch #17.

OK, will do.

> 
>>   #ifdef CONFIG_SYSFS
>>   static ssize_t enabled_show(struct kobject *kobj,
>> @@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct 
>> kobject *hugepage_kobj)
>>   }
>>   #endif /* CONFIG_SYSFS */
>> +static int thp_shrinker_init(void)
> 
> Better to declare it as __init.

Will do.

> 
>> +{
>> +    huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
>> +    if (!huge_zero_page_shrinker)
>> +        return -ENOMEM;
>> +
>> +    deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
>> +                         SHRINKER_MEMCG_AWARE |
>> +                         SHRINKER_NONSLAB,
>> +                         "thp-deferred_split");
>> +    if (!deferred_split_shrinker) {
>> +        shrinker_free_non_registered(huge_zero_page_shrinker);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    huge_zero_page_shrinker->count_objects = 
>> shrink_huge_zero_page_count;
>> +    huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
>> +    huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
>> +    shrinker_register(huge_zero_page_shrinker);
>> +
>> +    deferred_split_shrinker->count_objects = deferred_split_count;
>> +    deferred_split_shrinker->scan_objects = deferred_split_scan;
>> +    deferred_split_shrinker->seeks = DEFAULT_SEEKS;
>> +    shrinker_register(deferred_split_shrinker);
>> +
>> +    return 0;
>> +}
>> +
>> +static void thp_shrinker_exit(void)
> 
> Same as here.

Will do.

> 
>> +{
>> +    shrinker_unregister(huge_zero_page_shrinker);
>> +    shrinker_unregister(deferred_split_shrinker);
>> +}
>> +
>>   static int __init hugepage_init(void)
>>   {
>>       int err;
>> @@ -482,12 +516,9 @@ static int __init hugepage_init(void)
>>       if (err)
>>           goto err_slab;
>> -    err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
>> -    if (err)
>> -        goto err_hzp_shrinker;
>> -    err = register_shrinker(&deferred_split_shrinker, 
>> "thp-deferred_split");
>> +    err = thp_shrinker_init();
>>       if (err)
>> -        goto err_split_shrinker;
>> +        goto err_shrinker;
>>       /*
>>        * By default disable transparent hugepages on smaller systems,
>> @@ -505,10 +536,8 @@ static int __init hugepage_init(void)
>>       return 0;
>>   err_khugepaged:
>> -    unregister_shrinker(&deferred_split_shrinker);
>> -err_split_shrinker:
>> -    unregister_shrinker(&huge_zero_page_shrinker);
>> -err_hzp_shrinker:
>> +    thp_shrinker_exit();
>> +err_shrinker:
>>       khugepaged_destroy();
>>   err_slab:
>>       hugepage_exit_sysfs(hugepage_kobj);
>> @@ -2851,7 +2880,7 @@ void deferred_split_folio(struct folio *folio)
>>   #ifdef CONFIG_MEMCG
>>           if (memcg)
>>               set_shrinker_bit(memcg, folio_nid(folio),
>> -                     deferred_split_shrinker.id);
>> +                     deferred_split_shrinker->id);
>>   #endif
>>       }
>>       spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
>> @@ -2925,14 +2954,6 @@ static unsigned long deferred_split_scan(struct 
>> shrinker *shrink,
>>       return split;
>>   }
>> -static struct shrinker deferred_split_shrinker = {
>> -    .count_objects = deferred_split_count,
>> -    .scan_objects = deferred_split_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -    .flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
>> -         SHRINKER_NONSLAB,
>> -};
>> -
>>   #ifdef CONFIG_DEBUG_FS
>>   static void split_huge_pages_all(void)
>>   {
> 
