Return-Path: <linux-arm-msm+bounces-42292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617B9F29E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 07:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB04318852A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 06:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC281C8FBA;
	Mon, 16 Dec 2024 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FcJeMfTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C834C7C;
	Mon, 16 Dec 2024 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734329416; cv=none; b=GBpPRMYOuyQwgUA+pAp9VxclGC+cKqyYjYgbjUc+Cv/vb8BxPmsQCdL6+Wl20ZJz7RaJ1JhekiE3XLrCiid6B0CtGzgjZX8Zt5+OzalUH8cofLtNQrDf6k0yuF/6/juZmi+GB9+uPqLx6TiEScMbUpTOPUQ27akffjmBZebO8JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734329416; c=relaxed/simple;
	bh=95QyHWNYaUl9xnOix3oR0yCZTaSsy3PA2taSJbhzGeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M4ehKT/mATsUJ2z3V15WL5epLUnUtiI+hKN6r+G4zKxnCtuxFpvPwUOSiCk72t2ZashGTBuUXecN+n5VQQQaEIrKZ5C6E2S3a3WfHbwr4DdsPtFjuMKdYv8SIU2NoDqBLcoBIPY+Hcc8jlO/Ce9vlrOC2rC+lyewsbeUxJcBJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FcJeMfTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BFNecwI008209;
	Mon, 16 Dec 2024 06:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcvzuNPngltImk5uUcCBRUKmFK2+eqam7+P2bDzqP/I=; b=FcJeMfTy4uKQL7im
	IpDU47Iqcsm4eaWhtbBoIZBp7Tv7FdnzVlXqgHGPmRHHL8QnZ6c8ksngWIlb8Fm7
	THkchv+Ju9CCoXQ7Tt2fsRyqA5+EucSx32fydXxfXT2bEuczXiALer6dQsXKpPOM
	rx8iyHq6nhSI104Ett1gVg8u0dXZF4irx8bCsCq13ZmbldgL5gYFfrSk4oP7wPty
	4RKWD979oIrvcCy1gQcwC4f8BPUhHNGmnTEYqL2nHhBti8PxTQ+HeeL4qH44PmU+
	F2C0kJFTc6dJw2AFvr1petljFvH0UJRYbWUAWg4MUL/eydKmTYlKn0zu48EWsE3b
	ya856g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43hjc2a9b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:09:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG69tgl016995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:09:55 GMT
