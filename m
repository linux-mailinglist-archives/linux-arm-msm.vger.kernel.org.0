Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38E57BB676
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 13:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjJFLbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 07:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjJFLbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 07:31:52 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC40CE4
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 04:31:50 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c1854bebf5so24484141fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696591909; x=1697196709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0TWF593bNTpaB3Tqqlr8JM3XLOkBPwK4clHQVWNSyM=;
        b=rRtqyDZq4uvb1I/6/wcOhenRfOOQOHROI2RecQqcZxR/LoWwTUySqtTSgXFMrqq0QM
         3LxuhfnpSgJc/dYR2Q7KWWYDZO4/Ebl4uSJBMap3+6ordFRdX5pzV1LnL+9tcsmCE0I6
         v2sX0WdBZ8rzAL+/XDGJpJoc8wTY27slMjEOXaJCyhgXhlPsX2dFCs78YFU12fyKmUec
         s4SIZS6JzGKOPiELvPHhwfLPSeB9nOy6mcoS3X4732/CsUGWZa+2RNb/5BNgJirAMeJb
         Uz8jSAY3lPYhn2NuW9uPPBDTy/HkQw6SnTLUUrB6SE4hOmFRFLj6LyXWMNPDoPImrVtk
         BYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696591909; x=1697196709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0TWF593bNTpaB3Tqqlr8JM3XLOkBPwK4clHQVWNSyM=;
        b=irblol7tU+eTLBEogpNQ4roxofSro3T64/7zvu2zZTWk7PteePEBOVbm3IsUimFCpf
         mptz2u7qswsf0mJcuYzM9YGqBkdeVgov3lWnauz3RE4gbpI+djX1+NiH7hmhV3XhlMGq
         GCxJCP2M1Pk2GwpflCX97PFrr+HQ22xE9p5zAL+Wu2eP0XxLNCErL6+I2DiRDGAuJQt9
         aOaLZLZgW3xEvfjzEtvIp7SZWBJDHV8bANgZ9HgKnSQTmSl9VT6z8/0OF63twHsr7CmT
         ylM1E5NrE9OMIka/1I95CzKzcWp/bdMIkmH3hFzLA0jQ+dMa2IJUctCX5MRUzRd/vLOY
         IVdw==
X-Gm-Message-State: AOJu0Yx61iafW2FT6nfYARIhI2ADjrVEn3wtzDp5u8yCw8byX8D88+1g
        /ZXFM9q7jN1O9xjJK3MlFq9MFQ==
X-Google-Smtp-Source: AGHT+IEgFCEHn504tuKBVWYl0xhU1uiPtRBx27WqGJbL9nyuJRS1cbMMw8HuP1zpHgEZaEYk0xzkcg==
X-Received: by 2002:a2e:8256:0:b0:2b6:e958:5700 with SMTP id j22-20020a2e8256000000b002b6e9585700mr6751826ljh.4.1696591909007;
        Fri, 06 Oct 2023 04:31:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r6-20020a2e9946000000b002bce3123639sm743777ljj.98.2023.10.06.04.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 04:31:48 -0700 (PDT)
Message-ID: <dce265a6-12af-4374-a156-7bceffd5e2ea@linaro.org>
Date:   Fri, 6 Oct 2023 14:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] drm/msm/dp: rename is_connected with link_ready
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696436821-14261-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2023 19:26, Kuogee Hsieh wrote:
> The is_connected flag is set to true after DP mainlink successfully
> finishes link training to enter into ST_MAINLINK_READY state rather
> than being set after the DP dongle is connected. Rename the
> is_connected flag with link_ready flag to match the state of DP
> driver's state machine.
> 
> Changes in v5:
> -- reworded commit text according to review comments from change #4
> 
> Changes in v4:
> -- reworded commit text
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 14 +++++++-------
>   3 files changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

