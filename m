Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A08709D80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 19:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbjESRGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 13:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbjESRFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 13:05:49 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F18B9
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:05:34 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ad89c7a84fso39053111fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684515928; x=1687107928;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tW+IfBA0g2S68983Q4GYfBwGicfanmeJ7cJ4NzLrmh8=;
        b=V585xRsm8CcsnplbCQ6v8bRSw8NP67lu8Y6qp3MaQdh6U4ysP1qSomULxwiyVhVef2
         9b7QW3V0gmptgFhTqIAONlnbRoPWpnZmkp2wBo4S7Lgt9Sw5CeDaoEXwsQtwJZ/5XBOw
         iZw1pi6OYtwzOFNxcz7br42D7dZVChsjBND4HC2K8zpCWneTFOt2jffTWfcwtGiJ94Er
         mFn4RCoJnGx8/J2n0shYt0Ani4J3Kbq9KPC0gXzsOyY4w9ewPdlfa/3nzjvdAfvxT06E
         ELLKks1QOZdU4+NUxLoCHQTmSwrLx4xHJbj2l9Ba9qvrz1qNghS8FwFkhfO0MBXBo/tJ
         htow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515928; x=1687107928;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tW+IfBA0g2S68983Q4GYfBwGicfanmeJ7cJ4NzLrmh8=;
        b=N33eEqzxJneLWswxIIa2wg5h64wXrgKBIlVkdDKDRN3/GCJdvnB6L/0o6EnGELnfLo
         CyzDMHnB+13M1CT6/8nrygcMW/iiQZQwC/nULUV5EAZRHqL4uyjqQbvjrlwUfybXocOZ
         UPQ7badr1Fkwhc/09nIX0KARmCrvQDHLzrd8i3rFjsitgEWw6edbO4RMr7cu9zeD6got
         dz8IEzhyT4l5R6rzVo08W1ru0EwSuAbEiGNEWAuA1yz2z6CrLrG+bmWlUcA9xQpSr6Kh
         wXvQPAchffmveZSBz1/Q884MHzhrCsYNYxJmI4LjBz/cy7z0/KnQq4ciLMwCHwlYCZwI
         0Q7g==
X-Gm-Message-State: AC+VfDx79Oyx2g62KzEFP09mZq8x6vmYNmsyiHy/jjsSYYUcCfQ+Jecl
        7U8UHRq2BrbdH7kL+v/Y/kuJYw==
X-Google-Smtp-Source: ACHHUZ4jcrhQebDwz+TmRvBxTkMDnYkD/uxxsLi4fsiBGMpuMGr4N8G5ByGWy90gcsy4dRWMJgQvTw==
X-Received: by 2002:a19:551a:0:b0:4ed:b329:5d85 with SMTP id n26-20020a19551a000000b004edb3295d85mr930426lfe.15.1684515928421;
        Fri, 19 May 2023 10:05:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y16-20020ac24470000000b004f138ab93c7sm648541lfl.264.2023.05.19.10.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 10:05:26 -0700 (PDT)
Message-ID: <590c8225-e5aa-5195-51d3-a1a4738d6bfa@linaro.org>
Date:   Fri, 19 May 2023 20:04:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/msm/dpu: drop the regdma configuration
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230519170353.3936443-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230519170353.3936443-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2023 20:03, Dmitry Baryshkov wrote:
> The regdma is currently not used by the current driver. We have no way
> to practically verify that the regdma is described correctly. Drop it
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Restored dpu_msm8998_cfg.perf, incorrectly removed previously (Marijn)
> - Also dropped reg_dma pointer from struct dpu_kms (Marijn)
>

Please ignore this, I forgot about 
https://patchwork.freedesktop.org/series/116782/

-- 
With best wishes
Dmitry

