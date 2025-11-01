Return-Path: <linux-arm-msm+bounces-80011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 07678C285F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 20:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78E3F345017
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 19:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9762FE571;
	Sat,  1 Nov 2025 19:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJXUXhzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOzShlIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE22FDC24
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762024398; cv=none; b=sDCdV3nPcFYb2we7L3FTcLuoNvvHgRE1KWZLiyOBCemC7ONxfFsH/EIEZMP8tmz8vyEU5QUKwGW4k+UzWL6z1pxM+j1heNP03xe2q7LpBEboZWJxTdOpoyv3brsmWp1OtbEz6AghSWZkWDSc9PmJdXXxIbZ11WTvunQJz3kXWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762024398; c=relaxed/simple;
	bh=ree5xBliAPSwH3cLBwb3J183HtAh8bF89iuAXDl0NIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4I+yHeu8w+VjjwJ2DIoATBfWc7VZ7eNUURxRo2G5DjsLwxW4aYgU5zo3yUjtXtAia5PhsMgDfTLxzmKpQaIR4DWraVr+YSLznln496YgCXW5Hq3+Fs+Lwyy0zmLjejElwZNM/0JVwl6OL09Ep5V9Ydv2aMgev6w2EC6F2G0KyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJXUXhzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOzShlIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A1I04QQ2130411
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 19:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KxtwwHqINJC/oT/sgGtlBrT20Bb14bn0iaNhZDPdSs=; b=YJXUXhzV4aF1J1ET
	gzqa1l4zIWe7Pj6se/+ts02Jcdw94tq0F+/PvBjse6MWaCZOB5UvDXoKQWSK1XS1
	PFphagaoTfwFdJNMiu8hNDZz4HV7s2ugeu+UK6fcf7IsDSy8Btxja2ySbBFcZjP8
	OpgmdjkDuVt5knACnMTKJQR7XgEBocS0ovzF3dcNrmATufAEbSo8hzqoQiYHNcV6
	rAfFFCWbIYqW+Vdn00Rqn9mjJc6Q+2T55Ag7g2oo3z6ATXAy4nJt2IsOBVDc3EvC
	88xsx5X2GIVZJ/LU886GXsI8WK69Cx8KbkGfKNLT30ktnsoMMUM46FSRurkau90R
	3p2imQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ae312r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 19:13:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295745a8640so2886775ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762024393; x=1762629193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KxtwwHqINJC/oT/sgGtlBrT20Bb14bn0iaNhZDPdSs=;
        b=BOzShlIzv7hTCbZD3gFX7A2P0KSg3b5TEbguueowLaxBfoIifxQeV9S5FkZM94mtRy
         ljvHLNLZk4C3Z5Td6Z7yMebJ/ulBonSW069cI2sgQExr7yf3JE1VSoluSxBPch89YGFb
         jke+BfTAUhGXapvRUyBMhgdvnQ1InTKeDWlZ3nzp6z98C72eHzjPxFhihh8KOuMzHkwu
         jum24l3gio1qRIGtxmL2MVo8+pNrmhyprMgXLTa6jpPPcMB52ivjWdbtruiEB0czolnq
         7f580g7bNW0i3L01zjt0wqTWP5/X0ag9QOrJN8B9eYvraQ6fVrOzyM2gbq0HbX8LhFbi
         Q7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762024393; x=1762629193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KxtwwHqINJC/oT/sgGtlBrT20Bb14bn0iaNhZDPdSs=;
        b=pVFr9jf1RKIIKcSJiIQhd9LzBzBK7ZwAsWyp7ZSKoVlI8z0DDfsM6P+/M89egWP/V8
         xoq53NAJcVt3CdjA5N5FtijQ+xIusdxrYB+GGfq9BYaW1OZp0OvFLna631lrkObdYHW7
         bz3H+NCzO1JdmyJoiJMW/g2w4qEsywUAuAWXzFjPRl9RSMpQM0pxWshsK/g8XKBroGaA
         FlgIJuRPXv8AcW6bCiqRvDIAbw1fSeJGYZGSSghVmOgFeLoYftdZQykgzSW6eiKaBG2v
         n+oO45hII7FVljVgXDuBQGwttheIp4OA2+6AXTT9HwPqo6YKFgU+ofM8O1LTxBjiVduJ
         W0qw==
