Return-Path: <linux-arm-msm+bounces-66504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA4B1096F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C033BE9E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B771B28936B;
	Thu, 24 Jul 2025 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wucm+E+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2E2877C7;
	Thu, 24 Jul 2025 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753357394; cv=none; b=VdUiKFuUIEl6Wd+261kJ5FgFAJy3Ez6bh/D1kHrDmTiFbKov8RkxUxv27QSTDfdppyvEdsnGCm+eeuo+lsyFR/hqj/x22ycDK++sT8hzdleIPD+xzSeIuUMoVtLjA6kaiAM+kuMooX+dOgI/wyN3j2C96Up846ljNvnBnB9WV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753357394; c=relaxed/simple;
	bh=C7aJfjxuYuw/lzjFAfKQdbXqUEi8RAeURqtGdH+N8x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hn8ESdqSs/EhgEBpKgZtw3g/hs2yrjiSHRAfnGf5M2f9KrozRzELQRZspe/u4idR4jnzEDWsyTyFyDSdN5qjAa+92dc+xQufQW+413Qq2neQs+fyepWSRf+IbhJlL2ak+ZxUWmgeQWqHx33JUb3i0AHGSWlrlE3Nj+suNKJdFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wucm+E+z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9hCrQ011227;
	Thu, 24 Jul 2025 11:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GElLuM7NvOcQPHiWW9WHggjZakCYwGP+Tbo0kRrhHuE=; b=Wucm+E+z7JUyr6L+
	D+i1hz4pUyGipXU2weHuLAshbibd5Qzj8CsmvNXSaaFbWxYwyBbzowWNUVgMuRPF
	XjE5cxGMXYPy9mtxQ5w4ajN1aZ1gU+fRj8n5g3FueaIKBhxXzVIl+JDgCgFad4eB
	17XZqMVU+VQEvhCmv11d5VkwFnPHRXHUc81npLTCJz4bobmCnLDFdqsexhf55vJs
	x3tAcVjvaljhd+hEYRa69LAjXST3r0bzsrZ/9VxOUJ7uWfQy1hApE7LQEyN/J3M5
	X6EWco84R7GZPR29iC1ds6FJcwznqAhiQJ/OZrA0c2pINHEOSXccXG2KFUmQkV+2
	olAVRg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w9rjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 11:43:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56OBh9wC024207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 11:43:09 GMT
Received: from [10.216.46.74] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 04:43:00 -0700
Message-ID: <9d4b5382-1536-471b-8f4a-a0ccbbcf1489@quicinc.com>
Date: Thu, 24 Jul 2025 17:12:56 +0530
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
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Adrian Hunter <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
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
 <CAPDyKFo9gUOB0VhQn=zD0RDM0=8wO08=VmA6XkHv0EN7M89bjg@mail.gmail.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <CAPDyKFo9gUOB0VhQn=zD0RDM0=8wO08=VmA6XkHv0EN7M89bjg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=68821c4e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=t-Rgs38LF0_mQJQf-IoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4OCBTYWx0ZWRfX/iSWM18SbQHf
 eJgPoIKzo236PVB1dC29IL26e8wA0AburdTxqEvLbXfkSnAe4zeKT3feEFyqS9wIHJZu6VYUM8p
 mj/Qy6oQyAtRa9F25uzxqkT4ksCN9YOUu28YP5Sidmf0ZwLTZGwUjGj+TbvfQbpcdl6JSpiHUqE
 mPWn0Zq/X6M9bu/hUXbtLrx95w/w2JbC35VlbwrQWqS3V4JA2y4xhJK0bMlCpaTb9+KLhBfxo/E
 /JHxW96zpqJAYbhL0rZotKQTCnhM3IC7zWiqtfXePPqfJzr6Kv6VPKb0Ww+G0TIsQvr2/X+H2U5
 0J3+pCGQCJyw0F8Xc6UpZyEBUSrOhJS7epA13u67uzHMrafjRiavFoZJLFR74XYkwYn4hOoMmbP
 xtyplivmmpyeHRVCuc2mTQgiDJTSO8Lvputqc423oTy2+I8b/an38Lwv2C7/o3/VAcGs5+O+
X-Proofpoint-ORIG-GUID: ehZgdqUt0crBbCDxxpCj7sjqnGI_ZCAb
X-Proofpoint-GUID: ehZgdqUt0crBbCDxxpCj7sjqnGI_ZCAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240088



