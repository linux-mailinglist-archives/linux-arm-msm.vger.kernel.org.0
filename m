Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862DF73B8B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjFWNZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjFWNZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:25:04 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FDB211D
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:24:36 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-77e3c55843cso2503739f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687526676; x=1690118676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gz92l7DBmLTrf6935v1JTyj18AL7FL04QRL4qQAWqJU=;
        b=gIWwtDXxJuivuEsWsn7sqCZTBLYzZCSIZH5HGE4qZ8EWB5QUXMWkTscVi5K7m3pLUb
         AWoNDhJ8ESx9DRpn3UGCp2Uvm2dath67lulczhMMzXUHSfw+KuuuWZKZ5vDu4lXfHnd5
         hQR/vcg8QKo72hHneWZ3miZE29ysHMJmApIFRQ1SzZroa/a+qdV6Dpe2uLtETWZSf5Di
         DwUbZUrml+/apF9HoV5pAAcN8e5k4Mr7obMwZugAwGAvvUEtH2WFBgfX4jOKDMjPri+A
         N84eYclRTYh7THW7IcSdjB8iFp8xE+GCdJYVPjGEA03gXDcctC8fDrc4P9qjfAoL/G9z
         jxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687526676; x=1690118676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz92l7DBmLTrf6935v1JTyj18AL7FL04QRL4qQAWqJU=;
        b=LR/kq3/5iI75pmJQwkLXM9q6GGy8uFByiP/Oq3jXoOezKVy5w3ztz/xDNzwo96QVCW
         Ckc/f2HnVE7eWERkMOLUANt3SaujaSkz1zIN2x5ZzWyYc0u5kwK9sCjZe7xX9n6d2cfQ
         UETgAQo4oqnnXHPhEsKj+jZ8CJ5OwyKeKHuj9YvooialVt4FphMOh24cpiqHCMKfCuyQ
         QeIm8dNzh0jhbOemAMTDCkMnhRaFvd7tiFI7/cP7SjWu5BAATTZEQ+VhoL7n6vEO+GyE
         KX3t+WvsNZXwHsSctOxxrHgt2Vs069rcHNrm2uG3iYtEwnfRPLacdziSSPxG3SgVJKS5
         Jb9A==
X-Gm-Message-State: AC+VfDwMpU4GN9qXbi1bsRIu/ZUABDSumYb2dwKm09zvpRgvvEPvJWx1
        bHCmV2sE/sWvC5q33PxTy57DZQ==
X-Google-Smtp-Source: ACHHUZ5gEbRKgAaE+N8YtReVmyo3V0rllQa6wCPNTx2RvtSftj/ir5NFrmfS2AckYJcn//Bnc41ZpQ==
X-Received: by 2002:a6b:1581:0:b0:780:c6bb:ad8d with SMTP id 123-20020a6b1581000000b00780c6bbad8dmr5508761iov.0.1687526676020;
        Fri, 23 Jun 2023 06:24:36 -0700 (PDT)
Received: from [10.4.168.167] ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id w5-20020a17090a380500b0025bcdada95asm1562852pjb.38.2023.06.23.06.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 06:24:35 -0700 (PDT)
Message-ID: <f8d924e7-8faf-438d-4d2f-5f806ef88a49@bytedance.com>
Date:   Fri, 23 Jun 2023 21:24:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 29/29] mm: shrinker: move shrinker-related code into a
 separate file
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
        vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
        brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, dm-devel@redhat.com,
        linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-btrfs@vger.kernel.org
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-30-zhengqi.arch@bytedance.com>
 <20230623052554.GA11471@google.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230623052554.GA11471@google.com>
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

Hi Sergey,

On 2023/6/23 13:25, Sergey Senozhatsky wrote:
> On (23/06/22 16:53), Qi Zheng wrote:
>> +/*
>> + * Remove one
>> + */
>> +void unregister_shrinker(struct shrinker *shrinker)
>> +{
>> +	struct dentry *debugfs_entry;
>> +	int debugfs_id;
>> +
>> +	if (!(shrinker->flags & SHRINKER_REGISTERED))
>> +		return;
>> +
>> +	shrinker_put(shrinker);
>> +	wait_for_completion(&shrinker->completion_wait);
>> +
>> +	mutex_lock(&shrinker_mutex);
>> +	list_del_rcu(&shrinker->list);
> 
> Should this function wait for RCU grace period(s) before it goes
> touching shrinker fields?

Why? We will free this shrinker instance by rcu after executing
unregister_shrinker(). So it is safe to touch shrinker fields here.

> 
>> +	shrinker->flags &= ~SHRINKER_REGISTERED;
>> +	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
>> +		unregister_memcg_shrinker(shrinker);
>> +	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
>> +	mutex_unlock(&shrinker_mutex);
>> +
>> +	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
>> +
>> +	kfree(shrinker->nr_deferred);
>> +	shrinker->nr_deferred = NULL;
>> +}
>> +EXPORT_SYMBOL(unregister_shrinker);
> 
> [..]
> 
>> +void shrinker_free(struct shrinker *shrinker)
>> +{
>> +	kfree(shrinker);
>> +}
>> +EXPORT_SYMBOL(shrinker_free);
>> +
>> +void unregister_and_free_shrinker(struct shrinker *shrinker)
>> +{
>> +	unregister_shrinker(shrinker);
>> +	kfree_rcu(shrinker, rcu);
>> +}
> 
> Seems like this
> 
> 	unregister_shrinker();
> 	shrinker_free();
> 
> is not exact equivalent of this
> 
> 	unregister_and_free_shrinker();

Yes, my original intention is that shrinker_free() is only used to
handle the case where register_shrinker() returns failure.

I will implement the method suggested by Dave in 02/29. Those APIs are
more concise and will bring more benefits. :)

Thanks,
Qi



