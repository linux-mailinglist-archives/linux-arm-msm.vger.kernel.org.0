Return-Path: <linux-arm-msm+bounces-43864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D2A008A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DE4F7A03F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D2C1FA141;
	Fri,  3 Jan 2025 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h6haE6Vm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063F1F9EDD;
	Fri,  3 Jan 2025 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903877; cv=none; b=PofrTjiBta+wCP9CLDxXyWdDQeJWE1bngD1PztHNFy+1waQMVAiWx8SlgW7WKOgD8Rz2HVh+UkIs36aCt++HCwKuwLH5IAV4kl5srjcFf/k5G3zAjPfRc5Wukg/BWdWsgWsB1kUvi1Mc1esZX0Khqq97SQ11oxc/WsQGa7m8E0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903877; c=relaxed/simple;
	bh=0+ozam8WAybk09bC9/p4COiu/dzwigHmrq0+jpv8kdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LJvQkCn+HokRUa4kFaTdkFfDPh4P7ZYpfuCfFpq+5OVtadSEX7Uv0Ue4Yky9JpnC1jxJmXkvLpkB8ACojVgg7UF1qGOMsJQkWsj9D56e4+kGMlfU/+i/Oi+qP9gj3/46wMWukd4iPN/wNtrESMroMiEsZpbx5r54zCztN7S+Gaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h6haE6Vm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50394qLg012902;
	Fri, 3 Jan 2025 11:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gyi873BfSAb1Vp4BsSQwG2l/iV6Bt9KwsiFhfCyZNwg=; b=h6haE6Vmu7Yq1DDr
	g/qmuh2wsuGw6MXXGv5ySZXrH025oMsGQ/bSXFUhg5Es/lKKSQ4+p4U4uDSItYAz
	Htgx/VWBbnAnD+L+XLGDzoBvzLCZoUR+OD2/JEtzVHVuPBOdBTmeC8cdi4JZgywC
	PDCqf3umGt5kOUPTVY0nx2zGg5MEQabEeS0ymeWmSwBUIl+LunYR495UTHv6KVnm
	Z+bWqYARcH6fqAqKdpOgIqxi6P7MccbEiRifRkkJfRcid2wQ/mB5rEUR//sxFwqB
	kViQ0KiOpHsWcrlka7zchB8NPFaey1X7LFDDOP5W2VB/wDSgFi6wCA1jXMLhe/tY
	DhoNsw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xcxp8a1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 11:31:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503BV7Xw010584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 11:31:07 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 03:31:01 -0800
Message-ID: <2e1cd06b-20c3-476c-a8fa-44f398c39857@quicinc.com>
Date: Fri, 3 Jan 2025 19:30:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
 <9e54c828-0640-462a-9f91-0913504266f2@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <9e54c828-0640-462a-9f91-0913504266f2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ABdBcba2-PAHtgaqJ5ttr7hceQUqYhwq
X-Proofpoint-GUID: ABdBcba2-PAHtgaqJ5ttr7hceQUqYhwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030102



On 12/13/2024 4:07 PM, Krzysztof Kozlowski wrote:
> On 10/12/2024 09:23, Yuanfang Zhang wrote:
>> Add coresight components: Funnel, ETE and ETF for SM8650.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
>> Changes in v2:
>> - Update compatible for funnel and etf.
>> - remove unnecessary property: reg-names and arm,primecell-periphid.
>> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 165 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 165 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 25e47505adcb790d09f1d2726386438487255824..76620d478e872a2b725693dc32364e2a183572b7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5654,6 +5654,171 @@ compute-cb@12 {
>>  				};
>>  			};
>>  		};
>> +
>> +		ete0 {
> 
> ete or ete-0
As node name pattern: "^ete([0-9a-f]+)$" in arm,embedded-trace-extension.yaml,
then name it ete0.
> 
>> +			compatible = "arm,embedded-trace-extension";
>> +
>> +			cpu = <&cpu0>;
>> +			qcom,skip-power-up;
>> +
>> +			out-ports {
>> +				port {
>> +					ete0_out_funnel_ete: endpoint {
>> +						remote-endpoint = <&funnel_ete_in_ete0>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		funnel_ete {
> 
> 
> Follow DTS coding style. Don't send us your downstream code.
> 
>> +			compatible = "arm,coresight-static-funnel";
>> +
>> +			in-ports {
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					funnel_ete_in_ete0: endpoint {
>> +						remote-endpoint = <&ete0_out_funnel_ete>;
>> +					};
>> +				};
>> +			};
>> +
>> +			out-ports {
>> +				port {
>> +					funnel_ete_out_funnel_apss: endpoint {
>> +						remote-endpoint = <&funnel_apss_in_funnel_ete>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		funnel@13810000 {
> 
> This is all wrongly placed. And tools would tell you that. But anyway,
> do not introduce different style. Look how all other nodes are placed.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
Done.
> 
> 
> 
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +			reg = <0x0 0x13810000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					funnel_apss_in_funnel_ete: endpoint {
>> +						remote-endpoint = <&funnel_ete_out_funnel_apss>;
>> +					};
>> +				};
>> +			};
>> +
>> +			out-ports {
>> +				port {
>> +					funnel_apss_out_funnel_in1: endpoint {
>> +						remote-endpoint = <&funnel_in1_in_funnel_apss>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		funnel@10042000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +			reg = <0x0 0x10042000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
>> +				port@4 {
>> +					reg = <4>;
>> +
>> +					funnel_in1_in_funnel_apss: endpoint {
>> +						remote-endpoint = <&funnel_apss_out_funnel_in1>;
>> +					};
>> +				};
>> +			};
>> +
>> +			out-ports {
>> +				port {
>> +					funnel_in1_out_funnel_qdss: endpoint {
>> +						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		funnel@10045000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +			reg = <0x0 0x10045000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					funnel_qdss_in_funnel_in1: endpoint {
>> +						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
>> +					};
>> +				};
>> +			};
>> +
>> +			out-ports {
>> +				port {
>> +					funnel_qdss_out_funnel_aoss: endpoint {
>> +						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		funnel@10b04000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +			reg = <0x0 0x10b04000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
Done.
> 
>> +				port@7 {
>> +					reg = <7>;
>> +
>> +					funnel_aoss_in_funnel_qdss: endpoint {
>> +						remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
>> +					};
>> +				};
>> +			};
>> +
> Best regards,
> Krzysztof


