Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000C633B4E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 14:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhCONtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 09:49:47 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:41711 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhCONtY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 09:49:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615816164; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GMfs9w0IsBTgPFLX+ggDVVK+uUIRBZtheD2/pF9AuBc=;
 b=pJ57r9SaQyKkXPrX0J8/gC0fn7/PLbogBkysMi98r21fdPzkNCM9P5E7kcC+vT0xqHts/+lU
 dZk8Lh2jdMVhFj3sTb5nADgbrkwvHJyB/NdgX2rMPZAV+E9aNU/+n6gPQA2oGKSWKgM6g5fA
 EmqEjg9wyiLdjyMLUpwPO52f5Ac=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 604f65ce5d70193f889c8428 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 13:49:02
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8A8CC433ED; Mon, 15 Mar 2021 13:49:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFA4FC433C6;
        Mon, 15 Mar 2021 13:49:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Mar 2021 19:19:01 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pillair=codeaurora.org@codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for sc7280
 WPSS
In-Reply-To: <1615361290-19238-3-git-send-email-pillair@codeaurora.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-3-git-send-email-pillair@codeaurora.org>
Message-ID: <2156398735b0172095695db6d4181069@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-10 12:58, Rakesh Pillai wrote:
> Add support for PIL loading of WPSS processor for SC7280
> WPSS boot will be requested by the wifi driver and hence
> disable auto-boot for WPSS. Also add a separate shutdown
> sequence handler for WPSS.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_adsp.c | 77 
> ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> b/drivers/remoteproc/qcom_q6v5_adsp.c
> index e024502..dc6b91d 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -58,6 +58,8 @@ struct adsp_pil_data {
>  	const char *ssr_name;
>  	const char *sysmon_name;
>  	int ssctl_id;
> +	bool is_wpss;
> +	bool auto_boot;
> 
>  	const char **clk_ids;
>  	int num_clks;
> @@ -96,8 +98,54 @@ struct qcom_adsp {
>  	struct qcom_rproc_glink glink_subdev;
>  	struct qcom_rproc_ssr ssr_subdev;
>  	struct qcom_sysmon *sysmon;
> +
> +	int (*shutdown)(struct qcom_adsp *adsp);
>  };
> 
> +static int qcom_wpss_shutdown(struct qcom_adsp *adsp)
> +{
> +	unsigned long timeout;
> +	unsigned int val;
> +	int ret;
> +
> +	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 
> 1);
> +
> +	/* Wait for halt ACK from QDSP6 */
> +	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
> +	for (;;) {
> +		ret = regmap_read(adsp->halt_map,
> +				  adsp->halt_lpass + LPASS_HALTACK_REG, &val);
> +		if (ret || val || time_after(jiffies, timeout))
> +			break;
> +
> +		usleep_range(1000, 1100);
> +	}

please use regmap_read_poll_timeout
instead.

> +
> +	/* Place the WPSS processor into reset */
> +	reset_control_assert(adsp->restart);
> +	/* wait after asserting subsystem restart from AOSS */
> +	usleep_range(100, 105);
> +	/* Remove the WPSS reset */
> +	reset_control_deassert(adsp->restart);
> +
> +	usleep_range(100, 105);

usleep shouldn't be required since
aoss-reset drivers put in a usleep
of 200-300 on reset assert and de-assert.

> +
> +	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 
> 0);
> +
> +	/* Wait for halt ACK from QDSP6 */
> +	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
> +	for (;;) {
> +		ret = regmap_read(adsp->halt_map,
> +				  adsp->halt_lpass + LPASS_HALTACK_REG, &val);
> +		if (ret || !val || time_after(jiffies, timeout))
> +			break;
> +
> +		usleep_range(1000, 1100);
> +	}

please use regmap_read_poll_timeout
instead.

> +
> +	return 0;
> +}
> +
>  static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
>  {
>  	unsigned long timeout;
> @@ -270,7 +318,7 @@ static int adsp_stop(struct rproc *rproc)
>  	if (ret == -ETIMEDOUT)
>  		dev_err(adsp->dev, "timed out on wait\n");
> 
> -	ret = qcom_adsp_shutdown(adsp);
> +	ret = adsp->shutdown(adsp);
>  	if (ret)
>  		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
> 
> @@ -439,6 +487,8 @@ static int adsp_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
>  	}
> +
> +	rproc->auto_boot = desc->auto_boot;
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> 
>  	adsp = (struct qcom_adsp *)rproc->priv;
> @@ -447,6 +497,11 @@ static int adsp_probe(struct platform_device 
> *pdev)
>  	adsp->info_name = desc->sysmon_name;
>  	platform_set_drvdata(pdev, adsp);
> 
> +	if (desc->is_wpss)
> +		adsp->shutdown = qcom_wpss_shutdown;
> +	else
> +		adsp->shutdown = qcom_adsp_shutdown;
> +
>  	ret = adsp_alloc_memory_region(adsp);
>  	if (ret)
>  		goto free_rproc;
> @@ -515,6 +570,8 @@ static const struct adsp_pil_data 
> adsp_resource_init = {
>  	.ssr_name = "lpass",
>  	.sysmon_name = "adsp",
>  	.ssctl_id = 0x14,
> +	.is_wpss = false,
> +	.auto_boot = true;
>  	.clk_ids = (const char*[]) {
>  		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
>  		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
> @@ -528,6 +585,8 @@ static const struct adsp_pil_data 
> cdsp_resource_init = {
>  	.ssr_name = "cdsp",
>  	.sysmon_name = "cdsp",
>  	.ssctl_id = 0x17,
> +	.is_wpss = false,
> +	.auto_boot = true;
>  	.clk_ids = (const char*[]) {
>  		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
>  		"q6_axim", NULL
> @@ -535,7 +594,23 @@ static const struct adsp_pil_data 
> cdsp_resource_init = {
>  	.num_clks = 7,
>  };
> 
> +static const struct adsp_pil_data wpss_resource_init = {
> +	.crash_reason_smem = 626,
> +	.firmware_name = "wpss.mdt",
> +	.ssr_name = "wpss",
> +	.sysmon_name = "wpss",
> +	.ssctl_id = 0x19,
> +	.is_wpss = true,
> +	.auto_boot = false;
> +	.clk_ids = (const char*[]) {
> +		"gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> +		"gcc_wpss_rscp_clk", NULL
> +	},
> +	.num_clks = 3,
> +};
> +
>  static const struct of_device_id adsp_of_match[] = {
> +	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init 
> },

should be in sort order.

>  	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init 
> },
>  	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init 
> },
>  	{ },

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
