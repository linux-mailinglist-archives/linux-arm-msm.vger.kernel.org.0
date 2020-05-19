Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC92C1D9EFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 20:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgESSPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 14:15:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:60461 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbgESSPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 14:15:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589912102; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WbWK+XDpZ1EpeB30moGdfoWRLNL/z7wIz2LDeq0cfpU=;
 b=cALJeUigOd2UtDDodMFaIJ+TSsIRq45IyvTW9qPBt4YcxdSvUGHm5dg8Reu/iAp/RH2icsBt
 GYBexS6EhIV3ZMKqoVM5w1NHYnPj/vuYS1m8jvngXGD5t3Dfp1hFXvP6ma99Gnr4YeioOHlw
 DIWIN7MwwZCSsceDTQExShNVmqo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec4220d.7fa2b94590a0-smtp-out-n05;
 Tue, 19 May 2020 18:14:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF575C43636; Tue, 19 May 2020 18:14:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E60BC433D2;
        Tue, 19 May 2020 18:14:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 May 2020 11:14:36 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v5 3/5] remoteproc: qcom: Update PIL relocation info on
 load
In-Reply-To: <20200513055641.1413100-4-bjorn.andersson@linaro.org>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
 <20200513055641.1413100-4-bjorn.andersson@linaro.org>
Message-ID: <3ff29ccc94d3097fb39b7df377754af6@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-12 22:56, Bjorn Andersson wrote:
> Update the PIL relocation information in IMEM with information about
> where the firmware for various remoteprocs are loaded.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - Dropped unnecessary comment about ignoring return value.
> 
>  drivers/remoteproc/Kconfig          |  3 +++
>  drivers/remoteproc/qcom_q6v5_adsp.c | 16 +++++++++++++---
>  drivers/remoteproc/qcom_q6v5_mss.c  |  3 +++
>  drivers/remoteproc/qcom_q6v5_pas.c  | 15 ++++++++++++---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 14 +++++++++++---
>  drivers/remoteproc/qcom_wcnss.c     | 14 +++++++++++---
>  6 files changed, 53 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 8088ca4dd6dc..6bd42a411ca8 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -126,6 +126,7 @@ config QCOM_Q6V5_ADSP
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
> @@ -158,6 +159,7 @@ config QCOM_Q6V5_PAS
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
> @@ -209,6 +211,7 @@ config QCOM_WCNSS_PIL
>  	depends on QCOM_SMEM
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
>  	help
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> b/drivers/remoteproc/qcom_q6v5_adsp.c
> index d2a2574dcf35..c539e89664cb 100644
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
> +	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, 
> adsp->mem_size);
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
> index c4936f4d1e80..fdbcae11ae64 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -29,6 +29,7 @@
> 
>  #include "remoteproc_internal.h"
>  #include "qcom_common.h"
> +#include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
> 
>  #include <linux/qcom_scm.h>
> @@ -1221,6 +1222,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	else if (ret < 0)
>  		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
> 
> +	qcom_pil_info_store("modem", mpss_reloc, qproc->mpss_size);
> +
>  release_firmware:
>  	release_firmware(fw);
>  out:
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3bb69f58e086..84cb19231c35 100644
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
> +	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, 
> adsp->mem_size);
mem_reloc is used to calculate  offset and then we again add that offset 
to the
ioremapped region base. So we should pass adsp->mem_phys as start here?
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
>  	ret = adsp_alloc_memory_region(adsp);
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
> b/drivers/remoteproc/qcom_q6v5_wcss.c
> index f1924b740a10..962e37a86b8b 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -421,10 +421,18 @@ static void *q6v5_wcss_da_to_va(struct rproc
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
> +	/* Failures only affect post mortem debugging, so ignore return value 
> */
> +	qcom_pil_info_store("wcnss", wcss->mem_reloc, wcss->mem_size);
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
> index 5d65e1a9329a..229482b3231f 100644
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
> +	qcom_pil_info_store("wcnss", wcnss->mem_reloc, wcnss->mem_size);
> 
> -	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
> -			     wcnss->mem_region, wcnss->mem_phys,
> -			     wcnss->mem_size, &wcnss->mem_reloc);
> +	return 0;
>  }
> 
>  static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
