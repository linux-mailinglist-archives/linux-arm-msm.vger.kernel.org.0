Return-Path: <linux-arm-msm+bounces-53757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C6A8380E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F8419E7E21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783A91EB18E;
	Thu, 10 Apr 2025 05:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RNrCv7kh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B951F1A3150;
	Thu, 10 Apr 2025 05:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744261527; cv=none; b=RmtO9eNeLvzL3fg2ttKIYEXiwIVScda8QzAaVwTpYHx7qHurVsYtbWNqODn6vNtqDVqYMKrGOS9wde11e2XX8EdPNo+74awUQRmnvxLYAAEc29N71Bdddy84LM4CrNTICImhMpYWvOR2/h2y6VDvO/1uCNHWQtMGKyU4QVU7ak0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744261527; c=relaxed/simple;
	bh=d0SRzgkJEPXktHw5+f25WSWmg8vczFM8sM8a8WNUVLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LwNbhuhOP1Oma5Nte6dxMkOrnCbVnwLtJeowNaxvxUmLnyWVVmTJkPxcsa5CDetAux9XA14RLrljwSohyxewD8XHvAZxuFyy60f9k0LWB07PNAcj3ov6ReEih0ZR75oPYlZXxL6bbCrmBUA2xmxfsiYxW4R38COgHwmcANYfoTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RNrCv7kh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A503Fc008413;
	Thu, 10 Apr 2025 05:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nn8VvEvF4/BbQTPCcCGrRvvmAwnomHKMg9nJ6YFqGlQ=; b=RNrCv7khH2+lnwEk
	1Hyo6hYbuZyHSiagxe6xcPMHdcMvtjf/HbuxDf1tIlsFz5xtZCIf3tHaKT5OXgwz
	9KW0IEnQxs3ibMpt/ui/lRImdIlzAGKwHWfK1kPEAzbngPJboisODjnEKWXfxstT
	6heFKZkA9o1XlENXlpOhcuBIyeSJ+8jKcnaOl5YGYf5AM0bKG2w+TZu2/K/Q/P5P
	FtYZdj5t7vBUJw7vJsc5o1Y2yhnS69qH6qh4lyG2xk8MF3iLgXORgYW2j/jr+CPw
	Ys6i/tKZnIY1Ia66CuELCHhawhRETW5AJsYjzNoDK6Cuu6gYVkTUPY9roT6kETLA
	UVV/DQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgnrq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 05:05:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A550gv001919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 05:05:00 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 22:04:52 -0700
Message-ID: <d6771074-00b9-449d-997e-7eff50f01193@quicinc.com>
Date: Thu, 10 Apr 2025 10:34:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f7517d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0Abo7YVxcx67k3rTUHcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9eyw89_tYBSM11787j0PjXzrTwj3gyGB
X-Proofpoint-GUID: 9eyw89_tYBSM11787j0PjXzrTwj3gyGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100037

On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>> Add anx7625 DSI to DP bridge device nodes.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>  1 file changed, 207 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 175f8b1e3b2d..8e784ccf4138 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -28,6 +28,13 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>  
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>>  	vreg_conn_1p8: vreg_conn_1p8 {
>>  		compatible = "regulator-fixed";
>>  		regulator-name = "vreg_conn_1p8";
>> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>>  			};
>>  		};
>>  	};
>> +
>> +	dp-dsi0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DSI0";
>> +		type = "full-size";
>> +
>> +		port {
>> +			dp_dsi0_connector_in: endpoint {
>> +				remote-endpoint = <&dsi2dp_bridge0_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	dp-dsi1-connector {
>> +		compatible = "dp-connector";
>> +		label = "DSI1";
>> +		type = "full-size";
>> +
>> +		port {
>> +			dp_dsi1_connector_in: endpoint {
>> +				remote-endpoint = <&dsi2dp_bridge1_out>;
>> +			};
>> +		};
>> +	};
>>  };
>>  
>>  &apps_rsc {
>> @@ -517,9 +548,135 @@ &i2c11 {
>>  
>>  &i2c18 {
>>  	clock-frequency = <400000>;
>> -	pinctrl-0 = <&qup_i2c18_default>;
>> +	pinctrl-0 = <&qup_i2c18_default>,
>> +		    <&io_expander_intr_active>,
>> +		    <&io_expander_reset_active>;
> 
> These pinctrl entries should go to the IO expander itself.

Will move these pinctrl entries in IO expander in next patchset.

Thanks,
Ayushi

