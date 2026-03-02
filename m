Return-Path: <linux-arm-msm+bounces-94920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMyHCyGHpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:48:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7E1D90BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A167300C6CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41BE3ACA7C;
	Mon,  2 Mar 2026 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrHaU/vm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXMKlx7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6083ACA77
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455654; cv=none; b=AKfP8/Ms8TkRhqjxOt0Op/8VoMTiz7mx437TlwfDI+Ylankpp2SMHMGbNgPtQMUw+fz/THC9Fvhj34mNLjMMRGpTkHg6ksHV6g3xVd51PjUtvSlwxNrQ1oY7zLuhHUcdpGsVlj58c8tn2hBYjszS1Pm5Pm53VlT5Ja5GcEyR7gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455654; c=relaxed/simple;
	bh=pJ4iAt7874rcqFlGJ+jurrn+MAbXtuSXcTqMFZeR8fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9HOrQs6bPcg8TFV4SP/J5obZ9+H95xJsg5vz6ihrxcA9yYEeOhhKMIC4b6EABsCqEWxvcaKT59ziwAeGUZwPrVVaTbXLpSTuNswR/jq85Rmwmxf+LyAVb4PQUzJIu7TlsJs81QdCWyqhWeux1q3iWyibcBYZ3GvNPp0uN6ERK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrHaU/vm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXMKlx7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K3Hg782814
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVABGUu4mY4JMI9362kjhkOtFnXqgezOf4nKx95HeS4=; b=LrHaU/vm+HW3238O
	wLNgX8f/3KQfa8miTon4/uGg3sQs9GLbmLax9c979MeszYLiO054HK0m89iBCQ9P
	zsq1aQJfMCkqG8jz21inUozmBKbK+ABfPrr7JLMXcoD0YL/rJrAg/vvCspv/WHyq
	MHNRX8Um7uaKCDianlo8LSTzWFCgnnQ5j6X0/x6vkqciprj20N6HURscfA1f+JHa
	ahL65sqmYEsw84JS81vsuY9zvr9dAztp1WNkKZetcmQcRfbMb4fIjnSLpr1xMWcb
	5vXj43JY11v3wjBhCyeVapO8gaLbvQWvvs9XMhibqhqpivo7W4YMKkHOKPYh493c
	mfnhMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00nuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:47:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a01982dc5so2453076d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455652; x=1773060452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVABGUu4mY4JMI9362kjhkOtFnXqgezOf4nKx95HeS4=;
        b=DXMKlx7Kgiep8BzyHjztkMvevpPBipSLt/lX4OCB6CwQtBXbHXoEqvXYywufHQiDFe
         F/mu1ewK3rJOEKpJchgAExnrF7pCxrM+xnLJIoMuW420cCAFFojotH9k5spxQgh7y5IS
         Bp1iWaOmaCuvAZaqC7aX+H3TVdVRxdwWWDGJZkjqcdAI1AIwEmCzt+kQmAGX+KPenPbT
         t+71IVKVFrL1WznPBL0XWTtDgYgjHV6yUZpHqkFS/4nLlYML42RN7zRyY0GB+y6Kh+xd
         IxtkWNH+RhBb8SH4aExgSJNTgAtFnFcPyo9lNC1aB4Hl67a6bIfyI4JboO+I3y8VtUEu
         IS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455652; x=1773060452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVABGUu4mY4JMI9362kjhkOtFnXqgezOf4nKx95HeS4=;
        b=QCbys5fACrLGuewHIpj9wDPbfMakUljaZgKpqg+xjWk1iZPwFFC8EmjF2q/kaAviw+
         RUNWA5+c8DUgUxaKBdP8cJT9WGsshUpM4umAqXkD8zP3eZZwtD1aXpYcKvN3C+b4jMCM
         sfeFf7s+Ee/h/oreeqVZ66zD7Os3NYB6LSEjPdGQJrtarnWSEGb7RtZ01BacKDoMjL1D
         rDn77nf9i/Mq9NT5kpGvzyh5gfBVvYuOJIDPNVLKzZktMDTkZpjbx1qPh0VCYaKmjj1o
         sGXjIoxsEQsnqkUp/vXo/Py4WwVUwNauEjKV0f809JO8nGcB6q9LhBraY4/5ulXty6aP
         L+8A==
X-Forwarded-Encrypted: i=1; AJvYcCVbatX0HgbNpUztpwSqOMHBc0yvrHeCdLGEzRlfKkPdQTra+9UBxMWt0hNOBA/u6j9b23m0FeDKZfQLFpJe@vger.kernel.org
X-Gm-Message-State: AOJu0YxfEYHcjyTM+i6/G4am7S00MCJfE+VmqE+Hdke4AgTNs7w2DKOr
	6YvfCR8CHXE4ZuG51r5UTyXhbcoOFV4FnDDg3lBhXt8Xuy4pdsI3ADijv+f19ZKGck/tAMRH68G
	a7IlXCWWeTxCAx8qQ/zZ6iMjzNHrwLIYyzwJMPXuVuk37BP/diZTaX3/tG22Ju+1phUon
