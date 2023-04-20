Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499616E86C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 02:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjDTArE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 20:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjDTArD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 20:47:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7566273B
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:47:00 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h8so1000036ljf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681951619; x=1684543619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AE/gqnqDMqT5+SZLjSuvK+IKuP3U9eK+CuG+PZ1CR0=;
        b=e4v6N2lPIWLVzPpc7EEd73c9/NeSuOv0JljZXVhqsYxOPC6W9Spxm3P7f2wad/vPsp
         D7W74DhFZRYSCrEr4HxT8KrTcAqdSdxTDacfz5+n1IjZQj+XnfRtQwpQHWUTJUSWGdhv
         tqv5g9SgfjxcTZnFc6o7DbFT9EWem/cbWrceoxX3fHkI3aomj89fpa2m/FhXJR2Xz79G
         2Eq/n3dGC1Xqu/a2WcbEi8WvyU0r3nMcYj20fzjFlpNI+JLJ5yLCxJTLsTnf9GRIbUKg
         /4/hoLda37npYgbCbJrk4y8AlwN0uq3OOzWdenhhkgmz3Q1K3hML2xAC8uY4mRWHxHZC
         3sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681951619; x=1684543619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AE/gqnqDMqT5+SZLjSuvK+IKuP3U9eK+CuG+PZ1CR0=;
        b=YyED4eKj1LaWaBdqNzNMjcSLt6LxhNqB96lxRmZeWYO6vuW56HjE+TJmo4ppwZkQzH
         KdOYPYipgWiADRyFgsEWVBE4bL6pnrfd5OcG2dN7o+SzJM4vNu8Ax3J1F+WjZhArb/+/
         65w4w8OQ9TXW0cOgsCtC/hNjaFa5I0FVS8y1Uhg6VOlCklxVOuKWbMZdsUoOB9P/VQVA
         upUXNlf5Xg6fSF29UwocS4GgduZYXUh5fw2RHVLC7sO3z8tsnRxRLI3YxPl/aI+i++VV
         l78X+abw4KZ6WIHvw1JVUt06/ZCo/XH5+w5L7yXOqjJtyyQUBxDkGV4S2AFk0VR1x0wc
         ElXg==
X-Gm-Message-State: AAQBX9cAjcLlttRS+GUJdWVT/nvSQnTPio+deilb8qXfAWIl8u9RE5jE
        gGDpSSKbX8osrHDC3QujHXRqsQ==
X-Google-Smtp-Source: AKy350YnH+VkzUueFre3hX29m+rao+d/EhdY13sLIy2s8/4ZGOlKWRsUrJhpBVTtJUHQ1iD1tzPM4A==
X-Received: by 2002:a2e:3312:0:b0:2a8:b628:5c01 with SMTP id d18-20020a2e3312000000b002a8b6285c01mr2172795ljc.34.1681951619024;
        Wed, 19 Apr 2023 17:46:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a28-20020a2eb17c000000b0029c96178425sm16999ljm.19.2023.04.19.17.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:46:58 -0700 (PDT)
Message-ID: <0bf2fadf-eb3b-9fae-3615-aa8a95e9e650@linaro.org>
Date:   Thu, 20 Apr 2023 03:46:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 06/17] drm/msm/dpu: Remove extraneous register define
 indentation
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 23:21, Marijn Suijten wrote:
> A bunch of registers are indented with two extra spaces, looking as if
> these are values corresponding to the previous register which is not the
> case, rather these are simply also register offsets and should only have
> a single space separating them and the #define keyword.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 41 +++++++++++++++--------------
>   1 file changed, 21 insertions(+), 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

