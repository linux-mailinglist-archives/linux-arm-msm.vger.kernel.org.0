Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC77859C9F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiHVU1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236898AbiHVU1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:27:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDA42C66F
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:27:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a16so8575243lfs.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=loYNWu7FRv2ThLC9ofsf4DwxdBiFsBUPefz91dNaNro=;
        b=BG/imemOmfpqBeOzL5CFYMAkxTPOeLgLdS7RJtZBRG6bIpbeog6aJj401flbO6GPgv
         DUUQs0HooT6mBtST4Z35dH3KEVTNOyz+2xxfcfcsL3J44Yv0hfWQKft6sR478G5+KkDQ
         EZdPWieOK1TzlgDiPB/V0ih4+3/NZ2IXcZMDhte9XckL1+XgijaV+UlEh6PSloX3uePI
         ctJzme61A5KE0mth7+KY17OGTocV/y1jTDSPt9vw/eNbayk6211LiNbClIYhB92rTXTh
         Bx4tY2wznshcIjbs1clZMBZMEMhxR6DW2y8nryErc0jtfjI0tHdIeWQ/TzOBwNj7Jl/D
         POcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=loYNWu7FRv2ThLC9ofsf4DwxdBiFsBUPefz91dNaNro=;
        b=1brjbdhOCmBSJnRUwHYD/vxWzAMUlpr10uTpwZp4HAR0tHGeEXsW2mopky3RR05kyQ
         dSEQSSFrsMNFnGhmrCa+JYDsHBNVrJa7yaKyz3gQKVBofyuDP8xP+GqSqqSl20pM7+wk
         snShETBt/IkppZiYazFLoRM6u0flTVZh51fLEDEUgA2yMUmHiNzoQNgBaLWAOrc0x9q0
         AW8+SLNDN/7xOBBp0S1qWgWgat/QIG+yfgDBldEWAJ1r5S6kSNSTC5EwT0r8n1JlLuJN
         EH3R4gTAj/b7H/jNFMlUdqyEMsOlw2pAyyhpOetYq0R1ZZ0m6YzvfQdpVkqOZf+ScEPH
         NsLg==
X-Gm-Message-State: ACgBeo2U2FMHTRIy22O0hSVhpMTQq9v4mpWs6fjkqF+4xSJfZe4HkJbp
        DlRTwI241HDg3LRjRSuF1yTSdA==
X-Google-Smtp-Source: AA6agR4SmBR2z0Jp+Wr4jWA1Ua44vfUbLuyVcmjgNhY1h8LKQdoiYvY1uOEb0+pyAs0UXkL4y5xvdg==
X-Received: by 2002:a05:6512:2985:b0:492:d9dc:b3e3 with SMTP id du5-20020a056512298500b00492d9dcb3e3mr3821940lfb.426.1661200031863;
        Mon, 22 Aug 2022 13:27:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v16-20020ac258f0000000b00492dfcc0e58sm875694lfo.53.2022.08.22.13.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 13:27:11 -0700 (PDT)
Message-ID: <eb7ab2ea-de23-0ed4-466c-d422b48af276@linaro.org>
Date:   Mon, 22 Aug 2022 23:27:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dpu: Fix comment typo
Content-Language: en-GB
To:     Jason Wang <wangborong@cdjrlc.com>, quic_abhinavk@quicinc.com
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        quic_kalyant@quicinc.com, quic_vpolimer@quicinc.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220724204242.4107-1-wangborong@cdjrlc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220724204242.4107-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 23:42, Jason Wang wrote:
> The double `be' is duplicated in the comment, remove one.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71fe4c505f5b..38aa38ab1568 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -76,7 +76,7 @@ enum {
>   
>   /**
>    * MDP TOP BLOCK features
> - * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
> + * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
>    * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
>    * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
>    * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth

-- 
With best wishes
Dmitry

