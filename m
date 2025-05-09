Return-Path: <linux-arm-msm+bounces-57370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 794ABAB0BD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DDEA3AD4D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A69126FD95;
	Fri,  9 May 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ig+5xYKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409A26FD8B;
	Fri,  9 May 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776278; cv=none; b=sglVY+XkedTygTo9GKVcnyFGP+VxXP8YEKPsUBINazeIdfVQ37tZKUbcUmcr/tX99GqiKMqCaiZNTz2yt5dXw6Elm/AyqPGP0pd6j0jB1fFEl3/ngasq/8/BrYGeOreyj6HSVYDmpKeXg3PBVkMLntgsi7qvrB0iPbbe90e1sJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776278; c=relaxed/simple;
	bh=39KCW+9pBR2eN/RVPhRiK4XfH27BO+MFKBCvKV4GqIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=blbKUX/u6vGR14lywyZrn0Gw+UDS55c1W6/q5ISO2mkjxTL9zzd/ffrif1imEcemxOWmli6s13jM9IG/7Hp2bljeaXyE1YRihlEolqRuRSERSpplZsAGHWhHk/67JV9KcWV6KfZnu5V6R7RU+lpWvFetyDB0D0icm3JEanxDlVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ig+5xYKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493OC3V002336;
	Fri, 9 May 2025 07:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	glKqJfH2mUu7792floWXbbaGXK7G67kCGTka1XG2P0Y=; b=ig+5xYKjATpVuBz9
	AlRFQ2/G12uT4l1kzdcqOOtNkK/MQne8MGWKUD7T1XnbPl153eFgdmm1Dc0eKmFF
	SeP6TmijIC6i0VmwmfDKkFef50I23wz/yXspkVQVwglj7BQZzDi1bxJIMswjEMLV
	S0+Z6egTLBxhD9NPT5D5yFD133OiJsOwT6ArK9j90kns3q11lhchdij75YTpRG3p
	RCdx4n7G6EC6nq2H66SdRix00ZSFebJ29miyafUXYPtRDstrhTAM45j9ji+2v7RV
	YzF1dDYhtkj2uXBmapqkKj/2kbvaGiLwvYX9zOX8vxLsWXdSzdI2b+WA3rZpSFY9
	V9T4Bw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bs24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:37:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5497borl009455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 07:37:50 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 00:37:43 -0700
Message-ID: <c0ab504c-2b27-45cd-be8f-1176230b8bfd@quicinc.com>
Date: Fri, 9 May 2025 15:37:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
 <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681db0d0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=aGDm3H69ELvACEQWTh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dg-70zBiyJu_I-nvZbY9eMTPm0f2_xst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA3MiBTYWx0ZWRfX2GRUqrUMUg21
 0tK6EewhDOtelICzhar1+RkpZfXFtK8tnWAo/69JHfuDu/Ay0yFAg2SCqMtfNcvt/O1NOZrd6jz
 43SPIK18NBl9lG5WKunMTqV+xNXgAhwcX/gkl5AOJZDlRIVMXgmK8t0bNvT1C3q5GbzVa49GHWE
 /S90YVjjPXMso4uFHqpR2fCyeytVbF8YCof7woSLEopNjnBhQdbJzcyTln+N9SvA44kFc4ySgDR
 kxA7x9OQ5nAkb2orSRDPWxs9PlWrcH7J5yU0bdPL71BAta8iOlnPZ7uhDsW7NVgBdvu97xRoRfZ
 LkI7N23Z4MoklVgPXTcVJo9J8AYc+hgFZyIATbOKXnhEaBjf+RcFDXHHInyl4LhWNVdFN1Zy/v0
 6WjVYugrjfZiNYludAObtRHTb2AReGeB1aA0Sxrnp9Po5onWtftX+i7Cg9UBKIAL+w+9vCYK
X-Proofpoint-ORIG-GUID: dg-70zBiyJu_I-nvZbY9eMTPm0f2_xst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=875 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090072



在 5/8/2025 10:41 PM, Konrad Dybcio 写道:
> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>> Add a simple-mfd representing IMEM on QCS615 and define the PIL
>> relocation info region as its child. The PIL region in IMEM is used to
>> communicate load addresses of remoteproc to post mortem debug tools, so
>> that these tools can collect ramdumps.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 53661e3a852e..fefdb0fd66f7 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>>   			reg = <0x0 0x0c3f0000 0x0 0x400>;
>>   		};
>>   
>> +		sram@146aa000 {
>> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
>> +			reg = <0x0 0x146aa000 0x0 0x1000>;
> 
> 0x14680000 0x2c000

I checked the latest datasheet, the Shared IMEM address is 0x146aa000 
and its size is 0x1000, 0x14680000 is the start address of IMEM layout. 
The shared IMEM is used for debugging purposes, while the others parts 
are dedicated.

-- 
Thx and BRs
Lijuan Gao


