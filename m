Return-Path: <linux-arm-msm+bounces-24518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1E91AD55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B4B281B81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B02199EAB;
	Thu, 27 Jun 2024 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aDFPd0V7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1300199E95;
	Thu, 27 Jun 2024 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507595; cv=none; b=S3Gepw0HVJAr1fMI40vWGwkzFCkGbeBpu8a6BUqNf79veoop82Cl3FKYPRRHq0kAFs6wNpuYM4eNVgx8pjwUUHyeeHk7tC2On7TQw8WsjUSmc1/04sXQzoOxLUnzW/rOYPvHLj9JC4qNIJzp3mR6th1I7siu8Rb9+PIHIBMJpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507595; c=relaxed/simple;
	bh=OK8qeKdyLiF2+ScelglgucYfbnjqFAGloVG5vj4NNhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ukRFqGjuCsxtnfaIxXPAX+Kn7C4plxzUSbUnoZBte763Se90zy1c80VopBCzgdr/VqlNkyYmX7p0U+GfjlABHv0WQYc+sOGG4sgi/mIErryfwWx1sBlnR3YnkjOyBKqKJ63zrwcqEUWiDJ5aTVGf9ui6W6BWh4Z9sKoSf076Akw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aDFPd0V7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RAkNEl003678;
	Thu, 27 Jun 2024 16:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	820qHeoMpUrUkKZikhn+Cg/pSlgrcxZ+7vwwwaAquLk=; b=aDFPd0V7hwygCumR
	1MnDXkP8OwtiR9jKftgWDYOWQg+5Yu6AZLPxMuWWc224RMf1pt3TXtSTFuqIgWyj
	l59M+bs0+S0D3ir2aDNTSErAYVqDisuq1XIygN0088sVgy4QUBR3hJ53j8r//25W
	RA8bzb2QwrqQzaLI5apZhtRpoaFo7z5xYsAuIW39hxWAZSaM7joaorZOGSPiavxG
	TazRtOIa0SK8f3/CKP+vcJLkeqPRRTPrASiFWmVGce87UnL4fbgsxoSODLNR1b2t
	b3CHF96sEJ9lRe5ycLqA45j199noL4/PXWcUlpUAAmDNpRHielZTtYiiYUWw9K5n
	EDHVxQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaf5jq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 16:59:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RGxhSW003983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 16:59:43 GMT
Received: from [10.216.16.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 09:59:38 -0700
Message-ID: <75bca322-43df-9d4e-3dd8-804d9aa7f851@quicinc.com>
Date: Thu, 27 Jun 2024 22:29:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] scsi: ufs: Suspend clk scaling on no request
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_nitirawa@quicinc.com>
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
 <20240627083756.25340-2-quic_rampraka@quicinc.com>
 <97bb4c5a-46f3-4a81-96bf-a3147d9ec78b@acm.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <97bb4c5a-46f3-4a81-96bf-a3147d9ec78b@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aD_WL8aGUEzjm4vN6-sIfPyu2N67iXph
X-Proofpoint-GUID: aD_WL8aGUEzjm4vN6-sIfPyu2N67iXph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_12,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270128



On 6/27/2024 10:05 PM, Bart Van Assche wrote:
> On 6/27/24 1:37 AM, Ram Prakash Gupta wrote:
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 1b65e6ae4137..9f935e5c60e8 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -1560,7 +1560,8 @@ static int ufshcd_devfreq_target(struct device 
>> *dev,
>>           ktime_to_us(ktime_sub(ktime_get(), start)), ret);
>>   out:
>> -    if (sched_clk_scaling_suspend_work && !scale_up)
>> +    if (sched_clk_scaling_suspend_work &&
>> +            (!scale_up || hba->clk_scaling.suspend_on_no_request))
>>           queue_work(hba->clk_scaling.workq,
>>                  &hba->clk_scaling.suspend_work);
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index bad88bd91995..c14607f2890b 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -457,6 +457,7 @@ struct ufs_clk_scaling {
>>       bool is_initialized;
>>       bool is_busy_started;
>>       bool is_suspended;
>> +    bool suspend_on_no_request;
>>   };
>>   #define UFS_EVENT_HIST_LENGTH 8
> 
> Who are the other vendors that support clock scaling? I'm asking because
> I don't think that the behavior change introduced by this patch should
> depend on the SoC vendor.
> 
> Thanks,
> 
> Bart.

Hi Bart,

I guess, Mediatek is one vendor who is having this feature in use as I
see some fixes coming from Peter with respect to clk scaling, where some
power regression on mediatek chipsets were addressed.

Please check below link for background of this change and reason to keep
it vendor specific.
https://www.spinics.net/lists/linux-scsi/msg193591.html

Thanks,
Ram

