Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABAC3AD11C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbhFRR0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbhFRR0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:26:01 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE09C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:23:51 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so10414029otl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dpGFkaHJZF+IqmupQdbq1kX0hUGiA31okox4xpJXrIk=;
        b=u8rxZhaq6Z24u7VGfpZE8Rf38hY5YrHI8U6v1Jr/x/Gi6K6hPzD9yfNgqijQzuRqGn
         X50Pk5UnK/PMM98TKkjE9jIlDUDp5EldVLs+5H0W/lIE47Bk7N2uOmG6eqku+7A97is4
         DRRf39RL1mQEoMgnhWkJU1dYLub3GCMhITBpCCxLZSOaM9VxhibpEI90gRI6ql9bu5Ek
         xz2mn5WPNECDJ8idv8GtRnrxrJKHpjXGyitldre5gZ5+E/ewj8I6v8xop29P0airOmSt
         /JUHjLiURaWk/yG7q8oeNxvH/td7793AQoCsHOpAcIEDv1CY4tDhJrAM9GZ1zL09qZla
         fLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dpGFkaHJZF+IqmupQdbq1kX0hUGiA31okox4xpJXrIk=;
        b=kEYEH0VG4oMHcvXvHKiQL2prkmseZk12gxC34Dk5xm/QIdwgufSPwPnPMCnkhrW9Db
         KjlTujtK3t+ZfBEuh4DwLyV+aqbFYvIz50rB0M0YK8o9uAOXJYMkV2ASLSrdK7gml574
         oKXdFQc+1F1EfusM9oErE2K5Ieq0/0iAb1chYIxIwvxhohr2yBKAPPrDK/VKAuQNHQDO
         uBMKWQZk8EC4aYby2mtWOlhkie24MgWZukrv6HYPnejuBB6zUWT0Pd62japFK+RlSg88
         ZEsTxCi/0XTGEtgaMCgnsL1DXWUO5laaPS7VdlrgjMEyJIHw0AAq+zSl0piQ27zpAa9S
         EulQ==
X-Gm-Message-State: AOAM533PGVDUUqVvA02dos3z4tIhIg9mczUwy6X7hZKMMBpufDqi6YyG
        eMthsCV41TbfjKTCLrexjBtDfA==
X-Google-Smtp-Source: ABdhPJyVk4csBhAqgltbQb+qQ0EyQgcJARVf1IzOXOpZP210ow6MNvz+q34/u8Iab7myVwU/ZqWPvQ==
X-Received: by 2002:a05:6830:1208:: with SMTP id r8mr10489566otp.155.1624037031076;
        Fri, 18 Jun 2021 10:23:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v82sm1953237oia.27.2021.06.18.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 10:23:50 -0700 (PDT)
Date:   Fri, 18 Jun 2021 12:23:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soc: qcom: geni: Add support for gpi dma
Message-ID: <YMzWpPnfczMBsZ2x@yoga>
References: <20210618141839.3777270-1-vkoul@kernel.org>
 <20210618141839.3777270-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618141839.3777270-4-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Jun 09:18 CDT 2021, Vinod Koul wrote:

> GPI DMA is one of the DMA modes supported on geni, this adds support to
> enable that mode

I think you're missing an opportunity to describe what GPI DMA is.
Perhaps something like:

In GPI DMA mode the serial engine uses the DMA controller found in the
associated wrapper to perform its transaction, add support for enabling
this mode in the engine.

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 32 +++++++++++++++++++++++++++++++-
>  include/linux/qcom-geni-se.h    |  5 +++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 08d645b90ed3..40a0a1f88070 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -307,6 +307,32 @@ static void geni_se_select_dma_mode(struct geni_se *se)
>  		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
>  }
>  
> +static void geni_se_select_gpi_mode(struct geni_se *se)
> +{
> +	unsigned int gpi_event_en;
> +	unsigned int m_irq_en;
> +	unsigned int s_irq_en;

readl and writel operates on u32, so better to use that.

> +
> +	geni_se_irq_clear(se);
> +	writel(0, se->base + SE_IRQ_EN);
> +
> +	s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);

I don't mind this being _relaxed if done on purpose, but as it's the
only one (and there's no comment) I get the feeling that it's a mistake.

> +	s_irq_en &= ~S_CMD_DONE_EN;
> +	writel(s_irq_en, se->base + SE_GENI_S_IRQ_EN);

The use of 3 different variables (gpi_event_en, m_irq_en, s_irq_en)
forced me to really look if the three sets of operations somehow reused
previous results.

To clarify that this isn't the case I would suggest that you use a
single variable ("val"?) instead.

> +
> +	m_irq_en = readl(se->base + SE_GENI_M_IRQ_EN);
> +	m_irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> +		      M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +	writel(m_irq_en, se->base + SE_GENI_M_IRQ_EN);
> +
> +	writel(GENI_DMA_MODE_EN, se->base + SE_GENI_DMA_MODE_EN);
> +
> +	gpi_event_en = readl(se->base + SE_GSI_EVENT_EN);
> +	gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
> +			 GENI_M_EVENT_EN | GENI_S_EVENT_EN);
> +	writel(gpi_event_en, se->base + SE_GSI_EVENT_EN);
> +}
> +
>  /**
>   * geni_se_select_mode() - Select the serial engine transfer mode
>   * @se:		Pointer to the concerned serial engine.
> @@ -314,7 +340,8 @@ static void geni_se_select_dma_mode(struct geni_se *se)
>   */
>  void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
>  {
> -	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
> +	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA &&
> +		mode != GENI_GPI_DMA);

This line can be left unbroken.

>  
>  	switch (mode) {
>  	case GENI_SE_FIFO:
> @@ -323,6 +350,9 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
>  	case GENI_SE_DMA:
>  		geni_se_select_dma_mode(se);
>  		break;
> +	case GENI_GPI_DMA:
> +		geni_se_select_gpi_mode(se);
> +		break;
>  	case GENI_SE_INVALID:
>  	default:
>  		break;
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index 5fda675c5cfe..336b682392b1 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -11,8 +11,9 @@
>  /* Transfer mode supported by GENI Serial Engines */
>  enum geni_se_xfer_mode {
>  	GENI_SE_INVALID,
> -	GENI_SE_FIFO,
> -	GENI_SE_DMA,

Is the order significant? Is there a reason why SE_DMA ended up last?

> +	GENI_SE_FIFO, /* FIFO mode */
> +	GENI_GPI_DMA, /* GSI aka GPI DMA mode */

If the TLA soup is too soupy, then perhaps we should just document it as
"external DMA" or "Use wrapper's DMA controller"?

And perhaps use kernel-doc instead?

Regards,
Bjorn

> +	GENI_SE_DMA,  /* SE DMA mode */
>  };
>  
>  /* Protocols supported by GENI Serial Engines */
> -- 
> 2.31.1
> 
