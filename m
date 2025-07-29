Return-Path: <linux-arm-msm+bounces-67016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7CAB14F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1783BC3EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2FE1D8E01;
	Tue, 29 Jul 2025 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UJRrIw/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204D71C3BFC;
	Tue, 29 Jul 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753799971; cv=none; b=BXNBt06bxBsVtYGZDrbRdT80DITqJZi/4P3z0yDSg6vLKc3PAxh8qiobuXYyVtckF6v1YdXI1+Eam2tojCjakwSKCM+aFVPFrjVGqUhtzYi77w9uZgKHmeuNtjyjFFqA2Vih7H2PwUN8UbDxhBHM37kWP10KqZFnEZ8KFVEVgLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753799971; c=relaxed/simple;
	bh=pMU2OSNH3+7WmAmc4OQkGAuEXy2akRIsfAbl+PqskoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y7xEPECDWeG8cAjgEaY9sfvh7ffkjCDoujledsMbdbjAE7FrC54Mz/XPQWSYM8XwRZwFCPNc6EaLd4yaqemZc3afu0tVGZFZwWyfg39ZxRJTnRr8QXqaS8C8bORpsMYdBUmgUpZHz75ZPFCsY22eV64qPUavgb+eTbnTDqA3AcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UJRrIw/3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9qdaF019418;
	Tue, 29 Jul 2025 14:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSqa+8jf1mRhHxk5cDfpJZjqT/nDDTt36/8KgHlImIA=; b=UJRrIw/3iIQx2+/g
	OEUbiqQyvMvLVJegf9MGsi2xC6vP6ytWnC2RyJFh2jnHJMQwPsAWdfzu+Uz810Z3
	6J4nQ2zr2kJdxg3RDcj6/Npl0Z3W5PSfUwq4IqJt5vJFMb6uAbfTnEasQJpQgujn
	PIhodxBFxrAp4eVniAiCAjhQBI1KPjk+VoK/3/7WACAQ27h70/h7Mb/SpYcfftgQ
	gqMcKZdy3n4+ytxPvT92K/4V2VXF8nhNIzyqWU1Ag9/TOjUCBWwhSzqAS1wZA1dg
	z3XG+N55K7l3BMz3O5CvF4EI5unA2J8S2ZXWLbsh4DRfqyQzd91LNNipFsRdYQRu
	JjdvlA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2gbyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 14:39:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56TEd0mU012782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 14:39:00 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 29 Jul
 2025 07:38:56 -0700
Message-ID: <1b418968-2a53-443e-8766-9d280447bb2d@quicinc.com>
Date: Tue, 29 Jul 2025 20:07:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
To: Bart Van Assche <bvanassche@acm.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <James.Bottomley@HansenPartnership.com>,
        <huobean@gmail.com>, <mani@kernel.org>, <martin.petersen@oracle.com>,
        <beanhuo@micron.com>, <peter.wang@mediatek.com>,
        <andre.draszik@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Palash Kambar <quic_pkambar@quicinc.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
 <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zPQjVRaClD9MVTJ-ioqRd9_YUinhhsVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMiBTYWx0ZWRfX/8cqitGdm+dP
 LDsn6aUjT9k4v7+lecGVERIlS2ZHUAQfr+0S94thQ6+a1LMt6CT/nvX7/ZvY7AtlXNUZzZEmM+t
 sTSOkm/tUz9htpN0fUTtUzK9SQDr7eHfk6K1C5a6OC+2pn/ZTnBXDNAoT+kjCKczvA3KfvQaaK1
 o+GTpQVz8j2BYQ7yH0b2czgdEj/h9ynYEBEldwoQJ0uBHB1251Qu6B3zh07YsV/X98C1txh468L
 Qv85+PHZfdnT9R9ikLw7x838UGmkQ9BofyiSZoDlNwvNgoGnu4pMKUiGJiJsqnpwkvEOEhesJK1
 fB+6aElm5rkUnVtFlnhi8I96jBWCjvdBnlqonHcgnTOYYJ6gSpful3gZes5QnwZ5FkW3GXMRSaW
 1dTOjGQOz4YihM4FHFBRA5hK285T6Egvv8eG0jPHEfOQU0z4nqXMbV6Cpv7w3GSJKmOwTYo5
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888dd05 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=N54-gffFAAAA:8 a=ihll0qYU2PzsKsSyJ9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zPQjVRaClD9MVTJ-ioqRd9_YUinhhsVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290112



On 7/29/2025 5:11 AM, Bart Van Assche wrote:
> On 7/28/25 3:57 PM, Nitin Rawat wrote:
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index fd8015ed36a4..5413464d63c8 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -7145,14 +7145,19 @@ static irqreturn_t ufshcd_threaded_intr(int 
>> irq, void *__hba)
>>   static irqreturn_t ufshcd_intr(int irq, void *__hba)
>>   {
>>       struct ufs_hba *hba = __hba;
>> +    u32 intr_status, enabled_intr_status;
>>
>>       /* Move interrupt handling to thread when MCQ & ESI are not 
>> enabled */
>>       if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
>>           return IRQ_WAKE_THREAD;
>>
>> +    intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
>> +    enabled_intr_status = intr_status & ufshcd_readl(hba, 
>> REG_INTERRUPT_ENABLE);
>> +
>> +    ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
>> +
>>       /* Directly handle interrupts since MCQ ESI handlers does the 
>> hard job */
>> -    return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
>> -                   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
>> +    return ufshcd_sl_intr(hba, enabled_intr_status);
>>   }
> 
> Hi Nitin,
> 
> Thank you for having published this patch. It seems like we both have 
> been working on a fix independently and without knowing about each 
> other's efforts. Can you please take a look at this patch and let me
> know which version you prefer?

Hi Bart,

I reviewed your patch and test it locally—it resolves the issue.

The patch looks good. Since this path handles only UIC, TM, and error 
conditions with no IO for MCQ, we still check for outstanding_reqs and 
UTP_TRANSFER_REQ_COMPL for the error case within ufshcd_threaded_intr in 
the patch. In my opinion, we can skip these additional checks.

Thanks,
Nitin

> 
> https://lore.kernel.org/linux-scsi/20250728212731.899429-1- 
> bvanassche@acm.org/
> 
> Thanks,
> 
> Bart.


