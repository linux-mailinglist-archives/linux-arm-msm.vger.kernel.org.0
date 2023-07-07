Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D10474A7F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 02:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjGGAEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 20:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjGGAEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 20:04:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68EC1BF8
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 17:04:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so1892292e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688688283; x=1691280283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1XmK8k89NVYCgvz7DmgyjojdN9jXju1+8dOgTl5G8c=;
        b=bCH7XRZIayiwGnSpAdV1Auo2YV3MmCYJvGXdcaAcvi9VIp3YJHwsbrj1ouGnd2toBc
         Q/6VgYnMh857JZwCSo42n+EcmzbJLXF7sCLLeOrUPHnfRSf9+85RTfb0knat0eytA2L0
         H8YX/3ZNmKOaXtKL8mc8GydihPzeJeESgtzyDaeEIDszpVd2ycDoI/siweNyoVGvBWbF
         nV1BfpNxBbO/Y9SmdI+LM601gxJ7l08+nhbLurF7VGoeG2Z4kg//TKZ7gkdSsaJJLt6A
         O+VvJs9vm9U08eKvRywxb+foN+0Xk2Sq0z1bbFWETRX1+OnpjSGg/pO0OWjf+zaw2rLT
         QaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688688283; x=1691280283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1XmK8k89NVYCgvz7DmgyjojdN9jXju1+8dOgTl5G8c=;
        b=DFFS+1A0kumxncVCGNw9QOgI+rKg7yWOu9JqTg3ud305oIEJd/olBjnuebJfC1yWW2
         awmjvAmw21cDHgvndmy9L0M5r3WghUXZ7HqBRBHZpNHlJA3jGToUxhGg6+5gbuvb32Pb
         FyGvfuimoLCcYHDhjH0IQ2VLlkjhzmy4Lzj0gHrQomg0lKwBCffRzAwSi8zRkUPOUmZk
         A7qbSfsNylLZAMrT1M3tZwJpKJ/XYI2nPxEsrReihYa9m0obVCV5I4BAeIe6BO22dKZI
         O/cIPsLnoLWrwRhNNu/znmYOQxJGHuc+I7P0F1ZdPQSOyca3bfhoHmFsLnTHqN5dejBc
         D1Bg==
X-Gm-Message-State: ABy/qLalcd4HAFarg7vokHwMM/nk3xc5pUhiJj/zxMQMU0Uzrp4OK1ns
        Dl3ym/OPahj6KoY+b+0z0rwRKg==
X-Google-Smtp-Source: APBJJlHrIIN2WmGvmgpD2lw/ToHst6Jq4jWo+RJr0yvutKBSvwJxdtc4Nym3gDEODN88xdyljzYX0g==
X-Received: by 2002:a05:6512:615:b0:4fa:d522:a38e with SMTP id b21-20020a056512061500b004fad522a38emr2638798lfe.35.1688688282911;
        Thu, 06 Jul 2023 17:04:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q27-20020ac2511b000000b004f76684329esm442975lfb.234.2023.07.06.17.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 17:04:42 -0700 (PDT)
Message-ID: <7ac6bbad-2d87-0c42-f243-82cde7181e61@linaro.org>
Date:   Fri, 7 Jul 2023 03:04:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 01/12] drm/msm/adreno: Remove GPU name
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-2-robdclark@gmail.com>
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
> No real need to have marketing names in the kernel.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 24 ----------------------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 13 +++++-------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 -
>   3 files changed, 5 insertions(+), 33 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

