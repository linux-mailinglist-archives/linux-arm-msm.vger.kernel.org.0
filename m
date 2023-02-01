Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFE36869E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbjBAPSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjBAPRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:17:54 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A75CCA3E
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:17:27 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id o18so8166695wrj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVLkiMwFidl/M+DwCkpsxP4ftj8ZYza6IWwRBi4/7pQ=;
        b=VNPQ/X/pqW5podXmM+4Pm71xXcIBqaG9d/J1oLSRD2Q1+9xzw6uT7JpQko04yi36aW
         wT1xbH4utSDP9jVgA9Wa3gY/P2ObskxsziMpQOX+D/hFGW0AOCO8jgwaK+EQuo2MdfI/
         VYOyqQMT+RrgnZxgXQKrPRS7ss+Y17Ai2KuUjpN9KAE9lBIF9lWujX7MYx77JK6TUJfh
         nZ25QhLs66WhojLED0KSBlF7he+OojxpUcYOvXs4RibFMpqMFklreHl/f7/A5wPJ4J4X
         eyQZBaTHfHIYwLjutg6jIBd48RdHEwRqW2s8uPhS4DaHyWzs9/Xctn+2+zKQL9OBw1GJ
         qoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVLkiMwFidl/M+DwCkpsxP4ftj8ZYza6IWwRBi4/7pQ=;
        b=Cb8zZS7rQO3SLf2+gathosAy9jZU/v7Q8NoWW07UdD8JEeAwAH3neZ55ZyhnUC6hB1
         zcCQ/hJxHf7Gutu7URrznPhcthBkKriIYz34dUr9+X8McltmViPYokZf5yjPe+t0sTts
         gDIU8jWt+i8ctG6Cle8kZGnjsNQz3wD9rOlpWJ4eSrX0e8mFoBR9R5KkfhC4AZm7Vqwi
         H/uS1v4CQmvphuI446lVR8FyiKoLfSJQjxkQm54iVdZQnGiOm+lpwRq7NsuI3ZJJxFmq
         MVbLdKLR0eitJyf6NyA29nrW4DUa3RRv1Xd+N3NaKl+tTvSaNcbAfhhy/iCXdR/qNIo9
         dz7g==
X-Gm-Message-State: AO0yUKVpTe6kvHvKk5XRaw9rD0GL6VsE3SuWfxJibVkFvrpV0rRM4tdT
        s8KpWdlxl8dvShaoBzqjCk36Nw==
X-Google-Smtp-Source: AK7set/nCiNy+Pzi77nIa65QImfC3rdztS1HtejxiWDwDPA66QnckjniT6lXmI3fv1qnkQSONcRnnA==
X-Received: by 2002:a5d:4e02:0:b0:2bf:e1f8:c4b6 with SMTP id p2-20020a5d4e02000000b002bfe1f8c4b6mr2583288wrt.52.1675264645313;
        Wed, 01 Feb 2023 07:17:25 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t8-20020a5d6908000000b002bc7e5a1171sm17846257wru.116.2023.02.01.07.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 07:17:24 -0800 (PST)
Message-ID: <86478fbd-590a-f94f-6cc1-f4d06a96826e@linaro.org>
Date:   Wed, 1 Feb 2023 15:17:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] PM / devfreq: qcom: Introduce CCI devfreq driver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jun Nie <jun.nie@linaro.org>, myungjoo.ham@samsung.com,
        kyungmin.park@samsung.com, cw00.choi@samsung.com,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230201080227.473547-1-jun.nie@linaro.org>
 <20230201080227.473547-2-jun.nie@linaro.org>
 <515f4e9e-2804-e03a-26f5-f2d3ac331109@linaro.org>
 <71ba0d05-6183-95ef-9e45-cc3dd512475f@linaro.org>
 <CAA8EJpqyqC5D+O=KJnuZnWN4BwBOKcquN11nJfEp2WMSmJobBg@mail.gmail.com>
 <58a5e856-3e8b-d660-09ee-7a18b184452f@linaro.org>
 <1d33eb58-95d1-643d-52cc-2888ff0cea43@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1d33eb58-95d1-643d-52cc-2888ff0cea43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 14:58, Dmitry Baryshkov wrote:
> On 01/02/2023 16:45, Bryan O'Donoghue wrote:
>> On 01/02/2023 13:41, Dmitry Baryshkov wrote:
>>>>                           cci-cpufreq {
>>>>                                   target-dev = <&cci_cache>;
>>>>                                   cpu-to-dev-map-0 =
>>>>                                           <  200000  200000000 >,
>>>>                                           <  345600  200000000 >,
>>>>                                           <  400000  200000000 >,
>>>>                                           <  533330  297600000 >,
>>>>                                           <  800000  297600000 >,
>>>>                                           <  960000  297600000 >,
>>>>                                           < 1113600  297000000 >,
>>>>                                           < 1344000  595200000 >,
>>>>                                           < 1459200  595200000 >,
>>>>                                           < 1497600  595200000 >,
>>>>                                           < 1651200  595200000 >;
>>>>                                   cpu-to-dev-map-4 =
>>>>                                           <  200000 200000000 >,
>>>>                                           <  249600 200000000 >,
>>>>                                           <  499200 297600000 >,
>>>>                                           <  800000 297600000 >,
>>>>                                           <  998400 595200000 >,
>>>>                                           < 1113600 595200000 >;
>>> These should map to existing opp entries.
>>>
>>> I ended up doing the interconnect driver that maps a clock to the
>>> interconnect. Then I can use it in the cpu opp tables.
>>>
>>
>> Can you point us at what it is you are proposing ?
> 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230120061417.2623751-9-dmitry.baryshkov@linaro.org/
> 

Is there no driver code too ?

