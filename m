Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6E91BBB3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 12:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgD1Kbm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 06:31:42 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:56518 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgD1Kbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 06:31:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588069899; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=C7Nzqo45CDsdOMCR2qiEOVSlhajdt6ea798XRj/Glxc=;
 b=LxFM0NQo0lB4I5XuTqshmHuz512axnAgvMKy8uLvjHM6jmLeesS8U5YtEYc/e8NWEtjCSgcO
 ERuXStEmvisNCnZA5cPpvIDj9K00jWAvcfpInVZF6J+3LlzxNzXfe5CHWBj50ZLznGRYF92D
 JtZVfOqh00mThLdnQQZPrh9Bt2Y=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea805f8.7f67d99ed6f8-smtp-out-n04;
 Tue, 28 Apr 2020 10:31:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB608C433CB; Tue, 28 Apr 2020 10:31:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 652BAC433BA;
        Tue, 28 Apr 2020 10:31:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Apr 2020 16:01:19 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add SM8250 PAS remoteprocs
In-Reply-To: <20200428000110.2958704-2-bjorn.andersson@linaro.org>
References: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
 <20200428000110.2958704-2-bjorn.andersson@linaro.org>
Message-ID: <67b0b2a8b9581ddafb48e7f808e47857@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

On 2020-04-28 05:31, Bjorn Andersson wrote:
> Add audio, compute and sensor DSP compatibles to the Qualcomm PAS
> binding and driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 62 ++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8ecc157f1ed1..5f2266c74448 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -508,6 +508,26 @@ static const struct adsp_data sm8150_adsp_resource 
> = {
>  		.ssctl_id = 0x14,
>  };
> 
> +static const struct adsp_data sm8250_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.has_aggre2_clk = false,
> +	.auto_boot = true,
> +	.active_pd_names = (char*[]){
> +		"load_state",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",

you may want to name it as lcx, lmx.
The remaining looks good!

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> +		NULL
> +	},
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +};
> +
>  static const struct adsp_data msm8998_adsp_resource = {
>  		.crash_reason_smem = 423,
>  		.firmware_name = "adsp.mdt",
> @@ -553,6 +573,25 @@ static const struct adsp_data sm8150_cdsp_resource 
> = {
>  	.ssctl_id = 0x17,
>  };
> 
> +static const struct adsp_data sm8250_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.pas_id = 18,
> +	.has_aggre2_clk = false,
> +	.auto_boot = true,
> +	.active_pd_names = (char*[]){
> +		"load_state",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		NULL
> +	},
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +};
> +
>  static const struct adsp_data mpss_resource_init = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
> @@ -604,6 +643,26 @@ static const struct adsp_data sm8150_slpi_resource 
> = {
>  		.ssctl_id = 0x16,
>  };
> 
> +static const struct adsp_data sm8250_slpi_resource = {
> +	.crash_reason_smem = 424,
> +	.firmware_name = "slpi.mdt",
> +	.pas_id = 12,
> +	.has_aggre2_clk = false,
> +	.auto_boot = true,
> +	.active_pd_names = (char*[]){
> +		"load_state",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"lcx",
> +		"lmx",
> +		NULL
> +	},
> +	.ssr_name = "dsps",
> +	.sysmon_name = "slpi",
> +	.ssctl_id = 0x16,
> +};
> +
>  static const struct adsp_data msm8998_slpi_resource = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
> @@ -644,6 +703,9 @@ static const struct of_device_id adsp_of_match[] = 
> {
>  	{ .compatible = "qcom,sm8150-cdsp-pas", .data = 
> &sm8150_cdsp_resource},
>  	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
>  	{ .compatible = "qcom,sm8150-slpi-pas", .data = 
> &sm8150_slpi_resource},
> +	{ .compatible = "qcom,sm8250-adsp-pas", .data = 
> &sm8250_adsp_resource},
> +	{ .compatible = "qcom,sm8250-cdsp-pas", .data = 
> &sm8250_cdsp_resource},
> +	{ .compatible = "qcom,sm8250-slpi-pas", .data = 
> &sm8250_slpi_resource},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
