Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AED5A33E213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 00:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCPX0o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 19:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhCPX0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 19:26:30 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D0CC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 16:26:19 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so333909pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w5QajIxS6y5Fi0iTPRAGrD8S6mOwAPT15FoB2waGPFM=;
        b=FzPs1avgRjsFZ3d35srKz+eBOPtuhZPWPiqY8vX4CiI+UonDB4LwUENMF1EWSIYIOS
         57SgIkt4SgO4qJ5h+GZBUaY/AWZld2KW49mvMOi5iTScTH9ojaR4ieyLJIgbJLatef46
         zCepIuqzZRDAbX/HbgGNRErpChZRZ8jjiDmC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5QajIxS6y5Fi0iTPRAGrD8S6mOwAPT15FoB2waGPFM=;
        b=Kah7Ks/CGbltWXewFAR+WIaLsm3UUkLpRrW4SzjLuT/YVZ1DyZs/wKWEK7Gx6pMaNy
         CH85EgBeyOgUDgyzf/WTl6uNOPJk8NvuG2dBf5xvRavewmqyMWcISCDstEicIkRG65sD
         tHu0BOV2/GWXz20lqwLWcmwfKYuX4N02yLGc59j01VutXVR3akuvJFHIHT9Fz2VI+wG6
         DY6GXwaGTkKT3nD2Y8VWfoJYyV2KzcaozIrAyOlUd83NaXbDEbSVn6iVpt41yciVVcLu
         ClIv4n89as1TV7MrRDvqHZg359rG9D3MPtEo3JN2TZfyIufgf1jKmJSOFPTXY8XBT9fR
         ffAQ==
X-Gm-Message-State: AOAM531inO28p+aPYevD+ulsmt4Nx3OEpmKguG2wPV6M9zEWtAO8iZy1
        0/usDZAGQbegtKPM6XCX+x8TyA==
X-Google-Smtp-Source: ABdhPJzA1Ew/ucDvRg38/OJGbarhjjqP83rSwho6aOC3HYRd5w679AuzfHyi8xZpQhflL2/8N0zgFA==
X-Received: by 2002:a17:90a:b63:: with SMTP id 90mr1424994pjq.124.1615937179059;
        Tue, 16 Mar 2021 16:26:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:b471:7d:bf21:d7dd])
        by smtp.gmail.com with UTF8SMTPSA id v7sm17515668pfv.93.2021.03.16.16.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 16:26:18 -0700 (PDT)
Date:   Tue, 16 Mar 2021 16:26:16 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: sc7280: Add RPMh regulators for
 sc7280-idp
Message-ID: <YFE+mC0dP0atFA8A@google.com>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
 <1615816454-1733-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615816454-1733-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 15, 2021 at 07:24:12PM +0530, satya priya wrote:
> Add regulator devices for SC7280 as RPMh regulators. This ensures
> that consumers are able to modify the physical state of PMIC
> regulators.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Corrected the indentation for "compatible" and "qcom,pmic-id" under
>    pm8350c-regulators as per Konrad's comment.
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 212 ++++++++++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 428f863..78effe5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -22,6 +22,218 @@
>  	};
>  };
>  
> +&apps_rsc {
> +	pm7325-regulators {
> +		compatible = "qcom,pm7325-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vreg_s1b_1p8: smps1 {
> +			regulator-min-microvolt = <1856000>;

For most LDOs their 'Active minimum voltage' is specified as their
minimum, however for S1B and S8B it's the 'Nominal voltage. Is that
intentional?

There might be a misunderstanding on my side what the values in the
datasheet actually mean, see my comment at the end.

> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_s7b_0p9: smps7 {
> +			regulator-min-microvolt = <535000>;

According to the datasheet the minimum voltage of the S7B regulator
is 904 mV.

> +			regulator-max-microvolt = <1120000>;
> +		};
> +
> +		vreg_s8b_1p2: smps8 {
> +			regulator-min-microvolt = <1256000>;
> +			regulator-max-microvolt = <1500000>;
> +		};
> +
> +		vreg_l1b_0p8: ldo1 {
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <925000>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +		};

Another question that came up for sc7180-trogdor regulators,
whose core regulator config was derived from sc7180-idp: the
label suggests that this regulator is supposed to supply 3V,
however the range spans from 2.7 to 3.54V. Shouldn't it be
narrower around 3V? Same for other some regulators.

> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-min-microvolt = <1140000>;

The datasheet says the minimum for L6B is 1.2V.

> +			regulator-max-microvolt = <1260000>;
> +		};
> +
> +		vreg_l7b_2p9: ldo7 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +		};

