Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1695F8DA8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Oct 2022 21:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJITOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Oct 2022 15:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiJITOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Oct 2022 15:14:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBED91F9FE
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Oct 2022 12:14:18 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z15so3399192ljq.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Oct 2022 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLmKWVTMUSHqEP9DIVkRM+ZnS7XRFcavZfbEdhp8mMc=;
        b=D3znIKzXKwQaxB7Ox3lpizhW7NS6r19zfvTiJftlw02OF9QCPjt9kbEIllwQSDwAZm
         bbQd6AGAx4o2TTHo7hE884uCEcGqpp6G4Ny7jvmIBpXYmT2rwz0rUyxYHHYb6xXZLDHc
         E/DV8n9stU9dLyYaAgvDlJFsbnUibYlnZ3lQiZYIXY6gD7JTWs4L3E2890nEcjUZGl/p
         uegdz2Z11CjMAJ7dwVkfNE9BlNRrCClWYLW6o+2UaccXyf4zJIrbSLQt8/GNaAY2oQap
         k8xV2eGWsUXni6SEBMXVz/OEX8Xxc0HYD+ZcLhdkj1uBQdTp3VrXeNoO6jBsfp9PWNDD
         kUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLmKWVTMUSHqEP9DIVkRM+ZnS7XRFcavZfbEdhp8mMc=;
        b=zDgCdMtlqCwCp7Iu0oFoc/r3RMzG84gLWVUn7rQtpxwQrVcGnWB4JJW7uqUxuDskvN
         n2colHpaHtKE6UzyLDrSgUGLbx789XDNjimyuGU6mFbJtKezJl+c/bM3Qrv+uYRD42qo
         /t7VxfPqjI/N9GxwpCVogoT/2wGOI1sFAY8TomvweUc+MUlWI+Xq0nlu5hwgvmqdFzYO
         E+aW3lrFfW6Yr6tP9SaOR7l716keUwdeAl+QFjmwVUmDxV6rxqA9CxUrHSRRrtMMy1vB
         GYPCPdqFSiLiIKyzcHDUZ9mCQbBwOltQnZDCKEo4XeBvzyhf3yat7ry+reI+QvcH+Stk
         nNOw==
X-Gm-Message-State: ACrzQf0B6yRidOfWyHmpIK0FBciOExLpOhqrYRiFLIMVaGQWBIAKHYFu
        krvZKa5Ec7DgR0jzjR9ae3teqg==
X-Google-Smtp-Source: AMsMyM4a9wjRAHNMLggg3ZrR/45pdnYmZIpeoXCdgpM946/5KOUGeLQrsUAwlMweZbXSn4hMmZKK0g==
X-Received: by 2002:a2e:a54b:0:b0:26c:72ed:b758 with SMTP id e11-20020a2ea54b000000b0026c72edb758mr5535281ljn.245.1665342857092;
        Sun, 09 Oct 2022 12:14:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d14-20020a056512368e00b004946c3cf53fsm1117170lfs.59.2022.10.09.12.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 12:14:16 -0700 (PDT)
Message-ID: <408bf6a2-47fe-3eaf-7235-578d33a576c9@linaro.org>
Date:   Sun, 9 Oct 2022 22:14:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 10/10] drm/msm/dsi: Prevent signed BPG offsets from
 bleeding into adjacent bits
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185316.462522-3-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009185316.462522-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/10/2022 21:53, Marijn Suijten wrote:
> The bpg_offset array contains negative BPG offsets which fill the full 8
> bits of a char thanks to two's complement: this however results in those
> bits bleeding into the next field when the value is packed into DSC PPS
> by the drm_dsc_helper function, which only expects range_bpg_offset to
> contain 6-bit wide values.  As a consequence random slices appear
> corrupted on-screen (tested on a Sony Tama Akatsuki device with sdm845).
> 
> Use AND operators to limit these two's complement values to 6 bits,
> similar to the AMD and i915 drivers.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Side note: the DSC params tables are more or less common between amd, 
i916 and msm drivers. It might be worth moving them to the DSC helpers 
from the individual drivers. This would mean such masks handling can go 
into the helper too.

-- 
With best wishes
Dmitry

