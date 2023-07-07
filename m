Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B90274A905
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 04:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjGGC3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 22:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjGGC3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 22:29:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9681997
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 19:29:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fba86f069bso2100692e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 19:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688696977; x=1691288977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3ZR+ulk8qafSu0U6ApGONxyBOmiZshWsm+62zV4VR8=;
        b=SeutLac0YZ4NSuTvHgwey7e4gFIEN/mFlfmlV9rFaaTwqilhz1xZwH8yGbrLx4Xt+F
         GhjRL4mAyHn2S0pnEGPOUO4HUuiCEXWweuyL28ywnasYvxbdMKZdwvGKi+Q90yKe0GZf
         JOf1MDiETLRDO5HFQvFRZ1719feRk2NTcQ2nda2wPKxsM5DizxYnLt1FkO+jmMGY3LUr
         4E0hYnoelzhcG9QhszgOKTgnpE9IAcTjg7lh7P+tJULS6im7eNn+8CKLviizFKl0yXLG
         bEsaKbu7u31r8bT+7zhYklp2H5d+mbBaAL2VvDsoaJMGpYt4pAHiTt7JjKN8Zl1RFZis
         5heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688696977; x=1691288977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3ZR+ulk8qafSu0U6ApGONxyBOmiZshWsm+62zV4VR8=;
        b=iKY4CzcqclLQQ/vB3qaYEAuBgS+IoqwOgR7TVI0ymmbuE8VVK16zmM4GiSFdudb3mN
         jrGD1SsS0XI+lI0YmsacaPdzU4uKdQ8QDLiLEU9Ldl0v0FRvTQKXucQgKTkvYl9bBqOQ
         CEpHG6a8nAiHCthVeaSazVVmLamqEfg0+zSOKDO0UBc3oLmZFebIhroYAIt2r6hnGM58
         A4bdEc50Twr5qgpjtlTbeR2qaPB27Q94uy3XeN/uusdNL3st6FS8McYqIBB3qYGsz5Ly
         EwDAIsEdtLmKGH1MbxEj/ONPtBSfq5N7om/8VbnLbcQIJi9GCTBhHgeEBaoYW7Zk5iGi
         YEUA==
X-Gm-Message-State: ABy/qLaSw2hSod449+3iQIpIqTDteA+LNDTMDNeEGT18iR8k0KCnrutP
        xu9Vjve5+HSj3UpvZVA7Fq6y5A==
X-Google-Smtp-Source: APBJJlGtzPjV14lMrIL+sZHD5ek9tOBcAzPG8LZjViHzqzrNlekFyda7ViGGtRfR7kU0hP1Z8p+ubQ==
X-Received: by 2002:a19:e04a:0:b0:4f8:5e65:b61b with SMTP id g10-20020a19e04a000000b004f85e65b61bmr2351048lfj.65.1688696976952;
        Thu, 06 Jul 2023 19:29:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w7-20020ac25987000000b004fb8ff1f531sm478578lfn.70.2023.07.06.19.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 19:29:36 -0700 (PDT)
Message-ID: <60df0f9e-9a9c-e55b-6cab-3d89dd90bcdb@linaro.org>
Date:   Fri, 7 Jul 2023 05:29:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is better to explicitly list it.  With the move to opaque chip-id's
> for future devices, we should avoid trying to infer things like
> generation from the numerical value.

Would it be better to push this to DT? I mean, we already have a 
'dma-cache-coherent' property for it.

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>   2 files changed, 17 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

