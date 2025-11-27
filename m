Return-Path: <linux-arm-msm+bounces-83525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721DEC8CF51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35563A2E35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 06:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05B527B347;
	Thu, 27 Nov 2025 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvrWlWTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvlXVxp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A32673B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226318; cv=none; b=fGit0CfLRqLSEfR01kjoU2o2tSpA5QXVMPzIivtVBzWmu2PjDS9jH84sav8VJIoN0Ex9Rlkj3rCA+sTvz+1jb6QQ83Wrp2Y/t+zL6MTPqTa+b49btLNX25lrZs0dDhnaD3PJCGU3CUA3dL6iKH70J0jroiBo0ZbcOT4x+DU1kVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226318; c=relaxed/simple;
	bh=xqzU4d9mYfaifE+Hr2IRkSgKUFHahjBnhG9eRRb/sGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VE0HsJgeWydy6hBddWOfmN2ZaDDaDmsYnXDrv/X8Qa3Sjzv4G8Q5wHxLUtl5F8q8gFxQIRyT7jZGrT8FPWWrb9hFtofD7CwRwXOCXZl0XQZVMhWsl8H73ee6CkAxFGJ2x/ozujXjnvrbNHc2gJvwv8KbQcYrVkafTrm8V7oCt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvrWlWTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvlXVxp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR24r4J3840085
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeCsF15G8E8OYcfgLAnaby8E0j0DSoBR+9k/GnsWTmE=; b=FvrWlWTHGhCqOZvz
	a046/rTpYOSHJqYf6uZASxPpYEJf6+/oiX8RaDeBA+Kk4OrJtaQGQ3JDzHfoHH/y
	v4hlpK278CfoitsibhHpQHUzP5WnvwWcpuNdLpryDIrTjuXVsTpr1d2CZLIZfTTg
	qrO8+ooryzrJCKNmdFenxT0Iztyz+71tK+iNd/ewS72ssp9goa4M2dnPqHr66aJ0
	Cori2WKejZ94z3WHWDWyQMprev1Qguh4atpkx7X+MClVh5S5NWenkQnMwPfMIBHB
	Knhp8gCYHw4b+GqFOE/Mopue5yOcuI5eycuPGPdraZeW2mMwvJ6mSbZPR9tLq6sF
	uRI3ug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj08mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:51:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3437f0760daso1068517a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 22:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764226315; x=1764831115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeCsF15G8E8OYcfgLAnaby8E0j0DSoBR+9k/GnsWTmE=;
        b=SvlXVxp6j7qCPMZ7mXUAz/8ai7JQmtzH7Xd+Wqbjipj6UdXvTD/SBJMKl7pTOI3vTF
         /wmVBjMgErUjly9z/BUHXTyBn9J7/Gwxhz6OV+Mcu+T0tGvr6snGqGopJEFDOx9OomDU
         PrKc69/GzU/c44Uxlb0M8/vg+ZjFJ8VYm7yA2dOzDlBcv0RIQlfgkC3olgMK7gMglc4K
         nIW6oruiLzOCu/ul9j+hPDgDShe7AwlFcdIr8aKI7QcFRfwZoxVgYq5w6rTkvqJnec5d
         kl3WK9JKLjgQOmZvbvFJd+rWGsD8ikm6enAbH/97BUyOuDtO8VK+LLLJsj2UkzEjWNSB
         2BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226315; x=1764831115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeCsF15G8E8OYcfgLAnaby8E0j0DSoBR+9k/GnsWTmE=;
        b=bAMhsqnJdu02jiwGKQ6WV29oGd/voCekFzQSkG/O+1asACAf4xN6fvZFwmW9aHR4mr
         qFSVBCu6X1tNMn9owzkYc8SwvRufHxhyYlYTdZJ34PCtDft+GC2O6P9l9HKXa7cMj3n4
         djpx4D1uSLjO47AGmhyd24e86siB/Y/7dsxpllagUCdVTLUVyLWzR1iMp02rI5LDp6ug
         j0ab6Xt7LtcJpQb6eNMZpzs9hh0ha2bFb0t5m6fCQ/u+z0ZQ0FG/8ou15hMwmo2GP01n
         /lT5QhMuR19pOHE1SrH8xxugltmKp8Q5h0XCPsb+LqbAtALgX23glaNjwZWZKDBRgIi7
         VRQA==
X-Forwarded-Encrypted: i=1; AJvYcCUGvjJgl18niYr4w0/OzDQQ52zseL6xpowYeBexK2M9Id1HeALNINDjZ0DlI4TfvnA3VY6M61UaixQ+8b4D@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8P9KUMhPsxMAMr7Uz1qH5Fl0Jcydy0WCqWdd2JqcuaGe8J4c
	8R5YF14V2mi1BuBgtE/H4TwY/EOBdTmJ2BxRrtuAFUbgay/cS/F+l+t+6E5hQEeOUeDuf7bdt/g
	QuoHLwPKBAZXq/OZLQtY8HQQ0pgyhxLUmxx8qPhwnDR4sqI69PNchnyXaG6laG2PPAAfakwNEZC
	hp
