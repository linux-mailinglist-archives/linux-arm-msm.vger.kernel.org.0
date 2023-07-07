Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF19374A924
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 04:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjGGCu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 22:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjGGCu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 22:50:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD90119A6
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 19:50:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so2062741e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 19:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688698226; x=1691290226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00kNjJBOwj/f6fk8hpRTnmkUyuTEHOQtaN5OiuXlYH0=;
        b=S+A/rblWHFXCOq25xF/GvZAInClqSzYxTB1MRS2/CBoydnYtyuZEfXpKPBOL1md91I
         WEwLBlCi5TjkAgbp+75JEkD2bm4VE1GosRsFwVlX54nHZE5ctMxYC5eR2j+eFUblTsuF
         DzzWQ99bZpW6fbotRQpHBtkIbK3ETBLQRAYtX+GX5BmV1zrT5EtGWoeujmd3Fi11+NWH
         CvOsM+D0U7Z9g14QJPkr1sF+2NvE1o3hVzFJJBqXxyJFZz27knoQWrAaoCuxgBJYmFod
         XUFPHtdXc+6SYEL/PT6a3bpkZpddb4865BLb7KcT+KwsMvTjTbWQY8I5DsJcwd7DvqI8
         HUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688698226; x=1691290226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00kNjJBOwj/f6fk8hpRTnmkUyuTEHOQtaN5OiuXlYH0=;
        b=VVHv8Nb10Q4CrAgBWcCCiM/HLjw/vHEF/M5ps/yyPVqk6On9jbrJ1Ljn9ZjE8aag1j
         4UbOmB62DykDf9x/5DsusYvvy3wRv+MTpq7fEAEHnaSo97cy62yr5+vj0vmb/CBfYuEh
         RDCQHcTSxOUMthRMy7IyM1Kv3P1cmMdVXjl2UzBJzKwe7xVw8xg6yDtlN0hdR5dwWlPj
         5Lz+jHYn4frAsmgVXnIH76SEQDkeGGUL25GKxzHp2m0BHWYeiNmD2Pqjut2QbPwWQRYa
         lyAeiWaAveM3bcf8bLN9tdIQkRSwaAxEg4d5eEfhodS4xzNRWGb1CVGQ3qMKrrMXEUa6
         6fgA==
X-Gm-Message-State: ABy/qLa5ZHEcVk+haVXfhqx8E+UaL5NvZOe8XCFBAPEwPlurGjeBJrYs
        lGk9kYI0R95QLjSUXbY2cuP+RA==
X-Google-Smtp-Source: APBJJlGG3OOx3uOszRFHCsgz1WFUvb99qSo5mig/O4sfB+eCBGIOt6A1Bi7Vt0J7P6G5fyFh/56rBw==
X-Received: by 2002:a05:6512:4023:b0:4f9:5316:d5b with SMTP id br35-20020a056512402300b004f953160d5bmr3339332lfb.64.1688698225938;
        Thu, 06 Jul 2023 19:50:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2598a000000b004fb74cb9664sm492786lfn.94.2023.07.06.19.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 19:50:25 -0700 (PDT)
Message-ID: <6386e91d-0307-942e-bad5-7ddc877f1c73@linaro.org>
Date:   Fri, 7 Jul 2023 05:50:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 10/12] drm/msm/adreno: Add helper for
 formating chip-id
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-11-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-11-robdclark@gmail.com>
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
> This is used in a few places, including one that is parsed by userspace
> tools.  So let's standardize it a bit better.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
>   3 files changed, 17 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

