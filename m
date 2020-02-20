Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65D91668A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 21:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgBTUmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 15:42:55 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36348 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728957AbgBTUmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 15:42:55 -0500
Received: by mail-pj1-f67.google.com with SMTP id gv17so1377697pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 12:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PDtNBGn5hx18x2dkzKzJHEubbXjMG7kHjGY1ZC79Uds=;
        b=lbUe/2ZywKBgGN8jnU/EZ/oyKOjDJCuN4jyrgZ3tDisVLFyIDzUtM407qU17P/yZ56
         BRqoOfOO/XAS39LOlvclOBsa9rpHonYaZDjQSHXmc0FY0kV0ZBpFM0lmJiSA1HVDHB1r
         gQVrVLosH0dU8eXFT9+jp1kIiihe5Ep9l/10yZioTHNg/mQ07XQc/TzwLbYk/FtC/VS1
         Lo2zqe8Fl5MpIBQa+1R0oCN2OkFtJrM4WgDu+dX+9pcUUqttIWuqZFBVELCPdLwSbx1X
         3AOkO2K4r1RkZBJMOsBu4hZCUQtZCKpaJ4gA4zGWwC5vZSsugrQcdpmXc7eCwDT2whii
         cOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PDtNBGn5hx18x2dkzKzJHEubbXjMG7kHjGY1ZC79Uds=;
        b=ahFgIvvAlybcEHoqtedzeMLZQNb59sog2SNpw1ua+BAMIa6j35PUir/xqL2boJSIoY
         eY/al1W1ObOCjGnE2HeTU6UmJfC5dp5eP4+W+wohEKRd5/N/4aDQO5xhuAlXi5d60DdR
         x70MdCKTGLhHMrkR09HOY6PLuvBjYrqPj0/eth2OS9+9eSdwkjE2wSm7Qkj+X81A4h0g
         0lbCTe/t2hDrsDYyzTdo4IWBqOTFUHFdRk3ST/Gw2N6UkcbXr9dG2OXbKdy7HTjJbBWW
         FOTsNLqki7VOQ5HRpkYJXnL/77G9pG6nvoJJq2BqVwJvoW+R0FaQ4lHSpFaw2emQ4bEP
         RbNg==
X-Gm-Message-State: APjAAAVHEVjEZwrWym5LuZ4apL/lurqyRVPmpZuwMn+6b3Sr3mifiRBC
        uIk7DmkGb0ml+Jgfyy14P/Q7Tg==
X-Google-Smtp-Source: APXvYqxtDAID6c3DA3ie2ZLHO/5QZVGGekXMiKmiTqBfAJoy5ILvQL0kyAjDiOUwpIPX1MhbRJqD5w==
X-Received: by 2002:a17:902:7591:: with SMTP id j17mr32363126pll.163.1582231374096;
        Thu, 20 Feb 2020 12:42:54 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p21sm452489pfn.103.2020.02.20.12.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 12:42:53 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:42:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: Update IMEM PIL info on load
Message-ID: <20200220204251.GC19352@xps15>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211005059.1377279-4-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 10, 2020 at 04:50:54PM -0800, Bjorn Andersson wrote:
> Update the PIL info region structure in IMEM with information about
> where the firmware for various remoteprocs are loaded.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Wrapped a long line
> 
>  drivers/remoteproc/Kconfig          |  3 +++
>  drivers/remoteproc/qcom_q6v5_adsp.c | 19 ++++++++++++++++---
>  drivers/remoteproc/qcom_q6v5_mss.c  |  6 ++++++
>  drivers/remoteproc/qcom_q6v5_pas.c  | 18 +++++++++++++++---
>  drivers/remoteproc/qcom_wcnss.c     | 17 ++++++++++++++---
>  5 files changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 20c8194e610e..7f4834ab06c2 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -129,6 +129,7 @@ config QCOM_Q6V5_MSS
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
> @@ -145,6 +146,7 @@ config QCOM_Q6V5_PAS
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
> @@ -193,6 +195,7 @@ config QCOM_WCNSS_PIL
>  	depends on QCOM_SMEM
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
>  	help
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index e953886b2eb7..19f784adf91c 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -26,6 +26,7 @@
>  #include <linux/soc/qcom/smem_state.h>
>  
>  #include "qcom_common.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  #include "remoteproc_internal.h"
>  
> @@ -82,6 +83,7 @@ struct qcom_adsp {
>  	unsigned int halt_lpass;
>  
>  	int crash_reason_smem;
> +	const char *info_name;
>  
>  	struct completion start_done;
>  	struct completion stop_done;
> @@ -164,10 +166,17 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> +	int ret;
> +
> +	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> +				    adsp->mem_region, adsp->mem_phys,
> +				    adsp->mem_size, &adsp->mem_reloc);
> +	if (ret)
> +		return ret;
>  
> -	return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> -			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> -			     &adsp->mem_reloc);
> +	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);

