Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4828B6D86D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbjDET0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbjDET0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:26:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C443D65B2
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:26:44 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k37so48097606lfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680722803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLzcG4MlgKosPfKnQ7gBaLqnAXjlpOcz2IP39djzqQA=;
        b=iVI1ivOySHvEATGbtZys7Llh1hRYym3+IE3pqF7OQVh131FPTSQ08dU1P5Bl7PbQjE
         8tRBb6XjM6jnmmqWZ+iYBhwhMYUzlKFo2+1CvPQbea3T/zs8nrN4NeEY4HabUAcHcRtl
         qrl6fv/8ltGvyBPvJcNGcT9293MRLwhYZSsWVKFs8Asr5qEPU9Wdo5Ij1QeLpJcsXAvj
         7doocd6fk99r3DP8gaMpV5hnmVA2mWCP7QVS9WuXCtq6EMeEvEonBcQ3C2PQFYY9+6MM
         RZrdqQOrMkl+vAogCPARUWxcZw5VsqUJ3cWfeUi/OuiRU5FfTYQKAZMHRKj4Iyy8H/f7
         ephw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLzcG4MlgKosPfKnQ7gBaLqnAXjlpOcz2IP39djzqQA=;
        b=NBguEMiOhaYimU6kfp3tC2wi/90SGz9Dk8AYEjeaMFe655Ul/nGsOdoJ6clnbFgIjq
         jl0InecocsXzAOKmHZ5+Q/nmIbSMjp5AKf3f6Pmakof9jsBMI5eBlIfo9tbuI6camH2t
         Lq+Yr3/70ec8bdS8AEB3lJeTsosmbUS9slaaM24xlOC3g9rmjOrK2YO5IJn7SjzVlDPC
         gzeuzYfZndl8CjS/Du9rKWNzLc6GcAPOIto1kqDBwP7CRzSYffQ/foe2+15RC4hLH5/H
         hqd/SI55KqF2SILLxvGJdMBGzg7F1uxjSviBoHpmMi6TeQwSUxXvPmYwr4vT1VbHoERd
         eYVw==
X-Gm-Message-State: AAQBX9ddu3G7+lfYXsWK807xeUARBk/RDu4S89TE7MHCa+lvMuE9j+Pi
        +KnK9Tzgfhy1qVei+m8et1cDAA==
X-Google-Smtp-Source: AKy350ZPNae/60EMSzL3SX+s6Rjo7g3DhUIiFceN+lJi5idmfimC0ZyqIWujsjc1inS04npdZA0/dg==
X-Received: by 2002:a05:6512:991:b0:4eb:7fa:38b9 with SMTP id w17-20020a056512099100b004eb07fa38b9mr1476205lft.8.1680722802996;
        Wed, 05 Apr 2023 12:26:42 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l3-20020ac24a83000000b004eb42f5367bsm1487186lfp.19.2023.04.05.12.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 12:26:42 -0700 (PDT)
Message-ID: <f10ea7e8-fc59-a843-85f0-9aa59bd9d66c@linaro.org>
Date:   Wed, 5 Apr 2023 22:26:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/6] drm/msm/dpu: Fix slice_last_group_size calculation
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-3-1b79c78b30d7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-3-1b79c78b30d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 03:41, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Changes in v3:
> - Reworded slice_last_group_size calculation to
>    `(dsc->slice_width + 2) % 3`
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

