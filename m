Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044625BADA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 14:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiIPM4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 08:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiIPM4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 08:56:06 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264F37C777
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 05:56:04 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l8so10671320wmi.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FlgUh5+pDn0PTCFu6MENysdcsTjYuALACeiMk1+3GzM=;
        b=UMBnXSenihH6P6oCZLrpTzS5LnafMHOZaBY1de7HlfwJ1BMfyP3aCIlF3tncrofGwL
         aENJI01ZvTyvYNjmCy4OJ+fj1ne14FYUIXFEpI+YAU3ekZwGLnc/s5xMZkPbBCCR1uCt
         T6zeXiyqKjCK87ByFt/X5ApIvQtwoJtFda2BmKiYjoXb3Gjg7+uXHdkL2GuCPQNtDpLE
         /NMzxLFpkm/Obsa9gU+re7MQZmxVMbi1ozSni/7MBrb7dPoJ7kV9MuTf/7XItcl5RKPP
         d3fF/Lba2lhhjAq0F0m+41eqWSXbZHyUn/AXSLlTgqUEjwF76R6+0UyQPyglNvuGQ5I+
         yW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FlgUh5+pDn0PTCFu6MENysdcsTjYuALACeiMk1+3GzM=;
        b=3Ls6WPUWO7rZAX+m2XFlVm+QslhMq/vM64EuQxNF9eTnZjMt+o5W9keBlTtpHh9e+w
         9/uh6gK14e672+DdkpCh01webabxs3pWYf6ERSLZqk5wcrxmdgg9I+1tH10GIUfeeW9k
         +PUmJHTZ0pG+dpW5BlZNqMBfhptOv28UReFu/FahpXKasddSAQAbFYJou9/CE8SoX5HQ
         QXw5YJjy9EBKID0ZiEG1sn7ygrjeF/5JZhjftscmB+uJNOMcCUsSlJMPTt4ef+4Qd9Wa
         xxb+/2zbEZnSH08x8WNU24cOSXm5RJ2oO4YAjuzRmE4jx6eyKiCe1aTgJmQefJ+u5u7R
         PK4Q==
X-Gm-Message-State: ACrzQf1W+bkZjU4Ma+CEu4zMcTAi9zBrsgkk3FVioNwKA/msfZBbSAk5
        6viXU2QDomWxGhbGwt6YrjCTlUUmKFty7Q==
X-Google-Smtp-Source: AMsMyM6S94CyeAVhtUcro6X5ND/HkjA9cvn45gsoLeKfqmfPRi08nogI6dDjR5RpNWhkCQOxxVnB7A==
X-Received: by 2002:a05:600c:34c2:b0:3b4:7a98:5f5a with SMTP id d2-20020a05600c34c200b003b47a985f5amr3238815wmq.156.1663332962696;
        Fri, 16 Sep 2022 05:56:02 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id n2-20020a5d67c2000000b0021badf3cb26sm5715968wrw.63.2022.09.16.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 05:56:01 -0700 (PDT)
Message-ID: <e085312e-79d7-cd43-169c-0e606f67752f@linaro.org>
Date:   Fri, 16 Sep 2022 13:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/10] misc: fastrpc: Add audiopd support
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <20220909133938.3518520-1-abel.vesa@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220909133938.3518520-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/09/2022 14:39, Abel Vesa wrote:
> This patchset adds audiopd support to fastrpc.
> 
> The v2 of this patchset is here:
> https://lore.kernel.org/all/20220902154900.3404524-1-abel.vesa@linaro.org/
> 
> Abel Vesa (10):
>    misc: fastrpc: Rename audio protection domain to root
>    misc: fastrpc: Add reserved mem support
>    dt-bindings: misc: fastrpc: Document memory-region property
>    misc: fastrpc: Add fastrpc_remote_heap_alloc
>    misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
>    misc: fastrpc: Rework fastrpc_req_munmap
>    misc: fastrpc: Add support for audiopd
>    misc: fastrpc: Safekeep mmaps on interrupted invoke
>    misc: fastrpc: Add mmap request assigning for static PD pool
>    misc: fastrpc: Add dma_mask to fastrpc_channel_ctx
> 

thanks Abel for picking this up...

Tested this series on SM8450 with ECNS.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   .../bindings/misc/qcom,fastrpc.yaml           |   5 +
>   drivers/misc/fastrpc.c                        | 260 +++++++++++++++---
>   include/uapi/misc/fastrpc.h                   |   7 +
>   3 files changed, 240 insertions(+), 32 deletions(-)
> 
