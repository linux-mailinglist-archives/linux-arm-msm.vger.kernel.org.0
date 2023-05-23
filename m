Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C9070DF84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236110AbjEWOky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237339AbjEWOkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:40:52 -0400
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBFC139
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:40:49 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so2303327e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684852788; x=1687444788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfPbF+pfNryuLeOwunW5hBDLem6I21D/ZP6zdS6Z5fE=;
        b=CChN9vLcknEVg4w5lLAaXPgLtbpQPQfKDDmz5zBDRZ24x+C6ngTmvM5OwtBT972K5O
         nBQeVgu//hzmedk0OsJtMEM0BPk6ZOLK9O9Kx7y3zrrt6k6eAUOsgOhspYnVmWh462pC
         nQ8eFxu6Emp93yLuPAibGaAf8koQwBXrgMin1C9e4/tUXCE3HsUH/hP0lLa8isD82sfX
         9cNWSKtFzZ1Ay865MOGAIpkZdOh3GmOYHIo1tBUWffTbxup3qM57h9wNMKG6Cbp0c4sS
         LPHu8SEW06V4pvLO9YoJehKXGQsHhSIK2uxpbXGqL5hgIb/l9WYJNGlsHtFmtUWVOT7i
         ZGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684852788; x=1687444788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfPbF+pfNryuLeOwunW5hBDLem6I21D/ZP6zdS6Z5fE=;
        b=atueex6+q/uQ22g8938uph4gkYBviCoEdlM7PTYSKPR5omdWfzgO917RJBguLJGh11
         v2c2KpOJ1FdZIu6ekC+FbJwfYJr6IxRLPqYZa3uDxZC+qexmTtgObDRgJCeuNpWmXmgd
         EsYxJWLPUUHpGOxx2245qc0arP4Vs/ki+UKy/Y31+3ishwfXjz7nfLFvDsCXCIR7rU6+
         5NI2r0YjGqyL1XM1tMEdpB7L+jWTQVHcG217qZjWc+0ZWzG10rTHMdfCN0HvEV2dV2Yi
         k6lC3aa6B94czwRh3MOXTIIXIqXMrFuE1aHfsyK8cJDdzv0XhOauagwWAj4B5uVsojfA
         hkIQ==
X-Gm-Message-State: AC+VfDx6UPNrJXRaVqDs6vzF3Beeny13Kl9B3d2AWiM8s8kp4y0yNeOz
        VoAeXPb6fQAMOtmGya3DsO5jEw==
X-Google-Smtp-Source: ACHHUZ4B/K8ujjGFZUtWcWYxYqD1Y6WKumhmX64ROwFpyvkogGPmqosOwd2FjPNL/SWIbp2gmxEmww==
X-Received: by 2002:ac2:5ed1:0:b0:4f1:4fe6:56c8 with SMTP id d17-20020ac25ed1000000b004f14fe656c8mr4710296lfq.34.1684852787926;
        Tue, 23 May 2023 07:39:47 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v17-20020ac25591000000b004f37918bb20sm1366684lfg.248.2023.05.23.07.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 07:39:47 -0700 (PDT)
Message-ID: <358e3015-0e42-4f8c-8c1c-ce27106984cc@linaro.org>
Date:   Tue, 23 May 2023 17:39:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 06/12] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-6-998b4d2f7dd1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-6-998b4d2f7dd1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 10:46, Konrad Dybcio wrote:
> Add SM6350 support to the DPU1 driver to enable display output.
> 
> It's worth noting that one entry dpu_qos_lut_entry was trimmed off:
> 
> {.fl = 0, .lut = 0x0011223344556677 },
> 
> due to the lack of support for selecting between portrait and landscape
> LUT settings (for danger and safe LUTs) and no full support for
> qseed/non-qseed usescases (for QoS LUT).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 173 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   5 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 180 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

