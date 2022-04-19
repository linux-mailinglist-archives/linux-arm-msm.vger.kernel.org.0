Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE155065F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 09:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242058AbiDSHg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 03:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiDSHg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 03:36:27 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC42140DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 00:33:42 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g20so20105023edw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lQgVM9xLc07fZwhM//0DvB9PJW/tEP0B04BroU2YD0M=;
        b=ilDKYgDujwW5ZhN+TwLZuKYQnRg6Nt65wNnmryufO+jlM7BmU2acaN7Uil1h4Bl1J6
         752Y16yTOcwI5loggK6diSJO92s8lXHCMI22bhWB0vR+Fw70FlgdPgGr+0096yNyqfJ8
         KdYqjMG56t928QML+DKtA+x6gBnIC/bjxXEkgE83fEP76zy2ZuFEQyZpMer+GOrK4Jub
         Dp/YyTRotA4eYp2BICP5ZkQ6lQdqHqpd9CmbIK0HG9RKcJSEfHlJH8ZtWkl0OhKaafDb
         DUBgw1ycVZNUIx7QWxklgC4E7MiSxGGmfya7Z1nBGLHiMEx2AVIOY4VX8m+nb3iAIxdw
         DFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lQgVM9xLc07fZwhM//0DvB9PJW/tEP0B04BroU2YD0M=;
        b=Cfo+k721Eo80os3zY1RBiHCkiDH1dB6j3SVWu8w7dO6Y9HEJPPNgb4gkxHiJ1+Oav7
         7qHWU0VHw9y7DZIDuoMJvsHeKkkYN10rodLstnOTCJN2sXtuMZAjUs5wG6E7hLr7EGVr
         MN0U3n9XAP1isjMoMQxoxS+J0bh0qEUnMGKji7RsWzdQ0eHsWqqTazTBJcV0hOh7xJSn
         pqYh7t+UGlcS5HgIQVze8ufJikJf4lzvsSD2HbrscjMgsAinXIDdZ6Le1Y97iVzR3wzl
         II2RJ4oKx7N6m6qoBQhgAR7w0IdH9N4UaFZ+MeTkouO0bpWN2QztBdAFl1h6X+DctkW1
         oeRg==
X-Gm-Message-State: AOAM5332FC6zi/hJRfTPsTbr+1He7M8UMrvdl+n419zxw4i66dxSNkji
        n5R9J6ZZ+h0OcR62cyHNeocDzw==
X-Google-Smtp-Source: ABdhPJybA9yu49CYuDK0DB1c/ZioejRglTOSk1qeoTaRj+5QlWLbYM54/2jeiGNf9oyzPUEenvmEyw==
X-Received: by 2002:a05:6402:198:b0:410:83e3:21d7 with SMTP id r24-20020a056402019800b0041083e321d7mr15911397edv.159.1650353620793;
        Tue, 19 Apr 2022 00:33:40 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c13-20020a056402100d00b0042294fdbcf9sm6116532edu.14.2022.04.19.00.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 00:33:40 -0700 (PDT)
