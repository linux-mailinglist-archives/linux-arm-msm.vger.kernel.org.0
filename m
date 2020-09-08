Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E680261384
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 17:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730461AbgIHPa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 11:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730480AbgIHPZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:25:27 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FE8C02C3FA
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 07:39:58 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id u126so16632630oif.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B9y2PDvUvZO6pA9QPqM07mfCiCS1PPPwWLUWTNQ0T+k=;
        b=rrJPRkuTSNK1Uj4beMrFhz2A6e8qYcXNOKqQj0FEeTqPMpYjHz29lFKeD6OXRMOyiZ
         w+b3PZOItr91ASEk8hf5FV3/ikgAdPKaBZiT4VZa4uxybX5COd7pbFwjFb/EFkc3yMID
         UGShIfuFLI9C4yKye7z0NihDfnc7jzq/1nHWyOvn7gRvxnXVy8ByjI+C914ursaL4VPJ
         4eIfIPtmHkFCvIgrKtMMon0SCrs3K2cdP3AsnPjtGz4LbyrylEWIXXZvhTRcwI7RHdO0
         80WBTCR2bdzZ0YDUtidmNmz30LSCq6MkulWNIv97UD0/Ef4FIJOMSdAws7bnrcFuHKWx
         sJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B9y2PDvUvZO6pA9QPqM07mfCiCS1PPPwWLUWTNQ0T+k=;
        b=ArDYx9dKwUbsu+k+CHBqyOVT6VCMvXDQl+Ky+Dob/SD7NMJYllSdcYI8Hurm+P/kvb
         spkKoZVl7EwCbHW1GhgK8Qfih0Z0Br0+dZNR0J2ZVdSLKhGNiv+3rVz/JZZljBAY41wd
         nFt5alZck0Gca+pQKeQotzC/fqAcbbDAXvu5l4UuAt98gopB9fagnrJrnXvT62/cTIM9
         askLagNLkTT1mghydaWO2Qdvh8e1Cyw10R6qUzGNHzv5AXGK5UK3psehvj0bny5tSLXH
         GRJL88z0Ll39BZG3cXaCdhPS3S+KzI8vCCW8rHH5To0SA4CcEYTLwMS4roADGFgrckAM
         312A==
X-Gm-Message-State: AOAM530cuv5Czm80kDvDwKoXAwjyjZdVHqhLAgJxnCqpfv7EbpS/crPr
        U9gsq1V2nEANb0/EYC0QX2UzpQ==
X-Google-Smtp-Source: ABdhPJwll5JKD9tQh7TP1Lsg0TT3zbaF8f4twOFkS7XaRpg7+tD1UiItZc3JE96ohok+pV4EDKDrTw==
X-Received: by 2002:aca:52ca:: with SMTP id g193mr2871130oib.126.1599575997699;
        Tue, 08 Sep 2020 07:39:57 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id p8sm3510421oot.29.2020.09.08.07.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 07:39:56 -0700 (PDT)
Date:   Tue, 8 Sep 2020 09:39:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 2/2] venus: firmware: Set virtual address ranges
Message-ID: <20200908143954.GK3715@yoga>
References: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
 <20200817082723.17458-3-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817082723.17458-3-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 17 Aug 03:27 CDT 2020, Stanimir Varbanov wrote:

> In order to boot some of the new Venus firmware versions TZ call to set
> virtual address ranges is needed. Add virtual address ranges for CP and
> CP_NONPIX in resource structure and use them when loading and booting
> the firmware on remote processor.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c     |  4 ++++
>  drivers/media/platform/qcom/venus/core.h     |  4 ++++
>  drivers/media/platform/qcom/venus/firmware.c | 18 +++++++++++++++++-
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..5f8f7b72731c 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -527,6 +527,10 @@ static const struct venus_resources sdm845_res_v2 = {
>  	.vmem_size = 0,
>  	.vmem_addr = 0,
>  	.dma_mask = 0xe0000000 - 1,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
>  	.fwname = "qcom/venus-5.2/venus.mdt",
>  };
>  
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7118612673c9..8c88516e4694 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -68,6 +68,10 @@ struct venus_resources {
>  	unsigned int vmem_id;
>  	u32 vmem_size;
>  	u32 vmem_addr;
> +	u32 cp_start;
> +	u32 cp_size;
> +	u32 cp_nonpixel_start;
> +	u32 cp_nonpixel_size;
>  	const char *fwname;
>  };
>  
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 8801a6a7543d..ac906ffc608f 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -181,6 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  int venus_boot(struct venus_core *core)
>  {
>  	struct device *dev = core->dev;
> +	const struct venus_resources *res = core->res;
>  	phys_addr_t mem_phys;
>  	size_t mem_size;
>  	int ret;
> @@ -200,7 +201,22 @@ int venus_boot(struct venus_core *core)
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	if (core->use_tz && res->cp_size) {
> +		ret = qcom_scm_mem_protect_video_var(res->cp_start,
> +						     res->cp_size,
> +						     res->cp_nonpixel_start,
> +						     res->cp_nonpixel_size);
> +		if (ret) {
> +			dev_err(dev, "set virtual address ranges fail (%d)\n",
> +				ret);
> +			return ret;

Afaict venus_probe() will tear down clocks and power of the now running
Venus core when you return an error here. Isn't it necessary to stop the
core here as well?

Regards,
Bjorn

> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  int venus_shutdown(struct venus_core *core)
> -- 
> 2.17.1
> 
