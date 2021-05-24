Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BEE38F166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 18:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhEXQXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 12:23:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45841 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbhEXQXg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 12:23:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621873328; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=d86HdzAHhrf4IEpfZ4/vyjNlQnDG9yPdqowShLGUBek=;
 b=KaFvtygurYuB4FA+3sTV00hwK1e0J6P2DLDlWToD1aa3LN3MN9ihmhsusEffvkNUE0l+jM4E
 70TcLJGLtSjQOVFtDboZut8UPjgYzrhwiZ6QAlr+muiQhriWxx2CJHTMVjRP42KeOBmw/qsP
 2lF37pKiof0ZhQAovZ6QMzGCNKo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60abd2ab67d156359a55b2c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 16:22:03
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F142C4360C; Mon, 24 May 2021 16:22:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BED77C43146;
        Mon, 24 May 2021 16:22:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 09:22:00 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        aravindh@codeaurora.org, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/3] drm/msm/dp: Simplify aux irq handling code
In-Reply-To: <20210507212505.1224111-2-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-2-swboyd@chromium.org>
Message-ID: <1f22bcd197fe5c7062ecddef337a7aa5@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-07 14:25, Stephen Boyd wrote:
> We don't need to stash away 'isr' in the aux structure to pass to two
> functions. Let's use a local variable instead. And we can complete the
> completion variable in one place instead of two to simplify the code.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 22 ++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>  3 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 7c22bfe0fc7d..91188466cece 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -27,7 +27,6 @@ struct dp_aux_private {
>  	bool no_send_stop;
>  	u32 offset;
>  	u32 segment;
> -	u32 isr;
> 
>  	struct drm_dp_aux dp_aux;
>  };
> @@ -181,10 +180,8 @@ static void dp_aux_cmd_fifo_rx(struct 
> dp_aux_private *aux,
>  	}
>  }
> 
> -static void dp_aux_native_handler(struct dp_aux_private *aux)
> +static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
>  {
> -	u32 isr = aux->isr;
> -
>  	if (isr & DP_INTR_AUX_I2C_DONE)
>  		aux->aux_error_num = DP_AUX_ERR_NONE;
>  	else if (isr & DP_INTR_WRONG_ADDR)
> @@ -197,14 +194,10 @@ static void dp_aux_native_handler(struct
> dp_aux_private *aux)
>  		aux->aux_error_num = DP_AUX_ERR_PHY;
>  		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
>  	}
> -
> -	complete(&aux->comp);
>  }
> 
> -static void dp_aux_i2c_handler(struct dp_aux_private *aux)
> +static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
>  {
> -	u32 isr = aux->isr;
> -
>  	if (isr & DP_INTR_AUX_I2C_DONE) {
>  		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
>  			aux->aux_error_num = DP_AUX_ERR_NACK;
> @@ -226,8 +219,6 @@ static void dp_aux_i2c_handler(struct 
> dp_aux_private *aux)
>  			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
>  		}
>  	}
> -
> -	complete(&aux->comp);
>  }
> 
>  static void dp_aux_update_offset_and_segment(struct dp_aux_private 
> *aux,
> @@ -412,6 +403,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
> 
>  void dp_aux_isr(struct drm_dp_aux *dp_aux)
>  {
> +	u32 isr;
>  	struct dp_aux_private *aux;
> 
>  	if (!dp_aux) {
> @@ -421,15 +413,17 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> 
>  	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
> -	aux->isr = dp_catalog_aux_get_irq(aux->catalog);
> +	isr = dp_catalog_aux_get_irq(aux->catalog);
> 
>  	if (!aux->cmd_busy)
>  		return;
> 
>  	if (aux->native)
> -		dp_aux_native_handler(aux);
> +		dp_aux_native_handler(aux, isr);
>  	else
> -		dp_aux_i2c_handler(aux);
> +		dp_aux_i2c_handler(aux, isr);
> +
> +	complete(&aux->comp);
>  }
> 
>  void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b1a9b1b98f5f..a70c238f34b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -292,7 +292,7 @@ void dp_catalog_dump_regs(struct dp_catalog 
> *dp_catalog)
>  	dump_regs(catalog->io->dp_controller.base + offset, len);
>  }
> 
> -int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
> +u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
>  {
>  	struct dp_catalog_private *catalog = container_of(dp_catalog,
>  				struct dp_catalog_private, dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
> b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 176a9020a520..502bc0dc7787 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -80,7 +80,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct
> dp_catalog *dp_catalog);
>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
>  void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool 
> enable);
>  void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
> -int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
> +u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
> 
>  /* DP Controller APIs */
>  void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 
> state);
