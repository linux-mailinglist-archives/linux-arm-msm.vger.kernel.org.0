Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F3D258168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 20:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgHaSzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 14:55:36 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:18397 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgHaSzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 14:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598900133;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=UnAkkCJ9cjFfZB7GHe+UL/xUWbUVhNHfqyxCIM5xZY8=;
        b=R1JKrcjvrox9NGFY8Ol4Uz4aCH7if8aBkalLepGwf6UKjRBd97MKNgA7GbZTvHo7o6
        aXN0Wnw8YKPGG+/RLNChkZgNTUarxx0s6O3Pvc2vkKasFEBuceh+Eg36H9ZFHTMbBMc8
        b1JJZg5FC+HUClDTTgTTo/TtlMYLiIFb8AyG6Iqp+PI1c8lTJcWAY8Xx5+s5MXNOIQ9U
        2xhaXtKpSQmxmT/rFgSD8+kCltF6kwbT9H5UhAzwQreuhaG8Ssuv0mH7geoovi+qKOs+
        gyu93Tmg9/aHED9YweOV6gQmlM2EfxiMtWmKPpVEPUI6y+4ZbkhXSpVJ33IEHFFBV5dJ
        HFXw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEIdhPgVC7iy9yGr7ESbX"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7VItXFjC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 31 Aug 2020 20:55:33 +0200 (CEST)
Date:   Mon, 31 Aug 2020 20:55:27 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     shawn.guo@linaro.org, rnayak@codeaurora.org, robh@kernel.org,
        viresh.kumar@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: rpmpd: Add MSM8939 power-domains
Message-ID: <20200831185527.GA1510@gerhold.net>
References: <20200831083452.32261-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831083452.32261-1-jun.nie@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jun,

On Mon, Aug 31, 2020 at 04:34:52PM +0800, Jun Nie wrote:
> Add the shared modemcx/cx/mx power-domains found on MSM8939.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 27 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        | 10 +++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8058955fb3b9..6051d6d3bf0e 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -20,6 +20,7 @@ properties:
>        - qcom,msm8996-rpmpd
>        - qcom,msm8998-rpmpd
>        - qcom,qcs404-rpmpd
> +      - qcom,msm8939-rpmpd
>        - qcom,sc7180-rpmhpd
>        - qcom,sdm845-rpmhpd
>        - qcom,sm8150-rpmhpd

This is sorted alphabetically at the moment.
We should probably keep it that way. :)

> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index f2168e4259b2..7ae91df9a5ba 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -220,11 +220,38 @@ static const struct rpmpd_desc qcs404_desc = {
>  	.max_state = RPM_SMD_LEVEL_BINNING,
>  };
>  
> +/* msm8939 RPM Power Domains */
> +DEFINE_RPMPD_PAIR(msm8939, vddmd, vddmd_ao, SMPA, CORNER, 1);
> +DEFINE_RPMPD_VFC(msm8939, vddmd_vfc, SMPA, 1);
> +
> +DEFINE_RPMPD_PAIR(msm8939, vddcx, vddcx_ao, SMPA, CORNER, 2);
> +DEFINE_RPMPD_VFC(msm8939, vddcx_vfc, SMPA, 2);
> +
> +DEFINE_RPMPD_PAIR(msm8939, vddmx, vddmx_ao, LDOA, CORNER, 3);
> +
> +static struct rpmpd *msm8939_rpmpds[] = {
> +	[MSM8939_VDDMDCX] =	&msm8939_vddmd,
> +	[MSM8939_VDDMDCX_AO] =	&msm8939_vddmd_ao,
> +	[MSM8939_VDDMDCX_VFC] =	&msm8939_vddmd_vfc,
> +	[MSM8939_VDDCX] =	&msm8939_vddcx,
> +	[MSM8939_VDDCX_AO] =	&msm8939_vddcx_ao,
> +	[MSM8939_VDDCX_VFC] =	&msm8939_vddcx_vfc,
> +	[MSM8939_VDDMX] =	&msm8939_vddmx,
> +	[MSM8939_VDDMX_AO] =	&msm8939_vddmx_ao,
> +};
> +
> +static const struct rpmpd_desc msm8939_desc = {
> +	.rpmpds = msm8939_rpmpds,
> +	.num_pds = ARRAY_SIZE(msm8939_rpmpds),
> +	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,

MSM8939 seems to be still using corners instead of levels,
so shouldn't you have max state = MAX_8996_RPMPD_STATE (= 6)?

> +};
> +
>  static const struct of_device_id rpmpd_match_table[] = {
>  	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
>  	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
>  	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
>  	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
> +	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },

Would be good to keep this alphabetically ordered as well.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, rpmpd_match_table);
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index dc146e44228b..4eb5d288e641 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -101,6 +101,16 @@
>  #define QCS404_LPIMX		5
>  #define QCS404_LPIMX_VFL	6
>  
> +/* MSM8939 Power Domains */
> +#define MSM8939_VDDMDCX		0
> +#define MSM8939_VDDMDCX_AO	1
> +#define MSM8939_VDDMDCX_VFC	2
> +#define MSM8939_VDDCX		3
> +#define MSM8939_VDDCX_AO	4
> +#define MSM8939_VDDCX_VFC	5
> +#define MSM8939_VDDMX		6
> +#define MSM8939_VDDMX_AO	7
> +

... and these defines above MSM8976.

Thanks!
Stephan

>  /* RPM SMD Power Domain performance levels */
>  #define RPM_SMD_LEVEL_RETENTION       16
>  #define RPM_SMD_LEVEL_RETENTION_PLUS  32
> -- 
> 2.17.1
> 
