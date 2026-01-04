Return-Path: <linux-arm-msm+bounces-87353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D45CF16D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 23:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4791C300E140
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 22:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8884A31987B;
	Sun,  4 Jan 2026 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtF5udo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShcFKGzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758C35979
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jan 2026 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767566568; cv=none; b=loG1Ew68kxyUdC8p/VlD6grkI/3teyCth4gz4+3q/EFJBbZ6Baw1u/334In+fH8tT4DVF0r9yLy43LFg3sPt2wlJ70bX+xJrpsFhFz0YsWintBxOOwiyployFVp3zOIxdKeM7oPaOhVEQUZjFHR6z9063ARcvKbswMLHtk8LcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767566568; c=relaxed/simple;
	bh=Z766a5eKhtLpv6IfPQN7+0qKX1TYy4S4ZuAf+IF+n78=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cPVFx02OKb63mjwFj7cFUSZ4TTd9Ze7LP3/a94jhIekSB48UdK7xa77DHUU6T9XvKJ0VQdmagB5pLrv0QVkkje+bIn8pDIC8r6vUlaRrtlz2zGvDBqUEf6gNE9NVmIWtIkVv1Ycxl7nlRTbMucwgp20ezYqBaLBWHdIHnQZxDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtF5udo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShcFKGzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MGeKF3798532
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Jan 2026 22:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/7vNr+DsrMEaDFspG2Z8LOHW88kZTo5Sbi3yhf6BjA=; b=jtF5udo2icRVijyB
	loIP/l7ROdQFZsLu6mrl5mS4kr55HTiJZ0VqWrVCWo8eaT4ONlymGWZTKqhdodIQ
	kFhbilShCgKz8zt/ViPGmnczpzJZ/NI0X/1Yx0AwQ1BQ5GR7qqwY3sKGZXIJDKg0
	HEPNcpupjK80eTD1BPvTCoBH0ug7mtqgkBzmKAM//r2xAROjoBtHTGvZ/Wd7Catx
	YXY+4fhuTjmzhRZMhzg8uelXlCT5l4+lbQD/XdLE7q4jTDSd7TJOQ4tUGYNlv8L0
	1G4/YrJWXz3wSj7GSDs8iUvN96ogLVbO5fvIDQt0h2C5ontNkbaMc+xXY8pg4QRA
	RovmWw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0g2k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 22:42:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so26201989b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 14:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767566563; x=1768171363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O/7vNr+DsrMEaDFspG2Z8LOHW88kZTo5Sbi3yhf6BjA=;
        b=ShcFKGzGrCqMjono6XBUcwcMUYIoAhnA0qqyFLJc/x2LZQKIJUOur1+UI2gTMbN8X+
         Uwl2WXyBUFXWZVJ2wWREG19eFs3AJU6Lp7xNfCaHPS7w86NZXsvmMzVEn95OXiF0CeLY
         MO/LAMUx2sRqUgBI6l5pW7Sr6dBERcUJqj9ICfJW28J3VOOO2Xv4+nQM96tHNrMt+TWC
         MBZGVT2CS/aECdS4u/7pNeaImw6L3Xi+lnmeeR/Whq4GeWHyiQUPLcHvQoKFA+AWYmAX
         BpHZbg+7QO6J4N4OnIJNvdG/H63Qh1z3OHizUZLK+hYsTV/C9zSxNsA1JhwWBOLGeWSF
         EAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767566563; x=1768171363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/7vNr+DsrMEaDFspG2Z8LOHW88kZTo5Sbi3yhf6BjA=;
        b=IHMeXm9VPsth7ic69DOudBhNRGmazmhvNd4UlWG8U5HMqrzke3tnyY948CPIVqACTr
         AdCwToFyhzVoPaNQl7maB0TjZGtXIz/O/ioJTkF3LfreH0AQeMGk8QpixC/ITD6Yqnz4
         mKwM81X7vp4Q7bPyQVBUFBRxUiKXtKfvh/+DBVZPgr2Cq/9owwvuPf26Uxk8lpWe+jEz
         GCWWKfb6aakiDWToC367NLOj/h//yxd1pPJHRqeneZJwGdIFTHlM6GpgAkP7Woct2mCS
         v13JxoCQJjtsnQLZ4RMvoNL01JxO/CaZgvQ1B0p3/7PFp1i2hAnhu1OXRdxSI9s/laDC
         rPbw==
X-Forwarded-Encrypted: i=1; AJvYcCWLIKk2DvG09hdutndhLAEUDGbP6bZXOSZIfVlU0n6P1+mEFTqc2+f1HJ8HeO3BptMRKsU06bb1X44fyyR1@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+WzZgYGJ9pyslwb11GZhRYkmsITYUYPVsUnaAHg5OZ70QE6S
	n/rR/LNvcr6ZFwCzjnEvJttE4lx88D/nKIuDMzL3ozEyjIF+UZk32rnNIil3WOpni9u5spevDrY
	ipMrqLdsGY4VgD0TYbnrWH+m8svY63GAUs59NNNoJtmryHHTp7Roq+qGfMiu8FbmaGLc=
