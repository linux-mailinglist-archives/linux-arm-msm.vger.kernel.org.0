Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C886773B82B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjFWMvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 08:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbjFWMvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 08:51:14 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD061FF5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:50:51 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-66872dbc2efso106266b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687524651; x=1690116651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J6qedKH7rACUI+d8+QjoI1iru+7/a5M9lap7RdXq+s=;
        b=Q524DUGT6itGV4gw01qJj/zWbJLa4vy2WCXqnWOngK0C3q+dq5EKhIS0CVZv0oxxho
         LJ6tY9YfoIHNM/tflF8trZPv/Spx8OYgEAYGDhp6iajWSx+dfQpGCxtVSU4j+uchKR2K
         6jjaYk2avrTfJwxxTgNPxH+prD4PA2RYda//8FNhgDDbtNG8gCEmPUtJ+VXKPa4DXVej
         a5KLbc1PmFNVMjg9t+MjU8GHA1HEy3OLaOZU0A/n71b/fjkikDpbyETS6JPqwOfw6qlc
         81KayU6/lII4/pSrE7vPjFTNx81tmGljnxk2j498q4g7qxCoplXlCdPQ4N13nBnNs8tt
         8JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687524651; x=1690116651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3J6qedKH7rACUI+d8+QjoI1iru+7/a5M9lap7RdXq+s=;
        b=kXKImNX2toYF+5+jp16AiZYvNTZoGhq+qtz4Ll+2xoXUR+n0Ji4BViLtoysl54FbBU
         fBSoGNX9ieXEDZXM492oL3Q/dfkHnpox8b8E5ymmOrm78g03ll/JzVcA5GG+EXTY1J1/
         K7p0qAkl7yAMGGa4WrzmJDzJRD5SSqd7e5CE6kES4Q12XyuW3dsuIpitv9Qvpkrdd8nZ
         WNAJDUTj/8xurTab0FXdHxNvKr7E0HzrpHkT4FHLWfkE/BQswvKc9N7CVXtenmXgxPZq
         CsQexNzTOPLLq2Ig9ujTO50LBF1D2VqEd/Z8lzZ24JVP6p6vg6RRdMUSZMR0vZrDCv6Y
         z2yQ==
X-Gm-Message-State: AC+VfDwln6l8KXal06+YH4jfCZeBDUrP5rusXNhBMtZtOdFg5b6y+sKm
        QpgDdEx5ad3uhxRX1CMLN/l+GQ==
X-Google-Smtp-Source: ACHHUZ6Fjrszr4MOiG7PTx+CVGVeY59XJZwzJifNOvY5NLzJaatECslqahuGwHQe8HJSyn0Dmf/QQQ==
X-Received: by 2002:a05:6a00:3186:b0:668:7fe6:c220 with SMTP id bj6-20020a056a00318600b006687fe6c220mr14325912pfb.3.1687524651198;
        Fri, 23 Jun 2023 05:50:51 -0700 (PDT)
Received: from [10.4.168.167] ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79195000000b0063a04905379sm6063171pfa.137.2023.06.23.05.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 05:50:50 -0700 (PDT)
Message-ID: <31d3f685-3017-25d8-5b0b-2795ed7049bc@bytedance.com>
Date:   Fri, 23 Jun 2023 20:50:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [External] Re: [PATCH 01/29] mm: shrinker: add
 shrinker::private_data field
Content-Language: en-US
To:     Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        david@fromorbit.com, tkhai@ya.ru, roman.gushchin@linux.dev,
        djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org,
        tytso@mit.edu
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, dm-devel@redhat.com,
        linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-btrfs@vger.kernel.org
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-2-zhengqi.arch@bytedance.com>
 <b04a0191-fa27-f8dc-440c-ec363d9c0636@suse.cz>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <b04a0191-fa27-f8dc-440c-ec363d9c0636@suse.cz>
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

Hi Vlastimil,

On 2023/6/22 22:47, Vlastimil Babka wrote:
> On 6/22/23 10:53, Qi Zheng wrote:
>> To prepare for the dynamic allocation of shrinker instances
>> embedded in other structures, add a private_data field to
>> struct shrinker, so that we can use shrinker::private_data
>> to record and get the original embedded structure.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> I would fold this to 02/29, less churn.

OK, I will fold this to 02/29 in the v2.

Thanks,
Qi

> 
>> ---
>>   include/linux/shrinker.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 224293b2dd06..43e6fcabbf51 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -70,6 +70,8 @@ struct shrinker {
>>   	int seeks;	/* seeks to recreate an obj */
>>   	unsigned flags;
>>   
>> +	void *private_data;
>> +
>>   	/* These are for internal use */
>>   	struct list_head list;
>>   #ifdef CONFIG_MEMCG
> 