X-Gm-Gg: ATEYQzx1/QEtZmifKj8u8Om/EBaoKDod4hVa3shSI/3BYmfBEta7Irxbv4Tow4gmIYk
	aG8sK17/0ysauJwj4uKRNU9tmpfW1zAWOYTgHBjkmMkZ22CKTrXlEMwtN8YhPSBU11fxjl4aW2M
	euSBH6Pj3Si+B8F6vEt1MTgO3lJDy1Xm6r+uSY9axyc9bfYTfhtNWDevXyyqWpZAc11PYNd/5iv
	AFQIkh+E7k39833EjSwEqyniL1vP2oum+4jj2xl4RIL3fKHq7fKI4Y8ychsBGkO8qDUnOj+cMvh
	HvkaJEEbWC2F1vOLwRBZPS/svl644I0jh634s5nXPVe9YF+Ej6RQIK8NQeaWixJiAbLwUWwHY2o
	j29/6qE5IafTSp664rn9WfVlbMMcpMBJ9SkUJY1cYjds8rJgfzt1XEFEl1d96bjAfkTjThi3Bm1
	YKUvc=
X-Received: by 2002:a05:6214:5e07:b0:89a:a9:569f with SMTP id 6a1803df08f44-89a00a95abfmr14244996d6.2.1772455651875;
        Mon, 02 Mar 2026 04:47:31 -0800 (PST)
X-Received: by 2002:a05:6214:5e07:b0:89a:a9:569f with SMTP id 6a1803df08f44-89a00a95abfmr14244796d6.2.1772455651326;
        Mon, 02 Mar 2026 04:47:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93973d3ec4sm266490366b.66.2026.03.02.04.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:47:30 -0800 (PST)
Message-ID: <68c63578-ff12-4f4a-86a0-212c2a6adfd6@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:47:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove return variable and unused
 assignments
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260302113453.938998-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302113453.938998-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a586e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CZKHD8RhjnvZNWBU2NoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNyBTYWx0ZWRfX4whaajDRlfaK
 lOhz7RjZai3SMq7ZJ9t1RCL71GK9Js6Wvw5rrMVz2Iy8t0gli3s7omQ+mCBV2NvqU1+fggyv80y
 46jyjFRs4KECQpnpF5PXXsuBP5fnAQddsBIuNnrFeUIYKbdOpAvyhHiZl14E7CAbifUK6PhzSHa
 SVPvCyVNTDKBUFIhANKkUFfU0uRV9ggG1gkc3cdLlJLFW9WatocI2p3R84gsbJ8zlnmC5bmJfv4
 qwNwvSxwuh9Ig4XfdYk8BBcFXRdvoVWv9y8wcWYpHrO/xY2OdUfG8Lo0k0/JL2iyu+q6q+JZ+XK
 ZJaqsh9MXGdCL3lbwgxH4JDwuN7Yv6/54tERqvsZ4mLf5b/NQroSBP5S39jeGsYQt/CPb61n/SJ
 qefulcJ1wFWA1uMe1XFVuxc5/aMLcyaeKQlypclEuoJ4NZi8RPM60ZxMRp4aIz1fqqUtlLYdXy0
 TECFIIrq9NRMO6+hmnA==
X-Proofpoint-GUID: rKYPhwUEbAfAICotDkqxXjR_-ms5FI2T
X-Proofpoint-ORIG-GUID: rKYPhwUEbAfAICotDkqxXjR_-ms5FI2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,gondor.apana.org.au,davemloft.net];
	TAGGED_FROM(0.00)[bounces-94920-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linux.dev:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AC7E1D90BF
X-Rspamd-Action: no action

On 3/2/26 12:34 PM, Thorsten Blum wrote:
> In qce_aead_done(), the return variable 'ret' is no longer used - remove
> it. And qce_aead_prepare_dst_buf() jumps directly to 'dst_tbl_free:' on
> error and returns 'sg' - drop the useless 'ret' assignments.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/qce/aead.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
> index 97b56e92ea33..67a87a7d6abd 100644
> --- a/drivers/crypto/qce/aead.c
> +++ b/drivers/crypto/qce/aead.c
> @@ -35,7 +35,6 @@ static void qce_aead_done(void *data)
>  	u32 status;
>  	unsigned int totallen;
>  	unsigned char tag[SHA256_DIGEST_SIZE] = {0};
> -	int ret = 0;
>  
>  	diff_dst = (req->src != req->dst) ? true : false;
>  	dir_src = diff_dst ? DMA_TO_DEVICE : DMA_BIDIRECTIONAL;
> @@ -79,8 +78,7 @@ static void qce_aead_done(void *data)
>  	} else if (!IS_CCM(rctx->flags)) {
>  		totallen = req->cryptlen + req->assoclen - ctx->authsize;
>  		scatterwalk_map_and_copy(tag, req->src, totallen, ctx->authsize, 0);
> -		ret = memcmp(result_buf->auth_iv, tag, ctx->authsize);
> -		if (ret) {
> +		if (memcmp(result_buf->auth_iv, tag, ctx->authsize)) {
>  			pr_err("Bad message error\n");
>  			error = -EBADMSG;
>  		}
> @@ -144,16 +142,12 @@ qce_aead_prepare_dst_buf(struct aead_request *req)
>  
>  		sg = qce_sgtable_add(&rctx->dst_tbl, &rctx->adata_sg,
>  				     rctx->assoclen);
> -		if (IS_ERR(sg)) {
> -			ret = PTR_ERR(sg);
> +		if (IS_ERR(sg))
>  			goto dst_tbl_free;

This could be made much better with a DEFINE_FREE()

Konrad

