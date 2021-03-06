Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD1432F961
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 11:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCFKeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 05:34:46 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:39773 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhCFKeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 05:34:24 -0500
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C2DFC3E9B6;
        Sat,  6 Mar 2021 11:34:13 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: qcom: Introduce SM8350 HDK
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210306020905.1173790-1-bjorn.andersson@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <83273ce6-448d-a969-e9bf-97c11d57a38b@somainline.org>
Date:   Sat, 6 Mar 2021 11:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306020905.1173790-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!


> +		vreg_l5b_0p88: ldo5 {
> +			regulator-name = "vreg_l5b_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <888000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +

This one needs `regulator-allow-set-load` since you specify current settings under UFS nodes, we've seen it not working at all without this property.


> +		vreg_l6b_1p2: ldo6 {
> +			regulator-name = "vreg_l6b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1208000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p96: ldo7 {
> +			regulator-name = "vreg_l7b_2p96";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-name = "vreg_l9b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};

Ditto for all three


> +&usb_1_dwc3 {
> +	/* TODO: Define USB-C connector properly */

Sidenote: doesn't the new pm8150x (I think?) USB-C driver work on pm8350x?


> +/* PINCTRL - additions to nodes defined in sdm845.dtsi */

sm8350


Aside from these minor comments,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

