Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEE66366EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 18:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbiKWRZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 12:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236917AbiKWRZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 12:25:44 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0336C8DA6E
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 09:25:43 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bs21so30456997wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0o7n9aYBSzoZxwFuSe0/TKLoFU4W7raNANzVNncYvXw=;
        b=DnkaY1AG+EjDI4cVCnGzmVOqU+YklwNcFSMU20ugCQlYHt6tL84ipDdUv62fmxfmCD
         9QXmMIMf1nEBvHUXecPfiC7ahZAvciHaaS8/kfXzpHK4MLAqU1Fz2vHFa1stnRCA78GC
         dNin8IhEyES+8TYkC3qDkUbsuM4u6PXZA44hEM7V1WQPPXjCU210OEshGOJSNvBh5or6
         +F2hvGBFlEWe+nQs7EQE2cpSqNrLy9wkr5mk4CM627InzdcmAnH6RKIDbzDwZoCUasnB
         SLyIls0KjkKoz0HxMIEW1EaekLfyerQt9r6T6eCiY0ONiwX4xUyq5o+bFV/2/gj05DSt
         ypzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o7n9aYBSzoZxwFuSe0/TKLoFU4W7raNANzVNncYvXw=;
        b=Pa3iIVPXO8b5OBmhC2r1odZ55QNgIwqoypsoQ5zipTnHjkaKLiaZ/9fLUyR6Eb/pac
         nO9zNpUFNtLFEsaryBSmgZomQ0KCtljDxW1zLORsXlTeiUODHGSUIRrXrhV8jkaZ4jWW
         4456d6YaQxHSHDFpBWhGnKYgWSSL4aE1H0Iyl03pJFldu+tzg0DL3bVTGEdydVNSQpbL
         r0SvmaaevEtFV2Jawy0bDpRAx0igLSvc8jdVXisM9bLh9yTGAVdZOXG13rh6ToinjpYh
         zPm2da6lLdzduDFNnHQd7uhfzbr17tVJDZBr0d5u/pboeFN+ctQIKw0/u3SvLqNDJxNV
         HgbQ==
X-Gm-Message-State: ANoB5pmhTco69TYrUzIoKQrl4pTQCo+vJmc8UTGmzWfOHD6qS8NjrJ8D
        CRlFiy4LR6CC+d9SzUTzqAXioA==
X-Google-Smtp-Source: AA0mqf46S5Kp6+tlC/ZeFeE9K8YM4Q32ncP7DtA/Mwx2P3YNXWLeIywpLCyBi55242hteDKz3KBw4Q==
X-Received: by 2002:a5d:4604:0:b0:241:dd0f:49e5 with SMTP id t4-20020a5d4604000000b00241dd0f49e5mr8346820wrq.113.1669224341491;
        Wed, 23 Nov 2022 09:25:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003c70191f267sm3346689wmp.39.2022.11.23.09.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 09:25:40 -0800 (PST)
Message-ID: <034d653a-6402-6973-4caa-8ea2219c7064@linaro.org>
Date:   Wed, 23 Nov 2022 18:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-10-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221122231235.3299737-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> On sm8450 a register block was removed from MDP TOP. Accessing it during
> snapshotting results in NoC errors / immediate reboot. Skip accessing
> these registers during snapshot.
> 
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38ab1568..4730f8268f2a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -92,6 +92,7 @@ enum {
>   	DPU_MDP_UBWC_1_0,
>   	DPU_MDP_UBWC_1_5,
>   	DPU_MDP_AUDIO_SELECT,
> +	DPU_MDP_PERIPH_0_REMOVED,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f3660cd14f4f..67f2e5288b3c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>   				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>   
> -	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
> -			dpu_kms->mmio + cat->mdp[0].base, "top");
> +	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {

This fails to build on linux-next, either I missed something while applying or it should be:
-       if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+       if (dpu_kms->hw_mdp->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {


> +		msm_disp_snapshot_add_block(disp_state, 0x380,
> +				dpu_kms->mmio + cat->mdp[0].base, "top");
> +		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
> +				dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
> +	} else {
> +		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
> +				dpu_kms->mmio + cat->mdp[0].base, "top");
> +	}
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }

Neil

