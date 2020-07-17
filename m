Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215D4223327
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 07:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgGQFyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 01:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgGQFyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 01:54:12 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF871C061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:54:11 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so4991081plx.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BE53FVMP1sxI5SJffsC9jE8BZErABKdiNjp2gsb3xGE=;
        b=xPvoTtqbHHmqhUUKi5IfHqXS+SoKj02uaqia7hApyB3Wbc/+1OZSZlmjqI8VHJu4NX
         ++Esve7FvAiyuuj0s5/DTe5mGC2Bjbx7EZOlQg1DgWhX8OIBHNcGK5ZuVi73oQLp1d63
         Q0/MLD6MTF1tziJk/3T3rF9pwiO0VTbCTTL4dwWSFOvmFck+iK3J4omW5LPLR2nr5fZp
         Th47HB6E3koERft7BNrwxvL+DswPR+10EkC43TfsC4QDusdJTN44AUW+t0ihyUgKiHoC
         M1wuEZ5te+sTn3B7RxC6g81WYUCxhAWZcdhk1aABAeFXMaa3Ac1Ujg8SK1Q0ehPHAwJj
         5xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BE53FVMP1sxI5SJffsC9jE8BZErABKdiNjp2gsb3xGE=;
        b=dZSTVpe1YtRKPkbMpLDOr/VU09SUhNjVLM2q5PXwTmpMuwqzb8WHmkCpjJik3oRgev
         CBrVg5IcTkvIY19kCTJkZ2irm9gmcRlAllX+mbM8F/wIQwNyuh2I8Jyb60y3UL2PYOml
         oXXuWG0Uuuj6LJsuBbbM6Dmj7nCGQoMHWTM+qaQAAT4QdyV5GfubZww1lcWXVnMaOBvp
         3DiCJL2fDsW56IDTr82FkoLwRObtS85eZPpA5AaAXx0TbE6Q7wnvY9lpmz2K0TYaug1X
         QP/Daa5p/9vlGU9dt8ImgC+Oha+eJ9brOrQheQpCnk8Ag9bAR0BNhi7iXGj/Sk2J1HkZ
         zuzg==
X-Gm-Message-State: AOAM530tcKrm6GIO/t/RlD/o/sChgWfiUqUrBJzZH4ApBjxJoKtinHbo
        XINyRl9xwsUi+0hEbN9kjeBG3nt6fqU=
X-Google-Smtp-Source: ABdhPJzaxEC+FR0ETW8du+8Ci9aRhr/1VRE+dCw11m6X3AAV9aZpUW1q3B2gTyP+wqzAmPC1h+WTMw==
X-Received: by 2002:a17:902:64:: with SMTP id 91mr6744245pla.62.1594965251200;
        Thu, 16 Jul 2020 22:54:11 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f93sm1564206pjk.56.2020.07.16.22.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 22:54:10 -0700 (PDT)
Date:   Thu, 16 Jul 2020 22:52:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5_mss: Add MBA log extraction
 support
Message-ID: <20200717055208.GK2922385@builder.lan>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-3-sibis@codeaurora.org>
 <20200717045741.GC2922385@builder.lan>
 <52afbcbc46604680064c938f54dee331@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52afbcbc46604680064c938f54dee331@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jul 22:22 PDT 2020, Sibi Sankar wrote:

> On 2020-07-17 10:27, Bjorn Andersson wrote:
> > On Thu 16 Jul 05:36 PDT 2020, Sibi Sankar wrote:
> > 
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
> > 
> > Wouldn't it be possible to just call q6v5_dump_mba_logs() directly after
> > the return from q6v5_mba_reclaim()? That way we can avoid passing the
> > bool to indicate if the reclaim should also dump some stuff.
> > 
> > Sure we don't have a way to tell if the assign_mem failed, but we're
> > going to crash shortly anyways (which is something we should change).
> 
> We wont crash as long as we dont touch
> the mba region though. Trying a mba
> logs dump in such a case will ensure
> that we crash lol.
> 

Right, but that means that if we ever try to start the remoteproc again
it will crash on us.

So what I meant at the end there is that we should either have a
mechanism to ensure that no further accesses are attempted (e.g.
prohibit a subsequent "start") or this might actually be a valid case
for a BUG_ON().

Regards,
Bjorn

> > 
> > 
> > 
> > I think you should move the has_mba_logs into q6v5_dump_mba_logs(),
> > making it cause an early return.
> 
> cool sure I'll do that.
> 
> > 
> > Regards,
> > Bjorn
> > 
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
