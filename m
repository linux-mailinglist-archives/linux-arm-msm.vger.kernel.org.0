Return-Path: <linux-arm-msm+bounces-87354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A526CF16E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 23:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B44A8300D418
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 22:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2719626D4F9;
	Sun,  4 Jan 2026 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqKYHZop";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvpgCoZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC3143C61
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jan 2026 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767566943; cv=none; b=IUq7JG5BdeP9fi+CEJo+6/57rwpEn7zWu9pvjezSU3Jau52EJ00asri526CtFnDDRj91ib6QY18Knl8/80tlfIryd2urq4YhSgQFg5huEOR486YHGSaVVcgeqYfJTTfxakhyU7IVWtrzMCJWMEOuAMdqI9ZIp3v2uEla78tHA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767566943; c=relaxed/simple;
	bh=zE1vpm2UBtKXFSIWtO3EvHyFceAauG46kIibQY7dsZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=B+2PIfbCuk5zMzbkPCJw79niq0ZxgBpd/RMM3Gn9SJ6PmBtUL+4qdFmSDtzW5+Mly+MYnlTY371uJphXqSIsqI++PS6XQXMEKpdMNLYEc2ZxYm9RavBJ0+N8XbS6yvEqJVH0KOdTti8TpzqokWzhyXVBBud/pWa9mFSP/QaK9Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqKYHZop; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvpgCoZl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Mi35b3629275
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Jan 2026 22:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LaEu4i9Ss5ICFhfsy7EyyVcKTEq3KRBwxvKW89uDbsE=; b=pqKYHZopAFFSui1V
	d/GjmjbUoHlVsx3bpB0SZAHecUCxJLcfQUM0S7fvcbo5KVoctqOydCxwgiKYywau
	UIVAS/SagJvSYnz+qusAqjlOzP4WgviHdw7La58oznUsnmxsufE+9diMjFZ0CWSK
	64nLa1/CMdioSBTDVpYYYHr9XASdk9iGpTdLaa2+S1OEBmQLkxO/rwMc9LAAo/PL
	nZkskzbaINViR4DoEtra3rIhjuOdXvnp+P8kkAaVgjCzY5UfW5sYrUwgzLznBt9H
	S6WjeKETfhyMgmUPEwEPDisXU6j36eM1pZuQcry88h46A6rpR1sHLw7U9+5M4rWk
	+ploEQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beu6t2jph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 22:48:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso14274112b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 14:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767566938; x=1768171738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LaEu4i9Ss5ICFhfsy7EyyVcKTEq3KRBwxvKW89uDbsE=;
        b=cvpgCoZliYfdHgwRkAl8Y9CClZ4GO4gwUGnqnOxhDhxLyFIWgm0SZhhlRGT2KO1oOW
         gTg604pOpKdav76FNTcYTR8gPG1DzN9tosUgU1MJpIvDH+Kdfhj7zQYKURR6I3LjKYnq
         uAWZaXWO9Uomnu0ndl0yd7m0Le6b7b1QVxoIeXzQ1f4NIlV0lAfJ1crZ77FA+MJasRvD
         cFMHVA7Yzv4s+kwlT70GrL8Hr2zOwy4ALmg0aSYr8q8Dvav71QWXas8sDJ7w8kyvIzVg
         rMWrOHZQgQK19iJR1PF+Ty7XKwttvjvcrRpUa6pkBy81i72dSaOgx84AcxQxAAhseL25
         iJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767566938; x=1768171738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LaEu4i9Ss5ICFhfsy7EyyVcKTEq3KRBwxvKW89uDbsE=;
        b=DnuRe/u+PY3rc5UGSYmaQhPWiLNr/6ruo7ySNWFik5+zTqS3ZF9yFnWHWmMw0FcAMs
         SR3xz77NdMyvQeVUKzQgizIi0qny4vUh/g9hErbLBjb3CwNfYfoQSYjXtE6g1lAhblrJ
         f60ATfQYxgOgatth8wGfZnGT99UUaZKyi0cxDdK59P9HEVk6aJcGrXf7qfK/Rr5zjsH9
         P4konaPFPC+YpUB0QhgHC4R2ThAVQ2VzmPG0lfo2nvJl5ByKxxINodfj4rYTW5rxf9jv
         IB75fWiN8iQMSrFTjZ6AVRZuYKh1JbzHZ1nDS2P+lGcDFI2DgGbARa+rXaaJBXqU2BFm
         CvNg==
X-Forwarded-Encrypted: i=1; AJvYcCXGM0uUjbdgG4tNno5yKfOPUPpAdIlLX1rRvwiEBcg8bvg+on68pmdQ7rPi9j5NxgL2JFom72/JVvbly8nN@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDJPbHBO35Qmwj9l7zZEY0v+OkOInefqkKnufGzUyCJ6kvItR
	b1O2iGxJ2QghKcLVfYfttMCbj4e2Z/LcKZPxlRG+QC9Ej1dCzOxQ6zL83k1ui8whEAQ3ioATbE1
	ww2PcUkxI7vL14niIfImorTYLE0u/zN3Rr/KeBZcX7c4IBSq8Se3T4I0kbvCrWY5o1IU=
