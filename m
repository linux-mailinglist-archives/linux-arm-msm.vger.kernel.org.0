Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E35B6FEAAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 06:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236538AbjEKEc1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 00:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236019AbjEKEcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 00:32:23 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ED14ED1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 21:32:22 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ac81d2bfbcso87168991fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 21:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683779540; x=1686371540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fZFm+JnD3HFWQBsOX43ZNxNVH7brnnd/ur7Hm3Pkxg=;
        b=CXZF7Z20QEgTREai8N9LOpTty5Bke8VUoaSb4+5TPg7hT50ChZJe5n7yWLr5AYkzcJ
         NxzoVOV0qfE4O0If5SsIqh2q1xAnlUXPcfnS9a7TLy3FOdXdeUT2yBkV3UgFl18fyJ3E
         bfgDZwzrzwmh5caYfpbSBmgk+BEcWl2atgdmoOAaKv76cazSNpOQBPj+nvfZtFfrVZz3
         tW+Y1hMjtMpvYmN3UuiI6cAiDCk0VEepY4O71h37FY09xOXJrttRsC6MjSelRSwiuCJL
         wJhoz5yvsRSVFpn4PNIAicxgELINAdXwFLRAQHjxvM8AIgG9BCQk5YYzOHxQT6LwLcVY
         vGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683779540; x=1686371540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fZFm+JnD3HFWQBsOX43ZNxNVH7brnnd/ur7Hm3Pkxg=;
        b=I/L9Il+MlrgMkapFqHEV4LPuTmrvk5iYIxerz7FAgc7AUbrMOicKpCCJOlMBHBHs4P
         ny3NBCPnRfk8bnsz88MnYCN3QutdT73SFDcnATC4rf5dkOMP++zlRzDA2UTjCr/NW9Go
         KF+6qJHJN3gyc5EInBj4Nfqlv7rJWQ//7ymVHJlHVZJdaYKp64zqKhMgn9ayngrtEafd
         rfG7VnJS/5usU+E3R/IPA79OQ2d6q3UC1S27/qsdHFttN2/qPXgMvzziURpSjR9a4PP2
         ee4ebAfEwyMoi+IrHpjG5BgbcYbq7gG80LjIIl+cjs+iJmYgjRGY0FRpKnhz9mexWycW
         v1/w==
X-Gm-Message-State: AC+VfDzWsQ9IHMTla557VB9Vbv4V4rTagLIKCrd1VVRmKoN8QEbyJE2E
        D+NZsrNj3ToJ/EaFeHId5Wtcyw==
X-Google-Smtp-Source: ACHHUZ6apjC2HOcRzLnDFGzNFE7HRyDFwjWl+ULrE2cF5wbMaZ5Aj7O+iD+E7Y4dMT5duaVR9DWVKw==
X-Received: by 2002:a2e:884e:0:b0:2ac:7304:c94d with SMTP id z14-20020a2e884e000000b002ac7304c94dmr2976098ljj.41.1683779540595;
        Wed, 10 May 2023 21:32:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b004db1a7e6decsm966447lff.205.2023.05.10.21.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 21:32:20 -0700 (PDT)
Message-ID: <f3685a18-7431-dfd5-ce84-f0ad3a21fc57@linaro.org>
Date:   Thu, 11 May 2023 07:32:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC bit before
 assign DSC ops to PINGPONG
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
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> changes in v6:
> -- split patches and keep the function file handles DPU_PINGPONG_DSC bit at this patch
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++++
>   1 file changed, 6 insertions(+)

For the patch itself:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..e7f47a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -295,6 +295,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   
> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>   };

-- 
With best wishes
Dmitry