On 5/27/2025 8:50 PM, Ulf Hansson wrote:
> On Wed, 21 May 2025 at 17:41, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On 21/05/2025 18:36, Sarthak Garg wrote:
>>>
>>>
>>> On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
>>>> On 21/05/2025 17:35, Sarthak Garg wrote:
>>>>>
>>>>>
>>>>> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg
>>>>>>>> <quic_sartgarg@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>>>>>>
>>>>>>>>>> Could you please mention, which platforms were tested with this
>>>>>>>>>> patch?
>>>>>>>>>> Note, upstream kernel supports a lot of platforms, including
>>>>>>>>>> MSM8974, I
>>>>>>>>>> think the oldest one, which uses SDHCI.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This was tested with qdu1000 platform.
>>>>>>>>
>>>>>>>> Are you sure that it won't break other platforms?
>>>>>>>>
>>>>>>>
>>>>>>> Thanks for your valuable comment.
>>>>>>> I am not sure about the older platforms so to avoid issues on older
>>>>>>> platforms we can enable this for all SDCC version 5.0 targets ?
>>>>>>
>>>>>> No, there are still a lot of platforms. Either explain why this is
>>>>>> required for all v5 platforms (and won't break those) or find some
>>>>>> other
>>>>>> way, e.g. limit the change to QDU1000, explaining why it is _not_
>>>>>> applicable to other platforms.
>>>>>>
>>>>>
>>>>> Thanks for your comment.
>>>>
>>>> No need to.
>>>>   >> I agree with your concern but for me also its not possible to test on
>>>>> all the platforms.
>>>>
>>>> Sure.
>>>>>> Lets say if I want to enable this caps for QDU1000 for which it has
>>>>> been tested and on any other upcoming target after testing, then how
>>>>> can I proceed to enable?
>>>>
>>>> Let's start from the beginning: why do you want to enable it on QDU1000?
>>>>
>>>
>>> QDU1000 is one latest available target where we have enabled this and
>>> tested. This has been enabled to save power.
>>
>> Isn't it a powered device? How much power is the save? Is it worth it?
> 
> Just wanted to share my view around this, in a slightly more generic
> way. My answer to the above, would be, yes, for any battery driven
> platform, it should be worth it.
> 
> Unfortunately, I don't have any fresh numbers to share for eMMC/SD,
> but just searching for some vendor specific information about their
> eMMC/SD cards, should tell us I think. In fact, this problem isn't
> even limited to eMMC/SD, but rather applies to most flash based
> storage (UFS/NVMe etc) that are used on these types of platforms.
> 
> How much there is to gain, obviously depends on the internal behaviour
> of the storage device. Of course, the number of cards being attached
> is important too.
> 
> That said, enabling this feature (MMC_CAP_AGGRESSIVE_PM) needs to be
> done by taking into account that being *too* aggressive (too
> frequently) with turning off the power to the card, may cause a
> potential wear-out/brake of the card if we end up preventing it from
> doing internal house-keeping for too long.
> 
> The current default autosuspend timeout
> (pm_runtime_set_autosuspend_delay()) is set to 3s in mmc_blk_probe().
> That seems way too aggressive in my opinion, so perhaps increasing
> that value to ~180s could allow us to enable this, even if 180s is
> just a guesstimate from my side.
> 
> Also note that, during system wide suspend we always turn off the
> power to the card - and we really don't know if that is too frequent
> too. It depends on how the platform is used, compare a laptop with a
> smartphone, the frequency greatly differs.
> 
> Kind regards
> Uffe


Hi ulf,

We already have AGGRESSIVE_PM enabled for all our internal targets and 
they are in production for quite long time (5-6 years) and haven't seen 
and performance degradations due to garbage collection. Also wear tears 
are not observed as per my current observations so far.

Like you rightly mentioned we may have battery powered devices where 
this caps will be useful and on the other hand we have always powered 
devices where this caps may not be needed, so can we make device tree 
changes and enable this PM property per board selectively?

Also I see there are four below vendor files who have already enabled 
this caps in their vendor file.

sdhci-pci-core.c sdhci-omap.c sdhci-acpi.c rtsx_pci_sdmmc.c

Let me know how can we proceed.

Regards,
Sarthak






