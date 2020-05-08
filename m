Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39B11CB713
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 20:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgEHSZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 14:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726807AbgEHSZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 14:25:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74986C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 11:25:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ms17so4657637pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bqkEG1gBbegEHG+vcv1JCfT8GVbBD+E8PBJdI8FAn6E=;
        b=gh80ZyF5iS1qUz+dRJn6n19DWyvc4DsN2amHWcYu50NgDPFmz5DbO5VaH42wEGqp6X
         lH/oA7JwYJJ8Dd6M8f1tMqkXaDEzuhYR1q2cx1HBq1HQq49vhE1GwApDKNJQNoNqJ+bb
         yD0syRG5ERkk4NWakIC+kMmLdhO3nj+aEbBfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bqkEG1gBbegEHG+vcv1JCfT8GVbBD+E8PBJdI8FAn6E=;
        b=Pzu2uSanmnUp5fEUddR0JXVQHqQbv6jYASMyrWFKvfe+YmkE+7d0nj0ycUwC4+oHhG
         gbhqq2K+dhkIm8jtTTmiNZSKPGdEGk7IxbM3E9uEd+78tqtC2jj46j6KxIQsJ7nk1hyr
         vC3Xt6Kc47uzVYB8XGBW5KB+mNnWNvh+lGOfxTfaZFXM52FZLemDdhf/VLpkLkIdk6ek
         C++zmJ7qoZ/nN26sQWAcc31yK8A1Nl7YOzqW8AIDiNuM5IJde1Y7oikhvnGA7HfhmhMl
         2Pdmhppa5xitpX9Pb06cyHInYR1h6vplv2r5c+GdGWR0ehO/6BmH5OOJKu1sG+vSJA+5
         a96w==
X-Gm-Message-State: AGi0PuZq5isa+mtsihfRkpc6CJ+39pZWId4QpeRZgddyn8YZRglfMfM1
        sNvry7uqC86MwccBhrEWS2T2Jw==
X-Google-Smtp-Source: APiQypJ0xrtY/dohI6/d6DP6TfAzvGejQDeWeS22AEZXfFO4twLKGk586Hs7RZ8ERNOpFBcoqmdlMg==
X-Received: by 2002:a17:90a:840e:: with SMTP id j14mr7609836pjn.85.1588962334905;
        Fri, 08 May 2020 11:25:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id e11sm1816073pgs.41.2020.05.08.11.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 11:25:33 -0700 (PDT)
Date:   Fri, 8 May 2020 11:25:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, georgi.djakov@linaro.org
Subject: Re: [PATCH V5 4/7] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200508182532.GD4525@google.com>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588919619-21355-5-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 12:03:36PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - As per Matthias's comment, use helper ICC function from geni-se driver.
> 
> Changes in V4:
>  - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
>    to ICC core.
> 
> Changes in V5:
>  - Use icc_enable/disable in power on/off call.
>  - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>    from probe so that when resume/icc_enable is called NOC are running at
>    some non-zero value. No need to call icc_disable after BW vote because
>    device will resume and suspend before probe return and will leave ICC in
>    disabled state.
> 
>  drivers/spi/spi-geni-qcom.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c397242..5dfa1fb 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -234,6 +234,13 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>  		return ret;
>  	}
>  
> +	/* Set BW quota for CPU as driver supports FIFO mode only. */
> +	geni_icc_bw_init(&se->icc_paths[CPU_TO_GENI],
> +				Bps_to_icc(mas->cur_speed_hz), 0);
> +	ret = geni_icc_set_bw(se);
> +	if (ret)
> +		return ret;
> +
>  	clk_sel = idx & CLK_SEL_MSK;
>  	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
>  	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
> @@ -578,6 +585,19 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	spin_lock_init(&mas->lock);
>  	pm_runtime_enable(dev);
>  
> +	ret = geni_icc_get(&mas->se, NULL);
> +	if (ret)
> +		goto spi_geni_probe_runtime_disable;
> +	/* Set the bus quota to a reasonable value for register access */
> +	geni_icc_bw_init(&mas->se.icc_paths[GENI_TO_CORE],
> +			Bps_to_icc(CORE_2X_50_MHZ), 0);
> +	geni_icc_bw_init(&mas->se.icc_paths[CPU_TO_GENI], GENI_DEFAULT_BW, 0);
> +
> +	/* Set BW for register access */

This comment doesn't add any value. Register access is mentioned a few lines
above and from the function name it's evident that it sets the ICC bandwidth.

> +	ret = geni_icc_set_bw(&mas->se);
> +	if (ret)
> +		goto spi_geni_probe_runtime_disable;
> +
>  	ret = spi_geni_init(mas);
>  	if (ret)
>  		goto spi_geni_probe_runtime_disable;
> @@ -616,14 +636,24 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
>  {
>  	struct spi_master *spi = dev_get_drvdata(dev);
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	int ret;
> +
> +	ret = geni_se_resources_off(&mas->se);
> +	if (ret)
> +		return ret;
>  
> -	return geni_se_resources_off(&mas->se);
> +	return geni_icc_disable(&mas->se);
>  }
>  
>  static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
>  {
>  	struct spi_master *spi = dev_get_drvdata(dev);
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	int ret;
> +
> +	ret = geni_icc_enable(&mas->se);
> +	if (ret)
> +		return ret;
>  
>  	return geni_se_resources_on(&mas->se);
>  }

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
