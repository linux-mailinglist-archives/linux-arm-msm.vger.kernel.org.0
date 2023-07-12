Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D3B74FC3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 02:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjGLAhe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 20:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjGLAhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 20:37:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6201999
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 17:37:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso9928666e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 17:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689122250; x=1691714250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIi82mIav50rgl7/i1S6zJ35MB2YBgS4vD10tupyiIM=;
        b=PMX60v9Wj4yVzlU7csKWO8NovlgC1PmkVLLiEJVDHC6MSuQz9p2Y+P2trZTa2umiEe
         44r3S9irSJmOOxPFL3XPujI6CP/1adARtpT2FcKr2hmP7l0+hS8BPxHNeRvA2ZW5tPRt
         27u6LPMN5CGsBVKslfhCvtK3SBgrE+qLQ8Qvrb+9VSSSaV7ZAxjoRAblWPmCn0EWet8f
         q5TpqOB4ZLkgRwDnIoLMFVhv8Wt3pf96B03wbPspp8ZA+WJ148cYG/jqrB6vqjREOmIT
         /hJcWhK0MyVg8/DgeZs5JVKRIkna2aqyazlKDk3Bbrwc3D7VD8lhHfbnan1OqlDKlQOc
         ZIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689122250; x=1691714250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIi82mIav50rgl7/i1S6zJ35MB2YBgS4vD10tupyiIM=;
        b=CSX/wNTKcOaWkQIcfVhDDbHmr6njF/pY23eDpGppbPC4gSIwCYkbx+G5UQrON4UcY/
         b6TdUDskkpDpT6z/dRPUAK2qh/YzcIFdARQu26SzPvYsdFm4G02IvFvF+F/VcG4j08fo
         Sm1LgW9AIX0xwt7f5Lu/0vPiH7ialfdzPe2z5E3ZVKdTtLVTMYQ9nToTXidUkjPa0Z2f
         U5PrWVAEovaN320lxAz4+vO6K23a6Y8lRcWIDofbbyFB9ni/zYPeGVq4msrHWMWz9KG5
         dcqYIt7Z4ICWfjPHq45y82HnFeyKk1ng6bIt+2E80lc/iwyBsf1Kdv2TsiH/2SLGMEiY
         WxXg==
X-Gm-Message-State: ABy/qLZtkilbKf4lm4geXyikva1BImIr5y/tOT5CUy+mc8BOTLJpKc5N
        lLFBRajf/d/DuEElZSRruxSQzQ==
X-Google-Smtp-Source: APBJJlEgWEjBB8bRx3duY8GLWpLQF01AT/VJrYDS8XXh/El3fsC1J5wasiOi4vDZFsCPOWL7gYdRgQ==
X-Received: by 2002:a05:6512:b8c:b0:4f9:556b:93c2 with SMTP id b12-20020a0565120b8c00b004f9556b93c2mr17499239lfv.1.1689122250780;
        Tue, 11 Jul 2023 17:37:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a05651211c400b004fb743b3ea0sm496552lfr.115.2023.07.11.17.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 17:37:30 -0700 (PDT)
Message-ID: <7fecc1b5-0c06-fae2-bced-990006c02fcc@linaro.org>
Date:   Wed, 12 Jul 2023 03:37:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: use dpu core's major version to
 enable data compress
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
References: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
 <20230712003310.31961-3-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712003310.31961-3-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2023 03:33, Abhinav Kumar wrote:
> Instead of using a feature bit to decide whether to enable data
> compress or not for DSC use-cases, use dpu core's major version
> instead by assigning the enable_compression op based on the
> dpu core's major version.
> 
> To make this possible pass the struct dpu_mdss_version to
> dpu_hw_intf_init().
> 
> This will avoid defining feature bits for every bit level details of
> registers.
> 
> changes in v4:
> 	- split renaming of enable_compression into another change
> 	- pass struct dpu_mdss_version to dpu_hw_intf_init() to
> 	  assign the enable_compression op based on dpu's core revision
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 2 +-
>   3 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

