Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A358865B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfGKP72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:59:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43373 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbfGKP72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:59:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so2956121pfg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z1TXVCEJuCBRp7RMzPbLjsuYtlEFOBFPBVvDsWzX7EY=;
        b=BHJF7aMjbgg+nZdOU4F1oBUP70FwW4FDZSvRWzwFJv1nvUdeUI0rEfsi0EbYq8es3V
         tz3mHHherNH4MuSxa5+a/8SuvMPTiplC2J2XRaUAOIjDUfZcm3xhMpaiKMMParmJGIK5
         yWmOgxz/UcQaWzIpzokj2ioZsn/sHMR3qukGaF9v7kpLCGt4VFS1HEX/iWcap1OouY7p
         J6Ncv1ly6Wtd74S3xbQtnbzeL1GR0NS3euyY+8eo6QcbmO57N0irBBl1wOTSyVzhGsI/
         A6zqD9mznDFN++gUSnYg8z1IBJfakO1AfNStwfwkNqgU4XRP0WZLE0A9Ln7tnz+mN1Q8
         /MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z1TXVCEJuCBRp7RMzPbLjsuYtlEFOBFPBVvDsWzX7EY=;
        b=uFJ0Hk8m7L+cUD5kfNjfhhj4w8oBTsY7qwEnj8KxJVfMOiwYqUPp/Gb7Y3CbpPjJh4
         8Ed3gld1xDlX8HX54PSoH5F6Td+oBxa9DOJon++atevNaSd03aJH+QuaVddTJL82x0MV
         z8L2r57xb9EkuhYyscSXHDScBr2QKyhlkiAjqTnRt7NapkWYzUyWzTMWP6ddWW/lAbEP
         Hk05BB8Fkc8DNXiRmaJbW5J9G8rynPkaKE8+XSwtAzlIN02Y6RkdN099gVdT1mlOTeUy
         wnD8+swjFaujqnPOAejCTcRDJPOFxTLtmJncz7hymFYlo/ODfsxkn8Dj0I9rxK6T4IW/
         rO6A==
X-Gm-Message-State: APjAAAV5gnHlSp/R0HqFlrr8X5DkCXaV781ab+2WYQtn9XxuUgzP+UC0
        JsI6JMoxzxeO8DMNdkzcEahecQ==
X-Google-Smtp-Source: APXvYqygyKQJJ7J6fQsTI8CdGQ2Ene4ldT26xvXqSG745rHtvBX+5QBvRDTYnxfpEVFPjrvAYD1Acw==
X-Received: by 2002:a17:90a:d58c:: with SMTP id v12mr5586795pju.7.1562860767500;
        Thu, 11 Jul 2019 08:59:27 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a12sm12653314pje.3.2019.07.11.08.59.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:59:26 -0700 (PDT)
Date:   Thu, 11 Jul 2019 09:00:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        jcrouse@codeaurora.org, rishabhb@codeaurora.org,
        vnkgutta@codeaurora.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc-plat: Make the driver more generic
Message-ID: <20190711160032.GR7234@tuxbook-pro>
References: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
 <20190711110340.16672-2-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711110340.16672-2-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Jul 04:03 PDT 2019, Vivek Gautam wrote:

> - Remove 'sdm845' from names, and use 'plat' instead.
> - Move SCT_ENTRY macro to header file.
> - Create a new config structure to asssign to of-match-data.
> 

I interpret the intention of these two patches as that you want to add
some new platform without having to create one llcc-xyz.c per platform.

If that's the case then the only user of this macro would be in plat.c,
so I don't see a reason for moving it to the header file.

> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  drivers/soc/qcom/llcc-plat.c       | 77 ++++++++++++--------------------------
>  include/linux/soc/qcom/llcc-qcom.h | 45 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-plat.c b/drivers/soc/qcom/llcc-plat.c
> index 86600d97c36d..31cff0f75b53 100644
> --- a/drivers/soc/qcom/llcc-plat.c
> +++ b/drivers/soc/qcom/llcc-plat.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
>   *
>   */
>  
> @@ -10,47 +10,7 @@
>  #include <linux/of_device.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>  
> -/*
> - * SCT(System Cache Table) entry contains of the following members:

Should have caught this during previous review, but this comment simply
duplicates the kerneldoc for struct llcc_slice_config.

> - * usecase_id: Unique id for the client's use case
> - * slice_id: llcc slice id for each client
> - * max_cap: The maximum capacity of the cache slice provided in KB
> - * priority: Priority of the client used to select victim line for replacement
> - * fixed_size: Boolean indicating if the slice has a fixed capacity
> - * bonus_ways: Bonus ways are additional ways to be used for any slice,
> - *		if client ends up using more than reserved cache ways. Bonus
> - *		ways are allocated only if they are not reserved for some
> - *		other client.
> - * res_ways: Reserved ways for the cache slice, the reserved ways cannot
> - *		be used by any other client than the one its assigned to.
> - * cache_mode: Each slice operates as a cache, this controls the mode of the
> - *             slice: normal or TCM(Tightly Coupled Memory)
> - * probe_target_ways: Determines what ways to probe for access hit. When
> - *                    configured to 1 only bonus and reserved ways are probed.
> - *                    When configured to 0 all ways in llcc are probed.
> - * dis_cap_alloc: Disable capacity based allocation for a client
> - * retain_on_pc: If this bit is set and client has maintained active vote
> - *               then the ways assigned to this client are not flushed on power
> - *               collapse.
> - * activate_on_init: Activate the slice immediately after the SCT is programmed
> - */
> -#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \

This simply maps macro arguments 1:1 to struct members, there's no need
for a macro for this.