This regulator has a fixed voltage in difference to the others, why
is that?

> +
> +		vreg_l8b_0p9: ldo8 {
> +			regulator-min-microvolt = <870000>;
> +			regulator-max-microvolt = <970000>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +
> +		vreg_l11b_1p7: ldo11 {
> +			regulator-min-microvolt = <1504000>;

The datasheet says the mininum voltage for L11B is 1.776V.

> +			regulator-max-microvolt = <2000000>;
> +		};
> +
> +		vreg_l12b_0p8: ldo12 {
> +			regulator-min-microvolt = <751000>;
> +			regulator-max-microvolt = <824000>;
> +		};
> +
> +		vreg_l13b_0p8: ldo13 {
> +			regulator-min-microvolt = <530000>;
> +			regulator-max-microvolt = <824000>;

The max for L13B is 880mV, is this a copy and paste from L12B?

> +		};
> +
> +		vreg_l14b_1p2: ldo14 {
> +			regulator-min-microvolt = <1080000>;

The datasheet says the mininum voltage for L14B is 1.2V.

> +			regulator-max-microvolt = <1304000>;
> +		};
> +
> +		vreg_l15b_0p8: ldo15 {
> +			regulator-min-microvolt = <765000>;
> +			regulator-max-microvolt = <1020000>;
> +		};
> +
> +		vreg_l16b_1p2: ldo16 {
> +			regulator-min-microvolt = <1100000>;

The datasheet says the mininum voltage for L16B is 1.2V.

> +			regulator-max-microvolt = <1300000>;
> +		};
> +
> +		vreg_l17b_1p8: ldo17 {
> +			regulator-min-microvolt = <1700000>;

The datasheet says the mininum voltage for L17B is 1.8V.

> +			regulator-max-microvolt = <1900000>;
> +		};
> +
> +		vreg_l18b_1p8: ldo18 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +		};
> +
> +		vreg_l19b_1p8: ldo19 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;

Is a fixed voltage intentional here?

> +		};
> +	};
> +
> +	pm8350c-regulators {
> +		compatible = "qcom,pm8350c-rpmh-regulators";

I can't find the datasheet for this chip, skipping this part.


> +	pmr735a-regulators {
> +		compatible = "qcom,pmr735a-rpmh-regulators";
> +		qcom,pmic-id = "e";
> +
> +		vreg_l2e_1p2: ldo2 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		vreg_l3e_0p9: ldo3 {
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <1020000>;

According to the datasheet min and max for L3E is 1.2V. The
datasheet lists different voltages for 'SM8350 lineup' and
'SM8xyz' lineup though, does that mean that the voltages
aren't limitations of what the regulators can provide but
what their consumers support?

There are also deltas for the remaining regulators, but now
I'm in doubt about what the info in the datasheet actually
means.

> +		};
> +
> +		vreg_l4e_1p7: ldo4 {
> +			regulator-min-microvolt = <1776000>;
> +			regulator-max-microvolt = <1890000>;
> +		};
> +
> +		vreg_l5e_0p8: ldo5 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +
> +		vreg_l6e_0p8: ldo6 {
> +			regulator-min-microvolt = <480000>;
> +			regulator-max-microvolt = <904000>;
> +		};
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
