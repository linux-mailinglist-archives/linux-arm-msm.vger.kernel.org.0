Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687956E84FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 00:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbjDSWcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 18:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbjDSWcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 18:32:06 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0828E26B2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 15:31:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso1239541fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681943389; x=1684535389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnUl4IvxpgP8DkY6lfjFLZ6luteXP2ASmroly5c9qjE=;
        b=SVwdxp+ky5JCUki7oK2o+3teHHJGTjria6nO3FdyppdPh6sGN9dhZrv5INSHxitpRk
         r73OOLijhCJT6KrnnlBV8HjAg0Rg/GBv1r+h9UMDEvyuiLfObeWepVJawixYSD3X9d75
         btd9A0hRMZEMMRQPaFL1mNiobnx8l2JYVQSsyOL6eaLyCCL70ubRQjBkNE0AsN/vuHE+
         DJvHohseRM4hYivwEsPWF+LqDd4n7v+S3hW5J4GOI+C9yhac+fpwpx36r5c+6pdD7z9t
         JiJOZRYFmyK2Uk+nETA6TNGkBJVBG6SQN9htuf8Tr5trUwjsX1jLVK4jkNWB9OILP6xq
         D0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943389; x=1684535389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wnUl4IvxpgP8DkY6lfjFLZ6luteXP2ASmroly5c9qjE=;
        b=MOhzqh3pD4Y9D7f/ZMhoPxXrE+bFlRP1645ZVNrPy8eX1z/YZK8SVLdkD2VyO9LSSd
         h91oHhOD3E46jRS6rFQUANLTOb1eerBpsD2AKzkuCegVUlvxm6NkAecrDlHQdgV988qx
         3wT5GfG4iCrf2TJuj1ICPl++lF4yCagBm4PqSb5wnGo6lf5qsqunVyVi7wR96bvlSxpL
         sne1UndixKASQkrxuXhqyOYxghXG4hl+CrtiLVDyP6+Ag4oNWzvgINLF92QJbo1cuWgm
         f1lhhYn79Tj0ciK1qQ3jh7EZvYXRVO4UYkZ+m+6IgR9dD08avYuadu4CLlzG1uENzApT
         lz1w==
X-Gm-Message-State: AAQBX9eTb4UGhEly17i1kDCn/2hYpdGpD3UkceL7UIR+673y0JV290WH
        hNG3Xq8l60RR8/n20QGWyCzWUQ==
X-Google-Smtp-Source: AKy350bDD4XjwcvExRRoJ5+0NvZCFjjQslWtFy0JMnteMIx2R2h3N5mhLZ24ntxA7gFS31mWN13CoA==
X-Received: by 2002:a19:700f:0:b0:4dc:84dd:eb91 with SMTP id h15-20020a19700f000000b004dc84ddeb91mr3686733lfc.22.1681943389462;
        Wed, 19 Apr 2023 15:29:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 13-20020a05651c00cd00b002a79c2e45b4sm2973260ljr.109.2023.04.19.15.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 15:29:49 -0700 (PDT)
Message-ID: <2ef93811-3716-a259-538c-08e7b5476f7d@linaro.org>
Date:   Thu, 20 Apr 2023 01:29:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/11] drm/msm/dpu: use hsync/vsync polarity set by the
 encoder
Content-Language: en-GB
To:     Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2023 17:41, Arnaud Vrac wrote:
> Do not override the hsync/vsync polarity passed by the encoder when
> setting up intf timings. The same logic was used in both the encoder and
> intf code to set the DP and DSI polarities, so those interfaces are not
> impacted. However for HDMI, the polarities were overriden to static
> values based on the vertical resolution, instead of using the actual
> mode polarities.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a side note: I think at some point we should get rid of the override 
in dpu_encoder too and move it to dsi bridge code.

-- 
With best wishes
Dmitry

