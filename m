Return-Path: <linux-arm-msm+bounces-53536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9939A80A91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166381BC283E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589D526FDB4;
	Tue,  8 Apr 2025 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K+KXiprJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDB2690FA;
	Tue,  8 Apr 2025 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116603; cv=none; b=FsFhZW0qb7g10pudCjS4gKZF6a6mVCrbuRT/irKMutotPk/YWq3WgaST2uQibJsxP/xdTDBzRU5cRskmRyPFhelnaAER2K0Qm8i7fkNmwDjXSavoixyBAHe/DJHjrYECSd+pT8wnuTJkyl+Ij3UGyFJ/E7oq9pLTjEVwJGFg5gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116603; c=relaxed/simple;
	bh=73j1qf9YL3hU1SMdWBZfA+7cHrnKgYDUNSDw78DjbwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H21Pl922CX6aO+DbPtCmxkTco7mHvOg5V2IYUKjeCtwUX8OZ7gaRwbUrYSpl7CLCvz48eNCV8VIo0++yvlDtbiIxCFXu/d6weEqlkH04mW6Wn5vVgpze+4EDdJu6VOTV6f/+/0Yrd0U4ysZP4wbaPb6b5U3FWXfLVsAQLoujyjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K+KXiprJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BKpQ6020241;
	Tue, 8 Apr 2025 12:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G1Bvs+ozikQLgQexasi4DPTPq+M6ZRH/p0uSEU235o=; b=K+KXiprJjfjRrt33
	66feO8MgDu3Wv507V4ZXOlFaQXiRRtYp4dCfJFbUX3pz9RskI+Su/QCq1q69H2Lo
	tLWGyVbfYGjstr+WLDtmmmst/s498kz/MxuDicGdRnCAsnwO+Wy5AtZ0G+xgs64W
	QkDa1sI+jOEI5oufJvLdS0qAufdhHRbMeaVtPus/pROwkYZ9b8V7d9EYJqnAVNya
	Bz2KlPt8CJ3+2iEKIrtVoTtTvyzFWMvIhaVd8SC7itB3M2+p+t+Q5gDK2BcORUXf
	LusMMnQI6N53xvVTl9xQHLmeYMnxxIKC6KZ+b2AYz6KJrjhA2eW/egOqRj1zNwan
	unEQIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qsas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 12:49:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538Cnvvv021184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 12:49:57 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 05:49:53 -0700
Message-ID: <769be701-afd1-4c14-8e44-fbb25a0c3f24@quicinc.com>
Date: Tue, 8 Apr 2025 18:19:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
 <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nTiDGv2y5f8W4JTVb2sjQarimUPbgkX1
X-Proofpoint-GUID: nTiDGv2y5f8W4JTVb2sjQarimUPbgkX1
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f51b76 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=nIpMe3r6VvzHKAbM5SAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=697 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090



On 4/3/2025 3:02 PM, Dmitry Baryshkov wrote:
> On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
> <quic_mmanikan@quicinc.com> wrote:
>>
>>
>>
>> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>>>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>> Changes in V6:
>>>>      - No change.
>>>>
>>>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> index 0fd0ebe0251d..1f89530cb035 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> @@ -82,6 +82,32 @@ &dwc_1 {
>>>>      dr_mode = "host";
>>>>  };
>>>>
>>>> +&pcie2 {
>>>> +    pinctrl-0 = <&pcie2_default_state>;
>>>> +    pinctrl-names = "default";
>>>> +
>>>> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>>>
>>>
>>> No wake-gpios? Please document it in the commit message.
>>>
>>
>> Hi Dmitry,
>>
>> Thank you for reviewing the patch.
>>
>> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
>> I will document this information in the commit message and post the next version.
> 
> If the GPIO is routed on the PCB I think it should still be described in the DT.
> 
> 

Hi Dmitry,

	I have confirmed with the hardware team that the wake GPIO is not routed on the PCB.

Thanks & Regards,
Manikanta.


