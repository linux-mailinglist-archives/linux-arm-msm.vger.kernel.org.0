Return-Path: <linux-arm-msm+bounces-85282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C3CBFBF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA7253013ECA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679673101AD;
	Mon, 15 Dec 2025 20:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K62X/Rcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYLYzGd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE0D30C347
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765830602; cv=none; b=qUh+QrJxlukfnvh7jkT2uTyk6MFFL0miesfOREUSK6xI0Jx5e2wbsd9jl1xuwT+lRjl8v4QGHPkbLubIbk9xDiCSKqUuCYgxVDj3Y7wb//VcH0AVZpxvbuj+b1X3A5RdSYkuUq6479qo7gX5Tb+56D1qDNXCCbr5Vy7nUkO1YEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765830602; c=relaxed/simple;
	bh=K1V/aDVPmZ49vWBEzlhBTpD1ZpSOYG5im9ZC4Wuy26I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1K9Av/DIbHkVpCto8m/CQrcYkPKtQOucyG5B30lYhl9Yti/IGfeLiZIcC7SSgoFo4xJvfhYDmLw9tGisjmPhtFMWq+/sz6VdxbM8y0k0kBZq9ENVaSyuRwbqZCwId4tlns4Yfd7wZYB2pbN8RN5AoyYkZJrg8ME8JfPGelEbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K62X/Rcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYLYzGd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGiGHV1268546
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdHUrbzRU+2iOQL7jj1DnvC8e49pGzQ7IhirsARXhWA=; b=K62X/RcqXg48HTKd
	NfXkZJh6y8OXVD5fo15N5wGTcAiwLAmqk/cAdBhEv57UKaYTO5m7kOzoJxjOjrl/
	QLOKL0e684guMrdWApTkhXhskg80m6FEDSqYxOdJguMWq0iis9RPhoRhIjQwdyCZ
	D8OEmRX9AC4LhhFUSD9D4ELGQIGjGwrNM3m6dS+wsf7BXXy+IQQvZcuZY2lt/dNQ
	ytZOizpXmHZQI+DGHwgBZXb/ohZL+ckPLEWuU5JfVL+aXTgwFKaM3SQg11kFhkuF
	pBXqJ2sgJURn13TrS3PGVjpNq4Yhd3Esq2lBBtgbxdjIsU2V1Da/5fsme8umD540
	9pB01g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p46gjgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:29:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f4822f77so38585605ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765830598; x=1766435398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdHUrbzRU+2iOQL7jj1DnvC8e49pGzQ7IhirsARXhWA=;
        b=DYLYzGd84yBfv+WhqA3V8ivZyz5eYV5prPVdMp5ojkLa/q50RVYD2qBZ88Au3PlSx0
         TaYH8sBYezc4VQ1ccLDY3IklxyJCZeut/mWhVQDd3wO8IxU4Xr0iv8+DU/5cKCBKTwPo
         OSQF9PtpNPKZPBb86r12wo+ucDcPRAzYF8R0uwh7ZEAMTwf9McrnK7dK+AAjia8KYBhM
         DnxQWSrFBB8ep+DWHl+VkcLtn2xg7qWQe/R/BO0TgXqFN45ADAy01VHWy7hrmAMJR3iM
         XP0TbQBJTUmg5oZ8oo7QrryFM/E1u+CaD1gayFU5AwYhba0b2DBxeqISLWtLzsjGMCFd
         r/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765830598; x=1766435398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdHUrbzRU+2iOQL7jj1DnvC8e49pGzQ7IhirsARXhWA=;
        b=fInAwsuUmhwOxGjnjZdPxBuomFmyny6BzNe0f7Yf8g/UGs6uMp+ejFZI2/qEUUei/H
         YBH9aOeSSuLJSpTl48pjk0gyLX/soAmQRYR/5iLL8WFZ4JQVFCg7E5YTb6j8JJysSncn
         op030/7hB5CEKM2WC4goDdEly9BByqtfFqas/nrDPfeJazGtQvhjwRX4RkANDUJLB0aa
         wz+0IxkKFMtjV+ZD/DQjsb/hPJxLpRhUshYiuhShS6ZXrGNZKTZRIYV+wzyuSejoaXR7
         rVqKiBVOPVtGR5l600IUyxKKC7tNasdko5U6ZVGJhaU8aggCmQWYK15ymksmPXL2fIox
         0tug==