X-Gm-Message-State: AOJu0YwpL4JenqScRIWTLF9BMwy4ZeD9Ths3/V3V+UNCI32IzNE9OgLo
	fF0J/+y7CW5LTjx/zveoOZZ+b4dM0On4dV6kNOUT0wJTICWpv8wwINc7IQL4mpXom05PFYNPdIH
	Ptya1LqAxKcblY+JgY9AjXqpGtZn+Mo+jSgWOdaHzJl/HLnfmzk32KSy2MSb73WANBeoO
X-Gm-Gg: ASbGncsU+gbkILbmZsMGYophzetmdL8LzwlpW9q5sS4heM+TNiXrjZV1chUQNDRniHK
	HhFcfiAW0VJyU4jUOlVF36QKtVarkE6hc1MwVhAL3W1CGYVINoeZZnGjOJIdsfg1IwGREYL4hxd
	0AB55Xs/riVZYv6+SF5WS/1r6LOGdU03fgngrDaTZkmcAb3l8p6QNAalSjfSc3MCXxII5W0qrom
	jh+R1IPB84RczETjuB7OQy3YgLz9zYa+0uvYqBDHAYoRkxmviRgnkRTAplUyUMD7wsiZRpaNS/L
	8s9Gf5PkUXjPE/J5pEPGM7oQXmvLnXw68V5BKfIP3tbFwCCQe/96RJL5Onty7850sF6N0S129j0
	KWvfQcWyBEcFNYzj2TKoRoG0=
X-Received: by 2002:a17:902:da89:b0:295:5945:2920 with SMTP id d9443c01a7336-29559452ee2mr32835535ad.34.1762024393253;
        Sat, 01 Nov 2025 12:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUO9pw7Zgswco7QdkHAkcpr4GEgxDLTBLinAsQbpoSb2Ze6bLK2HtFCjzI4dp7VjYDUSva5Q==
X-Received: by 2002:a17:902:da89:b0:295:5945:2920 with SMTP id d9443c01a7336-29559452ee2mr32835275ad.34.1762024392709;
        Sat, 01 Nov 2025 12:13:12 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.233.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340924a0e4bsm5818883a91.1.2025.11.01.12.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 12:13:12 -0700 (PDT)
Message-ID: <f2724aed-c39c-4793-9522-bae08ea97a05@oss.qualcomm.com>
Date: Sun, 2 Nov 2025 00:43:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
 <20251101174437.1267998-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251101174437.1267998-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dmQJ9L8Obmzp1f4obLlRV8neR5wC-_Ee
X-Proofpoint-GUID: dmQJ9L8Obmzp1f4obLlRV8neR5wC-_Ee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDE2NSBTYWx0ZWRfX+Nnf1SXRoPaE
 ByjlwalLfHXjoC5SsadrFHKfyVYJ8QfZ5bzZpL5Xcq9Jdn+HsYd2YjjG85WMKdzLnd3+VRa64Oj
 U/RRpS21FrcnrietXCmTeWpAAAtJGils23CxGv7LMQNfRy6nc7jSLiF5v0fvwocl3vciasK+gp9
 d88eCUvTjB3Y850B7cVCpVMSj88ed5R4Oif+0fDCtv+y2ZHrOg1Ge06BH9GllP9x6wVClK1zEqW
 f/yMefQ/YMGY1gnX+oyW7MqgwrLqH1KtRKl0tqRML0rV8u0J86oy9e3QW7jcKI+cfaDxDbeYbWM
 X5g4aAknhk3l0Jkh2c9tk25CgYIQvr9M4a5ES/ZOGdu820yLJDXno33DADrfq9UYGalbr1jt5wb
 Fp8ilWbTGA0i8mAEEmfpPbv1+99lCQ==
X-Authority-Analysis: v=2.4 cv=CfUFJbrl c=1 sm=1 tr=0 ts=69065bca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=rTtKBu4o5onlnI9juXDqsQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fj3ciZ1XawlKQuAvidcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010165

On 11/1/2025 11:14 PM, Krishna Kurapati wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> SM8750 chipset contains a single DWC3 USB3 controller (rev. 200a), SS
> QMP PHY (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is
> the transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [Konrad: Provided diff to flattened USB node]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 161 ++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index a82d9867c7cb..3f0b57f428bb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
> @@ -635,7 +636,7 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>;
> +				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>  
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> @@ -2581,6 +2582,164 @@ data-pins {
>  			};
>  		};
>  
> +		usb_hsphy: phy@88e3000 {
> +			compatible = "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb: usb@a600000 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>,
> +					       <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;

Probably I am missing something, but which power domain associated to a
rail is scaled to NOM corner here?

-Akhil


