Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6E507920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 20:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354352AbiDSSi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 14:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357643AbiDSShw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 14:37:52 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7832389;
        Tue, 19 Apr 2022 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1650393110;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+IJG/JJjrvgr3aL7oHdTlAlwB9EMu5+EVDgtFsKDlGo=;
    b=NVkhQyGFpqkUq1WNFZ5hSMlmBF/a0df3Qyjv+p8PAcjI+szR79O9EWhgL8zgZCABdm
    vlJ56WNuj9Wy1pXVXxuGhSLQXaENC5yDl6x/4HO4MaWzfN6iODO25LI81tXIs43brmAR
    B7XYsH3JljMPxfANCYcCRi+O+ve0dSLI1qMyriMTd1gRv7OkorzKnGHoFghf/WQwNFEE
    swvgAMxrtSZukfxV4DdqwFcLLchGmjYxribYDBK8eZmzp0WYCnK+A97Mm1GI9igiUG4r
    U3mRRbFLbvTbHBy5ESpt4KH2n031ALb3CH8VVRXFagXhbqhZo0Dl42AkleuLXnhKKrEv
    z18A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3JIVou1P
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 19 Apr 2022 20:31:50 +0200 (CEST)
Date:   Tue, 19 Apr 2022 20:31:41 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org,
        jun.nie@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com,
        Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Message-ID: <Yl8ADY3D+GvV7MZ2@gerhold.net>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

Thanks a lot for sending this upstream!

On Tue, Apr 19, 2022 at 02:09:01AM +0100, Bryan O'Donoghue wrote:
> Add msm8939 a derivative SoC of msm8916. This SoC contains a number of key
> differences to msm8916.
> 
> - big.LITTLE Octa Core - quad 1.5GHz + quad 1.0GHz
> - DRAM 1x800 LPDDR3
> - Camera 4+4 lane CSI
> - Venus @ 1080p60 HEVC
> - DSI x 2
> - Adreno A405

Since most of these differences should be comparatively minor in the
device tree, would it make sense to have the common parts shared in
a .dtsi? I'm not sure myself, I suppose there are still quite some
special cases that only become visible if you take a closer look.

However, if we're keeping msm8916.dtsi and msm8939.dtsi separate we
should try to keep them consistent at least. It looks like you derived
this from msm8916.dtsi at some point, but did not apply the changes and
fixes made upstream after that. :)

Can you look through recent changes made to msm8916.dtsi [1] and
consider making them for msm8939.dtsi as well? From a quick look through
the diff below there are at least the following commits:

  - e6717dbaef63 ("arm64: dts: qcom: msm8916: avoid using _ in node names")
  - 38a4d932f70a ("arm64: dts: qcom: msm8916: move gpu opp table to gpu node")
  - 2329e5fb54d7 ("arm64: dts: qcom: msm8916: Add more labels")
    (Note the &otg -> &usb in this commit, to allow grouping with sorted nodes)
  - bfd5d21abcd5 ("arm64: dts: qcom: msm8916: Move common USB properties to msm8916.dtsi")
    (You don't use these properties but I'm pretty sure 8939 needs them)
  - 027cca9eb5b4 ("arm64: dts: qcom: msm8916: Fix MDP/DSI interrupts")
  - ... actually almost all changes to msm8916.dtsi made after those
    see [1]

Several of them fix issues Krzysztof already mentioned. Some are even
functional fixes. :)

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/arch/arm64/boot/dts/qcom/msm8916.dtsi

> - WiFi wcn3660/wcn3680b 802.11ac

There are some MSM8916 devices with WCN3660B or WCN3680B, and there are
MSM8939 devices with WCN3620. I don't think this is an actual difference.
(Could just drop this line :))

> [...]
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

While I would appreciate having consistent licensing for the DT files,
this is clearly derived from msm8916.dtsi which is GPL-2.0-only. Sadly
I don't think we can simply change the license of it without asking all
contributors. :(

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

Hm, SPDX says BSD-3-Clause but this says GPL-2.0-only? We have SPDX only
in most files now.

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

All boards should override this, so you might as well drop it here.

> + [...]
> +		idle-states {
> +			CPU_SPC: spc {
> +				compatible = "arm,idle-state";

This should be compatible = "qcom,idle-state-spc" if you want to use
cpuidle-qcom-spm (which is strictly speaking not currently supported
for arm64).

> +				arm,psci-suspend-param = <0x40000002>;

This is strange (and unneeded) considering that PSCI is not supported.

> +				entry-latency-us = <130>;
> +				exit-latency-us = <150>;
> +				min-residency-us = <2000>;
> +				local-timer-stop;
> +			};
> +		};
> +	};
> + [...]
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};

Hm, I'd expect GIC_CPU_MASK_SIMPLE(8) here considering you have 8 cores.

> + [...]
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		qfprom_cpr: qfprom_cpr@58000 {
> +			compatible = "qcom,qfprom";
> +			reg = <0x00058000 0x1000>;

It's quite confusing that the qfprom is once defined on 0x58000 ("raw
region") and then again later on 0x5c000 ("corrected region"). The
APQ8016E TRM is quite clear that the "corrected" one should be used for
reading, and the raw region is just for programming and verification.

I think when I tried setting up CPR on MSM8916 I simply added the nodes
to the existing qfprom@5c000 and it worked just fine (all the values
were correct).

> + [...]
> +		apps_iommu: iommu@1ef0000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			#iommu-cells = <1>;
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

AFAIK MSM8939 doesn't have the funny "interrupt aggregation" built
around the SMMU, it should have dedicated interrupt numbers for all
context banks. Guessing from downstream (msm8939-iommu.dtsi cross
referenced with msm-iommu-v2.dtsi) this should be GIC_SPI 58.

> +			};
> +
> +			/* venus_ns: */
> +			iommu-ctx@5000 {
> +				compatible = "qcom,msm-iommu-v1-sec";
> +				reg = <0x5000 0x1000>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;

... and this GIC_SPI 60.

> +			};
> +		};
> + [...]
> +		pronto: wcnss@a204000 {
> + [...]
> +			iris {
> +				compatible = "qcom,wcn3660";
> +

I'm pretty sure all 8916-related devices should use one of the following:

- WCN3620
- WCN3660**B**
- WCN3680(B?)

All of these have the same voltage requirements, but WCN3660 (without B)
has different ones.

Should this be "qcom,wcn3660b"?

Personally I would set "qcom,wcn3620" by default (like in msm8916.dtsi).
There are some MSM8939 with WCN3620 as well and that way it's more obvious
in which cases it needs to be overridden in the board dts.

That's it for now, thanks again for all your effort to upstream this
platform!

Stephan
