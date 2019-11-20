Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECACE1031B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 03:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfKTCmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 21:42:38 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41898 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbfKTCmi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 21:42:38 -0500
Received: by mail-pl1-f194.google.com with SMTP id d29so13064240plj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 18:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mggnajP13wzBYKAf4NRlJn7XcuAgzkajLKaALOK2EHg=;
        b=RMhW35COKLndMxJnzbK/pB1itPT/g5K3UnnQge1Sb4ac5dPhQoG2Sr8wPZuv6idE9o
         7UfVzHkxrkD7/b/+7dZ/fhxDHmR3s2cr56tKp309JnEXILFaZtJHwahznh1zfMJpS1Hn
         n/ZJUBweA0l6aMk2+ElEv6C/PAAlP71vbuV2ABjfGTujE4fH8vWMdVZNXTVIbK6IGIpo
         UzUhk6Dlvt3WwmrsK04C8QN15hl9mzckFLExXuFDvRjMigqJo9l848EtKuMoAeggCj/8
         40R7cZS/36PhGIWBMxLahBUTpPk4XQsAkKaqVLZhqQDRYNFfHZ9RAAlWN9OFN63Za8B2
         mAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mggnajP13wzBYKAf4NRlJn7XcuAgzkajLKaALOK2EHg=;
        b=oSyzIFCBtBQc1WaYW7ikhcPkld0cLVkMCOrDWm7ZjByg4QUL4beH+UEoRl/ugp2kyu
         lntvIBa2HdonoWHfSfvD0u1QuzuDIu7NWt3ObCZfD/s5sYlF0mYdl97jJT//pErA0YuV
         EpAcNiIMUwMuPgIPyWuCfTjGy4EFBZ3NSxgFi8q/RUJbFy7fL6qeMzdJvM2ONR70lxoo
         D0FugdivUz/7sn9VU3wCfWuCFSXCLoNcN/p8m0Xx8uCX/jtOEHnFlga8hl8S7byx11rL
         /lXbq6ZjOif/AAs+qUnmWPGS1BrTbwo2dGrpJKVh1BCcDpuwEOp5JT4exslFJkSlde3N
         c/nQ==
X-Gm-Message-State: APjAAAUSOjqtPmRNK3ZTq+45I7XvmATcSO+RGgZ2eOw/iJlLIWhyn9eB
        RH7ORi81cHrj0y3CDmSU5AYk2Q==
X-Google-Smtp-Source: APXvYqzh+9xJhLTKFMGQB/YTDSs97B4ZDLhpNLpBLs1QomNcNl4KZ8TCvqacQTG2MWoHKABUH/aUrg==
X-Received: by 2002:a17:90a:195e:: with SMTP id 30mr1015734pjh.60.1574217756947;
        Tue, 19 Nov 2019 18:42:36 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm29262566pfa.150.2019.11.19.18.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:42:36 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:42:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, ulf.hansson@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: power: avs: Add support for CPR
 (Core Power Reduction)
Message-ID: <20191120024233.GQ18024@yoga>
References: <20191119154621.55341-1-niklas.cassel@linaro.org>
 <20191119154621.55341-2-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119154621.55341-2-niklas.cassel@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Nov 07:46 PST 2019, Niklas Cassel wrote:

> Add DT bindings to describe the CPR HW found on certain Qualcomm SoCs.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes since v5:
> -None
> 
>  .../bindings/power/avs/qcom,cpr.txt           | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> new file mode 100644
> index 000000000000..ab0d5ebbad4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> @@ -0,0 +1,130 @@
> +QCOM CPR (Core Power Reduction)
> +
> +CPR (Core Power Reduction) is a technology to reduce core power on a CPU
> +or other device. Each OPP of a device corresponds to a "corner" that has
> +a range of valid voltages for a particular frequency. While the device is
> +running at a particular frequency, CPR monitors dynamic factors such as
> +temperature, etc. and suggests adjustments to the voltage to save power
> +and meet silicon characteristic requirements.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: should be "qcom,qcs404-cpr", "qcom,cpr" for qcs404
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address and size of the rbcpr register region
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the CPR interrupt
> +
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: phandle to the reference clock
> +
> +- clock-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "ref"
> +
> +- vdd-apc-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: phandle to the vdd-apc-supply regulator
> +
> +- #power-domain-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: should be 0
> +
> +- operating-points-v2:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: A phandle to the OPP table containing the
> +		    performance states supported by the CPR
> +		    power domain
> +
> +- acc-syscon:
> +	Usage: optional
> +	Value type: <phandle>
> +	Definition: phandle to syscon for writing ACC settings
> +
> +- nvmem-cells:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: phandle to nvmem cells containing the data
> +		    that makes up a fuse corner, for each fuse corner.
> +		    As well as the CPR fuse revision.
> +
> +- nvmem-cell-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: should be "cpr_quotient_offset1", "cpr_quotient_offset2",
> +		    "cpr_quotient_offset3", "cpr_init_voltage1",
> +		    "cpr_init_voltage2", "cpr_init_voltage3", "cpr_quotient1",
> +		    "cpr_quotient2", "cpr_quotient3", "cpr_ring_osc1",
> +		    "cpr_ring_osc2", "cpr_ring_osc3", "cpr_fuse_revision"
> +		    for qcs404.
> +
> +Example:
> +
> +	cpr_opp_table: cpr-opp-table {
> +		compatible = "operating-points-v2-qcom-level";
> +
> +		cpr_opp1: opp1 {
> +			opp-level = <1>;
> +			qcom,opp-fuse-level = <1>;
> +		};
> +		cpr_opp2: opp2 {
> +			opp-level = <2>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp3: opp3 {
> +			opp-level = <3>;
> +			qcom,opp-fuse-level = <3>;
> +		};
> +	};
> +
> +	power-controller@b018000 {
> +		compatible = "qcom,qcs404-cpr", "qcom,cpr";
> +		reg = <0x0b018000 0x1000>;
> +		interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&xo_board>;
> +		clock-names = "ref";
> +		vdd-apc-supply = <&pms405_s3>;
> +		#power-domain-cells = <0>;
> +		operating-points-v2 = <&cpr_opp_table>;
> +		acc-syscon = <&tcsr>;
> +
> +		nvmem-cells = <&cpr_efuse_quot_offset1>,
> +			<&cpr_efuse_quot_offset2>,
> +			<&cpr_efuse_quot_offset3>,
> +			<&cpr_efuse_init_voltage1>,
> +			<&cpr_efuse_init_voltage2>,
> +			<&cpr_efuse_init_voltage3>,
> +			<&cpr_efuse_quot1>,
> +			<&cpr_efuse_quot2>,
> +			<&cpr_efuse_quot3>,
> +			<&cpr_efuse_ring1>,
> +			<&cpr_efuse_ring2>,
> +			<&cpr_efuse_ring3>,
> +			<&cpr_efuse_revision>;
> +		nvmem-cell-names = "cpr_quotient_offset1",
> +			"cpr_quotient_offset2",
> +			"cpr_quotient_offset3",
> +			"cpr_init_voltage1",
> +			"cpr_init_voltage2",
> +			"cpr_init_voltage3",
> +			"cpr_quotient1",
> +			"cpr_quotient2",
> +			"cpr_quotient3",
> +			"cpr_ring_osc1",
> +			"cpr_ring_osc2",
> +			"cpr_ring_osc3",
> +			"cpr_fuse_revision";
> +	};
> -- 
> 2.23.0
> 
