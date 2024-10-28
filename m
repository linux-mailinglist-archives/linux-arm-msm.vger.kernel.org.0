Return-Path: <linux-arm-msm+bounces-36149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E09B2EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B46285E66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F7D1DB52A;
	Mon, 28 Oct 2024 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LHLch3/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018711D63EF;
	Mon, 28 Oct 2024 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114418; cv=none; b=n9isqwZe8AU9BYW0PoGrKRkKS/wTSUEHwZZj+UDgkoz+lY9mj0MFPUCyh98aiEeMT782XhllIqASAerXoTugBHuysBbBX3CF4BTqPpzGzoQywb5ZxfwXKrc4Y9aydvF++t0eRRZ10KrheykAHCEqyTSIxHd5exs2hNiaC5EDv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114418; c=relaxed/simple;
	bh=0ZafXriFWVOAraQDr8DnSpyYoG7hvuIEriyiLkH7NIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BEmc8WmSVuc49tmjsY1J0A4VXmjL8fybJHMoAcc2FL7iAKrLYCsAkk8Tsq80G7eNL9MtiMzYgsV4XsKy3J+pp3fBno09b7CT+5HdH85oel+fo/sJXNcedDLd6jCr4WsjQHXy2hdyJDtFbj9YuV1uG9e7vmkGyjZ42sTEErm67A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LHLch3/z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S0eU3b003847;
	Mon, 28 Oct 2024 11:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnZv6D2nKcqRaWU/DOiT94tZc0b1DBdGz5AijBN1Ppc=; b=LHLch3/zgPZOeD2J
	Zg+NS3/i3Ol7c1e7pPAfGqlkrWvdCdLKCXNQDg7Hyi8oilRVDfdsmMYAVfQ+8DEB
	l3yDse9wGA5oDG4ThmgEG0W8lnUu/7IP9P4t3ZtyvuJ+aCFu0fhq1Hmse7m0TNOO
	tbEKL7cPDBloldtjaidpgGcoOQzDT49ZVkSUobe0xgFuuFGuXXNPtyYL23m8Q7g6
	PSZqgcZRQEvv4JCo1nUatRlMyZ/ph27xaDBQX6H+eR5iF+/ds00upaHfty75/+Bp
	2rj36qUOy+VGcOtKWGjlrBOIyFVT5rpu6Q3Hb3mM0k+n6c0L5PH7YW09XiC3pFm0
	SNnWCA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt6vkch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 11:20:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SBKAUh010155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 11:20:10 GMT
Received: from [10.216.24.163] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 04:20:05 -0700
Message-ID: <332f7a0a-d9df-49bd-81d5-cc04c50183b9@quicinc.com>
Date: Mon, 28 Oct 2024 16:49:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241011103346.22925-1-quic_vdadhani@quicinc.com>
 <15238992-4ede-4b85-9947-391baaa4c8a9@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <15238992-4ede-4b85-9947-391baaa4c8a9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ayywVNBjchDtmUck01fqGR4yk1Xwr0Kh
X-Proofpoint-GUID: ayywVNBjchDtmUck01fqGR4yk1Xwr0Kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280092



On 10/26/2024 1:10 AM, Konrad Dybcio wrote:
> On 11.10.2024 12:33 PM, Viken Dadhaniya wrote:
>> Add DT support for QUPv3 Serial Engines.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
> 
> [...]
> 
>> +	qup_opp_table: opp-table-qup {
>> +		compatible = "operating-points-v2";
> 
> opp-shared;

Added in v2.

> 
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
>> @@ -392,6 +427,24 @@
>>   			#size-cells = <1>;
>>   		};
>>   
>> +		gpi_dma0: qcom,gpi-dma@800000  {
>> +			compatible = "qcom,sdm845-gpi-dma";
> 
> You must define a new compatible for qcs615, sdm845 is used as a fallback
> (so that we don't have to add new driver entries). You will however need
> to submit a separate dt-bindings change.

We have added sdm845 in compatible due to below comment in driver file

File: 
https://github.com/torvalds/linux/blob/81983758430957d9a5cb3333fe324fd70cf63e7e/drivers/dma/qcom/gpi.c#L2284

   /*
    * Do not grow the list for compatible devices. Instead use
    * qcom,sdm845-gpi-dma (for ee_offset = 0x0) or qcom,sm6350-gpi-dma
    * (for ee_offset = 0x10000).
    */

Do we still require new compatible for qcs615 ?

> 
>> +			reg = <0x0 0x800000 0x0 0x60000>;
>> +			#dma-cells = <3>;
>> +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
>> +			dma-channels = <8>;
>> +			dma-channel-mask = <0xf>;
>> +			iommus = <&apps_smmu 0xd6 0x0>;
>> +			status = "disabled";
> 
> Any reason?

By default, we are disabling all nodes. In the target-specific file, we 
will update them based on the required use case.

> 
>> +		};
>> +
>>   		qupv3_id_0: geniqup@8c0000 {
>>   			compatible = "qcom,geni-se-qup";
>>   			reg = <0x0 0x8c0000 0x0 0x6000>;
>> @@ -400,6 +453,7 @@
>>   				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>>   			clock-names = "m-ahb",
>>   				      "s-ahb";
>> +			iommus = <&apps_smmu 0xc3 0x0>;
> 
> This looks like a separate fix

One QUP and UART (console) related change has been added as part of the 
base DTSI. Now, we are adding all remaining QUP and I2C/SPI/UART 
configurations with IOMMUs and other properties.

Is there any specific reason to make this a separate fix?

> 
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>>   			status = "disabled";
>> @@ -412,13 +466,377 @@
>>   				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
>>   				pinctrl-names = "default";
>>   				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
>> -				interconnects = <&aggre1_noc MASTER_QUP_0 0
>> -						 &mc_virt SLAVE_EBI1 0>,
>> -						<&gem_noc MASTER_APPSS_PROC 0
>> -						 &config_noc SLAVE_QUP_0 0>;
>> +				interconnects = <&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>,
>> +						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
> 
> Why?
> 
> Also, please use QCOM_ICC_TAG_ALWAYS instead of zeroes

Updated in v2.

> 
> Konrad