X-Forwarded-Encrypted: i=1; AJvYcCVMd+uIzlY8LDXrkCKvydA0ps3KiLvWPweSzmmLF72ylXWXRC62B4KbikT9iWXaKe1IsfTOYHR9HG2HNNlp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hrvvtxFspLB8tCFP4E6J7RHeHN0Ha0LBmUmmqAwYgPm9FsPx
	FvOuf5ewaX3ZH+aCalvAH8/bIlMcCMreW3C0m9G1s/DR3oM4SFxiEGpTfWnyocPS5IzZRsw7X8D
	Yn0Oc+00+cNd1VAiNvWFvsK2VzLVgHrNI1wMkTD839zPGt/IoQtMXh3tWDD2vRNCq1gE=
X-Gm-Gg: AY/fxX4E1DPrFCYp9Sv2rJVhVAJjrZN4DeqQIXMj/NfDxPZo7wPxDsbU4JlF81AVEtb
	2Z/m6LpMwf9rS2H6RShN0ZLaKuuPsje4ujQdJOUvO5TsKJYByDFSGf3e/Y4fQ5amRiL3iptU2PH
	NT/xw5Pio2iGJmXyZR5VYzG2GIjwtz1BVNi44VhLBP4L1ugYZr8H3Fzz/JJaEkf5SFHk+WtF7e9
	RVD9UWMHk/mMC3KPhSKDX222MBXt18sbkXEIoUFDLyYq+Ox1emCneYzMm5r7ra1qDb59eRjiTHC
	o0W5STlwzTUFJAZTmTOI0H0QfQeeKyIo8UNqCnirrokrpb9Npd337Kb4ScrnEmN48ecCwFTX7Kw
	P3hQtT/o/bgJk6AoBY+CjB5t1JYbX0AzxEvhry4O4mTxuAiAU8XeJhKqtEksOwlxwt/EqoAPA/D
	Q4/4EA95E=
X-Received: by 2002:a17:903:1446:b0:29f:1bf:642a with SMTP id d9443c01a7336-29f23de65aamr119690925ad.12.1765830598362;
        Mon, 15 Dec 2025 12:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbLjkylsmyRwrHSNZTaMSJ6bc9jwOTTSizTr9ct6fx53bTXcMlO0MTyK687LScueoET+tS2A==
X-Received: by 2002:a17:903:1446:b0:29f:1bf:642a with SMTP id d9443c01a7336-29f23de65aamr119690685ad.12.1765830597859;
        Mon, 15 Dec 2025 12:29:57 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a090863c87sm79771515ad.47.2025.12.15.12.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 12:29:57 -0800 (PST)
Message-ID: <7b074ee0-4f10-4fba-9680-3d87dcf766c1@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 07:29:52 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Sumit Garg <sumit.garg@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aTtn-x0hh18V7n7J@sumit-X1>
 <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>
 <aTtyR5J3AqXoE7to@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aTtyR5J3AqXoE7to@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O4KI9qVVUbOrqDJyKK4LwE-WKSiloChL
