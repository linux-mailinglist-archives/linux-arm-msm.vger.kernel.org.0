Return-Path: <linux-arm-msm+bounces-40707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EA9E6757
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99C871882F60
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 06:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869501D89EC;
	Fri,  6 Dec 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VaIjQCuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB1198832;
	Fri,  6 Dec 2024 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733467252; cv=none; b=frHqC50E+w8DtppkAYAjLN93yEq51EUv1fX/lNY7poW5PdGVXbBnKZyerjTCVL4mVA+hN6rIyOn2gZ+zH0OOLOrwzJo/atu9LuYc0zfYVDE9xTjN5y9BsSWfOpFwFndROdY7zDNLsGanZH0WAKTXSl64XXjJz/FP1PnWSI7Vne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733467252; c=relaxed/simple;
	bh=yyIhSCx0XA91DO81BC7bRoJ+jRUnKBaBzDFdJyZaLzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vu0+6ZBnmWoIQheWN4HZdUEgskiCYrF19Lj7JCN9a00PqteIZTHy7HmeaaT1NdUAUUWJ3mJmfnX5y+ethAwNBSIROuPWKtgvqzJ49afU4ayZyAC1cBvKPliwKu6K6ISImsd7QPgWPtRUbFSANLXkrPVaCvGK+Mky9DzxsBqw8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VaIjQCuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaMnh031086;
	Fri, 6 Dec 2024 06:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6D0FXW/G0kwPNdJVrfrsy+q1idFeO7YjGpMgEprFvM=; b=VaIjQCuS06pL5iuA
	aFPAGABt0xrbkGAHe8WEUB1sKmmhaMbb+LTopdFmYKhQ8E+Ave0QEzgvL5rwMN/A
	u+g17WvjLc85x6DqcCYFBrCNOmo9ruG2+8G+l4g2VbdJVQlJoqTr/y3uyZZLm/lc
	eKUNYaIQjw45V9NtC/Nl1H/NZcypgC8lBpQn2yXmMUBltc96Lwo9h0wUDfBYaAhB
	vUlI/UTBEx+qDmiCvLHauwQtM4qncDPHVn3GMEsS64eZUMA2WklSfJJM2hV2nYLd
	HxSRH5bGTxFgnmHQmRQRLvw9iJVlJKFQG49/p5iq/txCfMjGa0+vNZ/QReLQ7ELl
	ueHLBw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be1727eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 06:40:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B66ejh0022116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 06:40:45 GMT
Received: from [10.216.12.5] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 22:40:42 -0800
Message-ID: <57ce6574-b8e8-4523-9a97-6946fad59b35@quicinc.com>
Date: Fri, 6 Dec 2024 12:09:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
 <802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Shccz1ZTfL6CeHxwV4Rh7ncaQkSS4Ow
X-Proofpoint-ORIG-GUID: 1Shccz1ZTfL6CeHxwV4Rh7ncaQkSS4Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060046



On 11/30/2024 8:07 PM, Konrad Dybcio wrote:
> On 14.11.2024 12:05 PM, Imran Shaik wrote:
>> Add support for GPU, Video, Camera and Display clock controllers on
>> Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
>> ---
>> Please note that this series is dependent on [1] and [2], which adds support
>> for QCS8300 initial device tree and QCS8300 multi media clock controllers respectively.
>>
>> [1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
>> [2] https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/ 
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 59 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 2c35f96c3f28..e43fada4acb5 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -5,6 +5,10 @@
>>  
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> @@ -772,6 +776,20 @@ lpass_ag_noc: interconnect@3c40000 {
>>  			qcom,bcm-voters = <&apps_bcm_voter>;
>>  		};
>>  
>> +		gpucc: clock-controller@3d90000 {
>> +			compatible = "qcom,qcs8300-gpucc";
>> +			reg = <0x0 0x03d90000 0x0 0xa000>;
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> 
> Missing AHB clock
> 

We are re-using the qcom,gpucc.yaml bindings for the QCS8300, which doesn't have 
the AHB clock. Hence, followed the same approach as all other latest targets.

>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +			clock-names = "bi_tcxo",
>> +				      "gcc_gpu_gpll0_clk_src",
>> +				      "gcc_gpu_gpll0_div_clk_src";
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>>  		pmu@9091000 {
>>  			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>>  			reg = <0x0 0x9091000 0x0 0x1000>;
>> @@ -882,6 +900,47 @@ gem_noc: interconnect@9100000 {
>>  			qcom,bcm-voters = <&apps_bcm_voter>;
>>  		};
>>  
>> +		videocc: clock-controller@abf0000 {
>> +			compatible = "qcom,qcs8300-videocc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
> 
> And the ones you reference here and below are not registered with
> the clock framework.. 
> 

Yes, but these clocks are kept always-on from GCC driver probe.

Thanks,
Imran

> So please pick one
> 
> Konrad
> 
> Konrad


