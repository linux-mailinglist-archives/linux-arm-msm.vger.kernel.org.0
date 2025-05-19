Return-Path: <linux-arm-msm+bounces-58447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246AABBCD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BEDE3ACE56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C902B2777F3;
	Mon, 19 May 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWUxnsF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A1927586D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654882; cv=none; b=fVaI/nBB0j9FEoze69FxqNAXre572Q1QvGIZ9f8MMggo4O9mI+/Me4Oz/7d/nh1odDr4X6YCalt6Ng5O6IJmQ3YZQmlnhGkq6OA4ZWh/iNOU9t+WUhGNTz0AG7WVJ+eAdnYhVolRMqVm/GORJG8niN1DrXglyAezUahNFKTBeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654882; c=relaxed/simple;
	bh=xIcCJSD2qx+cvFSaWeE7vlLVHUJ4S6ONQw9rX4OOUIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usHYAui4g1RFr7txpcbVmcZYvD7Cn7QbRGbzi5v3FdjJvH1xUQzDMdlbHMCYypPYu/cFolZ60MBevPr25Ye4YAbsM77mBgghOa18cxobJjCU+8KcUj0CyJABfeV1B1ZDJokUjbUYph0ZwXzI+EBSQGYewmkZgaWpJRHL8Fb5xTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWUxnsF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dQrx002040
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NH6zss8ksLhBIkZZCpgHGxMvB4Tdn63he1bkhLEuAY=; b=KWUxnsF0NXlqW5n9
	LwwPJB0GKGHbjrHLcyNVlO+rfxncJCyr6RKTbmOWZNqYWGMUsicR25DR2kjrTIlH
	N6dBo9g0GcI03d9NVR5NH/pBtucXr+DEvlBqW7YZoaWBOIza9/UZE7VqmQkq3U2W
	NlNJOlnDnrbKDSU92vQNkWl7gcd1hOxSzNSIGca8ZdGM89QHcdY9+4bn7sccxjtz
	BmoO2ni1NjHi0Nn2Sy5ezwFLUEenH8zV2PEUhZmd1THCjRfzHTM051eliZUgK0+d
	ERNR9ZOQp7CtcscRzBDA7JTP9YlMchOjWiLckCxvGe/8ahyobXJhq/D8tWF/u/uT
	z3oUtw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atghjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:41:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8b2f0ab27so48410276d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 04:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654878; x=1748259678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NH6zss8ksLhBIkZZCpgHGxMvB4Tdn63he1bkhLEuAY=;
        b=JTOw2N4jLq5XD4c4xpxXuBVmUeosQ1j4VcptWv3Wz1xnVTCToXl/yC1eTfQmgRTfiI
         A/fArXivvFz1CQTPihZ+RWqQcD+4yVEN3Kuamv0S/Pn5Z7N9uqZw8khRkgLoibe9+uL6
         Y1Kks6g1rg5t1CxaGCtcnkjzt8zX62IxfiGRDKSsq08sAZurQkdnNN2f+y/cs0aplN+b
         mSC1NS+UHAYZBMtoixPY+8M/JU72YnI0Oj31jdGi7mLZju+QZG1GYfkAc5LZq8flK/wr
         Mwhok81k78GOAupRIyVoMDSbNcBRNPmKUC6FlBXvigmxKjcfoQOOhQsXNQsxi+tUGSq0
         rIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqo3aEiF90+2123/iuHu1DITEgtgtfa4yDPwFDjJGFg9P7YA9qirmAoj8dmFNYGRo9qIkDNJ391zclrK37@vger.kernel.org
X-Gm-Message-State: AOJu0YyjG35GJ6Qxj9ReowOu26H1rxq4CLirWD8jiN2Ymz7XxbUQvyr2
	nmly1ikZFiuwdbupML8uBezaRfnDadl1TudMyhB/CMygj86Av+FJ2Alo/fw7gDWSgjaIbs5O9lu
	iBPEH18kz1qpke9HpBNFtnDBb+1jG/F4Rn7URAcDWbMZnrZY4HiB331t8RQ9EBSQL6Q8l
