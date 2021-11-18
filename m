Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD46456489
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 21:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhKRU4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 15:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhKRU4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 15:56:35 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D99C061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 12:53:35 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bf8so17040102oib.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BSO/JJojc1oQqdqKSBcUWRtsOGWvGZNo7fh8qXiGMMo=;
        b=HCpLUdOPbcIEk7DnsmaNVMRmHf1HpJHNeXeYINQWLqs+W2WH9bx8srdfUT8h8oTv1+
         79qPWIohPu1Okrg3q5g9LrP7r7M+T3Rzatz5lWN6vkL+xPVH8NRb2MwihLK7H4igKRe/
         j/HxOK6Iz2E3HtK4H3ttQwmIHNsX3xf587AqBrabvgEW7xcn9O5w8Q4oQrxmnrFFGv+i
         HYPge3PrO83qNN6jH/9Pbktb+98iDHdyB9+1/FS8grNrzyPAMrzkydi0Pt9Eucqpfr36
         0Fdl7CZX8yF/IGMKC6SuQoA7rbjhybSpUhdrAI4KAy2z2fZfW9d2Gn5igf5uOqilr4U3
         j4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BSO/JJojc1oQqdqKSBcUWRtsOGWvGZNo7fh8qXiGMMo=;
        b=v0eENRwImy2FGqwYRgerwvIYhWQiJLkEfOCeVo31KZKXw6UDINk7lUjsf2z9XRp18H
         MDH3S+WaEsILPSphbjDGuKvzMk16B7nQqBQLFtdiiM+ovtSmKUqQGomDiz7CdSbplLNn
         ifN6cHArbrJMxniqX2OzehW/k2XdYp++opOhGmkPJqtOiLgyi4K1YOmv3QoE5iIg9axk
         sGRGNk56SqnInzLvAuY7t2CQFgAv9YBIeODA0t3gznHVbzmXs1WeQvPdSMmC8QHQQDRJ
         lpc2Z70wNEF64g4FhZZSkh0DZQZquqPO1BZvp48K+vESZsb8Q78e8dCBZ6Xc17aTt/j/
         ybYg==
X-Gm-Message-State: AOAM532ZxmmbXCWL5cOZqordd+SPj8u7IpQr9xX3+pReK5hyWKAjdHY6
        1D0vOd5s/8hEVW7LsqoFNzTXaQ==
X-Google-Smtp-Source: ABdhPJzb7SFNUfFOr4Kd5icHu+hRrmqXpRDmJAyHJ5H21ENhkc+rxIXiOJFuKZm301Vg6GxH33eR/A==
X-Received: by 2002:a05:6808:171c:: with SMTP id bc28mr10636184oib.18.1637268814457;
        Thu, 18 Nov 2021 12:53:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i16sm182363oig.15.2021.11.18.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 12:53:33 -0800 (PST)
Date:   Thu, 18 Nov 2021 14:53:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>, georgi.djakov@linaro.org
Cc:     evgreen@google.com, Andy Gross <agross@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        mdtipton@codeaurora.org, sibis@codeaurora.org,
        saravanak@google.com, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [v8 2/3] interconnect: qcom: Add EPSS L3 support on SC7280
Message-ID: <YZa9SStiYqfp6f7a@builder.lan>
References: <1634812857-10676-1-git-send-email-okukatla@codeaurora.org>
 <1634812857-10676-3-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634812857-10676-3-git-send-email-okukatla@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Oct 05:40 CDT 2021, Odelu Kukatla wrote:

> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> SC7280 SoCs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Georgi, do you intend to apply the two interconnect patches in this
series?

Regards,
Bjorn

> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  drivers/interconnect/qcom/osm-l3.c | 20 +++++++++++++++++++-
>  drivers/interconnect/qcom/sc7280.h |  2 ++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
> index c7af143..eec1309 100644
> --- a/drivers/interconnect/qcom/osm-l3.c
> +++ b/drivers/interconnect/qcom/osm-l3.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/bitfield.h>
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  
>  #include "sc7180.h"
> +#include "sc7280.h"
>  #include "sc8180x.h"
>  #include "sdm845.h"
>  #include "sm8150.h"
> @@ -114,6 +115,22 @@ static const struct qcom_osm_l3_desc sc7180_icc_osm_l3 = {
>  	.reg_perf_state = OSM_REG_PERF_STATE,
>  };
>  
> +DEFINE_QNODE(sc7280_epss_apps_l3, SC7280_MASTER_EPSS_L3_APPS, 32, SC7280_SLAVE_EPSS_L3);
> +DEFINE_QNODE(sc7280_epss_l3, SC7280_SLAVE_EPSS_L3, 32);
> +
> +static const struct qcom_osm_l3_node *sc7280_epss_l3_nodes[] = {
> +	[MASTER_EPSS_L3_APPS] = &sc7280_epss_apps_l3,
> +	[SLAVE_EPSS_L3_SHARED] = &sc7280_epss_l3,
> +};
> +
> +static const struct qcom_osm_l3_desc sc7280_icc_epss_l3 = {
> +	.nodes = sc7280_epss_l3_nodes,
> +	.num_nodes = ARRAY_SIZE(sc7280_epss_l3_nodes),
> +	.lut_row_size = EPSS_LUT_ROW_SIZE,
> +	.reg_freq_lut = EPSS_REG_FREQ_LUT,
> +	.reg_perf_state = EPSS_REG_PERF_STATE,
> +};
> +
>  DEFINE_QNODE(sc8180x_osm_apps_l3, SC8180X_MASTER_OSM_L3_APPS, 32, SC8180X_SLAVE_OSM_L3);
>  DEFINE_QNODE(sc8180x_osm_l3, SC8180X_SLAVE_OSM_L3, 32);
>  
> @@ -326,6 +343,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id osm_l3_of_match[] = {
>  	{ .compatible = "qcom,sc7180-osm-l3", .data = &sc7180_icc_osm_l3 },
> +	{ .compatible = "qcom,sc7280-epss-l3", .data = &sc7280_icc_epss_l3 },
>  	{ .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_icc_osm_l3 },
>  	{ .compatible = "qcom,sm8150-osm-l3", .data = &sm8150_icc_osm_l3 },
>  	{ .compatible = "qcom,sc8180x-osm-l3", .data = &sc8180x_icc_osm_l3 },
> diff --git a/drivers/interconnect/qcom/sc7280.h b/drivers/interconnect/qcom/sc7280.h
> index 175e400..1fb9839 100644
> --- a/drivers/interconnect/qcom/sc7280.h
> +++ b/drivers/interconnect/qcom/sc7280.h
> @@ -150,5 +150,7 @@
>  #define SC7280_SLAVE_PCIE_1			139
>  #define SC7280_SLAVE_QDSS_STM			140
>  #define SC7280_SLAVE_TCU			141
> +#define SC7280_MASTER_EPSS_L3_APPS		142
> +#define SC7280_SLAVE_EPSS_L3			143
>  
>  #endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
