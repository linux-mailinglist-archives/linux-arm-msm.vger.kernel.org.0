Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353F41DA526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 01:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgESXIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 19:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgESXIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 19:08:34 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B3BC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 16:08:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n15so652173pfd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ixiNo870L0O1tt3XKRzXP6CLMwM6qsLZGdg3orveJ2c=;
        b=v5UbAXUn670k0FjId5F7YzbW0fcW5cn2gHPMS0Gj4Zk2ddoPIrDhWCG7BFXfHcji2d
         9LX2nlqhy+empqSs9qr1M35ULuuyLPYvUYG7Tbf4PVaBY4Nu9i/W1gUlKp9Vwx/CBjec
         iIWCw++l2BQz6VVpT3Xyl3dQM/XP0WROJLw+H1ij4R0yVTgAamijl2PiJCB4/zrDfRnP
         geemSmsmxETLj6rBBVRrr/CRr1BMSZhlFKNotBYD1mhC83pJUYVWfSq3N2Z7MFlCj4Df
         2IjyfPkGLOn0+otKJQg13e2mxEhOHEGItzW0N4V/cnGE+xihULDKasBxnz2PPBYl0cVc
         +71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ixiNo870L0O1tt3XKRzXP6CLMwM6qsLZGdg3orveJ2c=;
        b=H0ZN8JKfpLV7c/LGsYMar1oJFfoCz1w1aqQsErUjyXdiye0s/RSJBR9IqYv+wEAWkg
         YlOxYpeYBKAqhvxBBQyKs07dxwhVhI8yVz2AIY5GucKmsHHW5sl6U8tROgx8RpMN8wRa
         HMYZMGrhRkfjECyc7dLsPWESLhrnv+COQtpIjHZwCOq0CEV9vkduKFb3yayUuyVQrRsj
         X7EHhn5OWQcOgrKt3yJjQSHEjXP6zkDq1+fi/q712e+QglHgOjVgPh7tq4o8lmh8a5hL
         KCGCDzjx72RIcXSQlHHh6qSgNYdus68GSnaFijeyzMN34P0dFfKlu/kXaICGF5PBJpvU
         uipA==
X-Gm-Message-State: AOAM532oyZlL2VP5CPnAMtnvhZKh2b6FUOskn7k/o2aCwfKaITjoAWv+
        GJNutpyU+IbIIMYLeQDvYZab4g==
X-Google-Smtp-Source: ABdhPJy4iShtU5/wNSK+muUCjJJiWMFIu8UWIc2FJeUgJAW9SJxYJlBqTPoFYjHiqMJzayVauVdzWA==
X-Received: by 2002:a65:68d2:: with SMTP id k18mr1413767pgt.110.1589929712508;
        Tue, 19 May 2020 16:08:32 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p6sm391805pgl.26.2020.05.19.16.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 16:08:31 -0700 (PDT)
Date:   Tue, 19 May 2020 16:07:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v5 3/5] remoteproc: qcom: Update PIL relocation info on
 load
Message-ID: <20200519230759.GA3008945@ripper>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
 <20200513055641.1413100-4-bjorn.andersson@linaro.org>
 <3ff29ccc94d3097fb39b7df377754af6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff29ccc94d3097fb39b7df377754af6@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 May 11:14 PDT 2020, rishabhb@codeaurora.org wrote:

