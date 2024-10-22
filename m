Return-Path: <linux-arm-msm+bounces-35474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3D9AB603
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 20:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBE9F1C22FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E6F1C9DFB;
	Tue, 22 Oct 2024 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d7sd5Lwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128451C9DF6;
	Tue, 22 Oct 2024 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622058; cv=none; b=ffOqEIKNh9EujP+We8cdI2LZ1Q3P3ueGpOaqJ73SLwH4hRmlVN6yw1DzFoGPxVOQZIJRUJ8uH1j/ftjApXEXBbNRm9l+284lI4tox2VLEXXufMymDe7QzZSRCzCrOEPYR8LcMJ5cFwN3Skld2towqhQmsBGxegZTj3KgaEwJZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622058; c=relaxed/simple;
	bh=uqvMv2qcH507Z4cXI6P2BA/JVywnyuGJGGjWaRzv1Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eA3sils3I4Ga0jZae2PrN525wkVBIzjQcoI8OgWDILDB6+gXUZtpwm61szaGwSsXiWkhmCo17DSVwh8XUbYIVyGshyd2XzSzrc2yGLZnKdTYvhUImvu1sMq6KjMgaPRmzNEk9bmPJk3js5O/7rXE53vkDOUIIz9Mi87ux0YKW18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d7sd5Lwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBpCQf029658;
	Tue, 22 Oct 2024 18:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1wCfXW6A7n+muEvuhES2GIPbbBcS3gOW+5pey9Nj0A=; b=d7sd5LwfZWNJC1F7
	2/mRLC3t20l2nsI57HxYXoKpg+15l6gDjH4+OQLZzL4P3ZfOSu/4k8+oi/ssf//R
	Oq/i3uX91lyxORbntGsUJj7mkxrSKyvr4t/tSOO/hDLAdOTUImHO2TGoLijIFshm
	gq0vHpoqhodSEZy01UFNqvd5RpOFPxGKIUnb71eKurLhgsrarT2tFP+hBZJ0NRcZ
	ep8b73t37SPicIcWqE7Byau8yvAYzeKUvH3beCgn4I93dSbXsNcjXomIbwmkk+9i
	TaVsj+d7/jp3xj+E/eePxYFaetvo2FoTwXX6lLNxxIH/MJlOe/wC2VSPBopifd3y
	+LzWKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ebhes7ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 18:34:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MIY2kK008464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 18:34:03 GMT
Received: from [10.216.8.66] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 11:34:00 -0700
Message-ID: <5e52d6c5-6e42-4244-bf66-a2d1343ad868@quicinc.com>
Date: Wed, 23 Oct 2024 00:03:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity
 checks
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-3-quic_kuldsing@quicinc.com>
 <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
 <f46a9180-ca71-458e-9693-ed9badc85e72@quicinc.com>
 <21630547-552b-43e0-906f-840610327876@quicinc.com>
 <CACMJSeuM=xmtvJr_DOZNdsj6FpF50xgXx1VED4OW6cv=s2qW5w@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <CACMJSeuM=xmtvJr_DOZNdsj6FpF50xgXx1VED4OW6cv=s2qW5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kNeDY5o7bwG1ezubyTFkuHWzJt0vR_nR
X-Proofpoint-ORIG-GUID: kNeDY5o7bwG1ezubyTFkuHWzJt0vR_nR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220120



On 10/22/2024 12:27 PM, Bartosz Golaszewski wrote:
> On Tue, 22 Oct 2024 at 07:43, Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>
>>
>>
>> On 10/16/2024 2:31 PM, Kuldeep Singh wrote:
>>>
>>> On 10/14/2024 6:38 PM, Bartosz Golaszewski wrote:
>>>> On Mon, Oct 14, 2024 at 1:19 PM Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>>>>
>>>>> The qcom_tzmem driver currently has exposed APIs that lack validations
>>>>> on required input parameters. This oversight can lead to unexpected null
>>>>> pointer dereference crashes.
>>>>>
>>>>
>>>> The commit message is not true. None of the things you changed below
>>>> can lead to a NULL-pointer dereference.>
>>>>> To address this issue, add sanity for required input parameters.
>>>>>
>>>>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>>>>> ---
>>>>>  drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
>>>>> index 92b365178235..977e48fec32f 100644
>>>>> --- a/drivers/firmware/qcom/qcom_tzmem.c
>>>>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
>>>>> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
>>>>>
>>>>>         might_sleep();
>>>>>
>>>>> +       if (!config->policy)
>>>>> +               return ERR_PTR(-EINVAL);
>>>>
>>>> This is already handled by the default case of the switch.
>>>
>>> Ack. Need to drop.
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L218
>>>
>>> While examining qcom_tzmem_pool_free under the same principle, it
>>> appears the following check is unnecessary.
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L268
>>>
>>
>> Bartosz,
>> I am thinking to remove below check in next rev like mentioned above.
>> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L268
>>
>> Do you have any other opinion here?
>> Please let me know.
>>
> 
> No, let's keep the NULL-pointer check and add it to qcom_tzmem_free(),
> I'm not against it. I was just saying that in the latter case it will
> already be handled by the radix tree lookup.

Hey, I think you misread my comment. Let me explain more.
As agreed, Will drop (!config->policy) check from qcom_tzmem_pool_new
because it's already present.
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L218

Keep (!vaddr) check in qcom_tzmem_free as discussed above.
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L411

And last thing, like we don't check (!pool) in qcom_tzmem_alloc as it
cannot be null, same way I believe (!pool) is unnecessary in
qcom_tzmem_pool_free as qcom_tzmem_pool_new should return valid pool and
if not, should be handled by calling driver.
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L369
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L268

-- 
Regards
Kuldeep