X-Gm-Gg: AY/fxX4R4XfohDdxgS4eI8hrkrDJTFn5iq3TIg/CUCXOvsUpR+lLoDl6RXnOw5VE6Mv
	mRB9va7yQ4KxBGmcTdSrhm26+q0HRuuaCGPrA5C2y+1aWE9XQaPGCPdGY95gIX9sAaioagj9sCX
	7o9HfXXkY/xmO1Wf5SquWgNnpdTDTwAM6JCEUxg5DBAM5x02N7SJquPkCyymW1q+L3R+CMhWnnP
	hkS9bp0zGPzHQIwQLaiJWoJc+cg1qkgsn+kTrR7/DqIee+WxX3pc6V5+YAMP3F5t4q0XJqDuJ0J
	FnoH5X+P2hXA7FpgNgrsv2jczMWjplW825qqcBZLNoXZ3PXkg1hV7oM4rR2uj6UsQ6jeccAeo6Z
	d6ot7ptt9zxJLURB5PG2v18zEUpZkzauzv5y51cCRczrfTVq2q9bu6EYxYRoRClQg8W7X+pPLse
	3CZPk+QTk=
X-Received: by 2002:a05:6a00:414b:b0:7e8:4471:ae5a with SMTP id d2e1a72fcca58-7ff67456b8fmr45161605b3a.38.1767566563089;
        Sun, 04 Jan 2026 14:42:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDuO73OCc1uAmvVfcN/wqa6d0iKBoYARuBWGAYA0w4rRlXhl21neol3T/X6jIAjYp7WFJBEQ==
X-Received: by 2002:a05:6a00:414b:b0:7e8:4471:ae5a with SMTP id d2e1a72fcca58-7ff67456b8fmr45161592b3a.38.1767566562587;
        Sun, 04 Jan 2026 14:42:42 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b22536esm45620684b3a.23.2026.01.04.14.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 14:42:42 -0800 (PST)
Message-ID: <ebaf9e48-07c6-4b00-b773-312e0c9a8e21@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:42:37 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695aece4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=f4zK_zY1VO43RE-C1HAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDIwOCBTYWx0ZWRfX3sBgnURp7NRC
 r8+tBfjzEqSvB9evC+CuBXWpRcXSxjuZsKkzAKNxpJbC+PA7uHBVDMFYbt7OTu+qp5rLbr9CAGl
 w2O9QIrdiS4vksFDqluzO5UDgJWQBBMiwqEDsQLqkt2/b/qLbPsOP7jjVfwX8YNlj8zEk/UUh1o
 5j7QPOMfqfwYtQy5dyjLmTrK+WG0yaIT36nz2DMJj2DtreQgQLdMNANzbNiCI67oNNWLqOgMG6T
 Gf1JPCoHFpCVT1aJlcrYOc446s7QLb9v0iiBkVD4L+oUUNPC8oNkgWfX+tEQBE0rODF2kZeEo3X
 hoTx7lU9gxMK9LZne0jEhx2tvMC2rzr3OOV0ZWojQt81JxODsjhAVNHizoMw5zwXE+Z3hP6BTSG
 DRqC1lc33TYMZxf8Vx9L3KUyrEyi1jzBKWwHYjIKYbdCcAlxX5IV3e0wNX3k5yUOseB+bNJ6AzB
 VtMw2Qp3l/LQKVkFvnA==
X-Proofpoint-GUID: tCVv3FqlRBiYwrGKHYC9_t-plEN5rSQC
X-Proofpoint-ORIG-GUID: tCVv3FqlRBiYwrGKHYC9_t-plEN5rSQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040208


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
>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir

> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 65f9140d4e1f..8f8830f0df26 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  				 struct tee_ioctl_object_invoke_arg *arg,
>  				 struct tee_param *params)
>  {
> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>  	struct qcomtee_context_data *ctxdata = ctx->data;
> -	struct qcomtee_arg *u __free(kfree) = NULL;
>  	struct qcomtee_object *object;
>  	int i, ret, result;
>  
> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  	}
>  
>  	/* Otherwise, invoke a QTEE object: */
> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> +		qcomtee_object_invoke_ctx_alloc(ctx);
>  	if (!oic)
>  		return -ENOMEM;
>  
>  	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
> -	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
> +	struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
> +						      GFP_KERNEL);
>  	if (!u)
>  		return -ENOMEM;
>  
> @@ -562,9 +562,8 @@ static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
>  
>  static int qcomtee_open(struct tee_context *ctx)
>  {
> -	struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
> -
> -	ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
> +	struct qcomtee_context_data *ctxdata __free(kfree) = kzalloc(sizeof(*ctxdata),
> +								     GFP_KERNEL);
>  	if (!ctxdata)
>  		return -ENOMEM;
>  
> @@ -645,12 +644,12 @@ static void qcomtee_get_version(struct tee_device *teedev,
>  static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  					  u32 *version)
>  {
> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>  	struct qcomtee_object *client_env, *service;
>  	struct qcomtee_arg u[3] = { 0 };
>  	int result;
>  
> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> +		qcomtee_object_invoke_ctx_alloc(ctx);
>  	if (!oic)
>  		return;
>  


