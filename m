Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C083E417E1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 01:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344050AbhIXXWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 19:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343748AbhIXXW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 19:22:27 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B75C061571
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 16:20:54 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u22so16664361oie.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 16:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3SchbBMO8esSuHO9zb7hi/3VwsuPSq+/4byWQI9bhwo=;
        b=MOor9mQhKPl5tsRdcLpdQnaXi5NpBXdWbuxV0ckEABcfX7Gwwee+yO1tRtmTkbAqXL
         o+/VWwO6FCjwXTDio/4o86nhB+kmuIcCbTRJTJSra5iGvvYEvzEDdjcBt7kz93nkrwc9
         +Or1K0qX5zSXtflOmuP40+uAkHcScPqBbJdfIZ4wRLN9/6u5dqNUo1NCVozh9vI0DSMd
         8t9JrwwxjjmJLMISAwWXTruABy93/9sJKel/s9jp0cBZu/JqdsPEm9GAyRDWYe48RByD
         6jE2P3JoFq0burmGlnibCIYGc3Nsc+O9iy1cV5xong7ch2plsXzkn+NVxNzBw6/plVsV
         6I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3SchbBMO8esSuHO9zb7hi/3VwsuPSq+/4byWQI9bhwo=;
        b=OWIVTI9mMeJ3HyVFJdQjjGSVAHdIcQ6fNPh1lmLjuw1GN6bSLI/V6Cz2UMcLYgwyXl
         4jJJCWQLIbof3c3QSdQP1p9KZyVtiDDRT0ZemNyQmQ+68W1M+UvJEb8c9HdP5MSCOob6
         5jbaaQZ+c9g+NfrOLHXbzwH1U5SkPq7U3pY1MRMoTLp2sqv23Jh14JH65tC8ZEowYUf9
         Yp1c90p8vTWIgyHKReQ2ET7Us4TZPCONgmzmaxbYcUN5EDhCYPYsM5D+qdkI7Vu6lkcy
         sM0TFlTS8yLptN4MAzTociPJ3/irxGcYRnHJG06pMyYY4AI1SoS7pjHjaGlGsAn8QA4M
         EnnA==
X-Gm-Message-State: AOAM533fwek3fDNzmfGcva6scLTD8rrn5Vvd+VkPcTQhXUF7clU8tplA
        NGYf/yznWt3rl4AnRVxlkI19eA==
X-Google-Smtp-Source: ABdhPJzdZ0UUeH7LezRjVbUG0+gFu4oT4kFRdeQnkwsynww3XrNmiy/7XKCSlhx024OGg+AyxHHrXA==
X-Received: by 2002:a05:6808:d51:: with SMTP id w17mr3477533oik.179.1632525653217;
        Fri, 24 Sep 2021 16:20:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e10sm2464064oig.11.2021.09.24.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 16:20:52 -0700 (PDT)
Date:   Fri, 24 Sep 2021 18:20:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v9 2/5] soc: qcom: Add SoC sleep stats driver
Message-ID: <YU5dUlscQzGXloKc@builder.lan>
References: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
 <1630906083-32194-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630906083-32194-3-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Sep 00:28 CDT 2021, Maulik Shah wrote:

> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Let's add a driver to read the stats from remote processor and
> export to debugfs.
> 
> The driver creates "qcom_sleep_stats" directory in debugfs and
> adds files for various low power mode available. Below is sample
> output with command
> 
> cat /sys/kernel/debug/qcom_sleep_stats/ddr
> count = 0
> Last Entered At = 0
> Last Exited At = 0
> Accumulated Duration = 0
> 
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> [mkshah: add subsystem sleep stats, create one file for each stat]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig           |  10 ++
>  drivers/soc/qcom/Makefile          |   1 +
>  drivers/soc/qcom/soc_sleep_stats.c | 241 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 252 insertions(+)
>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 79b568f..e80b63a 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -190,6 +190,16 @@ config QCOM_SOCINFO
>  	 Say yes here to support the Qualcomm socinfo driver, providing
>  	 information about the SoC to user space.
>  
> +config QCOM_SOC_SLEEP_STATS
> +	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
> +	depends on QCOM_SMEM
> +	help
> +	  Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
> +	  the shared memory exported by the remote processor related to
> +	  various SoC level low power modes statistics and export to debugfs
> +	  interface.
> +
>  config QCOM_WCNSS_CTRL
>  	tristate "Qualcomm WCNSS control driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ad675a6..5f30d74 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
> +obj-$(CONFIG_QCOM_SOC_SLEEP_STATS)	+= soc_sleep_stats.o

I know that the rest of the modules here does a bad job and have
completely generic names, but could we rename this "qcom_sleep_stats"
instead?

>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>  obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
[..]
> +static int qcom_soc_sleep_stats_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *reg;
> +	struct dentry *root;
> +	const struct stats_config *config;
> +	struct stats_data *d;
> +	int i;
> +
> +	config = device_get_match_data(&pdev->dev);
> +	if (!config)
> +		return -ENODEV;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return PTR_ERR(res);

You no longer use this "res".

> +
> +	reg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (!reg)

IS_ERR()

> +		return -ENOMEM;
> +
> +	d = devm_kcalloc(&pdev->dev, config->num_records,
> +			 sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < config->num_records; i++)
> +		d[i].appended_stats_avail = config->appended_stats_avail;
> +
> +	root = debugfs_create_dir("qcom_sleep_stats", NULL);
> +
> +	qcom_create_subsystem_stat_files(root);
> +	qcom_create_soc_sleep_stat_files(root, reg, d, config->num_records);
> +
> +	platform_set_drvdata(pdev, root);
> +
> +	return 0;
> +}
> +
> +static int qcom_soc_sleep_stats_remove(struct platform_device *pdev)
> +{
> +	struct dentry *root = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(root);
> +
> +	return 0;
> +}
> +
> +static const struct stats_config rpm_data = {
> +	.num_records = 2,
> +	.appended_stats_avail = true,
> +};
> +
> +static const struct stats_config rpmh_data = {
> +	.num_records = 3,
> +	.appended_stats_avail = false,
> +};
> +
> +static const struct of_device_id qcom_soc_sleep_stats_table[] = {
> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
> +	{ }
> +};

MODULE_DEVICE_TABLE(of, qcom_soc_sleep_stats_table);

Otherwise the module doesn't load automatically.

Regards,
Bjorn

> +
> +static struct platform_driver soc_sleep_stats = {
> +	.probe = qcom_soc_sleep_stats_probe,
> +	.remove = qcom_soc_sleep_stats_remove,
> +	.driver = {
> +		.name = "soc_sleep_stats",
> +		.of_match_table = qcom_soc_sleep_stats_table,
> +	},
> +};
> +module_platform_driver(soc_sleep_stats);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
