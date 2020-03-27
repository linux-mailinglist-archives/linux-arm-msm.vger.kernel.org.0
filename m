Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE472195228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 08:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgC0Hhw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 03:37:52 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46117 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgC0Hhw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 03:37:52 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jHjYj-0002rV-K0; Fri, 27 Mar 2020 08:37:41 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1jHjYg-0002CN-Co; Fri, 27 Mar 2020 08:37:38 +0100
Date:   Fri, 27 Mar 2020 08:37:38 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        s-anna <s-anna@ti.com>, Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] remoteproc: Use size_t type for len in da_to_va
Message-ID: <20200327073738.o633jukxpmue4aeg@pengutronix.de>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-2-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-2-cleger@kalray.eu>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:36:42 up 132 days, 22:55, 152 users,  load average: 0.15, 0.08,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 02, 2020 at 10:38:55AM +0100, Clement Leger wrote:
> With upcoming changes in elf loader for elf64 support, section size will
> be a u64. When used with da_to_va, this will potentially lead to
> overflow if using the current "int" type for len argument. Change
> da_to_va prototype to use a size_t for len and fix all users of this
> function.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/remoteproc/imx_rproc.c           | 11 ++++++-----

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

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
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
