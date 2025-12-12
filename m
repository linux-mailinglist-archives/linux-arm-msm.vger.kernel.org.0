Return-Path: <linux-arm-msm+bounces-85086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78248CB7839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D70A3011F83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4EB221FBA;
	Fri, 12 Dec 2025 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4LD12ps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GziJxYS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCE415B998
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 01:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501668; cv=none; b=dcK+qajKOI7Ze6/x9gLFQkDoOt+E813sfWTQ7F6sgaFzopHiSu8Kg43f3EUDAHvYYtN7OGtYaN8ce5WS9wzWs8gWFmRXDlYgpJT56FkVw2VmaSRV4X1kMWvDuOujNMeJaGV4cS/gIMlmpRyfhQ9x/q50WDE/GvCZS8GMtaoCEZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501668; c=relaxed/simple;
	bh=Zj4KWzcuPVXWcd7yrzODmHnEtjqPEnSa0AjQGBuGcXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgN223B2KhsnSJ44tbFGNti/EdTBVy/Hd/dtsJyRYGDdkiQ77D1GULtFW1QHVEdT1F7qZWftLIHQvU7hMq4UMfibFGFwx46c2AOwjPsIiwAxkHVn9u6rq9ChGtoHsxrpjFLCSoSSVJg/BJMD9DKoVhg4NI3h4nf05f5nQ5jfrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4LD12ps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GziJxYS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBKXcla2480212
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 01:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10ueGSyugo/WYPVzD3Q3Vaygr+j+IoUQX6LPatNlMzo=; b=K4LD12psoTKNY1/j
	ZhjxLb2ZiY8i4Ef+U2gYWbtdbBSL24AvFVqVOCY1ACLoI52YYJyj1vRidL5JPjJp
	UjBxHp/2CdJlDEgBGHYaZMrDUPRfEJ45DTNWaj0b/cSJRONb/SjoqxG/ildu8y5X
	AP+9oZr71QXUsuXt9sFvmlLHiwkCc0CNrmTDc82qmPlrfSD67TaxiZpYMJgCnYsH
	B3eY8OiuG2LJDRVFBZpNG5tY0zamhKW4lYC8y0+i7KPBkmQLfbnaC/wnMPpSy5my
	h0sUEDjMSGKNsGbSkC9SFpPwv2FSH4oxA9wAS4KF1jHSlTtgavnliwTsHX8efvtU
	/T7O4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b053j0k8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 01:07:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f8a2ba9eso11383895ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 17:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765501665; x=1766106465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=10ueGSyugo/WYPVzD3Q3Vaygr+j+IoUQX6LPatNlMzo=;
        b=GziJxYS/LVI+fY+3Ox4Y0gglydJJFEhiYPCXmbqJ0ic1h3JI4ctbU230bTDecKS1vM
         mUUsSXJKpSCTV8hs/paWgIiRNfIXrZx3WNEvI0d9lJ3t55VFzf7JAQQVQ3VeIR0oaR4X
         /L5+RyLdQtLbtWwiLUw7iNmYHqjDY7gjdsw1UpNMzxnfHaqLq3GeaCYn6QCddJ/fo4dA
         h9Z+v2jyIaJEufpWmb5bEd0dAgfFSr++wrGdj8RFyVUSj+WjB7z3gmGzZlEoTzTm7o0W
         vgDpzQKHFWsmYGj0ZMCoXhiDvv+DsEmqS8a5eMBv0N56d7UiCIjr/KlWWPYshepwVPmp
         0j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765501665; x=1766106465;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10ueGSyugo/WYPVzD3Q3Vaygr+j+IoUQX6LPatNlMzo=;
        b=BsWZel3o21Ik8Iy3AnjtJQ5GzJCVua2ftXsN+u4gvtAu8dAU+WwJzmHhR22Vf31ebp
         uRO48adM26PuT3/niVXBfQ7KJxpO+7UoOCISjzYlRLLZOzb/GAzRedym0295UMrj7FWp
         k83AeHRyT9STHcdL2j1iRn8FNPWjvcp+JvYAl5BZtTDorfKDoHuBuOa51vdxIT6D4J8e
         3Hcu67SNuYRdTT0KYIpKoNBL1j3mP5rFFrXpmE/BuLqXPniTF66AdxnhLOCF5Qu1+B0/
         8nIic1QcXoP6bZHuZz+xWYWIpbhN1iqMytjX03BZZkkMy7xx/nZPqyYPmA8MkUugCxWv
         ltjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHJnsPpNqZIkdjcuy+JQHEGnoZgj+8PQh3ag75LgWeQvpwA+y9eghV61L9bKLSKcxecc7Pmo6yD8SF4pKM@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwxTbYjNR8VW5MJ8gqkyUK00cdtBUdVQoGRfILol8342oPWkw
	nX3zM2cF8vlOYocavQIu8KgEfain3kq7V7Uh/JlKQlDxoVHF46Kv+ocaZx8tE/okFlxrVOYHmdP
	fP48pO1nRCXmtHJ7O9Yhmag5/JQbCb+Mnza0N1R/zj+r9j2AtPbuvZEvL7Mt3QPSCYM/o
