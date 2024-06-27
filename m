Return-Path: <linux-arm-msm+bounces-24410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B091A124
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 271DCB20E65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 08:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11B5757E5;
	Thu, 27 Jun 2024 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bxXYBJmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E97347E;
	Thu, 27 Jun 2024 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719475812; cv=none; b=ohTbbjyCd131Jx4amzFQpnbmBE/pXiZvH99gKgZaHzs0HFGNs7+Lj6GA1gYrrsT9/QwqEKFGdavOV+nrJch60UNU2Bztmv9NuMgHQAXoA6aGGNMAfHHN5AS2QCNEWIl2nBgo6ee3O/k8xKraIWlscaxd9Z1nBgT/o2rM3MtSGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719475812; c=relaxed/simple;
	bh=xDyTyoeI1VuJlGefld+tIbNLH6VCcawSWoGvoI+SWKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g/BgBeyCeHlMKJAoUVzXI5K1NBoE4cdkP+hqnjzLnDf/lS4cG3ptYy15IuMAzLjDIr1O6RCR3uft/d0Psv6X+P3isazjffx4NaHAIKnfv9IIa/w1zyiWj94oreHfaNu1En1NbvK9YdcIVYqqj6ufn3HwHEb7jFAB0Fqm13TbQHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bxXYBJmZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLWwWS016787;
	Thu, 27 Jun 2024 08:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8A3+UZe/s2/aGmK+AWtOXTtUzhTHTpKaxbx7hqese0=; b=bxXYBJmZIsitTjT2
	i0l2wThLh2RDW7koAEEMBlKJMjGIhY3hbyTdAxAh2gCHtmiKvYQLDwmoEXeHUNp/
	TVWxLBDRe9ay1eRvFg/W1ZEqqSH9bmIJrst8VFs+tHpQ09ntFuf0lnHRPCRFnbU5
	RtNsXUWsM6tcH2a/rWudAyrc0VGiC3WK6nesYs9B8e1TvHFcpDs9ivG+oitgq4xU
	1wnMqlh7HFh41kTjk9nX6f5rVmegD16PORoAifVOEoIoWTmNQsqfonXIklZd+gPq
	I4/bJRS8o0hqqh+PAX5DIQTxqNnbh0+cCachaVck+1ZZjYBe8zFfn+2bdfOP51Fk
	kdtzRg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yuqds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:10:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R89xip008426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:09:59 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 01:09:54 -0700
Message-ID: <18692eb6-189c-f67b-3647-8b33f3ee7808@quicinc.com>
Date: Thu, 27 Jun 2024 13:39:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] scsi: ufs: Suspend clk scaling on no request
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_pragalla@quicinc.com>, <quic_nitirawa@quicinc.com>
References: <20240626103033.2332-1-quic_rampraka@quicinc.com>
 <20240626103033.2332-2-quic_rampraka@quicinc.com>
 <62m4bfyhgzidseda2mduetaq4b2onlpjkxzsc3skc3fx7iw3xh@eyt2nwn2cuoi>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <62m4bfyhgzidseda2mduetaq4b2onlpjkxzsc3skc3fx7iw3xh@eyt2nwn2cuoi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w5YFbWmlXosanD3df6k7R__Owj7UWoDE
X-Proofpoint-ORIG-GUID: w5YFbWmlXosanD3df6k7R__Owj7UWoDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270061



On 6/26/2024 11:14 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 04:00:32PM GMT, Ram Prakash Gupta wrote:
>> Currently ufs clk scaling is getting suspended only when the
>> clks are scaled down, but next when high load is generated its
>> adding a huge amount of latency in scaling up the clk and complete
>> the request post that.
>>
>> Now if the scaling is suspended in its existing state, and when high
>> load is generated it is helping improve the random performance KPI by
>> 28%. So suspending the scaling when there is no request. And the clk
>> would be put in low scaled state when the actual request load is low.
>>
>> Making this change as optional for other vendor by having the check
>> enabled using vops as for some vendor suspending without bringing the
>> clk in low scaled state might have impact on power consumption on the
>> SoC.
>>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>   drivers/ufs/core/ufshcd.c | 3 ++-
>>   include/ufs/ufshcd.h      | 1 +
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 1b65e6ae4137..0dc9928ae18d 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -1560,7 +1560,8 @@ static int ufshcd_devfreq_target(struct device *dev,
>>   		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
>>   
>>   out:
>> -	if (sched_clk_scaling_suspend_work && !scale_up)
>> +	if (sched_clk_scaling_suspend_work && (!scale_up ||
>> +				hba->clk_scaling.suspend_on_no_request))
> 
> Really a nit: moving !scale_up to the next line would make easier to
> read.
> 
thanks will take care in next patchset.

>>   		queue_work(hba->clk_scaling.workq,
>>   			   &hba->clk_scaling.suspend_work);
>>   
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index bad88bd91995..c14607f2890b 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -457,6 +457,7 @@ struct ufs_clk_scaling {
>>   	bool is_initialized;
>>   	bool is_busy_started;
>>   	bool is_suspended;
>> +	bool suspend_on_no_request;
>>   };
>>   
>>   #define UFS_EVENT_HIST_LENGTH 8
>> -- 
>> 2.17.1
>>
> 

