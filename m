Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA3FA614267
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Nov 2022 01:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiKAAqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 20:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiKAAqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 20:46:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58961403B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:46:04 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z24so18839232ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EArgov1X4gC3+dL4gkFRc7cqQE/ITXTDW6MPfiwBrSw=;
        b=rSH48XY/CPCA2gnjl1xJ+JY8ET4dFqjPIulTNTlhE+pBDGbNpXw5OheBHqtdnFA4tD
         Tu40Dmmf3CBU4/IAOUBn/OnUFDDf2qf7Nmq6+p5KmGlvkGuH+UMbsQofaBRyvQod1GQA
         ip3OABTYPyxh2DEVe7LjzXaez73qQwnyOOdow7Pq9rGM3SYAYJCUZ7TbnzZgteV7JWIY
         /HrKvf92vi9UKWdFTJB+/IQ2ruvH1I8ng+fESq5NKFtvOuu7qZIe9TH0607ncJqyMOF7
         K6xKuBIRv06jzk7th5N20V/KjhSHgtngajUSyEryRC7YRIKB7NpJPfyzTNCafx0ay2AW
         Jh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EArgov1X4gC3+dL4gkFRc7cqQE/ITXTDW6MPfiwBrSw=;
        b=lub+sQrKuwlUhir7rS7szmcGO/5F83ijWH70wMDLiiKuXNqMU619zD8dk94xiuSE7M
         +alsNVCkT52ZGIggUon9gPFj3WTEteUUWpG0Ai5TaPRHhgWKG03gx6Cg6IAlRvCf4Cyi
         FncF0uQJTW44Zk7aRVYBb7vSt9wResnTOv46q/aY0qAJThkpmAFHlUbiIqwRisMLa8Fh
         10zMn/V4eavnCT8qA7BAuTXiBKHAli9gIFQSSBj4rwO/Cg05tNTXNu8bHrs0MUAo/SgD
         hPxPRSnT7+S9gbF187RW/TWpAwyMzXFQw75KbNuKipeGvRlTYViG7sr4gaUNsWUZGTO/
         V2pQ==
X-Gm-Message-State: ACrzQf2FhXNX4rSTs0nAsWy6Eh/HCr9Ynx50/7A9j5E3OTXNPJ5kQBX1
        gQZ4T3he+zoX2yc4CZEwJT2hjw==
X-Google-Smtp-Source: AMsMyM4h6felVH/qGl4RpJK6aD+raP0pmoOvXFggZk3REUimptdDjbfd+YAfJHqzP0isLFRSn0uWcQ==
X-Received: by 2002:a05:651c:1306:b0:277:5cb3:7f11 with SMTP id u6-20020a05651c130600b002775cb37f11mr2627329lja.207.1667263563231;
        Mon, 31 Oct 2022 17:46:03 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id s23-20020a2e1517000000b0026dd4d3fe2asm1570196ljd.91.2022.10.31.17.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 17:46:02 -0700 (PDT)
Message-ID: <80465042-9e29-b496-78c3-70ac8f356869@linaro.org>
Date:   Tue, 1 Nov 2022 03:46:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] drm/msm/adreno: Simplify read64/write64 helpers
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20221031225414.1280169-1-robdclark@gmail.com>
 <20221031225414.1280169-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221031225414.1280169-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/11/2022 01:54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The _HI reg is always following the _LO reg, so no need to pass these
> offsets seprately.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +--
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++++++-------------
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 24 ++++++------------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +--
>   drivers/gpu/drm/msm/msm_gpu.h               | 12 ++++-----
>   6 files changed, 27 insertions(+), 46 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

