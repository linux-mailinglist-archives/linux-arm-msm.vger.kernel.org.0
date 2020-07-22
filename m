Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC4A228F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 06:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgGVEZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 00:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgGVEZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 00:25:34 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2FFC0619DC
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 21:25:34 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x9so338963plr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 21:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JyfZs1fHQ/blLkrFQMU2v7JeeEiViiuzIwxf6ciMQ9I=;
        b=I/nH1rdUUeezvq6ZwJWq4DyrdZI8DByuPbtlNnssIK6q6k2rpYikkIFiECE9U1yhsz
         Kz4JOM6k9hfmQU7PLBpQt3WI6sLoju7etL0XGZBu2T3n2Cm5ac+HYBUx1uVhdqBn3fwF
         KLQh5mUnVJTOmlW/fRckNHhtDDykqakfcdDeEqV/JO11FcRtReRITaD5FS/7xFkPDq3m
         2h3voWOWhvl8yNNLIx76jwzXojeE9XHx7T31nOgnFx/BuJW8V3slWds/6FA5RU2ZXDdY
         lzZ1MnjliX2KcmllKFgzJSLqsQyXGwzycA88UwKlRLClBlPXmKa+EVTFw0OhHY3/LQQV
         a1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JyfZs1fHQ/blLkrFQMU2v7JeeEiViiuzIwxf6ciMQ9I=;
        b=XkbCTPCz7DWSN1JlyOFsJt+wjtzRUezB/nvQ9myrv8LyDQY71KFasLNTRuGcb1tQol
         tBSx21o0bfF4liqiT6nUWb3NkiRYokC5EFZbG2CFGwNocD8u41xr51nWnpUWybKgLGNR
         2OQKg56pqLHtvj8rPO2vbimBzTSTqa/q6v4KJqdLKerXTtlOIbMxSvAOZ61Amjrhpi0D
         v91vzpvcR5oU4/qW1ARO9eVwC0+RLad0s1+P92MCBIK/0EyNcOpn86whL3PPvp8JrkRR
         6eZBI/22voWDhZyO1hYT7O0qrHfab4uKWCJA9tlx9OZDOuGkdYxLpe0rRqZ+hCtvcWD/
         kFFw==
X-Gm-Message-State: AOAM532YbIoRDUf2hetqDKebc/7mLDWFzCdX4NAfsERz/rLzgdcqMob/
        j//X7P0R06vuE3v1uJ72RgrxkTovet8=
X-Google-Smtp-Source: ABdhPJywKGCqP7OKsj8nI23NT9BWESLDFyZ8piR4UWAnPiyIyq3Om8NCWNNqfh0AA1agHvT299UGpw==
X-Received: by 2002:a17:90a:1a83:: with SMTP id p3mr7554984pjp.113.1595391933557;
        Tue, 21 Jul 2020 21:25:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s14sm5048791pjl.14.2020.07.21.21.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 21:25:32 -0700 (PDT)
Date:   Tue, 21 Jul 2020 21:23:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Add MBA log extraction
 support
Message-ID: <20200722042339.GO2922385@builder.lan>
References: <20200721112935.25716-1-sibis@codeaurora.org>
 <20200721112935.25716-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721112935.25716-3-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Jul 04:29 PDT 2020, Sibi Sankar wrote:

> On SC7180 the MBA firmware stores the bootup text logs in a 4K segment
> at the beginning of the MBA region. Add support to extract the logs
> which will be useful to debug mba boot/authentication issues.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Afaict this is completely independent from the other patch in the
series, so I applied this.

Regards,
Bjorn

> ---
> 
> V2:
>  * Don't dump logs in mba_reclaim path [Bjorn]
>  * Move has_mba_logs check to q6v5_dump_mba_logs [Bjorn]
>  * SDM845 mss was incorrectly marked to support mba logs
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 38 +++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 49cd16e050533..945ca2652e7d6 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/devcoredump.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> @@ -37,6 +38,8 @@
>  
>  #define MPSS_CRASH_REASON_SMEM		421
>  
> +#define MBA_LOG_SIZE			SZ_4K
> +
>  /* RMB Status Register Values */
>  #define RMB_PBL_SUCCESS			0x1
>  
> @@ -141,6 +144,7 @@ struct rproc_hexagon_res {
>  	int version;
>  	bool need_mem_protection;
>  	bool has_alt_reset;
> +	bool has_mba_logs;
>  	bool has_spare_reg;
>  };
>  
> @@ -202,6 +206,7 @@ struct q6v5 {
>  	struct qcom_sysmon *sysmon;
>  	bool need_mem_protection;
>  	bool has_alt_reset;
> +	bool has_mba_logs;
>  	bool has_spare_reg;
>  	int mpss_perm;
>  	int mba_perm;
> @@ -521,6 +526,26 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>  	return val;
>  }
>  
> +static void q6v5_dump_mba_logs(struct q6v5 *qproc)
> +{
> +	struct rproc *rproc = qproc->rproc;
> +	void *data;
> +
> +	if (!qproc->has_mba_logs)
> +		return;
> +
> +	if (q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false, qproc->mba_phys,
> +				    qproc->mba_size))
> +		return;
> +
> +	data = vmalloc(MBA_LOG_SIZE);
> +	if (!data)
> +		return;
> +
> +	memcpy(data, qproc->mba_region, MBA_LOG_SIZE);
> +	dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
> +}
> +
>  static int q6v5proc_reset(struct q6v5 *qproc)
>  {
>  	u32 val;
> @@ -839,6 +864,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  {
>  	int ret;
>  	int xfermemop_ret;
> +	bool mba_load_err = false;
>  
>  	qcom_q6v5_prepare(&qproc->q6v5);
>  
> @@ -932,7 +958,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> -
> +	mba_load_err = true;
>  reclaim_mba:
>  	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
>  						false, qproc->mba_phys,
> @@ -940,6 +966,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	if (xfermemop_ret) {
>  		dev_err(qproc->dev,
>  			"Failed to reclaim mba buffer, system may become unstable\n");
> +	} else if (mba_load_err) {
> +		q6v5_dump_mba_logs(qproc);
>  	}
>  
>  disable_active_clks:
> @@ -1298,6 +1326,7 @@ static int q6v5_start(struct rproc *rproc)
>  
>  reclaim_mpss:
>  	q6v5_mba_reclaim(qproc);
> +	q6v5_dump_mba_logs(qproc);
>  
>  	return ret;
>  }
> @@ -1717,6 +1746,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  
>  	qproc->version = desc->version;
>  	qproc->need_mem_protection = desc->need_mem_protection;
> +	qproc->has_mba_logs = desc->has_mba_logs;
>  
>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
>  			     qcom_msa_handover);
> @@ -1808,6 +1838,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = false,
> +	.has_mba_logs = true,
>  	.has_spare_reg = true,
>  	.version = MSS_SC7180,
>  };
> @@ -1843,6 +1874,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = true,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_SDM845,
>  };
> @@ -1870,6 +1902,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8998,
>  };
> @@ -1900,6 +1933,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8996,
>  };
> @@ -1933,6 +1967,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
>  	},
>  	.need_mem_protection = false,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8916,
>  };
> @@ -1974,6 +2009,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
>  	},
>  	.need_mem_protection = false,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8974,
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
