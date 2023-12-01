Return-Path: <linux-arm-msm+bounces-2884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CD800C59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 14:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FF528118F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 13:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799592554D;
	Fri,  1 Dec 2023 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IAmDk8Mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482A710F8;
	Fri,  1 Dec 2023 05:40:49 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1BHMNS020177;
	Fri, 1 Dec 2023 13:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CkGWBcHneCmd2qfceAP+MTCrLIRQFrXItDvan7l6pD0=;
 b=IAmDk8MhLrDXPneX6S98BKEa7zFVYg2QLHNqI5X8Vt99l0zsMOoUVPv1i83bVq2GCtmV
 U57wihOY3LIBlTX/C/1/5BEnnk0PSHpUzADqCVlb0Aiief3FdL0vFvJTdXQgQm5tZHE2
 oLMIV6BnLMHb5ifYoBjnjGkjTEsW8ftxdFP7aegfU1UHemMGT8AHcFB52zu+K0SH2PV9
 jXhfAQhjCReLeFk+OELIpm6ol/8JqBa2akis+pss4LPuRKpdYcfzIuIx93YdIH+IYwc7
 2oBnvlzHcz14mZopR+GlhNDig1F9wFqfEkNfwVlA8hZAhRA11fMgijbmU4S10Oo7/lPa Fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2htu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:40:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1DeiSi016470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 13:40:44 GMT
Received: from [10.216.10.184] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 05:40:41 -0800
Message-ID: <93419ba3-851c-48ab-828d-0d68b2cf45d4@quicinc.com>
Date: Fri, 1 Dec 2023 19:10:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add few more reserved memory
 regions
Content-Language: en-US
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231025-ipq5018-misc-v1-1-7d14fde97fe7@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20231025-ipq5018-misc-v1-1-7d14fde97fe7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h_MCj--EuQUd_TuhAPJTo5VDvwjdkbA_
X-Proofpoint-ORIG-GUID: h_MCj--EuQUd_TuhAPJTo5VDvwjdkbA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_11,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=631 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010093



On 10/25/2023 10:12 PM, Kathiravan Thirumoorthy wrote:
> Like all other IPQ SoCs, bootloader will collect the system RAM contents
> upon crash for the post morterm analysis. If we don't reserve the memory
> region used by bootloader, obviously linux will consume it and upon next
> boot on crash, bootloader will be loaded in the same region, which will
> lead to loose some of the data, sometimes we may miss out critical
> information. So lets reserve the region used by the bootloader.
> 
> Similarly SBL copies some data into the reserved region and it will be
> used in the crash scenario. So reserve 1MB for SBL as well.
> 
> While at it, enable the SMEM support along with TCSR mutex.


Gentle Reminder...

> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 0b739077ed70..6fbdac7a73f5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -82,6 +82,24 @@ reserved-memory {
>   		#size-cells = <2>;
>   		ranges;
>   
> +		bootloader@4a800000 {
> +			reg = <0x0 0x4a800000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		sbl@4aa00000 {
> +			reg = <0x0 0x4aa00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		smem@4ab00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x4ab00000 0x0 0x100000>;
> +			no-map;
> +
> +			hwlocks = <&tcsr_mutex 3>;
> +		};
> +
>   		tz_region: tz@4ac00000 {
>   			reg = <0x0 0x4ac00000 0x0 0x200000>;
>   			no-map;
> @@ -142,6 +160,12 @@ gcc: clock-controller@1800000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		tcsr_mutex: hwlock@1905000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x01905000 0x20000>;
> +			#hwlock-cells = <1>;
> +		};
> +
>   		sdhc_1: mmc@7804000 {
>   			compatible = "qcom,ipq5018-sdhci", "qcom,sdhci-msm-v5";
>   			reg = <0x7804000 0x1000>;
> 
> ---
> base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
> change-id: 20231025-ipq5018-misc-414b32eed881
> 
> Best regards,

