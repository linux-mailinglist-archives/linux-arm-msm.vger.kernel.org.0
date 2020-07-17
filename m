Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27782232AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 06:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQE7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 00:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgGQE7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 00:59:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF6AC061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 21:59:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s189so6089430pgc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 21:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0sPPULgGL9Cy+2TwGszOq/oDSwtnyg14+PDb6wBBRDs=;
        b=ELyWSirgPv3Dut/Z+mjuWTYn/Y8SKeXNu5JCn4j6+jVP9DjRE4G97ql0JuuNesoVnO
         Vkgj6fIbGrcfSzEseUk0N7UlK6hSruo4Cy161rifaVwm0l9io9kyu9PjQ2TiYUfpTwM3
         JHKNlJ/i1T94JbmS/R+5qWqrBP6eU2exbYqDKqzVe9Mes6SpbGWSbcpqaTfaXMiIPD/d
         r5jI3ely9k22ZNd5xVDfXe37DdPzMJ2yHMPKvZDxR/ufQbEnyMBM28ZLQ++bXUJwJLiH
         Xe5K4NOxYtHC+FnRhfIvxRyK75SG87eea6cuA51Zi1/ZA3kmsZ1biGwpGOWMaVtY65Yu
         KCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0sPPULgGL9Cy+2TwGszOq/oDSwtnyg14+PDb6wBBRDs=;
        b=nskPKL4kZIsODxD+p0K4wY2j8ul4DUtjQlLa7JFGONny43frzgqH0drxiS3WtaOe5/
         LD9b6kOeO6NEYsFxMsijecxB4t7qm07WiQvjhWah1oLyJ68rU02YCTNFDc3t6z8AEJVm
         ztS9aK0blmqXJJoCFxMbFtgrc0cnndQ5fI4/LLbdy5nMNx1uTR4r1nCfwhDOgOe+gtKX
         A+UeTPbEhClucTLq5DLJGwO9Xra8LtpcsXzKW435h5FLsSrt144SHsnT7GoxmymCpbO/
         Q85IZEjzhQnB2YrD5n6suWNoo1HDqrVi6F+OcFqsrI5afatiSQMFSvBI/roQBJxDh39N
         WlHQ==
X-Gm-Message-State: AOAM533qNHEqHsd/1QcOQDxlqQbKDlkpthcZkUphkJZQvt0j8A/owzvj
        eRhUn8l49pxPPh1otIyQyaxhFA==
X-Google-Smtp-Source: ABdhPJyPpUCc/q/svOW9qTeFIMIArgxhavpOB5Q5/8i3nPMjiFshRGw+aN/3HdoatnUhzw/eoi/6WQ==
X-Received: by 2002:a62:3645:: with SMTP id d66mr6715707pfa.275.1594961984076;
        Thu, 16 Jul 2020 21:59:44 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t1sm6671794pgq.66.2020.07.16.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 21:59:43 -0700 (PDT)
Date:   Thu, 16 Jul 2020 21:57:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5_mss: Add MBA log extraction
 support
Message-ID: <20200717045741.GC2922385@builder.lan>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123630.21892-3-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jul 05:36 PDT 2020, Sibi Sankar wrote:

