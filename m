Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7BFB6E8526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 00:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbjDSWoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 18:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbjDSWou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 18:44:50 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9AD683CB
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 15:44:22 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r9so675257ljp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681944257; x=1684536257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68AGYlQ6GL8Id5Bj4tL7yDrVLE8ybeIun+9u5kU+miQ=;
        b=AuJGpMUOVAQOas5/SHMGxpKJcNNyvH/8/DGB4GOdlhRuz3ng/gqEoRM3F7swrDihem
         eXOlQETCn6QnA2uxFSIwrpTiAWfQHbbr97vsz1boBXQ0Rh0Wshk+eymQb8YeXLZXlG7R
         1DpGX73qgRRuWG/Y0n8tJMVP2SXrqm48yVPpyKphTETiyhpPsDPMkmNfyHSimY0QGLZp
         50RR7ZeucUIuydE8cPj7rX44tIzkeG9Y15tMAHBeb+TegduwQ+se/6iEYcJxCRQg1QYg
         K6PJ44fIBj02qWGdZsGYKEXNfTd+QC1y+I17c++8xZGEe2fJ/A4I37fxwo5oWYeuZFMf
         fTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681944257; x=1684536257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68AGYlQ6GL8Id5Bj4tL7yDrVLE8ybeIun+9u5kU+miQ=;
        b=VwOOx7IjvV8EDYySiHqwjs0xnPA7A2shFi4NwHWc2VyrUD4dewoEiPQo3/QtIhNGlP
         H52hxtq98kMJ/yVCbO8vxntSTHv+PEHUUlIQOEnrD9yw9tmIlevZN1Kw7PZ+EE9tbgHT
         vEwCHBG6NaiEAuP2uR/FDv7+SSLqt15zcgidJOxcreN6ca9+QliNSPESH8pClvaV747p
         ED4UlP6GvwhUGuAEe2VBZvG9MAFSaDSmvYqlCpiM0baZlHxdF6hefzkcNWZ4pKDcJpVt
         bIkPy+ENyeGSU/Z35WQclufUtEDwjyzDMb9GluUwAxQlHK/EEysZh97QrCpZsdNSuG4k
         ZgtQ==
X-Gm-Message-State: AAQBX9fAq7L+DHKpaQQ7LRJ8B78jDmMdko+vHJo0un+3d4K91O3ovptO
        JIslNAcFh1iYIvC5FaB8Rr5Ceg==
X-Google-Smtp-Source: AKy350avbp+i25TM39CqKnZY8u0sm8EAdwviMJHLgiIsLvF9GUSyWmmhSvBhulbBO5XNdIRakeTwgg==
X-Received: by 2002:a2e:8049:0:b0:2a7:730d:a7c2 with SMTP id p9-20020a2e8049000000b002a7730da7c2mr2477442ljg.46.1681944256801;
        Wed, 19 Apr 2023 15:44:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n13-20020a2e82cd000000b002a8aadcf15bsm2688424ljh.120.2023.04.19.15.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 15:44:16 -0700 (PDT)
Message-ID: <dbc1036e-c850-1d68-1161-1a353416b3e2@linaro.org>
Date:   Thu, 20 Apr 2023 01:44:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/11] drm/msm/dpu: allow using all lm mixer stages
Content-Language: en-GB
To:     Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-5-d1bac46db075@freebox.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-5-d1bac46db075@freebox.fr>
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
> The max_mixer_blendstages hw catalog property represents the number of
> planes that can be blended by the lm mixer, excluding the base stage, so
> adjust the check for the number of currently assigned planes accordingly.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