X-Gm-Gg: ASbGnct5WnxIyuTKGtVS5IFnH4M8axufT/q5L7gqLqIkWrYy34FUwQ43TL9fHvcicl0
	OVUOe06b6CQHGUmdV84XNzqG2K2tHB6+lb9YK4hFRYbM8H1XiM+Zq/44fvsSGbUPjt94kReGK6w
	Il4NZ4Z5u3Z9xZGc1U1a5nvWCqzqkoW0ZL9iEQsBpW9vU2ooAGFLytckawyt4u0Jdt3YklE+tbb
	jbo+0jpCHGmzVt71eYTC8faDQRHlsfZsr8iHQ6V2gsQMuWkpgPeKyD9PS/3b5qWoPJKqvDH7Lh8
	Zi0dx5UEhBnhmXsxkDlqeN8s5MmFCSC5rNyqfQ==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id 6a1803df08f44-6f8c23c8530mr167707426d6.7.1747654878364;
        Mon, 19 May 2025 04:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKetVEUOMOD7ijejFtThdTa2+lxn4IofykDpJ3wdGmzgV7qd681WbcnWRt9DJzKQiimfHKLQ==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id 6a1803df08f44-6f8c23c8530mr167706806d6.7.1747654877764;
        Mon, 19 May 2025 04:41:17 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442ffaa75cfsm73888675e9.1.2025.05.19.04.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 04:41:17 -0700 (PDT)
Message-ID: <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Date: Mon, 19 May 2025 12:41:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b18df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uVJRloqESzKIWsLaVeAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 6ZWYFHPqJInyHLvTHUAF7aCsxKt0Qu3c
X-Proofpoint-GUID: 6ZWYFHPqJInyHLvTHUAF7aCsxKt0Qu3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwOSBTYWx0ZWRfX4OPikCQZYAWJ
 xySNjSs4VJ/N0ubWXaJ93s99G+JhkkhLp0+zD1WIczV9NA9c6wKMNfwetfuW3uywJyjStJrU7W6
 B8Of2lIasyzM6fyXBEvrrFYEXkqn5Je+luY44POKQHasY4bzNNjDFZR/bYstFDu2VeiQzmydrpJ
 VAwxd8G2C7cfdnGQWWGTGfKGJvJ8bGeSoEGSDck8u+Vau4JQzQNJs9a/T8fBmxI0PsOOJKo9tD8
 Y14NjIj8H7BFhAXEHa1DqMT+HlZRv80xYAODz5n6wJuHZGCp2euzY2t3XK2c751lea2Xj1khulu
 j1i91816/PVR8q6DTHXC+oOpZiWwkiPpCIaqV+oZLMAJOhOmneVq8KVapVWR8YPjV8HJQIZ5Tu/
 MwgNy6wUYWw3z+5talo7aLfjlr12gw/q2sGSL5wqlKQVP0PKUqw5F6z8iteWjthWRvVr8XPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190109

On 5/13/25 05:28, Ekansh Gupta wrote:
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. Set the number
> of pages to one to ensure that the initially allocated memory is
> correctly added to the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4e38b5e5e6c..b629e24f00bc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> +	inbuf.client_id = fl->client_id;
> +	inbuf.namelen = init.namelen;

inbuf is not used till the invoke call, why are we moving these two
lines here?

> +	inbuf.pageslen = 0;



>  	if (!fl->cctx->audio_init_mem) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&buf);
> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>  			fl->cctx->audio_init_mem = true;
> +			inbuf.pageslen = 1;
>  		}
>  	}
>  
> -	inbuf.client_id = fl->client_id;
> -	inbuf.namelen = init.namelen;
> -	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
>  
>  	args[0].ptr = (u64)(uintptr_t)&inbuf;


