Return-Path: <linux-arm-msm+bounces-72466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EDB4838D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADA4E3A9A82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3648515278E;
	Mon,  8 Sep 2025 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnP8YBIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7CE36B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 05:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757308340; cv=none; b=SAhmJsU4OmTk6g22N7VyCMkTDSYiPArJFARl5BRbqsm/qkgN261XmFw9/Wp2qMFRbHgd0QBnQJQzWuZTGfHDoEFkt7tOIjzNthFC3f0kdFotK42qQ6Z8dEn1LvhZbR+yIPVVkVrAbb8aSYXxTueb37ImgUsYD0XtPlRvFJYbJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757308340; c=relaxed/simple;
	bh=chHFdSgNZ1Tt/TM7JqxmS49V/jDCc50I9JRShzuwISI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKlxi5tq4C91W+tMCJcme/mtP2dz+XleAK7bem7i16yCpPIhcXgPOXunPT7XPasTokeZqi29PHN8Vi9aNFk0xiWWftMsuFBh/tJfSTWuqRGMoBoHBhx9d9MjspwkqPA1YjRkOqho5tNiFpxKsg8VGxCCUrs/A99vrJWLtn1O0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnP8YBIb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lvp3Q027829
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 05:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5W1iQ3MLJr+HmBQ8m//bgdDxKVBzjD+FmgkBQf6HICg=; b=LnP8YBIbCz210b36
	YKIq5DJH0+aW+aHpYoeEjp5Z1VYQnOpRAUhZvoltWyMzWHTKEYy1NtKbmCYlLH3W
	aXKObbQG/7CMtPU3RDlGFrhG1DHvyIoy1C64oaqoP6/pNbyTxkY/dLY9euaJqCNj
	Tc9RqAT5WS9UdH9bX4bG78MYWZ5G2ZXb28xcAtY9uXVdc0G11CM0JkvkF/mZG/mV
	D3ooxS01W5yRJLLAwnCqDrSH/VVSzgHUfv5PR0OjZhO5wHmG4q+/DHYuCUTsPcti
	Rfxvw3bwxoldR8WTHava47QistU9mpU9UBI/Jry3wDwlFOGtU7kngzKyiYVvE8ck
	9B28bg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8b9ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:12:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e60221fso7872514b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 22:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757308336; x=1757913136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5W1iQ3MLJr+HmBQ8m//bgdDxKVBzjD+FmgkBQf6HICg=;
        b=xJcfiTOHsspL2Gtgt0WFcRw0rN7h9HeH0kw/+A+p3ivb7tJD092MVhT/pUCERFLgrH
         /YispEBWbRa5oAjrlVgvrhCVGP8oQS/uHG7CUmeL2WjW6LRW5XJ54czTNyGVOuXBq69Q
         hTYghQZ/IVQAV2yvFEoB3+JGrJb2qidIQpqMOF3diIpQEKrge7DJQl5Fk0frRk5jk6Rs
         vARKi9q0fNMaNlu6R+vwUyh/d7e83wksITYF9W6wuFvoIFBvpLejrKlvqfrS3m+/xcOb
         TpTZL+G1JApESXfMzfw4vT8heEGdx4pkpJowtiFeqT9D6AaxaDUrmsHgravCMmPiX5oX
         xnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYLbB7KoSTgSKdMvpOOCWbAQS99v4PCyK7jVfuzYzaYoe7wcKYqcXFE+/GZJmpLsI75836S6vX71M14/oj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2HpKyJd0zciZp51sYppJe3RgMjMaEtZx+R2isyg2pOUMP1MWC
	/ZwJnJYGOusJ3w7lz9rUmfhzfVZG5JwsHsecsXCUGkD6l+N9xaGgxJxxrOOvrUXNrIVm1TC2h9o
	P7UDcnV95PEhknYtlHM0frwWGYT9SO+nxpawkVAn2o72GJaSxGncKevByqxtxKusERACn
