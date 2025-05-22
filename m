Return-Path: <linux-arm-msm+bounces-58987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5462CAC039C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 06:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F12946E90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 04:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCED02AD2D;
	Thu, 22 May 2025 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6NeIM76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360A28F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889889; cv=none; b=feVAz41PRs3wmf/HFuS0ItKpXLuLDQ8+GBJPrsDMuTcDdAIZNWUhBp/SJgzsvMRct0bHEMkNJf5xAlT4llBk/ZJhRU2YFnkSHZWSI/3vhvNNt+PJkrqiRWmQe1VwpVZ7OmCB6nmAyFCjdkq1PORz9+meq4TI5jqg1zmGJJXhfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889889; c=relaxed/simple;
	bh=yJiKEVbQQGNc5Hunh6IjNXb7O0oPVjSmIFL/eLDsTJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouBu9M+EMeONs+4XXly4R1m48jIXKLoWKPFn1l0ipEcVymRMnpiWd5nhNzoagA0jr5jjYJsn4mCIgkaZkh6sZXO3wloFO9Ybkf4uYTzeK8886jWN1LfZ19YaNopWaHbxy59oju6I2/xW77IZfuZMgN/ZLtiymNihi4Dv/TUaAO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6NeIM76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHVTGn016898
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 04:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIhaT5G+O4jv+4Rppitttslv/f9qcTHwZaazaxC2X7A=; b=M6NeIM76qR3RGYkW
	GH263vXADcQAt/tpY4hKa4NMSSfJL4Wdvjb+3b4g7kEAdKFpuR5TS3FDZB/RqdBR
	9U/llcDtl5PZ0WRCUX2I411dxc3cbtnOWUhmq20P88WiGiChTRiUogEhsPLmdSsc
	YdAuUwvCa5u2u0QimnB5DoPh50nOizjvjQYsqeRc0rcn5vdzVhg0Vgz/HsFYMbMh
	e8UxUtRbGn0i58z/slD/8U8OULsY1v6rH6SbNP1GJerIjHOksFvc242CeAiG4VS8
	ED/t4r8v9ghRJSuZReTVW+LhU81uaBVHYi62FhpoIGdikH8gDyozTBJkUNKiyh38
	Pbwgeg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9w278-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 04:58:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3108d4ea2edso1469998a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747889885; x=1748494685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIhaT5G+O4jv+4Rppitttslv/f9qcTHwZaazaxC2X7A=;
        b=MvaNWOC+H/HsbXVb152V7NYiasuelL0SyATYcfCQ+7joVFqe2fSH75IQTB2wTomGBB
         OzXvS5iLbF3J+VY0eZOVkRICJM2pZZUPW3PmAyFuLfXcyQC3F6pZ/jdRjjA8o4g5aeeh
         Rs2QoFH2b62Z3Wq1NnTLAmRZNJSZIpemCR6sZO1voYx/oywFMnDCQwpf6PfdbQoi2ARM
         AbN1LZh32JSiZlU4jDYssTH6FEkFB/kOB1G3CijjAAv0x9YK7LvvuYxmpUBS39Y+48th
         IdPHOUv6kMlV5QyILN40T2M7EaZoC/X5BAnFFWoQ7mi8J3u18WJjlXLzXT2NLUv8Vu4c
         19Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVYC7sVZpTSJEQrCLxRdMwCNIcCdAadajqT3DxSn5O9hWU7+/9rfvJfmFybCsQuqfcpkPf2yza+/ArZ27qo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9XNOpIbvLLejN0l25FPQiAdGVOOPKfBaQLRjC+iJE6skJX+H
	iJ4v9xVq2+FsvhEZzwVTOSY8o+1xtD6lnKE+p1RcOp6id1JXxgC5Vqv6fnIGmi2xHvKUCYJBeTv
	7riNuRrKuyHLWTxjksio2pSpSrT9ZqeXpjf2UU00fvxT7svOpNrdba7tXk8+syu5XjsFC
X-Gm-Gg: ASbGncvH3bMl59TQNxLdSFIuTUlzTqux30SkiNrKJxzonToRl9vKW26aElw6zggXMEc
	B/LONBmDcitDKK5E6VXuAOVaBSs48PJPMMLKLr/YtVrZ7q+7sdc4hDdCJ+LqjI4iSUJ+2igLpqT
	h9qg1Mgyjlgb/sJtBPE+cQBD2Z8YlzEsFbCkz5MIZXWxzrdD8po9USXdd2cDsfUTO1eMS7eSfF9
	EUu8AF//OkyR/yRWMcjZSzErABovLIh4nVnX5bbDJGYgm8vt8tbq6X82+rf9Zlqh69urQHlae13
	KoMUxCh+OyhrwrvCkJMx88FmZB0HETGYB6jinWc=
