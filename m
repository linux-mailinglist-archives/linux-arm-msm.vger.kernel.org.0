Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02766780AB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 13:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243722AbjHRLFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 07:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376565AbjHRLEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 07:04:34 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4536D44A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 04:04:19 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bba74ddf1bso10702531fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 04:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692356657; x=1692961457;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmFWOPe1M/M0skePNYAwqrAwIEY42PVhQlE891nG6o8=;
        b=dwO+bth3b1+Nk8+6IivmbRPVP+KaMT1vBw0O3sLeIv7oR1pX0WJcOdPdj1dSu7wdXM
         ito/Mu50T2ls1VMQ2qlTuEWDdRDwxKECxeBHFEpzCo3Gt1ixycbD6DkEGXvn2BRjNflU
         o+m0tIp5/bVK+nA8vQofigeJ4ucMCEpPAibF1m3ptFKWj9pxmA59hYkUiwQ4+qA2X7FC
         i8VgvRCcwzwp+LI/bQ1RXZfrMPooMSQdQDnkGY/TY0cFCffSuVh7Gc1Ps4WizpGS0Eo0
         J/MaL/+Q7GnnQM39Z1g7xRRtm6YAo8MFXFBRvQ+1UukcRI/xD0Ks9SiremxNaiw8MAAr
         H6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356657; x=1692961457;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmFWOPe1M/M0skePNYAwqrAwIEY42PVhQlE891nG6o8=;
        b=cB+CVB8Z4z4kmnqLzEN3V3hWF/6MsRgW8Q0GMb0ctqFdBgWnTTV18x4sdJRXBJiZKQ
         k0p0xXfPvg6vwTvD8ERUIMYwRGsby8+h5X+PPW/O36YLNUFoicxXwkcPKlR77kXKpYc+
         kcrADEyup2c2fB4NiMooZHlhJ1U1LAqUJfFvh81BTx80X1ZMQXCd3udoLT4gDzNarSsQ
         PTWLGVVrdpn6Xf02r8N3GFGrneAH6CasTnYRP34WTUNOyFYyyBXDpWRHh/6p9CPcMDVq
         A8pMKjwsOpvX59XM5wJ5OPx9FUFCtPKg0i71R8vTu8C8FT+JcrC7vb/1tEwpTUMRbqFM
         652Q==
X-Gm-Message-State: AOJu0Yy9RaD55uD/I1G3e220VnZ9fQ4MvSZuQNfstZPqOmSRHSFJTFOl
        faLXrhpP50tUOU6ss53tTw5n5A==
X-Google-Smtp-Source: AGHT+IEwp06ZxicpGI+vVruEAtpln6CTuqu8D1mDmasY+MnhAF9dVfEJTUjv9IOpM7Vu0vEXSAFF5Q==
X-Received: by 2002:a2e:b791:0:b0:2b7:3b6c:a5e4 with SMTP id n17-20020a2eb791000000b002b73b6ca5e4mr1525911ljo.38.1692356657511;
        Fri, 18 Aug 2023 04:04:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y7-20020a2e9d47000000b002b9899d0f0bsm363898ljj.83.2023.08.18.04.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 04:04:17 -0700 (PDT)
Message-ID: <c667d98d-c8fc-4c28-982d-67dec00570e4@linaro.org>
Date:   Fri, 18 Aug 2023 14:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/msm/adreno: adreno_gpu: Switch to
 memdup_user_nul() helper
Content-Language: en-GB
To:     Ruan Jinjie <ruanjinjie@huawei.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230810120424.2108348-1-ruanjinjie@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230810120424.2108348-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 15:04, Ruan Jinjie wrote:
> Use memdup_user_nul() helper instead of open-coding to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

