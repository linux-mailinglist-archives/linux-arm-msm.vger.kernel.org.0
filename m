Return-Path: <linux-arm-msm+bounces-77542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711EBE2A9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91AC1350015
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DF232860D;
	Thu, 16 Oct 2025 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftka8BJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491F32860E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609251; cv=none; b=BTgtLEB2bY49cd8lowQ+IG1OtEXzmB//1WlA3SxqSNCZ9Cxn85Ih1VTDVLTlUpAnWrYuRgFzH3ksXHNsuVxpEjwbX7wVTGskK1HesgZ00GTjdbsWy3Lt7rQNDQpOZGkdDY5P/XuMQVnyAdAgh9K6TAZuKrXuv/rkoXfea+J/11I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609251; c=relaxed/simple;
	bh=6JZGyG9UtnFqvSjGTdycHp5LVuyvxH8eJNyIvx3pFsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2I1R+/fR8GvR18mqfuMNvboFF8Xz1Ll36hSiMRNzew4x6YpoPE00NIsVrjf5KhF3tnnb1eSTJz5Peet5k/W3LWU4e6hTKCFJAjuAms5M0UH0j/iojk009LvBueKmpBFb15GJLJIGYfbZcM8mrN2QHyFbgZRHCEXO2TIg7UPJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftka8BJK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7sjiV009185
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgYMjbIiweStJ9TdZHgQfZpFXMpwTSBOKc/PlhGShpc=; b=ftka8BJKu73PVdl0
	WBjkxD88/mLvYKM8O8etdVjVgZoQ2CUckjqcfCm6xLfJcBLbRWl8xK1WPckZ7qsT
	DtSidaVCuG+KrLqnazg0nLMQ6Df5bwejFuQDxTFn11L0gAggw9bOPXjwM9Upio8l
	o7AVi5T4QKssCl/3fJqax1H0FQqPSGyde5WrWfkUU9X2wXGWb5PwM5XE8EcyxxCZ
	gglFAbhy2SU3K1derHGzukduPC5lAdXIAK2YduqCOzSsib0gQfBm3cpsY51hOKzR
	BCIQD7lwVDKQHGgzlvf9Epe9tq/hDfdk38xi03i/h4ttiMNmiu3DyeGWb8QYU2Fc
	/Ewyig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c7rng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:07:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-886eaf88e01so25117085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 03:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609247; x=1761214047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgYMjbIiweStJ9TdZHgQfZpFXMpwTSBOKc/PlhGShpc=;
        b=pE4YxkBpXmaVSObqIvvidTwz7/K7Q8G2aeI62rmfKcPyULkOIJAykXmdnkMX52hCMP
         Q5OJnnkOZTD9MaSCIrSeIduyp60c2eJdiwPg8nCgz6pFRcf5vkshVESR3Xx2N/Nvl40E
         3eDjDFDVN0gA3BmNbjfKH0PvfpLAC12r0uaYTNiGBxJVoG+AN2zawiDm/gaglSORt6mN
         AC8JV1FRHUQLB38zIf4DV8ARFSWsOUBO5NkaLWfy8K9JCcV/texzJkXwoe1YyPH9BAq/
         Xhq9i2OIwTKE6dyC5xDIbw5gmv9GvqxKdZaPaDlYVW2BXjmX4kLFiKJV/R0qR349Zwcu
         x88Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm4W6PAKZp0y3iacT3GdFHlHJEfRj5roLl08cfcVoVN05sffX+IPf3UXqjIQ2f4SsVPdo636M54UieRkIl@vger.kernel.org
X-Gm-Message-State: AOJu0YyHc0cft5X6kN2OzLWeK/EcUVbphCquTYLcX+pA3rWYObTSrXVx
	u9bqXn4oU/ffWOH0B80RnGBt6kBHSBRoi236FRyl5uYccDM3M7aDXvWj4+1T+52bKGiV9oaRLp6
	C+0WK9vzPgKptQ6/jrSmm7XvVPN6wJkizs/2hpo2fYhjth0NshCROZYfVpBIVD51jLQArQ1HwS+
	Ql
X-Gm-Gg: ASbGncs0N1rvaXXCpKjctHWEDI+rWOxzLtLvq9UlH8xa2LHKzHYSj05/iJdj4JBTCEs
	LK7KVKIqMIlKMRi+9Igg5ZZrX82te9VA7xgH4OYNcHD+bIpZ2o1xfdc8nbhYQ1wTT+TvpG25aWb
	Gq5k0R1f7g9QnKNUm/Ai6CWHFQTkdr4qY7p4esCDmRik8DdDtQC4IQCRtIdVnQQn1z1kHsCdDNt
	ZmTFA06O4HGLqMUtZHGESkg0r10CbYXnuO6p0tFeGDJQiMCnZtG/kPdJBL59WZwPLr5QgSkNJvz
	czGzfFM9lTrEcTBMuQFar7St+88zGkCGdP8sxuMWRzYoIcazkz1xMgDAJ8BCnsC316FOX+QCRbx
	Xvf/waOxGyIs9UW4SLtEjP6hW4j7WNl4B+bk9xi85zrVv3dUw4u5k8IBi
