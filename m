Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676E85BEAFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 18:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiITQSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 12:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiITQQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 12:16:23 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211B85F23E
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 09:16:22 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id h21so2068388qta.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JYo2UwsHnyRJ0cdkre+Ls0UO9p1NrvPYX66IenZob5I=;
        b=sfUM2bLLsTrXEFWe4Km1gtjV8yC9yhiLVHf3NwfzfPCvcJEfVL1v+TeMkxTZpgPxIx
         a48/nUMeox1Kdt6oav5jj13IbSGER0P/LkZ+XHfg20waAdW7Appw85qppkVBZleNqkDI
         5nNtcWA/lXZt5/uvA79E9jzQmq6Z9Ci0Uh3uoQrtEcYaIKDoZ2ly67CVRPR4gepsKi+T
         l3b+9N4Xwx68esHa5De4ly8xWpMTfZtLlww2Eado6GGnJ0ZDkeMagq5PMiyPUeBr+QKd
         t5wbgze695Kd+rrMtxKZVww7026tPijKRrMVVOy3BZUXkiN3EEG++QLZSqP9ta2Fd1z8
         gF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JYo2UwsHnyRJ0cdkre+Ls0UO9p1NrvPYX66IenZob5I=;
        b=wL9vcUNFDSCi+tJ740J1ubpDtiyf36yuejNyo8p7wPjeXmaHzkGGOohv3uhuoOZv8H
         Ixkb6j9PzkX/otQat9G7guYCkWukNRkj7lJlKMNxNlCKemFCjGqTTB6vKDBiVeKtUC6C
         6pWfpNX+xt1fhZN5elG/dM6R6KnShvTBznx48+Ze/bzAo9SM+R87m8A7sP8qP2BEeyvL
         49zwPUQQBnaknhCqIZnRYbynVGdd9jiReSTY4RDsxyfF8720qQ7+iA+1AqjvhuGBH8QU
         x5s+DmKLl1wHKnt7WCHVMYsSqwjb/8qUj5+/Oz+wRfpwkjrAwjepe/XzILro1JboJ2sY
         rN/Q==
X-Gm-Message-State: ACrzQf3+mr43rYsOpJOfXGf9juq0Xr9+VDi5u/T/RgSpvJ5WclZxEV7A
        2JitNjU9axGpLYh6TIQOePYoyQ==
X-Google-Smtp-Source: AMsMyM7QUgAHuWD6FkbOCq2zcrXirY0ofUob6HGYLSMZKye+oVr7FtSPlCCFTQ5MeTDKpmLRabvNHA==
X-Received: by 2002:a05:622a:110e:b0:35b:a6d3:96fd with SMTP id e14-20020a05622a110e00b0035ba6d396fdmr20282997qty.590.1663690581163;
        Tue, 20 Sep 2022 09:16:21 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id s4-20020a05620a254400b006cf43968db6sm100510qko.76.2022.09.20.09.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 09:16:20 -0700 (PDT)
Message-ID: <917abc36-ee08-6f1e-2bf5-a657b022c912@linaro.org>
Date:   Tue, 20 Sep 2022 11:16:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net v2] net: ipa: properly limit modem routing table use
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220913204602.1803004-1-elder@linaro.org>
 <20220920081400.0cbe44ff@kernel.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220920081400.0cbe44ff@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/20/22 10:14 AM, Jakub Kicinski wrote:
>> v2: Update the element info arrays defining the modified QMI message
>>      so it uses the ipa_mem_bounds_ei structure rather than the
>>      ipa_mem_array_ei structure.  The message format is identical,
>>      but the code was incorrect without that change.
> Unclear to me why, ipa_mem_bounds_ei and ipa_mem_array_ei seem
> identical, other than s/end/count/. Overall the patch feels
> a touch too verbose for a fix, makes it harder to grasp the key
> functional change IMHO. I could be misunderstanding but please
> keep the goal of making fixes small and crisp in mind for the future.

I see you've already accepted the patch, and I appreciate that.

The verbosity was because it was maybe a subtle difference
and I failed to be more concise describing it.

Over the wire, the ipa_mem_bounds and ipa_mem_array *look*
identical (both are a pair of 32-bit unsigned values).

But they are *semantically* different.  The "array" is a
base offset and number of entries.  The "bounds" specifies
the start and last offset (one less than the number of
entries).

So the type has changed to try to make the distinction
clearer.  I realize neither the compiler nor the QMI
implementation will distinguish it, but the hope is that
the human reader can derive some value from it.

I don't want to be any more verbose, so I'll leave it at
that.

					-Alex
