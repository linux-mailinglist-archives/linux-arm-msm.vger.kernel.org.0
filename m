Return-Path: <linux-arm-msm+bounces-35627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0739AD4F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8281A1C2147C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 19:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7981D172F;
	Wed, 23 Oct 2024 19:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QlsNIYXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE913BC11;
	Wed, 23 Oct 2024 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729712549; cv=none; b=OvID/0pOne7Ovr8RQE16bv2yUQi/RXABNZwbxMOhQq0cfV7mW5A2LSOBIeUzWLEiAeV02AtJrlnvx+59mqK6We9ASNTS7FmyYFwXKz5tm/qV4mYfBIcW8UjUxRtBHGKxKqzYo+Tt+eRWhob3H0RsA1eW4DwGoKECEY6Z4+GhTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729712549; c=relaxed/simple;
	bh=LVaFhLQapIc0ZkK/OTjneHOGSsk4mj8AVWq4oRfYt7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SLGjHu7ZOVTl34mq2iS7mIrorpkNYUxCE2AtwTxvOYqhaVtvaYP3plznu5mfuduBCrmNQBJ1iR/WUUhskStIQ+H3DwVnDwvSUlgHKx8yfDUkhbOnQ9WjvGIgBjgVTVH3zPwuv/AKtVm+yw231hkZgelT4fktexvhBS4LzrkC4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QlsNIYXv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9ZecR003624;
	Wed, 23 Oct 2024 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hOkkEPHh5v2lDBXE+5MmF++twajN54H112yfkX4INc=; b=QlsNIYXvEGf/qWjT
	i9Df2SVU+omZm3kZMNBhslWjSJLt3vgDHaDOHMiXaQt1nXNNhcrULtYny8Z1Dr4v
	kpZPhQQsCh+Mcws5STFv7C+O6mj+wFbM49IClba9ACaGiYHSmw+uXuB0ZXIqAMik
	7/kIll72y235eH3OwDEu4dRrQuqF3wbNAdesosVKZShfWC4XuxarPwbSIFQ59Izq
	sFC+3s9LmdlbP70Pj/zXzgZUDSY6oIyIX7qUa8LPQLnen+Rqrwg0N9nXgwXs5UBw
	LWWakHaFGdAXix9WMf4D96PdwaFpWS2AwvfvihpgzOAyPAe6IONfHdqYoKQ3KY/W
	Gj0CYw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em683anq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 19:42:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NJgBJB015174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 19:42:11 GMT
Received: from [10.216.22.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 12:42:05 -0700
Message-ID: <8219c6e7-18fe-4878-9cae-093898a7d129@quicinc.com>
Date: Thu, 24 Oct 2024 01:12:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        "Arnd
 Bergmann" <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
 <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
 <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
 <c80309ad-52de-4998-ab0e-05db7cc5068b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <c80309ad-52de-4998-ab0e-05db7cc5068b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g2d5s-lP0vOEyDNwN54rHo14jvchke3f
X-Proofpoint-GUID: g2d5s-lP0vOEyDNwN54rHo14jvchke3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230127

On 10/21/2024 3:01 PM, Konrad Dybcio wrote:
> On 21.10.2024 11:25 AM, Akhil P Oommen wrote:
>> On Sat, Oct 19, 2024 at 04:14:13PM +0300, Dmitry Baryshkov wrote:
>>> On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
>>>> On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> Clang-19 and above sometimes end up with multiple copies of the large
>>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>>>> fill the structure, but these create another copy of the structure on
>>>>> the stack which gets copied to the first.
>>>>>
>>>>> If the functions get inlined, that busts the warning limit:
>>>>>
>>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>>>>
>>>> Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?
>>>
>>> Kernel stacks are expected to be space limited, so 1024 is a logical
>>> limit for a single function.
>>
>> Thanks for the clarification. I think it is better to move this table to
>> struct a6xx_gmu which is required anyway when we implement dynamic generation
>> of bw table. Also, we can skip initializing it in subsequent gpu wake ups.
>>
>> Arnd, do you think that would be sufficient? I can send that patch if you
>> want help.
> 
> FWIW I implemented this at one point.. ended up only rebasing it for months
> as I kept delaying GMU voting until we get an in-tree dram frequency LUT
> retrieving driver..
> 
> https://github.com/SoMainline/linux/commits/konrad/longbois-next/drivers/gpu/drm/msm/adreno
> 
> worth noting that this used to be my R&D branch so this is very much err..
> "provided as-is".. but it did work on 8250!
> 

Thanks, Konrad. "IB vote via GMU" support is there in my bucket list. I can help
out if you want to clean this up and send out.

-Akhil
 
> Konrad