> On SC7180 the MBA firmware stores the bootup text logs in a 4K segment
> at the beginning of the MBA region. Add support to extract the logs
> which will be useful to debug mba boot/authentication issues.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 41 ++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 95e21ed607cb9..4ddf084b2c6fc 100644
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
> @@ -139,6 +142,7 @@ struct rproc_hexagon_res {
>  	int version;
>  	bool need_mem_protection;
>  	bool has_alt_reset;
> +	bool has_mba_logs;
>  	bool has_spare_reg;
>  };
>  
> @@ -200,6 +204,7 @@ struct q6v5 {
>  	struct qcom_sysmon *sysmon;
>  	bool need_mem_protection;
>  	bool has_alt_reset;
> +	bool has_mba_logs;
>  	bool has_spare_reg;
>  	int mpss_perm;
>  	int mba_perm;
> @@ -518,6 +523,19 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>  	return val;
>  }
>  
> +static void q6v5_dump_mba_logs(struct q6v5 *qproc)
> +{
> +	struct rproc *rproc = qproc->rproc;
> +	void *data;
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
> @@ -838,6 +856,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  {
>  	int ret;
>  	int xfermemop_ret;
> +	bool mba_load_err = false;
>  
>  	qcom_q6v5_prepare(&qproc->q6v5);
>  
> @@ -931,7 +950,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> -
> +	mba_load_err = true;
>  reclaim_mba:
>  	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
>  						false, qproc->mba_phys,
> @@ -939,6 +958,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	if (xfermemop_ret) {
>  		dev_err(qproc->dev,
>  			"Failed to reclaim mba buffer, system may become unstable\n");
> +	} else if (qproc->has_mba_logs & mba_load_err) {
> +		q6v5_dump_mba_logs(qproc);
>  	}
>  
>  disable_active_clks:
> @@ -968,7 +989,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	return ret;
>  }
>  
> -static void q6v5_mba_reclaim(struct q6v5 *qproc)
> +static void q6v5_mba_reclaim(struct q6v5 *qproc, bool err_path)
>  {
>  	int ret;
>  	u32 val;
> @@ -1006,6 +1027,9 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>  				      qproc->mba_size);
>  	WARN_ON(ret);
>  
> +	if (qproc->has_mba_logs && err_path && !ret)

Wouldn't it be possible to just call q6v5_dump_mba_logs() directly after
the return from q6v5_mba_reclaim()? That way we can avoid passing the
bool to indicate if the reclaim should also dump some stuff.

Sure we don't have a way to tell if the assign_mem failed, but we're
going to crash shortly anyways (which is something we should change).



I think you should move the has_mba_logs into q6v5_dump_mba_logs(),
making it cause an early return.

Regards,
Bjorn

> +		q6v5_dump_mba_logs(qproc);
> +
>  	ret = qcom_q6v5_unprepare(&qproc->q6v5);
>  	if (ret) {
>  		q6v5_pds_disable(qproc, qproc->proxy_pds,
> @@ -1255,7 +1279,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  						false, true,
>  						qproc->mpss_phys,
>  						qproc->mpss_size);
> -			q6v5_mba_reclaim(qproc);
> +			q6v5_mba_reclaim(qproc, false);
>  		}
>  	}
>  }
> @@ -1297,7 +1321,7 @@ static int q6v5_start(struct rproc *rproc)
>  	return 0;
>  
>  reclaim_mpss:
> -	q6v5_mba_reclaim(qproc);
> +	q6v5_mba_reclaim(qproc, true);
>  
>  	return ret;
>  }
> @@ -1313,7 +1337,7 @@ static int q6v5_stop(struct rproc *rproc)
>  	if (ret == -ETIMEDOUT)
>  		dev_err(qproc->dev, "timed out on wait\n");
>  
> -	q6v5_mba_reclaim(qproc);
> +	q6v5_mba_reclaim(qproc, false);
>  
>  	return 0;
>  }
> @@ -1717,6 +1741,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  
>  	qproc->version = desc->version;
>  	qproc->need_mem_protection = desc->need_mem_protection;
> +	qproc->has_mba_logs = desc->has_mba_logs;
>  
>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
>  			     qcom_msa_handover);
> @@ -1808,6 +1833,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = false,
> +	.has_mba_logs = true,
>  	.has_spare_reg = true,
>  	.version = MSS_SC7180,
>  };
> @@ -1843,6 +1869,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = true,
> +	.has_mba_logs = true,
>  	.has_spare_reg = false,
>  	.version = MSS_SDM845,
>  };
> @@ -1870,6 +1897,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8998,
>  };
> @@ -1900,6 +1928,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
>  	},
>  	.need_mem_protection = true,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8996,
>  };
> @@ -1933,6 +1962,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
>  	},
>  	.need_mem_protection = false,
>  	.has_alt_reset = false,
> +	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.version = MSS_MSM8916,
>  };
> @@ -1974,6 +2004,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
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
