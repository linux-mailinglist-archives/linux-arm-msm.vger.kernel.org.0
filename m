Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB7CF1CB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 18:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbfKFRqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 12:46:04 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:41241 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfKFRqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 12:46:04 -0500
Received: by mail-yw1-f65.google.com with SMTP id j190so4100237ywf.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 09:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ti2WIrG/wqVpP6gwSLMr10D1CGH87UGB79Iwp1jjWko=;
        b=IhxBw/0pqpQSQ9R7a5DrsROMdvGXM67XkxQ2UirspG3CCZcPw2VgEkhV4uhOHzsggD
         p2e6ztsXbDfECjlQazuurS8Ig1LCO5Yd+Z2ON8NxO23pQNsmafoj57jLxorJbr4KVwc2
         4l2ov/HkhF0TdQQ7Nphnxj2Oque1M5QzM+9lOL3ZbsxXhZMl+4noMvz2jeKbHPK5vGcP
         JJi4+xMB3I45K+plZysx4/nwu6Aum9+LFsfAl/2gWJISxN+3kJrz96a7Ns6teGzqnaKf
         fHuUaIxpB38o4QiIlD5AeSUmbS2X49uoWGZurbJ4uomVtAK2TMvUDcTqKPPlOGyBfXh7
         JAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ti2WIrG/wqVpP6gwSLMr10D1CGH87UGB79Iwp1jjWko=;
        b=TcoJhrok6FHNCVFtme6B7Zp5ol0/SnJ8ttxIFBwY0BvbucZFWX/5lgdPaMd94g0rX/
         wtdXz9pNqTmJk2vn5nD770BeZJI+SHvVJax5XXGh075slzVgbx4d/3zmHiV3MOhMsFHR
         69SUFG9416REvKUD46qyKEfgurnqhJsgidU/TCS+43INN6Z+JNeCrUIlun0eZw1tQikW
         FsfD3xd4rq7SWgCipp+h5EQ2weQnWZOU79W21s/fUboTwkT6sNA6ezvZpL2zlaVAHaEo
         6qEfZaRcFNj5iR5mjkZvShE7picIQZTEYZNt5lthac3khzsqAYWzY/QhArxlGZD960sp
         BNgg==
X-Gm-Message-State: APjAAAXcshRcjW/V/CBXLfDl0sJRG86QiPZ9ZPjcX8C1otETj3zHfr6s
        /OEBCsttwmuK8HuLpNRtzw9WuQ==
X-Google-Smtp-Source: APXvYqx+E9tcHAdNQprtoLG2oNzLkUnhaDZUthibXbPbXDss3FV9KlCr/w+GU/N9UxBctOFYTUsCUw==
X-Received: by 2002:a81:7a52:: with SMTP id v79mr2598939ywc.254.1573062362106;
        Wed, 06 Nov 2019 09:46:02 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id t7sm6670902ywe.19.2019.11.06.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 09:46:01 -0800 (PST)
Date:   Wed, 6 Nov 2019 12:46:00 -0500
From:   Sean Paul <sean@poorly.run>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix debug bus register
 configuration
Message-ID: <20191106174600.GB63329@art_vandelay>
References: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 06, 2019 at 05:19:23PM +0530, Sharat Masetty wrote:
> Fix the cx debugbus related register configuration, to collect accurate
> bus data during gpu snapshot. This helps with complete snapshot dump
> and also complete proper GPU recovery.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

Applied to drm-misc-next-fixes

Thanks,

Sean

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 483e100..c5764b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  		cxdbg = ioremap(res->start, resource_size(res));
> 
>  	if (cxdbg) {
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLT,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
>  			A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));
> 
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLM,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
>  			A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));
> 
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> 
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
>  			0x76543210);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
>  			0xFEDCBA98);
> 
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
>  	}
> 
>  	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
> --
> 1.9.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
Sean Paul, Software Engineer, Google / Chromium OS
