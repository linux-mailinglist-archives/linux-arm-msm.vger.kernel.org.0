Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C319A4B70F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236310AbiBOPQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 10:16:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236005AbiBOPQt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 10:16:49 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFFB41995
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:16:39 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so1617152oos.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1ts+DysZBP3Fk9YvZ0HkFKUTlIrINUUB+qMVi+XB4xg=;
        b=ElJfexzG+s95N7RLESkvdDA0n8ZKZ8AXW7mszPN/VbW7YxdYaXwiLdi+X02TZJ2auL
         dO4zAtvAdBA0QyGCZv8HXijxnfmMQki9AklqFffIJxHJudkIMJ5MzrnhdInWp36503v4
         dblADlPE5En0kiHKxwTlKzeDSAMum4ZNHSSx27vgCaj2W+Xg97fo78VZl9T32RdFqbLl
         OB5ipmu5NA+d/PzTB1vpaY7yISkO/cNzmecvey2C6kH/tZ/Ge0t04ODAldv1RR65o6Vq
         tlE8fho5wOicehOlI3NLKqEKp99HHj13NWPx75LLArY59rLYgimAu5DLwXnB+9xFU6Rj
         uT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1ts+DysZBP3Fk9YvZ0HkFKUTlIrINUUB+qMVi+XB4xg=;
        b=nH1j/LeMGCavOuXE/lO7t0tb+Bj3DdXntq2EUYOANZ/nNKIEnejv9mx9+bw17TMhSZ
         pAhZ6BB+gpHQgzsF+nI2XJxDcOk/HSbxJrcCxjTb6q4ZncspfNwu7jdl4V+OaU0NtXtm
         LR6ImnshYIVmFED7UXvTLBB2qrKIV00iUtxSWwmAU6AHP2YjDmtAgm4E0OXNuV3QHqxO
         iSJQWPWBEawbFLag/WLt+3BGnlLbvn9494/L3xHp09RjjURr4dLoIFV8NbdzK1feJOSV
         tOnsxrmNANxtEnw393XNbdLIOqFlGHJaX4I91yF0/R0PwXVDcRpb6WrGWfkytoUhI5sM
         /tcA==
X-Gm-Message-State: AOAM531uWzHZlXjYLtmEfG3K3FKxwQvHpvbEodFrEnuYpuVcD/+relga
        ZPpiwYsBlhzZ/i8x79+NdNGzLg==
X-Google-Smtp-Source: ABdhPJwJfcwzqWijJtAs5kf1G4teVCQGSMOsW6WhptZhd7xMf9U1KQ0Qy7qSAZ1tX3OK5oGg/XkF1w==
X-Received: by 2002:a4a:d622:: with SMTP id n2mr1391443oon.19.1644938198461;
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id f16sm3086611oae.6.2022.02.15.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:16:37 -0800 (PST)
Date:   Tue, 15 Feb 2022 09:16:35 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: drop unused access macros
Message-ID: <YgvD08auVa5Pbpgm@yoga>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Feb 08:53 CST 2022, Dmitry Baryshkov wrote:

> The access macros BLK_foo are not used by the code, drop them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index cac0298aeb52..975ff3a4ae3d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -778,22 +778,6 @@ struct dpu_mdss_cfg {
>  	unsigned long mdss_irqs;
>  };
>  
> -/*
> - * Access Macros
> - */
> -#define BLK_MDP(s) ((s)->mdp)
> -#define BLK_CTL(s) ((s)->ctl)
> -#define BLK_VIG(s) ((s)->vig)
> -#define BLK_RGB(s) ((s)->rgb)
> -#define BLK_DMA(s) ((s)->dma)
> -#define BLK_CURSOR(s) ((s)->cursor)
> -#define BLK_MIXER(s) ((s)->mixer)
> -#define BLK_PINGPONG(s) ((s)->pingpong)
> -#define BLK_INTF(s) ((s)->intf)
> -#define BLK_AD(s) ((s)->ad)
> -#define BLK_DSPP(s) ((s)->dspp)
> -#define BLK_MERGE3d(s) ((s)->merge_3d)
> -
>  /**
>   * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
>   * hardcoded target specific catalog information in config structure
> -- 
> 2.34.1
> 
