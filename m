Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1702E6D046F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjC3MO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjC3MO0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:14:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E385B46B4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:14:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h9so19375691ljq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680178463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SP2YlZyISHNewW8z8zBIMxcJaMHy1BeOtTXTgZeoKOw=;
        b=jKFFiNuAxfGXl2I67xHNM5wLyCpqP180X0VY/D1iaEd//84GfxoTumeEZjtDBYhA+r
         ZeXbGT5tqW6pjtZbtYtWBnR3S9+FRzQG/EhHcco5Qh1iJKN2EKJ0h/YtUsaaAb3N163m
         fs3gX/b33MUuYwzSH6dt7zXDyv3I+YjpuvM1wKd6pKnzxZrXg6xBUfp2An2jTOzjbyqc
         eMKMaxn3iEXUBGi6t/9vyVs3nnEzDzUp9yE/D6pcuMUhgwGYk/d4B5APtRaN7I91o5Fm
         YrAR2iDTuLmhgxUOZYsppACbPcR9L33XT8ZD2yz3l7CRM3qZQFGcNK9z/vYtJDT6hvq3
         I/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680178463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SP2YlZyISHNewW8z8zBIMxcJaMHy1BeOtTXTgZeoKOw=;
        b=eCjw5Kozwr6fmaKO75gPzyrgB1kK5pvSA6NJfR1hAyDCyNgASRu0Dndpfd75PqO489
         Tw7kl//wj580k4K0HpdT2ukgjIYbH+o3AxfSmoaW0DL8QHXkimyVxktdTyRrV474fdVP
         MQLwi8mYijwFoEuULL3hg732EeU19vIMiz1ikzihlAZFSf0ck59Co0ynku/RNeIssaeg
         1CIdU1Fm/k8y6Jhiif21nc473j8bIU9kBlc1KUtgH/bcs6zmdQqZ7/hWFClJ29TZDj4O
         MDPUd52gaat/Ao1GJHOD5c9u5gCf8jMhOQNizTnCh4euvf+as2zNsGj7aw3DG9p4x3mo
         sf/w==
X-Gm-Message-State: AAQBX9dX5RGi2IuwQp1ZWj+PdyGysqYAMgWuXynPV8DHuRT4tx2X3pPC
        T3X5/Z/Za/f/mj1JlEZtyx9sUg==
X-Google-Smtp-Source: AKy350bf++1ibezMHqQkNatUa3aTRWUnvgX+rsRoKTk7gkw5NlRvj/loztTNOxTUFJpNVNZBdrZ6xw==
X-Received: by 2002:a2e:86d9:0:b0:298:a1c3:287e with SMTP id n25-20020a2e86d9000000b00298a1c3287emr7581625ljj.47.1680178463163;
        Thu, 30 Mar 2023 05:14:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id u3-20020a2e9f03000000b002a2b9d9429esm2925789ljk.117.2023.03.30.05.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:14:22 -0700 (PDT)
Message-ID: <a4d1aaea-e118-1c85-4766-c2f678ac0051@linaro.org>
Date:   Thu, 30 Mar 2023 14:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,29/50] drm/msm/dpu: split MSM8998 catalog entry to the
 separate file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-30-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-30-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 189 +++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 191 +-----------------
>  2 files changed, 191 insertions(+), 189 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> new file mode 100644
> index 000000000000..c963365a9945
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -0,0 +1,189 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_3_0_MSM8998_H
> +#define _DPU_3_0_MSM8998_H
> +
> +static const struct dpu_caps msm8998_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
[...]

> +	.clk_inefficiency_factor = 200,
> +	.bw_inefficiency_factor = 120,
Sidenote: this seems weird.

