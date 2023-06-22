Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E2973AD89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 01:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjFVX7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 19:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjFVX7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 19:59:07 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FA5212B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 16:59:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b47354c658so1722111fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 16:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687478344; x=1690070344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyhmYJx/oJKFeU+NO8Awpq9ZWnYSt6vLG+dti5DQq9g=;
        b=ESLQBcZZpKSOVu3J2i5wbB7Ok/kWC3yma/hppJwAt/ZBZZhaWfjIpxBAfo8Ri3dDxe
         331ldYN7HKvXpTZpWHZVDtQ1SN+Nwwk9+lQx5D1JQ+sleueJ78pfsAgiKkgFrDREX+CD
         jy8aAY15uwcKQblhuZUXt1axpwZ5F17yAHKehQBp712ZTjUXkO10NpZvF0+wa12l79yd
         Z2W4oATLugH9bzogNVvUpWcExWkMxbKUtlpbeb0aBXHLCXnt3CiXf6VeUm0m4VWF6soK
         /Tradn85RdK4GDGxQ4iEoOPVUcNp1azMDrm+zoh2VSG7b5b0b+T6+xKVY0ftLw78SSSt
         rX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687478344; x=1690070344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyhmYJx/oJKFeU+NO8Awpq9ZWnYSt6vLG+dti5DQq9g=;
        b=JMRVoWLKxO/S/2sVftaDFgXkB993FyNAxcqVvfacQHrEvsS9SXMzK4r6zkPH+8Bo9k
         ttF9IG087Pv1EwVcoMkz12g5yoGMdHTaJSG59P8I2rDA/VkkKxDe4D2k/qI0qB4GxTBV
         VxgYJr7YcPaViXQA3c3Ti/DoNuGAfN6JqYBAtzqwuMU+KFKAxkWemMzuWa3V++4dDxto
         RdcfJa+W9OaQt771UB6yXMIAdpXC4wdvWw9zWBIVx2nhs3+Oy7yIrd7KCRrMM+8uAIp6
         nrVVHtMBRCu1tdYBCh740mP294r02+695NO8r3W+oDxdHS1KG59nlPf8kltJueMTpxF4
         Xd9A==
X-Gm-Message-State: AC+VfDz7KJi+UgWxuqmPaydnXVbD0V0N4IIh5GENY5KqNiGzdAOI34cr
        E0qZex8hfBRidEEuknCJeqCX1Q==
X-Google-Smtp-Source: ACHHUZ7uBnBOQeXQK/Qk8WLcwAVG8BL2oOHHK1g3QEaFZxzrfxsycpxyc2v14BJUHtDT0JstJfZatQ==
X-Received: by 2002:a2e:a1c8:0:b0:2b1:a810:e43a with SMTP id c8-20020a2ea1c8000000b002b1a810e43amr13441236ljm.34.1687478344174;
        Thu, 22 Jun 2023 16:59:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x18-20020a2e9dd2000000b002b1edfe817fsm1495978ljj.88.2023.06.22.16.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 16:59:03 -0700 (PDT)
Message-ID: <fc458e8d-9821-23cd-6a73-264ff6f04226@linaro.org>
Date:   Fri, 23 Jun 2023 02:59:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] drm/msm: Update dev core dump to not print backwards
Content-Language: en-GB
To:     Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-1-3b2cdcc6a576@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v1-1-3b2cdcc6a576@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/06/2023 02:48, Ryan McCann wrote:
> Device core dump add block method adds hardware blocks to dumping queue
> with stack behavior which causes the hardware blocks to be printed in
> reverse order. Change the addition to dumping queue data structure
> from "list_add" to "list_add_tail" for FIFO queue behavior.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

