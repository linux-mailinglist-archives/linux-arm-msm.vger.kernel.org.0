Return-Path: <linux-arm-msm+bounces-50145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7FA4D90A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F1637AAB9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01E61FCFF7;
	Tue,  4 Mar 2025 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YsVVuzkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BE1F891D;
	Tue,  4 Mar 2025 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741081524; cv=none; b=SpNKlJgt65NHy1zu3/V03G0afRfvV5qJa+5xPxLidNB1pU5f7xiMG7+rjw0q+Mdhllmfqqf8v6RUawMZSsJEIBg4wbOt4Zk0mza+bLYwCNL+35jRVf0MEXfM/vQCZ9E1UFSxo5x7flFfpE8TCEQCoFrypmLvP2GH4+jcmJ6ER5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741081524; c=relaxed/simple;
	bh=yu/fxRp+Qq731GPWqvxv7CxYw/oO+dxoj2ZKMgIk3yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cxh2Rr33VLlNB8nQ0vU08TUxhKwD9cvtDHGKQc2EEOYL0jJ280bjXNaFRH38MxF60kz9yqh1Ri5aE3pUN4XCH0GtHMRlSWxXtF7tbWb815W5PHBDjPQM5MtIDOwzzSVlBxUalp0o3cDlksQ3EVEI8TZkxF5U+gzhG/Or/HVrRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YsVVuzkc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NXGmo017322;
	Tue, 4 Mar 2025 09:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oWK79+LmvvrmQWMaq/+oZ+bqCxhDrEG7H+xB6EtRf4=; b=YsVVuzkcObuQvFDt
	HKI4Fh4wAmTfydF3pCeFO88l1xjQMQW53oJ5UVrEyHcbvMktaawCIYdfLzpKeix+
	XCmZF0WcbUUZzm7iQXYjmwOhI8kPtgcLAEpurD6UCqcRoo0IxWEdl7SzMcYUR0o0
	vNDUO9tDy/pBXVktR3V0kZPQBgT69JOX3Tr8rPAFi0V3SYqCcYsBqgTXTZvtVeu0
	2fxPOyjBnajgb7Otzrvcqx8z3vLumG4oW/dad2pC7o1kcxLUzbKaV6rYPQmHoK/d
	q5TDcmcx+1Gh1grnXjbmTLHigp8g5PIosG4n/FmgHBGsnsCHczQ8LMdlsxENokg3
	8Rtpig==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6theh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 09:45:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5249j76l023483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 09:45:07 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 01:45:00 -0800
Message-ID: <5293f723-2a27-4d2a-8939-059226d460c3@quicinc.com>
Date: Tue, 4 Mar 2025 15:14:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display
 serial interface
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-9-quic_amakhija@quicinc.com>
 <tfd27qk543dt4sqcawogoszsjax3cqxmi6mcy3qd2mwzauedpf@l6xmy5okswrd>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <tfd27qk543dt4sqcawogoszsjax3cqxmi6mcy3qd2mwzauedpf@l6xmy5okswrd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c6cba3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=5EIoLlhqkPllPMRGZxYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: u7ZpYciTQNRFJC6gt9X6GZO_zKOShwbl
X-Proofpoint-GUID: u7ZpYciTQNRFJC6gt9X6GZO_zKOShwbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040082

On 2/25/2025 11:25 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 05:48:21PM +0530, Ayushi Makhija wrote:
>> Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
>>  1 file changed, 64 insertions(+), 2 deletions(-)
> 
> Please squash into the previous patch. It doesn't make a lot of sense separately.
> 
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 151f66512303..02d8a9c2c909 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
>>  			};
>>  		};
>>  	};
>> +
>> +	dsi0-connector {
> 
> dpN-connector. It is not DSI.

Hi Dmitry, Konrad

Thanks, for the review.

I will change dsi0-connector -> dp2-connector and dsi1-connector -> dp3-connector respectively.

> 
>> +		compatible = "dp-connector";
>> +		label = "DSI0";
> 
> Is it an actual label on it?

The label for DSI to DP bridge ports itself on the device is DSI0 and DSI1 respectively.

Thanks,
Ayushi


