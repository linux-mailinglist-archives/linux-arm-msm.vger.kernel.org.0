Return-Path: <linux-arm-msm+bounces-41923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D49F07AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A3728378B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2A01AF0BA;
	Fri, 13 Dec 2024 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SUbKsSaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BD2199956;
	Fri, 13 Dec 2024 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081695; cv=none; b=H5ugwFfWDVsud0Rf/SfbmEEwAp5rLGcZREEGyZYKWiZmO5uFY1k+dR5SjuSNOffk+jWDiD9Iq2sqAeTQtFXoF2KmtgGje4C8R3zZzbCNGSA943+DPsFOUUdRy2/sax3j1OC0lQqESe75Dr4p3p4wXrLTlCWgyEo0iDtAvwEMDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081695; c=relaxed/simple;
	bh=p6Jz7tZlPEdoOauhWybr0gvcFMeDefWQkrEL+W/ndME=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kssg+Em/vxQa+vR8l0Qlb5DHSgOinlU20db8Co2y0CQKTa5sXkDu64mXrzulj5+P4scgZ7uq3PtfRTw0oAa2mqWGZteWbw99OQ6J8kQh6DU6GP8TID+rthyUky6UswNXrxdCAhGZ3tBlsb0d0YiDNzb/dcni18vcOd4vIx1Hoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SUbKsSaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD76Z3K019198;
	Fri, 13 Dec 2024 09:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukopdj6A2fR/T6/FUn0RYpdMkUOSevoetHyzgX0Wxe4=; b=SUbKsSaRLqF9HrjN
	WWjwkJMkSOThep1biAbZbjTPRKJlUlEDzmFoEWv1t5Yt8XgBy+oGEanNiKilqMyM
	ZwmIRP78xwpG7O9z3rtoxTq05uD7s996Fwyr2ZdAVWhm9jJQH4ITZXzGewKSINV4
	e95C+DgLgMwqOUbKvrAmhzjv575SBno84o/rawf7pzSVnSPPwhaJJMkaOOHXlLkc
	dJVdInLE773o8BI6G1LB6UthBAyo6/qVXomGH/p0z0/SPkubJQ42LOzXCqC6QbrA
	UnPJDa34twCa8Iue2Tan+2tzi2qqIQ+EJyPl95Nm+NKTP9cElMzHpe/82WCdl3ZT
	KHPiAg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ffdywbba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:21:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9LEIN000445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:21:14 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 01:21:09 -0800
Message-ID: <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
Date: Fri, 13 Dec 2024 17:21:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liu Li
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4Jh573vj85O-Adq22hIfMDdmI0Fch4ZT
X-Proofpoint-GUID: 4Jh573vj85O-Adq22hIfMDdmI0Fch4ZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130064



On 2024/12/10 19:02, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>> QCS615 has a DP port, and DP support will be added in a later patch.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 89 ++++++++++++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index a25928933e2b66241258e418c6e5bc36c306101e..694719a09ac46bfa2fe34f1883c0970b9d0902be 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -32,6 +32,18 @@ xo_board_clk: xo-board-clk {
>>   			#clock-cells = <0>;
>>   		};
>>   	};
>> +
>> +	dp-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP";
>> +		type = "mini";
>> +
>> +		port {
>> +			dp_connector_out: endpoint {
>> +				remote-endpoint = <&anx_7625_out>;
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -202,6 +214,83 @@ &gcc {
>>   		 <&sleep_clk>;
>>   };
>>   
>> +&i2c2 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	ioexp: gpio@3e {
>> +		compatible = "semtech,sx1509q";
>> +		reg = <0x3e>;
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <58 0>;
> 
> Use IRQ flags instead of just 0 (here and further on). Also it might be
> better to use interrupts-extended instead.
Got it, will use interrupts-extended instead
-               interrupt-parent = <&tlmm>;
-               interrupts = <58 0>;
+               interrupts-extended = <&tlmm 58 IRQ_TYPE_NONE>;
> 
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		semtech,probe-reset;
>> +	};
>> +
>> +	i2c-mux@77 {
>> +		compatible = "nxp,pca9542";
>> +		reg = <0x77>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> 
> Add empty line before device nodes (here and furher on).
Sorry, will add it in next patch.
> 
>> +		i2c@0 {
>> +			reg = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			anx7625@58 {
>> +				compatible = "analogix,anx7625";
>> +				reg = <0x58>;
>> +				interrupt-parent = <&ioexp>;
>> +				interrupts = <0 0>;
will change it to interrupts-extended in next patch
-               interrupt-parent = <&ioexp>;
-               interrupts = <0 0>;
+               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;
>> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
>> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
>> +				wakeup-source;
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						anx_7625_in: endpoint {
>> +							remote-endpoint = <&mdss_dsi0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						anx_7625_out: endpoint {
>> +							remote-endpoint = <&dp_connector_out>;
>> +						};
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vreg_l11a>;
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&anx_7625_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	vdds-supply = <&vreg_l5a>;
>> +	status = "okay";
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.34.1
>>
> 


