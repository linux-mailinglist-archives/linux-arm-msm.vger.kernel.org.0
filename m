Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F416CC103
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjC1NdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbjC1NdK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:33:10 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE205C67A
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:32:46 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o20so9648456ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010364;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOqMV4o6u91F7/3KqJairv0TeaA7yQYahdNMsdR21Qk=;
        b=ODJKFVGAQ5ucmVJh5o0Tx4M1IAr3qyyedClqSgC5KVO+sbg2MjSjiBbEO+v/HFxqRk
         NcpadSpeWNNiIrDDrCNsNhohHD+beRsh94E6R6cpf9D3rvzmQjaOsrcZylkRo06SlDru
         U0u3ISQe/GcZFfCURhWS3b5faxmO+N1mj2jclFsNU4owsU7W9IWOKoxQjXYLJHLACUqV
         rG4lJpBMw/JOC+1buE7rQGJFuoIaiLxa5eNAwJbpqHlkEfTf/BhMeTN+aEBmRdEZnCoZ
         oECXyySEqWFKL+x/nnR0LU2tuQukg86p0XXXL45KKCCMOL14W4r4JrP56c2ubo09Itk6
         opNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010364;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOqMV4o6u91F7/3KqJairv0TeaA7yQYahdNMsdR21Qk=;
        b=4Zp2iBsdV80pTp23xPsHpHCbn2aeLYIxai7WVj9dWkgVGkQc4QTG57+MZ6NZz0N2wV
         r7Tm6CF8pnttBVJDeuD2TwhsK6x+QmlPdb2tfpy+0TXh55DZb7lTqmxVU8Fk719hboXP
         QD7eDi8ALgKlMjF+EaNEk4MrZzeOCm+ic4NOPbQGWMvBS6dHryI3A0/ha3f5/+8qhhWe
         MOdiIawcc7z/EmIuU8OlyxubqG7EbOHpXpEhkXARjB0HF+Fg0ud0hlIn2+GdjEdSMfMA
         we6Tj4BzojV7Xyszafec3SV3G0vZVvE5xYc2Ra43/f8FKVBsN47/zACXLfDTtYF9U5AM
         TD+Q==
X-Gm-Message-State: AAQBX9dTHPvlN1nynkCgJzFpnq5gxi67jejCYPWwOaoQu8MkQtVDf86b
        FwnvFOYF266bXgfuuUVkmTuILQ==
X-Google-Smtp-Source: AKy350bNZnAibAjzuMet8+lBWu7+IZY1OLaMr4FzfyxXF8FwhF2Xr/Ng9GqSOa1UbgENlEzQcmH/9w==
X-Received: by 2002:a05:651c:446:b0:295:b0ed:ee8 with SMTP id g6-20020a05651c044600b00295b0ed0ee8mr5270401ljg.46.1680010364377;
        Tue, 28 Mar 2023 06:32:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j21-20020a2e8515000000b002a10b2ea089sm2622587lji.16.2023.03.28.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 06:32:44 -0700 (PDT)
Message-ID: <014e0cce-0bd8-fecd-f2ab-7086557c6fec@linaro.org>
Date:   Tue, 28 Mar 2023 16:32:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 32/32] drm/msm/dpu: remove unused
 dpu_plane_validate_multirect_v2 function
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2023 18:16, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> After cleaning up the older multirect support the function
> dpu_plane_validate_multirect_v2() is unused. Lets remove it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [DB: also drop struct dpu_multirect_plane_states and R0/R1/R_MAX]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 118 ----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  17 ----
>   2 files changed, 135 deletions(-)

For the sake of completeness:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

