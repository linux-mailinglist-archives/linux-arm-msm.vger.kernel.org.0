Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0801BD163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 02:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgD2Att (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 20:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726381AbgD2Ats (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 20:49:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDB4C03C1AE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:49:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e6so56698pjt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q3EtAKvEWUW0/w8OE9AzaYUShPhgEQZLo83EeVoVlc8=;
        b=XpsPFxZaKEr5HNrwdLuHLBro4Q5ws03ekVwIfeuLisq1Awlppg8GH1tIGMYhyA3Sz7
         4ATUAgx1MVLSFttmueMe1mlHnEbFsthxOxWIC17+NLy43GuPldaWJCd03/bFRfP+HvVP
         x30IY/T14k/EHzusAjSy+CzGRfkwgknV2LEc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q3EtAKvEWUW0/w8OE9AzaYUShPhgEQZLo83EeVoVlc8=;
        b=gyjSSCUMvej1eQsO2rG2XFszb3G0OdIiiR480Y2B4R87CLTvz/o4pe3YEmcq87lnB/
         wq2BR/hFUgxQ/w5cngaE53OTKJWlRwARd9LfgOiqGndpGavFATNedLq9xpLQnqxNYWQN
         S3MKAgSufwQq3N0VDp9jw+s/ellntWQTbY8Qazw41WvHr8axUiV9wMXdr0JxTRIHSDRK
         4+w5tYKRrlJjP4c9HOVdi9TFcIEN5mClx0W2iq8NJrkrKqpVAGwQWfg3GjipmTmLLWNn
         vd6IH4+Vrg8XN5nU0BFbO88Vy4EqK81tMogipvMU55FonMOBlnuxQUZ+fWFm3dt+o59y
         l2ug==
X-Gm-Message-State: AGi0PuZ8Tk1SUhS6nwJgxTSWLM4vh/8VeCi98wQ9jYFqeFj7lZGJG8jL
        3xNA2t2HFx+v5luIyXWdyaEe/g==
X-Google-Smtp-Source: APiQypKbNcABrcklk/jOHdelRiUtXSs4G6lWcVte78/wBQee0IK+DS+s0hk+TPBBJkWfCkERI4hA4A==
X-Received: by 2002:a17:902:7241:: with SMTP id c1mr29864763pll.113.1588121387832;
        Tue, 28 Apr 2020 17:49:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b3sm14073059pgh.75.2020.04.28.17.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 17:49:47 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:49:45 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 15/17] spi: spi-qcom-qspi: Use OPP API to set clk/perf
 state
Message-ID: <20200429004945.GP4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-16-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-16-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 28, 2020 at 07:03:03PM +0530, Rajendra Nayak wrote:
> QSPI needs to vote on a performance state of a power domain depending on
> the clock rate. Add support for it by specifying the perf state/clock rate
> as an OPP table in device tree.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: linux-spi@vger.kernel.org
> ---
>  drivers/spi/spi-qcom-qspi.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 3c4f83b..724a658 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_opp.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi-mem.h>
>  
> @@ -139,6 +140,8 @@ struct qcom_qspi {
>  	struct device *dev;
>  	struct clk_bulk_data *clks;
>  	struct qspi_xfer xfer;
> +	struct opp_table *opp_table;
> +	bool has_opp_table;
>  	/* Lock to protect xfer and IRQ accessed registers */
>  	spinlock_t lock;
>  };
> @@ -235,7 +238,7 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
>  		speed_hz = xfer->speed_hz;
>  
>  	/* In regular operation (SBL_EN=1) core must be 4x transfer clock */
> -	ret = clk_set_rate(ctrl->clks[QSPI_CLK_CORE].clk, speed_hz * 4);
> +	ret = dev_pm_opp_set_rate(ctrl->dev, speed_hz * 4);
>  	if (ret) {
>  		dev_err(ctrl->dev, "Failed to set core clk %d\n", ret);
>  		return ret;
> @@ -481,6 +484,20 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>  	master->handle_err = qcom_qspi_handle_err;
>  	master->auto_runtime_pm = true;
>  
> +	ctrl->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
> +	if (IS_ERR(ctrl->opp_table)) {
> +		ret = PTR_ERR(ctrl->opp_table);
> +		goto exit_probe_master_put;
> +	}
> +	/* OPP table is optional */
> +	ret = dev_pm_opp_of_add_table(&pdev->dev);
> +	if (!ret) {
> +		ctrl->has_opp_table = true;
> +	} else if (ret != -ENODEV) {
> +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> +		return ret;

		goto exit_probe_master_put;
