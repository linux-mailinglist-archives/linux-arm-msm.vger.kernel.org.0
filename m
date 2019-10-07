Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA29CDBA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 07:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGFx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 01:53:27 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39799 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGFx1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 01:53:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id e1so7511718pgj.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2019 22:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bsTD3Si+lRJlyfjAbCj2dgEKgrlx47n6A/2JYKP1JW8=;
        b=q/Pt5uy2YBhfTqk5L+zeLL9XLvdR7iyRA4GK3oW28lGfnLmTiF6iKdQ0x/SVQuyOq7
         CdKuDvtzAlgg1phy/mjAazwrrxu0QOgoF2IRyDp/KrZjQbGjiqBWHKRNZdcAK2SjQ9vB
         spjGtkHtE1nKZqM9Jw14tlJkZdGLJiYCBVYQ2/GHmx199XOhcriPL8DWy1LkUvpKfSsw
         ZArrlZFXsFp1BIPLKgYlYE45OXutnhxqptUtcuoiMpeeWfZxYHwHCVdS+SfZqgDJa3t6
         Ds4FRpM3GoSX8/H0so7xbLTIeFASCX9NBiZxkA269J8EsyP27V54HnohBSa1h4Ut2ViG
         5pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bsTD3Si+lRJlyfjAbCj2dgEKgrlx47n6A/2JYKP1JW8=;
        b=Ab+kZLvkplQ7c7z820hszVJry/5ddFv1DC9vPjl/OwwF8IRvPnN/LsDiUUdZ7mvQlL
         vx4S+V6zrFReDz52i+QZ+Q+5CYVTxVeCMphZA4rU3TK0vQcpovzf9OOTPigkqzSTvYMA
         4CWD711idDExyLrDkrZv4EuQRHErRPtv4LVK0bTAmu8Gb+qYeozTZstYvFzUto4ciq8R
         RAVt7LP57ZIYXUj2SFH7AzskUO2467l62nDGJE8RUUHfSjOHiCFZY9Dozh0Hy+tJhx++
         t2ltR9/8zFDITZBqFdfzAm/AKJcymMWCOmIBas/IRwYTMpHA4Rl1JgfT/0ieCoCyFAZA
         X0LQ==
X-Gm-Message-State: APjAAAX42HRykKjzJpe4yvQyfbx/Ya3ZXCGLQ0jq6GdNVxoeU3s8GNVn
        HUEuAR7EgWmfMC+QO7vHATlRBQ==
X-Google-Smtp-Source: APXvYqzvkTJi+RBgercTr6zzyZQdj6vtvtH1ZUWqYyXy0HJEq02D1FlR2EILBRyzRVhc9cdQRBhB5w==
X-Received: by 2002:a17:90a:22b0:: with SMTP id s45mr31448581pjc.22.1570427606519;
        Sun, 06 Oct 2019 22:53:26 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x23sm11892213pfq.140.2019.10.06.22.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 22:53:25 -0700 (PDT)
Date:   Sun, 6 Oct 2019 22:53:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH] soc: qcom: rpmpd: Add rpm power domains for msm8976
Message-ID: <20191007055323.GI6390@tuxbook-pro>
References: <20191005110758.31548-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005110758.31548-1-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 05 Oct 04:07 PDT 2019, kholk11@gmail.com wrote:

> From: "AngeloGioacchino Del Regno" <kholk11@gmail.com>
> 
> The MSM8956/76 SoCs have two main voltage-level power domains, VDD_CX
> and VDD_MX, which also have their own voltage-floor-level (VFL)
> corner.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---

Thanks for respinning the patch. Please don't forget the "v2" in the
subject and list your changes here.

Applied.

Thanks,
Bjorn

>  .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 23 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> index eb35b22f9e23..bc75bf49cdae 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -5,6 +5,7 @@ which then translates it into a corresponding voltage on a rail
>  
>  Required Properties:
>   - compatible: Should be one of the following
> +	* qcom,msm8976-rpmpd: RPM Power domain for the msm8976 family of SoC
>  	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
>  	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
>  	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 3c1a55cf25d6..2b1834c5609a 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -115,6 +115,28 @@ struct rpmpd_desc {
>  
>  static DEFINE_MUTEX(rpmpd_lock);
>  
> +/* msm8976 RPM Power Domains */
> +DEFINE_RPMPD_PAIR(msm8976, vddcx, vddcx_ao, SMPA, LEVEL, 2);
> +DEFINE_RPMPD_PAIR(msm8976, vddmx, vddmx_ao, SMPA, LEVEL, 6);
> +
> +DEFINE_RPMPD_VFL(msm8976, vddcx_vfl, RWSC, 2);
> +DEFINE_RPMPD_VFL(msm8976, vddmx_vfl, RWSM, 6);
> +
> +static struct rpmpd *msm8976_rpmpds[] = {
> +	[MSM8976_VDDCX] =	&msm8976_vddcx,
> +	[MSM8976_VDDCX_AO] =	&msm8976_vddcx_ao,
> +	[MSM8976_VDDCX_VFL] =	&msm8976_vddcx_vfl,
> +	[MSM8976_VDDMX] =	&msm8976_vddmx,
> +	[MSM8976_VDDMX_AO] =	&msm8976_vddmx_ao,
> +	[MSM8976_VDDMX_VFL] =	&msm8976_vddmx_vfl,
> +};
> +
> +static const struct rpmpd_desc msm8976_desc = {
> +	.rpmpds = msm8976_rpmpds,
> +	.num_pds = ARRAY_SIZE(msm8976_rpmpds),
> +	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,
> +};
> +
>  /* msm8996 RPM Power domains */
>  DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
>  DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
> @@ -198,6 +220,7 @@ static const struct rpmpd_desc qcs404_desc = {
>  };
>  
>  static const struct of_device_id rpmpd_match_table[] = {
> +	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
>  	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
>  	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
>  	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 93e36d011527..83f8f5a8773b 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -27,6 +27,14 @@
>  #define RPMH_REGULATOR_LEVEL_TURBO	384
>  #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
>  
> +/* MSM8976 Power Domain Indexes */
> +#define MSM8976_VDDCX		0
> +#define MSM8976_VDDCX_AO	1
> +#define MSM8976_VDDCX_VFL	2
> +#define MSM8976_VDDMX		3
> +#define MSM8976_VDDMX_AO	4
> +#define MSM8976_VDDMX_VFL	5
> +
>  /* MSM8996 Power Domain Indexes */
>  #define MSM8996_VDDCX		0
>  #define MSM8996_VDDCX_AO	1
> -- 
> 2.21.0
> 
