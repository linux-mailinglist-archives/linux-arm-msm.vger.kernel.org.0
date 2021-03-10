Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA84334373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233399AbhCJQpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbhCJQoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:44:46 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953E0C061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 08:44:45 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a17so17013696oto.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qF9lwoAQ0bHig3ZbQtV49nJbYaq15GKKDkvhnDNJZSA=;
        b=g75P+91U4FiQBPF8F+MUraWqeGVFB+TmhlRoT0HzCGEeY6jwwlV1iJjteXLsWzdkY5
         tOdL3Mi9WU3hSWldHFdH/6KBb4ct5oFxlI60MZc4C2TYkewNG3JL1F4c7D2Gm8IfCEOh
         rTKtcJZqjptSGASkniEJlvOhUdJDWpifIaRm6u8BUeRiAXzhR4bfCqJPYIgLJRIxxMcJ
         0+a/Bs1nuaw2Bb422BPmRcwLf0kkMmYrlcRpOH1H+4aYko6MqbczolNxDHcG7MGde5Kb
         fLY+641Fn5jpc+3+FH30rp2fZ1lODh8riJoSVB9/C9Kbc1afkJc3EzfdV+DCQgluRfkw
         73Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qF9lwoAQ0bHig3ZbQtV49nJbYaq15GKKDkvhnDNJZSA=;
        b=sVFhEbYPKoZCPaXhFivbrmmG+DWusdErGAmKfb4Iv2fqgdExQEnNpTOiUfc9HGbnBu
         RmqrnivWZDNv6XWUxu9O0/OLy0oYkVbk+Fj8P70wLISYFzhIoV0v17T+SUuIxTU1s4ph
         g3O2QrFlCu9MarWZgvRzW061V/LfsGHS7qzmb8YaT4w7D8cyeHD9HsOElf39fHt42dZN
         MYYCEfhEVtnFjoEwdTUGmFLE684hsMATDsEwl3Cvd1k6+aaUHhp5Hk0vwPbE7NJvlopU
         0MGrfbRzrCR9A466owImcxj/poaQedwrG6Uuh80hn5Yxxv6WhfRpGEHOb0P29/gOluDL
         Qpgg==
X-Gm-Message-State: AOAM533TYuYG4RPTRx0YRtb6VWBNJ2jhzxK7VtIMYCUM7URHVB0revT8
        8O3/kY2bc4QgnpPYU42Smmwaeg==
X-Google-Smtp-Source: ABdhPJxXqIA/g8G2JMTDd4M2dVZJUhiEPQ83OgDtLdttqr8jghhfIKTTuzgSGxm44f4Pz8CxnuHYZg==
X-Received: by 2002:a9d:7e8d:: with SMTP id m13mr3264729otp.54.1615394684879;
        Wed, 10 Mar 2021 08:44:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g6sm28199otp.68.2021.03.10.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:44:44 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:44:42 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for sc7280
 WPSS
Message-ID: <YEj3emYBinvkfaby@builder.lan>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-3-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615361290-19238-3-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Mar 01:28 CST 2021, Rakesh Pillai wrote:

> Add support for PIL loading of WPSS processor for SC7280
> WPSS boot will be requested by the wifi driver and hence
> disable auto-boot for WPSS. Also add a separate shutdown
> sequence handler for WPSS.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_adsp.c | 77 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
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
> +	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 1);
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
> +
> +	/* Place the WPSS processor into reset */
> +	reset_control_assert(adsp->restart);
> +	/* wait after asserting subsystem restart from AOSS */
> +	usleep_range(100, 105);
> +	/* Remove the WPSS reset */
> +	reset_control_deassert(adsp->restart);
> +
> +	usleep_range(100, 105);
> +
> +	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 0);
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
> @@ -447,6 +497,11 @@ static int adsp_probe(struct platform_device *pdev)
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
> @@ -515,6 +570,8 @@ static const struct adsp_pil_data adsp_resource_init = {
>  	.ssr_name = "lpass",
>  	.sysmon_name = "adsp",
>  	.ssctl_id = 0x14,
> +	.is_wpss = false,
> +	.auto_boot = true;
>  	.clk_ids = (const char*[]) {
>  		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
>  		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
> @@ -528,6 +585,8 @@ static const struct adsp_pil_data cdsp_resource_init = {
>  	.ssr_name = "cdsp",
>  	.sysmon_name = "cdsp",
>  	.ssctl_id = 0x17,
> +	.is_wpss = false,
> +	.auto_boot = true;
>  	.clk_ids = (const char*[]) {
>  		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
>  		"q6_axim", NULL
> @@ -535,7 +594,23 @@ static const struct adsp_pil_data cdsp_resource_init = {
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

Why is auto_boot false for the WPSS?

> +	.clk_ids = (const char*[]) {
> +		"gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> +		"gcc_wpss_rscp_clk", NULL
> +	},
> +	.num_clks = 3,
> +};
> +
>  static const struct of_device_id adsp_of_match[] = {
> +	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },

Nit. Please keep things like this sorted alphabetically.

Regards,
Bjorn

>  	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
>  	{ },
> -- 
> 2.7.4
> 
