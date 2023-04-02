Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8066D3796
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 13:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjDBLVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 07:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDBLVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 07:21:53 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC021D2DC
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 04:21:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g19so21415446lfr.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680434510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CupAYGtbQgsZ9aoIqwriIdpbZ2t5YipDIDHwTEshFbI=;
        b=XZQQ6asGIP/qPFMi76WQf7GkXCLFj31HnW2kyHo7n8NzbAxp2Vy4u7iGB1spFCftyG
         mAT77s/zSrlE6HP54uvavC3jxMQkJO0giWDmadfqjEvFn/zzCqkHCth9CRJTjcj/8kmf
         ALXWKeGhrdFSYkF5dhm9QKlhMOpuBi7goZVFYBomiydSmkwtu/RpTEsvLOXJG5/2oz17
         cPt/SkEzW8RDzyQ5/FpDeBWgB/P73iU3I794AQCELlLEu86er9CcULgeE1lsRh2BxH6s
         thWFjARZgPTsGguvi1kSk8S0UB4vcSwt66v8Iu5zFtfLPhORHdNzo6vZJJb1sQLbuDFT
         2CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680434510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CupAYGtbQgsZ9aoIqwriIdpbZ2t5YipDIDHwTEshFbI=;
        b=aeZIhGJYfJdLTyyRPduvTyzFrK33EitEtk5bVTXZIRZLwQzien3E7gsjGw3vqpGGem
         VJ5yXLxcJRo+PG3E01bJFPLl+CCX7iKcZlLbBMJPV2Y4mL1RHtxfOd1izjJdmVqfdq8S
         evKaIZNUmD7jVWWeUM2F8+LergUl3cGNPEPOm6/FeGeEa6OX3CGjnNWyKkaEXUeWKiDE
         d/zLLdYcq1ljYAmNcETqqvx/PPBjT+m553+K0yIWcxYC4nN/OFRnBLVF7SMqYxmog18k
         sVsHnJDmOSaKtAXsjCc9qEvrrinzpuflZfZ30YSEy/GutG2ZQvphbtEyhxsHK5FBq+Pc
         AUXw==
X-Gm-Message-State: AAQBX9efDw78t6eQYqMifNOwcw5qtDEsaOFEWaWuGc55gO3mHhfSUzJI
        4oRhm9OPIvMdbkn/Fifa/Ppolw==
X-Google-Smtp-Source: AKy350b3ZPoFCeLxOBe6dDFl63M3ktiEY+0xGffgbBogR9v0b426QN4st+MRF7acRHebKRnwzcywDQ==
X-Received: by 2002:ac2:5304:0:b0:4de:290:1c0a with SMTP id c4-20020ac25304000000b004de02901c0amr9267866lfh.57.1680434510474;
        Sun, 02 Apr 2023 04:21:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g26-20020ac2539a000000b004dda80cabf0sm1247856lfh.172.2023.04.02.04.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 04:21:50 -0700 (PDT)
Message-ID: <0969da8e-a115-9ac4-81ab-09a2b363cb14@linaro.org>
Date:   Sun, 2 Apr 2023 14:21:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 3/6] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-3-3c13ced536b2@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-3-3c13ced536b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 21:49, Jessica Zhang wrote:
> Use the DRM DSC helper for det_thresh_flatness to match downstream
> implementation and the DSC spec.
> 
> Changes in V2:
> - Added a Fixes tag
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

