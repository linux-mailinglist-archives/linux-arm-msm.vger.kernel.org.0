Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55509682BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 12:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjAaLvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 06:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjAaLvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 06:51:43 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596BF5B93
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 03:51:42 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id p26so29595005ejx.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQgfiktEQ6CHbsLdc2xgeGGQErl3Bddwak/hS/cFzLs=;
        b=KtTB0g9re1dA8ZJ2Movj19V75dJO8OU+1zPk7KvcO76ojtbOm7T+1Q+PRbSgXR2Mw2
         t9i05XCOSDWG57ridUBa3bqZqxQM4vpVyD0ikz7jxZG8Oa6i8px/29UqhJNLNsr6O4eu
         5fWpFTzRG9GZikcJCXViSDeidf9Yjr6U0Y+baqdt4AnKkppfmvOQP0RFxFV9xhWuWPb3
         sBBwsUGCxFmmnxPN7Y5jYTj4/lWnmq9A4h4eMhUmL8dtAaIKzGUC4DapogEKEHlBd0mc
         gDiXo6RWFN9iwYDNT9tajxsPvjtV5ajZZrpQ3hhS6a5JwWyka97C6r04ulCLacg6wd75
         cNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQgfiktEQ6CHbsLdc2xgeGGQErl3Bddwak/hS/cFzLs=;
        b=IjwnqC9Hhi+6mNXo9rnZmR/IrpNrLd2cmHFVwN7Bl31HlycD8BVFGyFYMshWca9L1q
         +ib3/p8pfMlxPn02xk2zLoz57DkiyJzENBopont0en9q/VcGnR0NQhdZ8rkQrmaTl0ex
         a2uj7LEksgUBjU+9yyxt+3XoHJGftOZsbFpQowq2AynrM1ASbQdW9Jo6B6cUb17yrg95
         sUHCXj6MM0Eoi7XNEJSxAHqK83f/3SqaWZ87eU7WoIL7R3nybtvVcY6WyT7k0MoPbCC8
         ko6jn0wM61uvEuwakUxi8/ZaEazNoXj/ok3e7/euRV5TQbVIjKqdEqu5DVDThOCzI0wR
         h1tA==
X-Gm-Message-State: AO0yUKVSv7aqODrjvOUPZjDKwze4EXUMJSbp1rUBcOmZ/iLFouLl3XFh
        3VhZrha0lpJ6VFqQRcxnQDx7IQ==
X-Google-Smtp-Source: AK7set/TH31+UFmNU2qQupy+IGEIXakJjaiRbJBmgU1/pLW0cosPPBlYH8BVxFPqSKsuZqxVk2kW2w==
X-Received: by 2002:a17:906:4f82:b0:88a:296b:535b with SMTP id o2-20020a1709064f8200b0088a296b535bmr5105126eju.64.1675165900838;
        Tue, 31 Jan 2023 03:51:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p23-20020a17090653d700b007ad69e9d34dsm8322335ejo.54.2023.01.31.03.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:51:40 -0800 (PST)
Message-ID: <f387ac20-7453-addb-c9de-c4553f79c925@linaro.org>
Date:   Tue, 31 Jan 2023 13:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/27] drm/msm/dpu: move pipe_hw to dpu_plane_state
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-7-dmitry.baryshkov@linaro.org>
 <f27fd72c-43a1-fa4f-6fda-4214d5b2920b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f27fd72c-43a1-fa4f-6fda-4214d5b2920b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 23:51, Abhinav Kumar wrote:
> 
> 
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>> In preparation to adding fully virtualized planes, move struct
>> dpu_hw_sspp instance from struct dpu_plane to struct dpu_plane_state, as
>> it will become a part of state (allocated during atomic check) rather
>> than part of a plane (allocated during boot).
>>
> 
> I was thinking about a couple of things about this patch:
> 
> 1) Since we are moving away from using "pipe" and using "sspp", perhaps 
> we can rename pipe_hw to hw_sspp in the below struct
> 
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -35,6 +35,8 @@  struct dpu_plane_state {
>       uint32_t multirect_mode;
>       bool pending;
> 
> +    struct dpu_hw_pipe *hw_sspp;
> +

Ack

>       u64 plane_fetch_bw;
>       u64 plane_clk;
>   };
> 
> 2) I still dont see any comment as promised in v1 about why we are doing 
> this in dpu_plane_reset().
> 
> https://patchwork.freedesktop.org/patch/473155/?series=99909&rev=1#comment_875365
> 
> I think what we need to mention is that the dpu_plane_reset() is the one 
> which allocates the plane state today and hence pipe_hw can only be 
> assigned there.

Ack

> 
> Rest LGTM.
> 

-- 
With best wishes
Dmitry