X-Gm-Gg: AY/fxX4az+fyIRZiGLS0xAGlz5jvy7ZSvoIs3/HfOSD/jHFT7OpUjxwPJe14rap/nYr
	5RPrvlwBuOjnk0wmxsLBPoP+KUd4CjMRuT3cVXdZw7KzeMz1xhKwjkyhYf7xnA7q0EhEAlD6Hzm
	Qfotl3Or40Gd/xMN/lMQLjRVysnx24X8FbxFny0gky/fz0dlzw4kNIqm8X4SeSdfFCZI5xUFZPr
	zLsI0+41dktKOt0JKnvh2o6u1y0v29vNhmRJ79aZV/ulvYmsFDOVrWzUX8zdL+DgLPaZLQGjl3A
	Y1qsiqCVlzh67w+UY/HK+ZvkqZGopBhJxaB2fziq7qIL6hgI7l5CkeuEX/kabtHn2jt1AXLeWhf
	dFTHDR0ZcJGzkYdqe91YpU3RBMkJvW9xozAVK6DiNzQ0G7qxIH6kZ09sXpAphtYSkzp8=
X-Received: by 2002:a17:902:da47:b0:29f:13d2:1c67 with SMTP id d9443c01a7336-29f26d0d376mr1749915ad.16.1765501665197;
        Thu, 11 Dec 2025 17:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6HxE3bSHkAkVRNh5aCi/K05N4p4UDTA8EHhvxZgkMkg7jO0dlxCo8D1XzA0t0iHl5cid5wA==
X-Received: by 2002:a17:902:da47:b0:29f:13d2:1c67 with SMTP id d9443c01a7336-29f26d0d376mr1749655ad.16.1765501664666;
        Thu, 11 Dec 2025 17:07:44 -0800 (PST)
Received: from [10.200.7.150] (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ac2sm35606645ad.49.2025.12.11.17.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 17:07:44 -0800 (PST)
Message-ID: <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 02:07:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aTtn-x0hh18V7n7J@sumit-X1>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aTtn-x0hh18V7n7J@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9nkCAP+ c=1 sm=1 tr=0 ts=693b6ae1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=gC7H+NTNV8TiHuUi9Bl0tg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rtcvcfkpwUOWW_TkcukA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vD0bKGMOYs4xPoH2_PqyvN7luqzfewmo
X-Proofpoint-GUID: vD0bKGMOYs4xPoH2_PqyvN7luqzfewmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAwNyBTYWx0ZWRfXybCFbLaIA2Vp
 bScFIvCE4CpNG6/6DSzmXtMK7XXxZjy2tVdu1IqxX51m8e6fYjcMbVIZoUFFpGa8VNzNtTY9Bt3
 qiE/pSGyOlaYALdlEAUscEUH/0r8y3hSzkc8E9aHjJe4jRGTBYUKfFIAEdDbsyc1Mhl0g7NR8HJ
 RN827Z+jkmPkgZHGHvHD/iJmlei9DaAtrHax9ISChasGZRaAANqXattZ/d4qgdeYKg1KnKA7TG9
 Io5lDXRxN/LQB+cgejh4rDY41naGp4P5F+dJDWxD5pKM5c45YI6mGxeHSNLFgNqrpN2/lQakj/F
 /K9TX1O4P7lllnrVHuCjWVqYrhMtblBQRbJFZKWT/v5NGn8q5sXzCsC+257g8yhmm6jzsdxJkkj
 gEVOmkRSDjetk499YUvAJDGU2cRRWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120007

On 12/12/2025 01:55, Sumit Garg wrote:
> On Mon, Dec 08, 2025 at 03:08:45AM +0100, Krzysztof Kozlowski wrote:
>> Initializing automatic __free variables to NULL without need (e.g.
>> branches with different allocations), followed by actual allocation is
>> in contrary to explicit coding rules guiding cleanup.h:
>>
>> "Given that the "__free(...) = NULL" pattern for variables defined at
>> the top of the function poses this potential interdependency problem the
>> recommendation is to always define and assign variables in one statement
>> and not group variable definitions at the top of the function when
>> __free() is used."
>>
>> Code does not have a bug, but is less readable and uses discouraged
>> coding practice, so fix that by moving declaration to the place of
>> assignment.
> 
> Okay I see but..
> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index 65f9140d4e1f..8f8830f0df26 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  				 struct tee_ioctl_object_invoke_arg *arg,
>>  				 struct tee_param *params)
>>  {
>> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>>  	struct qcomtee_context_data *ctxdata = ctx->data;
>> -	struct qcomtee_arg *u __free(kfree) = NULL;
>>  	struct qcomtee_object *object;
>>  	int i, ret, result;
>>  
>> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  	}
>>  
>>  	/* Otherwise, invoke a QTEE object: */
>> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
>> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>> +		qcomtee_object_invoke_ctx_alloc(ctx);
>>  	if (!oic)
>>  		return -ENOMEM;
>>  
>>  	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
>> -	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
>> +	struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
>> +						      GFP_KERNEL);
> 
> ..this makes the code less readable with variable declarations floating

Which is intentional.

> within the function. I would rather favor to not use the cleanup.h construct
> but use explicit kfree() invocations instead like it's done in all other
> allocations in the TEE subsystem.

Sure, fair. I just don't get why introducing cleanup.h without actually
accepting its explicitly documented style...


Best regards,
Krzysztof

