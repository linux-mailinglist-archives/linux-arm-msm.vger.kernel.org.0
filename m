Return-Path: <linux-arm-msm+bounces-66500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4506B108E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4FCC3A6BC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C18927057D;
	Thu, 24 Jul 2025 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FrtM7HmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A426D4E5;
	Thu, 24 Jul 2025 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355761; cv=none; b=gKKcmEBA+eTsCk7Wl3oiQ3FwXh1DiiS3BBuTRxAOsDmmEHZCkgAymBezmVxSzWEl7ntSBpCThFFVnUqkuK8kPxH7NkajlZGFMiiVsCFJOM2d/r1kn/oQ5KJm6tbPYoDcIvG+JTY+mUPLC8JcxlXS7RP7neXMC7zuvdO6cfZ2i3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355761; c=relaxed/simple;
	bh=VpHmVVdQ0c8Q7OUEjzS083kv4RgxKpTN+CDVpPhMGQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V9z+PRLL66e/f3irF0tnj5Eb1L+5QC4xRtWk7BPo1WvaSSD/7q0/F0LMLrwEWeLiKxFo5Jk5nH2koJU3B0DFkKY7sN7rnL2SEBQYAIyjl8O86W9ADipqRWUaYs4+hu5w07UxBdCO6844AmxgvRAh7kqJhqozVZH08gu5nSXTnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FrtM7HmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9ZhgY001529;
	Thu, 24 Jul 2025 11:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQdU1Oo2rKGAgNAMJSpMpvT7kgzBRMYs5MEbj1ju3pM=; b=FrtM7HmU78r24/4J
	MmrXophPaHCBfZUlOQkJO0z1/X382TFSVTtdigvbY3lOsehxSnl0L/zj+WaLcp3l
	xtMefiBxMm9wBy0OBFneXIo2EROku21yxzYrwX8pWx8XdaB8iSk+rwVcmwYV38xP
	NFZfaiVKxNTmmj4O5UGg8iYSIqWrqDHOdjaDTEXNtaZK+QHypi8UBNRz7jYjO/B9
	3S5RMWE/uNPf5LSL3mifxAjs1m3cbllcJoAB+C8j1kBHiM7SQGhe9OMRVpO9ctFh
	cUttBhrG6ORkR7/YzImUWis+0Ez+kNkkB3xxa0ui32wEiLBCPD9bIhkQbS1kZnJD
	7PE6ww==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1uf351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 11:15:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56OBFpTq027183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 11:15:51 GMT
Received: from [10.216.46.74] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 04:15:42 -0700
Message-ID: <22848e2e-bd7d-486c-b481-c624d230d327@quicinc.com>
Date: Thu, 24 Jul 2025 16:45:38 +0530
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
 <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
 <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688215e7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=PLseWDGyuym30XmulU8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4NCBTYWx0ZWRfX5WsL3iCrXrMS
 28w7E4q7DYTE526jjq0+9cDlBUMHMimABLSZojicuqkSJTgBKroOEv2MtLqkjXahGM/dT0ZghTP
 55lrF2QZ4R2Ek+Q/f0vOI+5YiFq0Fa9EQQNjOGlvjFZar8yi+oadXy9u/l0jRWwScncfXdQ/FAJ
 wbNsQCxqMuO4QKjkBh3CXOanCCat07t+g+6r55auAnwwLHSg6vWlM33iCea3fZCCuGaoDlkGVCg
 cHi3JLK6v8RbL7h0+Exg9dSW1d8Jkk4M9HN0fey+fQBXFeWhafSxM1RTeL2bgHA7i3AuTpZPY0A
 GgUjlrX2uUuJJJqNxrrht6lGwNPxmZCD9KhTDHmunyOks1K+tk2e48eYkRcZDCHXHeyYJwY8LeC
 FVW4xwU5e99aOdfCOZ1c8FVYjXSc2FQykeEVn+u8ki6YS0zeszuarE0yRM1C5g63fGgy9yft
X-Proofpoint-ORIG-GUID: 7Xsaui01arsE-uz2BIeR8A5sDvW8ko9I
X-Proofpoint-GUID: 7Xsaui01arsE-uz2BIeR8A5sDvW8ko9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240084



On 5/21/2025 9:11 PM, Dmitry Baryshkov wrote:
> On 21/05/2025 18:36, Sarthak Garg wrote:
>>
>>
>> On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
>>> On 21/05/2025 17:35, Sarthak Garg wrote:
>>>>
>>>>
>>>> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>>>>>
>>>>>>
>>>>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg 
>>>>>>> <quic_sartgarg@quicinc.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>>>>>
>>>>>>>>> Could you please mention, which platforms were tested with this 
>>>>>>>>> patch?
>>>>>>>>> Note, upstream kernel supports a lot of platforms, including 
>>>>>>>>> MSM8974, I
>>>>>>>>> think the oldest one, which uses SDHCI.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This was tested with qdu1000 platform.
>>>>>>>
>>>>>>> Are you sure that it won't break other platforms?
>>>>>>>
>>>>>>
>>>>>> Thanks for your valuable comment.
>>>>>> I am not sure about the older platforms so to avoid issues on older
>>>>>> platforms we can enable this for all SDCC version 5.0 targets ?
>>>>>
>>>>> No, there are still a lot of platforms. Either explain why this is
>>>>> required for all v5 platforms (and won't break those) or find some 
>>>>> other
>>>>> way, e.g. limit the change to QDU1000, explaining why it is _not_
>>>>> applicable to other platforms.
>>>>>
>>>>
>>>> Thanks for your comment.
>>>
>>> No need to.
>>>  >> I agree with your concern but for me also its not possible to 
>>> test on
>>>> all the platforms.
>>>
>>> Sure.
>>> >> Lets say if I want to enable this caps for QDU1000 for which it has
>>>> been tested and on any other upcoming target after testing, then how 
>>>> can I proceed to enable?
>>>
>>> Let's start from the beginning: why do you want to enable it on QDU1000?
>>>
>>
>> QDU1000 is one latest available target where we have enabled this and 
>> tested. This has been enabled to save power.
> 
> Isn't it a powered device? How much power is the save? Is it worth it?
> 

Sorry I just did basic sanity on QDU1000 device to confirm its not 
breaking any eMMC functionality and we have also tested SD card on 
SM8550 as well.
For power no's we have stared internal discussions and based on target 
available for power profiling with eMMC device we will come back.

Regards,
Sarthak

