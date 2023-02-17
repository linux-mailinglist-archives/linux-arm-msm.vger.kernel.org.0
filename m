Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AD069B49E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjBQVWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjBQVWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:22:16 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C06964B0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:22:07 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id z18so3421140lfd.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5R/JMUHvPSazNvX2Y/cVe1EYEqkP1fximqOzEtAx+ss=;
        b=RxaNYkBHuzH5zfxozYK0G8C3W3dtCu+dojqTATTgOxFb37t5b/2fKYUnPwtl7KrHvG
         a5WCc9VM/k6iO3XjLWklDTQs0rHPJEK+tUOsorGgUS3z2USjK/Fte7Xb0cqJwjbbDLR/
         9XTdHIm0tvLOU2621UDxCwsttL61V6TvF5mNQppqDPqPWffXWjYo0nPM7onoOGtXpZ97
         xRATCNnytP1/jDvVYDDf6nfNYkK8xpco8Zsu8YNEhU1en4OEs1wevtpOkAuxeust3r0e
         JukJySB6JcG9VO+lesCUVXv0D93izS1ulGQ93uhj7WI+GGsxwWyQa5IP2vVK9PO+gwYD
         SV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5R/JMUHvPSazNvX2Y/cVe1EYEqkP1fximqOzEtAx+ss=;
        b=nuqvK8U74W5vPYx/pV2mJQII6JtNabdkzNRkx5uLz3al09kUMtRmKD0PVjnRA2DDC2
         zgAzkqJwKAhjPAIjqi9MtyEdnFRhQ04G06X+9jYZ/rsmJeywR/rV/DcumUuQrcLT5RD6
         okknEU3yinoF6Wh2Jy29hxQjLm04tEkX/bv3Y7JCpLHR4Em0hc6V3NLTZ9T/0nR6tHM7
         dA9pigH36OxSuy8s5kP7xIiG0V/9GirLL8nKdwWphdJYQPFYNVBcy63aRjfdzPG2K+N/
         g9G6toOFIqwWaP5reX+vRofiRz2y7W+eNG/5GEWcTW/fyoPIqBlgzgAf9QRvRUoLJGw1
         m2XQ==
X-Gm-Message-State: AO0yUKVodf55xl+UfqNBcff+hxEHm4JGM1kZYa+MJ8LXPojLZHIYjTrQ
        nx51tJFDJGc8+an0ljfZrY4uVw==
X-Google-Smtp-Source: AK7set9poy5qlGBhuSKgj+o7QREEXCJTb8D12job9OEO+QySjlOQ3zLPK923+3800d/HtFq/n5o94w==
X-Received: by 2002:ac2:42c7:0:b0:4cb:3a60:65c3 with SMTP id n7-20020ac242c7000000b004cb3a6065c3mr132948lfl.1.1676668925529;
        Fri, 17 Feb 2023 13:22:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b6-20020ac25626000000b004db25f2c103sm783153lff.86.2023.02.17.13.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:21:19 -0800 (PST)
Message-ID: <4cbe3a8c-5c6e-407c-c616-c2b08c5a9af2@linaro.org>
Date:   Fri, 17 Feb 2023 23:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 12/14] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-13-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-13-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 19:31, Konrad Dybcio wrote:
> The GPU can only be one at a time. Turn a series of ifs into if +
> elseifs to save some CPU cycles.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

-- 
With best wishes
Dmitry

