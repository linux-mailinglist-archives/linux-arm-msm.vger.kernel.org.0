Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C696DE40C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfJUFwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:52:12 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:45258 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfJUFwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:52:12 -0400
Received: by mail-pf1-f171.google.com with SMTP id y72so7675604pfb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tx2RUml+L9AKbZcfuDglxT3Q6cbUe+eBS3onRU57gtM=;
        b=lVrD0fraI09mw9Q2Y+TROypSbF0YLVdG7ga+a2DXaH1JiNQxDCjRLpkKCRlf8OgSeD
         QAfl9lRQgSTbFrxhoxYdQbrQQrwF2Su5qoyQvsyRpY5wWq3/Ab9MDJvIiG+anUZFkEio
         0mcqm8vb40zbgr8kUitUs7nQAAs1DzPZGmhXh2b7A4TWchhfsBrCVPyBM06bVR7FQU6D
         VBAnwO9m8RDAB7kFIsz0I62LgKz8sadVCA06WMyK0Z73bvv/QR5AsyTcmPbH0z/5itk4
         kFEJa3mf/ZJGCtq1FORILGpHfqFKGHn+a5oc03k+3gFOFsrgodSGuC8kYH6aL1nTAi2M
         9uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tx2RUml+L9AKbZcfuDglxT3Q6cbUe+eBS3onRU57gtM=;
        b=iRtG/TGiLRbxcXmXkarvhXlITvf7whgyUNGU7c8t8+TtpSJdxmoSYJ/ZiIHbgd21dl
         5IvlY3H9nJh2vS/I+XXyE0FoJI0os3cOBBburHBUrAKGBR+UjcvqxApW5IBWCcRK+NPK
         fC0z0vEYJkp6BpR7PUJJ6Mb0Fy/TXZK66zXCRPl/aM57gKYrpPC27XhyzVvY+lDlCet9
         8n7teK5xyizp6sKzjL9n1PMlLWb+UqAa9jiwRsdoGWjiygNXJ5/FHO1LFSM2QuvGH44R
         E74h91hbL8rj0lmzeGQ/2DXuxXqteWa3xVp240pcE95RzU9lbVY/Y30u52NKKO2zSKHY
         aTjw==
X-Gm-Message-State: APjAAAXIRmY5WZ5agTYnA1cgwDPyokyOORtbLEohkAuBjlXDhIhYRYg7
        9fzlE8jm5k01j+2R2+EDaLYaDw==
X-Google-Smtp-Source: APXvYqywEDFfGCFBGFVpqzGmlMHf6OCuVJQpK1N8VsqVKGoXsBLgJyNQ9kJkOfIEEMNTzwGW33WYOA==
X-Received: by 2002:a17:90a:bf8d:: with SMTP id d13mr27297609pjs.89.1571637131057;
        Sun, 20 Oct 2019 22:52:11 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k17sm16355277pgh.30.2019.10.20.22.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:52:10 -0700 (PDT)
Date:   Sun, 20 Oct 2019 22:52:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ccross@android.com, mark.rutland@arm.com, robh+dt@kernel.org,
        agross@kernel.org, marijns95@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add MSM8976 SoC support dts files
Message-ID: <20191021055207.GJ4500@tuxbook-pro>
References: <20191020150746.64114-1-kholk11@gmail.com>
 <20191020150746.64114-5-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020150746.64114-5-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 20 Oct 08:07 PDT 2019, kholk11@gmail.com wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
