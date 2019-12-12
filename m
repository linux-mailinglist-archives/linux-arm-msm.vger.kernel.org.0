Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F1711C68C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 08:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbfLLHjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 02:39:22 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43638 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbfLLHjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 02:39:22 -0500
Received: by mail-pf1-f194.google.com with SMTP id h14so293401pfe.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 23:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qo4K50LzAN2stnSI10i/xMxtvvEyKR1cSWIWv7pZkAY=;
        b=QTHWe33GqVF+OXqosfCsmbjOnSeJdTu2Ok3v6PGMePJB7YQAsSH2vM9oXU47Iacc1K
         VZ40OB8Jw7epK4xlR0cKDWXRT0MD9vBIZKU0ozV7lJqKRLWkpGu4x5biCxa24CJLzMmm
         Af7H8zLmJguvauWsRE29SjWjC5xmgY0NvyLTypZP3UJ1/9kE6vA/tbijX1IuYbahDU9J
         xLBhl1dQKQbMhG8lIuM1si7Kps/Ur5BXRPI9FyLQDkAymILFAXY8QqmTIY+U3sCCLRa4
         rctivrQJNKlfawkqEDrFRlwXUfcMVLkbnX5GDlhYhfRbdN+Uk7EHa/G7Te1q80lDa28D
         /Mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qo4K50LzAN2stnSI10i/xMxtvvEyKR1cSWIWv7pZkAY=;
        b=igd13n/iMvzC5lAY71v/ijM3rOzyzYOuv5ieNRn9YQdN5zTgrXey831z3NSKKuNN3c
         o401gNYdcZc6JsP2zraWoC0jTtYLIx05jPX+ZEYTZF94GRNNLsL7zN9X5ri71M69MMXb
         46hgDAEJ0PjTBgirzCEV/ajoOxUy7irjI6J7NB5o2ogxtqbqqzjDVov4qqMdEVLKs2nn
         Cl8IrB/tES2b+iM7gEa6FzjddLRb3A9vjJYXxaruu0VBF9u3tToer6bevzoKY2Q+d1pz
         VVgJGeCvJT8XoPG1Ez/6VbV3ThNtAVRO1aaYAU7qi1QyU41LRP2PDgGGHwcwWMksSwhB
         hFwg==
X-Gm-Message-State: APjAAAWOKTz/KNdLCyoE0zKFhDaVS1vUyFAwTqaAKiOI2nuPptYpXVeS
        gWsbgYUOmHrpaaigEfYDloRZ4Q==
X-Google-Smtp-Source: APXvYqyWrtLsL3y0QsBXtvnDvJ4rPvhnI90XbGOmcWEW32DAzZHdT8obP0vpz4JmOvrIUfBy6uGEPQ==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr8587016pgf.2.1576136361275;
        Wed, 11 Dec 2019 23:39:21 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g17sm5962032pfb.180.2019.12.11.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:39:20 -0800 (PST)
Date:   Wed, 11 Dec 2019 23:39:18 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 6/6] arm64: dts: sm8150: Add rpmh power-domain node
Message-ID: <20191212073918.GO3143381@builder>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99eab9-35efa01f-8ed3-4a77-87e1-09c381173121-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f99eab9-35efa01f-8ed3-4a77-87e1-09c381173121-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:

> Add the DT node for the rpmhpd power controller.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Series applied, please send separate patch for the yaml migration.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 55 ++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 8f23fcadecb89..0ac257637c2af 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  
> @@ -469,6 +470,60 @@
>  				clock-names = "xo";
>  				clocks = <&xo_board>;
>  			};
> +
> +			rpmhpd: power-controller {
> +				compatible = "qcom,sm8150-rpmhpd";
> +				#power-domain-cells = <1>;
> +				operating-points-v2 = <&rpmhpd_opp_table>;
> +
> +				rpmhpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					rpmhpd_opp_ret: opp1 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +					};
> +
> +					rpmhpd_opp_min_svs: opp2 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs: opp4 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs_l1: opp5 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_svs_l2: opp6 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					};
> +
> +					rpmhpd_opp_nom: opp7 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					};
> +
> +					rpmhpd_opp_nom_l1: opp8 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					};
> +
> +					rpmhpd_opp_nom_l2: opp9 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +					};
> +
> +					rpmhpd_opp_turbo: opp10 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					};
> +
> +					rpmhpd_opp_turbo_l1: opp11 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					};
> +				};
> +			};
>  		};
>  	};
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
