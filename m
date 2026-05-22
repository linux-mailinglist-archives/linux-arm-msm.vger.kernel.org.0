Return-Path: <linux-arm-msm+bounces-109176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y9hqChH6D2qESAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:39:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B275AF94E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC7E1301B73B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB08368D4F;
	Fri, 22 May 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbLMOZDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEiStqlk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F7359A6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431948; cv=none; b=L8g7lN6eMbvExk8bBCHsY4tguESF5GfzgU9JuzVtp2MjVXXx61Mn11HDrTxc02btY3VQ5a1AY8eGaazDpw3r3yFHtrTd4hjlESgk+usv2y+UCQcuuf5WnRvGuVS/BeTed5pAIppJpA1uqte1fIloe+dw7gdgdD9vxlDoupFcEVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431948; c=relaxed/simple;
	bh=1aQknEEm2DgQZeI385AXEAKttj9FDjCLM+y1HBcVezk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=qXDm/9d0aACwiB7/PEpFXAt0V4RhpeVFgLaCcGhjqIvYGU0wfm4ZseO2Miyla4uSj2ZwHzWtQSSfSIpayYgxmreA9KSiKhzwjNJMWSIgPUA3NUPpyPI5+Q/OuWxvWh3VKpZKJaLaqM07M3bunQ6l9tw0Hm8xopwBbRdm1YrT/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbLMOZDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEiStqlk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M64803777157
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmINK/1u1ZY/zWzlVZMsxeh9Pabz3nrezFAKXzevSnM=; b=TbLMOZDPCPViNzPj
	QSto9uLQJTZAJZhRZKqfR6II5lfal3gX7NH+deO3/gT/PssYVtYI1FsU4ZwYCNzS
	8QQVV2YQKUVAlTULzqUiL7pnXKk+Nsv/OTzAiMeDcwAmt2GuecR35YwZuRzer1wS
	CTO5zlblx9gNb/wss9tfEzDlbOcYg4iawdWiOLopNF4Zp/Qe4rRkiAyLtUmeKdHU
	8aXBiU9KK4rng7GdSz/ScZxHuKYOyEaK/3kbBzdXNAuBV2KW+NZQThNCoJHq7iVc
	Gaq0MizQ7lpl6X8WgVCiOFuwHKEnk3R6QAHrJDXQUhIz5e0sNcGCzrNp9pZHvPfl
	ySbNsQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h200d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba86e35aa1so116163005ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779431945; x=1780036745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JmINK/1u1ZY/zWzlVZMsxeh9Pabz3nrezFAKXzevSnM=;
        b=bEiStqlkFrcNP5oPpkSdjJmQshMtwGxQqdY33vMoLp9T5JeqFGkMBmLbiXajES+BbN
         oMJ1FdNfUZo03w4jFOo5821L4b0HufAepvBUY8tseD9ZCNlUJpxmJttkh6TlgTN0m6nS
         NnurEDl0J2LAA3f0yNIfBQYP/wkZ9TY/80oEE6P0Dr6F83IRk6sU8qIE6X3pEtzVjlAv
         iU0DpoC0yPNpubilz6jnxGpkSKYrYNFiRWpPoOoady6sOlxWdUcaBHbjYX+e0qAf506S
         wHt1FA9j8hoQjp+Ei5x7VVpqJU0Jg7fQfPfYusgqfeorvk6hY7GJ9lYACpOuU6kwB9ff
         C5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779431945; x=1780036745;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmINK/1u1ZY/zWzlVZMsxeh9Pabz3nrezFAKXzevSnM=;
        b=HNmqytf91vXO2ATKSzil8SZQTuPBcvz4MwmkyM74C42tpKIojpfUi4unhhxyuoxAQ7
         1W617QSS0yEWIVgViglu6MRMop5rVv3zLBNWdg5rgTEFyKGPegBG7/vUSxkFGIqSQTu5
         5QVriPtKLBpEO8z78vVi7NIQ08J/zlVc7x5zbiNvTOynT+rKb0WTq/YCb/GQv1btBMy4
         OAhbNVcvLz/NGUkG7Q2KIe3+yaGmoI7fq/eJ1qvuNtzS9QrJcQcbZG8mvBtrI91AOxjt
         oPX7VdKnzJljrqRiche8jIJU2bXSkW4Bx77WatXWyrU2bxp1TCIVH2AaoTY68k3f3t6Z
         hx7g==
X-Forwarded-Encrypted: i=1; AFNElJ/XJkFJREevCPrNAN5Z1o/MwYMdwvNMu+YG263uBiuewvAqnt1OSbydZiWN9pz2Jl/6jht70HOGdHhgnwIF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KhSfadXUy+U8HVLLVFOrmwecHqeHMXyR5IHZCq6tRLbVrbcM
	ITlCkHtfqJlSNXEurjQR1OZzG2M3cr/lPsU7NdFgp9UN06jEJ8fUyofJeb2XcRk1tOuqtygQ9I2
	ry12vMY+EWN3ekaiAJSGioCFqmop2d+9YNNfW+1CvJLGgTt101Jr4lwubkVD6kcYPMSdS
