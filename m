Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3BD70A781
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 13:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbjETLXj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 07:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjETLXi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 07:23:38 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44404E4B
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 04:23:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso1360671fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684581814; x=1687173814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2s7Gtyl29+R6k7SctHO7yEqHfmFi4DMefy46IEQT4k=;
        b=H/xkobiJcOs43wwpkwse2e/2yfRa0aPZPjpeaNChqHMVuaMAA0yEfa7aqsQG38niB6
         B1ekT5rfDMIr4fPQmoh7P6RJtgZzz4tPDUsgtWowMGJBh1rLpb9rPXLyLG0bWZNk7Jcz
         omT9kg7xLH/9kjq+SsNkMPMuPMGlhvG+DLMv+CE6Ied4kAuBs4SA3FsdYaKVDS9O5LrK
         Gxr1BlF1IOykE1Nq+mzwbVaUORUDwTEuTmRrqDbrjkSrCiT6KZC2XhnQTb66VNGygSBa
         f1swgFxQhOb8k+GCyphvn6OO46TTtlkR9zwPIGjhd3v0sOSsLL/+0kdy2jUuuf/TFpk8
         GTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684581814; x=1687173814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2s7Gtyl29+R6k7SctHO7yEqHfmFi4DMefy46IEQT4k=;
        b=aBH+SA+EEXg37NreUNYLYmkFMRYT9tjo3dXr045BG8fChAk/bpI58eunLR+1pomSvN
         14w67516GPK3Jvaq6zNIWppKDrutqx/x152IjLw1EVLSaO+HjtL69MQeCa3Ygq7/gMxl
         sOmMUFR7jwMQLKugydmjV4YvEKQiLdaatVtb6KZZS527Pncl9xRcqC4MDLXvu8+W3kLp
         fTAVRBy6iQC1nytDm95SlbwLZr7fCMO1PPenNrm0IptVYuJ5CeBWPywgUteMn/AMIclZ
         0iznK90DLOsBmmKe2ibaS/iEMrmxQdoDbcb3qEHh7cjs8SURkhX8eWXe/yxChuF8AbNO
         P2fQ==
X-Gm-Message-State: AC+VfDxMNhsvVWkS1EvrixHCvueM3xQr8Zmb+i9eXFkQXPsGQD39iPKd
        CyiE6QrriP26hkh8vpKNuyPOQ7VX1AH7wyHVxMQ=
X-Google-Smtp-Source: ACHHUZ5u6AMNr/IITwEXJbQ6TENUVIXCoq8My3iT1hp+OjnGJ/xafuBlQp3h+MtmqbjYQF3mv2HooA==
X-Received: by 2002:ac2:4197:0:b0:4f2:4f26:3e5a with SMTP id z23-20020ac24197000000b004f24f263e5amr1764449lfh.41.1684581814480;
        Sat, 20 May 2023 04:23:34 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id q10-20020a19a40a000000b004edd2dc9a09sm231449lfc.258.2023.05.20.04.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 May 2023 04:23:33 -0700 (PDT)
Message-ID: <d606960d-8e0a-611b-579c-c49b5b970462@linaro.org>
Date:   Sat, 20 May 2023 13:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] arm: dts: qcom: qdu1000: Add SDHCI node
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230519085122.15758-1-quic_kbajaj@quicinc.com>
 <20230519085122.15758-3-quic_kbajaj@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230519085122.15758-3-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.05.2023 10:51, Komal Bajaj wrote:
> Add sdhc node for eMMC on QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 60 +++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 734438113bba..6113def66a08 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -19,6 +19,10 @@
> 
>  	chosen: chosen { };
> 
> +	aliases {
> +		mmc0 = &sdhc_1; /*SDC1 eMMC slot*/
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -842,6 +846,62 @@
>  			#hwlock-cells = <1>;
>  		};
> 
> +		sdhc_1: mmc@8804000 {
> +			compatible = "qcom,qdu1000-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x08804000 0x0 0x1000>,
> +			      <0x0 0x08805000 0x0 0x1000>;
> +
confusing newline
> +			reg-names = "hc", "cqhci";
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC5_AHB_CLK>,
> +				 <&gcc GCC_SDCC5_APPS_CLK>,
SDCC>5<?

> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "core", "xo";
Please keep one per line

> +
> +			/* Add dt entry for gcc hw reset */
> +			resets = <&gcc GCC_SDCC5_BCR>;
5?

> +
> +			interconnects = <&system_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &system_noc SLAVE_SDCC_2 0>;
> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> +			power-domains = <&rpmhpd QDU1000_CX>;
> +			operating-points-v2 = <&sdhc1_opp_table>;
> +
> +			iommus = <&apps_smmu 0x0080 0x0>;
Please remove the leading zeroes from the stream id


> +			dma-coherent;
> +
> +			bus-width = <8>;


----
> +			non-removable;
> +			supports-cqe;
> +
> +			no-sd;
> +			no-sdio;
> +
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +			cap-mmc-hw-reset;
----
This bit is board-specific

> +
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			status = "disabled";
> +
> +			sdhc1_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-384000000 {
> +					opp-hz = /bits/ 64 <384000000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;
You added interconnects, but not any opp-peak-kBps / opp-avg-kBps,
presumably mistakengly?

Also, 384Mhz + min_svs sounds a bit weird? Is that the correct
level for this SoC?

Konrad
> +				};
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,qdu1000-pdc", "qcom,pdc";
>  			reg = <0x0 0xb220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
> --
> 2.17.1
> 
