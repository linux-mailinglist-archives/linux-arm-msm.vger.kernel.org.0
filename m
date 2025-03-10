Return-Path: <linux-arm-msm+bounces-50760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C32A58ABB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 03:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B8EA7A2D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 02:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D731AC43A;
	Mon, 10 Mar 2025 02:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IY6XfO+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA3D17C225;
	Mon, 10 Mar 2025 02:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741575484; cv=none; b=tedogHvHM7U0F7AtusUdXSE6D7qudQM3Zs7uBqA3gaTkXgsNU2XdHRDS1vSNaDrgo3RK1SMuF6H12Gf3m/OaXC3ezhrEYyz5+Ua5k8JQKu9KTMO40CuUmid/SRtj2sQ7CY68Zg3CcfZZM0JAPdm5DY1CU3EcNpgiWBmoBmHZNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741575484; c=relaxed/simple;
	bh=e29fZWnuaNP/FqFEDoIvxeI8O6oxKjfJFLcq6t6DOLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jf61YA27xzYBxv9lMNTQkFrYktC+fdMlq75TqZcGvglvuuxh0VSlImlpcGhgvg0bOtVcwF2qZthdfyecEHFuMVJ1LRRK3LwBGD+Kj+XC5grbYLVF2xFG7IFU7yVBlvRJSCEvNMg/p3LFkmfAyjioOKWbwj/fQKhH3cYHpmVIZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IY6XfO+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529MtPYX012672;
	Mon, 10 Mar 2025 02:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEoCZTviZ2GCsxW2OdhKOgQUL5/J0NoI75VbggP73rw=; b=IY6XfO+cyEyKgtTh
	VvwZBcAkKx5ZDHo5iFWZd+3zeGNlVAgcUYEEjtGnGFtOHHMr2/7LDIs9+q4PZhnJ
	zAAl8pQmpSgsxI+jW41MyxCrevjIYKmkwN/Sl1SFPRw9TesoT8SHJxiWXF8zc+1K
	qeiRCdQQjin5WNF2j21k4fTy9qSnubuDlxM3MPZlx3sbeAfNxSTvaLNyie2Pp8yl
	U+fXFQp3m642p+ST9DzaYpGTgAfzez4rhzyaZZzyWANZxlDBHE54EMnBNN6FrSEf
	ACw29qurRz8qqyc7RUorX8y9J4Uc4VZEzS1WBR5EtKwsrv/8sy9QipcWJ2tZV+j7
	i+7bXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0uath-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:57:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A2vi3f005518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:57:44 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Mar 2025
 19:57:38 -0700
Message-ID: <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Date: Mon, 10 Mar 2025 10:57:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/10] arm64: dts: qcom: sa8775p: Add CTCU and ETR
 nodes
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-11-quic_jiegan@quicinc.com>
 <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tFJVOVLCoCIHttOaOYSCI63izxriGM9H
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67ce5529 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=wwPabD9cbYV0bnQw2J4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: tFJVOVLCoCIHttOaOYSCI63izxriGM9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100022



On 3/4/2025 8:28 PM, Suzuki K Poulose wrote:
> On 03/03/2025 03:29, Jie Gan wrote:
>> Add CTCU and ETR nodes in DT to enable related functionalities.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> Assuming this goes via the soc tree,
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Bjorn, Konrad

Gentle ping.

The driver part has applied. BTW, I found this patch has a conflict on 
tag next-20250307, do you need me to send a new rebased patch?

Thanks,
Jie

> 
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 153 ++++++++++++++++++++++++++
>>   1 file changed, 153 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sa8775p.dtsi
>> index 3394ae2d1300..31aa94d2a043 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -2429,6 +2429,35 @@ crypto: crypto@1dfa000 {
>>               interconnect-names = "memory";
>>           };
>> +        ctcu@4001000 {
>> +            compatible = "qcom,sa8775p-ctcu";
>> +            reg = <0x0 0x04001000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb";
>> +
>> +            in-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    ctcu_in0: endpoint {
>> +                        remote-endpoint = <&etr0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    ctcu_in1: endpoint {
>> +                        remote-endpoint = <&etr1_out>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>>           stm: stm@4002000 {
>>               compatible = "arm,coresight-stm", "arm,primecell";
>>               reg = <0x0 0x4002000 0x0 0x1000>,
>> @@ -2633,6 +2662,122 @@ qdss_funnel_in1: endpoint {
>>               };
>>           };
>> +        replicator@4046000 {
>> +            compatible = "arm,coresight-dynamic-replicator", 
>> "arm,primecell";
>> +            reg = <0x0 0x04046000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    qdss_rep_in: endpoint {
>> +                        remote-endpoint = <&swao_rep_out0>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    qdss_rep_out0: endpoint {
>> +                        remote-endpoint = <&etr_rep_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        tmc_etr: tmc@4048000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +            reg = <0x0 0x04048000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +            iommus = <&apps_smmu 0x04c0 0x00>;
>> +
>> +            arm,scatter-gather;
>> +
>> +            in-ports {
>> +                port {
>> +                    etr0_in: endpoint {
>> +                        remote-endpoint = <&etr_rep_out0>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    etr0_out: endpoint {
>> +                        remote-endpoint = <&ctcu_in0>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        replicator@404e000 {
>> +            compatible = "arm,coresight-dynamic-replicator", 
>> "arm,primecell";
>> +            reg = <0x0 0x0404e000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    etr_rep_in: endpoint {
>> +                        remote-endpoint = <&qdss_rep_out0>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    etr_rep_out0: endpoint {
>> +                        remote-endpoint = <&etr0_in>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    etr_rep_out1: endpoint {
>> +                        remote-endpoint = <&etr1_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        tmc_etr1: tmc@404f000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +            reg = <0x0 0x0404f000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +            iommus = <&apps_smmu 0x04a0 0x40>;
>> +
>> +            arm,scatter-gather;
>> +            arm,buffer-size = <0x400000>;
>> +
>> +            in-ports {
>> +                port {
>> +                    etr1_in: endpoint {
>> +                        remote-endpoint = <&etr_rep_out1>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    etr1_out: endpoint {
>> +                        remote-endpoint = <&ctcu_in1>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>>           funnel@4b04000 {
>>               compatible = "arm,coresight-dynamic-funnel", 
>> "arm,primecell";
>>               reg = <0x0 0x4b04000 0x0 0x1000>;
>> @@ -2708,6 +2853,14 @@ out-ports {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    swao_rep_out0: endpoint {
>> +                        remote-endpoint = <&qdss_rep_in>;
>> +                    };
>> +                };
>> +
>>                   port@1 {
>>                       reg = <1>;
>>                       swao_rep_out1: endpoint {
> 


