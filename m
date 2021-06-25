Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC50C3B3A2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 02:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhFYAhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 20:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhFYAhh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 20:37:37 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312B1C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 17:35:18 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u2so3853603plf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 17:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vzM/YuYA5HAl0qi6INvSLkDVGXJszfsmpGFUTovFkMs=;
        b=N5nqq3T71OFF0YBFKrcJfFbV+tFsUjM0Mq0UUDv0V01C2hBShUbkIAEUhjcHZ4g1Zw
         P0GsUrH4Od58QXj8ihKsJUHXS7xrd7IjgM15oTxHMgGqvuiJhbgaiS/TZUkxQj65raVq
         9YU//ze+BqQhyVmNCjK+I5hvgTacdJlkwq77s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vzM/YuYA5HAl0qi6INvSLkDVGXJszfsmpGFUTovFkMs=;
        b=XqA1qwbMyPC5zlLLm6QrXoKZfOF2d3xa4yAOb8fwIc46tsYVgV3w0H24KWlOTYmqQu
         etNQvghwfc4LwFun/Q+5W3uqWVGwBqjessDA/g3wRYIYGS4XEz+7Wl2yDZRgXGX/M6X2
         M867E6iRnLl63/mqSJah4ylEALLNvahTvb3BG3zOQedw3DV0UrmUzqCkC4cGsJ3E3mcb
         bHx3Xg/g4Py0emuMen5UkW9Jtlf93idEBd3lxb7ruHfYduzgZvs5OKwmsIY56ZFcqghj
         54nY95cjis3+RDLFT2Z2741fyay+CaSIfbl/BTL7wna450uCXIYcNNMLw0bLAU2VQctJ
         bUSA==
X-Gm-Message-State: AOAM531Oql30NQ3PS5dM6oGA+06FAuFAkAYHCNygMx3lph7jrvZBOQR1
        o25DLlM8VBRtTQrM59JKOhz6+A==
X-Google-Smtp-Source: ABdhPJwbnLLhX48jzgpepOpjf4kZ0Kx3ZHfqES5ET8h16Kzt7XY1cPjXRIo5YxgqxU9zcQdX5n22mQ==
X-Received: by 2002:a17:90a:b795:: with SMTP id m21mr8132565pjr.143.1624581317514;
        Thu, 24 Jun 2021 17:35:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:dda9:4015:5d1f:23fe])
        by smtp.gmail.com with UTF8SMTPSA id i128sm3957660pfc.142.2021.06.24.17.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 17:35:17 -0700 (PDT)
Date:   Thu, 24 Jun 2021 17:35:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 5/9] remoteproc: mss: q6v5-mss: Add modem support on
 SC7280
