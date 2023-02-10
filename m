Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415256920AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 15:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjBJOTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 09:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjBJOTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 09:19:11 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0D0302A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 06:19:10 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r2so5205940wrv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1uTFfmvobksvpoGMelQsFMa0FYBiyHzYPIzwFP1iQCw=;
        b=OTFNGu03iKhaysy/pY/1pl3FPBrTNkjUm6x5Sb/3sRJoxAE76OhyP0zP72fc2EtuOd
         XJFePkwrYGy1yhpPYo7IsuNsHrqFTjin4aNNlpKZUIjYlmmI/UY/bJZV2UxN7iUGgLz5
         8sUBB27Z7UZuzcsC4Ff9TyKOL/Lrrmj04YlIISU2RmoEXhJeTvWYAE9Hx3Fgk7K4Af7/
         oOZ06FWW0NIdNCmw5fwGEDjItE1OSgZRAsyGeH2KUAUAnoeODq3E76ajy18qIckAkKsr
         QMkByf81kU5S5vctaL5a5IAqkLmZepYEIedIdC7nPgcdaS75KzwO5STeMF6YlmXxDJ5y
         9B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uTFfmvobksvpoGMelQsFMa0FYBiyHzYPIzwFP1iQCw=;
        b=zZxCkJ+IJj6wrpPp12KZ/CzsY8nMseUw4ZUptRiy/c7BEavnokKwajyjl3V1MOI9Jc
         J9l3qbOoccbVycPTPsaxhx+G0tjhthP5sIQFNttKuXuAm4BHkpLAG27I/yKBPz+P71sb
         40vrMG7psQO93eVcGgX3GZUqKu1NTZSBp0cHTNYze2RVIbd0OWH4/wFnj1Pnmg4XfiGD
         eMoztom2HmS4fA39U0zK+9TEN6VsEvaEVWmumogsiPH2t36MISidYIqG0AMKj8WdSQbL
         hUP66URBzKe2wFBiwu6T/6hACINcDc/zCfUgbY/l+i4NpNMJ6qkD96UvP0kdV+b3RpfS
         ZRqg==
X-Gm-Message-State: AO0yUKXnB0GY261BYnhj7vd0x0g1jH9LzrY23natSmAtqUQ1b+w1OoWS
        CCgiGi3HTQic0QQwGiNA8KbgNA==
X-Google-Smtp-Source: AK7set8E+f+ZV83w6B4IZTO9iq19ePvcHokwop+CDn+zBqZ/sctxhXM7i0ujcsYzlSt9Utc2g5ywwQ==
X-Received: by 2002:a5d:464b:0:b0:2c3:f8b6:666b with SMTP id j11-20020a5d464b000000b002c3f8b6666bmr4591136wrs.26.1676038748717;
        Fri, 10 Feb 2023 06:19:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d468d000000b002c54c92e125sm584454wrq.46.2023.02.10.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 06:19:08 -0800 (PST)
Message-ID: <63ea4f1a-a9be-eef7-bfe9-acb5567b4107@linaro.org>
Date:   Fri, 10 Feb 2023 15:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 15:15, Dmitry Baryshkov wrote:
> The SC8280XP also has a black hole at the top of MDP_TOP region. Set
> corresponding bit to disable access to that region.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3fa202da62fb..f792275dc48f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -743,7 +743,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
>   	.base = 0x0, .len = 0x494,
> -	.features = 0,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