X-Gm-Gg: ASbGncuLSpV2gDhSlAj8UwDSfIXBY9nJ7B64rPjL0ETOhy+3N3WFy2zYCKGCe4WRvyq
	z4bMo5EDRdJqhPGx2oDVN/Iks/s+vQQqwWy/EIMG/NUL/rGxwGIoF220xFvMKh3CaYIVjaeAHtp
	otgdImto+J8tFi12L5b5asHNjAtp8RcS74kBAfgl9X0sScw2V2LcgoEEGSrlP6iFY+9oZrigQCU
	6eeehbHBgok3jUa9XeYefoeSvoeZDRG2cp5lKq0Imij9bg0jzGANZVb0fojup2YhS1gq5WRezp8
	6Q/F51sls03840N9z1h5jcCvbc33eXH/hRnD3FUIQM8G3aB9p3CTD5srO8oi3+C0Kk4RciWiRpM
	s5gKUQchNIOXr+MbcPYRXtu/cBY+rQALzF/c7hXQO
X-Received: by 2002:a17:90b:544b:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-34733e4cd33mr21162072a91.5.1764226314726;
        Wed, 26 Nov 2025 22:51:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXezn/5XXLOVzK0pYVsSVltQLd6doH911vDCSYKCuXDYyKkHcfioFnRNBO7KDkL3rEIVSqRw==
X-Received: by 2002:a17:90b:544b:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-34733e4cd33mr21162043a91.5.1764226314202;
        Wed, 26 Nov 2025 22:51:54 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b20b5d6sm765741a91.6.2025.11.26.22.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:51:53 -0800 (PST)
Message-ID: <b3bb2b91-c938-4f7b-bbb7-52b18743b696@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:21:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
 <jjzyh65ym74si2u7ig5gtckffma522ebjbeqyr4ym2sddox6iu@l7uion5z2rvf>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jjzyh65ym74si2u7ig5gtckffma522ebjbeqyr4ym2sddox6iu@l7uion5z2rvf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OSBTYWx0ZWRfX2Xej4hXreF7J
 P0cJdljkiFVW/xhd9idPSLNgVCeVkIdxjIzkYMKPsvwGnXwDQ4+hhqUEKclzbgAn6ExYY0tgI4h
 A7npB9Y12J1r1PyLWrykfIiip68x03UTyQBa/7IPMbAnrJGLhsKWMnF2x3IstrcZ16aLvIttv+b
 1N3aHnlc8f9s2e2UdhZQYjsCfJxFN+fRK573FWy/mtk3icguc9PrV42bArHTLWZeh6WcfAA0BhJ
 K7VUsia1uY479teViYDRvlYwihyCdpVSM7vuenhPoceIIoGyAyC/ZbFc8AhskBYbC6xzvxt8cv7
 19iXs4otcSRM0ED32uZ6f2dZE+SwDk4wf9YzBlllYw2MrZda1jtw1OC/IYn5ExhyFq/56sKHWek
 dB8ygrrlad6GBAzOsVXHdr2L3OhXCg==
X-Proofpoint-GUID: 5AlmG2AEBqLlWdbKo2ECzZCbl61WVkKU
X-Proofpoint-ORIG-GUID: 5AlmG2AEBqLlWdbKo2ECzZCbl61WVkKU
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=6927f50c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=--HMqWDFDORZCQyJXVsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270049



On 11/19/2025 1:59 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 12:11:10PM +0530, Ekansh Gupta wrote:
>> Current FastRPC message context uses a 12-bit mask where the upper
>> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
>> represent PD type. This design works for normal FastRPC calls but
>> doesn't work as expected for polling mode.
> Doesn't work why / how?
Explained this in the next statements, I'll rephrase this.
>
>> To enable polling mode
>> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
>> context where the upper 8 bits are context ID, the lower 4 bits are
>> PD type and the 5th bit from the end denotes async mode(not yet
> What's in the middle between bits 5 and 8?
It's unused as of now.
>
>> upstreamed). If this bit is set, DSP disables polling. With the
>> current design, odd context IDs set this bit, causing DSP to skip
>> poll memory updates. Update the context mask to ensure a hole
>> which won't get populated, ensuring polling mode works as expected.
>> This is not a bug and the change is added to support polling mode.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 679cd8997a00..ccba3b6dfdfa 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -37,7 +37,8 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> -#define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CTXID_MASK (0xFF00)
>> +#define FASTRPC_CTXID_POS (8)
> Use FIELD_PREP instead.
Checking this, thanks
>
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>> @@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
>>  		fastrpc_buf_free(ctx->buf);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
>> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kfree(ctx->maps);
>> @@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  		spin_unlock_irqrestore(&cctx->lock, flags);
>>  		goto err_idr;
>>  	}
>> -	ctx->ctxid = ret << 4;
>> +	ctx->ctxid = ret << FASTRPC_CTXID_POS;
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kref_init(&ctx->refcount);
>> @@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	if (len < sizeof(*rsp))
>>  		return -EINVAL;
>>  
>> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>> -- 
>> 2.34.1
>>


