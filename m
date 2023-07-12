Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4A075136B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbjGLWMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjGLWMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:12:53 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2381FF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:12:49 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b7430bda8bso5093281fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199967; x=1689804767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkGA8tuEErOePoNy3EdHOL/zl3SZc+Vt0Ew0ErvT8mU=;
        b=lH2FqqhDHHDX36mNRP/QdjgoIz4yvtCqadkC3gKCh3ThuFdDHClo2jZlds1KG8lkwN
         gzJ1nKu4NQmKv7GICs9P1ecvCJkvJw6tau5QrWbeD95xUjPB3Duf0Lw0GYL96cnksZHx
         ONM9++tCPFu7CDYRl/fufHQOs+oHp46HtoRhfKCd0WZJw/zx/I1QjB0QaFIpjaJ9ULbH
         r+2nn+E3W4BeDZHWXZh8+igM6t4tIQcxwsup201uccwvNPYAUgJ4mAM3A1NQW1wS/dyV
         9TNhoN3C48NRAj8nzMNhcUBeTV0x7r1ZcNwq/v4AGTCw00Ub+B3iePymOi4M25mUxDbo
         xSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199967; x=1689804767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkGA8tuEErOePoNy3EdHOL/zl3SZc+Vt0Ew0ErvT8mU=;
        b=ZbQ54Inl3eKS0lHe/v4aS1eLjGYFgEHvufA19S6LMTa//P7er/nQJdIW0VGNxUfP3r
         m0PdgSL4bYNCXOXMpEgTEnqRqiEV9xevgW51GtMRMLDuSb7wUfTR1cxM339sBEfYsFHK
         +YI2DybSfYdJg1ZAyMqX288U+LskFf460lxp/OhNXfRP5xjhKHPyKh3IB/Wo18BcuFFk
         xnl/t3ferFyysWd3d+7y9dwb1E4LXLMpRJlyD59lu+jvO8S5pnd/rb5LZxedNwf+nD2p
         vm2mtd6xkSDmBnQ5qFLVp10s2Yey6/4QoXPaReoNYr8DvJhL25TXtWsYjxj8viM/0+cW
         i4zQ==
X-Gm-Message-State: ABy/qLZQN6V5WAhx6UXiXrVdS00wkatDMBtILt9SR1A5yLk1U+9ESiV0
        8O2FVqAMW14RTAbYR3OuVI9Dhw==
X-Google-Smtp-Source: APBJJlELSBRlCxDuYvGE7L2An9o9WYKFyL7A0pAsvhe/Ya45rkgFuRs7wWsnMf4bQu4Oushng93JFA==
X-Received: by 2002:a2e:9295:0:b0:2b6:9ed0:46f4 with SMTP id d21-20020a2e9295000000b002b69ed046f4mr18641190ljh.23.1689199967579;
        Wed, 12 Jul 2023 15:12:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c18-20020a2e9d92000000b002b6b7a98c4bsm1167725ljj.77.2023.07.12.15.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 15:12:47 -0700 (PDT)
Message-ID: <005a1c19-2ff4-f00b-6c88-42cf343651a8@linaro.org>
Date:   Thu, 13 Jul 2023 01:12:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/5] drm/msm/dpu: rename all hw_intf structs to have
 dpu_hw prefix
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
 <20230712012003.2212-4-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712012003.2212-4-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2023 04:20, Abhinav Kumar wrote:
> dpu_hw_intf has a few instances of structs which do not have
> the dpu_hw prefix. Lets fix this by renaming those structs
> and updating the usage of those accordingly.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h    | 12 ++++++------
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

