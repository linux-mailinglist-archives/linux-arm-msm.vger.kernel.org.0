Return-Path: <linux-arm-msm+bounces-58935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E39ABF7EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34E94E681D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325821A23BB;
	Wed, 21 May 2025 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lhSNXCaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074F17E;
	Wed, 21 May 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838118; cv=none; b=bI4zqDPhBSeq4DSgQppvbaCiIwoSKeYgNX0iHuljXc0Dm5sn8zZXY+iOWlyXmq/ZUrrwTqJoHs6TCmIuzdw1NSJZfz9cXxwik11hbtPv+Rd5SrHDWHUpw1Btwj5kSwlV8OC+2sho3iRwDmhlPbGyW5eZPtDK5JfoCh/MDggh1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838118; c=relaxed/simple;
	bh=veu47vSPRuMY3BFKfaW2HjMgYFi0qq1J7X2WA7W9MVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dTIP3lZls0fC1DVRQhhT2Pygp3Xc3o0cmz1BBTOip56mrOLnK7h9PkfpaVa7IwVaaDeFObp8Wrvc2oqSZ6IIuAGV5irOPp/kTW/iBPDNmqA3TX4Cl0AiHereMEf4oKRF+RY1joE54WAffk2LKjDHxACLN7Yv3Z/EooCwn1zROSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lhSNXCaZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XQ9l024842;
	Wed, 21 May 2025 14:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSelJosRQQr6P145Vz3bihOWQkyaaUABGHRyIAFvLx0=; b=lhSNXCaZ07R+iEsF
	YSdyF/AYo2YrKtxDmzCEPd5EIRPX4R6xLMJaofi2/kYE4dg6BT7RkNMUpylEG+P1
	ezDlY6QS7HzUSEnAErdAjq6ZwKyhIoAIqzqJCmV4VpStfKm2fuubHFOQHV1NdPdD
	GhSLWhIOETQzSmaN8zZrcpOIxcQ99aw4afe24+soHri9aGy+TaJw3R+CfCGjOmoP
	HbHqPyRrrlc2pZimlM8ZcnNI/T+A/bQ1uz2CUuz6/AUZHBEOGWV/L1yka86BlOkG
	jlfgs6WZqpVTqD6BwIbjDNrgbx5mfwbXg5nr9RTZkHvzdYIdN0kNaQdkBdSmiNuq
	m2gp4Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4u7ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:35:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LEZAxc019764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:35:10 GMT
Received: from [10.216.4.234] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 07:35:03 -0700
Message-ID: <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
Date: Wed, 21 May 2025 20:05:00 +0530
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
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7CEKsOQPB3P7aNcKQ2kkcL2rUL4K9zzp
X-Proofpoint-ORIG-GUID: 7CEKsOQPB3P7aNcKQ2kkcL2rUL4K9zzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0MiBTYWx0ZWRfX76p9aUikeDAS
 LqPs3t7nnszkgsBMbRWPj2+YQHUTt/PcKvllBijvRhGaPp2/hRM32kfee+CJLR7rAgtY/7yZWT6
 Hc8vgThhkCSjS9MMQmvVv3nDYxjNYi9lo3b71fbcn8i+6EifGR6/dqURx2nrKyChjc5Y7mJ7ga5
 NjePNO70oN+mWmRwTZintCwR7Yt0ibcaTi4WA3xAcjvOo1srhF6ILw32RsYhbVbWOXrg6NBfDzN
 DdBT28DDK+J8G6RYsklXOckkmSYIvPso7bNz8na5quRDp1LZRm9suu50r6pUMaElx7DeWfozPIt
 V2lkC+/nZhHlq6tThHoRpKtsWof+x9LbqszG6P8FZpsyNkQW/e73HzCftvsNRwfeYvvhVLxYAJk
 HLImRnXSl5QP6iJx2e6XzA1Cbn3mfwcnquhLdVUj4DRWTxA57NTFnpeN86Kr77A9wt1Jd+CC
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682de49f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=3-RhneuVAAAA:8 a=COk6AnOGAAAA:8 a=E96v1nl-JPjVRj45kqQA:9 a=QEXdDO2ut3YA:10
 a=VLVLkjT_5ZicWzSuYqSo:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210142



On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>
>>
>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>
>>>>> Could you please mention, which platforms were tested with this patch?
>>>>> Note, upstream kernel supports a lot of platforms, including MSM8974, I
>>>>> think the oldest one, which uses SDHCI.
>>>>>
>>>>
>>>> This was tested with qdu1000 platform.
>>>
>>> Are you sure that it won't break other platforms?
>>>
>>
>> Thanks for your valuable comment.
>> I am not sure about the older platforms so to avoid issues on older
>> platforms we can enable this for all SDCC version 5.0 targets ?
> 
> No, there are still a lot of platforms. Either explain why this is
> required for all v5 platforms (and won't break those) or find some other
> way, e.g. limit the change to QDU1000, explaining why it is _not_
> applicable to other platforms.
> 

Thanks for your comment.
I agree with your concern but for me also its not possible to test on 
all the platforms.
Lets say if I want to enable this caps for QDU1000 for which it has been 
tested and on any other upcoming target after testing, then how can I 
proceed to enable?

One option I had thought of was to implement this using compatible 
string, then for all the upcoming platforms using this compatible string 
as a fallback.
But this doesn't look optimal to use compatible string for just one flag 
and also this capability is not platform specific and we will be needing 
for all the platforms. Please share your opinion on this.

Another option that I could have thought of is using device tree based 
approach but seems that was not accepted earlier :
https://patchwork.kernel.org/project/linux-mmc/patch/20230129023630.830764-1-chenhuiz@axis.com/

So it would be helpful if you can suggest some approach?

