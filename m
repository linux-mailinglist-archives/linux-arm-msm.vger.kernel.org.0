Return-Path: <linux-arm-msm+bounces-58846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A840ABECEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9291600DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F39235341;
	Wed, 21 May 2025 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E888eP/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54622D9E0;
	Wed, 21 May 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811826; cv=none; b=HbB1Dmgkc0IjE8xPmgX0Mabv9YnE6+68FbS7rdqXhNOpjhNHokkmGgzzwJ8oYRztioDosm4gdFV3pTEFPpkTf5ev+wIWBjpWUF5eJFY9oOeT9T01txa1huhszbuKYTAnWfAlYFpCv6n85SQPTRkwfidmA9M9tBngH+2JNJoptWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811826; c=relaxed/simple;
	bh=qNUa36tC4ehQNoYWpEZfCwtkUj3t4eJqZLJIdjq8iq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QHXJ/0C4atZH9PVCLZ3Ep76hiHEzFhc9JhMTWr+JEwOMRvmgjXDInz89/xoveDZxtvVLElJc4UiInDCuCGI5Xi2D9KgQOmZwz/y2lx6yS+1AjlejVxkP7NI8U0b6aVqzhx4vMJT/r2qNcR+Jo8L/6wF/iYKWq+rn6XZmBskg5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E888eP/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5j8op007796;
	Wed, 21 May 2025 07:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UL6Lrw4JjvW/AJkCzwZLDM4prXEfs7nKm8UqLCLzCPQ=; b=E888eP/uDZGt+3oF
	Qcbqus3pxNgOsJTluMJbw1XWE09WwIuQtfu5pitBc4nxUaT0t+fToDh5QsjiC3yJ
	ubcOABmtrvpozC+V7aN46Y9edD7wNIhNdr7eieHm3kOk1Xznmfaof3FVyG8WqV4t
	7KyvOkx2L2jY2vEy/ZsN8XQv8X8+Ho/xJS8ubt4myDr3N/xRRk4dInCfVYdlKp/a
	fuK0tbFQI4uKZojQKkI+7vi3clDkRRWturlIPoD5kgVkava05XGweYF/oMSF/Wir
	uedYy04Fy4H+Z0KmCXAglR1JX+2/25e/5WATcHbI5h/mtTevS1fJu7Usr4gc+0Oo
	LUJw1Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6suxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 07:17:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L7H0YX002993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 07:17:00 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 00:16:53 -0700
Message-ID: <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
Date: Wed, 21 May 2025 12:46:49 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_narepall@quicinc.com>, <kernel@quicinc.com>
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cjM1Luu2R9AZVJjFGw9_2rYHBcdON0P7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA2OSBTYWx0ZWRfX1g2iy1fXETtI
 mVLvwsw78XVgvzX7fl7pOknOq8lCsyMdu3hC6JrONrtBkQQt2YQhK2Ld5rtv/bY8AGBGmyS+7pw
 NztIrp5bLaWxiJgpKAN5l2thwwxed2LCFg7KTEiN+EN/u+hWZ2y2SzHbOz7PfngvDaMLMaoQqDe
 ZxDJsMwhQ5BPeJwN0Rl8V/hduDwib9jkgze/6dHua0m5hO6mVo/gg7LCaRWAV8ONZkbAc0yNbbp
 cWHYoZWpgofAs1pgm0T8bJ161JlwLL2M764E7j81JrZMx5nEDc7kpfhxK18sSLW9FrVV7cn8fW2
 74TJbRi7HH4l+LoAh0g63CtJpW4xvJr+MSi/t6d7dNoHIsjPR1k6+8csNz726PKU6O+xsy1Oxhc
 VuzFHLFBE7dIitM/Ns4kV1s2aMeuLvt7mB/BqFYg5+IeSb+onSZdxToEhp8xLPB3b5gWx5Ox
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682d7ded cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ZDHle1W9ieu5siCmYmsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cjM1Luu2R9AZVJjFGw9_2rYHBcdON0P7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210069



On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
>>
>>
>>
>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>> This enables runtime PM for eMMC/SD card.
>>>
>>> Could you please mention, which platforms were tested with this patch?
>>> Note, upstream kernel supports a lot of platforms, including MSM8974, I
>>> think the oldest one, which uses SDHCI.
>>>
>>
>> This was tested with qdu1000 platform.
> 
> Are you sure that it won't break other platforms?
>

Thanks for your valuable comment.
I am not sure about the older platforms so to avoid issues on older 
platforms we can enable this for all SDCC version 5.0 targets ?

>>
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>    drivers/mmc/host/sdhci-msm.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>> index e00208535bd1..6657f7db1b8e 100644
>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>> @@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>>               goto clk_disable;
>>>>       }
>>>>
>>>> +    msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
>>>>       msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>>>>
>>>>       /* Set the timeout value to max possible */
>>>> --
>>>> 2.17.1
>>>>
>>>
> 
> 
> 