X-Gm-Gg: ASbGncsXpD58yOoWjwCPFnGnAsw3YxocEuWhBMm3wmOjTZEtja/ur6RzI4Ert7g6jzq
	i36zisPx5XpKsXhFF8JsBXsFQ56+Q1Vgb2JgEB6nCJWl92Fq/jKqoCeLlcPAeScIVTHUqlpRUOE
	clyCxw/zsPAPVFU+byKI1MLOGI2zTIKgXNH+6lfVWQtPtclGhG5tOEtSxCNmW9mWVivbJ1hler1
	L0F3SjQxW0eRpxDoHqGyWGUvDR7iiBeVcrKdX8QkigAU7j9Wyo7X6saToT5tzZp2NP9lxpEBdhv
	fUm+XmzCA6AHrpUp4S4mEeuxhwEzSyn/W32AVB10Lr4KMi+tVYqIEt9U/9FufEEELibMjZU=
X-Received: by 2002:a05:6a20:12c1:b0:243:a190:149c with SMTP id adf61e73a8af0-25340b18f5cmr9589809637.27.1757308335833;
        Sun, 07 Sep 2025 22:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcobsSnfGakO3F8QbsZWMS7rekM1wlZPOOzIc5FjpObcRY7Bs3QOX0DDBjs19qqxadtd2DHw==
X-Received: by 2002:a05:6a20:12c1:b0:243:a190:149c with SMTP id adf61e73a8af0-25340b18f5cmr9589771637.27.1757308335266;
        Sun, 07 Sep 2025 22:12:15 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4ec3a29e16sm21338075a12.24.2025.09.07.22.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 22:12:14 -0700 (PDT)
Message-ID: <7250915d-4611-4f81-a46d-b85e76185aae@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:42:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
 <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX4yaNzZsgBoF1
 cPvyzr5TGXVUoNGIMJ0Y7ABi9bTw2Kw8jXD7lm/8x1TJCrZgHgrZrKyeew9sVOiBkb+yFBK+xgh
 8qYdTG2wWjc9+UE/K9/xqVdwCdC71i2ndSAFsi0r3mDQMkycDaCLVjAIL4Ev9h136e6Dp/1cS7u
 cD7s1+/R5FfQBNFqKDNJtYNenLd1wwAhT+i5qPeFx+UV8wjWjXnrIXO+8ht1XwviLUWQ2iCgLLZ
 U3qVCdA7ykNCGfyH22igKXUFP3l0YK6WyvQflw1xWBhKYsQ4pNC8BLI4138Y9Mm6SJDBR+D5wUz
 UDW2nuq4N3VzFfJpxsovMST94biDMV59+mmm1ddUOPsFqtCRlNyAn8mjRQqfYUFkkGh4849JaYd
 OCh3+2iS
X-Proofpoint-ORIG-GUID: 5C8B6TvK4kfKKMNzOd1rc5k0WwlYS5Zx
X-Proofpoint-GUID: 5C8B6TvK4kfKKMNzOd1rc5k0WwlYS5Zx
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be65b1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qNwnL0dspBSjYX0ecmAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/2/2025 9:42 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 11:03:35AM +0530, Ekansh Gupta wrote:
>> Current fastrpc message context uses a 12-bit mask where the upper
>> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
>> represent PD type. This design works for normal fastrpc calls but
> FastRPC (here and in several other places).
Ack.
>
>> doesn't work as expected for polling mode. To enable polling mode
>> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
>> context where the upper 8 bits are context ID, the lower 4 bits are
>> PD type and the 5th bit from the end denotes async mode(not yet
>> upstreamed). If this bit is set, DSP disables polling. With the
>> current design, odd context IDs set this bit, causing DSP to skip
>> poll memory updates.
> This looks like a description of a bugfix. In such a case, move it to
> the start of the series, add necessary tatgs and change commit message
> accordingly.
I'm not sure if it could be called a bug fix as there is no problem with existing mask.
The problem is seen only when polling mode is added.
>
>> Update the context mask to ensure a hole
>> which won't get populated, ensuring polling mode works as expected.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 0991ac487192..57e118de6e4a 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -37,7 +37,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> -#define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CTXID_MASK (0xFF00)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>> @@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
>>  		fastrpc_buf_free(ctx->buf);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
>> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);
> #define magic value
Ack.
>
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kfree(ctx->maps);
>> @@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  		spin_unlock_irqrestore(&cctx->lock, flags);
>>  		goto err_idr;
>>  	}
>> -	ctx->ctxid = ret << 4;
>> +	ctx->ctxid = ret << 8;
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kref_init(&ctx->refcount);
>> @@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	if (len < sizeof(*rsp))
>>  		return -EINVAL;
>>  
>> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>> -- 
>> 2.34.1
>>


