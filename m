Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38769223E35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 16:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgGQOiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 10:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgGQOiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 10:38:21 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F90C0619D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 07:38:21 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so5474614pfm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 07:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v3iUKEbLYWfsczfwrFSZXq+1aNtBq+PmA02aYD040KQ=;
        b=nj/0lhQdZB3jssibx14fW90ksLOsc0ETd0ln27VnZhe8BaCxQLHYHj/Va1B6xFKU0F
         abpZLWx7qruA9enT7AsUjJyKw/eUsyLMAK7h13Rl/E7fYYVh/1Ag1uCimI7o2QirXMUg
         ToLjsM+bYCfhZRcQit2p1j4/ORs5aS0kWD5Jb0/T5eku3gYBZpQ9EIHhs3Up8A7C0G0a
         JFEoSa4ktgsuaO3TJf7R9Rgrie0JDFvttD7qKqegenhkx8IM4wNy/gEeTsdEbbf4hoQS
         5CI+sWfscbF6F4Y9vev+WjwMHIoX8eii+7PU01tH9HO/whHemHVai/B2IC/Y50ZTzSEB
         j+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3iUKEbLYWfsczfwrFSZXq+1aNtBq+PmA02aYD040KQ=;
        b=pkHYhMn2Nq+GTbVK8aaIqDtlt8RHWudZdRa8HAdsQ5J3imx004shLYjFwVyH+uKULP
         IJrdr05an746kT8yoLg6wFiuglsROi8YI0cwzWCtQ4muJtHKvCaVy3xzwabitDJ/pcgu
         fNaAT7098Z+kcdqxk1atfkruUhaXAOFNMNWfGJUq1Aegl8EgEswNwl8fU6M84IiFphZ+
         u8r6pYfrJTs4lsTHrYEusd21X8Y6jEhPEpunAjYoxKqkE3DldKEwyMCUO75xzKZ4RzmY
         5WT87To3ALwsjuO9tj3hna4qvRBnslZk7UPthI1MNzQzwxwGbYfX7kI7L8jA6dvsBh9C
         Bh9Q==
X-Gm-Message-State: AOAM5322KUEYh7e9hQFXd/NAzpJ4u0TTtBRGAn8dJZYmewoDgVFA3tTk
        5wL+nW59tSdEnTRW/FCk6GEm
X-Google-Smtp-Source: ABdhPJyxwQwgQpL7eEGDuOMnVMDLGfNSdG/typASfyzO5d+e+eGK06cmf4/XSt3z2gT5VWOYUncRGQ==
X-Received: by 2002:a05:6a00:845:: with SMTP id q5mr8232927pfk.247.1594996700782;
        Fri, 17 Jul 2020 07:38:20 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6382:1ac4:99cf:535d:1e55:97cf])
        by smtp.gmail.com with ESMTPSA id o42sm3204518pje.10.2020.07.17.07.38.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 07:38:19 -0700 (PDT)
Date:   Fri, 17 Jul 2020 20:08:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5_mss: Add MBA log extraction
 support
Message-ID: <20200717143813.GA3301@Mani-XPS-13-9360>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-3-sibis@codeaurora.org>
 <20200716134316.GI3271@Mani-XPS-13-9360>
 <4f91a75852104dbeafea3af0c8673505@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f91a75852104dbeafea3af0c8673505@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 08:28:50PM +0530, Sibi Sankar wrote:
