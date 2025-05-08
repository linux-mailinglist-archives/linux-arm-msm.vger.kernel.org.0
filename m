Return-Path: <linux-arm-msm+bounces-57285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D49AB0013
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6491BC687B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB44280A5E;
	Thu,  8 May 2025 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XYqhZJxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B72422422D;
	Thu,  8 May 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721070; cv=none; b=kxvAo85pgAGz7YxF5eRMP+EuXC2EAf/B5QQPER8phSZHmW9RU0Q5UOhsnCQZq5eBP82KXLsEYg812G6ZNOguo7wjhgX8QW0xY3kVWgJzRN8snQP8g2tYtx8c9rQQgfZLEBwZ7a+SEorOgYbqU1Ruz2UlDa3ybqelk11Vc10itW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721070; c=relaxed/simple;
	bh=xKozc2AyI4Ozi4tKehqZJqOm1IcKgyA6mO6jm2W3Dlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C07SnNjHxngOlDH1kiOJLEIqpDHXS4lqHt33sEfXYui3P6PSxsbhFrc65/2zH88p2aVjNyrkau6CFdxUk8kx/CxE0IVvTjm4U0DM0oIBfpmkbSCBRhU0MAnS/GwYu4rwvgoaqcbCpd6sGktLLqA4C9QaGXI89Oy6Q9fCaDEZ1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XYqhZJxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cx8fS008510;
	Thu, 8 May 2025 16:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmBt5QGrInahKQyH9SFM/gRA+WRj69T62PxletTU4jM=; b=XYqhZJxAkCwubs14
	3FpDE9QNwg/dhL/qkcRSPOPIR8An3Bv0VGt77EXiK2A0x8va9RUb10Ej+jSY4oA2
	MYu6qa0SrJmha+Pi3HjLQFwwqMJjvmsjDpJuHz7InmEolP+NhWyCCZbPQysYjsQs
	iSSHt3CYEVRQQncO61rywx8kBVjM5odjJpOwkvo+qtUTyNSF6p34kfc60VrfG/vM
	t8Q49tnJbfgRCzWbTNDHB6wTJeSloTI5qI3i8xwC5GLxC5xaAn/Z2W8fBNF7LqPa
	yj7j9HbHviAwz0pqMXxSwKer3fj5CrF8QGHGeI7U6615dZIL+wtUwL2sYRO6Tq5E
	x2cpeA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59xem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:17:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GHhXu019231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:17:43 GMT
Received: from [10.216.33.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:17:39 -0700
Message-ID: <547ec78c-3fb9-43ea-9e1d-f97070eea9b2@quicinc.com>
Date: Thu, 8 May 2025 21:46:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-2-quic_pkumpatl@quicinc.com>
 <758047f5-e31a-4933-8560-56d988492d95@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <758047f5-e31a-4933-8560-56d988492d95@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cd928 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EkdEwCnvp131_jYCVQ4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YNSkxooh7XKR0l3vvHkpM6dOdRWUV4aA
X-Proofpoint-ORIG-GUID: YNSkxooh7XKR0l3vvHkpM6dOdRWUV4aA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0MiBTYWx0ZWRfX7d8Q3ws82c6j
 byboy8G9OddeQCSlim0Bdt2fR77OodKE9sF84B33qXF1uEB04CQoWcSJ5067qwAQ+pUTgoh3pTx
 1C70V8YWxK3CkwunFwSnA7hsm+CtjETDhPiYdcEHoDiIl+0yOUteXrKiVq8RRTp2eaj0Zc9IWYD
 0rU6QRM8k3pIcsXcnWQlvC9EGRHwV0G3SJnZqQoe649jkmSns0fsFQUqjmJX9lYUMv1jQLCrrGw
 gg9AcPHxJHasq+NxTHhtoWKg8qLUm/ESWiB0eiAlugZDKi6bURQ1Pk18O54rYBTD0eslr3/dDZb
 pPP+3JcBGowP5mOIwIw4zIbWrI/EXai9nc4/V4YrqEsFhNwiIeN46NeBgfPzehbqcEI8xBR7g5m
 PvmV35Jr1YEbw7s4gEf9hL5VVQL7nSwDhQgsYnyfumQQWST7aDQhcnl2XJWEB+sJEJaFw7Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=603
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080142



On 4/29/2025 4:18 PM, Konrad Dybcio wrote:
> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
> 
> [...]
> 
>> +&remoteproc_adsp_glink {
>> +	/delete-node/ apr;
>> +
>> +	gpr {
>> +		compatible = "qcom,gpr";
>> +		qcom,glink-channels = "adsp_apps";
>> +		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +		qcom,intents = <512 20>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		q6apm: service@1 {
>> +			compatible = "qcom,q6apm";
>> +			reg = <GPR_APM_MODULE_IID>;
>> +			#sound-dai-cells = <0>;
> 
> No `qcom,protection-domain` under either of the services?

With `qcom,protection-domain` facing some boot issue. Will check and 
update in next versions.

Thanks,
Prasad>
> Konrad


