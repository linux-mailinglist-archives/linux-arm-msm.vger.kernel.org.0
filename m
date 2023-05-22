Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC68D70C11F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 16:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbjEVOaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 10:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbjEVOaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 10:30:20 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D4790
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:30:19 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30a8dc89c33so1024868f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684765818; x=1687357818;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hFK421sZXWsImy57dELQxYVenyACa8ZOpTwTIi+yNIw=;
        b=u/r/NVvXme3cZ7Ea4cG1CU5o9nQKccOyY+/BXGX/1woSBPRIOj70AJxpnWHSbw+4K6
         71yOuzdutGLLuF2sB7wbxkjBToHAmCW1yHqNQEHn0xEGvxbgEaMJ0eDQ+UFAZcIa2zeo
         bLL9o9V669iRdjKuecLzMCskR7pdjoRAuzIEHiXQCvtkKeFNxkLrYvF9cwc04GE7+iSp
         fq1kCID/SEM4o2bU4upBtKlPabQjVPX8eLNh0b8S8uRnelfXiJ92yKlD8ZFcwstt0pkz
         QcZfgBtzkfnDneDnARpGQlHfY8X3C8ZJ19mC30pADHtA20T7B0lMFEoBJ0OblJDPsImG
         bJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684765818; x=1687357818;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFK421sZXWsImy57dELQxYVenyACa8ZOpTwTIi+yNIw=;
        b=kJupuQo25AmTiVjCvl1K/mYBM1KTPokbT7uJgYWvor6fb62Pb9nrhvMB1y398wccfS
         yvWxs6DgaJWzpD8GVdtRnKVpugDUAY3e6roBk0TGCQfAQHlYvRRE6dM10uYysW1K9PaU
         eTO4rmqr3O/cxrORVpGFwj1UelBmnd8gk3T+ip7wHx4MN6YAPNCxOQ2T1YRm8zkFmn4J
         Jn1DfAXyrzaFDJYy9ab7IKLlyJrdikGpIt5RycniRKZR1FysJRU91bupizOJTvl2i7l0
         Z04w8fC92ekfwx9NaE1viyGCpHq/6UKMDuico50GZd4JgzJjVcO70tKjOH7Wv+CeJaI/
         AIwQ==
X-Gm-Message-State: AC+VfDzOeGUH1pIK3BPo+edBLtCYeXoJ8XaqW45CdG0QPchC3pzds6F6
        hbK5ROrkluw0S/ojDSllUA+PrA==
X-Google-Smtp-Source: ACHHUZ6jp7pFJGLKkM0oSfQH+CsPG3CtmrXSNeF0MsvLuYbEaTX0c1jMICvmjd29Uk6I/zOgD2bqhw==
X-Received: by 2002:a5d:4ace:0:b0:2f5:3fa1:6226 with SMTP id y14-20020a5d4ace000000b002f53fa16226mr8094109wrs.14.1684765818439;
        Mon, 22 May 2023 07:30:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df? ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
        by smtp.gmail.com with ESMTPSA id t5-20020adfe445000000b003079986fd71sm7900536wrm.88.2023.05.22.07.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 07:30:18 -0700 (PDT)
Message-ID: <ba804b7e-1ad4-1898-337e-487dd6c92b0d@linaro.org>
Date:   Mon, 22 May 2023 16:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/6] drm/msm/dpu: inline __intr_offset
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> Inline __intr_offset(), there is no point in having a separate oneline
> function for setting base block address.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 5e2d68ebb113..0776b0f6df4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>   	return intr_status;
>   }
>   
> -static void __intr_offset(const struct dpu_mdss_cfg *m,
> -		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
> -{
> -	hw->blk_addr = addr + m->mdp[0].base;
> -}
> -
>   struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   		const struct dpu_mdss_cfg *m)
>   {
> @@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   	if (!intr)
>   		return ERR_PTR(-ENOMEM);
>   
> -	__intr_offset(m, addr, &intr->hw);
> +	intr->hw.blk_addr = addr + m->mdp[0].base;
>   
>   	intr->total_irqs = nirq;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
