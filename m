Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153D426CECA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 00:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgIPWc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 18:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIPWc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 18:32:56 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EDBC06178B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600290959;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=W8UefgK7EFBen7oNbsCDa39lMZ6ptPQC8qj3HR40/NA=;
        b=dTICsgSrPhF3D5PYDfjfH8GsUtnYHBvfly93afak6DBSoT1t3Zp/0OLDLp+HLRXK/R
        jS5t1ZAWznRPExoH02iCLVg8eHT+Th7TranZosOR/t7ECvMVJB07lgl+R/U3yh/jxcPx
        N4juL4ZsTZWMjZECb/8w9TGb0YawVbHvz+WCWoDv7muX3Ymg70Q1IjWd3JL5wUGp7OEU
        QK3o41kpV46W9iVvuGznem/+xlIyzYI/BKvDrO2lk8g8sZOEZqYZSjDaPcuvhgt8IGZt
        3w54ZxsIZuAG2PWTqjJN9ADhZ5Yfrbv1pRHT0yG8+Eyi1JwKkWk51bJiZIebhzN8frVJ
        +WKA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/NBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GLFx3YA
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 23:15:59 +0200 (CEST)
Date:   Wed, 16 Sep 2020 23:15:54 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     shawn.guo@linaro.org, rnayak@codeaurora.org, robh@kernel.org,
        viresh.kumar@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: rpmpd: Add MSM8939 power-domains
Message-ID: <20200916110412.GA25472@gerhold.net>
References: <20200916074924.20637-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916074924.20637-1-jun.nie@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Thanks for sending a v2!

On Wed, Sep 16, 2020 at 03:49:24PM +0800, Jun Nie wrote:
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
> index 8058955fb3b9..ce9b556ac155 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,msm8939-rpmpd
>        - qcom,msm8976-rpmpd
>        - qcom,msm8996-rpmpd
>        - qcom,msm8998-rpmpd
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index f2168e4259b2..829f51881e41 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -220,7 +220,34 @@ static const struct rpmpd_desc qcs404_desc = {
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
> +	.max_state = MSM8939_VDDMX_AO,
> +};

For consistent ordering this block should be also above
/* msm8976 RPM Power Domains */

Also: .max_state still looks wrong to me. It has nothing to do with the
number of power domains (MSM8939_VDDMX_AO). Instead, it is supposed to
be the maximum possible peformance state (in your case: voltage corner).

As far as I know, all SoCs using voltage corners use the same set of
corners, a value from 0-6 for the following corners [1]:

    0. None
    1. Retention
    2. SVS Krait
    3. SVS SoC
    4. Normal/Nominal
    5. Turbo
    6. Super Turbo

(The corners are shifted by one in the msm-3.10 driver...)

Super Turbo (= 6) is the .max_state you want to set here.
That's why I suggested setting .max_state to MAX_8996_RPMPD_STATE (= 6).

In my patch series for MSM8916, I renamed MAX_8996_RPMPD_STATE to
MAX_CORNER_RPMPD_STATE [2]. Maybe that makes it a bit more clear.

Thanks!
Stephan

[1]: https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/include/linux/regulator/rpm-smd-regulator.h?h=LA.BR.1.2.9.1-02310-8x16.0#n31
[2]: https://lore.kernel.org/linux-arm-msm/20200916104135.25085-2-stephan@gerhold.net/
