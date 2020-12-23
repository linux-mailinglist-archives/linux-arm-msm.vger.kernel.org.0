Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E112E1CD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 14:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgLWNpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 08:45:33 -0500
Received: from foss.arm.com ([217.140.110.172]:50336 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728251AbgLWNpd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 08:45:33 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923461042;
        Wed, 23 Dec 2020 05:44:46 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75E33F66E;
        Wed, 23 Dec 2020 05:44:44 -0800 (PST)
Subject: Re: [PATCH v2 1/7] iommu/io-pgtable: Introduce dynamic io-pgtable fmt
 registration
To:     isaacm@codeaurora.org
Cc:     kernel-team@android.com, will@kernel.org, pdaly@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, pratikp@codeaurora.org
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-2-git-send-email-isaacm@codeaurora.org>
 <4f388512-c3df-e9fc-ebd4-624ab36a6858@arm.com>
 <8b48b371811a170053e2ca810ab63abf@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <64657a85-e2d5-e13f-d6b5-9d68c4142b80@arm.com>
Date:   Wed, 23 Dec 2020 13:44:43 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8b48b371811a170053e2ca810ab63abf@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-22 19:54, isaacm@codeaurora.org wrote:
> On 2020-12-22 11:27, Robin Murphy wrote:
>> On 2020-12-22 00:44, Isaac J. Manjarres wrote:
>>> The io-pgtable code constructs an array of init functions for each
>>> page table format at compile time. This is not ideal, as this
>>> increases the footprint of the io-pgtable code, as well as prevents
>>> io-pgtable formats from being built as kernel modules.
>>>
>>> In preparation for modularizing the io-pgtable formats, switch to a
>>> dynamic registration scheme, where each io-pgtable format can register
>>> their init functions with the io-pgtable code at boot or module
>>> insertion time.
>>>
>>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>>> ---
>>>   drivers/iommu/io-pgtable-arm-v7s.c | 34 +++++++++++++-
>>>   drivers/iommu/io-pgtable-arm.c     | 90 
>>> ++++++++++++++++++++++++++----------
>>>   drivers/iommu/io-pgtable.c         | 94 
>>> ++++++++++++++++++++++++++++++++------
>>>   include/linux/io-pgtable.h         | 51 +++++++++++++--------
>>>   4 files changed, 209 insertions(+), 60 deletions(-)
>>>
>>> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c 
>>> b/drivers/iommu/io-pgtable-arm-v7s.c
>>> index 1d92ac9..89aad2f 100644
>>> --- a/drivers/iommu/io-pgtable-arm-v7s.c
>>> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
>>> @@ -28,6 +28,7 @@
>>>   #include <linux/iommu.h>
>>>   #include <linux/kernel.h>
>>>   #include <linux/kmemleak.h>
>>> +#include <linux/module.h>
>>>   #include <linux/sizes.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/spinlock.h>
>>> @@ -835,7 +836,8 @@ static struct io_pgtable 
>>> *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>>>       return NULL;
>>>   }
>>>   -struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
>>> +static struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
>>> +    .fmt    = ARM_V7S,
>>>       .alloc    = arm_v7s_alloc_pgtable,
>>>       .free    = arm_v7s_free_pgtable,
>>>   };
>>> @@ -982,5 +984,33 @@ static int __init arm_v7s_do_selftests(void)
>>>       pr_info("self test ok\n");
>>>       return 0;
>>>   }
>>> -subsys_initcall(arm_v7s_do_selftests);
>>> +#else
>>> +static int arm_v7s_do_selftests(void)
>>> +{
>>> +    return 0;
>>> +}
>>>   #endif
>>> +
>>> +static int __init arm_v7s_init(void)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = io_pgtable_ops_register(&io_pgtable_arm_v7s_init_fns);
>>> +    if (ret < 0) {
>>> +        pr_err("Failed to register ARM V7S format\n");
>>
>> Super-nit: I think "v7s" should probably be lowercase there. Also
>> general consistency WRT to showing the error code and whether or not
>> to abbreviate "format" would be nice.
>>
> Ok, I can fix this accordingly.
> 
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = arm_v7s_do_selftests();
>>> +    if (ret < 0)
>>> +        io_pgtable_ops_unregister(&io_pgtable_arm_v7s_init_fns);
>>> +
>>> +    return ret;
>>> +}
>>> +core_initcall(arm_v7s_init);
>>> +
>>> +static void __exit arm_v7s_exit(void)
>>> +{
>>> +    io_pgtable_ops_unregister(&io_pgtable_arm_v7s_init_fns);
>>> +}
>>> +module_exit(arm_v7s_exit);
>>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>>> b/drivers/iommu/io-pgtable-arm.c
>>> index 87def58..ff0ea2f 100644
>>> --- a/drivers/iommu/io-pgtable-arm.c
>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>> @@ -13,6 +13,7 @@
>>>   #include <linux/bitops.h>
>>>   #include <linux/io-pgtable.h>
>>>   #include <linux/kernel.h>
>>> +#include <linux/module.h>
>>>   #include <linux/sizes.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/types.h>
>>> @@ -1043,29 +1044,32 @@ arm_mali_lpae_alloc_pgtable(struct 
>>> io_pgtable_cfg *cfg, void *cookie)
>>>       return NULL;
>>>   }
>>>   -struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
>>> -    .alloc    = arm_64_lpae_alloc_pgtable_s1,
>>> -    .free    = arm_lpae_free_pgtable,
>>> -};
>>> -
>>> -struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
>>> -    .alloc    = arm_64_lpae_alloc_pgtable_s2,
>>> -    .free    = arm_lpae_free_pgtable,
>>> -};
>>> -
>>> -struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns = {
>>> -    .alloc    = arm_32_lpae_alloc_pgtable_s1,
>>> -    .free    = arm_lpae_free_pgtable,
>>> -};
>>> -
>>> -struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns = {
>>> -    .alloc    = arm_32_lpae_alloc_pgtable_s2,
>>> -    .free    = arm_lpae_free_pgtable,
>>> -};
>>> -
>>> -struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
>>> -    .alloc    = arm_mali_lpae_alloc_pgtable,
>>> -    .free    = arm_lpae_free_pgtable,
>>> +static struct io_pgtable_init_fns io_pgtable_arm_lpae_init_fns[] = {
>>> +    {
>>> +        .fmt    = ARM_32_LPAE_S1,
>>> +        .alloc    = arm_32_lpae_alloc_pgtable_s1,
>>> +        .free    = arm_lpae_free_pgtable,
>>> +    },
>>> +    {
>>> +        .fmt    = ARM_32_LPAE_S2,
>>> +        .alloc    = arm_32_lpae_alloc_pgtable_s2,
>>> +        .free    = arm_lpae_free_pgtable,
>>> +    },
>>> +    {
>>> +        .fmt    = ARM_64_LPAE_S1,
>>> +        .alloc    = arm_64_lpae_alloc_pgtable_s1,
>>> +        .free    = arm_lpae_free_pgtable,
>>> +    },
>>> +    {
>>> +        .fmt    = ARM_64_LPAE_S2,
>>> +        .alloc    = arm_64_lpae_alloc_pgtable_s2,
>>> +        .free    = arm_lpae_free_pgtable,
>>> +    },
>>> +    {
>>> +        .fmt    = ARM_MALI_LPAE,
>>> +        .alloc    = arm_mali_lpae_alloc_pgtable,
>>> +        .free    = arm_lpae_free_pgtable,
>>> +    },
>>>   };
>>>     #ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
>>> @@ -1250,5 +1254,43 @@ static int __init arm_lpae_do_selftests(void)
>>>       pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
>>>       return fail ? -EFAULT : 0;
>>>   }
>>> -subsys_initcall(arm_lpae_do_selftests);
>>> +#else
>>> +static int __init arm_lpae_do_selftests(void)
>>> +{
>>> +    return 0;
>>> +}
>>>   #endif
>>> +
>>> +static int __init arm_lpae_init(void)
>>> +{
>>> +    int ret, i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(io_pgtable_arm_lpae_init_fns); i++) {
>>> +        ret = 
>>> io_pgtable_ops_register(&io_pgtable_arm_lpae_init_fns[i]);
>>> +        if (ret < 0) {
>>> +            pr_err("Failed to register ARM LPAE fmt: %d\n");
>>> +            goto err_io_pgtable_register;
>>> +        }
>>> +    }
>>> +
>>> +    ret = arm_lpae_do_selftests();
>>> +    if (ret < 0)
>>> +        goto err_io_pgtable_register;
>>> +
>>> +    return 0;
>>> +
>>> +err_io_pgtable_register:
>>> +    for (i = i - 1; i >= 0; i--)
>>
>> Personally I find "while (i--)" a bit clearer for this kind of
>> unwinding, but maybe post-decrement isn't to everyone's taste.
>>
> I'm not particularly attached to the current approach, so a while loop
> is okay with me :).
> 
>>> +        io_pgtable_ops_unregister(&io_pgtable_arm_lpae_init_fns[i]);
>>> +    return ret;
>>> +}
>>> +core_initcall(arm_lpae_init);
>>> +
>>> +static void __exit arm_lpae_exit(void)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(io_pgtable_arm_lpae_init_fns); i++)
>>> +        io_pgtable_ops_unregister(&io_pgtable_arm_lpae_init_fns[i]);
>>> +}
>>> +module_exit(arm_lpae_exit);
>>> diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
>>> index 94394c8..2c6eb2e 100644
>>> --- a/drivers/iommu/io-pgtable.c
>>> +++ b/drivers/iommu/io-pgtable.c
>>> @@ -10,33 +10,45 @@
>>>   #include <linux/bug.h>
>>>   #include <linux/io-pgtable.h>
>>>   #include <linux/kernel.h>
>>> +#include <linux/rwlock.h>
>>> +#include <linux/slab.h>
>>>   #include <linux/types.h>
>>>   -static const struct io_pgtable_init_fns *
>>> -io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
>>> -#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE
>>> -    [ARM_32_LPAE_S1] = &io_pgtable_arm_32_lpae_s1_init_fns,
>>> -    [ARM_32_LPAE_S2] = &io_pgtable_arm_32_lpae_s2_init_fns,
>>> -    [ARM_64_LPAE_S1] = &io_pgtable_arm_64_lpae_s1_init_fns,
>>> -    [ARM_64_LPAE_S2] = &io_pgtable_arm_64_lpae_s2_init_fns,
>>> -    [ARM_MALI_LPAE] = &io_pgtable_arm_mali_lpae_init_fns,
>>> -#endif
>>> -#ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S
>>> -    [ARM_V7S] = &io_pgtable_arm_v7s_init_fns,
>>> -#endif
>>> +struct io_pgtable_init_fns_node {
>>> +    struct io_pgtable_init_fns *fns;
>>> +    struct list_head list;
>>>   };
>>>   +static LIST_HEAD(io_pgtable_init_fns_list);
>>> +static DEFINE_RWLOCK(io_pgtable_init_fns_list_lock);
>>> +
>>> +static struct io_pgtable_init_fns *io_pgtable_get_init_fns(enum 
>>> io_pgtable_fmt fmt)
>>> +{
>>> +    struct io_pgtable_init_fns_node *iter;
>>> +    struct io_pgtable_init_fns *fns = NULL;
>>> +
>>> +    read_lock(&io_pgtable_init_fns_list_lock);
>>> +    list_for_each_entry(iter, &io_pgtable_init_fns_list, list)
>>> +        if (iter->fns->fmt == fmt) {
>>> +            fns = iter->fns;
>>> +            break;
>>> +        }
>>> +    read_unlock(&io_pgtable_init_fns_list_lock);
>>> +
>>> +    return fns;
>>> +}
>>
>> I think it would be a lot easier to stick with a simple array indexed
>> by enum - that way you can just set/clear/test entries without needing
>> to worry about locking. Basically just remove the const and the
>> initialisers from the existing one ;)
>>
>> (and if you think you're concerned about memory, consider that just
>> the list head plus lock is already half the size of the table)
>>
>> Other than that, I think this all looks pretty promising - I'd suggest
>> sending a non-RFC after rc1 so that it gets everyone's proper
>> attention.
>>
>> Thanks,
>> Robin.
>>
> 
> Thanks for all of the feedback! With respect to the comment about 
> keeping the current array,
> don't we need some sort of lock to protect access to the data structure 
> (e.g. concurrent access
> if adding two ops for the same format)? Or do you mean that we should 
> use atomic operations to
> handle this cleanly?

