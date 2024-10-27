Return-Path: <linux-arm-msm+bounces-36082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 826469B1F94
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 19:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87FE91C20938
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 18:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880F11E50B;
	Sun, 27 Oct 2024 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XEi4zs8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C521CABA;
	Sun, 27 Oct 2024 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730052920; cv=none; b=DLtjhy9LntrLgSRold4dMOV2/0qKxCu08+Z2PQzOFe/KIn6gnJlnXJ7rt2F9NG5KcpZEUS716Rc9rpbdbqYYVScKTcnxgNOdsaKnL/keOIUw6pqFV/bSwXzgCOd1cURws+n4JMB7nGYYlBOs0CTIkrSJGlsXyD9N4xB3lKhXf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730052920; c=relaxed/simple;
	bh=qI0FQln2WNTO+W2mP8bmh7MmrUK/GDrK+N8xjimv6Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yt5S9mCu7/9NyaRkgixx0achGtWExvzQtlfm1hzSBpL1GlrSM+MlHjWxniCyFuvq/4pHiZOCLv3QOCu2nynN9zDFkGShrgGmdjSp5oL/braz8gDUmm/IVueXF7vSotnq691iWsDOIStAUr/MBYqrn/lDXR6D4PBLtWAwfo+8b9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XEi4zs8u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RGWAcX018030;
	Sun, 27 Oct 2024 18:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryLDfSY5+pfgufjaYOpd06CcYoxxkOqG1oO+4yReuYY=; b=XEi4zs8uLO20L+lQ
	5/khr7SLDMRSaDTmqG+yHYyBTc2aWvyKvy+LlEcBRQJxX6fEvVZSuBaMP1a8RFsE
	s070FuGWQ3l12FFlt2uozDZhxrPhS/8ouzmr2w2qsAVWMNAOz7O3aklk7Wh9oFbC
	fiXN1WGU2+jp8I2KR4F3etuII8rMq9ziQXhSDAtFgRTsR/mq4JeRHkzZ9ADSd/M6
	qJ+QhGkpfGmcGztcs/Nj5Fnm/WhdBGn3HEyAcRixBGiGSgLHP+hgLyuufN4Dv2s6
	Le0O7iQCnyMs6xpKATtAxYaXdPfgfPuY0ljN4V2ekuxyL8Br1ZUKrhmWsGK90ypq
	SUKWNg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqjvf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 18:14:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49RIEqBD019859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 18:14:52 GMT
Received: from [10.216.3.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 11:14:45 -0700
Message-ID: <bc1ba8bd-4433-4f83-8ce6-73bed5abd843@quicinc.com>
Date: Sun, 27 Oct 2024 23:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
To: Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dave Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>, Sean Paul
	<sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
 <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
 <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
 <cb728358-ac32-4b37-a954-967f338385e2@app.fastmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <cb728358-ac32-4b37-a954-967f338385e2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uCJRpz51yTRPHh7tnnEpDC96pKyVw-wS
X-Proofpoint-GUID: uCJRpz51yTRPHh7tnnEpDC96pKyVw-wS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410270160

On 10/21/2024 3:31 PM, Arnd Bergmann wrote:
> On Mon, Oct 21, 2024, at 09:25, Akhil P Oommen wrote:
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
> Yes, that should work. I actually tried first to turn the model
> specific data into static const structures but that ended up 
> not working because some of them have a couple of dynamically
> computed values. I think that would have been even nicer.
> 
>       Arnd

https://patchwork.freedesktop.org/patch/621814/

Posted the fix. Btw, I have copied most of the commit text from this patch.

-Akhil.

