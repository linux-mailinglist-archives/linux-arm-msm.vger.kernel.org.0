Return-Path: <linux-arm-msm+bounces-26844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E059398E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 06:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99F201F227E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 04:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B60513BACB;
	Tue, 23 Jul 2024 04:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N4fmJBx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3C137748;
	Tue, 23 Jul 2024 04:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721709332; cv=none; b=ogZS3enQ+Pu1rYit69UEQGd76Qy1GxGnhHMenoWjJpbQeXjEauFf8/lbYgFSQom/8DXBeKlzrOEHUZ+gwfGyh5VCjQP2nvZvGqdkvVHeFnobxLrulD3sFLbattAHjJUvHjXS45iK2LOLHydeM0HlZ8jWngGu+PBElOwP+W0P/2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721709332; c=relaxed/simple;
	bh=4PCnwlxv2IxobXi6IociNJjbhyUgDkSbmoWcpbXEluE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gY5csb54merrmzNWxx2n2WhAZRJLF2UDnDTDpWVPJ6tfqxQE71y8FnycBE4vd/qrIc7DIiC6tER6RnWBio0odGEdAA2exsvqUXlnXFIw4gNGaRh8KDlOdoxiNp/wAf12JzD1nzJotQtUYNjqavxdYY9YE58dZ4ewq7kh7kewXJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N4fmJBx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46N15edS014619;
	Tue, 23 Jul 2024 04:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WDBOdvaDBBAOOl/2O7Zpqnim6uzIu49cIrw4RZRzxgA=; b=N4fmJBx3e4DOkrlV
	l6892miZH1I3rNhrrx5K6isSXEHQwW58RNIK3ZyJqcG2Iyp6h6mMlHWmXFNnN1yx
	L2X/Ow/Elz2pcNurBTKnnfHH5dMpT5230GbEKJ+hu1mNg8+zMvdH1cJh62bU6ED9
	ZmXioE48XZ9aGYU96zY+wPoWn6yTv/2StKn47vgb+lCPMFfoRChF4QGlaOwoMVKz
	UpxWKWYrp+kxNO+Z6OyL1wjQOH99i6FY2WmN4kpvcvspWkKegGAj47vZaAo/GCuW
	fhwZMwv04XUCI39oFWfjRduUSiqtjLcujFTR+INKx8tCt+rn5L5QfdwL6wSYvlCG
	he+qxg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g60jwdp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 04:35:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N4Z4Y1010496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 04:35:04 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 21:35:00 -0700
Message-ID: <63c52fd2-9f31-418b-8c6c-4c91f7c69fd3@quicinc.com>
Date: Tue, 23 Jul 2024 10:04:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-2-quic_ekangupt@quicinc.com>
 <ydp5ntlresenovs6qaqt7wdaleuruubem5hajbfadkratfsiam@wjn33ymp4gyc>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <ydp5ntlresenovs6qaqt7wdaleuruubem5hajbfadkratfsiam@wjn33ymp4gyc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xndY1KExMuqOgTmHjd6nsi5ZQMAQRyh0
X-Proofpoint-GUID: xndY1KExMuqOgTmHjd6nsi5ZQMAQRyh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230031



On 7/22/2024 2:02 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 22, 2024 at 01:31:59PM GMT, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. The size of this memory
>> is decided based on the shell size that is passed by the user space.
>> With the current implementation, a minimum of 2MB is always allocated
>> for initmem even if the size passed by user is less than that. For this
>> a MACRO is being used which is intended for shell size bound check.
>> This minimum size of 2MB is not recommended as the PD will have very
>> less memory for heap and will have to request HLOS again for memory.
>> Define a new macro for initmem minimum length of 3MB.
>>
>> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a7a2bcedb37e..a3a5b745936e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -39,6 +39,7 @@
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> So, what is the difference between INIT_FILELEN_MAX and
> FASTRPC_INITLEN_MIN?

INIT_FILELEN_MAX is the maximum shell size that can be passed by user.
FASTRPC_INITLEN_MIN is the minimum initmem length for PD.

>
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>>  
>> @@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  			goto err;
>>  	}
>>  
>> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
>> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
> BTW: why is the code multiplying filelen by 4? Nothing in the source
> code suggests that filelen is in u32 words, so I'd assume it's measured
> in bytes.

The passed filelen is actually the size of fastrpc shell. This size is not sufficient for the user
PD initialization. The 4x of filelen gives the approx. needed memory for signed PD initialization.
Yes, filelen is measured in bytes.

>
>>  		       1024 * 1024);
>>  	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>>  				&imem);
>> -- 
>> 2.34.1
>>


