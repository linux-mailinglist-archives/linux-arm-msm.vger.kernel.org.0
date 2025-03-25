Return-Path: <linux-arm-msm+bounces-52437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DADA6EC15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 10:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAB53B1C92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2191DB924;
	Tue, 25 Mar 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VSYgpHtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F12F3B;
	Tue, 25 Mar 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742893395; cv=none; b=Mz8bIl3AVKKmChmyEjpR9S6oDwQPO8EvJZkD9miPc4fvlpV/Mv0FSKfLeUVrqi7JkMRSX7dF/Y3DQlK1SBER3KwO8Byn2kGWHJZmOD4mkFrIqHFo9SjwDux6MxaHJ60glihUrr6hWaOpHQrdIcAA8ZiNY/ycdOYPaAAtBX8sQ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742893395; c=relaxed/simple;
	bh=cBsrhRBS+DWfi0cH22u/P2LpI2D5VhhvLbPkAevAy4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DpOGKE3ZzKCtcDLuRI9jfh/9FFq7AwMlCGK8Wh9bReBbMuJOLSN3I7xKH+X/R4MX4YYX8c9gDW8HRrbm0NyilTfQxfOEc0i7ox809bZdOoPEVkbI9PAmIrklYWpoaO32l6HJFOBWof4WZNEjfhFmWqgiQrhk0oY+Y2fmix91KAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VSYgpHtC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vdgi017053;
	Tue, 25 Mar 2025 09:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3UzLSyUtXHxMizmFuAu4gH2M3uLKcvTZzt0VqrRGlo=; b=VSYgpHtCiRnaRI+R
	5G0qbpEo6Fzr4d/RKiXKmdzHIj4w0imQJEkNTsPtf5MHTmtNVXwpkeJ5x3tho1py
	wfa7Q/Vuyj6Dsg3UNATwCglq+ecAIPuWHbUhkZ0fQOwHfqW7GcGRgAQy5wahuUM+
	bQYLs19e/2tKK5iCnjAjdwkEhyCFU31MVSYoXru2IX4n74aXRr5qpNTQ22324ItT
	IxcL2ZU71+untvgqOpvxqaU5vQoSKhzLauPyO30cOslFtAsyUqV3iWWi0qKJKP/s
	4unpm7roV5WCH6IAQlvjV5Mla9vGDxEPM451whXzSHBrGGwwR6qfGM15pknbsgCg
	YtA+LQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcy8vfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 09:03:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P93972029731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 09:03:09 GMT
Received: from [10.217.217.240] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 02:03:06 -0700
Message-ID: <6fcefb33-a488-45a2-b34d-08a85ae7a0ef@quicinc.com>
Date: Tue, 25 Mar 2025 14:32:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] scsi: ufs-qcom: Add support for dumping MCQ
 registers
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-3-quic_mapa@quicinc.com>
 <20250318064421.bvlv2xz7libxikk5@thinkpad>
 <12753be6-c69b-448d-a258-79221f4dbc7c@quicinc.com>
 <awc2ql2x5amiahf7l47xqhgl7ugi4zpk5wz7qycgbqb52gh4yb@24za7q2rqqob>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <awc2ql2x5amiahf7l47xqhgl7ugi4zpk5wz7qycgbqb52gh4yb@24za7q2rqqob>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e2714d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=vDryth-CmtdcD-kvv_8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CvBCXMXlc5vx7cguv5wpI3F2kUAoEa8c
X-Proofpoint-GUID: CvBCXMXlc5vx7cguv5wpI3F2kUAoEa8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=807
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250063



On 3/24/2025 1:09 PM, Manivannan Sadhasivam wrote:
> On Wed, Mar 19, 2025 at 11:51:07AM +0530, MANISH PANDEY wrote:
>>
>>
>> On 3/18/2025 12:14 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Mar 13, 2025 at 10:46:34AM +0530, Manish Pandey wrote:
>>>> This patch adds functionality to dump MCQ registers.
>>>> This will help in diagnosing issues related to MCQ
>>>> operations by providing detailed register dumps.
>>>>
>>>
>>> Same comment as previous patch. Also, make use of 75 column width.
>>>
>> will Update in next patch set.>> Signed-off-by: Manish Pandey
>> <quic_mapa@quicinc.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>> - Addressed Bart's review comments by adding explanations for the
>>>>     in_task() and usleep_range() calls.
>>>> Changes in v2:
>>>> - Rebased patchsets.
>>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
>>>> ---
>>>>    drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
>>>>    drivers/ufs/host/ufs-qcom.h |  2 ++
>>>>    2 files changed, 62 insertions(+)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index f5181773c0e5..fb9da04c0d35 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -1566,6 +1566,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>>>>    	return 0;
>>>>    }
>>>> +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
>>>> +{
>>>> +	/* sleep intermittently to prevent CPU hog during data dumps. */
>>>> +	/* RES_MCQ_1 */
>>>> +	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
>>>> +	usleep_range(1000, 1100);
>>>
>>> If your motivation is just to not hog the CPU, use cond_resched().
>>>
>>> - Mani
>>>
>> The intention here is to introduce a specific delay between each dump.
> 
> What is the reason for that?
> 
>> Therefore, i would like to use usleep_range() instead of cond_resched().
>> Please let me know if i am getting it wrong..
>>
> 
> Without knowing the reason, I cannot judge. Your comment said that you do not
> want to hog the CPU during dump. But now you are saying that you wanted to have
> a delay. Both are contradictions.
> 
> - Mani
> 
Hi Mani, Could you please clarify what you meant by delay? Did you mean 
udelay? That's not the case here, as we are using usleep(), which is 
similar to cond_resched(). I believe both serve the same purpose in this 
case. Therefore, I chose usleep() to provide a fixed delay between dumps 
since we are dumping a large amount of data. Additionally, I wanted to 
avoid any extra scheduling latency associated with cond_resched().

How ever i am open to change it to cond_resched() if needed.
Please suggest.

Regards
Manish

