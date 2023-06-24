Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B00F73CA85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 13:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbjFXLId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 07:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjFXLIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 07:08:31 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FA51FF0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 04:08:29 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b5585e84b4so2525955ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687604909; x=1690196909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tnz7s8ew6fhhs0dR9M9QnK0rlCy7+XAhEAWksz3vrg=;
        b=UmCBKPF4sv1MHFXsiXJ20hfDGRh4FqZyWNYAXvwJ4aTGGxIidAh9WvDmw+TkimJm1h
         mWSpmHZ6C1d0YyoGyiszU38sSq69kPhXPhm56U4+6FVITcJ1CEZHjLEmCAtp6wktOCK/
         DxOdRsySk1sXqY68RWF0JOe4/zeVPJtvQ9lHfsJ6x6SdMyQcNVrIa4NXa7fRi6mlad+o
         t//wFgxPhT7EPECahYPUyLpil8jkwMy0/+XEXxUh0Le8+U2ufonOfsscVTgC+SrRoDCH
         iM7noG8OLDFE0tdGr8824/JUhvbwrqjbGrrMdkGxtRD/cnqrUyFsNqPJcdX8JFikXXu+
         BdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687604909; x=1690196909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tnz7s8ew6fhhs0dR9M9QnK0rlCy7+XAhEAWksz3vrg=;
        b=SJFZAsTAGsPFQDjotlUkh44oCLaiabV3kKWk6f60AbRXuaPLZvSB4IdEGh2vN8lQer
         XS58YFn/EP1B4/92jfS6mcaY9D+JDk/r8al/Y1Bkr9Yhv2rPyrXMmlmNnrTBrDvneQOW
         YicCoesJiS6zISCBBmErdzj8fU4RT0UFAANGTCEU6JDtZAovZCVy8WXjG22MrTgBO7sQ
         aHkWdc1Ko2tkG6gnRvgXZpnS9YV3EwdhUsuTuSEJO6Gp6jjBIhXDX6eaIpuINe6OACJj
         HVGwUnz8u2+z1Elp/V+bJhte38/XlLIVSnKkHavf6nTCvMUl6XbDJGzZQNjKJxIiuxF+
         GxFg==
X-Gm-Message-State: AC+VfDzjzfvicqUOhXVVXJaUzTavn57qbOYiOykrX+2bLo2vxXZ0ekYu
        82idHKMQfOCyvvCsQP7pUMK3eA==
X-Google-Smtp-Source: ACHHUZ48xugwBy1Yb59MA7iADNA4mtjxjJVDK/TEG1GiFnnp8kgPq3uDjFXVnvd+Ayx9tItAR27KLA==
X-Received: by 2002:a17:903:32c4:b0:1b3:e352:6d88 with SMTP id i4-20020a17090332c400b001b3e3526d88mr29305254plr.6.1687604908733;
        Sat, 24 Jun 2023 04:08:28 -0700 (PDT)
Received: from [10.4.162.153] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id bg6-20020a1709028e8600b001b3d0aff88fsm1021644plb.109.2023.06.24.04.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 04:08:28 -0700 (PDT)
Message-ID: <a7baf44a-1eb8-d4e1-d112-93cf9cdb7beb@bytedance.com>
Date:   Sat, 24 Jun 2023 19:08:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 24/29] mm: vmscan: make global slab shrink lockless
To:     Dave Chinner <david@fromorbit.com>, paulmck@kernel.org
Cc:     Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        tkhai@ya.ru, roman.gushchin@linux.dev, djwong@kernel.org,
        brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dm-devel@redhat.com, linux-raid@vger.kernel.org,
        linux-bcache@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-btrfs@vger.kernel.org
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-25-zhengqi.arch@bytedance.com>
 <cf0d9b12-6491-bf23-b464-9d01e5781203@suse.cz>
 <ZJU708VIyJ/3StAX@dread.disaster.area>
 <a21047bb-3b87-a50a-94a7-f3fa4847bc08@bytedance.com>
 <ZJYaYv4pACmCaBoT@dread.disaster.area>
Content-Language: en-US
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZJYaYv4pACmCaBoT@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

On 2023/6/24 06:19, Dave Chinner wrote:
> On Fri, Jun 23, 2023 at 09:10:57PM +0800, Qi Zheng wrote:
>> On 2023/6/23 14:29, Dave Chinner wrote:
>>> On Thu, Jun 22, 2023 at 05:12:02PM +0200, Vlastimil Babka wrote:
>>>> On 6/22/23 10:53, Qi Zheng wrote:
>>> Yes, I suggested the IDR route because radix tree lookups under RCU
>>> with reference counted objects are a known safe pattern that we can
>>> easily confirm is correct or not.  Hence I suggested the unification
>>> + IDR route because it makes the life of reviewers so, so much
>>> easier...
>>
>> In fact, I originally planned to try the unification + IDR method you
>> suggested at the beginning. But in the case of CONFIG_MEMCG disabled,
>> the struct mem_cgroup is not even defined, and root_mem_cgroup and
>> shrinker_info will not be allocated.  This required more code changes, so
>> I ended up keeping the shrinker_list and implementing the above pattern.
> 
> Yes. Go back and read what I originally said needed to be done
> first. In the case of CONFIG_MEMCG=n, a dummy root memcg still needs
> to exist that holds all of the global shrinkers. Then shrink_slab()
> is only ever passed a memcg that should be iterated.
> 
> Yes, it needs changes external to the shrinker code itself to be
> made to work. And even if memcg's are not enabled, we can still use
> the memcg structures to ensure a common abstraction is used for the
> shrinker tracking infrastructure....

Yeah, what I imagined before was to define a more concise struct
mem_cgroup in the case of CONFIG_MEMCG=n, then allocate a dummy root
memcg on system boot:

#ifdef !CONFIG_MEMCG

struct shrinker_info {
	struct rcu_head rcu;
	atomic_long_t *nr_deferred;
	unsigned long *map;
	int map_nr_max;
};

struct mem_cgroup_per_node {
	struct shrinker_info __rcu	*shrinker_info;
};

struct mem_cgroup {
	struct mem_cgroup_per_node *nodeinfo[];
};

#endif

But I have a concern: if all global shrinkers are tracking with the
info->map of root memcg, a shrinker->id needs to be assigned to them,
which will cause info->map_nr_max to become larger than before, then
making the traversal of info->map slower.

> 
>> If the above pattern is not safe, I will go back to the unification +
>> IDR method.
> 
> And that is exactly how we got into this mess in the first place....

I only found one similar pattern in the kernel:

fs/smb/server/oplock.c:find_same_lease_key/smb_break_all_levII_oplock/lookup_lease_in_table

But IIUC, the refcount here needs to be decremented after holding
rcu lock as I did above.

So regardless of whether we choose unification + IDR in the end, I still
want to confirm whether the pattern I implemented above is safe. :)

Thanks,
Qi

> 
> -Dave