Message-ID: <YNUkw5GDrHwTVcC5@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-6-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On Fri, Jun 25, 2021 at 01:17:34AM +0530, Sibi Sankar wrote:
> Add out of reset sequence support for modem sub-system on SC7280 SoCs.
> It requires access to an additional set of qaccept registers, external
> power/clk control registers and halt vq6 register to put the modem back
> into reset.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 245 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 241 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 5d21084004cb..4e32811e0025 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -77,6 +77,14 @@
>  
>  #define HALT_ACK_TIMEOUT_US		100000
>  
> +/* QACCEPT Register Offsets */
> +#define QACCEPT_ACCEPT_REG		0x0
> +#define QACCEPT_ACTIVE_REG		0x4
> +#define QACCEPT_DENY_REG		0x8
> +#define QACCEPT_REQ_REG			0xC
> +
> +#define QACCEPT_TIMEOUT_US		50
> +
>  /* QDSP6SS_RESET */
>  #define Q6SS_STOP_CORE			BIT(0)
>  #define Q6SS_CORE_ARES			BIT(1)
> @@ -143,6 +151,9 @@ struct rproc_hexagon_res {
>  	bool has_alt_reset;
>  	bool has_mba_logs;
>  	bool has_spare_reg;
> +	bool has_qaccept_regs;
> +	bool has_ext_cntl_regs;
> +	bool has_vq6;
>  };
>  
>  struct q6v5 {
> @@ -158,8 +169,18 @@ struct q6v5 {
>  	u32 halt_q6;
>  	u32 halt_modem;
>  	u32 halt_nc;
> +	u32 halt_vq6;
>  	u32 conn_box;
>  
> +	u32 qaccept_mdm;
> +	u32 qaccept_cx;
> +	u32 qaccept_axi;
> +
> +	u32 axim1_clk_off;
> +	u32 crypto_clk_off;
> +	u32 force_clk_on;
> +	u32 rscc_disable;
> +
>  	struct reset_control *mss_restart;
>  	struct reset_control *pdc_reset;
>  
> @@ -201,6 +222,9 @@ struct q6v5 {
>  	bool has_alt_reset;
>  	bool has_mba_logs;
>  	bool has_spare_reg;
> +	bool has_qaccept_regs;
> +	bool has_ext_cntl_regs;
> +	bool has_vq6;
>  	int mpss_perm;
>  	int mba_perm;
>  	const char *hexagon_mdt_image;
> @@ -213,6 +237,7 @@ enum {
>  	MSS_MSM8996,
>  	MSS_MSM8998,
>  	MSS_SC7180,
> +	MSS_SC7280,
>  	MSS_SDM845,
>  };
>  
> @@ -473,6 +498,12 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
>  				   AXI_GATING_VALID_OVERRIDE, 0);
>  		ret = reset_control_deassert(qproc->mss_restart);
> +	} else if (qproc->has_ext_cntl_regs) {
> +		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
> +		reset_control_assert(qproc->pdc_reset);
> +		reset_control_assert(qproc->mss_restart);
> +		reset_control_deassert(qproc->pdc_reset);
> +		ret = reset_control_deassert(qproc->mss_restart);
>  	} else {
>  		ret = reset_control_assert(qproc->mss_restart);
>  	}
> @@ -490,7 +521,7 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
>  		ret = reset_control_reset(qproc->mss_restart);
>  		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
>  		reset_control_deassert(qproc->pdc_reset);
> -	} else if (qproc->has_spare_reg) {
> +	} else if (qproc->has_spare_reg || qproc->has_ext_cntl_regs) {
>  		ret = reset_control_reset(qproc->mss_restart);
>  	} else {
>  		ret = reset_control_deassert(qproc->mss_restart);
> @@ -604,7 +635,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  		}
>  
>  		goto pbl_wait;
> -	} else if (qproc->version == MSS_SC7180) {
> +	} else if (qproc->version == MSS_SC7180 || qproc->version == MSS_SC7280) {
>  		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
>  		val |= Q6SS_CBCR_CLKEN;
>  		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
> @@ -787,6 +818,82 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  	return ret;
>  }
>  
> +static int q6v5proc_enable_qchannel(struct q6v5 *qproc, struct regmap *map, u32 offset)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	if (!qproc->has_qaccept_regs)
> +		return 0;
> +
> +	if (qproc->has_ext_cntl_regs) {
> +		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
> +		regmap_write(qproc->conn_map, qproc->force_clk_on, 1);
> +
> +		ret = regmap_read_poll_timeout(qproc->halt_map, qproc->axim1_clk_off, val,
> +					       !val, 1, Q6SS_CBCR_TIMEOUT_US);
> +		if (ret) {
> +			dev_err(qproc->dev, "failed to enable axim1 clock\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	regmap_write(map, offset + QACCEPT_REQ_REG, 1);
> +
> +	/* Wait for accept */
> +	ret = regmap_read_poll_timeout(map, offset + QACCEPT_ACCEPT_REG, val, val, 5,
> +				       QACCEPT_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(qproc->dev, "qchannel enable failed\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static void q6v5proc_disable_qchannel(struct q6v5 *qproc, struct regmap *map, u32 offset)
> +{
> +	int ret;
> +	unsigned int val, retry;
> +	unsigned int nretry = 10;
> +	bool takedown_complete = false;
> +
> +	if (!qproc->has_qaccept_regs)
> +		return;
> +
> +	while (!takedown_complete && nretry) {
> +		nretry--;
> +
> +		regmap_read_poll_timeout(map, offset + QACCEPT_ACTIVE_REG, val, !val, 5,
> +					 QACCEPT_TIMEOUT_US);
> +
> +		regmap_write(map, offset + QACCEPT_REQ_REG, 0);
> +
> +		retry = 10;
> +		while (retry) {
> +			usleep_range(5, 10);
> +			retry--;
> +			ret = regmap_read(map, offset + QACCEPT_DENY_REG, &val);
> +			if (!ret && val) {
> +				regmap_write(map, offset + QACCEPT_REQ_REG, 1);
> +				break;
> +			}
> +
> +			ret = regmap_read(map, offset + QACCEPT_ACCEPT_REG, &val);
> +			if (!ret && !val) {
> +				takedown_complete = true;
> +				break;
> +			}

A bit of commentary in this branch would do no harm. From the code flow
I can guess that disabling the channel failed when QACCEPT_DENY_REG != 0,
and hence the channel is re-enabled (?) for the next try, and apparently
things are fine when QACCEPT_ACCEPT_REG is 0 after disabling the channel.
Would be good to be a bit more explicit about what all that actually
means.

> +		}
> +
> +		if (!retry)
> +			break;
> +	}
> +
> +	if (!takedown_complete)
> +		dev_err(qproc->dev, "qchannel takedown failed\n");
> +}
