Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBF71AE5F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 21:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730640AbgDQTkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 15:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730336AbgDQTkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 15:40:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC4BC061A10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 12:40:00 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u9so1517497pfm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HHki1/clwzRpcS2KonbHjBcGr0VzFjzzuxJR5A2/dPA=;
        b=r4LN2nQ95y2i7LQKYDZSCrOF1+aJbkcHn8LCmMGH5TDF42dLiCIBWRd2P4qx3Zho14
         7aTfN3Dbs/37d0JoOeKq+VExwsd6kY6dH1Qz4jilxwT/Bxh3rMmY49ZW79bjC1vl3LbT
         5G2Emdx+5v6CRsbJqLe1LdQMiaww+5mxwukoE63zp0IHWuMqAVMrW0cvOky6dgc+LJVf
         9skxFnsl79e9lKvrA6j0H8BAJ2xjDdU85/hC3M1AsS/J6J9ghWcEY0P21vE1V0hxUk9W
         xY/mmXYk0D0xNvjl70Zq17IIdmRqiJcE/c1KQoH4TyRsl5AOSMTIl4f0zau7IBIeJMcR
         hGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HHki1/clwzRpcS2KonbHjBcGr0VzFjzzuxJR5A2/dPA=;
        b=V54ve5o524AmBV+r8PumfvJtgNSg3FeHpmKUSouAtqAr+9G0aP+WGBU4iYsTW4fT0Z
         wrRKWLwasS8jfvZyCbUzmAmm/5nSW28TDyaO6o76iIiyWmawQ3mZm2+j5CoqcCYaMkjC
         8xo1fb6mLvZx4IkeW9glbvHW2r3iZ0LPP/co1nNdEhc6S9J2HQG3YHsiwWuuCeou1HNx
         gyigGomWOpseU9cN8AcnICQBp1gHVRsx0Gm28lGFxsqm+miQP0nofM1u+JSdsakU6Xgo
         mgI5wEZxoBLMkLFidS5nbcm+qOdn+netcKLGjmdgJtmt+P7zJJJ1ZRX9OblQL0KcbiE9
         YN/Q==
X-Gm-Message-State: AGi0PuYnI8Fi6TZivJLj56mJbWWZR2wIaLHb3zRhj5ScNYkreT4B6gZA
        mc5JDIoSrKJZFUzXCW3H2zBEUCe0RMQ=
X-Google-Smtp-Source: APiQypKxU/Fe2C9/2BVfZrjinp9TFg/I6raVR8ub6XtMJFTsnuEutdn0FPOZHNUVPLyvYKYplnX24Q==
X-Received: by 2002:a63:c007:: with SMTP id h7mr4549793pgg.428.1587152399831;
        Fri, 17 Apr 2020 12:39:59 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i9sm2358018pfk.199.2020.04.17.12.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 12:39:59 -0700 (PDT)
Date:   Fri, 17 Apr 2020 13:39:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] remoteproc: use rproc_coredump_set_elf_info in
 drivers
Message-ID: <20200417193957.GC6797@xps15>
References: <20200410102433.2672-1-cleger@kalray.eu>
 <20200410102433.2672-3-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410102433.2672-3-cleger@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 10, 2020 at 12:24:33PM +0200, Clement Leger wrote:
> Modify drivers which are using remoteproc coredump functionnality to use

s/functionnality/functionality

> rproc_coredump_set_elf_info in order to create correct elf coredump
> format.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_adsp.c | 1 +
>  drivers/remoteproc/qcom_q6v5_mss.c  | 3 +++
>  drivers/remoteproc/qcom_q6v5_pas.c  | 1 +
>  drivers/remoteproc/qcom_wcnss.c     | 1 +
>  drivers/remoteproc/stm32_rproc.c    | 1 +
>  5 files changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 2b01f2282062..8c3bd0954a13 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -423,6 +423,7 @@ static int adsp_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
>  	}
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 03ffc6db4c68..5a7ff1092362 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1355,6 +1355,8 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  		return ret;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  	qproc->dump_complete_mask = 0;
> @@ -1632,6 +1634,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	}
>  
>  	rproc->auto_boot = false;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	qproc = (struct q6v5 *)rproc->priv;
>  	qproc->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a41860d2243a..991f57e8e55b 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -390,6 +390,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	}
>  
>  	rproc->auto_boot = desc->auto_boot;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 0c7afd038f0d..5d65e1a9329a 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -480,6 +480,7 @@ static int wcnss_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
>  	}
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	wcnss = (struct qcom_wcnss *)rproc->priv;
>  	wcnss->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 6a66dbf2df40..0f9d02ca4f5a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -625,6 +625,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (!rproc)
>  		return -ENOMEM;
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	rproc->has_iommu = false;
>  	ddata = rproc->priv;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
> -- 
> 2.17.1
> 
