Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2160F32F397
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhCETMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:12:21 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:34960 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhCETMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:12:15 -0500
Received: by mail-ot1-f49.google.com with SMTP id r19so2859332otk.2;
        Fri, 05 Mar 2021 11:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hh1lgm+3X+xcZoIbWmctCaInPlm9cGat4sZJtILyV4E=;
        b=O6IV5ly/PRO3aSS5GnG1vM/1Eh6RYs23K75bFRdyxyFu+hJP7+2ziyfw0Wtw0IkqW6
         bDlIBR9bs06X23Lfvrkt6ovptC8zyMr//v6ri9dw74QSnXsoHv0XPTS0taxMtVgUxU1b
         Ef4k7O7hcgf3kBWCEgz4rolI/YjCvJWYYgF2XsTXcPJ2t08C3JFnOBHA4KEswL5/bilO
         Fwfou+FwThcB+HGqD2TG0/AbZ0tdsrvJqf8gTtaOMD4s1JmgpHitD68hy9uWeo2zXPDE
         e29nMrRZZPSb+Hg9Oymi+Og5b4XPIcdw0OMugGiPu1AL6q/3HMdkWwO8MsaA7z6y8Ppn
         IdzQ==
X-Gm-Message-State: AOAM531JHN/lsmFeqkCQttDP675rWEbS8vr0We3o4xlUt9hzS+df5Xjf
        iga+pzPxXu8MeM7UyayCtw==
X-Google-Smtp-Source: ABdhPJw9BOxLYJaN/x1BquaNXXo2E55iCwbUiwzmzcGnUMkWGT4uVBRTxUi6M+fWbolN0xnF9GZHjg==
X-Received: by 2002:a05:6830:60d:: with SMTP id w13mr9457501oti.257.1614971535189;
        Fri, 05 Mar 2021 11:12:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f197sm766722oob.38.2021.03.05.11.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 11:12:14 -0800 (PST)
Received: (nullmailer pid 492269 invoked by uid 1000);
        Fri, 05 Mar 2021 19:12:13 -0000
Date:   Fri, 5 Mar 2021 13:12:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: rpmhpd: Add SM8350 power domains
Message-ID: <20210305191213.GA491047@robh.at.kernel.org>
References: <20210210104257.339462-1-vkoul@kernel.org>
 <20210210104257.339462-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210104257.339462-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 10, 2021 at 04:12:57PM +0530, Vinod Koul wrote:
> This adds the power domains found in SM8350 SoC.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soc/qcom/rpmhpd.c              | 37 ++++++++++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h | 15 +++++++++++

The header is part of the binding and goes in the binding patch, but 
don't respin just for that.

>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 7ce06356d24c..1bd191d5824f 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -200,6 +200,42 @@ static const struct rpmhpd_desc sm8250_desc = {
>  	.num_pds = ARRAY_SIZE(sm8250_rpmhpds),
>  };
>  
> +/* SM8350 Power domains */
> +static struct rpmhpd sm8350_mxc_ao;
> +static struct rpmhpd sm8350_mxc = {
> +	.pd = { .name = "mxc", },
> +	.peer = &sm8150_mmcx_ao,
> +	.res_name = "mxc.lvl",
> +};
> +
> +static struct rpmhpd sm8350_mxc_ao = {
> +	.pd = { .name = "mxc_ao", },
> +	.active_only = true,
> +	.peer = &sm8350_mxc,
> +	.res_name = "mxc.lvl",
> +};
> +
> +static struct rpmhpd *sm8350_rpmhpds[] = {
> +	[SM8350_CX] = &sdm845_cx,
> +	[SM8350_CX_AO] = &sdm845_cx_ao,
> +	[SM8350_EBI] = &sdm845_ebi,
> +	[SM8350_GFX] = &sdm845_gfx,
> +	[SM8350_LCX] = &sdm845_lcx,
> +	[SM8350_LMX] = &sdm845_lmx,
> +	[SM8350_MMCX] = &sm8150_mmcx,
> +	[SM8350_MMCX_AO] = &sm8150_mmcx_ao,
> +	[SM8350_MX] = &sdm845_mx,
> +	[SM8350_MX_AO] = &sdm845_mx_ao,
> +	[SM8350_MXC] = &sm8350_mxc,
> +	[SM8350_MXC_AO] = &sm8350_mxc_ao,
> +	[SM8350_MSS] = &sdm845_mss,
> +};
> +
> +static const struct rpmhpd_desc sm8350_desc = {
> +	.rpmhpds = sm8350_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sm8350_rpmhpds),
> +};
> +
>  /* SC7180 RPMH powerdomains */
>  static struct rpmhpd *sc7180_rpmhpds[] = {
>  	[SC7180_CX] = &sdm845_cx,
> @@ -223,6 +259,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
>  	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
>  	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
>  	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
> +	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, rpmhpd_match_table);
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 7714487ac76b..64043a2a4411 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -45,6 +45,21 @@
>  #define SM8250_MX	8
>  #define SM8250_MX_AO	9
>  
> +/* SM8350 Power Domain Indexes */
> +#define SM8350_CX	0
> +#define SM8350_CX_AO	1
> +#define SM8350_EBI	2
> +#define SM8350_GFX	3
> +#define SM8350_LCX	4
> +#define SM8350_LMX	5
> +#define SM8350_MMCX	6
> +#define SM8350_MMCX_AO	7
> +#define SM8350_MX	8
> +#define SM8350_MX_AO	9
> +#define SM8350_MXC	10
> +#define SM8350_MXC_AO	11
> +#define SM8350_MSS	12
> +
>  /* SC7180 Power Domain Indexes */
>  #define SC7180_CX	0
>  #define SC7180_CX_AO	1
> -- 
> 2.26.2
> 
