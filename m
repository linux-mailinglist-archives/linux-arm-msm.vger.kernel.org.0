Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F0722242A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 15:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgGPNnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 09:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbgGPNnY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 09:43:24 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD7CC061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 06:43:24 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g67so4873192pgc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O/6+NfT3FmDST8KjyhnoOiOkNPwqI4ZUC2DHBX7ohnc=;
        b=ep1TawxWMeklNAGbi6aT4uR6XdkF5y5wu7BBBYyqHATx6M5SYIum0JsxwFJT/6MGw5
         IXi5FTnLqAzgSAbs84Cq1E65jL4WoN+s0OaULR+oWYbcGrAESKBP0CFphpJaXbVNYAsv
         h82oVysws3FAeQjILLHIkoybEOKzj8busoiT49Jdu7IUnxD+89cnJxwcFMUuJhgzwWr0
         20Aj0hVRd6bveKrFopCeFoLAOgY/YkjMsKquRFrn3o7CUjA6dXParDl8vUsMG6FxtynW
         gpPl/Ke38NYEsevZrinPUAbTLc3LHz3vdcdE7xuOkF2nnxHBdy8ccQhTOnU8G9O9b9gS
         6kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O/6+NfT3FmDST8KjyhnoOiOkNPwqI4ZUC2DHBX7ohnc=;
        b=IC88IACZM7iprymu+/9SdCLQy+D7FIlGIPFddjKLdwSw72qTSi48BEEMr5PxRLbEX+
         mwnV9Cf4L/7ioX1MBN9TFhSCtQ2aHiuB8e7PUmyZFWdZewLun6W87R0PGedUa2acmsmR
         nusq3Qh6dESVohIxFoofKzZH/WnX+zvEPkR5bbdLS9tUTpUNR3A4d/38QThygicGcMiu
         Vs18USCwrI1JLjaVvuHC0yVjy1P/NB+hT6Ul4LmQYI/m4pTDUXHGUpyIiF+wko4lpwc2
         86g58Mf9EWL8LcMkZAQ/pi9RteeQRWQzpoGtAL3YElwnlFrr59+eTnr5TZEOACr5qtbZ
         HdKg==
X-Gm-Message-State: AOAM533KvRMa1pSrDCHhoH2Wo4BCZd+SNRFURF8TCBJYGKvv1PD1akI/
        Yx2KqZa0oaE1dSy+PVy9oZak
X-Google-Smtp-Source: ABdhPJz4atHR1ggQ0IAhYzhAEYbvwhob1uDqds0dtW5KcAVYv9BhAu3HrglfwkV/SitlUk9M0B/TGg==
X-Received: by 2002:a62:7e0d:: with SMTP id z13mr3585622pfc.161.1594907004077;
        Thu, 16 Jul 2020 06:43:24 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:494:2704:9157:c271:c363:4849])
        by smtp.gmail.com with ESMTPSA id i67sm5217466pfg.13.2020.07.16.06.43.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 06:43:23 -0700 (PDT)
Date:   Thu, 16 Jul 2020 19:13:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5_mss: Add MBA log extraction
 support
Message-ID: <20200716134316.GI3271@Mani-XPS-13-9360>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123630.21892-3-sibis@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On Thu, Jul 16, 2020 at 06:06:29PM +0530, Sibi Sankar wrote:
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

Is there any specific reason to use vmalloc for the size of 4K?

Thanks,
Mani

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
