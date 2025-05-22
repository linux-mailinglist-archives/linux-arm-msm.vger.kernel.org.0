Return-Path: <linux-arm-msm+bounces-58997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF8AC03D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8800165E76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 05:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE451A3172;
	Thu, 22 May 2025 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgEz0WyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAF15CD52
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890711; cv=none; b=LLmqmUCZRsExQG1TpjRSLlcPFkaVyb8+pwak/Rh6xLx1knChYdHkciMZdp6wLUTfrGzUnhBlaVzQNUMeTe4tVodhXPSpCXEPXRq5Seyxy+dTSPPloVpBQ9WtXroUXALWWJ5+dCf6RiGcxFBpiiUxio35G+CZReXOB1lkFj808bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890711; c=relaxed/simple;
	bh=QjZeiDrbEQlfvjSKrEL51aJFlWsW79dljfVaMyaRPrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlE5q7OAN26fQJpl6twmyHXb790HaogFz5mhmCgvi7iCujIy9njNqkS9AJgYat7b6MTbagHDPOSddw5+avZE8h5h42QZvB5ZTmh6mbTg+sBRz4NRC3C/LhFv3cO6WI2dksBmkecq3ZMbl6G0FlI1ndMo47PO4akJsNbTr9srU+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgEz0WyI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIG7xV027623
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yH0tvCc3KicUvHT3d3nDCnjROeZOFwEqUxq5ncMRAaQ=; b=TgEz0WyINhyGWgPz
	HGsDvSNeAOndlR+CKWxEVyTPCzPDJmcKZFaADEXCk3a4ISnBj7345Tv1JKqwt96u
	5P63qIIkXGcAck20iAxxQ5zGRPcDqspZ8zFqNVtSy/Eu5aJXKTLYcX0JJY02J32E
	zwRDrW62UrGJeFBN6o8t2sMxccNUgxTJ5AEvYsgggtCXNz4nD44jBHs2vnHs0Tqq
	TYdo5yEpLIzu3G4febfZ6XC5qKy/YMLVJ4IQPH6wOX0Um8bI44k8izE+bL1VayhL
	SBl9oPqRaVPiG9XgoJsNq5Racb8thhHeIzWnos3yNjD1J7FDyh473IFAnMYhtUBJ
	M9d4XQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9d10s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:11:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c9c92bb1so3803216b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 22:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890707; x=1748495507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yH0tvCc3KicUvHT3d3nDCnjROeZOFwEqUxq5ncMRAaQ=;
        b=F2iRCUDd3u/BzWeFeXGhHHBr60ob9hVTi/0IYaK6BM6ldt1oAarxMFFCftLTcBWojh
         O8ZOrfOUO5wzxLDSN4NjJzYXqmCy947eWpsDFAEajUPkfT+bppDxwWJeXAFozpMfD/s8
         fizvKMyFPuDgom1Ymbx5s1bzEEvXi9AWkXHdTlS/nYJnbAIgF2+mz+516taTEI66YJad
         y42/1BJmYoe9zH3rYIUFKo8ZXQFnjqkNO8TySOIv3I62SaUJW4igaiIc+0pGxix/Tsmv
         QkL7AHy7Y5LT7PmlwfOntc+qKFvOcIeufNbphy0T77f1V/C+K3p4AQSf/3lI4Aj0qn4G
         vsxw==
X-Forwarded-Encrypted: i=1; AJvYcCU1JLOajRNkJjkLGu7uFoREsDlLewOGIUfndr8PQWRlJ8kRlWhT0j+YDZ6C+ZfPSu09E0dNB3Pdrun5bNND@vger.kernel.org
X-Gm-Message-State: AOJu0YxMI/xJ4zJ8jc63JxT96sB4k1Ye/qbO00kSWNN9r3F3+kuRkDNe
	nqbqJBrqijP9b1VOGDpBaaJ5MJIzHS0hi/DLaUIBIWL24K7OBw2TOjhlBbqi1HEcWp0w2JHu6ck
	Qm6hVS1ttHfb4YOvMZgJe2AdH49+yy6UV8ct+C5TNiU58gBJ4Cz+zCYz2T9Udm80YT6bG
