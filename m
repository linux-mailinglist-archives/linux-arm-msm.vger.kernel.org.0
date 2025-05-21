Return-Path: <linux-arm-msm+bounces-58943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7EABF9F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403003BE4DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA6F21324E;
	Wed, 21 May 2025 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eANismHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85F1DF75C;
	Wed, 21 May 2025 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841781; cv=none; b=ZvjX8S4Qc9APwlW8uVQmPm58p3fTMAXwcZ6Iu/214X1Sr8do1/ntzmc8Aj3QHMQMDcuSfyqdHYJQwi5aMzxw19MFdC1ESx36WSMCxUJMHDaX9xJbcsmPADLslbaXrJQHDOqY5ZDuNL+codHK3TrchRayPG393yVoYMrKLaV72AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841781; c=relaxed/simple;
	bh=UTL7SiFKKvOirXMWemCxFWYzpc7Z7sQJ6etd7+yLdJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c+4rnGHJH8YVu6D61+H2nys5H75ZC08ouKYQ0EhXRYG0qx68i/biDoWL7WkfHa898lYGGanuulgNsB2aDC+ZreEkvJ4Z/j/QXBL6DDzCaP60YAd6HwbF2A4GytU4oiC/oA4sgjc6sOiQIWaHDOX5T9x+7vscwmATvprF1OWTRbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eANismHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XOmF031739;
	Wed, 21 May 2025 15:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAN7xfkdJsrXYCucX4LVEeFg0XuifoWsEtiNMI5kgDY=; b=eANismHFHFbQ2dTq
	wG0qJcNzA+Fz1YnQn+YInyJQSvA0A6huiXpkoKt0ehDZ7qe9pxI6lTUwWZeJxcfF
	EiajszFCy715GZmqv192vkltPMBhil+EeEfTvU/g7xrahV+vKjF3NE2G7Uvyxaz8
	YipqXrilE2DnPz4ltWTPDcn7Y3ysiFGZsC0FIIqQuRoCaPUikaM7736/9SJeP6Ln
	ybqFXQeFRodEnzxyVjwoAd2YMX6lCRVEe5uAY6PF3nGGJmyYmfH6Ut6a65rw56hE
	HaeKndVbIY1OLvU56eJThdrLUOrPGTziRFJNub5kHKP2IDnUq3LMyhXfMB8UNgbZ
	piba3w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21y52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:36:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LFaGa8020603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:36:16 GMT
Received: from [10.216.4.234] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 08:36:09 -0700
Message-ID: <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
Date: Wed, 21 May 2025 21:06:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@quicinc.com>
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
 <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
 <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1MiBTYWx0ZWRfXycaR8XK+Fduw
 +ZgDebDCDvHwGsl6adYwh8XMmlX5X45iGWHs6UmlplNA5nO+cxy1Jsc4NEx2DNAfzHzBuCOpLR8
 rwOzjQJW5nTtdAA9KfgX8P5Dya6IqV1msratNOf2lLDZv4tDe4tEK6EjHaHautgDNHNHjz3Udbo
 SZl7MySiXkXjK+HbN2om0CuMNNq/LnVi6GlOEmFUmmwuYOkM3HjuNszKT150a3ERj0jcYKtz7Vd
 d2pAzMcRU8j5BjNNcKAgFC77SUQPv5tqOU1IV9BNLsyi/iZd+rCYU1+L4YuqsWaesMh/T4Jz9nK
 WABlgmRWNBb7HTGNSnYKfUSteL5Ct/jw5Qq7HTticXuDuxyj7SuCni2dermbUpVBNpDEke6BeTf
 qOq7cR+ixFHlLiNBScUGgqeET8Ab0Zk82N5rbAQtYf5mx783B/hUiGjE4M7nbzstcBKkvECn
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682df2f1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=3-RhneuVAAAA:8 a=klJr9PZRHvcjy1RyZuwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 6Ol0jiJbRU6L-foP8B6koTEcKUMu5vfI
X-Proofpoint-GUID: 6Ol0jiJbRU6L-foP8B6koTEcKUMu5vfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210152



On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
> On 21/05/2025 17:35, Sarthak Garg wrote:
>>
>>
>> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>>>
>>>>
>>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg 
>>>>> <quic_sartgarg@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>>>
>>>>>>> Could you please mention, which platforms were tested with this 
>>>>>>> patch?
>>>>>>> Note, upstream kernel supports a lot of platforms, including 
>>>>>>> MSM8974, I
>>>>>>> think the oldest one, which uses SDHCI.
>>>>>>>
>>>>>>
>>>>>> This was tested with qdu1000 platform.
>>>>>
>>>>> Are you sure that it won't break other platforms?
>>>>>
>>>>
>>>> Thanks for your valuable comment.
>>>> I am not sure about the older platforms so to avoid issues on older
>>>> platforms we can enable this for all SDCC version 5.0 targets ?
>>>
>>> No, there are still a lot of platforms. Either explain why this is
>>> required for all v5 platforms (and won't break those) or find some other
>>> way, e.g. limit the change to QDU1000, explaining why it is _not_
>>> applicable to other platforms.
>>>
>>
>> Thanks for your comment.
> 
> No need to.
>  >> I agree with your concern but for me also its not possible to test on
>> all the platforms.
> 
> Sure.
> >> Lets say if I want to enable this caps for QDU1000 for which it has
>> been tested and on any other upcoming target after testing, then how 
>> can I proceed to enable?
> 
> Let's start from the beginning: why do you want to enable it on QDU1000?
> 

QDU1000 is one latest available target where we have enabled this and 
tested. This has been enabled to save power.

>>
>> One option I had thought of was to implement this using compatible 
>> string, then for all the upcoming platforms using this compatible 
>> string as a fallback.
>> But this doesn't look optimal to use compatible string for just one 
>> flag and also this capability is not platform specific and we will be 
>> needing for all the platforms. Please share your opinion on this.
>>
>> Another option that I could have thought of is using device tree based 
>> approach but seems that was not accepted earlier :
>> https://patchwork.kernel.org/project/linux-mmc/ 
>> patch/20230129023630.830764-1-chenhuiz@axis.com/
>>
>> So it would be helpful if you can suggest some approach?
> 
> Worst case, just tie it to the SoC-specific compat string that is 
> already a part of the bindings.
> 
> 

Sure will try to explore better solution before going for the worst case.