X-Received: by 2002:a05:620a:d8e:b0:85a:dcb:a0fc with SMTP id af79cd13be357-883548cf6f6mr3114894285a.13.1760609247306;
        Thu, 16 Oct 2025 03:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmeMnWYXAsP+2YnvkA7zTrb0zSa4DoqPjPUBxAdsneDRLKYGXtJXU7bceLsI69WhZDfsrdDg==
X-Received: by 2002:a05:620a:d8e:b0:85a:dcb:a0fc with SMTP id af79cd13be357-883548cf6f6mr3114890985a.13.1760609246619;
        Thu, 16 Oct 2025 03:07:26 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba45b3cbsm466893366b.40.2025.10.16.03.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:07:26 -0700 (PDT)
Message-ID: <5a864c29-0eef-447b-a8a7-5f23f5f89e0e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 12:07:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
 <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
 <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
 <d61ca50d-f9ea-40f1-a97d-090a11e49028@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d61ca50d-f9ea-40f1-a97d-090a11e49028@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VSNu0EZxdRHk_fcekgLW5EnM_Esa7JoQ
X-Proofpoint-ORIG-GUID: VSNu0EZxdRHk_fcekgLW5EnM_Esa7JoQ
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f0c3e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9xTgksZIBo2-CdbP8I8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0ohSC7TX9fe6
 WBewtzlzj1Z6dwqTTce7nwLYJECmo6grlL78kweIz6OwA6k+6R5KtUSsCOHqUqWwxSrF46hcbKT
 JXbKyVwR6vyUoQSt5u4O/Zoo5jF87ftrQvpI7hrKf8QmevpYdT+HN4vDSNSXQIQ2Vc7RdxK/cGp
 YBPcWbaT1h9Rj5VQ7Mx1CCPjg5wpUNCchAyvRgmINpZyRSdSh6ngwGzgDHCrnB5ylC7DF0ybbjw
 9yaMWzJIwgBaNPxq8PywsZjQOGO/uWIktCc6lVdZQhowAt83PiUQcCsfNE+tyif/cYQxHOh34xN
 a6U0Nl5CAPpZSe4Nr6qXHhmzSmxHHWyh9yN65eQ0TpaTzFd+1MCC5A9XsMEV2a2vdfFBHj1zAJw
 Jsa8PusDx5wHdL+13l9zYgBul5sOWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On 10/14/25 6:48 PM, Jeff Hugo wrote:
> On 10/14/2025 1:48 AM, Konrad Dybcio wrote:
>> On 10/14/25 1:47 AM, Carl Vanderlip wrote:
>>> On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
>>>> On 10/8/25 12:15 AM, Youssef Samir wrote:
>>>>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>>>
>>>>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>>>>
>>>>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/accel/qaic/sahara.c | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>>>>> index 3ebcc1f7ff58..04e8acb94c04 100644
>>>>> --- a/drivers/accel/qaic/sahara.c
>>>>> +++ b/drivers/accel/qaic/sahara.c
>>>>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>>>>       [23] = "qcom/aic200/aop.mbn",
>>>>>       [32] = "qcom/aic200/tz.mbn",
>>>>>       [33] = "qcom/aic200/hypvm.mbn",
>>>>> +    [38] = "qcom/aic200/xbl_config.elf",
>>>>
>>>> This is the third oneliner extending this array you sent within 24h,
>>>> please get the list of required files and update this list once and
>>>> for good
>>>>
>>>> Konrad
>>>
>>> I wish it was that easy during bring-up.
>>>
>>> These patches are being upstreamed from our internal branch and thus
>>> reflect the different latencies across the sub-teams to that request.
>>
>> That's upstream-first-first ;)
>>
>> I would assume there's a single list of files that get loaded, perhaps
>> within the device programmer image.. Unless you're altering that on the
>> fly as well?
> 
> There is no device programmer.  This device does not store runtime firmware in flash.
> 
> This device is still under development and not in the hands of anyone outside of Qualcomm, yet.  Much to my annoyance, the firmware developers are continuing to change the firmware images - adding new images, splitting up existing ones, etc.
> 
> I'm expecting to lock this down, with or without the firmware teams, once devices end up in the wild.

Sounds annoying indeed.. Hopefully this settles down

Konrad

