Return-Path: <linux-arm-msm+bounces-4850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586D813E4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 00:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B576C2820D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 23:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15062DB66;
	Thu, 14 Dec 2023 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FucQ5lx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AEB6C6EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50bf4f97752so49300e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702596839; x=1703201639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MOPVtivbJXEovKvjd/c9RVV/5FKLHB9dKwJGQ2mAJU4=;
        b=FucQ5lx9uvvIiLN7FgSxoPMispuqKXjLqd/aa91wpU6/AG63uhy82I878FZIDiE4lt
         2ekSaU+DMTqJrN0M9G72zceHKBodU8T0L3UAS00fWXEwO1wv+Wa5Qxjebv8nELIXVCOh
         +gvX3bG36fiXwRkbPd5JBoaCPsJN4Wjj2PDLA4kcZ0EUwo/SHnspRGCU9bPBUqMU6wVl
         9amNoNaGV2fASwee+blbF8G+uwgDM+LyuIVuQO/j6t2uU7jpXl00GNqEaXk5KPo8A9vd
         WK3DJkDeYSCJVQJ1ArdBW9b5c7NcfcWbjlkDHWSIHmSS5EJk8uJSPm/DVDu1POgnpGUe
         0xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702596839; x=1703201639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOPVtivbJXEovKvjd/c9RVV/5FKLHB9dKwJGQ2mAJU4=;
        b=Snx21GaJGaM0RdleEfdgBycbxHFTSaUIr55RzPTWAlrgpxPQtKaRyCh7vLf60xZBDk
         ataJNLJoWgsQTLIl1jkcqOIb9EgxEuZ5oK01DLfYQZA8hjz2LuWp5kOS/rBoqikoZ2Gk
         UryLB8tyA6sCX7MLosdU3PeWH3y87UcFlmSMseCEe8pVQRcPmcImzdNZy2WyD2uVYn7f
         s2PT0nzac0h70HRfn0f7rk8aOZ2W+VRXuOgFNFCjm4ezC9W2y8DT+C85zqUHtF+0xtKL
         ej9X207Q4bPmZaqt5nAL3U/TswwuYeLia+SMs8zv2S1S9TWIgnxf+fKP9VlCy42HA/Xb
         RueA==
X-Gm-Message-State: AOJu0YwsQAEfLvlZk5+u/9DYHLsKl1xjnGIa85SL9NLvQ/RjO9kbR5gB
	YJSoTR0s/ztVEkIdHqm5zfMvog==
X-Google-Smtp-Source: AGHT+IHesYVTjesNoJaPcv4xPErzKm8Fnr3IMOlvXWerPU86Yd/hJDSPZ15AdJ4AVyV2PSALV0hjhw==
X-Received: by 2002:a05:6512:220f:b0:50e:1bf3:62fc with SMTP id h15-20020a056512220f00b0050e1bf362fcmr851485lfu.97.1702596838740;
        Thu, 14 Dec 2023 15:33:58 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z15-20020a195e4f000000b0050be0049075sm2016600lfi.251.2023.12.14.15.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 15:33:58 -0800 (PST)
Message-ID: <7d90a4d3-9108-44e3-8398-ba1ac2b599ca@linaro.org>
Date: Fri, 15 Dec 2023 00:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e80100: Add more support
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20231215-x1e80100-dts-missing-nodes-v3-0-c4e8d186adf2@linaro.org>
 <20231215-x1e80100-dts-missing-nodes-v3-1-c4e8d186adf2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231215-x1e80100-dts-missing-nodes-v3-1-c4e8d186adf2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/14/23 23:48, Abel Vesa wrote:
> Add nodes for the following:
> - ADSP and CDSP
> - IPCC
> - USB SubSys 0, 1 and 2 (along with the PHYs)
> - PCIe 4 and 6 and related PHYs
> - DISP, GPU, TCSR and CAM clock controllers
> - AOSS QMP
> - Display controllers (along with the PHYs)
> 
> Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
[...]

> +
> +			interrupts-extended = <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 10 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 57 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 58 IRQ_TYPE_LEVEL_HIGH>;
the interrupt types seem wrong (ss vs dp/dm lvl vs edge, looks like a
cut-n-paste reordering mistake)

btw the edge-triggered ones should be _BOTH, see Johan's
recent treewide cleanups
[...]

> +			usb_2_dwc3: usb@a200000 {
> +				compatible = "snps,dwc3";
> +				reg = <0 0x0a200000 0 0xcd00>;
> +				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x14e0 0x0>;
> +				phys = <&usb_2_hsphy>;
> +				phy-names = "usb2-phy";
maximum-speed = "high-speed"

would be fitting here as well
[...]

> +			interrupts-extended = <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 61 IRQ_TYPE_EDGE_RISING>;
edges
[...]

> +			interrupts-extended = <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 11 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 60 IRQ_TYPE_EDGE_RISING>;
edges
[...]

> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,x1e80100-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
no -names?

> +
> +			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK_SRC>;
> +			assigned-clock-parents = <&dispcc DISP_CC_PLL0>;
raised eyebrow emoji - why would this be necessary?

> +
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
QCOM_ICC_TAG_ALWAYS

[...]

> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
I was wondering why we keep copypasting this.. the clk driver only
support this single frequency, can it be dropped?

[...]

> +					opp-514000000 {
> +						opp-hz = /bits/ 64 <514000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
Is there no 575MHz level?

[...]

> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,x1e80100-dispcc";
> +			reg = <0 0x0af00000 0 0x20000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&gcc GCC_DISP_AHB_CLK>,
> +				 <&sleep_clk>,
> +				 <0>, /* dsi0 */
> +				 <0>,
> +				 <0>, /* dsi1 */
> +				 <0>,
> +				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp0 */
> +				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>, /* dp0 */
> +				 <0>, /* dp1 */
> +				 <0>,
> +				 <0>, /* dp2 */
should these not be filled out as well?

usb1_ss1_qmpphy

and

mdss_dp2_phy

respectively, I think?

> +				 <0>,
> +				 <&mdss_dp3_phy 0>, /* dp3 */
> +				 <&mdss_dp3_phy 1>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
[...]

> +
> +			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
One a line? :(


Konrad

