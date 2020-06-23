Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9F020685E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbgFWX1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387930AbgFWX13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:27:29 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB7AC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:27:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id m2so174871pjv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UD5nWf4U2HadZT0WiGU1zPUMGNoYvHVSdWTqdhPcX6w=;
        b=OJESno1K0RFUZUAD0iwV603z8DFB/Gb+RiDpbJ9MHE1z1MPIsvHTuwh6IDNAlszMo/
         Fee0TYbX65z6jr5kbSjvTkdDX9TfeiUzrdltw2M1scIfQWYe6we/cvgM3fnZFUBV6g43
         E48dE0XXjZnWqkjoulFRUHU5OH2M4rQYhep+hYsfni34PcDMwI1Q//xgiH4oXTz1ILMg
         Tmt1xGnipKEKQ16COgCyZmCC29nN67mJi/xgumoxFWXs/JLF2LAoUEmeUFP2KrI867IK
         Lkq+8plsB07U6cELDpoOV9ejTTU2nnNw9S+caLqy2AZ/1HNBQSb0hXa1JR4LuqzureHa
         Cn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UD5nWf4U2HadZT0WiGU1zPUMGNoYvHVSdWTqdhPcX6w=;
        b=PrUVUw9Jqf8jkFW/sxRE6EqC/cdBhKEi7qWvwyEIBKYz2S6bfntCYYYh6jS1YJ0NUX
         oAHbrETER85Und+BcsHJpXWvNW7f+luTmSDtnO+1CIpDv2ZMWE/itD8+b52BuOGuXoSR
         tkCoYWHyFFj8/JN5X8xJAj86BnB4EmctoNu2l3oSCD8O5MJn5BuIdevsSWVW3fp/pX6D
         ueX333JuEc9D5Ys/qD/zd+FO+k+hdi+UJAuAlK/XvG5RPAnTWoQXEtYGUm7USg++bev2
         GHzPFDb7g17o6k1RgXVJ6zy11qi3GZHS8upDJGmVJN0Kfrsc5DAu7qU/XonCtJo5vHDm
         2jyA==
X-Gm-Message-State: AOAM53311+MHeHtSmsHbE9B1syl063vTB8nArWi9PLJRvW9iHln8FLtC
        8rbYT3u5iSht93Kcuc46Mv1Ngg==
X-Google-Smtp-Source: ABdhPJz5FrEfLNZ76silWBl8aJoDbI5N+5WG/DXvSDWUg8p1NXYcClKy+B5SGFar1Pp346tqzSGOHw==
X-Received: by 2002:a17:90a:2a04:: with SMTP id i4mr25473901pjd.91.1592954847618;
        Tue, 23 Jun 2020 16:27:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d18sm1617294pjz.11.2020.06.23.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:27:27 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:24:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: Move msm8994-smd-rpm contents
 to lg-bullhead.
