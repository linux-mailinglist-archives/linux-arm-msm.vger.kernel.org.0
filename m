Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38842708A0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 23:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjERVGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 17:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjERVGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 17:06:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F44136
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:06:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f00c33c3d6so3040894e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684443976; x=1687035976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fRCQUBUSE9kt5x847YU0nJ6a6ueP70DQZSZhSAsujA=;
        b=MFJ96x8VdbW74WOiWAaqj3AH0hGnWlM21ZKOMVOx0TiI2gmUhfeCrxNF3tjXzjk8JR
         y+uGpMIBu2C+gkNqreDb1Z9/cE5Db+X8lKcB060ac7G84OTHdOEiUHmuXMTSBR+PzVZs
         2/Obdk3UQpYs+Wtf/0clth727xP9bvSqRQ30kU8+OprvkmpYrHlKulihXDonCR8mFckl
         piATxyqQsuKZYsrd9ycz751H6DE+jFfxGq+bKdslKmp74dMN6BWfhcdNuMnnaTd3Yy+s
         abrUdClWQYYZB5eGDr8xui66oNv0tAjHUqQZOvMt9seHVsoJUSkOay2HPXe3zDEo9ekf
         XB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684443976; x=1687035976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fRCQUBUSE9kt5x847YU0nJ6a6ueP70DQZSZhSAsujA=;
        b=Sr5wJBBXgGy4hrgxxnksYCDYOulPfiRgoeYIKtjfXIEMMiUPJn4QuCqrgcOWJ/MYDi
         DAGPWuV+alKCE3vCMdGK5ICRBTaCEAJZzJx9bVd+TsbE/omFKIMaSe1n/aYEgLp9sGd5
         J/JAu2up0ThFpGHX232aFzUZr68mw/6VVBya1A7OEioda5DGQjf4dEdUSIC+PgUoNs+s
         E6BwBr+4t1EOu3kVWAXv6LlkolbiDFeha8nkCiLm3EYNEixPUE/xNEVUeu1TQTGTW1wj
         QBuXZOdyKsVzIvsSsG3mJcrDLH2hiYqBHk4kbzjHkK84YNfEVsO1Ar0F1rbrg2+q2HIw
         /Zrg==
X-Gm-Message-State: AC+VfDy8B7rJYN5sOn/doYBJodBd4LSbcNcjL1Fn9nfVvSzakECf6oEL
        Vjr6vFgZ0WxX/L77P8bbD7U8hw==
X-Google-Smtp-Source: ACHHUZ76Q+gFfXkGnJhl77tjg89Dl7Ijr1N4x6Vskg+VkFxnEqMGO1zjsU8g3AaGajet9ZOp3VHuTw==
X-Received: by 2002:ac2:54b9:0:b0:4f3:a430:cea6 with SMTP id w25-20020ac254b9000000b004f3a430cea6mr66077lfk.51.1684443976186;
        Thu, 18 May 2023 14:06:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e5-20020a056512090500b004f0199e8770sm371434lft.65.2023.05.18.14.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 14:06:15 -0700 (PDT)
Message-ID: <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
Date:   Fri, 19 May 2023 00:06:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
 <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 22:14, Marijn Suijten wrote:
> On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
>> The src_blk declares a lame copy of main SSPP register space. It's
>> offset is always 0. It's length has been fixed to 0x150, while SSPP's
> 
> It's -> its, twice.

Ack

> 
> 
> 
>> length is now correct. Drop the src_blk and access SSPP registers
>> without additional subblock lookup.
> 
> Note that the block code still calls `dpu_debugfs_create_regset32()` on
> "src_blk", do we want to rename that?
> 

I could not come up with a better debugfs file name, so I decided to 
leave it as is.

-- 
With best wishes
Dmitry

