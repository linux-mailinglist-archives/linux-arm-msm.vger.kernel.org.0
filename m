Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13607344D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 18:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhCVR1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 13:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhCVR1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 13:27:22 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9296FC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 10:27:20 -0700 (PDT)
Received: from [192.168.1.101] (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 02EE31F3D9;
        Mon, 22 Mar 2021 18:27:14 +0100 (CET)
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add thermal zones and
 throttling support
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
References: <20210322100420.125616-1-robert.foss@linaro.org>
 <20210322100420.125616-2-robert.foss@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <b3f17dd3-d4b3-930c-db02-9f67748e4427@somainline.org>
Date:   Mon, 22 Mar 2021 18:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322100420.125616-2-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!


> +		tsens0: thermal-sensor@c222000 {
> +			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0C263000 0 0x1ff>, /* TM */
> +			      <0 0x0C222000 0 0x8>; /* SROT */

Please use lowercase hex


> +		tsens1: thermal-sensor@c223000 {
> +			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0C265000 0 0x1ff>, /* TM */
> +			      <0 0x0c223000 0 0x8>; /* SROT */

Ditto


> +			trips {
> +				cpu0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu0_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";

Shouldn't this be "hot"? Possibly ditto for all cpu*alert1-labeled nodes.


> +				};
> +
> +				cpu0_crit: cpu_crit {
> +					temperature = <110000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};

These values seem, err.. scorching hot.. Are they alright?



> +		// TODO: What is the NSP subsystem?
Please use C-style comments (/* foo */)

	


Konrad