> On 2020-07-16 19:13, Manivannan Sadhasivam wrote:
> > Hi Sibi,
> > 
> > On Thu, Jul 16, 2020 at 06:06:29PM +0530, Sibi Sankar wrote:
> > > On SC7180 the MBA firmware stores the bootup text logs in a 4K segment
> > > at the beginning of the MBA region. Add support to extract the logs
> > > which will be useful to debug mba boot/authentication issues.
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_mss.c | 41
> > > ++++++++++++++++++++++++++----
> > >  1 file changed, 36 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> > > b/drivers/remoteproc/qcom_q6v5_mss.c
> > > index 95e21ed607cb9..4ddf084b2c6fc 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > > @@ -9,6 +9,7 @@
> > > 
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/devcoredump.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/kernel.h>
> > > @@ -37,6 +38,8 @@
> > > 
> > >  #define MPSS_CRASH_REASON_SMEM		421
> > > 
> > > +#define MBA_LOG_SIZE			SZ_4K
> > > +
> > >  /* RMB Status Register Values */
> > >  #define RMB_PBL_SUCCESS			0x1
> > > 
> > > @@ -139,6 +142,7 @@ struct rproc_hexagon_res {
> > >  	int version;
> > >  	bool need_mem_protection;
> > >  	bool has_alt_reset;
> > > +	bool has_mba_logs;
> > >  	bool has_spare_reg;
> > >  };
> > > 
> > > @@ -200,6 +204,7 @@ struct q6v5 {
> > >  	struct qcom_sysmon *sysmon;
> > >  	bool need_mem_protection;
> > >  	bool has_alt_reset;
> > > +	bool has_mba_logs;
> > >  	bool has_spare_reg;
> > >  	int mpss_perm;
> > >  	int mba_perm;
> > > @@ -518,6 +523,19 @@ static int q6v5_rmb_mba_wait(struct q6v5
> > > *qproc, u32 status, int ms)
> > >  	return val;
> > >  }
> > > 
> > > +static void q6v5_dump_mba_logs(struct q6v5 *qproc)
> > > +{
> > > +	struct rproc *rproc = qproc->rproc;
> > > +	void *data;
> > > +
> > > +	data = vmalloc(MBA_LOG_SIZE);
> > 
> > Is there any specific reason to use vmalloc for the size of 4K?
> 
> data is passed onto dev_coredumpv
> which takes ownership of the memory
> and would eventually do a vfree of the
> data.
> 

Ah, okay.

Thanks,
Mani

> > 
> > Thanks,
> > Mani
> > 
> > > +	if (!data)
> > > +		return;
> > > +
> > > +	memcpy(data, qproc->mba_region, MBA_LOG_SIZE);
> > > +	dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
> > > +}
> > > +
> > >  static int q6v5proc_reset(struct q6v5 *qproc)
> > >  {
> > >  	u32 val;
> > > @@ -838,6 +856,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
> > >  {
> > >  	int ret;
> > >  	int xfermemop_ret;
> > > +	bool mba_load_err = false;
> > > 
> > >  	qcom_q6v5_prepare(&qproc->q6v5);
> > > 
> > > @@ -931,7 +950,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
> > >  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
> > >  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
> > >  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> > > -
> > > +	mba_load_err = true;
> > >  reclaim_mba:
> > >  	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm,
> > > true,
> > >  						false, qproc->mba_phys,
> > > @@ -939,6 +958,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
> > >  	if (xfermemop_ret) {
> > >  		dev_err(qproc->dev,
> > >  			"Failed to reclaim mba buffer, system may become unstable\n");
> > > +	} else if (qproc->has_mba_logs & mba_load_err) {
> > > +		q6v5_dump_mba_logs(qproc);
> > >  	}
> > > 
> > >  disable_active_clks:
> > > @@ -968,7 +989,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
> > >  	return ret;
> > >  }
> > > 
> > > -static void q6v5_mba_reclaim(struct q6v5 *qproc)
> > > +static void q6v5_mba_reclaim(struct q6v5 *qproc, bool err_path)
> > >  {
> > >  	int ret;
> > >  	u32 val;
> > > @@ -1006,6 +1027,9 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
> > >  				      qproc->mba_size);
> > >  	WARN_ON(ret);
> > > 
> > > +	if (qproc->has_mba_logs && err_path && !ret)
> > > +		q6v5_dump_mba_logs(qproc);
> > > +
> > >  	ret = qcom_q6v5_unprepare(&qproc->q6v5);
> > >  	if (ret) {
> > >  		q6v5_pds_disable(qproc, qproc->proxy_pds,
> > > @@ -1255,7 +1279,7 @@ static void qcom_q6v5_dump_segment(struct
> > > rproc *rproc,
> > >  						false, true,
> > >  						qproc->mpss_phys,
> > >  						qproc->mpss_size);
> > > -			q6v5_mba_reclaim(qproc);
> > > +			q6v5_mba_reclaim(qproc, false);
> > >  		}
> > >  	}
> > >  }
> > > @@ -1297,7 +1321,7 @@ static int q6v5_start(struct rproc *rproc)
> > >  	return 0;
> > > 
> > >  reclaim_mpss:
> > > -	q6v5_mba_reclaim(qproc);
> > > +	q6v5_mba_reclaim(qproc, true);
> > > 
> > >  	return ret;
> > >  }
> > > @@ -1313,7 +1337,7 @@ static int q6v5_stop(struct rproc *rproc)
> > >  	if (ret == -ETIMEDOUT)
> > >  		dev_err(qproc->dev, "timed out on wait\n");
> > > 
> > > -	q6v5_mba_reclaim(qproc);
> > > +	q6v5_mba_reclaim(qproc, false);
> > > 
> > >  	return 0;
> > >  }
> > > @@ -1717,6 +1741,7 @@ static int q6v5_probe(struct platform_device
> > > *pdev)
> > > 
> > >  	qproc->version = desc->version;
> > >  	qproc->need_mem_protection = desc->need_mem_protection;
> > > +	qproc->has_mba_logs = desc->has_mba_logs;
> > > 
> > >  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc,
> > > MPSS_CRASH_REASON_SMEM,
> > >  			     qcom_msa_handover);
> > > @@ -1808,6 +1833,7 @@ static const struct rproc_hexagon_res
> > > sc7180_mss = {
> > >  	},
> > >  	.need_mem_protection = true,
> > >  	.has_alt_reset = false,
> > > +	.has_mba_logs = true,
> > >  	.has_spare_reg = true,
> > >  	.version = MSS_SC7180,
> > >  };
> > > @@ -1843,6 +1869,7 @@ static const struct rproc_hexagon_res
> > > sdm845_mss = {
> > >  	},
> > >  	.need_mem_protection = true,
> > >  	.has_alt_reset = true,
> > > +	.has_mba_logs = true,
> > >  	.has_spare_reg = false,
> > >  	.version = MSS_SDM845,
> > >  };
> > > @@ -1870,6 +1897,7 @@ static const struct rproc_hexagon_res
> > > msm8998_mss = {
> > >  	},
> > >  	.need_mem_protection = true,
> > >  	.has_alt_reset = false,
> > > +	.has_mba_logs = false,
> > >  	.has_spare_reg = false,
> > >  	.version = MSS_MSM8998,
> > >  };
> > > @@ -1900,6 +1928,7 @@ static const struct rproc_hexagon_res
> > > msm8996_mss = {
> > >  	},
> > >  	.need_mem_protection = true,
> > >  	.has_alt_reset = false,
> > > +	.has_mba_logs = false,
> > >  	.has_spare_reg = false,
> > >  	.version = MSS_MSM8996,
> > >  };
> > > @@ -1933,6 +1962,7 @@ static const struct rproc_hexagon_res
> > > msm8916_mss = {
> > >  	},
> > >  	.need_mem_protection = false,
> > >  	.has_alt_reset = false,
> > > +	.has_mba_logs = false,
> > >  	.has_spare_reg = false,
> > >  	.version = MSS_MSM8916,
> > >  };
> > > @@ -1974,6 +2004,7 @@ static const struct rproc_hexagon_res
> > > msm8974_mss = {
> > >  	},
> > >  	.need_mem_protection = false,
> > >  	.has_alt_reset = false,
> > > +	.has_mba_logs = false,
> > >  	.has_spare_reg = false,
> > >  	.version = MSS_MSM8974,
> > >  };
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project.