X-Gm-Gg: AY/fxX5f1CRlDeYRMLnMQAXB4h3WJEFM+PLdOVsgkAbBKAW9ImWlVjwMNPslkmVeiqr
	bNoKDrMWMoluNuQezdMDBDKUK925kyQtg8hV14v65ZazjzNczb8Xt7kPNM9ixYyDDnMZaEFXYdz
	RYFnLDhB4bIehWiT/JHxIvxljzGsjNmKXsVyHFIqr3L/S2/ssJQzGE7RQwDhWpdwY3zqQ1mZbVW
	/3H2PiFqWz2wTM54YXtGyDa+qPJz6VzJk6r7RLBmz96LRfMItYTSgunPgL4OYXYe1Dk9ZXNO0xn
	M9+qUFFfAzixmcBeHd0Y9vJ96QqwVUsl1lxW1afvvgdUHqC6ZV0vWcTLA6p9ICMzkuUQUHzgZV5
	fuR+3tTsm54vewROGH1y9zMb9LH9Kg36JCooquHBKr/JHEEd74d6ZYeql3mrRhNpKyo7ybL6Ry4
	TNlWCZhxk=
X-Received: by 2002:a05:6a00:a885:b0:7f7:532a:e44b with SMTP id d2e1a72fcca58-7ff65f78a13mr39009057b3a.41.1767566938302;
        Sun, 04 Jan 2026 14:48:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt476BmHGHKB7jNiFCnddknZmEegIAAcs50j2xzI/2wAdhXcWoaTsug++HzAXl9e3RTethqg==
X-Received: by 2002:a05:6a00:a885:b0:7f7:532a:e44b with SMTP id d2e1a72fcca58-7ff65f78a13mr39009049b3a.41.1767566937789;
        Sun, 04 Jan 2026 14:48:57 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f300sm46136305b3a.54.2026.01.04.14.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 14:48:57 -0800 (PST)
Message-ID: <d840d693-b23d-46e2-8996-b59b5e556cf6@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:48:53 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tee: qcomtee: mem: Fix confusing cleanup.h syntax
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251208020844.5310-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20251208020844.5310-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDIwOSBTYWx0ZWRfX5HF6yLxj/yJA
 wr8hsF5O8ppD52hI27Qg7y9UQZqxsRNrEm5ROh1RF5Y2qVX74VsYXmTYlCohGAG5Xs+moTFa+tq
 HrY+1gG7JKD+pd+IZ3xWzWSkrfWfAzUlhB59lh2gaXDbvaEKdcg5Cma8tKWl/57M0KvM9hrQjk3
 NcVF6j6JRh903EoGHRfIC1MVTKXIQqmA/uMx9QRn+ygf4sRp1PC6fEJWrCjHJFKjYnh0PNiEnUx
 LylrcVQ4FmDHUyi8UxZ/R9NQ66X5izxU/Sug+guvJz15wi7nuXb8WPY5YrR77PVI0Es5UkU7xei
 be9VsC0rElIh+EI18j44XKwY8P21zls8QmNnNLhh+v9dmhgY5NLIeoWJ+Trc1Ltmo6ByZ1xFczj
 ceprlMxpRxzucMO//VYGEw2+dz1O5lchd9UeHnUcCZvYLq50EtclIFExyq+DslE972aAqrgsfn1
 Z23/PKm9y6mPIRb4BPQ==
X-Authority-Analysis: v=2.4 cv=HLbO14tv c=1 sm=1 tr=0 ts=695aee5b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FIGAOsSgX-vrdh4HXBUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: VJ7EevoB3ggjVIi44Lh1F2x7DUNBksRO
X-Proofpoint-ORIG-GUID: VJ7EevoB3ggjVIi44Lh1F2x7DUNBksRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
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
>  drivers/tee/qcomtee/mem_obj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/mem_obj.c b/drivers/tee/qcomtee/mem_obj.c
> index 228a3e30a31b..a16f8fc39b8d 100644
> --- a/drivers/tee/qcomtee/mem_obj.c
> +++ b/drivers/tee/qcomtee/mem_obj.c
> @@ -88,11 +88,11 @@ int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
>  				   struct tee_param *param,
>  				   struct tee_context *ctx)
>  {
> -	struct qcomtee_mem_object *mem_object __free(kfree) = NULL;
>  	struct tee_shm *shm;
>  	int err;
>  
> -	mem_object = kzalloc(sizeof(*mem_object), GFP_KERNEL);
> +	struct qcomtee_mem_object *mem_object __free(kfree) = kzalloc(sizeof(*mem_object),
> +								      GFP_KERNEL);
>  	if (!mem_object)
>  		return -ENOMEM;
>  

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir


