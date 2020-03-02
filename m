Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0BF1767C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 00:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgCBXG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 18:06:29 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34223 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgCBXG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 18:06:29 -0500
Received: by mail-pj1-f65.google.com with SMTP id f2so394654pjq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2020 15:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XO6JGw83U5CkKd8cGXLECqKNNR8rYCcvmbE8i6nEu+U=;
        b=pQd3TTVcuglvG6TY1SI80ABdKtkem3lObcwmKjby4QigaEuhh64S37ql/uiNoD/2Tr
         gDMiWeoclcLBjMVgTlZqi3UgUJF1eXfEeBmdKYb2kEDUUYf1qWVdecbmcZsT8rmgje7f
         z0zBnC4u87pEhTTJA4iH55XwaX/Ks7YRIZb+4opDaSyhISk47lQX3758Kcq0EPhdG1qj
         txg3S1d38qdt4qj5aZUIcq5MmPFzPUwK/hOrdx6ShNlWkuZwXpJ1g7aBtlU69biBUTB5
         sMyBlcVHvsZbH388D4vg8U82gIKcknZjRt5V5+627+pmF2QM8KpjgA/E5zi/b8ZKo83N
         AJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XO6JGw83U5CkKd8cGXLECqKNNR8rYCcvmbE8i6nEu+U=;
        b=GMTN4SQLw8VOyMxnT3NEmMT21zJEmT+p7xwVu7GkOfVDmTquRV3Mgea3jZ9gPEBUmf
         0PLKiCrsxTiTxRrMKUQjy10yonozwkUoTVsi8jzxg3kSjtCJb9I3Kd5ee0UC7BoW1WT9
         4SLWJWHigVX5LE6QUm0esiJixA3Qb6QmGR7KI2jDvrBeHjHAJ5UBHiz/ouW9ZmrBq4EI
         mu3aB5ZtVIB0Xu5JvQFs4EmdBol/YrdgzVEHPKKv1znZWsxhUd4QA7DL7CtTCMse9TUY
         qklBdARlHkldaVBYakZI8PNf2mCgR2V9F7JZ9EVpaK8AdYBw7nJ2yOd75P/M168BXpYW
         yG6Q==
X-Gm-Message-State: ANhLgQ1gic8KMjQ6+wQyDjHpT1N6qoaOnZANmDJ8pQQjX/6OtMf/u28Q
        MN38SzF3TOXC8jQSkqml+c+grw==
X-Google-Smtp-Source: ADFU+vvTMeEEOpoL/4D2rdOc5U9tJ59Ij4qQQegmRoXugU1NEMYq/AxoVSr4pm/xhYoynzB3g/UDIQ==
X-Received: by 2002:a17:902:ab81:: with SMTP id f1mr1395152plr.5.1583190387359;
        Mon, 02 Mar 2020 15:06:27 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id c15sm21095020pgk.66.2020.03.02.15.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 15:06:26 -0800 (PST)
Date:   Mon, 2 Mar 2020 15:06:24 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 1/8] remoteproc: Use size_t type for len in da_to_va
Message-ID: <20200302230624.GA262924@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-2-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-2-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:

> With upcoming changes in elf loader for elf64 support, section size will
> be a u64. When used with da_to_va, this will potentially lead to
> overflow if using the current "int" type for len argument. Change
> da_to_va prototype to use a size_t for len and fix all users of this
> function.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/imx_rproc.c           | 11 ++++++-----
>  drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>  drivers/remoteproc/qcom_q6v5_adsp.c      |  2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c       |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c       |  2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c      |  2 +-
>  drivers/remoteproc/qcom_wcnss.c          |  2 +-
>  drivers/remoteproc/remoteproc_core.c     |  2 +-
>  drivers/remoteproc/remoteproc_internal.h |  2 +-
>  drivers/remoteproc/st_slim_rproc.c       |  4 ++--
>  drivers/remoteproc/wkup_m3_rproc.c       |  4 ++--
>  include/linux/remoteproc.h               |  2 +-
>  12 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3e72b6f38d4b..8957ed271d20 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -186,7 +186,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>  }
>  
>  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
> -			       int len, u64 *sys)
> +			       size_t len, u64 *sys)
>  {
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	int i;
> @@ -203,19 +203,19 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  		}
>  	}
>  
> -	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
> +	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%zx\n",
>  		 da, len);
>  	return -ENOENT;
>  }
>  
> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	void *va = NULL;
>  	u64 sys;
>  	int i;
>  
> -	if (len <= 0)
> +	if (len == 0)
>  		return NULL;
>  
>  	/*
> @@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  		}
>  	}
>  
> -	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%p\n", da, len, va);
> +	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%zx va = 0x%p\n",
> +		da, len, va);
>  
>  	return va;
>  }
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 5c4658f00b3d..cd266163a65f 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int vqid)
>   * can be used either by the remoteproc core for loading (when using kernel
>   * remoteproc loader), or by any rpmsg bus drivers.
>   */
> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct keystone_rproc *ksproc = rproc->priv;
>  	void __iomem *va = NULL;
> @@ -255,7 +255,7 @@ static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  	size_t size;
>  	int i;
>  
> -	if (len <= 0)
> +	if (len == 0)
>  		return NULL;
>  
>  	for (i = 0; i < ksproc->num_mems; i++) {
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index e953886b2eb7..2b01f2282062 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 471128a2e723..3401a17f8ce6 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct q6v5 *qproc = rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index db4b3c4bacd7..4e89d04673a4 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index f93e1e4a1cc0..f1924b740a10 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct q6v5_wcss *wcss = rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index dc135754bb9c..0c7afd038f0d 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 307df98347ba..5ab094fc1b55 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>   * here the output of the DMA API for the carveouts, which should be more
>   * correct.
>   */
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct rproc_mem_entry *carveout;
>  	void *ptr = NULL;
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 493ef9262411..58580210575c 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>  
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 04492fead3c8..09bcb4d8b9e0 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct st_slim_rproc *slim_rproc = rproc->priv;
>  	void *va = NULL;
> @@ -191,7 +191,7 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  		}
>  	}
>  
> -	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%pK\n",
> +	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%zx va = 0x%pK\n",
>  		da, len, va);
>  
>  	return va;
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index 3984e585c847..b9349d684258 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -80,14 +80,14 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct wkup_m3_rproc *wkupm3 = rproc->priv;
>  	void *va = NULL;
>  	int i;
>  	u32 offset;
>  
> -	if (len <= 0)
> +	if (len == 0)
>  		return NULL;
>  
>  	for (i = 0; i < WKUPM3_MEM_MAX; i++) {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..89215798eaea 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -374,7 +374,7 @@ struct rproc_ops {
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
> -	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
> +	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> -- 
> 2.15.0.276.g89ea799
> 
