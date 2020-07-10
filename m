Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90D921BB18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 18:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgGJQfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 12:35:51 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:59722 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726920AbgGJQfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 12:35:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594398950; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xmJTwTmrZK5Az//rL1bxPUaXS32v4vqqvf+Bkjio6ek=;
 b=rO9YYdpGpw3apwVcxpOvYu/3251Xga+IFm6Qr/z5wo1AFcQaBJTurcWVLEfXbQyJLbYfBD3e
 CUx7nmH3xiUvrsun47bYWHp/ru4A+qOhjmavoaZ08AroLfcCfl0WCwtp9QKLG+V0d3gRskWm
 OsDbDtWnV0EnS0ihDLD0kBRHr0A=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f0898b7c7a053446a457e62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 16:35:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 742E4C433CB; Fri, 10 Jul 2020 16:35:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 450D7C433C8;
        Fri, 10 Jul 2020 16:35:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 10 Jul 2020 09:35:01 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v7 3/5] remoteproc: qcom: Update PIL relocation info on
 load
In-Reply-To: <20200622191942.255460-4-bjorn.andersson@linaro.org>
References: <20200622191942.255460-1-bjorn.andersson@linaro.org>
 <20200622191942.255460-4-bjorn.andersson@linaro.org>
Message-ID: <4ddca08d7fdd6b5c77c5e5f855c6d8a3@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-22 12:19, Bjorn Andersson wrote:
> Update the PIL relocation information in IMEM with information about
> where the firmware for various remoteprocs are loaded.
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - None
> 
>  drivers/remoteproc/Kconfig          |  5 +++++
>  drivers/remoteproc/qcom_q6v5_adsp.c | 16 +++++++++++++---
>  drivers/remoteproc/qcom_q6v5_mss.c  |  3 +++
>  drivers/remoteproc/qcom_q6v5_pas.c  | 15 ++++++++++++---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 14 +++++++++++---
>  drivers/remoteproc/qcom_wcnss.c     | 14 +++++++++++---
>  6 files changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index f4bd96d1a1a3..3e8d5d1a2b9e 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -135,6 +135,7 @@ config QCOM_Q6V5_ADSP
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
> @@ -151,6 +152,7 @@ config QCOM_Q6V5_MSS
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
>  	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_Q6V5_IPA_NOTIFY
>  	select QCOM_RPROC_COMMON
> @@ -167,6 +169,7 @@ config QCOM_Q6V5_PAS
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
> @@ -185,6 +188,7 @@ config QCOM_Q6V5_WCSS
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
>  	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> @@ -218,6 +222,7 @@ config QCOM_WCNSS_PIL
>  	depends on QCOM_SMEM
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
>  	help
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> b/drivers/remoteproc/qcom_q6v5_adsp.c
> index d2a2574dcf35..efb2c1aa80a3 100644
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
> @@ -164,10 +166,17 @@ static int qcom_adsp_shutdown(struct qcom_adsp 
> *adsp)
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
> +
> +	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
> 
> -	return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> -			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> -			     &adsp->mem_reloc);
> +	return 0;
>  }
> 
>  static int adsp_start(struct rproc *rproc)
> @@ -436,6 +445,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
>  	adsp->rproc = rproc;
> +	adsp->info_name = desc->sysmon_name;
>  	platform_set_drvdata(pdev, adsp);
> 
>  	ret = adsp_alloc_memory_region(adsp);
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> b/drivers/remoteproc/qcom_q6v5_mss.c
> index 903b2bb97e12..4b8567f970f9 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -30,6 +30,7 @@
> 
>  #include "remoteproc_internal.h"
>  #include "qcom_common.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
> 
>  #include <linux/qcom_scm.h>
> @@ -1190,6 +1191,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	else if (ret < 0)
>  		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
> 
> +	qcom_pil_info_store("modem", qproc->mpss_phys, qproc->mpss_size);
> +
>  release_firmware:
>  	release_firmware(fw);
>  out:
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> b/drivers/remoteproc/qcom_q6v5_pas.c
> index 61791a03f648..3837f23995e0 100644
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
> @@ -117,11 +119,17 @@ static void adsp_pds_disable(struct qcom_adsp
> *adsp, struct device **pds,
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> +	int ret;
> 
> -	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
> -			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> -			     &adsp->mem_reloc);
> +	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
> +			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> +			    &adsp->mem_reloc);
> +	if (ret)
> +		return ret;
> 
> +	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
> +
> +	return 0;
>  }
> 
>  static int adsp_start(struct rproc *rproc)
> @@ -405,6 +413,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp->rproc = rproc;
>  	adsp->pas_id = desc->pas_id;
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
> +	adsp->info_name = desc->sysmon_name;
>  	platform_set_drvdata(pdev, adsp);
> 
>  	device_wakeup_enable(adsp->dev);
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
> b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 88c76b9417fa..8846ef0b0f1a 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -14,6 +14,7 @@
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  #include "qcom_common.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
> 
>  #define WCSS_CRASH_REASON		421
> @@ -424,10 +425,17 @@ static void *q6v5_wcss_da_to_va(struct rproc
> *rproc, u64 da, size_t len)
>  static int q6v5_wcss_load(struct rproc *rproc, const struct firmware 
> *fw)
>  {
>  	struct q6v5_wcss *wcss = rproc->priv;
> +	int ret;
> +
> +	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
> +				    0, wcss->mem_region, wcss->mem_phys,
> +				    wcss->mem_size, &wcss->mem_reloc);
> +	if (ret)
> +		return ret;
> +
> +	qcom_pil_info_store("wcnss", wcss->mem_phys, wcss->mem_size);
> 
> -	return qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
> -				     0, wcss->mem_region, wcss->mem_phys,
> -				     wcss->mem_size, &wcss->mem_reloc);
> +	return ret;
>  }
> 
>  static const struct rproc_ops q6v5_wcss_ops = {
> diff --git a/drivers/remoteproc/qcom_wcnss.c 
> b/drivers/remoteproc/qcom_wcnss.c
> index 5d65e1a9329a..e2573f79a137 100644
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
> @@ -145,10 +146,17 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss 
> *wcnss,
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
> +
> +	qcom_pil_info_store("wcnss", wcnss->mem_phys, wcnss->mem_size);
> 
> -	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
> -			     wcnss->mem_region, wcnss->mem_phys,
> -			     wcnss->mem_size, &wcnss->mem_reloc);
> +	return 0;
>  }
> 
>  static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)

Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Tested-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
