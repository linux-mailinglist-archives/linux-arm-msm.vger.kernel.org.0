Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB7C752B40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 21:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbjGMTy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 15:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjGMTy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 15:54:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85F51BEB
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:54:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2008113e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689278065; x=1689882865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clKkWtxyIkXw8m8IPPcWm+m+9Les5D85yWZ8cKKD4C4=;
        b=q2ci3Fg5IDYue4GUurlh8oSWpoKoWUbddB9onmk3dtjRpr/fG241+YOzBNG5gDhLPs
         HyBATbDRHQKAuk09Ep6lclx/HPF9HSoiaH+CC6FQYJlUtN/yOSuwIj6iEqDRmhqIdyWX
         fZ4dZr1Q6l5YU6ly6EesBk3uJvx4N5kk/jPjhzJ2dwkSMJGCl+ioH3l3KiFJkC4y+Wls
         lMVgsNQhSroheCK68gLwVILKP5gY2gVBAcGsq6PfYswFSSn8Bxv/fGYrQjEHkmP0lrWS
         LFLKg+W6u1fLU/Al2pWQTqnPUw0rCy5RtwXxUaITlYs5Fdi40icc0ugmK1A/hGCcPR6m
         orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689278065; x=1689882865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clKkWtxyIkXw8m8IPPcWm+m+9Les5D85yWZ8cKKD4C4=;
        b=iE+zXu6T2Hoipxf5DgZ6X9AuIe1Rtjhna1HNKJt+FDg/C5msCcvfjR6KWCT+Xz0GJC
         PrmvqtP0s8EFR74EuLpxgJmEF1kZKeEOX4m5NR1xIEfVwqfGotVLw/7xQ1DPz9VqomYj
         a7Eta6qOVVmrWAkz6UGPrCrzxeOjli3qLzpZBoYymAcX75iJw/XJr4vgos2qH5wBzEST
         KVNrdivKw+7msNGV2vQfEo6eRwqVvSlCxucxqhV1vbgTc4RXa5eZtP1Vty3ozOb9v6Bf
         Gpas6F6GU5ANXc8lObyGgxySDH4tUWRbll0tvJjeJFNl4NAZdFOSztC2+L2VhSdY442E
         Ydww==
X-Gm-Message-State: ABy/qLZIpUKf1fmZtLmX9RZ20lzGtQ9apvPdVkpRzDPmhJyYLy3mPNlU
        E3C+5QS23rF4ah+GA4SrkE30BA==
X-Google-Smtp-Source: APBJJlEr4b8PNjVA6cMuPyGVfwcyOhtVJssLA+dgVHImKP5zOosdDhmTMJ688RkYWgCS7ZSpKCje6A==
X-Received: by 2002:a05:6512:1146:b0:4fb:745e:dd01 with SMTP id m6-20020a056512114600b004fb745edd01mr2000432lfg.45.1689278064980;
        Thu, 13 Jul 2023 12:54:24 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x1-20020a19f601000000b004fbae51d1a5sm1206841lfe.295.2023.07.13.12.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 12:54:24 -0700 (PDT)
Message-ID: <826ac576-7a9c-b9da-c572-fa74424ab34d@linaro.org>
Date:   Thu, 13 Jul 2023 22:54:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] drm/msm/a690: Remove revn and name
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230704163640.6162-1-robdclark@gmail.com>
 <20230704163640.6162-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230704163640.6162-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2023 19:36, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These fields are deprecated.  But any userspace new enough to support
> a690 also knows how to identify the GPU based on chip-id.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 3 ++-
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