X-Gm-Gg: Acq92OG7A2AsnJ8IHNgCGS1qBhzTwcpRCub+0ZWFvMPfXYKIHuDuX9KyJN/DjA398lN
	rcbPqJXfvRO2FvPl82lWq6wZd0jeRcwpBJcKkmjIhQM3JwB1dOr9O0SvS+p5JMWvUDxb/lPH4to
	I0vNPCuzcV6JL7xFOPTuW73HnJIcl6Bg+HsnymrST5buI1rH3rYuSEsklfqHaO2A9JGirNgrx5D
	TNSRqGtX0f4Oz6FkdxDHDecU7p0ICi4U9/1eBA+np8LpUcxhvUV45Wd893pxfTaZ5/tqA9VObQE
	l26THnTq5HetSC3CC/hgYO8uVVof8KPS0PRWnv54go+Jnp49B5YqrLjOOS9bgX/aDx4D8j7dgqI
	BQ2Q5+t/FE2LbYGmmxoa8iEOZ5jOFhZV+6RcrJE+QQCXXGKwaJvYnofrKEDCnRvgXMCGt02uH7W
	q+VVz2V7Ms9tJNKu97
X-Received: by 2002:a17:902:ceca:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2beb05d9fd3mr24537075ad.20.1779431945145;
        Thu, 21 May 2026 23:39:05 -0700 (PDT)
X-Received: by 2002:a17:902:ceca:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2beb05d9fd3mr24536755ad.20.1779431944658;
        Thu, 21 May 2026 23:39:04 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db336sm5558365ad.68.2026.05.21.23.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 23:39:04 -0700 (PDT)
Message-ID: <3be2caa4-dfdb-434d-90d2-63a35518e27d@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:37:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        abelvesa@kernel.org, jorge.ramirez-ortiz@linaro.org
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-2-jianping.li@oss.qualcomm.com>
 <almtuwpdab6oc44zljo333iv6iels24j27ucuiwsojkfc56zmt@xrbj6baxc46b>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <almtuwpdab6oc44zljo333iv6iels24j27ucuiwsojkfc56zmt@xrbj6baxc46b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y9e1cVtv96QHUxQU5oT8W2k1E2GXZSpl
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a0ffa0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5IayI-uhQhADWBiAsg0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Y9e1cVtv96QHUxQU5oT8W2k1E2GXZSpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA2NCBTYWx0ZWRfXwx93R7bsy/3D
 rLwZwOnu1Tde/ab9G0sZSPZUlDz7htyZYRgX6yyEQcMPmKwt82H0VPwi26jBs5iOGBHnvb207r1
 gxRTJ81dDc3oa+yUAxrAdSsnn6/HLm67GGlbJ3Q+D691prlcPgZOrLxOiGp1KOWqNSu3iFg8T29
 j6XWiyaI0ZKk0huAVrLdq3aIzpncnUnHMUzUzMaSli+U0z55Qpj4qmk6D6IoCJYKtaP+UmSoImm
 FEb9moXfBR9ffCFcrMh5NCZszozDoXy4UzDVOq0Z8xxpmVmLfgvbbLmOCiW56GPM11/lc05xmJH
 VLY7UxlFgniJN7PqJOPFX/QgW9MK9Yk9pa6ecG1mAzQ7zcgvf0zjhWBD70ZBKBxMVqyFf38o9qy
 lYju9nZ60TXB9+LnuCSrPx6YDkAucUoNI1Ki+g/uS0eHaJuAi5khARAKX5nSjDly6F7E1BRWqvQ
 rYjJ7FmEQc237+p9iGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109176-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73B275AF94E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/15/2026 9:33 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 08:42:13PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The initial buffer allocated for the Audio PD memory pool is never added
>> to the pool because pageslen is set to 0. As a result, the buffer is not
>> registered with Audio PD and is never used, causing a memory leak. Audio
>> PD immediately falls back to allocating memory from the remote heap since
>> the pool starts out empty.
>>
>> Fix this by setting pageslen to 1 so that the initially allocated buffer
>> is correctly registered and becomes part of the Audio PD memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> If it's From:Ekansh, it can't be CDB: Ekansh. How can Ekansh co-develop
> the patch with himself?

I will delete CBD:Ekansh.

>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1080f9acf70a..8b21f85cd9f4 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1324,7 +1324,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   		err = PTR_ERR(name);
>>   		goto err;
>>   	}
>> -
>> +	inbuf.client_id = fl->client_id;
>> +	inbuf.namelen = init.namelen;
>> +	inbuf.pageslen = 0;
>>   	if (!fl->cctx->remote_heap) {
>>   		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>   						&fl->cctx->remote_heap);
>> @@ -1347,12 +1349,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   				goto err_map;
>>   			}
>>   			scm_done = true;
>> +			inbuf.pageslen = 1;
>>   		}
>>   	}
>>   
>> -	inbuf.client_id = fl->client_id;
>> -	inbuf.namelen = init.namelen;
>> -	inbuf.pageslen = 0;
>>   	fl->pd = USER_PD;
>>   
>>   	args[0].ptr = (u64)(uintptr_t)&inbuf;
>> -- 
>> 2.43.0
>>