Message-ID: <20200623232444.GQ128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-12-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-12-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> This was the only device using that dtsi, so no point
> keeping it separate AND with a confusing name (bullhead
> is based on msm8992 and the file contains regulator
> values for that specific board).
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../dts/qcom/msm8992-bullhead-rev-101.dts     | 264 ++++++++++++++++-
>  arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi | 268 ------------------
>  2 files changed, 263 insertions(+), 269 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> index 32670d5afdd6..893fc5b8fc34 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> @@ -47,4 +47,266 @@ ramoops@1ff00000 {
>  	};
>  };
>  
> -#include "msm8994-smd-rpm.dtsi"
> +&smd_rpm {
> +	rpm {
> +		rpm_requests {

Per my request on the earlier regulator patch, please leave
msm8992/msm8994.dtsi without any regulators defined (clocks and rpmpd is
fine) and then add them here to &rpm_requests.o

I.e. pretty much what you're doing here, but remove two indentation
levels and add compatible and labels to these regulators.

Regards,
Bjorn

> +			pm8994-regulators {
> +
> +				vdd_l1-supply = <&pm8994_s1>;
> +				vdd_l2_26_28-supply = <&pm8994_s3>;
> +				vdd_l3_11-supply = <&pm8994_s3>;
> +				vdd_l4_27_31-supply = <&pm8994_s3>;
> +				vdd_l5_7-supply = <&pm8994_s3>;
> +				vdd_l6_12_32-supply = <&pm8994_s5>;
> +				vdd_l8_16_30-supply = <&vreg_vph_pwr>;
> +				vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
> +				vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
> +				vdd_l14_15-supply = <&pm8994_s5>;
> +				vdd_l17_29-supply = <&vreg_vph_pwr>;
> +				vdd_l20_21-supply = <&vreg_vph_pwr>;
> +				vdd_l25-supply = <&pm8994_s5>;
> +				vdd_lvs1_2 = <&pm8994_s4>;
> +
> +				s1 {
> +					regulator-min-microvolt = <800000>;
> +					regulator-max-microvolt = <800000>;
> +				};
> +
> +				s2 {
> +					/* TODO */
> +				};
> +
> +				s3 {
> +					regulator-min-microvolt = <1300000>;
> +					regulator-max-microvolt = <1300000>;
> +				};
> +
> +				s4 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-allow-set-load;
> +					regulator-system-load = <325000>;
> +				};
> +
> +				s5 {
> +					regulator-min-microvolt = <2150000>;
> +					regulator-max-microvolt = <2150000>;
> +				};
> +
> +				s7 {
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +				};
> +
> +				l1 {
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +				};
> +
> +				l2 {
> +					regulator-min-microvolt = <1250000>;
> +					regulator-max-microvolt = <1250000>;
> +				};
> +
> +				l3 {
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				l4 {
> +					regulator-min-microvolt = <1225000>;
> +					regulator-max-microvolt = <1225000>;
> +				};
> +
> +				l5 {
> +					/* TODO */
> +				};
> +
> +				l6 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				l7 {
> +					/* TODO */
> +				};
> +
> +				l8 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				l9 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				l10 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +				};
> +
> +				l11 {
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					qcom,init-voltage = <1200000>;
> +				};
> +
> +				l12 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +					proxy-supply = <&pm8994_l12>;
> +					qcom,proxy-consumer-enable;
> +					qcom,proxy-consumer-current = <10000>;
> +					status = "okay";
> +				};
> +
> +				l13 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <2950000>;
> +					qcom,init-voltage = <2950000>;
> +					status = "okay";
> +				};
> +
> +				l14 {
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					qcom,init-voltage = <1200000>;
> +					proxy-supply = <&pm8994_l14>;
> +					qcom,proxy-consumer-enable;
> +					qcom,proxy-consumer-current = <10000>;
> +					status = "okay";
> +				};
> +
> +				l15 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +					status = "okay";
> +				};
> +
> +				l16 {
> +					regulator-min-microvolt = <2700000>;
> +					regulator-max-microvolt = <2700000>;
> +					qcom,init-voltage = <2700000>;
> +					status = "okay";
> +				};
> +
> +				l17 {
> +					regulator-min-microvolt = <2700000>;
> +					regulator-max-microvolt = <2700000>;
> +					qcom,init-voltage = <2700000>;
> +					status = "okay";
> +				};
> +
> +				l18 {
> +					regulator-min-microvolt = <3000000>;
> +					regulator-max-microvolt = <3000000>;
> +					regulator-always-on;
> +					qcom,init-voltage = <3000000>;
> +					qcom,init-ldo-mode = <1>;
> +				};
> +
> +				l19 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +					status = "okay";
> +				};
> +
> +				l20 {
> +					regulator-min-microvolt = <2950000>;
> +					regulator-max-microvolt = <2950000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +					regulator-allow-set-load;
> +					regulator-system-load = <570000>;
> +				};
> +
> +				l21 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +					qcom,init-voltage = <1800000>;
> +				};
> +
> +				l22 {
> +					regulator-min-microvolt = <3100000>;
> +					regulator-max-microvolt = <3100000>;
> +					qcom,init-voltage = <3100000>;
> +				};
> +
> +				l23 {
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +					qcom,init-voltage = <2800000>;
> +				};
> +
> +				l24 {
> +					regulator-min-microvolt = <3075000>;
> +					regulator-max-microvolt = <3150000>;
> +					qcom,init-voltage = <3075000>;
> +				};
> +
> +				l25 {
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +				};
> +
> +				l26 {
> +					/* TODO: value from downstream
> +					regulator-min-microvolt = <987500>;
> +					fails to apply */
> +				};
> +
> +				l27 {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1050000>;
> +					qcom,init-voltage = <1050000>;
> +				};
> +
> +				l28 {
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					qcom,init-voltage = <1000000>;
> +					proxy-supply = <&pm8994_l28>;
> +					qcom,proxy-consumer-enable;
> +					qcom,proxy-consumer-current = <10000>;
> +				};
> +
> +				l29 {
> +					/* TODO: Unsupported voltage range.
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +					qcom,init-voltage = <2800000>;
> +					*/
> +				};
> +
> +				l30 {
> +					/* TODO: get this verified
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +					*/
> +				};
> +
> +				l31 {
> +					regulator-min-microvolt = <1262500>;
> +					regulator-max-microvolt = <1262500>;
> +					qcom,init-voltage = <1262500>;
> +				};
> +
> +				l32 {
> +					/* TODO: get this verified
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					qcom,init-voltage = <1800000>;
> +					*/
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi b/arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
> deleted file mode 100644
> index 31e3eb6ab515..000000000000
> --- a/arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
> +++ /dev/null
> @@ -1,268 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015, LGE Inc. All rights reserved.
> - * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> - */
> -
> -&smd_rpm {
> -	rpm {
> -		rpm_requests {
> -			pm8994-regulators {
> -
> -				vdd_l1-supply = <&pm8994_s1>;
> -				vdd_l2_26_28-supply = <&pm8994_s3>;
> -				vdd_l3_11-supply = <&pm8994_s3>;
> -				vdd_l4_27_31-supply = <&pm8994_s3>;
> -				vdd_l5_7-supply = <&pm8994_s3>;
> -				vdd_l6_12_32-supply = <&pm8994_s5>;
> -				vdd_l8_16_30-supply = <&vreg_vph_pwr>;
> -				vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
> -				vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
> -				vdd_l14_15-supply = <&pm8994_s5>;
> -				vdd_l17_29-supply = <&vreg_vph_pwr>;
> -				vdd_l20_21-supply = <&vreg_vph_pwr>;
> -				vdd_l25-supply = <&pm8994_s5>;
> -				vdd_lvs1_2 = <&pm8994_s4>;
> -
> -				s1 {
> -					regulator-min-microvolt = <800000>;
> -					regulator-max-microvolt = <800000>;
> -				};
> -
> -				s2 {
> -					/* TODO */
> -				};
> -
> -				s3 {
> -					regulator-min-microvolt = <1300000>;
> -					regulator-max-microvolt = <1300000>;
> -				};
> -
> -				s4 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-allow-set-load;
> -					regulator-system-load = <325000>;
> -				};
> -
> -				s5 {
> -					regulator-min-microvolt = <2150000>;
> -					regulator-max-microvolt = <2150000>;
> -				};
> -
> -				s7 {
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -				};
> -
> -				l1 {
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -				};
> -
> -				l2 {
> -					regulator-min-microvolt = <1250000>;
> -					regulator-max-microvolt = <1250000>;
> -				};
> -
> -				l3 {
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				l4 {
> -					regulator-min-microvolt = <1225000>;
> -					regulator-max-microvolt = <1225000>;
> -				};
> -
> -				l5 {
> -					/* TODO */
> -				};
> -
> -				l6 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				l7 {
> -					/* TODO */
> -				};
> -
> -				l8 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				l9 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				l10 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -				};
> -
> -				l11 {
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					qcom,init-voltage = <1200000>;
> -				};
> -
> -				l12 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -					proxy-supply = <&pm8994_l12>;
> -					qcom,proxy-consumer-enable;
> -					qcom,proxy-consumer-current = <10000>;
> -					status = "okay";
> -				};
> -
> -				l13 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <2950000>;
> -					qcom,init-voltage = <2950000>;
> -					status = "okay";
> -				};
> -
> -				l14 {
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					qcom,init-voltage = <1200000>;
> -					proxy-supply = <&pm8994_l14>;
> -					qcom,proxy-consumer-enable;
> -					qcom,proxy-consumer-current = <10000>;
> -					status = "okay";
> -				};
> -
> -				l15 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -					status = "okay";
> -				};
> -
> -				l16 {
> -					regulator-min-microvolt = <2700000>;
> -					regulator-max-microvolt = <2700000>;
> -					qcom,init-voltage = <2700000>;
> -					status = "okay";
> -				};
> -
> -				l17 {
> -					regulator-min-microvolt = <2700000>;
> -					regulator-max-microvolt = <2700000>;
> -					qcom,init-voltage = <2700000>;
> -					status = "okay";
> -				};
> -
> -				l18 {
> -					regulator-min-microvolt = <3000000>;
> -					regulator-max-microvolt = <3000000>;
> -					regulator-always-on;
> -					qcom,init-voltage = <3000000>;
> -					qcom,init-ldo-mode = <1>;
> -				};
> -
> -				l19 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -					status = "okay";
> -				};
> -
> -				l20 {
> -					regulator-min-microvolt = <2950000>;
> -					regulator-max-microvolt = <2950000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -					regulator-allow-set-load;
> -					regulator-system-load = <570000>;
> -				};
> -
> -				l21 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -					qcom,init-voltage = <1800000>;
> -				};
> -
> -				l22 {
> -					regulator-min-microvolt = <3100000>;
> -					regulator-max-microvolt = <3100000>;
> -					qcom,init-voltage = <3100000>;
> -				};
> -
> -				l23 {
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -					qcom,init-voltage = <2800000>;
> -				};
> -
> -				l24 {
> -					regulator-min-microvolt = <3075000>;
> -					regulator-max-microvolt = <3150000>;
> -					qcom,init-voltage = <3075000>;
> -				};
> -
> -				l25 {
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -				};
> -
> -				l26 {
> -					/* TODO: value from downstream
> -					regulator-min-microvolt = <987500>;
> -					fails to apply */
> -				};
> -
> -				l27 {
> -					regulator-min-microvolt = <1050000>;
> -					regulator-max-microvolt = <1050000>;
> -					qcom,init-voltage = <1050000>;
> -				};
> -
> -				l28 {
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					qcom,init-voltage = <1000000>;
> -					proxy-supply = <&pm8994_l28>;
> -					qcom,proxy-consumer-enable;
> -					qcom,proxy-consumer-current = <10000>;
> -				};
> -
> -				l29 {
> -					/* TODO: Unsupported voltage range.
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -					qcom,init-voltage = <2800000>;
> -					*/
> -				};
> -
> -				l30 {
> -					/* TODO: get this verified
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -					*/
> -				};
> -
> -				l31 {
> -					regulator-min-microvolt = <1262500>;
> -					regulator-max-microvolt = <1262500>;
> -					qcom,init-voltage = <1262500>;
> -				};
> -
> -				l32 {
> -					/* TODO: get this verified
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					qcom,init-voltage = <1800000>;
> -					*/
> -				};
> -			};
> -		};
> -	};
> -};
> -- 
> 2.27.0
> 
