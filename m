Return-Path: <linux-arm-msm+bounces-37448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B29C39F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5F5D1C21510
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EB91531E2;
	Mon, 11 Nov 2024 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nmjwAFLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22B3A8F7;
	Mon, 11 Nov 2024 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314743; cv=none; b=m/tZN/SAJFysT/CbTsTkZfwewuLdrnaKHcj7fJRxQL4tSqloD7W79CvYcWuIHgEdkqeVZmLCfANcOawAzMpcf8FJ9of0RDU1AkM3Rx0CvaO5XUoC3Eh5KAoX1ZXw5flig/ElP+E9/LhM+vz+0kIxlo8t8OjVO0hCkZo1bZGGcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314743; c=relaxed/simple;
	bh=+agMltnypZ3IkRR54n2mijyd5jaUPy3/7qEj8YkaaV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pzKLNDkOcaKT6g78M1nPXmjcvryJz396hGg01KM2+mNk1/FKwevSVzo7MZVZhUVOQzS7BwgeJzOkyvw0j/BlPwan8PMkb9lnbI/+OXEF1AUpv025HybKm4qelJPLaACSrrZtRwRXACW0wC4iJe3DIA8SV4XQzEMT8Mctpc/b9UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nmjwAFLY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAMH5El024320;
	Mon, 11 Nov 2024 08:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdBgS4MrcV44e+uiluAhn9aUi8CoQG+QcCd/72lLCd4=; b=nmjwAFLYpPYf/0iW
	90rKxs97GeFwSuLWqEkqgC4H/CbBm3Q0VJ/9LNhc5Q55ogwI8zxVXWyoY71WHm2O
	7lNycT3adxDdW/iemPiKgwXRELfcXID7f+DfwgBbn6krwAMU1N5mCol0xTa3A/43
	Mr8/afgbthR/lZzngbQ96Tmqfz60NaEQgyICCjcb75fEmFjvwCLrYZwNwaflX1Vl
	s92sZkIQvTeh+Te6TaOPHHCS2SGel9NQLr9TYy333iE0kJPN1oBYrhd+zf6Mat6z
	x8t62rcmpocgt4fEXoqu30XiyodBmulXU/nq3adxthozyq5SqLsMtBd3c45xL5JJ
	w6u/yw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0wjujdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:45:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB8jb2B002385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:45:37 GMT
Received: from [10.216.36.177] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 00:45:33 -0800
Message-ID: <fc358b5b-1446-4230-8bbb-3450fe941f33@quicinc.com>
Date: Mon, 11 Nov 2024 14:15:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konrad.dybcio@oss.qualcomm.com>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241028112049.30734-1-quic_vdadhani@quicinc.com>
 <50a0a56d-55ce-4b59-a004-b8418309eb92@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <50a0a56d-55ce-4b59-a004-b8418309eb92@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DHNyrnKJ565CxYEQtZDiOfEof6tKzNMI
X-Proofpoint-ORIG-GUID: DHNyrnKJ565CxYEQtZDiOfEof6tKzNMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411110073



On 10/28/2024 5:03 PM, Krzysztof Kozlowski wrote:
> On 28/10/2024 12:20, Viken Dadhaniya wrote:
>> Add DT support for QUPv3 Serial Engines.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>
>> Build Dependencies:
>>
>> Base:
>> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
>> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-6-e37617e91c62@quicinc.com/
>>
>> Clock: https://lore.kernel.org/linux-devicetree/20240920-qcs615-clock-driver-v2-3-2f6de44eb2aa@quicinc.com/
>> ICC: https://lore.kernel.org/linux-devicetree/20240924143958.25-2-quic_rlaggysh@quicinc.com/
>> Apps SMMU: https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/
>>
>> v1 -> v2:
>>
>> - Add opp-shared property.
>> - Use QCOM_ICC_TAG_ALWAYS flag in interconnect property.
>>
>> v1 Link: https://lore.kernel.org/all/20241011103346.22925-1-quic_vdadhani@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 642 ++++++++++++++++++++++++++-
>>   1 file changed, 638 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 865ead601f85..1d1cdf6f9a74 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -5,6 +5,7 @@
>>   
>>   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> @@ -17,6 +18,21 @@
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   
>> +	aliases {
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
>> +		i2c4 = &i2c4;
>> +		i2c5 = &i2c5;
>> +		i2c6 = &i2c6;
>> +		i2c7 = &i2c7;
>> +		spi2 = &spi2;
>> +		spi4 = &spi4;
>> +		spi6 = &spi6;
>> +		spi7 = &spi7;
>> +		serial0 = &uart0;
> 
> Comments from v1 apply.

Updated in v3.

> 
>> +	};
>> +
>>   	cpus {
>>   		#address-cells = <2>;
>>   		#size-cells = <0>;
>> @@ -296,6 +312,26 @@
>>   		qcom,bcm-voters = <&apps_bcm_voter>;
>>   	};
>>   
>> +	qup_opp_table: opp-table-qup {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		opp-75000000 {
>> +			opp-hz = /bits/ 64 <75000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +		};
>> +
>> +		opp-100000000 {
>> +			opp-hz = /bits/ 64 <100000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +		};
>> +
>> +		opp-128000000 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +		};
>> +	};
>> +
>>   	psci {
>>   		compatible = "arm,psci-1.0";
>>   		method = "smc";
>> @@ -392,6 +428,24 @@
>>   			#size-cells = <1>;
>>   		};
>>   
>> +		gpi_dma0: qcom,gpi-dma@800000  {
> 
> Nope. Don't post downstream code.

Sure. updated in v3.

> 
> Best regards,
> Krzysztof
> 

