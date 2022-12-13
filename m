Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A54F64ACD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 02:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbiLMBLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 20:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiLMBLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 20:11:21 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639231BE91
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 17:11:20 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id r72so978602iod.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 17:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAR7trYZxyJz6dDjjGtnhQhvH4CV37H8ORJAnU50YAI=;
        b=OynFoN1pxipzXa/LRGcM80xD2vmYyGNwHBjBEuCjqZYJEqN9DZLh8crm+GMKI/72Fz
         7HlpLIQy1Fpv7C+E1DZNIFKRvoT3XlW6fyxsdx3xupxod/KmnXyVMZ8ubid6KNxGnmoy
         Qxxi4v+SuPsrHDtow570icb8+YuEWnNBfoizdLkwuKcg6pBcNGDanvcXDwknKuFX4dMS
         VBJOFwk9CFUnXei7eiIcdlCoPVfj4DS2UVkQcxbwWFF8CS5rHJ7Egq79zImRfpYzqkqN
         vDacxqXKTmpDqYbpVex7xMOsys3gZANZw5nYRnQ6czRCHKsbf6I36DaYapwrQ4bViBYw
         JWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAR7trYZxyJz6dDjjGtnhQhvH4CV37H8ORJAnU50YAI=;
        b=Ns5YsUFL84BZrlu4fufPUqpDrq2n5BGYf7tSyi9bSYowoYrLCqQVkApYV9tL13HX+Z
         s63kDJLwbyC4caCgpm8uAuECpZgt3enlZHSvfzqAqeN7m6xIr4MKeTQHVuyw2tJWOTyi
         e9gnKHTcjYU01d/0crh8lSA+jUY5chi7M0l+YibtVYhWb7Hz7lKzRVSsNjU2pwTqI8OT
         gmcqvVXh8iIJbN1mRvrlKDtpfhuFZDkXD1OSJRms9vH5MEtbGnShG5zJqpcLONAtSHRw
         oXzxmr/4asmYbnaPtvpRtkmBmKqtA2DpwNeUA0qlvYWZb7EScWQG9crnZmKpYOsypnpW
         qXKw==
X-Gm-Message-State: ANoB5pkdVE24GyKn5NH9xHQC0QLP5T8GTwYbXnaezGIWSmhWRZcqJT4A
        P8hMKfiFZ0R9tKZcDK+cJ5rUPg==
X-Google-Smtp-Source: AA0mqf5iT+UyD0qvn7NpOSGyfj+cr/V7nAI47f6cpKUqG428uF+45DFYJC396XBHW9j/HJIVVKMX7Q==
X-Received: by 2002:a6b:fb0a:0:b0:6df:5a37:ed5 with SMTP id h10-20020a6bfb0a000000b006df5a370ed5mr9593060iog.17.1670893879743;
        Mon, 12 Dec 2022 17:11:19 -0800 (PST)
Received: from [10.211.55.3] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id m13-20020a02a14d000000b0038a382d84c5sm414160jah.64.2022.12.12.17.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 17:11:19 -0800 (PST)
Message-ID: <008d3e20-2c6b-c3f1-3fd3-ef4ef4dd061e@linaro.org>
Date:   Mon, 12 Dec 2022 19:11:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next 2/2] net: ipa: add IPA v4.7 support
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Alex Elder <elder@linaro.org>, davem@davemloft.net,
        edumazet@google.com, pabeni@redhat.com, andersson@kernel.org,
        agross@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20221208211529.757669-1-elder@linaro.org>
 <20221208211529.757669-3-elder@linaro.org>
 <47b2fb29-1c2e-db6e-b14f-6dfe90341825@linaro.org>
 <fa6d342e-0cfe-b870-b044-b0af476e3905@linaro.org>
 <48bef9dd-b71c-b6aa-e853-1cf821e88b50@linaro.org>
 <20221212155450.34fdae6b@kernel.org>
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <20221212155450.34fdae6b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/12/22 5:54 PM, Jakub Kicinski wrote:
>>> which in total gives us 0x146a8000-0x146aafff
>> Can you tell me where you found this information?
> [1], [2]
> 
>>    
>>> That would also mean all of your writes are kind of skewed, unless
>>> you already applied some offsets to them.
>> This region is used by the modem, but must be set up
>> by the AP.
>>    
>>> (IMEM on 6350 starts at 0x14680000 and is 0x2e000 long, as per
>>> the bootloader memory map)
>> On SM7250 (sorry, I don't know about 7225, or 6350 for that matter),
>> the IMEM starts at 0x14680000 and has length 0x2c000.  However that
>> memory is used by multiple entities.  The portion set aside for IPA
>> starts at 0x146a9000 and has size 0x2000.

This is awesome, thank you!

Yes I think there are a couple of minor corrections to make
but I haven't had the time to go do the research yet, so
hadn't yet responded.

Nothing is "supported" upstream anyway until there's a
system with a DTS that uses it, and that won't happen
until after the end of the merge window.

Again, thank you very much, it's a safe thing to take
for now.

					-Alex

