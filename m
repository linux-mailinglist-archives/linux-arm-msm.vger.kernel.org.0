Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D883160E92F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 21:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbiJZTmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 15:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbiJZTl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 15:41:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24DACABF8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:41:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r14so30963904lfm.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlJf3bJtBBgfFdtr4YnzwfnWV9gabWn1JKDOmEMYAcs=;
        b=OaLRVdla/d+TMqXrOSWuQDnvl/G7v76nRGBeNbCqwidDlA8awO3d5kSaxKuHb6uhkF
         Nw8YdrDWyEnIij7buDNTNnMa2aSEqwgANRyQ3ajpcYUFNNK9c+oJ8hVOMg2Q1fe+J1aG
         aiY7MSOx82phb+XMhm1/SwWIqD+PWr8ITBEH/eXc9vUL+bAsq2V0qY1TFMsYo9IF8QeI
         TugngMXn8L2O0W3K6u49V43g6OJfNd5VQ3F0LVg9HYAhHdtJ4mE0sy07SlVKXNRwwKa4
         2/4kfn8ucbcPfBsiCL4CpWG1AhnRvwRGTWzzRcrzlvTBXUTWAHOx7ZtwLczl+0y/wX1P
         cWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlJf3bJtBBgfFdtr4YnzwfnWV9gabWn1JKDOmEMYAcs=;
        b=W1lo8WuCRdgLOlRwLy7ajUPeRY4/WwBroFLfExpGGwQPlnADDePRNA1XbN37W/nq/8
         aScLeP10etJECTyxU4ZB/qSP2josF33M/ZS0utwGdx32qk7TXQ8U8O9rL8z7suG1qtnb
         Fd3K+6G3dl9SseDlfBDstsTAdGimL7hQhJRPugzjvxO1fnaUJ9UEG4ziWc0nYgzMktEl
         1WA5735su4Z6NUNG1NJPzygP+1/mr8/anlptoUKKZUKW2cQUGIUGeINhmptg6PHj62JR
         QRgzBEP8PwI/eLWn11xeMf2wINFQXy01xJm+fmWAKM9crwvlYFPDy/+dqYZCf1Ozyax+
         fVHQ==
X-Gm-Message-State: ACrzQf3vuXB59TSuknm/UNriU/8iZ2jSQIA2FoyzsPxlmgCbpxeLBysL
        8WkirK8tyicuIHbr+IEVSKS3dw==
X-Google-Smtp-Source: AMsMyM7PFC5Uw4to/B1qlnRLPHlmqEyPFzMnsc0jMDHWsc7stttckh7FiiZh9Te3P35yPA6tQ0aD6g==
X-Received: by 2002:ac2:5cba:0:b0:4aa:5b6d:fb33 with SMTP id e26-20020ac25cba000000b004aa5b6dfb33mr7781326lfq.491.1666813315070;
        Wed, 26 Oct 2022 12:41:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512314e00b0049f6484694bsm942263lfi.161.2022.10.26.12.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 12:41:54 -0700 (PDT)
Message-ID: <3aa1d8f5-156d-2bd8-b9fc-3e496d7d64d3@linaro.org>
Date:   Wed, 26 Oct 2022 22:41:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221026182824.876933-1-marijn.suijten@somainline.org>
 <20221026182824.876933-7-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221026182824.876933-7-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/10/2022 21:28, Marijn Suijten wrote:
> As per the FIXME this code is entirely duplicate with what is already
> provided inside drm_dsc_compute_rc_parameters(), supposedly because that
> function was yielding "incorrect" results while in reality the panel
> driver(s?) used for testing were providing incorrect parameters.
> 
> For example, this code from downstream assumed dsc->bits_per_pixel to
> contain an integer value, whereas the upstream drm_dsc_config struct
> stores it with 4 fractional bits.  drm_dsc_compute_rc_parameters()
> already accounts for this feat while the panel driver used for testing
> [1] wasn't, hence making drm_dsc_compute_rc_parameters() seem like it
> was returning an incorrect result.
> Other users of dsc->bits_per_pixel inside dsi_populate_dsc_params() also
> treat it in the same erroneous way, and will be addressed in a separate
> patch.
> In the end, using drm_dsc_compute_rc_parameters() spares both a lot of
> duplicate code and erratic behaviour.
> 
> [1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/pixel3_5.18-rc1&id=1d7d98ad564f1ec69e7525e07418918d90f247a1
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 64 +++---------------------------
>   1 file changed, 6 insertions(+), 58 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for the expanded explanation.

-- 
With best wishes
Dmitry