Received: from [10.110.102.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 22:09:53 -0800
Message-ID: <adea523d-df80-413c-97c1-92cf3923f4e3@quicinc.com>
Date: Sun, 15 Dec 2024 22:09:46 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
To: Vignesh Raman <vignesh.raman@collabora.com>,
        Helen Mae Koike Fornazier
	<helen.koike@collabora.com>
CC: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel
	<dri-devel@lists.freedesktop.org>,
        freedreno
	<freedreno@lists.freedesktop.org>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
 <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
 <20a3955e-3d10-47c5-8e68-d70342805010@quicinc.com>
 <19393604e18.f9b6fe7d298023.1937039548910081216@collabora.com>
 <a03ae7e8-391e-4303-91fc-15a59979fd2a@quicinc.com>
 <ed90ca8c-ed81-419f-a5db-a4e8bcd35835@collabora.com>
 <ac13139d-1cbf-47dd-b200-1a511ffc9453@quicinc.com>
 <8edba6c9-cf7d-4616-8791-65abd108f538@collabora.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <8edba6c9-cf7d-4616-8791-65abd108f538@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pzcRdAR_iPmV3mebmygfZ2V_1rLR5iNu
X-Proofpoint-ORIG-GUID: pzcRdAR_iPmV3mebmygfZ2V_1rLR5iNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160048



On 12/15/2024 9:45 PM, Vignesh Raman wrote:
> Hi Abhinav,
> 
> On 14/12/24 01:09, Abhinav Kumar wrote:
>> Hi Vignesh
>>
>> On 12/11/2024 9:10 PM, Vignesh Raman wrote:
>>> Hi Abhinav / Helen,
>>>
>>> On 12/12/24 01:48, Abhinav Kumar wrote:
>>>> Hi Helen / Vignesh
>>>>
>>>> On 12/4/2024 12:33 PM, Helen Mae Koike Fornazier wrote:
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> ---- On Wed, 04 Dec 2024 16:21:26 -0300 Abhinav Kumar  wrote ---
>>>>>
>>>>>   > Hi Helen
>>>>>   >
>>>>>   > On 12/4/2024 11:14 AM, Helen Mae Koike Fornazier wrote:
>>>>>   > > Hi Abhinav,
>>>>>   > >
>>>>>   > > Thanks for your patch.
>>>>>   > >
>>>>>   > >
>>>>>   > >
>>>>>   > > ---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote ---
>>>>>   > >
>>>>>   > >   > From the jobs [1] and [2] of pipeline [3], its clear that
>>>>>   > >   > kms_cursor_legacy@torture-bo is most certainly a flake and
>>>>>   > >   > not a fail for apq8016. Mark the test accordingly to 
>>>>> match the results.
>>>>>   > >   >
>>>>>   > >   > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
>>>
>>> The test passes - 
>>> kms_cursor_legacy@torture-bo,UnexpectedImprovement(Pass)
>>>
>>
>> Yes, thats the problem
>>
>> https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481/viewer#L2696
>>
>> 24-12-04 03:51:55 R SERIAL> [  179.241309] [IGT] kms_cursor_legacy: 
>> finished subtest all-pipes, SUCCESS
>> 24-12-04 03:51:55 R SERIAL> [  179.241812] [IGT] kms_cursor_legacy: 
>> finished subtest torture-bo, SUCCESS
>>
>> Here it passes whereas it was marked a failure. Hence pipeline fails.
> 
> Yes it fails due to,
> 
> Unexpected results:
>   kms_cursor_legacy@torture-bo,UnexpectedImprovement(Pass)
> 
> In this case, we need to remove this test from fails.txt
> 
>>
>>>>>   > >   > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
>>>
>>> There are no test failures
>>>
>>
>> No, thats not true
>>
>> https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430/viewer#L2694
>>
>> 24-12-04 04:18:38 R SERIAL> [  170.379649] Console: switching to 
>> colour dummy device 80x25
>> 24-12-04 04:18:38 R SERIAL> [  170.379938] [IGT] kms_cursor_legacy: 
>> executing
>> 24-12-04 04:18:38 R SERIAL> [  170.393868] [IGT] kms_cursor_legacy: 
>> starting subtest torture-bo
>> 24-12-04 04:18:38 R SERIAL> [  170.394186] [IGT] kms_cursor_legacy: 
>> starting dynamic subtest pipe-A
>> 24-12-04 04:18:38 R SERIAL> [  170.661749] [IGT] kms_cursor_legacy: 
>> finished subtest pipe-A, FAIL
>> 24-12-04 04:18:38 R SERIAL> [  170.662060] [IGT] kms_cursor_legacy: 
>> starting dynamic subtest all-pipes
>> 24-12-04 04:18:38 R SERIAL> [  170.713237] [IGT] kms_cursor_legacy: 
>> finished subtest all-pipes, FAIL
>> 24-12-04 04:18:38 R SERIAL> [  170.713513] [IGT] kms_cursor_legacy: 
>> finished subtest torture-bo, FAIL
>> 24-12-04 04:18:38 R SERIAL> [  170.721263] [IGT] kms_cursor_legacy: 
>> exiting, ret=98
>> 24-12-04 04:18:38 R SERIAL> [  170.737857] Console: switching to 
>> colour frame buffer device 128x48
>>
>> Please check these logs, the torture-bo test-case did fail. The 
>> pipeline was marked pass because it was an expected fail.
>>
>> So we have two pipelines, where one failed and the other passed. So 
>> thats a flake for me.
> 
> Yes agree. So if we had removed the test from fails, deqp-runner would 
> have reported this as flake.
> 
> deqp-runner runs the test and if it fails, it retries. If the test 
> passes on retry, it is reported as a flake.
> 
>>
>>>>>   > >   > [3]: 
>>>>> https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
>>>
>>> The job is same as 2
>>>
>>> In this case, the test passes and deqp-runner does not report it as 
>>> flake. So we only need to remove it from fails file.
>>>
>>
>> No, like I mentioned above we have a pass and a fail.
>>
>>>
>>>>>   > >   >
>>>>>   > >   > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com>
>>>>>   > >   > ---
>>>>>   > >   >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>>>>>   > >   >  1 file changed, 5 insertions(+)
>>>>>   > >   >
>>>>>   > >   > diff --git 
>>>>> a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
>>>>> b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>>>>   > >   > new file mode 100644
>>>>>   > >   > index 000000000000..18639853f18f
>>>>>   > >   > --- /dev/null
>>>>>   > >   > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>>>>   > >   > @@ -0,0 +1,5 @@
>>>>>   > >   > +# Board Name: msm-apq8016-db410c
>>>>>   > >   > +# Failure Rate: 100
>>>>>   > >
>>>>>   > > Is failure rate is 100%, isn't it a fail than?
>>>>>   > > (I know we have other cases with Failure Rate: 100, maybe we 
>>>>> should fix them as well)
>>>>>   > >
>>>>>   >
>>>>>   > Maybe I misunderstood the meaning of "Failure rate" for a flake.
>>>>>   >
>>>>>   > I interpreted this as this test being flaky 100% of the time :)
>>>>>
>>>>> Ah right, I see, inside deqp-runner (that auto-retries).
>>>>>
>>>>> I'd like to hear Vignesh's opinion on this.
>>>>>
>>>>> (In any case, we probably should document this better)
>>>
>>> deqp-runner reports new (not present in flakes file) or known 
>>> (present in flakes file) flakes
>>>
>>> 2024-12-11 07:25:44.709666: Some new flakes found:
>>> 2024-12-11 07:25:44.709676:   kms_lease@page-flip-implicit-plane
>>>
>>> 2024-12-11 13:15:16.482890: Some known flakes found:
>>> 2024-12-11 13:15:16.482898: 
>>> kms_async_flips@async-flip-with-page-flip-events-atomic
>>>
>>> we add it to flakes file if deqp runner reports new flakes. Another 
>>> case where we update flake tests is when a test passes in one run but 
>>> fails in another, but deqp-runner does not report it as flake.
>>>
>>> Regards,
>>> Vignesh
>>>
>>
>> The confusion here i guess is about what to mention as a "Failure rate"
>>
>> Failure rate means how many times it fails (like normally) ? In that 
>> case 100% which I used is wrong and I used 33% instead for which I 
>> have pushed v2.
> 
> Yes, 33% is correct and please remove this test from fails.txt
> 
> Regards,
> Vignesh
> 

