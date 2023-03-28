Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2008A6CC0B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbjC1NZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjC1NZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:25:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AE18A62
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:25:26 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h9so12556299ljq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680009924;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtatUZ8zMgD/XQ1ZuMgdjShOsET7bYNRpq4MenkepiM=;
        b=YZxwemXUx0a8jxmJrQWJfX9wDWhvcZ128QSZYYHg2AWBI/PdEzm7KbHkiw+MZkSo+o
         kt/YYp5Su7wsBCQmesSyuFw8AC23S7iiFPZczkLY+aZlj2RPGp2Ry5klUQILeK+UW+VR
         oQJZfDtl/bXxP7cC1HWVbzoj9f8v8NSJrUSKZgZ5jpRseWegNYQJG08J2d8AWgX5KXby
         7VKcgz+BHaV1nPaGo23an6LaS0GD1ENQXcG44KYQnA1N8han3ToSd9pWg0qDV+jz0oP8
         KN77t2Dc0ckJH1EHG9V8wRr2tNJecbksvYjQnxQ6HYImoOdB9TCjzOXSi/rglOrlArJA
         AgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009924;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtatUZ8zMgD/XQ1ZuMgdjShOsET7bYNRpq4MenkepiM=;
        b=Jf0Sldao4ngaGHAQmX0fvUGjBOEmqRi4+Vu5bZS9hR4T4Kpo/J9SBFfzqYyMWXfzBN
         KfgKsxny87ksVWrWdGB5pPBMJpGQhEFpk+JgVmhJGl2qRas8Sx1ArDNCuWj3YTqqaG3B
         C6qT4jZorpdkLHPmoknY6pEeWY8nZTzVuUyl65Ds0VrwnZckUC/oEpvwHonOsneIivQN
         ZbXuBVcEMv1/4bWEhN2DV9jT55xFbmszSzLrqH1W8PQQ6P5RGm2ffrYwJXskznMMNgjk
         V8KgehV0cWRPB63BnzNfLZwh2UKJpmTqgbLnwrDLXkRIH7wj8wCa7RwMtz3lpFk4euPc
         z8ag==
X-Gm-Message-State: AAQBX9fQ+q/RN18Yw87sdwqLqKAc0Y8Zj6CoR+4p8fl/CpRqkxvEeYWK
        0Zsbzvr9wc/CRZkRRfi7Oyi1Mw==
X-Google-Smtp-Source: AKy350ZP8pG5H47p7GqVZ5Gicx2oRFeRu5fXTXxAzE0CvqpcKIvp6gcMnnedqSA/hZENl+jG1kHWcg==
X-Received: by 2002:a2e:82d7:0:b0:298:9e64:c916 with SMTP id n23-20020a2e82d7000000b002989e64c916mr4428993ljh.17.1680009924615;
        Tue, 28 Mar 2023 06:25:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b004dc807b904bsm5099510lfk.120.2023.03.28.06.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 06:25:24 -0700 (PDT)
Message-ID: <4aab8fb9-8da5-389b-bbd4-db9ae835e93c@linaro.org>
Date:   Tue, 28 Mar 2023 16:25:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/msm/dpu: Add support for AR30 format
Content-Language: en-GB
To:     Leonard Lausen <leonard@lausen.nl>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
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

On 21/03/2023 04:58, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed enabling support for the
> corresponding per-pixel alpha-blending AR30 color format.
> 
> Declaring only XR30 but not AR30 color format support can trigger bugs in
> userspace. KDE KWin compositor versions prior to 5.27.3 for example prefer
> 10-bit color formats, rendering a 1cm^2 black box around the cursor due to
> missing per-pixel alpha-blending.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  1 +
>   3 files changed, 14 insertions(+)

Your patch doesn't apply as all tabs seems to be expanded to spaces. I 
have fixed this while applying as not to delay it further. Please use 
git-send-email when sending further patches.

-- 
With best wishes
Dmitry

