Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6B77076FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 02:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjERAi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 20:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjERAi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 20:38:26 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A9A273D
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:38:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac7462d9f1so15284041fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684370304; x=1686962304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDmvYByjQsOl+xkWa90beSoV5wSDkboDGuoJ5SmvNAA=;
        b=N4H0t5CPe+pIpKdkiDxQrEhybD9CUcCPAIgYJSqRHvOdDKr2JoIpXZvDFoeKNiNPZc
         g+BwOixhYhgipwcMyZ6ggBzdDC9uyAvhZnMkWGsvf0IH2CizwnWv7jufVNAJDcsCqF+q
         3i3t1eHqRmsXTBhctRpozFztzBrWA6/qavsHelLfECSxDtWwTLcE2veCsfO8D3poeAme
         bfM6MGQ9v462jU2+mn2/yTUcWcmkEPRr8f5RMi78V1laYEhxmRgQBsjlhhPU1MwXAiK0
         Uff+bq7AlYXi4NUbSYGO8VeHT0vSiuWRdyt0xgKBuGD72gitPgfbUfWjuJFzMPP2nHn9
         Q0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684370304; x=1686962304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDmvYByjQsOl+xkWa90beSoV5wSDkboDGuoJ5SmvNAA=;
        b=iQCNKvEGcwROa+2c+82c1wjJUJFW5VLU1i2r36lhDUguh+8BC+K4PL8+YxMqozXAUl
         64aZG/QScDAlDRwX2syVpmKiH5EjYW1wnbT+58ha5DLJfamA6NgK+cSf3tA8emHvhalY
         WtwwnVCwOe3v3mv/VUENNVea7Q0r1r4bZWKfOxfXf6mlEZ2y7QR+9DI6GJ5ggrnFOpdZ
         X6DFP7V6YZb9/Ps9KAStDLFuHwcFkrRlxKz4rpLjrwiuleIoTjg7flFx9mgj5wBJsN6g
         I/puS6zTCbNhtULw3YbfvgTo5SAD0CoLr9RaHp5J2AzTeKDnRILfth6BWcAUuYoUwnCM
         aFLg==
X-Gm-Message-State: AC+VfDypRmV/OYlWZe+LtErURB+LC79AWMi68Z/Aq8fDSFq8FV877PSZ
        NPxAmJ5//425B31nMACfQC9j+Q==
X-Google-Smtp-Source: ACHHUZ7QefiowKDijq4DSc6g9gj2uUiHjFCOs/9Zc96kTvdluVfgcGJkerE+ZcEjbdlS+ZQakjZVUw==
X-Received: by 2002:a2e:b172:0:b0:2a7:8150:82c1 with SMTP id a18-20020a2eb172000000b002a7815082c1mr9874787ljm.38.1684370303765;
        Wed, 17 May 2023 17:38:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id k26-20020a2e889a000000b002adaacdb900sm7954lji.42.2023.05.17.17.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 17:38:23 -0700 (PDT)
Message-ID: <1a4158f8-d1ca-4c15-51ee-8eeb721a07a1@linaro.org>
Date:   Thu, 18 May 2023 03:38:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 01:27, Jessica Zhang wrote:
> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

