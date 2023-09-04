Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C48437919E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 16:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343739AbjIDOok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Sep 2023 10:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbjIDOoj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 10:44:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8253210DE
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 07:44:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bce552508fso23042411fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693838672; x=1694443472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kH7WX/bL02gBNSwkaIeLx/wyDLsKZbgUWcH4uKnAa/o=;
        b=brCDj/Wc2dF2RVYr2acJNeqE9L/qhGYSZQ0uadgNiYQqQD6T/U207fMR+Uwf2Q70rg
         t61DkAeSEUGjK+scU2/yIuJnuzE+UahJ7h+Kqr9ATGSkP3icCwD910agWahOadPx2nra
         uABo5KbE+nrK5BzSIHwQcNWcAtqRCcMCLo1QvBATf4mCjq+ZqVFrol1tL7HZLrhtoDrJ
         83RQXhbm0GaTcUwN2A46y2bASa5t4jFjfG3h4XtHblGVYnCOFfKV68zPD4h8oPEaaesN
         oT35Hwka/lOB68M963Vjs06YLoVWxRu0nO0NYKfXVsk14zt9+scgJbgykn0jHS9mxCFg
         SkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693838672; x=1694443472;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kH7WX/bL02gBNSwkaIeLx/wyDLsKZbgUWcH4uKnAa/o=;
        b=K/JEKl5c0s38aJ9Sr1H/x6Xg3xa5tjjl/XRAktZ5Kr6FQk0OxgsHikyt0mQta5Mhqv
         +zMyk6z+3kxOK7fu5E35h6xjZXYMkyr3d2paeP8LtpbZ11hkwTpJ9qxKPq/FfQL6lac8
         qGVHPYxOsPeUhNYPqKh9VoE190qv4bIyQ3KHEB4/Vn/hGbN29iSGSzOHxi76cIoqPDdx
         eoZ3S/oSLHX/EwSHLJiX7DrbV+eUSFRYsMMGZ7XZdfqO/hShEsbWTT4rQ/+8Bs4Ykp4O
         C5/J+6k6vH//hY2iU+JIQBsAFzFltEaxtLJJjBgt8gN1jDcSFFTBUjcfsr/2LXD1GJmJ
         m59A==
X-Gm-Message-State: AOJu0Yz4jyqBrhQkIHJeRjlxMko46Yx/Db7c1VMSkAikG/jky9WjqtmF
        wRFAPZOG9+TeOO9rrwfNZQ+JZQ==
X-Google-Smtp-Source: AGHT+IEErqFoQDFEzrD9081gh8cXtiVUP+rR3xhizgoZsbXsVV7hp8UJS6hWIuK/ebDqwwBDgJ6ljQ==
X-Received: by 2002:a2e:3e15:0:b0:2bd:ddf:8aa6 with SMTP id l21-20020a2e3e15000000b002bd0ddf8aa6mr6774021lja.23.1693838671794;
        Mon, 04 Sep 2023 07:44:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e7a0a000000b002bce8404157sm2177440ljc.12.2023.09.04.07.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 07:44:31 -0700 (PDT)
Message-ID: <9bfdbcb5-bb17-471c-ba79-5e215e440928@linaro.org>
Date:   Mon, 4 Sep 2023 17:44:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_ini
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Of course this should be 'drm/msm/dpu: drop DPU_INTF_TE and 
DPU_PINGPONG_TE' series

On 04/09/2023 05:04, Dmitry Baryshkov wrote:
> rop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
> performing the MDSS revision checks instead.
> 
> Changes since v2:
> - Added guarding checks for hw_intf and hw_pp in debug print (Marijn)
> - Removed extra empty lines (Marijn)
> 
> Changes since v1:
> - Added missing patch
> - Reworked commit messages (following suggestions by Marijn)
> - Changed code to check for major & INTF type rather than checking for
>    intr presence in catalog. Added WARN_ON()s instead. (Marijn)
> - Added severall comments & TODO item.
> 
> Dmitry Baryshkov (8):
>    drm/msm/dpu: inline _setup_pingpong_ops()
>    drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
>    drm/msm/dpu: drop the DPU_PINGPONG_TE flag
>    drm/msm/dpu: inline _setup_intf_ops()
>    drm/msm/dpu: enable INTF TE operations only when supported by HW
>    drm/msm/dpu: drop DPU_INTF_TE feature flag
>    drm/msm/dpu: drop useless check from
>      dpu_encoder_phys_cmd_te_rd_ptr_irq()
>    drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
> 
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 52 +++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
>   7 files changed, 75 insertions(+), 83 deletions(-)
> 

-- 
With best wishes
Dmitry

