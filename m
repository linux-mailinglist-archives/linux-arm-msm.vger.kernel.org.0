Return-Path: <linux-arm-msm+bounces-45377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AFA14B00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31CD3A04A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A16D1F8688;
	Fri, 17 Jan 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j4LDtScQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B71F7066;
	Fri, 17 Jan 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102017; cv=none; b=W73TLCZ8vZXNvYRnJQKNQs/Aj3Gg13CwhZvZcXjVezBErV6X0zydAbl+sHWEdlbkMRwIeP+t/cbGGLTMuv07VFRIrNHKxGCgi4leNrvdP8MlKAvPPq9dcD2nZiUKALX1HFKvLNdxGFcXQHVaUFG5XTBghjoNzJTftdrbGFc94Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102017; c=relaxed/simple;
	bh=Fzht/0x3CfUwlK4ZIgWLn4V/JPJnQV0tF4I4bN/rX8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S7wgFZHVXBvaUjhS0jXYolYWEiyT/TXYbwlR3ohl7Jcq+GcXIK4cYIdfmEVLeGGgggjjH5mX6hQusv3fR9hNsE981YZg39Ee4ERLvWSWI4kNkHyMHdU5ATq7kHQ6GT5jdpkIhQEef/f163Hq2/seF00stUGAOhy82OBMR2xNV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j4LDtScQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H65XKY007866;
	Fri, 17 Jan 2025 08:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dy0vvBC4ojFN8G898giiC+1hPUPkADL1u6rgBTcq6/k=; b=j4LDtScQrKMNX5cg
	TMFjC6WVGCy4WxFJJhthuYjvAMATLgU+cN3atXejTEnVsKuqTnw4OBXUid4zHmj3
	y6ezchvHFrvbtsoWSVpz/YpYHClytB6qDJ49PQ0TsPjkmp/inYVHKkOIpMuVYERB
	iSyHprusArjmhQevmqO/EV4jZQB/BunbV0LeTixGEn0v8SPPSwlKUZf2kOvdwPXL
	EcBDWXt0baqLYRrTuWdaUBacRXzFU9d8mIAeIqeg/mNvR2jPiV6jdWVeHGumiujr
	RZXIfghYDirsOnoBk4yABpnyETbHPiJl3dg/8DLfatj0f6WIdEQbNwe7lB8hQzb0
	C+JYVQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447hmt8ay6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 08:20:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H8K91H013509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 08:20:09 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 00:20:03 -0800
Message-ID: <28eec718-2950-40b5-b5b7-b4ecb5699a6b@quicinc.com>
Date: Fri, 17 Jan 2025 16:20:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
To: <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
 <be7b0acc-495b-4bb6-91e1-5db8e301503d@linaro.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <be7b0acc-495b-4bb6-91e1-5db8e301503d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 72ZIKS53YurFc1HQmGehOR68oCbftYKz
X-Proofpoint-ORIG-GUID: 72ZIKS53YurFc1HQmGehOR68oCbftYKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=1
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501170065



On 1/16/2025 11:57 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 07/01/2025 09:48, Yuanfang Zhang wrote:
>> Add coresight components: Funnel, ETE and ETF for SM8650.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>> Changes in v4:
>> - Re-sort these nodes by address.
>> - Link to v3: https://lore.kernel.org/r/20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com
>>
>> Changes in v3:
>> - Move ete0 and funnel-ete to /.
>> - Update coding style.
>> - Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com
>>
>> Changes in v2:
>> - Update compatible for funnel and etf.
>> - remove unnecessary property: reg-names and arm,primecell-periphid.
>> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 166 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 25e47505adcb790d09f1d2726386438487255824..49d6567fbd2e68b66b517d8d9180c7443f8bf611 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
>>           };
>>       };
>>   +    ete0 {
>> +        compatible = "arm,embedded-trace-extension";
>> +
>> +        cpu = <&cpu0>;
>> +
>> +        out-ports {
>> +            port {
>> +                ete0_out_funnel_ete: endpoint {
>> +                    remote-endpoint = <&funnel_ete_in_ete0>;
>> +                };
>> +            };
>> +        };
>> +    };
> 
> Why only the cpu0 ete has been added ?
> 
> And why are the other components (TPDA, TPDM, STM, CTI...) missing ?
> 
> Neil
> 
At present, only ete0 is used, and other components can be added later if need.
>> +
>> +    funnel-ete {
>> +        compatible = "arm,coresight-static-funnel";
>> +
>> +        in-ports {
>> +            port {
>> +                funnel_ete_in_ete0: endpoint {
>> +                    remote-endpoint = <&ete0_out_funnel_ete>;
>> +                };
>> +            };
>> +        };
>> +
>> +        out-ports {
>> +            port {
>> +                funnel_ete_out_funnel_apss: endpoint {
>> +                    remote-endpoint = <&funnel_apss_in_funnel_ete>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>>       firmware {
>>           scm: scm {
>>               compatible = "qcom,scm-sm8650", "qcom,scm";
>> @@ -4854,6 +4888,138 @@ data-pins {
>>               };
>>           };
>>   +        funnel@10042000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x10042000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@4 {
>> +                    reg = <4>;
>> +
>> +                    funnel_in1_in_funnel_apss: endpoint {
>> +                        remote-endpoint = <&funnel_apss_out_funnel_in1>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_in1_out_funnel_qdss: endpoint {
>> +                        remote-endpoint = <&funnel_qdss_in_funnel_in1>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@10045000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x10045000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    funnel_qdss_in_funnel_in1: endpoint {
>> +                        remote-endpoint = <&funnel_in1_out_funnel_qdss>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_qdss_out_funnel_aoss: endpoint {
>> +                        remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@10b04000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x10b04000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@7 {
>> +                    reg = <7>;
>> +
>> +                    funnel_aoss_in_funnel_qdss: endpoint {
>> +                        remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_aoss_out_tmc_etf: endpoint {
>> +                        remote-endpoint = <&tmc_etf_in_funnel_aoss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        tmc@10b05000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +
>> +            reg = <0x0 0x10b05000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    tmc_etf_in_funnel_aoss: endpoint {
>> +                        remote-endpoint = <&funnel_aoss_out_tmc_etf>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@13810000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x13810000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    funnel_apss_in_funnel_ete: endpoint {
>> +                        remote-endpoint = <&funnel_ete_out_funnel_apss>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_apss_out_funnel_in1: endpoint {
>> +                        remote-endpoint = <&funnel_in1_in_funnel_apss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>>           apps_smmu: iommu@15000000 {
>>               compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>               reg = <0 0x15000000 0 0x100000>;
>>
>> ---
>> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
>> change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8
>>
>> Best regards,
> 


