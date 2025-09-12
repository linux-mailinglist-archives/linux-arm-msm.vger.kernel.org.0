Return-Path: <linux-arm-msm+bounces-73373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6EB553FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6923D3A68A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8BF3164D1;
	Fri, 12 Sep 2025 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hxY0vKKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A6A3148CB;
	Fri, 12 Sep 2025 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691885; cv=none; b=NGtlgpFOFun983uWRZs0Db+mzIHIIzHwso/NBmyTHJ9kJZpW1iyaoaD7Dto25VnuWWzhWGHDzMNowERvUA50yku2TvkFp5oNzipQBQns9wib9gJIQxe9TRBcIbEhn5xsQC6CC/5cTrywaqkycapCdcBKEijawaipe9REi3UpbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691885; c=relaxed/simple;
	bh=+INx+EczxD4lJWKvMj4ClWfFVfQH/J8+YWJu7kW/75o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=WNP6nK4uzqS3UJHbUItl7r0TTbTuAXqj0rkk7WlUnInDdNw/tXiQ4A5JiP0W5YIO8sVXUihgofUQdK02oTopMi/LQpb1bVtsn2r5zOQZWx4PVHW3cJouUi1Kmf3hzJFcBDie1n36E73667F0z2ZlkRMge1poEdDkF9L8z9S9BZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hxY0vKKd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fMtD010869;
	Fri, 12 Sep 2025 15:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IAk42iJS0yRPhOn5yRi9TvJyRNPiIsDtXhwUt5xgQQ=; b=hxY0vKKdVq83sJu4
	Sl2WHz2WtLkVZxq+LJ2ZuiBNT5BuS/Wqs74f0ChVDKuAtWvF+4LKaxox/JjZj4TV
	2Q0/kg83S0ZHwS+DPFdx/hDtPaJf/qdQgAUrBT8MPR7zdIhEN/pRjTU2DtmNTUOi
	BymvSg/8lKTRxxx+LxKvBwg5PD62LD6pQ/a2iWn0ZnRfFO0DFpNzPWVtPwwsHoF/
	XH+pQcgOk2nlZLUm7HvfBRjH+EV2oza0oKJkOjH+aKHmwPe40T9z+YJhco8Qulxl
	QUq6NOi2/iYRkVnaHxCFPlrr4anB5i0aOSPfgMNBb6RxfdiUjxIKgx4UciQkzdcU
	w8podg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mbwg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:44:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CFiUcQ026663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:44:30 GMT
Received: from [10.216.4.185] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 12 Sep
 2025 08:44:26 -0700
Message-ID: <ea81a84c-738e-4e70-a0d4-e5f6d4b1064f@quicinc.com>
Date: Fri, 12 Sep 2025 21:14:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <20250902164900.21685-2-quic_rdwivedi@quicinc.com>
 <20250903-sincere-brass-rhino-19f61a@kuoka>
 <2360f9f8-470d-46dc-be9e-660bb1580428@quicinc.com>
Content-Language: en-US
In-Reply-To: <2360f9f8-470d-46dc-be9e-660bb1580428@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0JapTBMUOYmz
 APB5wiG5grcI2sQCDNE5IK7KPRxSQd+CFpXVFm+JLHPA1OP79NGto8ZNEvrZNlN1CVqcopSzOph
 UnweGYZPaTCGVI73ZtY/t+MfjRlJ8O/MD5gFgU+ImUlOwj7dgotNhyp/loMqDM+f/b4Ta1AcaPn
 MbHlU60EnhMG/Tj1KFijiZ2140IpKckRX1hcjqOZf+DRRw6M1wO2DhsfVXZjWyPpDVf/PsWHswA
 RV+LPJwBo5XELRRNUFBja3bk5eRDAmSUj/hc8NSKFtUxfjvtjYENYjLhV6NI/RhU+oa+wWFsFG8
 Ihk3spJebSPOV548hNNw02uNLDl5CL+jkVKUoU5voCRFhJcTM7prMZ1eCBQUraZ2UGlpXFyuDqE
 hlbAgv6y
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c43fdf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=6J4vfOP5DY3b7vCg3ysA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4ML3zZufXJz3LYU5fcKMRBKWvOjhKaWv
X-Proofpoint-ORIG-GUID: 4ML3zZufXJz3LYU5fcKMRBKWvOjhKaWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038



On 09-Sep-25 8:28 PM, Ram Kumar Dwivedi wrote:
> 
> 
> On 03-Sep-25 12:14 PM, Krzysztof Kozlowski wrote:
>> On Tue, Sep 02, 2025 at 10:18:57PM +0530, Ram Kumar Dwivedi wrote:
>>> Add optional "limit-hs-gear" and "limit-rate" properties to the
>>> UFS controller common binding. These properties allow limiting
>>> the maximum HS gear and rate.
>>>
>>> This is useful in cases where the customer board may have signal
>>> integrity, clock configuration or layout issues that prevent reliable
>>> operation at higher gears. Such limitations are especially critical in
>>> those platforms, where stability is prioritized over peak performance.
>>>
>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>> ---
>>>  .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hi Krzysztof,
> 
> Alim has recommended renaming the "limit-rate" property to "limit-gear-rate".
> Please let me know if you have any concerns.
> 
> Also, may I retain your "Reviewed-by" tag in the next patchset?
>
Hi Krzysztof,

Just a friendly reminder,
Would appreciate your feedback when you have time.

Thanks,
Ram.> Thanks,
> Ram.> 
>> Best regards,
>> Krzysztof
>>
> 