It is entirely up to you to decide to add a comment that explains why you
opted not to handle the return.  But can already see patches piling
up on the mailing list to "fix" the problem.

The same applies to the other hunks.

> +
> +	return 0;
>  }
>  
>  static int adsp_start(struct rproc *rproc)
> @@ -413,6 +422,9 @@ static int adsp_probe(struct platform_device *pdev)
>  	struct rproc *rproc;
>  	int ret;
>  
> +	if (!qcom_pil_info_available())
> +		return -EPROBE_DEFER;
> +
>  	desc = of_device_get_match_data(&pdev->dev);
>  	if (!desc)
>  		return -EINVAL;
> @@ -427,6 +439,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
>  	adsp->rproc = rproc;
> +	adsp->info_name = desc->sysmon_name;
>  	platform_set_drvdata(pdev, adsp);
>  
>  	ret = adsp_alloc_memory_region(adsp);
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index a1cc9cbe038f..66ed4600db78 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -28,6 +28,7 @@
>  
>  #include "remoteproc_internal.h"
>  #include "qcom_common.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  
>  #include <linux/qcom_scm.h>
> @@ -1166,6 +1167,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	else if (ret < 0)
>  		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
>  
> +	qcom_pil_info_store("modem", mpss_reloc, qproc->mpss_size);
> +
>  release_firmware:
>  	release_firmware(fw);
>  out:
> @@ -1555,6 +1558,9 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (desc->need_mem_protection && !qcom_scm_is_available())
>  		return -EPROBE_DEFER;
>  
> +	if (!qcom_pil_info_available())
> +		return -EPROBE_DEFER;
> +
>  	mba_image = desc->hexagon_mba_image;
>  	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
>  					    0, &mba_image);
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index edf9d0e1a235..d20ce3c62256 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -25,6 +25,7 @@
>  #include <linux/soc/qcom/smem_state.h>
>  
>  #include "qcom_common.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  #include "remoteproc_internal.h"
>  
> @@ -64,6 +65,7 @@ struct qcom_adsp {
>  	int pas_id;
>  	int crash_reason_smem;
>  	bool has_aggre2_clk;
> +	const char *info_name;
>  
>  	struct completion start_done;
>  	struct completion stop_done;
> @@ -117,11 +119,17 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> +	int ret;
> +
> +	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
> +			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> +			    &adsp->mem_reloc);
> +	if (ret)
> +		return ret;
>  
> -	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
> -			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> -			     &adsp->mem_reloc);
> +	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
>  
> +	return 0;
>  }
>  
>  static int adsp_start(struct rproc *rproc)
> @@ -376,6 +384,9 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (!qcom_scm_is_available())
>  		return -EPROBE_DEFER;
>  
> +	if (!qcom_pil_info_available())
> +		return -EPROBE_DEFER;
> +
>  	fw_name = desc->firmware_name;
>  	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
>  				      &fw_name);
> @@ -396,6 +407,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp->rproc = rproc;
>  	adsp->pas_id = desc->pas_id;
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
> +	adsp->info_name = desc->sysmon_name;
>  	platform_set_drvdata(pdev, adsp);
>  
>  	ret = adsp_alloc_memory_region(adsp);
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index dc135754bb9c..2c1cefeacf97 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -27,6 +27,7 @@
>  
>  #include "qcom_common.h"
>  #include "remoteproc_internal.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_wcnss.h"
>  
>  #define WCNSS_CRASH_REASON_SMEM		422
> @@ -145,10 +146,17 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
>  static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
> +	int ret;
> +
> +	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
> +			    wcnss->mem_region, wcnss->mem_phys,
> +			    wcnss->mem_size, &wcnss->mem_reloc);
> +	if (ret)
> +		return ret;
>  
> -	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
> -			     wcnss->mem_region, wcnss->mem_phys,
> -			     wcnss->mem_size, &wcnss->mem_reloc);
> +	qcom_pil_info_store("wcnss", wcnss->mem_reloc, wcnss->mem_size);
> +
> +	return 0;
>  }
>  
>  static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
> @@ -469,6 +477,9 @@ static int wcnss_probe(struct platform_device *pdev)
>  	if (!qcom_scm_is_available())
>  		return -EPROBE_DEFER;
>  
> +	if (!qcom_pil_info_available())
> +		return -EPROBE_DEFER;
> +
>  	if (!qcom_scm_pas_supported(WCNSS_PAS_ID)) {
>  		dev_err(&pdev->dev, "PAS is not available for WCNSS\n");
>  		return -ENXIO;
> -- 
> 2.24.0
> 