X-Proofpoint-GUID: O4KI9qVVUbOrqDJyKK4LwE-WKSiloChL
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69406fc7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DitlKc5lTLw6aypijOUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3NiBTYWx0ZWRfX8ROxa7SA4e7i
 buFI81TSyn5utB6C3QEOPRqyri8zPYICdF+1Ju7V+ItBsaAFL6cuwkFugRq4Z5JxMZtqazzmGv4
 peWp9ow+2H0HTTBeXHBuKmNdg9m15L/lrKh6bU2+eUz7AxCRxY9iqRCFvVyBFMRSamUAsAciOkC
 VZGmjJCf0FTFPYjjZqhhXySUX2jx2kMUa5i1y5yon/khx56AOZ9iwa/1p3M5RnyF2QIxfd/Kx6G
 KbuAUe+lZGFtGNXw3hMfEueALAKI83Lf1CLIwUBbbLFOotiA1iTCF/WlAPsAKe20uyG/IoS3baX
 9/KyjcO8stipRCNVc8IiDr8d2aYjd02AOMkSUg2ZkRt6Q3TZgnFE2ewwjvuOHthVyAZsg0fLtnI
 MCcRXAIdYpD4MXI0vt+YgAJCa2iiEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150176

Hi,

On 12/12/2025 12:39 PM, Sumit Garg wrote:
> On Fri, Dec 12, 2025 at 02:07:40AM +0100, Krzysztof Kozlowski wrote:
>> On 12/12/2025 01:55, Sumit Garg wrote:
>>> On Mon, Dec 08, 2025 at 03:08:45AM +0100, Krzysztof Kozlowski wrote:
>>>> Initializing automatic __free variables to NULL without need (e.g.
>>>> branches with different allocations), followed by actual allocation is
>>>> in contrary to explicit coding rules guiding cleanup.h:
>>>>
>>>> "Given that the "__free(...) = NULL" pattern for variables defined at
>>>> the top of the function poses this potential interdependency problem the
>>>> recommendation is to always define and assign variables in one statement
>>>> and not group variable definitions at the top of the function when
>>>> __free() is used."
>>>>
>>>> Code does not have a bug, but is less readable and uses discouraged
>>>> coding practice, so fix that by moving declaration to the place of
>>>> assignment.
>>>
>>> Okay I see but..
>>>
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
>>>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>>>> index 65f9140d4e1f..8f8830f0df26 100644
>>>> --- a/drivers/tee/qcomtee/call.c
>>>> +++ b/drivers/tee/qcomtee/call.c
>>>> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>  				 struct tee_ioctl_object_invoke_arg *arg,
>>>>  				 struct tee_param *params)
>>>>  {
>>>> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>>>>  	struct qcomtee_context_data *ctxdata = ctx->data;
>>>> -	struct qcomtee_arg *u __free(kfree) = NULL;
>>>>  	struct qcomtee_object *object;
>>>>  	int i, ret, result;
>>>>  
>>>> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>  	}
>>>>  
>>>>  	/* Otherwise, invoke a QTEE object: */
>>>> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
>>>> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>>>> +		qcomtee_object_invoke_ctx_alloc(ctx);
>>>>  	if (!oic)
>>>>  		return -ENOMEM;
>>>>  
>>>>  	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
>>>> -	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
>>>> +	struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
>>>> +						      GFP_KERNEL);
>>>
>>> ..this makes the code less readable with variable declarations floating
>>
>> Which is intentional.
>>
>>> within the function. I would rather favor to not use the cleanup.h construct
>>> but use explicit kfree() invocations instead like it's done in all other
>>> allocations in the TEE subsystem.
>>
>> Sure, fair. I just don't get why introducing cleanup.h without actually
>> accepting its explicitly documented style...
>>
> 
> TBH, it is likely overlooked during review of the QTEE driver. Having a
> builtin warning for the undesired syntax would help the reviewers here.
> 
> -Sumit

While the style may seem unusual -- as stated in cleanup.h, using cleanup helpers
makes the code more readable overall compared to relying on multiple goto statements.
Also, it’s not just about the "__free(...) = NULL" use cases -- there are locks
involved as well. Switching to direct free() would require reverting those locks,
since mixing cleanup helpers with manual cleanup is not acceptable.

If this behavior is explicitly documented in cleanup.h, there is no reason not
to use it as intended. I also support Krzysztof’s suggestion.

Best regards,
Amir


