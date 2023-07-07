Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C82674A8EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 04:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjGGCYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 22:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjGGCYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 22:24:32 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081DCB6
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 19:24:31 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so20676831fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688696669; x=1691288669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhC47UWtWOHjAnQy7Fquoncsj5V1+v8tog2t7GNq5lg=;
        b=MwKTwxnFVefFOYITT8KKdPN/dIudZLTeyM71VFCJx38VEpsx1nsIDa0i9byNxJx0BN
         Thw6PA74fueOBKCw5jck6HY1DtgWEg4CfKw8HGqZQGGGt/3tSKzIAYPc6xa3HLd98q8h
         u4NMwDBZrPvqMKnmLAovYssEiAaBaBwh9hnjixX68tBoLxnlYT5aUSSQ4Gb5zUohenLv
         EK9+3soWRgfbT+b0lElOiDycwaCCB8UsNQxD43RIk4nzgmSbWsn0Dc4MQp4meUBtti7E
         2RvNCUCC8SxSd3yU2/SOYGfFpNmql+WmGujfuHVvQBwEx9bSwAvPr25ffw7ddNDkbXXs
         vKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688696669; x=1691288669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhC47UWtWOHjAnQy7Fquoncsj5V1+v8tog2t7GNq5lg=;
        b=CdZfFCcEaJ2JLChJJ0KhgU/hhDga0efvH7ACRRERgKhoLDyGoQgszO5z0q766LP0j2
         tYqpLxafeEzPVFprtlBX/J0YUw+b2edNfTuBpezf4uMr2l9EMjRO4Fi1uHmUzc33BaRV
         /kjIVwzby5jbJCDtokLC8vtlfgVkesenZp1liewm09Uqi5Pgg4lVzvK9HrgSZLaoJgOK
         SgxNqezHSK99xbGS9IXeUAgrQ4DSfng6Qu5J5oVeE120UDI7uj1VWnvXSSzOV2I6LBcI
         oRKu1fxMBzkckQ//1/o/pcb9SJG2a3brdNkS1rBQBMLVb2B+JizZ39bF6LYROQjp0zm3
         RaZg==
X-Gm-Message-State: ABy/qLapFu2Pog7dMLv1fYo9TXrTl7tNMhIet2c+YAGpKN0Ciw2SCc0I
        Wy39Sp3DczVOMe0QzhjrYwoCMg==
X-Google-Smtp-Source: APBJJlHrapg208VIiOGrvBEtX3H4Hlw5BHz1SpcrT4SZflIVVLEwj+AtZesWj8J9/Mt5nTcWqZ3XfQ==
X-Received: by 2002:a2e:95d7:0:b0:2b7:2ea:33c3 with SMTP id y23-20020a2e95d7000000b002b702ea33c3mr2589201ljh.22.1688696669205;
        Thu, 06 Jul 2023 19:24:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m18-20020a2eb6d2000000b002b6e00a3e19sm562839ljo.132.2023.07.06.19.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 19:24:28 -0700 (PDT)
Message-ID: <44b24f54-38a8-8995-ee77-ac453e73c759@linaro.org>
Date:   Fri, 7 Jul 2023 05:24:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 03/12] drm/msm/adreno: Remove redundant revn
 param
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-4-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-4-robdclark@gmail.com>
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
> This just duplicates what is in adreno_info, and can cause confusion if
> used before it is set.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 --
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  1 -
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 22 +++++++++-------------
>   3 files changed, 9 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

