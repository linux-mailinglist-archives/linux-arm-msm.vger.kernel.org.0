Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4EC3A732C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 03:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhFOBEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 21:04:52 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:47453 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhFOBEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 21:04:52 -0400
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0BDDA1F960;
        Tue, 15 Jun 2021 03:02:46 +0200 (CEST)
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Add venus DT node
To:     Dikshita Agarwal <dikshita@codeaurora.org>, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1623650391-28144-1-git-send-email-dikshita@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <f78c3873-37aa-c744-6ebd-6595b9f0fbaa@somainline.org>
Date:   Tue, 15 Jun 2021 03:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623650391-28144-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> @@ -850,6 +855,76 @@
>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		venus: video-codec@0aa00000 {

Please remove the leading 0 after the "@" sign



> +			compatible = "qcom,sc7280-venus";
> +			reg = <0 0x0aa00000 0 0xd0600>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
> +			clock-names = "core", "bus", "iface",
> +				      "vcodec_core", "vcodec_bus";
> +
> +			power-domains = <&videocc MVSC_GDSC>,
> +					<&videocc MVS0_GDSC>;
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "venus", "vcodec0", "cx";

Unless there was a newer revision of [1], the cx pd will most likely

be unused due to it not being specified under opp_pmdomain.



> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
> +					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "cpu-cfg", "video-mem";
> +
> +			iommus = <&apps_smmu 0x2180 0x20>,
> +				 <&apps_smmu 0x2184 0x20>;
> +			memory-region = <&video_mem>;
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +
> +			video-firmware {
> +				iommus = <&apps_smmu 0x21a2 0x0>;
> +			};
> +
> +			venus_opp_table: venus-opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz = /bits/ 64 <133330000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-335000000 {
> +					opp-hz = /bits/ 64 <335000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-424000000 {
> +					opp-hz = /bits/ 64 <424000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-460000000 {
> +					opp-hz = /bits/ 64 <460000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};
> +			};
> +
> +		};
>
>
Is there a downstream kernel source available for sc7280 to compare against?

I don't see it in sm8350 releases and it's hard to tell out of thin air what values

should be in there.. Unless qcom decides to share some documentation ;)


Besides that, I don't see the driver part being merged neither in linux-next, nor media-next but I may be looking at the wrong tree.


[1] https://lkml.org/lkml/2021/5/19/364


Konrad

