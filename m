Return-Path: <linux-arm-msm+bounces-14770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B92886085
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 19:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F395AB20FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 18:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCFD132C17;
	Thu, 21 Mar 2024 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XyubtlOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412E1755F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711045689; cv=none; b=l6APukPZcRId6L8o270tjTc95X2pPeSSWZmPj9hFEdF97/gG6Z7XSlRmfOeZGg/1u4sbV8txmcPznq1soFPdkRUF06tHEaOu/x93xu2I0TKwfF7UP2czkaeQkH+nckChrn92BcYBZRgq4HJDs55kmKYgND4b8ZMd9RBU+8/eufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711045689; c=relaxed/simple;
	bh=IfTBIcrywTIYvwgs+7Z0pL2QymFYqoq0PYWGj/Ltg8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BEzWkEtDmWm4VTnfaZoqlBeoW4xGWN2R0eT38UpixBt514AtvaSB+J0QoJ2k8w2ZYzWjosGZgjiHV7REyshz5FaqWnSB1UesWD5FMNWTq8AKDF2eIUleQP19lWFpuo8n2dBX3Ph4OpndlPc7+ozC4EdDOQTksXNa5p2aW2G8IWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XyubtlOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LC2fqU011093;
	Thu, 21 Mar 2024 18:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=35KjOga+WcjYc6Csol4JW6Rncnoosr31ikWbDTlNanU=; b=Xy
	ubtlOC2dPenXUxlHXBBVwc3ucvu7qofVmAvdW5cwOeP2eimp61ombtRjj2U9oEdS
	D58JnlzqDutXFDwn2l1pneLT2FqU2m4RQeDSl5/xRTM2Nm2QuzS22bnWV/OogW5l
	B+ye8uZ0dyjGtDI08RKy5C8UDUXZ6FHhWMgrI9C4/wOCQn4eQ2AMmsuMsuEFpFsB
	4OIoS5PcI6r1vkrDNRzwJ112rSOolyLsQ39TlMkQF7nx4v7GtMK//GXZWUIQnjK3
	OJLPv9fUBwSyBxtB5n/ZDRqnJT2KZjgoyGWBC2bQsqRR1h1BdWXP/Fp2pbYAOxnB
	+eFevzME4bHIm7NaC+ww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0f1nhtd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 18:28:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LIS0kD017356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 18:28:00 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 11:27:57 -0700
Message-ID: <0c1aab88-8e0b-5f2a-fdc9-2a9e01628fc5@quicinc.com>
Date: Thu, 21 Mar 2024 11:27:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
 <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
 <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
 <CAA8EJpruKjwOoRU8UP-b__n77Z18WQpJMUWdqgry4vZsQ5-QZw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpruKjwOoRU8UP-b__n77Z18WQpJMUWdqgry4vZsQ5-QZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h_OOya_htGwHBr-ZV0nBpUmVu8itCS4Z
X-Proofpoint-ORIG-GUID: h_OOya_htGwHBr-ZV0nBpUmVu8itCS4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_11,2024-03-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=862 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210134



On 3/21/2024 11:09 AM, Dmitry Baryshkov wrote:
> On Thu, 21 Mar 2024 at 19:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/21/2024 8:43 AM, Dmitry Baryshkov wrote:
>>> On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
>>>>> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
>>>>> Extend it to also support 4:2:2 and 4:4:4 plat formats.
>>>>>
>>>>
>>>> I checked myself and also internally on this. On sm8250, the DPU planes
>>>> do not support YUV444 and YUV422 (and the corresponding YVU formats).
>>>>
>>>> May I know what was the reference to add these formats to DPU
>>>> considering that even downstream sources didn't add them?
>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
>>>>> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
>>>>> correct way to handle it, so I'm sending this as an RFC. If we agree
>>>>> that bumping the .clk_inefficiency_factor is a correct way, I'll send
>>>>> v2, including catalog changes.
>>>>>
>>>>> I had no such issues for the YV16/YU16 formats.
>>>>
>>>> We don't support this too on sm8250. But interesting it worked.
>>>
>>> I have been cross-checking DPU formats list against the format list
>>> from the display overview docs.
>>> The DPU (and SDE FWIW) drivers supported NV16/61 and
>>> UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
>>> mention these semi-planar formats at all and interleaved YUV formats
>>> are marked as unsupported.
>>>
>>> For reference, NV24 and NV42 also seem to work.
>>>
>>
>> Thanks for the update.
>>
>> I cross-checked sm8250 format list in our internal docs to make sure
>> there is no discrepancy between those and the display overview doc.
>>
>> NV16 / NV61 (linear) are marked "NOT supported" by DPU.
>>
>> UYVY/YUY2/YVYU/VYUY (linear) are also marked "NOT supported".
> 
> But all of these image formats are handled by the DPU _driver_ as supported.
> 

Ok, I see where this discrepancy is happening now.

So I took another chipset, sc8280xp and checked these formats.

Those are marked "supported" in that.

Our dpu_formats listed in the driver is not chipset specific and that is 
causing this discrepancy between the display overview docs and what is 
in the driver.

I will plan to move the formats list to the catalog to eliminate this 
and prioritize that change.

Till then, I think we should stick to the display overview doc in terms 
which formats should be validated on which chipsets.

>> So the markings are correct.
>>
>> If you notice a discrepancy between our dpu formats list in the driver
>> and what is marked as "supported" in the display overview docs, that is
>> something we can investigate and get fixed.
>>
>> If you are running some standalone tests and reporting that formats
>> marked as "unsupported" in the display overview docs still work, we
>> cannot simply add those formats on the basis of your modetest validation
>> as your validation alone shall not supersede the marking of the design
>> teams as the system level validation of those formats is what we have to
>> go by.
>>
>> The formats marked unsupported shall remain unsupported by the driver
>> and QC shall not ack adding any of those.
> 
> 

