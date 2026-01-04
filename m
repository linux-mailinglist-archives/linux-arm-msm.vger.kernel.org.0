Return-Path: <linux-arm-msm+bounces-87355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91600CF16EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 23:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C55300C6DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 22:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E111BCA1C;
	Sun,  4 Jan 2026 22:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kD+D91cN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlRkWLpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417D252F88
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jan 2026 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567031; cv=none; b=UYjle9HeapczRjfryacGOcP3lmka23q86Zbh9+W1941G2cjRdUtQTMa9QrTPuhdOn+nEzZjPdsg44jYlZ1TvNXgrzb79Pcuv5RSDOAlfbczLdhOYao89LxUtmdFNwzylqP3Kb8i4feXh9xG0Bu9vpB9TBW4x+sJ0iYWh2SL0W28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567031; c=relaxed/simple;
	bh=BUnBtuxk0eww1XMZ3mAG6YmWxZYPpuxsb7QXsefg4AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VFh95orMEhf1/d0QPVudY6oUlYz9iUEF9nVrpEDA6/W/5ofkdIzVRq1rtj9+bqn0IkqTmxC4SPi8HZ6YE91Cv5YF21tFYB8NuhF2/086ZGfHniakCTfb1rDIsWG6/sccoQaNN/PdCD++B5wlfMANO9thnEhpAPvclYTpa3XqJZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kD+D91cN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlRkWLpK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MZOWh2732992
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Jan 2026 22:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4OECOH/li4HpE49npbmoa6u/pIY/YVgufugJfqG2z8=; b=kD+D91cN7PlcIJIv
	C57BwI35lnkMtfZW5hRPub/pdbtRHDaIcQRMkjpVYBb7/w9orfJXQJ1H+hq8i6lg
	USbD7EODB7of1qHzJJomOw2wmYmvNh4T+CU92tVqIN9s+1xJCifXKixiFWMaWkKB
	uMV8mRu0etU+tKSIwkz2wg8oBssJN2sRWMrfl37/dKjnjYk7iicSlxjdAtMWl1pM
	15Wgo6kNo9+tTmCaKvJBBZQman92I5ZOMDgJ6IeFYojBKX+H35RPoHQhOAn+W/fe
	ZsdeFd2J208zlb9HJzSYHjHSjOOCraXTd/EeYy5SHipacnONlH4Mo+jntGOFuZQx
	1G7fAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4berfnat5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 22:50:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f177f4d02so318797715ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767567028; x=1768171828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4OECOH/li4HpE49npbmoa6u/pIY/YVgufugJfqG2z8=;
        b=BlRkWLpKF0qP8um2xdbrLzml4oimg6vIP6DDhGqbu5MkEGPxbYHvDLdEQgO4a59RIt
         l5k3bHadPn9hhsEZr5QrFrwGKI9grSk01L31hpkSNNDxxFeNp69LEmK1t0kFJTqSrhzX
         Uifa1uE8mYNL7qOFIw7kI1C5JKgdlhd+NVsZhVpAQxPHn+RB7hk5GcI8FxJHF6JVWN4Z
         7bjUivB77klmzJqD4d2N6EDikkQPSQlbIzLVAJXJY8qNTMW4lwEYEts4rs1mG81Jjzj3
         xCxWka6P9KXubrH1oWY+McR1NQZWgDFrvXQ1OUpra+A0seKD5zUigsoseeaqzRfG/DYz
         Ly/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567028; x=1768171828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4OECOH/li4HpE49npbmoa6u/pIY/YVgufugJfqG2z8=;
        b=Q3VdBDvn6sO0vOlu+RU9ac8BMBq7a0R0CyzcXTFkq2lnaYZiP6Ej+Jj393gAb4AYoe
         biKgq5+Msg1XFw64kzPYx47EuA2mDhzNvMSY544MeBNs9aG6Es7nemZ4tuzvMxF3W53S
         kTRL888nJ7cwq0o7iltUMfiaY3dVub9Myi1K/5tc5BBRQnUaONqlbmaWjqLeD6ZXIBzT
         m88oMA/Q6Rd7RSgndiRuPVjcq/ofLK5FUXhwe4Y/F4p5RRbk+4jEr9+H/gGhCgASrwl6
         RYVr6ykxs20Tk7lqBvwUMreOSYUDBVp5bNJEx+4eCGXLd590Zx/+scp1uZYtUpyQA0t6
         NOrw==
X-Forwarded-Encrypted: i=1; AJvYcCUkCK7Itke80VXLSE0PYucY7I9x321fTWjH8Nzfz+kaelIRoPMn4ZJKxF73DadAus2E3K/KJVQtlN6Ouhyj@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLB22+reEDBdASAntrkC7icelpaVPaey58E67IgRyovDsGCQb
	ojjh5GZENjr1dGYE/Pw6dQwWwno1OfQ3NmcdfwxeBrxqHwgMMyz7bkR4+2D8TlvXO5s6Spwkpne
	gHlcb+3xKYJ0aqw6kYm4TFREwUpvC3RTjygqEWzsCnv16WY1tBkrTihfry2AIhGyqE2E=
