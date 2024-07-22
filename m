Return-Path: <linux-arm-msm+bounces-26717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58918938A73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89DE51C20F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD15A15FCE7;
	Mon, 22 Jul 2024 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jXQrZ9s+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE6381BA;
	Mon, 22 Jul 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721634852; cv=none; b=HDIfPuzdAx3zdOtFFBiQg3FANkZJkj4HSGzyyAymiAL4LyigKuzEHW5gwPIdXDvA7XVKMxCdXoe/7ayXEehwYxof5TNVOjkalh3PRZofsVpNha672lwkapMqzmAmXNDgy/4YUaJP6pDw7TSxTu5gOg4SVSUGlufJNZGRO/tFCKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721634852; c=relaxed/simple;
	bh=1mDGEshSD9xdwzjbdcUp/z7NJrr4zCePNe23QqIgNxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OZ+1dwM/s1+tDQcPQezBFkmiycrPZB145e4sqsNzGssuppcn45RwMO1k3GgxcCdhb0wfGlYtgzK3O5tlHZfS/TeuXvl0QJytKGRTwzJ+oNAb0Ct3yE3kIuVI8XNLvu0P0vOFzevTBMePGxGiPFEdwb4UDDodJdznVP3UQ7egtsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jXQrZ9s+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNeO1u022587;
	Mon, 22 Jul 2024 07:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a56rZKm8C/m55xUFMXSQgb2iVdlO+WEYhbq0R07Sjqc=; b=jXQrZ9s+NLQF9xcw
	868KAt5ojnmuHZCfuF0/p+0N4GalnzkzR9lAErldwwSdulDSxYmCNsSCQVQX/riD
	IOfR3WDG9wErUe3+flMHAxnQ2n8ydZaYVhuhboZ2lafccjw2jPG14EARA9U3Bdev
	iv0fdGrxAncmgoabt5NTFc/Rcuqzh4DgQdjriUFSbzEgQWIwG2JMa8zsTtJ2IMeU
	51kT4j555mFBzaaEcTDBgsxxQOiL3pZt5UlDqJPE/ygLvmSscXTB/WcSD8AY163b
	XDJsAVaXw9hWWpurDMhR9GoIxqQBxsyFpUmoRmUyAtjDB05P6Pg0DlcP4BFvLd1V
	pgofwg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g6h8tvxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 07:54:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M7s2tx027808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 07:54:02 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 00:53:59 -0700
Message-ID: <0d29ff01-9d8c-48b9-b845-3370222c4ff4@quicinc.com>
Date: Mon, 22 Jul 2024 13:23:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
 <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
 <2024072227-purposely-swinger-86ad@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024072227-purposely-swinger-86ad@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R1w4Kxb8iSEHZcRfbH52GGldrcl6uP4Q
X-Proofpoint-GUID: R1w4Kxb8iSEHZcRfbH52GGldrcl6uP4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220060



On 7/22/2024 1:09 PM, Greg KH wrote:
> On Mon, Jul 22, 2024 at 11:42:52AM +0530, Ekansh Gupta wrote:
>>
>> On 7/22/2024 11:28 AM, Greg KH wrote:
>>> On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
>>>> For user PD initialization, initmem is allocated and sent to DSP for
>>>> initial memory requirements like shell loading. The size of this memory
>>>> is decided based on the shell size that is passed by the user space.
>>>> With the current implementation, a minimum of 2MB is always allocated
>>>> for initmem even if the size passed by user is less than that. For this
>>>> a MACRO is being used which is intended for shell size bound check.
>>>> This minimum size of 2MB is not recommended as the PD will have very
>>>> less memory for heap and will have to request HLOS again for memory.
>>>> Define a new macro for initmem minimum length of 3MB.
>>>>
>>>> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
>>>> Cc: stable <stable@kernel.org>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index a7a2bcedb37e..a3a5b745936e 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -39,6 +39,7 @@
>>>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
>>> Meta-comment, for a future change, why not tabs to line things up?
>> Sure, I'll add a comment.
> I didn't say anything about comments :(
Oops, sorry.
>
>> Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?
> As I said, yes, for a future change.
Noted, thanks.
>>> How was this tested?
>> This is tested with fastrpc use cases available in hexagon SDK:
>> https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps
> Do you have regression tests that attempt to check the boundry
> conditions and alignment here?
For most of the test cases, I used the fastrpc lib:
https://github.com/quic/fastrpc

This library is taking care of passing proper shell size which is within the boundary for
all the platform that I've tried.
I'll try creating and running some regression tests for this change.

--Ekansh
>
> thanks,
>
> greg k-h