X-Gm-Gg: ASbGncuFuhbsWdnMlopLBSwqd8mftUQ8QxnqCefFesBEayA59AeL3oij2FXWIMnW5B1
	SpaFXxwBMpv/H723JBPc82sZCRpoBpn4b3RIaj3Y0E8WdNtELERePOxdgvyKZJZpgtCnwXGtfCq
	lDFXIMEvgV2zXVTivSV5gRp3hy4l4JWp5G9Rvh5ASs0a1Hb2pqId52KNMpE8ml/XpBdXi08yxca
	2BZXhZg0vfkthM/zdf4rAjD5286vKxOKDo3bzve8GFZpytiV37fAMMl5J9nP1a0cE5P7bjsouVo
	x6nM4J2CUF6DbGznQ4bqRBFogyi6GdP+pUFILiU=
X-Received: by 2002:a05:6a00:369a:b0:740:afda:a742 with SMTP id d2e1a72fcca58-742a9613980mr33868062b3a.0.1747890707060;
        Wed, 21 May 2025 22:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG/dTVa4GXPqwNUeSN0A0GCG5iVoz9ExoAxjf6/frJwSzFAr6YcpgnUtwrLlA4Z+C+vjNWhw==
X-Received: by 2002:a05:6a00:369a:b0:740:afda:a742 with SMTP id d2e1a72fcca58-742a9613980mr33868031b3a.0.1747890706658;
        Wed, 21 May 2025 22:11:46 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b853sm10824726b3a.98.2025.05.21.22.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:11:46 -0700 (PDT)
Message-ID: <e9f540ce-725f-4def-9b95-edb86429e96b@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:41:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Et5u6mrejsoSvi1NA592NnCbtytOyeVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OCBTYWx0ZWRfX9usSEnvyTrob
 NuC/W2rmO0xF0gBo8nP6WSHdu0l7k0FGROnOMU5qm98QlTXgOTl8/kv7BI+izFgV8eIuJlrvK2m
 zjWewbjGQAatR8Bh4LRaQNtpO8M8Y/c6Ec9GPiK3rWDUKPGFwqgACQtDP1W6/cqeAdQmEBc2gMs
 2LG2CkAX2/TpG3LhKk9DyMnLLBjjHm5nMxpHRN8v/SWVt/zrXVzXt9m/SNPk2vDJWSGuRxTHE0Q
 RQDSF+GVuMbZRy0lkyS8WOmCrV1mFzr2jujMbuIvgh4hFb2zbenn2pN3romfTbspjRXWa1rR3ii
 w08QeNetWboQ4fsKWVxHPiQKovtl46xk+GDc8p+L0ISnBei9sU9yRLQ1wtScRxim1AGoHzysz+y
 0Zx+ZPYBhQpPxYGeSqCoCs423XgYZl7mDMdxCgaVJFnpIlstFVeMtC27/+gYHDzFDAZyyz75
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682eb214 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z1Fpul6eystrl0X_OCAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Et5u6mrejsoSvi1NA592NnCbtytOyeVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220048



On 5/19/2025 5:11 PM, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. Set the number
>> of pages to one to ensure that the initially allocated memory is
>> correctly added to the Audio PD memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d4e38b5e5e6c..b629e24f00bc 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> +	inbuf.client_id = fl->client_id;
>> +	inbuf.namelen = init.namelen;
> inbuf is not used till the invoke call, why are we moving these two
> lines here?

I just moved it above so that the pagelen is updated properly.

Would you prefer storing pagelen to some local variable and then eventually
assigning it to inbuf.pagelen before making the invoke call?

>
>> +	inbuf.pageslen = 0;
>
>
>>  	if (!fl->cctx->audio_init_mem) {
>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>  						&buf);
>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>  			fl->cctx->audio_init_mem = true;
>> +			inbuf.pageslen = 1;
>>  		}
>>  	}
>>  
>> -	inbuf.client_id = fl->client_id;
>> -	inbuf.namelen = init.namelen;
>> -	inbuf.pageslen = 0;
>>  	fl->pd = USER_PD;
>>  
>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;


