Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE758699A78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 17:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjBPQtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 11:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBPQtG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 11:49:06 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CC73B872
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 08:49:05 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b16so2578922ljr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHKHX1HAZBr85iXwo+WtkQELZyFCk6BcVCrttzsLWZU=;
        b=zak29ERZiQt8Id07KJzutrFccKuEBZa/n53O2dbu5L2/sZ6mWojebQbhZTvmDUcjnp
         0ZFrq8l1JsgyqOH/UBUH9NRlfA5iIqSYZM6CWtFEZnCmabWQrXUkQHv1O6KsYdvsCEKw
         e2xOd4tfdbUtjBHZl5k/ZyfhoLGZYjNYo0Q6A2supNUwxbjY+qvtGk1BPUp8GAEKj0vO
         E0KsVX7CLDrgIw6j3mt0fBsZzJGip7/FK1kBKKBz7BeK5goIQjW2IkznvdTymyZjWsqR
         t7pJt4mMEdZQ8M3aHsn/E3dN91vR8mLYn97uaHy5DiX0NT6z07hRM+5LD5X8ZlNXcdyG
         i0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHKHX1HAZBr85iXwo+WtkQELZyFCk6BcVCrttzsLWZU=;
        b=HUWwsQq/ktjC2I59Ag+Up+MkVYWx06/ciuhxfP06299oS6+YfR4TGG4nuCYaAlyLoC
         obUMDBgpANNOgFNi4iz2l88d6Uum+/y3Sg3vCk8j3IdntCoQOKOrtKLACtCfIN5vFxw6
         3GrEIbwMAXV8vpJUfOkbWaQUlWxAOW/O0jiAvLBmU75NlvgJiAmyI2w5iGwkMq+h826q
         ijmwGI0Yg1dmUTD0Z2M4Fnm4cXsBaHSY34700lMtxu7ZgYknS5PsgBDFWIH0tORYy6w3
         e37lMtgr2Ssxjc34TMfXec2OANMJhNNkzV1NGSO5/fl3udd84aOioOwMF6Mamg5H1bHh
         9Mmg==
X-Gm-Message-State: AO0yUKVIOMdZjD20Lye+WBbA5mz5Fk41HvfqmS3E439SIYuVgWiLILHo
        z6kivqAfPmzLv8mn5q3r1dfv5Q==
X-Google-Smtp-Source: AK7set8MsvIGToSTGnh3xHzEOHexpm2Mv0MCDS0pFbnIcUwoVg9VY1ezx/Gcsdy3k2wE6PDGRUYaQg==
X-Received: by 2002:a05:651c:2220:b0:293:4e08:1aab with SMTP id y32-20020a05651c222000b002934e081aabmr2865284ljq.10.1676566143576;
        Thu, 16 Feb 2023 08:49:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o4-20020a2e9444000000b002935284f5a4sm274997ljh.13.2023.02.16.08.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 08:49:02 -0800 (PST)
Message-ID: <e2f5fb1d-b57f-4695-5345-c82faea127b0@linaro.org>
Date:   Thu, 16 Feb 2023 18:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 20/27] drm/msm/dpu: add dpu_hw_pipe_cfg to
 dpu_plane_state
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-21-dmitry.baryshkov@linaro.org>
 <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 21:07, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
>> struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
>> dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
>> chance to disagree about src/dst rectangles (currently
>> dpu_plane_atomic_check() uses unclipped rectangles, while
>> dpu_plane_atomic_update() uses clipped rectangles calculated by
>> drm_atomic_helper_check_plane_state()).
>>
> The title of the patch should now say "add dpu_hw_sspp_cfg"
> 
> I have a question on the commit text, why does it say "re-add" and not 
> "add".
> 
> dpu_hw_pipe_cfg/dpu_hw_sspp_cfg was not a part of dpu_plane_state even 
> before and I dont recall it was removed in this series and then added back.

Ack, I'll fix both items in v4.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 ++++++++++-------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 +
>>   2 files changed, 30 insertions(+), 36 deletions(-)-- 
With best wishes
Dmitry

