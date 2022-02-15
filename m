Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96CF4B6DD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 14:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237457AbiBONmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 08:42:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236994AbiBONmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 08:42:20 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A747B1A8E
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 05:42:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bu29so31718477lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hY0Up7/tECmXoFbl+HD7sgq/lhDX16Q/eetVj5TEA+A=;
        b=GJRNsptHtcwMCCI5t8nKm74awQJH4mTGXqy79eq6kuo0MWFnru3J/Wciju/WVxNwWc
         HhXeuLmmBgNboXt3XHJiNj4hLpei7bs9RhvJS+ZWEQObdNNe/eiSOzMBO2DLwgokGlgh
         vq0YAafZnPsjIiwvjB5+UlyxKB9JQOnz7zsSQUDTChUadhOgpDvCr5emUsQdvY6Zgoof
         3G9FE2IsO/xhkYzfCw4Wp5kSjiKagHMQv7bp3AWpfjRFPb6P0cGhq7lCZkZjr8NzoRep
         g+ZcGSLdcX+tKB3rHzkzxcycXQj42sM6G5p+IHRXYdlhYE76KjnjIvseDbx0UCBfmqIA
         42lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hY0Up7/tECmXoFbl+HD7sgq/lhDX16Q/eetVj5TEA+A=;
        b=fjjVUt2Mczn3BcT6R7D5lQrSKiKWqGlBBVik7viuz+xrj/V+ueAAGfKJ21qXHrIXTu
         pXop3g38tLqjK71NZwMWbgtIYiwYtMPeDV9EG5FaRKF1C5b6OSmq2UeghyrDBYz3UP0O
         LLHBl+0qbHC+aHZa/AKyqJJjFxIP3NmiEXwJn4aBrubPBMZKBThpprLfncKdkAWVWDIR
         laPx2Sw+8uSKEBELhQ1sYLJw4Im5nVsmD8V1vo6OGXH8ZuEdSz7W+56RGfSTMsAznEM7
         kVbwUEssDDujac+9fiG+K/mVPE9UFqfXwAz42xWXc68sr91kzWgEAXquS0d78M+ARpD1
         YUoA==
X-Gm-Message-State: AOAM530qNwtwfdPo8U34s0kyxHockVU0LYiwQf2GIVmYqc8ULSa/ii3e
        CqM4vucGiegOK2DP6nQZPtf0QA==
X-Google-Smtp-Source: ABdhPJyygcLbWYZapMlywGrtm+oGAbrJxcLx9ZuA+tZLQURE0YAg6PKPf+a/5npgmFrFOtPH26QoQA==
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr3238337lfr.444.1644932528534;
        Tue, 15 Feb 2022 05:42:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6sm4522430lfu.48.2022.02.15.05.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 05:42:08 -0800 (PST)
Message-ID: <34f2eea3-c486-87ff-668d-7191b59c7d6f@linaro.org>
Date:   Tue, 15 Feb 2022 16:42:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: Add INTF_5 interrupts
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/02/2022 07:33, Bjorn Andersson wrote:
> SC8180x has the eDP controller wired up to INTF_5, so add the interrupt
> register block for this interface to the list.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes since v1:
> - None
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 6 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index a77a5eaa78ad..dd2161e7bdb6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -23,6 +23,7 @@
>   #define MDP_INTF_2_OFF			0x6B000
>   #define MDP_INTF_3_OFF			0x6B800
>   #define MDP_INTF_4_OFF			0x6C000
> +#define MDP_INTF_5_OFF			0x6C800
>   #define MDP_AD4_0_OFF			0x7C000
>   #define MDP_AD4_1_OFF			0x7D000
>   #define MDP_AD4_INTR_EN_OFF		0x41c
> @@ -93,6 +94,11 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_4_OFF+INTF_INTR_EN,
>   		MDP_INTF_4_OFF+INTF_INTR_STATUS
>   	},
> +	{
> +		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
> +		MDP_INTF_5_OFF+INTF_INTR_EN,
> +		MDP_INTF_5_OFF+INTF_INTR_STATUS
> +	},
>   	{
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 1ab75cccd145..37379966d8ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -22,6 +22,7 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF2_INTR,
>   	MDP_INTF3_INTR,
>   	MDP_INTF4_INTR,
> +	MDP_INTF5_INTR,
>   	MDP_AD4_0_INTR,
>   	MDP_AD4_1_INTR,
>   	MDP_INTF0_7xxx_INTR,


-- 
With best wishes
Dmitry