X-Received: by 2002:a17:90b:1d4f:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-30e7dc1e9b5mr35745999a91.3.1747889885303;
        Wed, 21 May 2025 21:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgFlJx8rTQWPzKRRylxW+8edqi7ODCCkLtM14szkgvjdsmG0w/1FW82rK8UWnnM3Flwuu/Og==
X-Received: by 2002:a17:90b:1d4f:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-30e7dc1e9b5mr35745974a91.3.1747889884822;
        Wed, 21 May 2025 21:58:04 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26f0824702sm9960426a12.62.2025.05.21.21.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 21:58:04 -0700 (PDT)
Message-ID: <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:28:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
 <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682eaede cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9ctudvHJBaFMfwVJERYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 2x1tPN4AttsbPGyt6rYm4g-uc-_6g8WQ
X-Proofpoint-GUID: 2x1tPN4AttsbPGyt6rYm4g-uc-_6g8WQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NiBTYWx0ZWRfX+JqCMvI7aQ8h
 S3dm+1jigBllOUdIjo5oAZsJ/7cAC2cGlPaZ3KFXUa6UzMuHTVphZftjs+Yhvt4hUKZQ+mT1RpR
 KAK2CVUNPGYLqvmZVhzB05NwzgH5UQYupk/+96MazhdlqzY7+5nNB2XNfe+1WsvZuJXYNorEdCA
 zdN5XN4zhgjRlzzNdcVg82Wg9iIhD7Eug8izIWqU2BTqr68TIk4cCk+vql9uSCZnU1ac6FQ1zBY
 z1xLxdevyK9pVF7bJdY1xnq7qSf941nmjCfj/R+YbDOPD8pgLQzM0avgwod8+KfGObgZU2nTKhB
 Ep06YLJ2/wSh6tQDTkGzoHv8hR6UaWiVo8jTu0H0ggUcyKcVy1IHIA4bNbsZdY3hfxfp99ukf2c
 lt18BggCWAOiMLPXFsLkWXdfne5pXb9wetRFeyJgr5iq5jgjUbBmxjsX2qr7ZAZ3zVwRzART
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220046



On 5/19/2025 7:01 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
>>>> The initially allocated memory is not properly included in the pool,
>>>> leading to potential issues with memory management. Set the number
>>> What is 'properly'? Which issues?
>> inbuf.pageslen is getting updated to 1 in case buffer is allocated,
> Is it a flag or some page count?

This is page count, based on this count, DSP with add memory to audioPD
pool. If it is 0, the memory is not added.

>
>> which only
>> happens if (!fl->cctx->audio_init_mem).
> You are describing patch behaviour.
>
>> Till now pageslen is always 0 irrespective of whether the memory is allocated
>> or not due to which audio PD is never able to use this memory.
> and the is current behaviour. So this answers the first question.
> 'properly'. Now, the second quesiton. 'Which issues?'

The issues is actually memory leak as the initial memory is never
used by audio PD and it will immediately make a remote heap request
as no memory is added to the pool initially.

I'll capture this also in the commit text.

>
>> I'll update this to the commit in the next spin.
>>
>>>> of pages to one to ensure that the initially allocated memory is
>>>> correctly added to the Audio PD memory pool.
>>>>
>>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index d4e38b5e5e6c..b629e24f00bc 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  		goto err;
>>>>  	}
>>>>  
>>>> +	inbuf.client_id = fl->client_id;
>>>> +	inbuf.namelen = init.namelen;
>>>> +	inbuf.pageslen = 0;
>>>>  	if (!fl->cctx->audio_init_mem) {
>>>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>>>  						&buf);
>>>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>>>  			fl->cctx->audio_init_mem = true;
>>>> +			inbuf.pageslen = 1;
>>>>  		}
>>>>  	}
>>>>  
>>>> -	inbuf.client_id = fl->client_id;
>>>> -	inbuf.namelen = init.namelen;
>>>> -	inbuf.pageslen = 0;
>>>>  	fl->pd = USER_PD;
>>>>  
>>>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
>>>> -- 
>>>> 2.34.1
>>>>


