Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 779FC69B4B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjBQVZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBQVZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:25:53 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4390F64B00
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:25:42 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h30so2561913ljb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORR0AQhnlGMPN31e9mPJsCgrOnth8Cg37H+T3TwuNc0=;
        b=EoKqClsxJvczaooILRkmTBpck9RRYIHxHhARz8ghkE8ju8QcDyIPrBdTfevR7Z7AYF
         bQvRcgTxf3QXT3o+H7K62Y1yvdZ99qrQDH+WtYWTyVIw80V+nDv62YyBoaZKLIAbH56g
         jf3LIQbBz8bo+W1AvacimbCzHm/J6YBzWx1Wn8MLFLclXLAvF0jnke0Mvt6d+RMbJx/r
         qRbrGwgZxk5J9sZMf9Yia+L+eo6jHfR+gHpeXfVYCtPECh32Dmuez+UhF9KDPoQNms/+
         KGUJ1wv4V2NMYKV55/yZrCYnbb1fQcmwca5HaYPXOprKOubiHt30ejmd2g3BUdl7aHdK
         f8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORR0AQhnlGMPN31e9mPJsCgrOnth8Cg37H+T3TwuNc0=;
        b=r5dZSfoO2EGK65eS8GE7VZAPEumDYkAOHB0jhZbHca7lxwwPHenPm8xhnr7y6nW6wk
         CuGNDMa3zKFgpCbRun2pcH6Mpx2YDPaH1JmddJXPoCNpksbrbG1AEvVEXv+JtQsvC42z
         j7SkIgK9vzEhjnA7I3jBOFL1NS0cHMC+RL5BCGJuUdtfVrZNdx8pkKP2od1xWtkIAfHs
         UzxXsfZf9cUyaAyc0rd0ePVd3aVc28YoYzgHgf0MvEVG1NoXgz92EhS5YGjwaEit36ns
         4iApmFJL1qfi+E8LLTiCzPQYNT7uUMt6XMerT43qDf+En5JaHD/0XugTI5Cam88TgyEe
         fkWw==
X-Gm-Message-State: AO0yUKWC+k7P2W21E0nqCBMvIb3Q9gs7UdgFqg6WGuV/7Bl+PcCnerI3
        Om8hFQWRV18PpozAlQ4hEZoCGQ==
X-Google-Smtp-Source: AK7set83FcpuRjdr9aqb+dOcUa1SF8I+J/myUtqrLeob8tTbxS+Ehimel0K+msGa0mKWSfujy0Ztag==
X-Received: by 2002:a05:651c:2118:b0:293:4ba3:17be with SMTP id a24-20020a05651c211800b002934ba317bemr1091977ljq.11.1676669140539;
        Fri, 17 Feb 2023 13:25:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020ac25dc2000000b004db513b0175sm783715lfq.136.2023.02.17.13.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:25:39 -0800 (PST)
Message-ID: <a13997c2-3b68-7c30-2486-c56cb7b72170@linaro.org>
Date:   Fri, 17 Feb 2023 23:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 14/14] drm/msm/a6xx: Add A610 speedbin support
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
 <20230214173145.2482651-15-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-15-konrad.dybcio@linaro.org>
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
> A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
> (trinket) and SM6225 (khaje). Trinket does not support speed binning
> (only a single SKU exists) and we don't yet support khaje upstream.
> Hence, add a fuse mapping table for bengal to allow for per-chip
> frequency limiting.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

