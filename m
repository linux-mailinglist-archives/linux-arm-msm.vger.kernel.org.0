Return-Path: <linux-arm-msm+bounces-67247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5AB17027
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 13:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B5C16C91B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE2E2BE03C;
	Thu, 31 Jul 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QQMkkWIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787771A3155;
	Thu, 31 Jul 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753960195; cv=none; b=RSEgxS6YYQLaG0+vy4OOMfTFPfTZyEpCcNk6GKF3G/N9y+rPNW9XL3wPh3AavGVY4j2DOp5IEWWAwDbXoDwQpJB2mQv22VdbGcKizSCxk/rNftQ0NPK2Zzlt1mxUZ0kugmZisqMK2+dl9N97ncjYjjiT3P1FqNGUFX+r2ppWANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753960195; c=relaxed/simple;
	bh=ItVwJXgKGvVXJhCDRk3nmuNL0ZSzurtnjqAX6Z9zRgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rL/Pu2qQbH4efNGA7cCMYkDDnhoZgi1AZaXCHn/SQe8vloN2ZceQ5q76dQkDxI6xk0McSIrQGwjiiXYRo+qestGCQWIF9th8j7ybjEZuFi2amldKh5hsiKvb0FNJmzWy6D3MS/IhhC/dBETUcQv4B3LzAiIFF6ShSvHeF8iGgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQMkkWIv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fPIR024226;
	Thu, 31 Jul 2025 11:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpacQAEuunvl9EP8TR9EjQRvykSiPqrIg87dN+nnP44=; b=QQMkkWIvg7nAxV/I
	QNOuHcSFwk8DqlN2nQwlRm1dU6ESzEvngRpxytD/1xPUeuZ4cHG9/+AllZrK1Gsj
	W5DHP+votsdEUOOMIbRQEYDra5FP0OA8aWkpaP8uVWgZ+NDu7pSti/n17qTycO14
	3WBNYRRiz4VJPrG5naY82EyrFrr1l0d+ao9wOYnlZSVfRGvQRFsXdVF2MtxgRgAM
	yjjuN/cqT1owwT6T35qPvQgZ36Ua+y4dX/jXO9Zp2Qt8eZzxXIZR6BmkvS2QEUsc
	pDM4azS8ln2pwSuIFu9dYeIbTRRQ1Qihy314PozVLByANoOZhAYEW5+ystHziv7v
	aWZAQw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qyhn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 11:09:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56VB9miG029221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 11:09:48 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 31 Jul
 2025 04:09:39 -0700
Message-ID: <2fcb2378-8a1c-4d54-abca-709ada84b513@quicinc.com>
Date: Thu, 31 Jul 2025 16:39:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@quicinc.com>
References: <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
 <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
 <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
 <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
 <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
 <22848e2e-bd7d-486c-b481-c624d230d327@quicinc.com>
 <tpervpypkne6lasl3fn3v52xutl3zfuytalo3cveoe4us63rrb@p2w4cvt2jf7a>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <tpervpypkne6lasl3fn3v52xutl3zfuytalo3cveoe4us63rrb@p2w4cvt2jf7a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA3NiBTYWx0ZWRfX7/D23SaG8FNJ
 Ucde6TymgwWjO3WF6biqfY9gaBEJXkPBLZQLMLzHD0cId3W3TiLXy/CNMRksHqXa4LwKafGnAkD
 mLHpVf8OC1pPSQoHgbEDD/Jf6uQIB+bMboeT2x2SStTiKf5vd5neKDKrFrqOqxDLictOl3+/F0F
 bcGtRxuWOFIub4pNVeRanMVUnQLKx9JEmKRMKcKUGo4QZrNeO61LczxWao+6bKu6+hl9i565ENA
 vXbaYB/X2NOHY33fjeQwshr2/l2YNC51j/GL76pU4xKbFN+hfpQEOLKBzbCTmcOk2Blm1XSnbym
 UWGehA+CVBYjUrXS6u3r4CBFsf3QodeproCAqAqcpzwsP5953kgD8mY8Cz/vVyzc4Njk8TAWyS6
 XBQeA3OD47//d/PwUsrNxTIPjbnxNzcFEIUHijWo3KMFJehBdF4ZG1vO2NbAnbeuR0f3VaN1
X-Proofpoint-ORIG-GUID: avRKz0rpNOZkenctd36ICMSZgSE2j9vV
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688b4efd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=O83kX4fD3CcbUwYZHKcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: avRKz0rpNOZkenctd36ICMSZgSE2j9vV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310076



On 7/24/2025 5:31 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 04:45:38PM +0530, Sarthak Garg wrote:
>>
>>
>> On 5/21/2025 9:11 PM, Dmitry Baryshkov wrote:
>>> On 21/05/2025 18:36, Sarthak Garg wrote:
>>>>
>>>>
>>>> On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
>>>>> On 21/05/2025 17:35, Sarthak Garg wrote:
>>>>>>
>>>>>>
>>>>>> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg
>>>>>>>>> <quic_sartgarg@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>>>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>>>>>>>
>>>>>>>>>>> Could you please mention, which
>>>>>>>>>>> platforms were tested with this patch?
>>>>>>>>>>> Note, upstream kernel supports a lot of
>>>>>>>>>>> platforms, including MSM8974, I
>>>>>>>>>>> think the oldest one, which uses SDHCI.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> This was tested with qdu1000 platform.
>>>>>>>>>
>>>>>>>>> Are you sure that it won't break other platforms?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks for your valuable comment.
>>>>>>>> I am not sure about the older platforms so to avoid issues on older
>>>>>>>> platforms we can enable this for all SDCC version 5.0 targets ?
>>>>>>>
>>>>>>> No, there are still a lot of platforms. Either explain why this is
>>>>>>> required for all v5 platforms (and won't break those) or
>>>>>>> find some other
>>>>>>> way, e.g. limit the change to QDU1000, explaining why it is _not_
>>>>>>> applicable to other platforms.
>>>>>>>
>>>>>>
>>>>>> Thanks for your comment.
>>>>>
>>>>> No need to.
>>>>>   >> I agree with your concern but for me also its not possible
>>>>> to test on
>>>>>> all the platforms.
>>>>>
>>>>> Sure.
>>>>>>> Lets say if I want to enable this caps for QDU1000 for which it has
>>>>>> been tested and on any other upcoming target after testing,
>>>>>> then how can I proceed to enable?
>>>>>
>>>>> Let's start from the beginning: why do you want to enable it on QDU1000?
>>>>>
>>>>
>>>> QDU1000 is one latest available target where we have enabled this
>>>> and tested. This has been enabled to save power.
>>>
>>> Isn't it a powered device? How much power is the save? Is it worth it?
>>>
>>
>> Sorry I just did basic sanity on QDU1000 device to confirm its not breaking
>> any eMMC functionality and we have also tested SD card on SM8550 as well.
>> For power no's we have stared internal discussions and based on target
>> available for power profiling with eMMC device we will come back.
> 
> So, again, _why_ do we want to enable it? If you haven't measured the
> actual power savings, then it's obviously not a primary reason.
> 
> As for the v5 targets only, they start from SDM845. Have you tested it?
> Does it bring any actual benefits?
> 

Sure will capture the power savings on our target with runtime PM and 
will come back.
In our downstream code its enabled for all our targets and tested for 
quite some time.


~Regards
Sarthak

