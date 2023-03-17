Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4AD6BE2D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 09:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjCQIOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 04:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjCQIOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 04:14:34 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444CAACE07
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:13:50 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y4so17267531edo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679040824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTkt885oytfYo9Lb68dSckMe6EvhfqmYNTcED2Zhid4=;
        b=ck1t9nOjPrcc1xukWzZfjhW3Xy1y9jpxRdwbuxWkBc0Zvp/Ezztq+X4SBD/Y4ASzlQ
         zriqdhO/8JOPDCLmj5c6++19KOLUHljtKGL6zLnR8PkyJWjYq6+Av5VZol6wWb7E2Gpu
         MZNWZWviB/7MagoiFcNlqx1eGAAO7xlOBiShKxfYd246jd7Yx3OJ2PTeespuWYwr+Z9T
         DtA79IbYkXPlAvBBhFty1ePYKCLwan5I3DdiNr52bup6jpHitEmddslhINbvREE7114H
         zhN9Abs673CEDQFu3pgsCpMkmbMAoizArFKk3Pp3J5ofDs/cloqsRNAYawDLUPzM6tQ3
         5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679040824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTkt885oytfYo9Lb68dSckMe6EvhfqmYNTcED2Zhid4=;
        b=uLeoTXWZw7Pj22xs3BKGSRRIai3LYYEwEeYWAN7yiiFRza5V5ez/8LhQnD8omRGQmV
         75j5/axupsC2E872FARlkb89QiEFZ2x0w9GlA7n2KhFB1RjS12PKkrnUt+TEqx8NKt4Q
         +BwovkLRRgnZjW3Dp+pX7QnTQzllMylko/1BsCCYrDwD7hbO8nb0XjT4s58lNzJbZdLU
         VdWQNGxUVL/3N+9gMamlGr0YJu5WPJ3GbnDQnU/JLEsyWUUKMeiJuWrLMYVwndqZl/qZ
         XRoMwid9TMaQjg+1wPl7TippHHyJKZAw/GMQI6NND2sWDZDELysZO2vze7l2Zo9vQwt8
         4guw==
X-Gm-Message-State: AO0yUKXw4ztEFwU3Sd9UMJvkf4qLyX/3Rzp57KfaeTaWMN/0M/IjRw3l
        ymd0x0TTQm6DJFGS3yLtQ4tvnQ==
X-Google-Smtp-Source: AK7set+CF7YjQa2Ct2Oo7/j0ML04WAmz9uR1EGipCzOXucb3MWLgpSH22pA/XuGe+u8cXw7Q7KJmuQ==
X-Received: by 2002:a17:906:2357:b0:931:829c:9d58 with SMTP id m23-20020a170906235700b00931829c9d58mr2026395eja.23.1679040823826;
        Fri, 17 Mar 2023 01:13:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id u27-20020a50951b000000b004bf999f8e57sm710282eda.19.2023.03.17.01.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:13:43 -0700 (PDT)
Message-ID: <a0e1b3b9-b333-e0ac-ac46-c15a01b356e6@linaro.org>
Date:   Fri, 17 Mar 2023 09:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] cpufreq: qcom-cpufreq-hw: allow work to be done on
 other CPU for PREEMPT_RT
Content-Language: en-US
To:     Hillf Danton <hdanton@sina.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adrien Thierry <athierry@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        linux-rt-users@vger.kernel.org
References: <20230315164910.302265-1-krzysztof.kozlowski@linaro.org>
 <20230316235705.2235-1-hdanton@sina.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316235705.2235-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/03/2023 00:57, Hillf Danton wrote:
> On 16 Mar 2023 13:28:18 +0100 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> On 15/03/2023 17:49, Krzysztof Kozlowski wrote:
>>> Qualcomm cpufreq driver configures interrupts with affinity to each
>>> cluster, e.g.  dcvsh-irq-0, dcvsh-irq-4 and dcvsh-irq-7 on SM8250.
>>> Triggered interrupt will schedule delayed work, but, since workqueue
>>> prefers local CPUs, it might get executed on a CPU dedicated to realtime
>>> tasks causing unexpected latencies in realtime workload.
>>>
>>> Use unbound workqueue for such case.  This might come with performance
>>> or energy penalty, e.g. because of cache miss or when other CPU is
>>> sleeping.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/cpufreq/qcom-cpufreq-hw.c | 11 ++++++++++-
>>
>> Let me also paste impact of this patch - rtla osnoise on entirely idle
>> system (cores 2-7 isolated for Realtime):
> 
> Are cores 2-7 the non-housekeeping CPUs[1]?

Yes, since their are isolated for Realtime this is synonymous.

> 
> [1] https://lore.kernel.org/lkml/20230223150624.GA29739@lst.de/



Best regards,
Krzysztof

