Return-Path: <linux-arm-msm+bounces-54217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10BA87D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 861FD16CEDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88CC1EB5F1;
	Mon, 14 Apr 2025 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQzfkT61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D407483;
	Mon, 14 Apr 2025 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626085; cv=none; b=goK4/Zq7t5Q6doNL65RUVO4JFyU1FxueWvgJMACJXRTKVdO9+EPEZXragiZy4JCeQI3Fc3EPmhKoTHMHRroo9Ft0iyB+F+p3ZWHqsmLv6laRbUrv2eQZou6xWPzJ6FuiLh8ath1/HGTkw2bFr7BmcjhstbRb6mjD66cRT+/U4n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626085; c=relaxed/simple;
	bh=kLoXWpNU0qdiUX4a8G96bfrHibEz98NS7ZhJfWk43rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AMRfwM/I2pgP6szHkm+yqRFIvCn0pHuXaqNsHRUlLUpV16ENNVtYniQzITL0imi+l4OANOQq9Es2adtOaQsmkkJKOcudgEYTF0SR7sNaENOOr5Z8ClyDLIP9Ym+v06EZOJiGdUq5Cp3Os+dKpbqrzsLuFaklGU5rJ8ErfY47+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQzfkT61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qZP002941;
	Mon, 14 Apr 2025 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asXEFEGh2xmSnnabSs+R4EMdR9kS4bNu32eSF31rOxs=; b=TQzfkT61IoZJX//C
	5uBkqdey1/PbCT9H9CoYozovAUWf2f1tEUnqnM7NZamvspeckfYunWcolZtxYobq
	H7MAJqzfDFo5QfZbCQvOQZWJMsCrllXV+Eax+eOZgCaqm3udrtQH/P6fFhBmXAIO
	jxEKa2QNiAxM3MFb/gUiUH5BZUq/m8QkCHUaGVZxf6pR8YruBSHWVUItUMU68FhN
	UNneS1rSHnWk/ZCumd+fBRBrtehONnQzaEWOsAqdze/W7JqjyURrTj8ywYeDuPVB
	JuzHKHG5Eg2KJPCUjuXFZyKRcWqgdLeVYUqhgvfjgWDMfcRYaej0jE/5N54d0KXv
	j9EZ3w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpm1xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:21:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EALECa005759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:21:14 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 03:21:10 -0700
Message-ID: <c6ea9f41-151a-4b42-beb6-d657672489e8@quicinc.com>
Date: Mon, 14 Apr 2025 15:51:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
 <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BZUYe86G6FZb8OqomLIh0u4eRLEh9oHK
X-Proofpoint-GUID: BZUYe86G6FZb8OqomLIh0u4eRLEh9oHK
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fce19b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=erseW_yTxJpY10KdARoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=844 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140075



On 4/14/2025 3:38 PM, Konrad Dybcio wrote:
> On 4/14/25 10:53 AM, Mukesh Kumar Savaliya wrote:
>> Hi Konrad, responding to one comment which is not working as suggested by you.
>>
>> On 4/12/2025 4:45 AM, Konrad Dybcio wrote:
>>> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>>>> Add support for the Qualcomm I3C controller driver, which implements
>>>> I3C master functionality as defined in the MIPI Alliance Specification
>>>> for I3C, Version 1.0.
>>>>
>>>> This driver supports master role in SDR mode.
>>>>
>>>> Unlike some other I3C master controllers, this implementation
>>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
> 
> [...]
> 
>>>> +    if ((m_stat &
>>>> +        (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
>>>> +        !gi3c->cur_is_write && gi3c->cur_buf) {
>>>
>>> The indentation here is confusing, please align the `(M_RX..` with `m_stat &`
>> I have tried to implement this, but always giving me warning as below.
>> Tried many ways, but same issue, hence keeping it like this.
>> In fact, earlier also i faced same issue hence i wrote it this way.
>>
>> CHECK: Alignment should match open parenthesis
>> #468: FILE: drivers/i3c/master/i3c-qcom-geni.c:405:
>> +       if ((m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
> 
> 
> Maybe let's define something like
> 
> bool hw_pending_read = m_stat & M_RX...
> 
Sure, that would do. Will update in V5.
> Konrad