Ack, let me remove this test from fails and keep it only in flakes.

Thanks

Abhinav
>>
>>>>>
>>>>> Regards,
>>>>> Helen
>>>>>
>>>>
>>>> Can you let me know which way we need to go?
>>>>
>>>> Just in case I did post a v2 fixing this, 
>>>> https://patchwork.freedesktop.org/patch/627276/
>>>>
>>>> If thats the way to go, can you pls take a look?
>>>>
>>>> Thanks
>>>>
>>>> Abhinav
>>>>>   >
>>>>>   > Out of the 3 runs of the test, it passed 2/3 times and failed 1/3.
>>>>>   >
>>>>>   > So its fail % actually is 33.33% in that case.
>>>>>   >
>>>>>   > I think I saw a Failure rate of 100% on 
>>>>> msm-sm8350-hdk-flakes.txt and
>>>>>   > mistook that as the rate at which flakes are seen.
>>>>>   >
>>>>>   > Let me fix this up as 33%
>>>>>   >
>>>>>   > > Regards,
>>>>>   > > Helen
>>>>>   > >
>>>>>   > >   > +# IGT Version: 1.28-ga73311079
>>>>>   > >   > +# Linux Version: 6.12.0-rc2
>>>>>   > >   > +kms_cursor_legacy@torture-bo
>>>>>   > >   >
>>>>>   > >   > ---
>>>>>   > >   > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>>>>>   > >   > change-id: 20241204-cursor_tor_skip-9d128dd62c4f
>>>>>   > >   >
>>>>>   > >   > Best regards,
>>>>>   > >   > --
>>>>>   > >   > Abhinav Kumar quic_abhinavk@quicinc.com>
>>>>>   > >   >
>>>>>   > >   >
>>>>>   > >
>>>>>   >
>>>>>