X-Gm-Gg: AY/fxX4LIaS/hrNYbMzfeIIoJX9+T6XYfNmD66SXuetBvkIWLHKOW5YCY1GSzC4A0IU
	JVn+Lyj2wLmG3kBoT41I5U4jP8TzUjijaTY1CDtO8iTbXjUaGF1JS8a6hQlIWrWVz0W698lLCIg
	L5BnCthdofUuXYPYT7wFL8medJAWgAgx+DmkhPKeZn00CTq0D/PifhvJXr6QSJNZX+yqCK2n+mV
	7jhF78gK93kc7wOzGbOqcFDrLOIqsVXv/59BXJ+yes/80usBdbO55/RXUI+zp4QPfF8d4IOiBAL
	KW+asbshIf1t1AxOl55u+FyFJwTysA2FY4CDTHERxzutUvUu9FFeOQxhTBsXvdALA3Z06Y87Prd
	yjZcHDMXZ3PAiBykJaG4SARpIOLA+QSvsupQf2gvUG3bA9iIRMf+1PffLBOBGTwC/F458L3E/6o
	JTdxZaXsI=
X-Received: by 2002:a17:903:41cd:b0:298:55c8:eb8d with SMTP id d9443c01a7336-2a2f272bd8fmr421732195ad.35.1767567028064;
        Sun, 04 Jan 2026 14:50:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSpjXMvZibipryUoqrlDqr7k2nu+DSzDZ8V71fOSDOZKY0FvdhnKHBf75BqgIzwl7VSPS6bQ==
X-Received: by 2002:a17:903:41cd:b0:298:55c8:eb8d with SMTP id d9443c01a7336-2a2f272bd8fmr421732095ad.35.1767567027574;
        Sun, 04 Jan 2026 14:50:27 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82762sm422934305ad.27.2026.01.04.14.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 14:50:27 -0800 (PST)
Message-ID: <eca4b7b7-d4de-4209-9965-4a8ce027caee@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:50:23 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tee: qcomtee: user: Fix confusing cleanup.h syntax
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251208020844.5310-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20251208020844.5310-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: obNLAiFjovBUUxGiBjGPQwcomwYykqxp
X-Proofpoint-ORIG-GUID: obNLAiFjovBUUxGiBjGPQwcomwYykqxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDIwOSBTYWx0ZWRfX8GNgkQB3rRTh
 xFkWxpyHDQsza64RfhO4EgDg1nTRoDilcljvh2it6rooSxdeXLzGPquwHfp5pHzVnZrY7UDPm4O
 QAofzNoUave4S5WoWUY4/pvcydjoLDFLdfSE47nSY/RCUSH29C5TIVYEwZehTJhPdVbEMd2NCh6
 ujpAN2H+wajDv3yqelWQt/WJxyw80wQ226MkyU+81c5SBTk/zxJ9CM9Zfrwg2IUxlVgS2ofwlLu
 vjFMCzPSKTtfrog+mYaihj+DtoNLGeeHwtMzfvXPxUdnO6bWpMbvi9BfLuKkll9P4DxOkjB6aFO
 +ee5tH0s8Qb+YcvWgUSnh+OlkVvKZsDQnicKStVpkXBCFQYm8DFVH+c36g29tcY4ts/KqEAlYh9
 TPGxLioiAFgsUSRd3QOagXAz6A+KHC33vHdS0EcJQs9Huj7BiG1LUEz0WHz7TQpnFFxYlvCJ96K
 q1Y9KPFhocjmFek5Iig==
X-Authority-Analysis: v=2.4 cv=GNkF0+NK c=1 sm=1 tr=0 ts=695aeeb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XSG46yrzQr2AIDBsqHYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040209



On 12/8/2025 1:08 PM, Krzysztof Kozlowski wrote:
> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:
> 
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem the
> recommendation is to always define and assign variables in one statement
> and not group variable definitions at the top of the function when
> __free() is used."
> 
> Code does not have a bug, but is less readable and uses discouraged
> coding practice, so fix that by moving declaration to the place of
> assignment.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/user_obj.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
> index 0139905f2684..6aa3aefd67f0 100644
> --- a/drivers/tee/qcomtee/user_obj.c
> +++ b/drivers/tee/qcomtee/user_obj.c
> @@ -228,10 +228,10 @@ static int qcomtee_user_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
>  {
>  	struct qcomtee_user_object *uo = to_qcomtee_user_object(object);
>  	struct qcomtee_context_data *ctxdata = uo->ctx->data;
> -	struct qcomtee_ureq *ureq __free(kfree) = NULL;
>  	int errno;
>  
> -	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
> +	struct qcomtee_ureq *ureq __free(kfree) = kzalloc(sizeof(*ureq),
> +							  GFP_KERNEL);
>  	if (!ureq)
>  		return -ENOMEM;
>  
> @@ -367,10 +367,10 @@ int qcomtee_user_param_to_object(struct qcomtee_object **object,
>  				 struct tee_param *param,
>  				 struct tee_context *ctx)
>  {
> -	struct qcomtee_user_object *user_object __free(kfree) = NULL;
>  	int err;
>  
> -	user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
> +	struct qcomtee_user_object *user_object __free(kfree) =
> +		kzalloc(sizeof(*user_object), GFP_KERNEL);
>  	if (!user_object)
>  		return -ENOMEM;
>  

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir


