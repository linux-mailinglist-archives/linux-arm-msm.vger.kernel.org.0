Return-Path: <linux-arm-msm+bounces-41968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 463689F09B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 632461654AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759B01BBBD4;
	Fri, 13 Dec 2024 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZc1gAI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D61B87F8;
	Fri, 13 Dec 2024 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086237; cv=none; b=uP0q/P1bYFKRNf02vXcFefhqzTy+K/nraSIQ6iggwaqzXJX09fZ/J580SAU5pD+MjuiB9t7O/hQVZUFPjmHnUQKSwr/ZTx+2QWB8clWw7Xu1w8AfKyyO2+tj6pc98PupkwjOqjxj8+CdotONoFd9LzpNArcqkY24rOd5hwl1teY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086237; c=relaxed/simple;
	bh=7GGAjzastLLttJ++n9UnGGbBN9NbzxAn5xEV7vbFwd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RvAjlkscnbzh+VWF1TLMluB1HlsjgIvP14pkpz2HXgbIzitABYUr0AreWt1HlhURf5L+ES0f7N0Jj/BypdA+FjRj3dF98QKUFq/+lS6WXvMzRUcbZ/dOYELO/SOTHU3TOLdJpYiSu9RoKD0YQBzQHWGRNDR9YMVXffQc7DytNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZc1gAI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3Zvi012381;
	Fri, 13 Dec 2024 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lqzKKoZLZWlQg6aH29yC9pdRWAvdHqm4yGdOf4mgzQ=; b=fZc1gAI/T3bfAkD8
	5oo3RW7uu0wl9OYSV3EZ2N83B8/YqjVJpdhOi2hLF+YuS0mfGAH9NNmmZH/ekbEO
	ikhdogN215ogJI5FVXtdkl60/TO3YXBJiXh8yEmij9LwymqCAuWGp5SoqoGDvvhO
	g7Oe2fgva6CiKWREHpYGzWEW/yWKp+XddyfBzMYNNIAxtrz4c4YEVrmX5zfC3pvx
	sufYPMQaXNqOLdFVhn4UCJ+DWWH9lyS0pq0h8Pkd4YmGuFxswh4kK+BjNbA4LPeV
	NpKRd+5bUXnXZkJlnledLlAQ3s1eKM9zj/dahgObpoHiA2cbGZHBw6uM2dj3J63N
	TM9z6w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudg40a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:37:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAbBQu010387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:37:11 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:37:07 -0800
Message-ID: <4d0ee82e-b9f3-405a-919a-ef8eafd2051d@quicinc.com>
Date: Fri, 13 Dec 2024 18:37:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable DisplayPort on QCS615 RIDE
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fange Zhang
	<quic_fangez@quicinc.com>,
        Li Liu <quic_lliu6@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
 <20241210-add-displayport-support-to-qcs615-devicetree-v1-2-02f84a92c44b@quicinc.com>
 <qwx6ieolctmsmlruku2bmxv2ufd3soa64ygsjjzt5b6ntweoan@tpv7w73utvmm>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <qwx6ieolctmsmlruku2bmxv2ufd3soa64ygsjjzt5b6ntweoan@tpv7w73utvmm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iLp_AyTEzWu14UDvp2dlX_i40AZTgGKS
X-Proofpoint-ORIG-GUID: iLp_AyTEzWu14UDvp2dlX_i40AZTgGKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130073



On 12/10/2024 6:48 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 05:11:06PM +0800, Xiangxu Yin wrote:
>> Enable the DisplayPort node, config related regulator, lane mapping,
>> hpd-gpios on the Qualcomm QCS615 RIDE platform.
>>
>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 694719a09ac46bfa2fe34f1883c0970b9d0902be..0ac543577ec1850d6e4f19ff1d64252b00fffae3 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -44,6 +44,20 @@ dp_connector_out: endpoint {
>>  			};
>>  		};
>>  	};
> 
> You mentioned v3 of the display support series. However v3 doesn't
> contain dp_connector_out label.
> 
My typo, this patch based v4 of display support, but it not properly updated to the cover.
Will update cover info in next patch.
>> +
>> +	dp2-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP2";
>> +		type = "mini";
>> +
>> +		hpd-gpios = <&ioexp 8 GPIO_ACTIVE_HIGH>;
>> +
>> +		port {
>> +			dp2_connector_in: endpoint {
>> +				remote-endpoint = <&mdss_dp0_out>;
>> +			};
>> +		};
>> +	};
>>  };
>>  
>>  &apps_rsc {
>> @@ -291,6 +305,22 @@ &mdss_dsi0_phy {
>>  	status = "okay";
>>  };
>>  
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <3 2 0 1>;
> 
> This hasn't been agreed upon yet. Please abstain from using the
> configuration bits that are still in discussion.
> 
Ok, I'll update next dt patch after the lane mapping discussion.
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> +	remote-endpoint = <&dp2_connector_in>;
>> +};
>> +
>> +&mdss_dp_phy {
>> +	vdda-phy-supply = <&vreg_l11a>;
>> +	vdda-pll-supply = <&vreg_l5a>;
>> +	status = "okay";
>> +};
>> +
>>  &qupv3_id_0 {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.34.1
>>
> 


