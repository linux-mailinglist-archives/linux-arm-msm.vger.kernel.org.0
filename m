Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D014710361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 05:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbjEYDkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 23:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjEYDkg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 23:40:36 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F82BE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 20:40:33 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso1308233b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684986033; x=1687578033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCvoKrY8dd9+Q/pN1yCXWPMzhbV2OgM2HZjKi5ItOYg=;
        b=T3hHMk8KKSx8DqbWGNA7oa+tLWZKWo5p2ZUhD0VcuQ4ykgTgOx9GeJtYKDNGfeK/SL
         zawp/rx7Sw/KiQam2QU71Dx/Wf7VC/1xovlRvBejQlFg/wgCq87OqeyIMHZE8qmbarSy
         iwTeNXYWq6T0gPUYv9N6elmUngX5W7Fofowy7vATgGIeVfKwVDWhKFyJWIQ+I4OwcR6o
         D/Hr8W4DawDx9UcSSlKHs0KPU9KUgcj+GfNgRuiCNY4k4prvPhctyN+3zh/ho/1NTlk5
         BUd0rMqS2bxOBrYWiSnGaY4KHgFfGacwMRI9E4r0G/3Ak2kOtVl7VW5JfqhhplJIwK94
         14Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684986033; x=1687578033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCvoKrY8dd9+Q/pN1yCXWPMzhbV2OgM2HZjKi5ItOYg=;
        b=IfT1/VS7yxfV9HakeUiXNlGfzAPdq8DyVbNlCmWgSC3zEUGR1AOCTjhohzp016a0G+
         frXc3Yl/nABlg1vtuc/MlLxfbWhuzfXwFuaTKGh1iMjVkJXw/vtDNA4yVPH6vMRwEC0/
         SRnGzAv00LO2v8YgGezoIvqW9c5dO9SdK38ePl9MxGtVqn4+PjuclRoPITOiVRq8UWRJ
         mZCiXn0iD4WS04f8OvD6H7NwP7PPhzi3ZLjFD1f6Lj5ZfwTNY4NyK2T9Q4l129h0hjMk
         WqqK1rt6XazNvbL63zU0Mrp8NSBdHI80b6SbogPOx2kruMH0RnwPN1psZJSoZGbXg6Hy
         VPzA==
X-Gm-Message-State: AC+VfDwF/P8MI3fQtlyS1oIONjf0SHEWxYlp3Qb3s4a02Wpooxiv6s9e
        wuiCpGrJ+gCLCqrcsDUDLMOrzg==
X-Google-Smtp-Source: ACHHUZ4K2F72irG192E/C2ZC/hrkB10DNT9SkhTSN29jyAic+IcfybdeNC74YeRf00Du88A+0sOt9Q==
X-Received: by 2002:a05:6a00:2d1d:b0:64d:3e7f:7121 with SMTP id fa29-20020a056a002d1d00b0064d3e7f7121mr5672834pfb.22.1684986032719;
        Wed, 24 May 2023 20:40:32 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id j15-20020a62b60f000000b0063b6451cd01sm179468pff.121.2023.05.24.20.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 20:40:32 -0700 (PDT)
Date:   Thu, 25 May 2023 09:10:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        ilia.lin@kernel.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, ansuelsmth@gmail.com
Subject: Re: [PATCH v2 4/4] cpufreq: qcom-nvmem: use helper to get SMEM SoC ID
Message-ID: <20230525034029.wlitykc25pssssii@vireshk-i7>
References: <20230524162329.819770-1-robimarko@gmail.com>
 <20230524162329.819770-4-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524162329.819770-4-robimarko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-05-23, 18:23, Robert Marko wrote:
> Now that SMEM exports a helper to get the SMEM SoC ID lets utilize it.
> Currently qcom_cpufreq_get_msm_id() is encoding the returned SMEM SoC ID
> into an enum, however there is no reason to do so and we can just match
> directly on the SMEM SoC ID as returned by qcom_smem_get_msm_id().
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Utilize helper exported by SMEM instead of refactoring
> qcom_cpufreq_get_msm_id()
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 55 +++++-----------------------
>  1 file changed, 9 insertions(+), 46 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
