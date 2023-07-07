Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7361B74A8F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 04:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjGGCZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 22:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjGGCZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 22:25:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C26D1FDF
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 19:25:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f96d680399so1936778e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 19:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688696727; x=1691288727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jHgEyu9CZyBrBeG2GC7gQptgx9XjV9u5c1TeFBnacRs=;
        b=v7tltTCVK4aWVGf5DUADwQglsWdehyx+QdctZeJPwg/pGcgJ9gMgKSZ24K88RPCWlG
         HTXfU6OFeiPzK504CKJjgZsYMfn4q5EyNSG9Ga5LUQvi0mw32J232eCcVd9Od2JVmQ75
         kgD3o8Wc0bL/hRIZaGlFXWBcWIsrJjJDqw9pFWddH2qzwL7kD4Zvxp7qzi8MBbk3knPc
         +2KwzQyNJ4MS+gKKHW7r0lOYl2DaoVPmLSWvP6IfNm59k96cy1DX7BVDD3Owcye9/VMk
         0v6VX+M1vTl29Zp9HW2i6mACPkQI7Ke4d8bjB765EITWISANnR5PbSiKVW4Me2CSPgeC
         41bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688696727; x=1691288727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHgEyu9CZyBrBeG2GC7gQptgx9XjV9u5c1TeFBnacRs=;
        b=EQfQ6rTUDnCKTrN/kQRePR1BC12cR0i9vRnkq8TiOVe71XVA+nOL7NMSr+YQ3glH6s
         ROYaQqU208tj+jCT/7Fx2iVx9Nj1H628hptjhY9wePg15NkEmUCXsrS2gbJchnH+0Itk
         DHFWx7XQaeCXMFCSJcypqprzRY8Fc8iQEzRg2qqJQuLUVU9oc5LognJ9/KO58dtFC7os
         26UY9+Grdi/ARkOuHuGnUNs5vbDIk787pOaWDhLM9rkHMgLHNbBmp9QZehXoAISym7Fj
         ZoHH5jJq52ene/CGEk+A6b/LoskYuX7Zj72gq7cHChYTJ3cEQuau7Ez8nR2noKk1un4Y
         ffcA==
X-Gm-Message-State: ABy/qLa1dIUg275/+8pSzEjpSpNZqC4kPHe++Ix2HztVOGU2wroUgPF8
        rqksP6Eu47CnT+K9Yd4aaqzO04spNU4JKNBbSks=
X-Google-Smtp-Source: APBJJlEBoEABsxONYJYKKzFMkqLmnqPTwQwBLF1OFSqAvXDp7dRrDXKVKdY2GO8FBJaH9KGS0HNvhg==
X-Received: by 2002:ac2:4894:0:b0:4fb:242:6dfa with SMTP id x20-20020ac24894000000b004fb02426dfamr3117808lfc.57.1688696727097;
        Thu, 06 Jul 2023 19:25:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id er14-20020a05651248ce00b004facdf96283sm479843lfb.254.2023.07.06.19.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 19:25:26 -0700 (PDT)
Message-ID: <ac5a38c7-3d2f-1c16-2f74-c12683cd720c@linaro.org>
Date:   Fri, 7 Jul 2023 05:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 04/12] drm/msm/adreno: Use quirk identify
 hw_apriv
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-5-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Rather than just open coding a list of gpu-id matches.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

