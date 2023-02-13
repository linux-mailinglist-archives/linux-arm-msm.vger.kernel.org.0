Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351A06945E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 13:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjBMMes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 07:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjBMMeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 07:34:46 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D993A99
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:34:44 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id qb15so29397640ejc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J74YHf3ie7EaU63+SY0GQSf4YHEgWreO7FWC0ay2bw8=;
        b=KRPaa3mRTKfV9nEWIVZacyPcGFYG2GDfrUIyqJCfRYOZne58j6YgASCAtJSgrtdGMU
         LESaAHJysEkYczmZes/snqjGhvp2z69rjDVifAA1vH9z7XimouO/0m4cMWhcPg5/5Mu3
         GRk/q5ZI+p4W/p4xj/do3ZKRP4YRkP7FLOHIufGnK/Yvu+5zWciGgJ9Z5cjMPhDNW4pZ
         R+U7Vq+iBlKR1JvCrMv6u8WuMwg7sx6LHKFsT34AXpyMrZ04HlVI5v54QRay/lLWYwly
         7wwfuTYj2yXJI1x5YXHH091sr7Gn3HUEv9z7ra91TPNesyp+Pnc+dYKFwwJDbIh5Z+OY
         P14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J74YHf3ie7EaU63+SY0GQSf4YHEgWreO7FWC0ay2bw8=;
        b=xNc5hWkMxGiY6r3Pysa6jlJdkspmIcymhnuflf1uEvpuPSqwKHwiTAFM3nZ1KPiYIA
         T3BZ6cmP9GAdekKaKb7MdtgB6ACnx40YaNxpfqGScg6frl6d2QIpvacblQvuRK6xeYtg
         9RFii8my6s+raQjroCs33LU9rctQv7sb/zH2jzbp/HPhazJ38h0ZPqPxItmweiuJqYFb
         YRZxR28yqLZDPjqloSmZs8/lpIVqbHmz2OsGQr2YVwZvtjtykw8sC+sRQTwWQirDs3e+
         WHOCKim/5jk8AiSp1SPWLIuQhS2VwzwJUSNyy4Rg8ld7uXLRGuCl7iGrhWJt9oVoWjFG
         Kg8Q==
X-Gm-Message-State: AO0yUKXVTrH9bPNgbJEbMEo9g3KHCNSH7QBIz+rf0lsgWgGolJDfjivm
        1L3L2323kcxCU++sDjpyjEOZQQ==
X-Google-Smtp-Source: AK7set8AgoS42l3aYBmi6ssUgphTAVWKiJuZGpw8TVRlOcNRbOod9d2aTGw/bl90SBxhX0d8T/pI9w==
X-Received: by 2002:a17:906:3994:b0:878:4dd1:5161 with SMTP id h20-20020a170906399400b008784dd15161mr22037674eje.11.1676291683426;
        Mon, 13 Feb 2023 04:34:43 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id by8-20020a170906a2c800b0088b93bfa777sm6839596ejb.149.2023.02.13.04.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 04:34:42 -0800 (PST)
Message-ID: <6760207f-b2db-1f19-f265-1d965f8a155f@linaro.org>
Date:   Mon, 13 Feb 2023 14:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/9] drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-3-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213121012.1768296-3-konrad.dybcio@linaro.org>
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

On 13/02/2023 14:10, Konrad Dybcio wrote:
> In preparation for supporting multiple sets of possible base registers,
> remove the num_dsi variable. We're comparing the io_start array contents
> with the reg value from the DTS, so it will either match one of the
> expected values or don't match against a zero (which we get from partial
> array initialization).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 13 -------------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 -
>   drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
>   3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