I don't think any races are realistically possible - built-in initcalls 
should run sequentially, while module init should be serialised by the 
module loader lock, so registrations should never be able to race 
against each other. And if there could be a race between registering a 
format and somebody trying to use it, then something's fundamentally 
wrong anyway - sure we could use READ_ONCE/WRITE_ONCE for accessing the 
table, but that would be basically be admitting that we've failed at the 
primary purpose of making sure formats are loaded *before* the users 
that depend on them.

With a directly-indexed table there's no contention between looking up 
one format and registering another unrelated format, unlike with a list.

Robin.

> 
> Thanks,
> Isaac
>>> +
>>>   struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
>>>                           struct io_pgtable_cfg *cfg,
>>>                           void *cookie)
>>>   {
>>>       struct io_pgtable *iop;
>>> -    const struct io_pgtable_init_fns *fns;
>>> +    struct io_pgtable_init_fns *fns;
>>>         if (fmt >= IO_PGTABLE_NUM_FMTS)
>>>           return NULL;
>>>   -    fns = io_pgtable_init_table[fmt];
>>> +    fns = io_pgtable_get_init_fns(fmt);
>>>       if (!fns)
>>>           return NULL;
>>>   @@ -59,12 +71,64 @@ EXPORT_SYMBOL_GPL(alloc_io_pgtable_ops);
>>>   void free_io_pgtable_ops(struct io_pgtable_ops *ops)
>>>   {
>>>       struct io_pgtable *iop;
>>> +    struct io_pgtable_init_fns *fns;
>>>         if (!ops)
>>>           return;
>>>         iop = io_pgtable_ops_to_pgtable(ops);
>>>       io_pgtable_tlb_flush_all(iop);
>>> -    io_pgtable_init_table[iop->fmt]->free(iop);
>>> +    fns = io_pgtable_get_init_fns(iop->fmt);
>>> +    if (fns)
>>> +        fns->free(iop);
>>>   }
>>>   EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
>>> +
>>> +int io_pgtable_ops_register(struct io_pgtable_init_fns *init_fns)
>>> +{
>>> +    struct io_pgtable_init_fns_node *iter, *fns_node;
>>> +    int ret = 0;
>>> +
>>> +    if (!init_fns || init_fns->fmt >= IO_PGTABLE_NUM_FMTS ||
>>> +        !init_fns->alloc || !init_fns->free)
>>> +        return -EINVAL;
>>> +
>>> +    fns_node = kzalloc(sizeof(*fns_node), GFP_KERNEL);
>>> +    if (!fns_node)
>>> +        return -ENOMEM;
>>> +
>>> +    write_lock(&io_pgtable_init_fns_list_lock);
>>> +    list_for_each_entry(iter, &io_pgtable_init_fns_list, list)
>>> +        if (iter->fns->fmt == init_fns->fmt) {
>>> +            ret = -EEXIST;
>>> +            kfree(fns_node);
>>> +            break;
>>> +        }
>>> +
>>> +    if (!ret) {
>>> +        fns_node->fns = init_fns;
>>> +        INIT_LIST_HEAD(&fns_node->list);
>>> +        list_add_tail(&fns_node->list, &io_pgtable_init_fns_list);
>>> +    }
>>> +    write_unlock(&io_pgtable_init_fns_list_lock);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(io_pgtable_ops_register);
>>> +
>>> +void io_pgtable_ops_unregister(struct io_pgtable_init_fns *init_fns)
>>> +{
>>> +    struct io_pgtable_init_fns_node *iter, *tmp;
>>> +
>>> +    if (!init_fns)
>>> +        return;
>>> +
>>> +    write_lock(&io_pgtable_init_fns_list_lock);
>>> +    list_for_each_entry_safe(iter, tmp, &io_pgtable_init_fns_list, 
>>> list)
>>> +        if (iter->fns == init_fns) {
>>> +            list_del(&iter->list);
>>> +            kfree(iter);
>>> +            break;
>>> +        }
>>> +    write_unlock(&io_pgtable_init_fns_list_lock);
>>> +}
>>> +EXPORT_SYMBOL_GPL(io_pgtable_ops_unregister);
>>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>>> index ea727eb..45b367ce 100644
>>> --- a/include/linux/io-pgtable.h
>>> +++ b/include/linux/io-pgtable.h
>>> @@ -163,6 +163,38 @@ struct io_pgtable_ops {
>>>   };
>>>     /**
>>> + * struct io_pgtable_init_fns - Alloc/free a set of page tables for a
>>> + *                              particular format.
>>> + *
>>> + * @fmt:   The page table format.
>>> + * @alloc: Allocate a set of page tables described by cfg.
>>> + * @free:  Free the page tables associated with iop.
>>> + */
>>> +struct io_pgtable_init_fns {
>>> +    enum io_pgtable_fmt fmt;
>>> +    struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void 
>>> *cookie);
>>> +    void (*free)(struct io_pgtable *iop);
>>> +};
>>> +
>>> +/**
>>> + * io_pgtable_ops_register() - Register the page table routines for 
>>> a page table
>>> + *                             format.
>>> + *
>>> + * @init_fns: The functions for allocating and freeing the page 
>>> tables of
>>> + *            a particular format.
>>> + */
>>> +int io_pgtable_ops_register(struct io_pgtable_init_fns *init_fns);
>>> +
>>> +/**
>>> + * io_pgtable_ops_unregister() - Unregister the page table routines 
>>> for a page
>>> + *                               table format.
>>> + *
>>> + * @init_fns: The functions for allocating and freeing the page 
>>> tables of
>>> + *            a particular format.
>>> + */
>>> +void io_pgtable_ops_unregister(struct io_pgtable_init_fns *init_fns);
>>> +
>>> +/**
>>>    * alloc_io_pgtable_ops() - Allocate a page table allocator for use 
>>> by an IOMMU.
>>>    *
>>>    * @fmt:    The page table format.
>>> @@ -233,23 +265,4 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
>>>           iop->cfg.tlb->tlb_add_page(gather, iova, granule, 
>>> iop->cookie);
>>>   }
>>>   -/**
>>> - * struct io_pgtable_init_fns - Alloc/free a set of page tables for a
>>> - *                              particular format.
>>> - *
>>> - * @alloc: Allocate a set of page tables described by cfg.
>>> - * @free:  Free the page tables associated with iop.
>>> - */
>>> -struct io_pgtable_init_fns {
>>> -    struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void 
>>> *cookie);
>>> -    void (*free)(struct io_pgtable *iop);
>>> -};
>>> -
>>> -extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns;
>>> -extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns;
>>> -extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns;
>>> -extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns;
>>> -extern struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns;
>>> -extern struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns;
>>> -
>>>   #endif /* __IO_PGTABLE_H */
>>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
