Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6B7661B19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 00:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjAHX3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 18:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjAHX3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 18:29:19 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533DC10043
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 15:29:18 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f34so10457707lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 15:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
        b=CiuDQBy/qJQ87Xz9VOezGSflqPnj3lXtvtt7iDr+c8eky0iXrkd/ssxJDRvHuhLpXv
         9YLK0p+b1zqAlvG+/kIHdXFdW65Tznz3XJTqmiPB20M8CwSh8GV2RLbwOtplHGn/WImv
         HsJ+dtiXAJP9IwxDjcYDCCIeDpvSwBxsh5fI2fWET8Y9bUyr30bp6uc/TEBSUfttvTd/
         Stg4mG7kChcSNPn51POGjV5/jEl/q2I/q3rgWByVEg6tp8bcv8CmbBVIRTaaK20Oz8gV
         VzNINsauGqt2hsJKATn9KmVqsnGxyai84XgZ7vQiX4ddCrhxjawWojXMYxTz+HARzYyh
         5AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
        b=jbucUxrktvKihsG42BWzU+svxv2Vy5VgaoY8xcUuUXrhY7qVUbj5661f8i1MZAqaiT
         7vzyoYAoA3UG54+joz1D32hP+9M2g1VHhDow4D0ZJR6JAVAj06NsX3vwjjp9kFPhh93f
         FbUEqzf3Mx2HBxa+UN8pp+f3zL1NkuvHz03qm/g4HL+ZGXSBiHqVvKHGItjugUdoAsv8
         4nBEMefyJGpFyjg0S0rrYUOC0cMsO3emMy5qFrN6Q4phP5FzJ9NJ5EJgBWDGm2B/a8Al
         F93Ig0OvHOmNWK1eEuCSUpLwcG9u9K72PwunKlHKiagS/GUa9u0QLUo1OVeyrOR/Duz/
         017w==
X-Gm-Message-State: AFqh2kqme5vG6HMvTAjMLpUXNPm67UHAizZd974k3HSZR+H5faXIapDe
        lX6YCVK8TgHL9VIpEBc/yNc7Hg==
X-Google-Smtp-Source: AMrXdXu8t5pfKS4rJQB9w2fmYZWbGOdVt9Co/jrV0noSh0NCRbIwq1U+45wR8Qydaxpx9ytF9YSmoQ==
X-Received: by 2002:a05:6512:22d0:b0:4c0:5798:38df with SMTP id g16-20020a05651222d000b004c0579838dfmr21545854lfu.27.1673220556738;
        Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u18-20020a05651220d200b00494a603953dsm1283513lfr.89.2023.01.08.15.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Message-ID: <06eab036-7c0f-55d5-2ad1-cfaf5dc0cc8d@linaro.org>
Date:   Mon, 9 Jan 2023 01:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: Reject topologies for which no DSC
 blocks are available
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-6-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/2022 01:19, Marijn Suijten wrote:
> Resource allocation of DSC blocks should behave more like LMs and CTLs
> where NULL resources (based on initial hw_blk creation via definitions
> in the catalog) are skipped ^1.  The current hardcoded mapping of DSC
> blocks however means that resource allocation shouldn't succeed at all
> when the DSC block on the corresponding index doesn't exist, rather than
> searching for the next free block.
> 
> This hardcoded mapping should be loosened separately as DPU 5.0.0
> introduced a crossbar where DSC blocks can be "somewhat" freely bound to
> any PP and CTL (in proper pairs).
> 
> ^1: which, on hardware that supports DSC, can happen after a git rebase
> ended up moving additions to _dpu_cfg to a different struct which has
> the same patch context.
> 
> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