> -	{					\
> -		.usecase_id = uid,		\
> -		.slice_id = sid,		\
> -		.max_cap = mc,			\
> -		.priority = p,			\
> -		.fixed_size = fs,		\
> -		.bonus_ways = bway,		\
> -		.res_ways = rway,		\
> -		.cache_mode = cmod,		\
> -		.probe_target_ways = ptw,	\
> -		.dis_cap_alloc = dca,		\
> -		.retain_on_pc = rp,		\
> -		.activate_on_init = a,		\
> -	}
> -
> -static struct llcc_slice_config sdm845_data[] =  {
> +static const struct llcc_slice_config sdm845_data[] =  {
>  	SCT_ENTRY(LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1),
>  	SCT_ENTRY(LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
>  	SCT_ENTRY(LLCC_VIDSC1,   3,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
> @@ -71,30 +31,39 @@ static struct llcc_slice_config sdm845_data[] =  {
>  	SCT_ENTRY(LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0),
>  };
>  
> -static int sdm845_qcom_llcc_remove(struct platform_device *pdev)
> +static const struct qcom_llcc_config sdm845_cfg = {
> +	.sct_data	= sdm845_data,
> +	.size		= ARRAY_SIZE(sdm845_data),
> +};
> +
> +static int qcom_plat_llcc_remove(struct platform_device *pdev)
>  {
>  	return qcom_llcc_remove(pdev);
>  }
>  
> -static int sdm845_qcom_llcc_probe(struct platform_device *pdev)
> +static int qcom_plat_llcc_probe(struct platform_device *pdev)
>  {
> -	return qcom_llcc_probe(pdev, sdm845_data, ARRAY_SIZE(sdm845_data));
> +	const struct qcom_llcc_config *cfg;
> +
> +	cfg = of_device_get_match_data(&pdev->dev);
> +
> +	return qcom_llcc_probe(pdev, cfg->sct_data, cfg->size);
>  }
>  
> -static const struct of_device_id sdm845_qcom_llcc_of_match[] = {
> -	{ .compatible = "qcom,sdm845-llcc", },
> +static const struct of_device_id qcom_plat_llcc_of_match[] = {
> +	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
>  	{ }
>  };
>  
> -static struct platform_driver sdm845_qcom_llcc_driver = {
> +static struct platform_driver qcom_plat_llcc_driver = {
>  	.driver = {
> -		.name = "sdm845-llcc",
> -		.of_match_table = sdm845_qcom_llcc_of_match,
> +		.name = "qcom-plat-llcc",

With this being the "one and only llcc driver", why not making it
"qcom_llcc"?

> +		.of_match_table = qcom_plat_llcc_of_match,
>  	},
> -	.probe = sdm845_qcom_llcc_probe,
> -	.remove = sdm845_qcom_llcc_remove,
> +	.probe = qcom_plat_llcc_probe,
> +	.remove = qcom_plat_llcc_remove,
>  };
> -module_platform_driver(sdm845_qcom_llcc_driver);
> +module_platform_driver(qcom_plat_llcc_driver);
>  
> -MODULE_DESCRIPTION("QCOM sdm845 LLCC driver");
> +MODULE_DESCRIPTION("QCOM platform LLCC driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h

This file should be describing the public interface to the llcc, the
private pieces is better kept in drivers/soc/qcom/llcc.h

But this patch makes me wonder if there's a need to split llcc-slice and
llcc-plat (and have a header file to describe API between them) instead
of just having one file.

Regards,
Bjorn

> index eb71a50b8afc..8776bb5d3891 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -27,6 +27,46 @@
>  #define LLCC_MDMPNG      21
>  #define LLCC_AUDHW       22
>  
> +/*
> + * SCT(System Cache Table) entry contains of the following members:
> + * usecase_id: Unique id for the client's use case
> + * slice_id: llcc slice id for each client
> + * max_cap: The maximum capacity of the cache slice provided in KB
> + * priority: Priority of the client used to select victim line for replacement
> + * fixed_size: Boolean indicating if the slice has a fixed capacity
> + * bonus_ways: Bonus ways are additional ways to be used for any slice,
> + *		if client ends up using more than reserved cache ways. Bonus
> + *		ways are allocated only if they are not reserved for some
> + *		other client.
> + * res_ways: Reserved ways for the cache slice, the reserved ways cannot
> + *		be used by any other client than the one its assigned to.
> + * cache_mode: Each slice operates as a cache, this controls the mode of the
> + *             slice: normal or TCM(Tightly Coupled Memory)
> + * probe_target_ways: Determines what ways to probe for access hit. When
> + *                    configured to 1 only bonus and reserved ways are probed.
> + *                    When configured to 0 all ways in llcc are probed.
> + * dis_cap_alloc: Disable capacity based allocation for a client
> + * retain_on_pc: If this bit is set and client has maintained active vote
> + *               then the ways assigned to this client are not flushed on power
> + *               collapse.
> + * activate_on_init: Activate the slice immediately after the SCT is programmed
> + */
> +#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \
> +	{					\
> +		.usecase_id = uid,		\
> +		.slice_id = sid,		\
> +		.max_cap = mc,			\
> +		.priority = p,			\
> +		.fixed_size = fs,		\
> +		.bonus_ways = bway,		\
> +		.res_ways = rway,		\
> +		.cache_mode = cmod,		\
> +		.probe_target_ways = ptw,	\
> +		.dis_cap_alloc = dca,		\
> +		.retain_on_pc = rp,		\
> +		.activate_on_init = a,		\
> +	}
> +
>  /**
>   * llcc_slice_desc - Cache slice descriptor
>   * @slice_id: llcc slice id
> @@ -67,6 +107,11 @@ struct llcc_slice_config {
>  	bool activate_on_init;
>  };
>  
> +struct qcom_llcc_config {
> +	const struct llcc_slice_config *sct_data;
> +	int size;
> +};
> +
>  /**
>   * llcc_drv_data - Data associated with the llcc driver
>   * @regmap: regmap associated with the llcc device
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
