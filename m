Return-Path: <linux-arm-msm+bounces-55285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 427AEA9A5C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B583B49DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B9120B20A;
	Thu, 24 Apr 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AWZPp1dh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5AF2080E8;
	Thu, 24 Apr 2025 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483103; cv=none; b=g79A18CS6sW5p4HJ+xhGtElh5UqEh7fQuIGR3PXmB96QcfzJSSYag71fGJ/F87fxoPGw6Ru9/8/4GXevl/xKqMJKWCYmK+0kQ9YW++L7Dz6bZ57P64pSDFPO5397Ntdk2y0byq218Dl4y68giaGhghBu2dk48+7ktHhbABeGi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483103; c=relaxed/simple;
	bh=/kURxAv85/R9nmfKxscR2c+P1UMMh/RofM96bZm11kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gEnxlTGv7HYQNEasWNeCmlWk8h8sLb0S8GqEJtvwJtqgovEQ+xobJy1RI8R9wvpSxzs58Nze7s8ndzJ50k/O9G5ihU7LmmTyPeAy5TQT5Kh42j6sTAjE/TnolgpbUfcTYvmRx+1VUhh71OkXybROSrkXYYcvrgKsEgMpDCd3xXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AWZPp1dh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7Gr013249;
	Thu, 24 Apr 2025 08:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yj3QKd2vXLmrqdOQoEJB7FhdvGD+3GnjwQ2O9St9B+s=; b=AWZPp1dh7KLYuQjR
	y08OWS6aPBTT+zrXkDGJ4VxR7MlADYQsC99Na5f+egc2RohUhNyiRdIQWOOS5qSd
	G6ONaxLlpiDZG++ECV+okdJyTCkFJtBcO5ahOH9aiavcDIiPaAr6uJK1tt/5ANpv
	UBHpzyz+bXvN5o/zEBZ57eMBoxCLhJXh7++h4C1/zc580r3NoDe0Edh+e/o2+EGN
	dKt2KiSP+WIIOftaR+m1X9i39ShZjHLebcSnGmeKnIDQTSmUBfn9mY4NujEATkIp
	3U5AspMSph0m/Q3xQlz1INfeqOxtFa8/CCMT5i/Uz5e2nUlSBxS3vpAUQVnrkj17
	+Xie4Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2cshq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:24:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8OtLr029078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:24:55 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 01:24:49 -0700
Message-ID: <bf865b42-fcfc-4bc7-8fc9-56b8b26b8ef8@quicinc.com>
Date: Thu, 24 Apr 2025 16:24:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
 <n3o4a7jokelces4jioccoub26ikwpeyzuc4ac5uzvumqkilha6@gc7w3qpb23q4>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <n3o4a7jokelces4jioccoub26ikwpeyzuc4ac5uzvumqkilha6@gc7w3qpb23q4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ff19Aj6UQu-9WTQ2KsaQyMveLYpME24n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1NCBTYWx0ZWRfXyubPYz8q9T74 2E7JoldZi2wH01DFmNr700G0oTa8GcEx7wwtIB/nhHT3jupg5ar6BBtwmm8Ac/MH5AriJreUJlT GLTV2Gc3B1o8EGmAsrJkId0TO1/atYMjVEWVyvLRKH1fymbK1CnXf9MKFOFInMqQlX99gCUSbbw
 d2o5/p0oZgftWIxcCwp+YC5fRFtDPYb6hIQwDgax+aozUJwecUR939auZr+Fdf3KT/gan5zzvzY zZkM2FAZC9hskeL9TW/GXchwd7NL4aDgh4BGNbqNpebrByMRMw495wD8bb4TX16bCYCfQWoJCPJ 9NrvgenuUz9qeE5VXZ8v/RI+JOyI054trGub9VpKMfGqAVQWCefuI8saur64kQZREG8UbR2GFHJ
 r9ujbbdx7Zmx7AyEd1RzPtw/qC/7jHEAr9SmK/OwMm0FnuEYkQvcywTkSPfxKz4+hssFNScv
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6809f558 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=wT7F-tmgBku578Ps1UwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ff19Aj6UQu-9WTQ2KsaQyMveLYpME24n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=833 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240054



在 4/23/2025 9:40 PM, Dmitry Baryshkov 写道:
> On Wed, Apr 23, 2025 at 05:17:42PM +0800, Lijuan Gao wrote:
>> Enable all remoteproc nodes on the qcs615-ride board and point to the
>> appropriate firmware files to allow proper functioning of the remote
>> processors.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 2b5aa3c66867..b0db2c3ad409 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -240,6 +240,16 @@ &qupv3_id_0 {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/qcs615/adsp.mbn";
>> +	status = "okay";
> 
> Empty line before status properties.
> 
I see, it will be updated in next patch.
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/qcs615/cdsp.mbn";
>> +	status = "okay";
>> +};
>> +
>>   &rpmhcc {
>>   	clocks = <&xo_board_clk>;
>>   };
>>
>> -- 
>> 2.46.0
>>
> 

-- 
Thx and BRs
Lijuan Gao