> On 2020-05-12 22:56, Bjorn Andersson wrote:
> > Update the PIL relocation information in IMEM with information about
> > where the firmware for various remoteprocs are loaded.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v4:
> > - Dropped unnecessary comment about ignoring return value.
> > 
> >  drivers/remoteproc/Kconfig          |  3 +++
> >  drivers/remoteproc/qcom_q6v5_adsp.c | 16 +++++++++++++---
> >  drivers/remoteproc/qcom_q6v5_mss.c  |  3 +++
> >  drivers/remoteproc/qcom_q6v5_pas.c  | 15 ++++++++++++---
> >  drivers/remoteproc/qcom_q6v5_wcss.c | 14 +++++++++++---
> >  drivers/remoteproc/qcom_wcnss.c     | 14 +++++++++++---
> >  6 files changed, 53 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index 8088ca4dd6dc..6bd42a411ca8 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -126,6 +126,7 @@ config QCOM_Q6V5_ADSP
> >  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> >  	depends on QCOM_SYSMON || QCOM_SYSMON=n
> >  	select MFD_SYSCON
> > +	select QCOM_PIL_INFO
> >  	select QCOM_MDT_LOADER
> >  	select QCOM_Q6V5_COMMON
> >  	select QCOM_RPROC_COMMON
> > @@ -158,6 +159,7 @@ config QCOM_Q6V5_PAS
> >  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> >  	depends on QCOM_SYSMON || QCOM_SYSMON=n
> >  	select MFD_SYSCON
> > +	select QCOM_PIL_INFO
> >  	select QCOM_MDT_LOADER
> >  	select QCOM_Q6V5_COMMON
> >  	select QCOM_RPROC_COMMON
> > @@ -209,6 +211,7 @@ config QCOM_WCNSS_PIL
> >  	depends on QCOM_SMEM
> >  	depends on QCOM_SYSMON || QCOM_SYSMON=n
> >  	select QCOM_MDT_LOADER
> > +	select QCOM_PIL_INFO
> >  	select QCOM_RPROC_COMMON
> >  	select QCOM_SCM
> >  	help
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> > b/drivers/remoteproc/qcom_q6v5_adsp.c
> > index d2a2574dcf35..c539e89664cb 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/soc/qcom/smem_state.h>
> > 
> >  #include "qcom_common.h"
> > +#include "qcom_pil_info.h"
> >  #include "qcom_q6v5.h"
> >  #include "remoteproc_internal.h"
> > 
> > @@ -82,6 +83,7 @@ struct qcom_adsp {
> >  	unsigned int halt_lpass;
> > 
> >  	int crash_reason_smem;
> > +	const char *info_name;
> > 
> >  	struct completion start_done;
> >  	struct completion stop_done;
> > @@ -164,10 +166,17 @@ static int qcom_adsp_shutdown(struct qcom_adsp
> > *adsp)
> >  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
> >  {
> >  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> > +	int ret;
> > +
> > +	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> > +				    adsp->mem_region, adsp->mem_phys,
> > +				    adsp->mem_size, &adsp->mem_reloc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
> > 
> > -	return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> > -			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> > -			     &adsp->mem_reloc);
> > +	return 0;
> >  }
> > 
> >  static int adsp_start(struct rproc *rproc)
> > @@ -436,6 +445,7 @@ static int adsp_probe(struct platform_device *pdev)
> >  	adsp = (struct qcom_adsp *)rproc->priv;
> >  	adsp->dev = &pdev->dev;
> >  	adsp->rproc = rproc;
> > +	adsp->info_name = desc->sysmon_name;
> >  	platform_set_drvdata(pdev, adsp);
> > 
> >  	ret = adsp_alloc_memory_region(adsp);
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> > b/drivers/remoteproc/qcom_q6v5_mss.c
> > index c4936f4d1e80..fdbcae11ae64 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -29,6 +29,7 @@
> > 
> >  #include "remoteproc_internal.h"
> >  #include "qcom_common.h"
> > +#include "qcom_pil_info.h"
> >  #include "qcom_q6v5.h"
> > 
> >  #include <linux/qcom_scm.h>
> > @@ -1221,6 +1222,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> >  	else if (ret < 0)
> >  		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
> > 
> > +	qcom_pil_info_store("modem", mpss_reloc, qproc->mpss_size);
> > +
> >  release_firmware:
> >  	release_firmware(fw);
> >  out:
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> > b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 3bb69f58e086..84cb19231c35 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/soc/qcom/smem_state.h>
> > 
> >  #include "qcom_common.h"
> > +#include "qcom_pil_info.h"
> >  #include "qcom_q6v5.h"
> >  #include "remoteproc_internal.h"
> > 
> > @@ -64,6 +65,7 @@ struct qcom_adsp {
> >  	int pas_id;
> >  	int crash_reason_smem;
> >  	bool has_aggre2_clk;
> > +	const char *info_name;
> > 
> >  	struct completion start_done;
> >  	struct completion stop_done;
> > @@ -117,11 +119,17 @@ static void adsp_pds_disable(struct qcom_adsp
> > *adsp, struct device **pds,
> >  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
> >  {
> >  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> > +	int ret;
> > 
> > -	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
> > -			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> > -			     &adsp->mem_reloc);
> > +	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
> > +			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> > +			    &adsp->mem_reloc);
> > +	if (ret)
> > +		return ret;
> > 
> > +	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
> mem_reloc is used to calculate  offset and then we again add that offset to
> the
> ioremapped region base. So we should pass adsp->mem_phys as start here?

You're correct, I will respin this.

Thanks,
Bjorn