> new file mode 100644
> index 000000000000..1abeba8b8d18
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
> @@ -0,0 +1,2119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
> + */
> +
> +&tlmm {

Please inline this in msm8974.dtsi, it makes it easier to find nodes
than when they are sprinkled in various *pins.dtsi files.


Note also that a lot of these configs are specific to loire, rather than
msm8976. So preferably they should be specified there instead of in the
platform.

> +	cdc_reset_ctrl {
> +		cdc_reset_line_sus: cdc_reset_sleep {
> +			mux {

You don't have to split mux and config into subnodes (you don't even
need the last level subnode anymore)...

> +				pins = "gpio133";
> +				function = "gpio";
> +			};
> +			config {
> +				pins = "gpio133";
> +				drive-strength = <16>;
> +				bias-disable;
> +				output-low;
> +			};
> +		};
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
[..]
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm";

Please add a more specific compatible as well.

> +			clocks = <&gcc GCC_CRYPTO_CLK>,
> +				 <&gcc GCC_CRYPTO_AXI_CLK>,
> +				 <&gcc GCC_CRYPTO_AHB_CLK>;
> +			clock-names = "core", "bus", "iface";
> +			#reset-cells = <1>;
> +
> +			qcom,dload-mode = <&tcsr 0x6100>;
> +		};
> +	};
[..]
> +	smd {
> +		compatible = "qcom,smd";
> +
> +		rpm {
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +			qcom,ipc = <&apcs 8 0>;
> +			qcom,smd-edge = <15>;
> +
> +			rpm_requests {
> +				compatible = "qcom,rpm-msm8976";
> +				qcom,smd-channels = "rpm_requests";
> +
> +				rpmcc: qcom,rpmcc {
> +					compatible = "qcom,rpmcc-msm8976";
> +					#clock-cells = <1>;
> +				};
> +
> +				rpmpd: power-controller {
> +					compatible = "qcom,msm8976-rpmpd";
> +					#power-domain-cells = <1>;
> +					operating-points-v2 = <&rpmpd_opp_table>;
> +				};
> +
> +				smd_rpm_regulators: pm8950-regulators {

We've seen several times before where devices of a specific platform
comes with different set of pmics, so please omit the pmic configuration
from msm8976.dtsi, give rpm_requests a label and add these regulators in
the loire.dtsi

> +					compatible = "qcom,rpm-pm8950-regulators";
> +
> +					pm8950_s1: s1 {};
> +					pm8950_s2: s2 {};
> +					pm8950_s3: s3 {};
> +					pm8950_s4: s4 {};
> +					pm8950_s5: s5 {};
> +					pm8950_s6: s6 {};
> +
> +					pm8950_l1: l1 {};
> +					pm8950_l2: l2 {};
> +					pm8950_l3: l3 {};
> +					pm8950_l4: l4 {};
> +					pm8950_l5: l5 {};
> +					pm8950_l6: l6 {};
> +					pm8950_l7: l7 {};
> +					pm8950_l8: l8 {};
> +					pm8950_l9: l9 {};
> +					pm8950_l10: l10 {};
> +					pm8950_l11: l11 {};
> +					pm8950_l12: l12 {};
> +					pm8950_l13: l13 {};
> +					pm8950_l14: l14 {};
> +					pm8950_l15: l15 {};
> +					pm8950_l16: l16 {};
> +					pm8950_l17: l17 {};
> +					pm8950_l18: l18 {};
> +					pm8950_l19: l19 {};
> +					pm8950_l20: l20 {};
> +					pm8950_l21: l21 {};
> +					pm8950_l22: l22 {};
> +					pm8950_l23: l23 {};
> +				};
> +			};
> +		};
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		tcsr_mutex_regs: syscon@1905000 {
> +			compatible = "syscon";
> +			reg = <0x1905000 0x20000>;

Please pad the address to 8 digits (to make it easier for me to see if
things are sorted) and please sort all nodes based on address and then
by name.

> +		};
[..]
> +		smsm {

Non-mmio nodes should not live under /soc, please move them to /.

> +			compatible = "qcom,smsm";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			qcom,ipc-1 = <&apcs 8 12>;
> +			qcom,ipc-2 = <&apcs 8 9>;
> +			qcom,ipc-3 = <&apcs 8 18>;
> +
> +			apps_smsm: apps@0 {
> +				reg = <0>;
> +				#qcom,smem-state-cells = <1>;
> +			};
> +
> +			hexagon_smsm: hexagon@1 {
> +				reg = <1>;
> +				interrupts = <0 290 IRQ_TYPE_EDGE_RISING>;
> +
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};
> +
> +			wcnss_smsm: wcnss@6 {
> +				reg = <6>;
> +				interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
> +
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};
> +		};
[..]
> +
> +		hexagon@4080000 {

remoteproc@4080000

> +			compatible = "qcom,q6v5-pil";
> +			reg = <0x04080000 0x100>,
> +			      <0x04020000 0x040>;
> +
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc 0 293 1>,
> +					      <&adsp_smp2p_in 0 0>,

The compatible indicates that this is the modem, but this says "adsp".
Can you please confirm the Hexagon configuration on this platform?

> +					      <&adsp_smp2p_in 2 0>,
> +					      <&adsp_smp2p_in 1 0>,
> +					      <&adsp_smp2p_in 3 0>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +

Regards,
Bjorn