Message-ID: <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
Date:   Tue, 19 Apr 2022 09:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 03:09, Bryan O'Donoghue wrote:
> Add msm8939 a derivative SoC of msm8916. This SoC contains a number of key
> differences to msm8916.
> 
> - big.LITTLE Octa Core - quad 1.5GHz + quad 1.0GHz
> - DRAM 1x800 LPDDR3
> - Camera 4+4 lane CSI
> - Venus @ 1080p60 HEVC
> - DSI x 2
> - Adreno A405
> - WiFi wcn3660/wcn3680b 802.11ac
> 
> Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Co-developed-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Co-developed-by: Benjamin Li <benl@squareup.com>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> Co-developed-by: James Willcox <jwillcox@squareup.com>
> Signed-off-by: James Willcox <jwillcox@squareup.com>
> Co-developed-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Co-developed-by: Joseph Gates <jgates@squareup.com>
> Signed-off-by: Joseph Gates <jgates@squareup.com>
> Co-developed-by: Max Chen <mchen@squareup.com>
> Signed-off-by: Max Chen <mchen@squareup.com>
> Co-developed-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 2017 +++++++++++++++++++++++++
>  1 file changed, 2017 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> new file mode 100644
> index 000000000000..f1aa79b7d0e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -0,0 +1,2017 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020-2022, Linaro Limited
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/interconnect/qcom,msm8939.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +#include <dt-bindings/reset/qcom,gcc-msm8939.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM8939";
> +	compatible = "qcom,msm8939";
> +	qcom,msm-id = <239 0>, <239 0x30000>, <241 0x30000>, <263 0x30000>;
> +
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	memory {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0 0 0 0>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		tz-apps@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x300000>;
> +			no-map;
> +		};
> +
> +		smem_mem: smem_region@86300000 {

No underscores in node names. Why this is region (in node name) and
others are not?

> +			reg = <0x0 0x86300000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		hypervisor@86400000 {
> +			reg = <0x0 0x86400000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		tz@86500000 {
> +			reg = <0x0 0x86500000 0x0 0x180000>;
> +			no-map;
> +		};
> +
> +		reserved@8668000 {
> +			reg = <0x0 0x86680000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		rmtfs@86700000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0x86700000 0x0 0xe0000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +		};
> +
> +		rfsa@867e00000 {
> +			reg = <0x0 0x867e0000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: mpss@86800000 {
> +			reg = <0x0 0x86800000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
> +		wcnss_mem: wcnss@89300000 {
> +			reg = <0x0 0x89300000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		venus_mem: venus@89900000 {
> +			reg = <0x0 0x89900000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		mba_mem: mba@8ea00000 {
> +			no-map;
> +			reg = <0 0x8ea00000 0 0x100000>;
> +		};
> +	};
> +
> +	/*
> +	 * MSM8939 has a big.LITTLE hetrogeneous computing architecture,

s/hetrogeneous/heterogeneous/

> +	 * consisting of two clusters of four ARM Cortex-A53s each. The
> +	 * LITTLE cluster runs at 1.0-1.2GHz, and the big cluster runs
> +	 * at 1.5-1.7GHz.
> +	 *
> +	 * The enable method used here is spin-table which pre-supposes use

s/pre-supposes/presupposes/?

> +	 * of a 2nd stage boot shim such as lk2nd to have installed a
> +	 * spin-table, the downstream non-psci/non-spin-table method that
> +	 * default msm8916/msm8936/msm8939 will not be supported upstream.
> +	 */
> +	cpu-map {
> +		/* LITTLE (efficiency) cluster */
> +		cluster0 {
> +			core0 {
> +				cpu = <&CPU4>;
> +			};
> +
> +			core1 {
> +				cpu = <&CPU5>;
> +			};
> +
> +			core2 {
> +				cpu = <&CPU6>;
> +			};
> +
> +			core3 {
> +				cpu = <&CPU7>;
> +			};
> +		};
> +
> +		/* big (performance) cluster */
> +		/* Boot CPU is cluster 1 core 0 */
> +		cluster1 {
> +			core0 {
> +				cpu = <&CPU0>;
> +			};
> +
> +			core1 {
> +				cpu = <&CPU1>;
> +			};
> +
> +			core2 {
> +				cpu = <&CPU2>;
> +			};
> +
> +			core3 {
> +				cpu = <&CPU3>;
> +			};
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@100 {

lowercalse labels

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x100>;
> +			next-level-cache = <&L2_1>;
> +			qcom,acc = <&acc0>;
> +			qcom,saw = <&saw0>;
> +			cpu-idle-states = <&CPU_SPC>;
> +			clocks = <&apcs1_mbox>;
> +			/* operating-points-v2 = <&cluster1_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +			L2_1: l2-cache-cluster1 {

lowercase labels, the same applies further.

> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +		};
> +
> +		CPU1: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x101>;
> +			next-level-cache = <&L2_1>;
> +			qcom,acc = <&acc1>;
> +			qcom,saw = <&saw1>;
> +			clocks = <&apcs1_mbox>;
> +			/* operating-points-v2 = <&cluster1_opp_table>;

No dead code in the kernel. If you need it here, please document.  The
same applies further.

> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +		};
> +
> +		CPU2: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x102>;
> +			next-level-cache = <&L2_1>;
> +			qcom,acc = <&acc2>;
> +			qcom,saw = <&saw2>;
> +			clocks = <&apcs1_mbox>;
> +			/* operating-points-v2 = <&cluster1_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +		};
> +
> +		CPU3: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x103>;
> +			next-level-cache = <&L2_1>;
> +			qcom,acc = <&acc3>;
> +			qcom,saw = <&saw3>;
> +			clocks = <&apcs1_mbox>;
> +			/* operating-points-v2 = <&cluster1_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +		};
> +
> +		CPU4: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x0>;
> +			qcom,acc = <&acc4>;
> +			qcom,saw = <&saw4>;
> +			clocks = <&apcs0>;
> +			/* operating-points-v2 = <&cluster0_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache-cluster0 {
> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +		};
> +
> +		CPU5: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x1>;
> +			next-level-cache = <&L2_0>;
> +			qcom,acc = <&acc5>;
> +			qcom,saw = <&saw5>;
> +			clocks = <&apcs0>;
> +			/* operating-points-v2 = <&cluster0_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +		};
> +
> +		CPU6: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x2>;
> +			next-level-cache = <&L2_0>;
> +			qcom,acc = <&acc6>;
> +			qcom,saw = <&saw6>;
> +			clocks = <&apcs0>;
> +			/* operating-points-v2 = <&cluster0_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +		};
> +
> +		CPU7: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			enable-method = "spin-table";
> +			reg = <0x3>;
> +			next-level-cache = <&L2_0>;
> +			qcom,acc = <&acc7>;
> +			qcom,saw = <&saw7>;
> +			clocks = <&apcs0>;
> +			/* operating-points-v2 = <&cluster0_opp_table>;
> +			 * power-domains = <&cpr>;
> +			 * power-domain-names = "cpr";
> +			 */
> +			#cooling-cells = <2>;
> +		};
> +
> +		idle-states {
> +			CPU_SPC: spc {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x40000002>;
> +				entry-latency-us = <130>;
> +				exit-latency-us = <150>;
> +				min-residency-us = <2000>;
> +				local-timer-stop;
> +			};
> +		};
> +	};
> +
> +	cluster0_opp_table: cluster0-opp-table {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		opp-shared;
> +
> +		opp-249600000 {
> +			opp-hz = /bits/ 64 <249600000>;
> +			required-opps = <&cpr_opp1>;
> +		};
> +
> +		opp-499200000 {
> +			opp-hz = /bits/ 64 <499200000>;
> +			required-opps = <&cpr_opp3>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			required-opps = <&cpr_opp6>;
> +		};
> +
> +		opp-1113600000 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			required-opps = <&cpr_opp9>;
> +		};
> +	};
> +
> +	cluster1_opp_table: cluster1-opp-table {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		opp-shared;
> +
> +		opp-200000000 {
> +			opp-hz = /bits/ 64 <200000000>;
> +			required-opps = <&cpr_opp1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&cpr_opp2>;
> +		};
> +
> +		opp-533330000 {
> +			opp-hz = /bits/ 64 <533330000>;
> +			required-opps = <&cpr_opp4>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			required-opps = <&cpr_opp5>;
> +		};
> +
> +		opp-1113600000 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			required-opps = <&cpr_opp7>;
> +		};
> +
> +		opp-1497600000 {
> +			opp-hz = /bits/ 64 <1497600000>;
> +			required-opps = <&cpr_opp8>;
> +		};
> +	};
> +
> +	/* Frequencies in below opp is for cpr_opp virtual corner calculation,

Generic Linux coding style comments, so:
	/*
	 * Frequencies....
	 * ...
	 */

> +	 * not strictly coupled with frquencies in CPU opp for CPUs may require
> +	 * different cpr_opp for specific frquency.

Multiple typos. Please run spell check.

> +	 */
> +	cpr_opp_table: cpr-opp-table {
> +		compatible = "operating-points-v2-qcom-level";
> +
> +		cpr_opp1: opp1 {

Why these opps are named with numerical suffix but other with frequency
suffix?

> +			opp-hz = /bits/ 64 <200000000>;
> +			opp-level = <1>;
> +			qcom,opp-fuse-level = <1>;
> +		};
> +		cpr_opp2: opp2 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			opp-level = <2>;
> +			qcom,opp-fuse-level = <1>;
> +		};
> +		cpr_opp3: opp3 {
> +			opp-hz = /bits/ 64 <499200000>;
> +			opp-level = <3>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp4: opp4 {
> +			opp-hz = /bits/ 64 <533330000>;
> +			opp-level = <4>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp5: opp5 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-level = <5>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp6: opp6 {
> +			opp-hz = /bits/ 64 <960000000>;
> +			opp-level = <6>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp7: opp7 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			opp-level = <7>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp8: opp8 {
> +			opp-hz = /bits/ 64 <1497600000>;
> +			opp-level = <8>;
> +			qcom,opp-fuse-level = <3>;
> +		};
> +		cpr_opp9: opp9 {
> +			opp-hz = /bits/ 64 <1497500000>;
> +			opp-level = <9>;
> +			qcom,opp-fuse-level = <3>;
> +		};
> +	};
> +
> +	cci_opp_table: cci-opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-200000000 {
> +			opp-hz = /bits/ 64 <200000000>;
> +		};
> +
> +		opp-297600000 {
> +			opp-hz = /bits/ 64 <297600000>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +		};
> +
> +		opp-595200000 {
> +			opp-hz = /bits/ 64 <595200000>;
> +		};
> +	};
> +
> +	gpu_opp_table: gpu-opp-table {

If table is used by only one device, define it inside that device node.

> +		compatible = "operating-points-v2";
> +
> +		opp-550000000 {
> +			opp-hz = /bits/ 64 <550000000>;
> +		};
> +
> +		opp-465000000 {
> +			opp-hz = /bits/ 64 <465000000>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +		};
> +
> +		opp-220000000 {
> +			opp-hz = /bits/ 64 <220000000>;
> +		};
> +
> +		opp-19200000 {
> +			opp-hz = /bits/ 64 <19200000>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;

No PMU nodes for other cores?

> +	};
> +
> +	thermal_zones: thermal-zones {
> +		cpu0-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens 5>;
> +
> +			trips {
> +				cpu0_alert: trip0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu0_crit: trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		cpu1-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens 6>;
> +
> +			trips {
> +				cpu1_alert: trip0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu1_crit: trip1 {
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu1_alert>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		cpu2-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens 7>;
> +
> +			trips {
> +				cpu2_alert: trip0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu2_crit: trip1 {
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu2_alert>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		cpu3-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens 8>;
> +
> +			trips {
> +				cpu3_alert: trip0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu3_crit: trip1 {
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu3_alert>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		cpu4567-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens 9>;
> +
> +			trips {
> +				cpu4567_alert: trip0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu4567_crit: trip1 {
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu4567_alert>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		gpu-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens 3>;
> +		};
> +
> +		modem1-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens 0>;
> +		};
> +
> +		modem2-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens 2>;
> +		};
> +
> +		venus_camera-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens 1>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	clocks {
> +		xo_board: xo_board {

Generic node names, no underscores in node names. This applies everywhere.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};
> +
> +	smem {
> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_mem>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm";
> +			clocks = <&gcc GCC_CRYPTO_CLK>,
> +				 <&gcc GCC_CRYPTO_AXI_CLK>,
> +				 <&gcc GCC_CRYPTO_AHB_CLK>;
> +			clock-names = "core", "bus", "iface";
> +			#reset-cells = <1>;
> +
> +			qcom,dload-mode = <&tcsr 0x6100>;
> +		};
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		qfprom_cpr: qfprom_cpr@58000 {

Generic node names, no underscores in node names. This applies everywhere.

> +			compatible = "qcom,qfprom";
> +			reg = <0x00058000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			cpr_efuse_init_voltage1: ivoltage1@dc {

s/ivoltageX/voltage/

> +				reg = <0xdc 0x4>;
> +				bits = <4 6>;
> +			};
> +			cpr_efuse_init_voltage2: ivoltage2@da {
> +				reg = <0xda 0x4>;
> +				bits = <2 6>;
> +			};
> +			cpr_efuse_init_voltage3: ivoltage3@d8 {
> +				reg = <0xd8 0x4>;
> +				bits = <0 6>;
> +			};
> +			cpr_efuse_quot1: quot1@dc {

Similar. Why do you need suffix number?

> +				reg = <0xdd 0x8>;
> +				bits = <2 12>;
> +			};
> +			cpr_efuse_quot2: quot2@da {
> +				reg = <0xdb 0x8>;
> +				bits = <0x0 12>;
> +			};
> +			cpr_efuse_quot3: quot3@d8 {
> +				reg = <0xd8 0x8>;
> +				bits = <6 12>;
> +			};
> +			cpr_efuse_ring1: ring1@de {
> +				reg = <0xde 0x4>;
> +				bits = <6 3>;
> +			};
> +			cpr_efuse_ring2: ring2@de {
> +				reg = <0xde 0x4>;
> +				bits = <6 3>;
> +			};
> +			cpr_efuse_ring3: ring3@de {
> +				reg = <0xde 0x4>;
> +				bits = <6 3>;
> +			};
> +			cpr_efuse_revision: revision@4 {
> +				reg = <0x5 0x1>;
> +				bits = <5 1>;
> +			};
> +			cpr_efuse_revision_high: revision_high@4 {
> +				reg = <0x7 0x1>;
> +				bits = <0 1>;
> +			};
> +			cpr_efuse_pvs_version: pvs@4 {
> +				reg = <0x3 0x1>;
> +				bits = <5 1>;
> +			};
> +			cpr_efuse_pvs_version_high: pvs_high@4 {
> +				reg = <0x6 0x1>;
> +				bits = <2 2>;
> +			};
> +			cpr_efuse_speedbin: speedbin@c {
> +				reg = <0xc 0x1>;
> +				bits = <2 3>;
> +			};
> +
> +		};
> +
> +		acc0: clock-controller@b088000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb088000 0x1000>;
> +		};
> +
> +		saw0: power-controller@b089000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb089000 0x1000>;
> +		};
> +
> +		acc1: clock-controller@b098000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb098000 0x1000>;
> +		};
> +
> +		saw1: power-controller@b099000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb099000 0x1000>;
> +		};
> +
> +		acc2: clock-controller@b0a8000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb0a8000 0x1000>;
> +		};
> +
> +		saw2: power-controller@b0a9000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb0a9000 0x1000>;
> +		};
> +
> +		acc3: clock-controller@b0b8000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb0b8000 0x1000>;
> +		};
> +
> +		saw3: power-domain@b0b9000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb0b9000 0x1000>;
> +		};
> +
> +		acc4: clock-controller@b188000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb188000 0x1000>;
> +		};
> +
> +		saw4: power-controller@b189000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb189000 0x1000>;
> +		};
> +
> +		acc5: clock-controller@b198000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb198000 0x1000>;
> +		};
> +
> +		saw5: power-controller@b199000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb199000 0x1000>;
> +		};
> +
> +		acc6: clock-controller@b1a8000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb1a8000 0x1000>;
> +		};
> +
> +		saw6: power-controller@b1a9000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb1a9000 0x1000>;
> +		};
> +
> +		acc7: clock-controller@b1b8000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb1b8000 0x1000>;
> +		};
> +
> +		saw7: power-controller@b1b9000 {
> +			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
> +			reg = <0xb1b9000 0x1000>;
> +		};
> +
> +		restart@4ab000 {
> +			compatible = "qcom,pshold";
> +			reg = <0x4ab000 0x4>;
> +		};
> +
> +		msmgpio: pinctrl@1000000 {
> +			compatible = "qcom,msm8916-pinctrl";
> +			reg = <0x1000000 0x300000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gcc: clock-controller@1800000 {
> +			compatible = "qcom,gcc-msm8939";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			reg = <0x1800000 0x80000>;
> +			clocks = <&xo_board>, <&sleep_clk>;
> +			clock-names = "xo", "sleep_clk";
> +		};
> +
> +		tcsr_mutex_regs: syscon@1905000 {
> +			compatible = "syscon";
> +			reg = <0x1905000 0x20000>;
> +		};
> +
> +		tcsr: syscon@1937000 {
> +			compatible = "qcom,tcsr-msm8916", "syscon";
> +			reg = <0x1937000 0x30000>;
> +		};
> +
> +		tcsr_mutex: hwlock {
> +			compatible = "qcom,tcsr-mutex";
> +			syscon = <&tcsr_mutex_regs 0 0x1000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		rpm_msg_ram: memory@60000 {
> +			compatible = "qcom,rpm-msg-ram";
> +			reg = <0x60000 0x8000>;
> +		};
> +
> +		blsp1_uart1: serial@78af000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0x78af000 0x200>;
> +			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		a53pll_c1: clock@b016000 {
> +			compatible = "qcom,msm8939-a53pll";
> +			reg = <0xb016000 0x40>;
> +			#clock-cells = <0>;
> +		};
> +
> +		a53pll_c0: clock@b116000 {
> +			compatible = "qcom,msm8939-a53pll";
> +			reg = <0xb116000 0x40>;
> +			#clock-cells = <0>;
> +		};
> +
> +		a53pll_cci: clock@b1d0000 {
> +			compatible = "qcom,msm8939-a53pll";
> +			reg = <0xb1d0000 0x40>;
> +			#clock-cells = <0>;
> +		};
> +
> +		apcs2: mailbox@b1d1000 {
> +			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
> +			reg = <0xb1d1000 0x1000>;
> +			#mbox-cells = <1>;
> +			clocks = <&a53pll_cci>, <&gcc GPLL0_VOTE>, <&xo_board>;
> +			clock-names = "pll", "aux", "ref";
> +			#clock-cells = <0>;
> +			clock-output-names = "a53mux_cci";
> +		};
> +
> +		apcs1_mbox: mailbox@b011000 {
> +			compatible = "qcom,msm8916-apcs-kpss-global";
> +			reg = <0xb011000 0x1000>;
> +			#mbox-cells = <1>;
> +			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&xo_board>;
> +			clock-names = "pll", "aux", "ref";
> +			#clock-cells = <0>;
> +			clock-output-names = "a53mux_c1";
> +			/* Set a nominal frequency on a53mux_cci */
> +			assigned-clocks = <&apcs2>;
> +			assigned-clock-rates = <297600000>;
> +		};
> +
> +		apcs1: syscon@b111000 {
> +			compatible = "syscon";
> +			reg = <0xb011000 0x1000>;
> +		};
> +
> +		apcs0: mailbox@b111000 {
> +			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
> +			reg = <0xb111000 0x1000>;
> +			#mbox-cells = <1>;
> +			clocks = <&a53pll_c0>, <&gcc GPLL0_VOTE>, <&xo_board>;
> +			clock-names = "pll", "aux", "ref";
> +			#clock-cells = <0>;
> +			clock-output-names = "a53mux_c0";
> +		};
> +
> +		blsp1_uart2: serial@78b0000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0x78b0000 0x200>;
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		blsp_dma: dma@7884000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x07884000 0x23000>;
> +			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi1: spi@78b5000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x078b5000 0x500>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 5>, <&blsp_dma 4>;
> +			dma-names = "rx", "tx";

tx/rx. Please rebase on recent linux-next and run `make dtbs_check` and
fix all the errors.

> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&spi1_default>;
> +			pinctrl-1 = <&spi1_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi2: spi@78b6000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x078b6000 0x500>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 7>, <&blsp_dma 6>;
> +			dma-names = "rx", "tx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&spi2_default>;
> +			pinctrl-1 = <&spi2_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi3: spi@78b7000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x078b7000 0x500>;
> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 9>, <&blsp_dma 8>;
> +			dma-names = "rx", "tx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&spi3_default>;
> +			pinctrl-1 = <&spi3_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi4: spi@78b8000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x078b8000 0x500>;
> +			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 11>, <&blsp_dma 10>;
> +			dma-names = "rx", "tx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&spi4_default>;
> +			pinctrl-1 = <&spi4_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi5: spi@78b9000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x078b9000 0x500>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP5_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 13>, <&blsp_dma 12>;
> +			dma-names = "rx", "tx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&spi5_default>;
> +			pinctrl-1 = <&spi5_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi6: spi@78ba000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x078ba000 0x500>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP6_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 15>, <&blsp_dma 14>;
> +			dma-names = "rx", "tx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&spi6_default>;
> +			pinctrl-1 = <&spi6_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c1: i2c@78b5000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b5000 0x500>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c1_default>;
> +			pinctrl-1 = <&i2c1_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c2: i2c@78b6000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b6000 0x500>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c2_default>;
> +			pinctrl-1 = <&i2c2_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c3: i2c@78b7000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b7000 0x500>;
> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			dmas = <&blsp_dma 8>, <&blsp_dma 9>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c3_default>;
> +			pinctrl-1 = <&i2c3_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c4: i2c@78b8000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b8000 0x500>;
> +			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			dmas = <&blsp_dma 10>, <&blsp_dma 11>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c4_default>;
> +			pinctrl-1 = <&i2c4_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c5: i2c@78b9000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b9000 0x500>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c5_default>;
> +			pinctrl-1 = <&i2c5_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c6: i2c@78ba000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078ba000 0x500>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c6_default>;
> +			pinctrl-1 = <&i2c6_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		lpass: lpass@7708000 {
> +			status = "disabled";
> +			compatible = "qcom,apq8016-lpass-cpu";
> +			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
> +				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
> +				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
> +
> +			clock-names = "ahbix-clk",
> +					"pcnoc-mport-clk",
> +					"pcnoc-sway-clk",
> +					"mi2s-bit-clk0",
> +					"mi2s-bit-clk1",
> +					"mi2s-bit-clk2",
> +					"mi2s-bit-clk3";
> +			#sound-dai-cells = <1>;
> +
> +			interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "lpass-irq-lpaif";
> +			reg = <0x07708000 0x10000>;
> +			reg-names = "lpass-lpaif";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		lpass_codec: codec{

Missing space

> +			compatible = "qcom,msm8916-wcd-digital-codec";
> +			reg = <0x0771c000 0x400>;
> +			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
> +				 <&gcc GCC_CODEC_DIGCODEC_CLK>;
> +			clock-names = "ahbix-clk", "mclk";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		sdhc_1: sdhci@7824000 {
> +			compatible = "qcom,sdhci-msm-v4";
> +			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
> +			reg-names = "hc_mem", "core_mem";
> +
> +			interrupts = <0 123 IRQ_TYPE_LEVEL_HIGH>, <0 138 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&xo_board>;
> +			clock-names = "core", "iface", "xo";
> +			mmc-ddr-1_8v;
> +			bus-width = <8>;
> +			non-removable;
> +			status = "disabled";
> +		};
> +
> +		sdhc_2: sdhci@7864000 {
> +			compatible = "qcom,sdhci-msm-v4";
> +			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
> +			reg-names = "hc_mem", "core_mem";
> +
> +			interrupts = <0 125 IRQ_TYPE_LEVEL_HIGH>, <0 221 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&xo_board>;
> +			clock-names = "core", "iface", "xo";
> +			bus-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		otg: usb@78d9000 {
> +			compatible = "qcom,ci-hdrc";
> +			reg = <0x78d9000 0x200>,
> +			      <0x78d9200 0x200>;
> +			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
> +				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
> +			clock-names = "iface", "core";
> +			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
> +			assigned-clock-rates = <80000000>;
> +			resets = <&gcc GCC_USB_HS_BCR>;
> +			reset-names = "core";
> +			phy_type = "ulpi";
> +			dr_mode = "otg";
> +			ahb-burst-config = <0>;
> +			phy-names = "usb-phy";
> +			phys = <&usb_hs_phy>;
> +			status = "disabled";
> +			#reset-cells = <1>;
> +
> +			ulpi {
> +				usb_hs_phy: phy {
> +					compatible = "qcom,usb-hs-phy-msm8916",
> +						     "qcom,usb-hs-phy";
> +					#phy-cells = <0>;
> +					clocks = <&xo_board>, <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
> +					clock-names = "ref", "sleep";
> +					resets = <&gcc GCC_USB2A_PHY_BCR>, <&otg 0>;
> +					reset-names = "phy", "por";
> +					qcom,init-seq = /bits/ 8 <0x0 0x44
> +						0x1 0x6b 0x2 0x24 0x3 0x13>;
> +				};
> +			};
> +		};
> +
> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
> +		};
> +
> +		timer@b020000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0xb020000 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@b021000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb021000 0x1000>,
> +				      <0xb022000 0x1000>;
> +			};
> +
> +			frame@b023000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb023000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b024000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb024000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b025000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb025000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b026000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb026000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b027000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb027000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b028000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb028000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		spmi_bus: spmi@200f000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x200f000 0x001000>,
> +			      <0x2400000 0x400000>,
> +			      <0x2c00000 0x400000>,
> +			      <0x3800000 0x200000>,
> +			      <0x200a000 0x002100>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
> +		rng@22000 {
> +			compatible = "qcom,prng";
> +			reg = <0x00022000 0x200>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
> +		qfprom: qfprom@5c000 {
> +			compatible = "qcom,qfprom";
> +			reg = <0x5c000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			tsens_caldata: caldata@a0 {
> +				reg = <0xa0 0x5c>;
> +			};
> +		};
> +
> +		tsens: thermal-sensor@4a9000 {
> +			compatible = "qcom,msm8939-tsens";
> +			reg = <0x4a9000 0x1000>, /* TM */
> +			      <0x4a8000 0x1000>; /* SROT */
> +			nvmem-cells = <&tsens_caldata>;
> +			nvmem-cell-names = "calib";
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		apps_iommu: iommu@1ef0000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			#iommu-cells = <1>;

compatible, reg and ranges should be the first nodes. This applies
everywehere.

> +			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> +			ranges = <0 0x1e20000 0x40000>;
> +			reg = <0x1ef0000 0x3000>;
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_APSS_TCU_CLK>;
> +			clock-names = "iface", "bus";
> +			qcom,iommu-secure-id = <17>;
> +
> +			/* mdp_0: */
> +			iommu-ctx@4000 {
> +				compatible = "qcom,msm-iommu-v1-ns";
> +				reg = <0x4000 0x1000>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			/* venus_ns: */
> +			iommu-ctx@5000 {
> +				compatible = "qcom,msm-iommu-v1-sec";
> +				reg = <0x5000 0x1000>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpu_iommu: iommu@1f08000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			#iommu-cells = <1>;
> +			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> +			ranges = <0 0x1f08000 0x10000>;
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_GFX_TCU_CLK>,
> +				 <&gcc GCC_GFX_TBU_CLK>;
> +			clock-names = "iface", "bus", "tlb";
> +			qcom,iommu-secure-id = <18>;
> +
> +			/* gfx3d_user: */
> +			iommu-ctx@1000 {
> +				compatible = "qcom,msm-iommu-v1-ns";
> +				reg = <0x1000 0x1000>;
> +				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			/* gfx3d_priv: */
> +			iommu-ctx@2000 {
> +				compatible = "qcom,msm-iommu-v1-ns";
> +				reg = <0x2000 0x1000>;
> +				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpu@1c00000 {
> +			compatible = "qcom,adreno-405.0", "qcom,adreno";
> +			reg = <0x01c00000 0x10000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";
> +			clock-names =
> +			    "core",
> +			    "iface",
> +			    "mem",
> +			    "mem_iface",
> +			    "alt_mem_iface",
> +			    "gfx3d",
> +			    "rbbmtimer";
> +			clocks =
> +			    <&gcc GCC_OXILI_GFX3D_CLK>,
> +			    <&gcc GCC_OXILI_AHB_CLK>,
> +			    <&gcc GCC_OXILI_GMEM_CLK>,
> +			    <&gcc GCC_BIMC_GFX_CLK>,
> +			    <&gcc GCC_BIMC_GPU_CLK>,
> +			    <&gcc GFX3D_CLK_SRC>,
> +			    <&gcc GCC_OXILI_TIMER_CLK>;
> +			power-domains = <&gcc OXILI_GDSC>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
> +		};
> +
> +		mdss: mdss@1a00000 {
> +			compatible = "qcom,mdss";
> +			reg = <0x1a00000 0x1000>,
> +			      <0x1ac8000 0x3000>;
> +			reg-names = "mdss_phys", "vbif_phys";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>;
> +			clock-names = "iface",
> +				      "bus",
> +				      "vsync";
> +
> +			interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			mdp: mdp@1a01000 {
> +				compatible = "qcom,mdp5";
> +				reg = <0x1a01000 0x89000>;
> +				reg-names = "mdp_phys";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0 0>;
> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_VSYNC_CLK>,
> +					 <&gcc GCC_MDP_TBU_CLK>,
> +					 <&gcc GCC_MDP_RT_TBU_CLK>;
> +				clock-names = "iface",
> +					      "bus",
> +					      "core",
> +					      "vsync",
> +					      "tbu",
> +					      "tbu_rt";
> +
> +				iommus = <&apps_iommu 4>;
> +
> +				interconnects = <&snoc_mm MASTER_MDP_PORT0 &bimc SLAVE_EBI_CH0>,
> +						<&snoc_mm MASTER_MDP_PORT1 &bimc SLAVE_EBI_CH0>;
> +				interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdp5_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdp5_intf2_out: endpoint {
> +							remote-endpoint = <&dsi1_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@1a98000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0x1a98000 0x25c>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4 0>;
> +
> +				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
> +						  <&gcc PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>,
> +							 <&dsi0_phy 1>;
> +
> +				clocks = <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_BYTE0_CLK>,
> +					 <&gcc GCC_MDSS_PCLK0_CLK>,
> +					 <&gcc GCC_MDSS_ESC0_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core";
> +				phys = <&dsi0_phy>;
> +				phy-names = "dsi-phy";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&mdp5_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi1: dsi@1aa0000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0x1aa0000 0x25c>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <5 0>;
> +
> +				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
> +						  <&gcc PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>,
> +							 <&dsi1_phy 1>;
> +
> +				clocks = <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_BYTE1_CLK>,
> +					 <&gcc GCC_MDSS_PCLK1_CLK>,
> +					 <&gcc GCC_MDSS_ESC1_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core";
> +				phys = <&dsi1_phy>;
> +				phy-names = "dsi-phy";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi1_in: endpoint {
> +							remote-endpoint = <&mdp5_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0_phy: dsi-phy@1a98300 {

Generic node name, so just "phy"

> +				compatible = "qcom,dsi-phy-28nm-lp";
> +				reg = <0x1a98300 0xd4>,
> +				      <0x1a98500 0x280>,
> +				      <0x1a98780 0x30>;
> +				reg-names = "dsi_pll",
> +					    "dsi_phy",
> +					    "dsi_phy_regulator";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>;
> +				clock-names = "iface";
> +				qcom,dsi-phy-regulator-ldo-mode;
> +				status = "disabled";
> +			};
> +
> +			dsi1_phy: dsi-phy@1aa0300 {
> +				compatible = "qcom,dsi-phy-28nm-lp";
> +				reg = <0x1aa0300 0xd4>,
> +				      <0x1aa0500 0x280>,
> +				      <0x1aa0780 0x30>;
> +				reg-names = "dsi_pll",
> +					    "dsi_phy",
> +					    "dsi_phy_regulator";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>;
> +				clock-names = "iface";
> +				qcom,dsi-phy-regulator-ldo-mode;
> +				status = "disabled";
> +			};
> +		};
> +
> +		hexagon@4080000 {
> +			compatible = "qcom,q6v5-pil";
> +			reg = <0x04080000 0x100>,
> +			      <0x04020000 0x040>;
> +
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc 0 24 1>,
> +					      <&hexagon_smp2p_in 0 0>,
> +					      <&hexagon_smp2p_in 1 0>,
> +					      <&hexagon_smp2p_in 2 0>,
> +					      <&hexagon_smp2p_in 3 0>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> +				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				 <&xo_board>;
> +			clock-names = "iface", "bus", "mem", "xo";
> +
> +			qcom,smem-states = <&hexagon_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			resets = <&scm 0>;
> +			reset-names = "mss_restart";
> +
> +			power-domains = <&rpmpd MSM8939_VDDMDCX_AO>,
> +					<&rpmpd MSM8939_VDDMX>;
> +			power-domain-names = "cx", "mx";
> +			pll-supply = <&pm8916_l7>;
> +
> +			qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
> +
> +			status = "disabled";
> +
> +			mba {
> +				memory-region = <&mba_mem>;
> +			};
> +
> +			mpss {
> +				memory-region = <&mpss_mem>;
> +			};
> +
> +			smd-edge {
> +				interrupts = <0 25 IRQ_TYPE_EDGE_RISING>;
> +
> +				qcom,smd-edge = <0>;
> +				mboxes = <&apcs1_mbox 12>;
> +				qcom,remote-pid = <1>;
> +
> +				label = "hexagon";
> +			};
> +		};
> +
> +		pronto: wcnss@a204000 {
> +			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
> +			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
> +			reg-names = "ccu", "dxe", "pmu";
> +
> +			memory-region = <&wcnss_mem>;
> +
> +			interrupts-extended = <&intc 0 149 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
> +
> +			power-domains = <&rpmpd MSM8939_VDDCX>,
> +					<&rpmpd MSM8939_VDDMX_AO>;
> +			power-domain-names = "cx", "mx";
> +			vddpx-supply = <&pm8916_l7>;
> +
> +			qcom,state = <&wcnss_smp2p_out 0>;
> +			qcom,state-names = "stop";
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wcnss_pin_a>;
> +
> +			status = "disabled";
> +
> +			iris {
> +				compatible = "qcom,wcn3660";
> +
> +				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
> +				clock-names = "xo";
> +
> +				vddxo-supply = <&pm8916_l7>;
> +				vddrfa-supply = <&pm8916_s3>;
> +				vddpa-supply = <&pm8916_l9>;
> +				vdddig-supply = <&pm8916_l5>;
> +			};
> +
> +			smd-edge {
> +				interrupts = <0 142 1>;
> +
> +				qcom,ipc = <&apcs1 8 17>;
> +				qcom,smd-edge = <6>;
> +				qcom,remote-pid = <4>;
> +
> +				label = "pronto";
> +
> +				wcnss {
> +					compatible = "qcom,wcnss";
> +					qcom,smd-channels = "WCNSS_CTRL";
> +
> +					qcom,mmio = <&pronto>;
> +
> +					bt {
> +						compatible = "qcom,wcnss-bt";
> +					};
> +
> +					wifi {
> +						compatible = "qcom,wcnss-wlan";
> +
> +						interrupts = <0 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <0 146 IRQ_TYPE_LEVEL_HIGH>;
> +						interrupt-names = "tx", "rx";
> +
> +						qcom,smem-states = <&apps_smsm 10>,
> +								   <&apps_smsm 9>;
> +						qcom,smem-state-names = "tx-enable",
> +									"tx-rings-empty";
> +					};
> +				};
> +			};
> +		};
> +
> +		venus: video-codec@1d00000 {
> +			compatible = "qcom,msm8916-venus";
> +			reg = <0x01d00000 0xff000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&gcc VENUS_GDSC>;
> +			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_AHB_CLK>,
> +				 <&gcc GCC_VENUS0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus";
> +			iommus = <&apps_iommu 5>;
> +			memory-region = <&venus_mem>;
> +			status = "okay";
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +		};
> +
> +		bimc: interconnect@400000 {
> +			compatible = "qcom,msm8939-bimc";
> +			#interconnect-cells = <1>;
> +			reg = <0x400000 0x62000>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
> +			status = "okay";
> +		};
> +
> +		pcnoc: interconnect@500000 {
> +			compatible = "qcom,msm8939-pcnoc";
> +			#interconnect-cells = <1>;
> +			reg = <0x500000 0x11000>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
> +				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
> +			status = "okay";
> +		};
> +
> +		snoc: interconnect@580000 {
> +			compatible = "qcom,msm8939-snoc";
> +			#interconnect-cells = <1>;
> +			reg = <0x580000 0x14080>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> +				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
> +			status = "okay";
> +
> +			snoc_mm: interconnect-snoc-mm {
> +				compatible = "qcom,msm8939-snoc-mm";
> +				#interconnect-cells = <1>;
> +				clock-names = "bus", "bus_a";
> +				clocks = <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
> +					 <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
> +				status = "okay";
> +			};
> +
> +		};
> +	};
> +
> +	smd {
> +		compatible = "qcom,smd";
> +
> +		rpm {
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +			qcom,ipc = <&apcs1 8 0>;
> +			qcom,smd-edge = <15>;
> +
> +			rpm_requests: rpm_requests {

No underscores.

> +				compatible = "qcom,rpm-msm8936";
> +				qcom,smd-channels = "rpm_requests";
> +
> +				rpmcc: qcom,rpmcc {
> +					compatible = "qcom,rpmcc-msm8936";
> +					#clock-cells = <1>;
> +				};
> +
> +				rpmpd: power-controller {
> +					compatible = "qcom,msm8939-rpmpd";
> +					#power-domain-cells = <1>;
> +					operating-points-v2 = <&rpmpd_opp_table>;
> +
> +					rpmpd_opp_table: opp-table {
> +						compatible = "operating-points-v2";
> +
> +						rpmpd_opp_ret: opp1 {
> +							opp-level = <1>;
> +						};
> +
> +						rpmpd_opp_svs_krait: opp2 {
> +							opp-level = <2>;
> +						};
> +
> +						rpmpd_opp_svs_soc: opp3 {
> +							opp-level = <3>;
> +						};
> +
> +						rpmpd_opp_nom: opp4 {
> +							opp-level = <4>;
> +						};
> +
> +						rpmpd_opp_turbo: opp5 {
> +							opp-level = <5>;
> +						};
> +
> +						rpmpd_opp_super_turbo: opp6 {
> +							opp-level = <6>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	hexagon-smp2p {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupts = <0 27 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs1_mbox 14>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		hexagon_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		hexagon_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	wcnss-smp2p {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <451>, <431>;
> +
> +		interrupts = <0 143 IRQ_TYPE_EDGE_RISING>;

Isn't this some GIC interrupt? If so, then use flags for PPI and SPI
interrupts.


Best regards,
Krzysztof
