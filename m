Return-Path: <linux-arm-msm+bounces-57804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF9AAB6448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 09:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD6D24A1184
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC69217F5C;
	Wed, 14 May 2025 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wi7Wuioj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8501F4639;
	Wed, 14 May 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207589; cv=none; b=DaJo5MuBD3LtAeMOlNA88ghwyFLK0J2Qxw/Ahr1/Oinp564Jgf4ITwriPGBFvdnAHkny3ZINkH4HGhkyYMNX3iDhTe/ccByiTtuI08jbv6FcliRS6DR807Wsp9c0+YR0qV84Ba2wvoBHDpv2G3IWgPQoDaSUKCtl47aj0eQkGII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207589; c=relaxed/simple;
	bh=sm0LNJOmtGN8g+G8nc3LgAZN7j10adbZr0FKkpv6VoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I5zi4CbNpLH1AWUqmIGz5mUYc32UmaQMdawC8u/MdPUsUCI3hNM+f+E7FmkM5xLRDIG+yCxM9SGv6mSjU0SwLTKggRncf5ESPNilflCd4SxIcuEiUpekMmnyWpq+AwKcluvhIEUkBGjGZefZzr2NUpBHqqoF/FN4KqM+sAMjCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wi7Wuioj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E26mZg007826;
	Wed, 14 May 2025 07:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Bm4yFLJeVj/zJGWYwL7wW/NnhgD3btzMiwSwZpR7Ok=; b=Wi7Wuioj8iPCKbGu
	OAMlgag16TWjjoew5AtFFKGZ5sATW0lPFiDDCI/Xcc0GnZ1heRWOongbkarJAF3D
	V0J9Ifo4Kjia8Tkb8Lpx3tXz8anTcIuYIg6C0FTGRj2P+tnK2qKEGoo2SS0XqMxc
	vnympTKkM5hLpWInLKrgGTUSOGWUsM5mblwtDMPk6Rh5KDGI3OzYogS9awZq1/Wt
	Lwo3Bc9ciCcVDGDUtjn3/Z/lCVO6juBzllQ30d0psqhDUAbGRkycEyL0XLV11zU9
	Nsv4M98xIQA9moHO3ijdMrl4joiQUJV/DNg6AUurKrco1pKm7zEObOoQppOoPOta
	yS7HHg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnssnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 07:25:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E7PxVt006424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 07:25:59 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 00:25:54 -0700
Message-ID: <486616b7-9400-4288-b4b4-c56ec628b0f3@quicinc.com>
Date: Wed, 14 May 2025 15:25:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <neil.armstrong@linaro.org>,
        <luca.weiss@fairphone.com>, <konrad.dybcio@oss.qualcomm.com>,
        <peter.wang@mediatek.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
 <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
 <5748d0cc-a603-4b44-bbfc-d39d684b2ea6@quicinc.com>
 <c428f074-c010-4225-960e-56aa65a799d8@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <c428f074-c010-4225-960e-56aa65a799d8@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AgmqrHl9WlQR8wJ9-mK9bylvzcjOkf-Z
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68244587 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=8xSKCfN-9FFblOZXFZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2MyBTYWx0ZWRfX2sMU9T6XWX15
 eEeeS2YQXLnprr7JwLiVMGygpHMd0VmvW29YXDCZkbaBl9HT2FaQPFdhStS28u9ToqEN2DYznwh
 Mujr4B+7vNwBq9G0PISsZYN2M5uk9UpR5ROQGM9gTD2+Po+nN2y15+g/WpGqZwfm4Yr1WEgCJEI
 gVrMJcl+hfp+bIhYfYht16QgLRi6XRdvz2kyfIzLK0t4SYXRY44tFtOjVEZ6J313UmJ5FF82UjE
 P7p7OkdhVn3fPp4FWzobKwjs7lSHTti0bWxaSe8+oxt6ZiRIHjv3JksT9r3yLJ5jgQ3vyyN4t9I
 UriVKbIVwRxShVGYt+4zshtiyZTRI/Cd8hc/uMopZ3FuA8JpVG2NMhUF52AlPEfT3bgGjSLM1X0
 +Q6Uqmf2L2cmcalduMLL58qMrcs1OCExgUKW66kJwWaczDRpVskTYyLMDghgofVlENCEzT8u
X-Proofpoint-GUID: AgmqrHl9WlQR8wJ9-mK9bylvzcjOkf-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140063



On 5/13/2025 6:31 AM, Bart Van Assche wrote:
> On 5/8/25 10:02 PM, Ziqi Chen wrote:
>>
>>
>> On 5/9/2025 12:06 AM, Bart Van Assche wrote:
>>> On 5/8/25 2:38 AM, Ziqi Chen wrote:
>>>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>>>> index 1c53ccf5a616..04f40677e76a 100644
>>>> --- a/drivers/ufs/core/ufshcd.c
>>>> +++ b/drivers/ufs/core/ufshcd.c
>>>> @@ -1207,6 +1207,9 @@ static bool 
>>>> ufshcd_is_devfreq_scaling_required(struct ufs_hba *hba,
>>>>       if (list_empty(head))
>>>>           return false;
>>>> +    if (hba->host->async_scan)
>>>> +        return false;
>>>
>>> Testing a boolean is never a proper way to synchronize code sections.
>>> As an example, the SCSI core could set hba->host->async_scan after this
>>> check completed and before the code below is executed. I think we need a
>>> better solution.
>>
>> Hi Bart,
>>
>> I get your point, we have also taken this into consideration. That's why
>> we move ufshcd_devfreq_init() out of ufshd_add_lus().
>>
>> Old sequence:
>>
>> | ufshcd_async_scan()
>>    |ufshcd_add_lus()
>>      |ufshcd_devfreq_init()
>>      |  | enable UFS clock scaling
>>      |scsi_scan_host()
>>         |scsi_prep_async_scan()
>>         |    | set host->async_scan to '1'
>>         |async_schedule(do_scan_async, data)
>>
>> With this old sequence , The ufs devfreq monitor started before the
>> scsi_prep_async_scan(),  the SCSI core could set hba->host->async_scan
>> after this check.
>>
>> New sequence:
>>
>> | ufshcd_async_scan()
>>    |ufshcd_add_lus()
>>    | |scsi_scan_host()
>>    |    |scsi_prep_async_scan()
>>    |    |    | set host->async_scan to '1'
>>    |    |async_schedule(do_scan_async, data)
>>    |ufshcd_devfreq_init()
>>    |    |enable UFS clock scaling
>>
>> With the new sequence , it is guaranteed that host->async_scan
>> is set before the UFS clock scaling enabling.
>>
>> I guess you might be worried about out-of-order execution will
>> cause this flag not be set before clock scaling enabling with
>> extremely low probability?
>> If yes, do you have any suggestion on this ?
> 
> The new sequence depends on SCSI core internals that may change at
> any time. SCSI drivers like the UFS drivers shouldn't depend on this
> behavior since there are no guarantees that this behavior won't change.
> 
> Can host->scan_mutex be used to serialize clock scaling and LUN
> scanning? I think this mutex is already used by a SCSI driver to
> serialize against LUN addition and removal (storvsc).
> 
Hi Bart,

I tried the scan_mutex, from debugging logs, it seems okay for now.
I will provide to our internal test team for stability test.
And I will try to collect the extra time spent on clock scaling
path with applying scan_mutex.
If everything is fine, I will update a new version.

BRs,
Ziqi

> Thanks,
> 
> Bart.


