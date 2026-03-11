Return-Path: <linux-arm-msm+bounces-96810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNBMLkXTsGmLnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:28:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB525AF1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28AFD3012C99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C7B2D97A6;
	Wed, 11 Mar 2026 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8e4g8c7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiHNBHc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27854279358
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196099; cv=none; b=KWhOkzm4qE+K5R70Zxh2NL3whWd4y151EkhTKOdSZGHQm7SnT2lBXSXzxUV9wrZTwQi3D2EMs56mQJJUiBH6gPXtbcXH+ThXUIXwllgR7cVUcrYF5m32eKC+i5hcXOQyroI3YD/1tMTM9qnKlbRP/nKZyRFa5f93Wnjg5fd6IC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196099; c=relaxed/simple;
	bh=Kw6LKRAG2yS5sgiDeejR1J4fpJpKpgk/u0nGqu2U27A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTyg5HqjEkaEEtHkjscJyNY1jFw7tOr8xt6mu/Z/LLltqwpl/q2KRu40xKZsHL720wZDqZCwYdH4R+g3Lwa4H5QsemvADlyiCcxzt7yig/psLs9TnhZSIArtKmKfhFT9yg6LTDVhzS6koWPhketEbWGxM7CCyfganfUIf5lEvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8e4g8c7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiHNBHc8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIIOjP3759039
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bcqIIKnbM4pp+/Suf7ePgOSz
	y1IvjMkVNQmPWAXad0M=; b=e8e4g8c7l9ypq0bXbfgHu+C9HJKbE/7EH22SHcqD
	aqF4g/bfLlWO9aRgain9n7VOg+1AoD7JQjB50h4UC43wAGzzQJjx6pFauZL7IS35
	OBHUZfxyFcoDBAQjpUzryEKJX3NK24RzWjViiOmAlP7xZRMsXGnumXq/lVUaegNy
	hA5BXm6q29uWXm3NIE+HzkmgsHnDnzpBXfvtXX49Bx7gS7qy8nWMghLQaGGPvIzb
	ZYpOv3E+5W7s/xzfh0Vwn7d6B8J1jpup5TtG7ArRGnFPXU6oz5tfoOl1AaOCcpxr
	wnMIU3Ch1yq8WzCpLgaeAZQNXU/lSm9fdENwcpNwOA5wIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujues-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:28:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so18786781cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196096; x=1773800896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcqIIKnbM4pp+/Suf7ePgOSzy1IvjMkVNQmPWAXad0M=;
        b=iiHNBHc88qxJr6xbsYMAoDdeB1ekozT/T6fJiXH7ItImPlOQH6qrBODYs2j/Qj47Mi
         EXZjVn+A4PTOPS9BPuPhL1qsWlSoF5zFfzoJv31PDCFqRLLvA/KxB4yALRWWAdJXmoFu
         53LtfM6gIh5a6bo/Jo0xJT+oHejVpBZLsKc7PxOSRPb1tPlpfBgzLn6b5kBmy7pUz4jZ
         X7gfYSKASx5rkyDHSrxdUQ6aoNx5pTMaBkw5G+dJ9Pn8GQa6Uc9cj4CiIq9rsyrw8Qrl
         M1UkkzawNrB8XX9vOw7z1qHRU5Ttkl3ZCSu7mhXIO0eqqHwE2xzeyWVJHJFCxr5YkBfe
         zYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196096; x=1773800896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcqIIKnbM4pp+/Suf7ePgOSzy1IvjMkVNQmPWAXad0M=;
        b=wxn245uFKGcH/rlcuCog5UGGiRNHZdXlfTBiUf8mx1il2UXudpn0TKhTiCVpfHK1Xi
         3ssd0GwkHxXP4gyAinwzmENWz4WopapoLjR6Z7i/6wl86Yq01X/r6Vbay6C7YYgSwYvz
         AQ79xlCvAiW8HGJKgOuxyy0bbdB9nJ8kcAusur2+pMJylPkjdInazVvqJZINmh5mstgO
         BPgJxUqMfruHImsmjqzyJpeUHb8xMhfQU9EC0pCeDawN1nyshNfTUx5+Cv/hoF1HaBly
         JFL0aZLFunz0QWb/mdSkYacNtugdcS4p/CFEmCUzvs/i0+0f5H+diOZCEfDTBG4CyQ+r
         bM0A==
X-Forwarded-Encrypted: i=1; AJvYcCUJmZlRC71ePBC1B9pmj33iLnlx/I7fQ5Hw7SEW5dx8DcNNwlOgbVejJWq6BFtWMsx3Lmu1aw2ShQVFjy0J@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNFNEKOAbKJACKlj0pz+rFwwMZ2Ba+pKoRIA39y1pe8j3s/mf
	oyZiPmUPG31CZwsOzyUBiG9XpX8qPpAgSZkXcjV2x2/bg1E4DCpR9H+lLA8Jh58jwwQy85PKYEC
	BvwAI2XneyBHAaemHOSXl/iYx1RAwMRNrY+Eud0g6NYerCxjHKVtTVpKvYk9CqHQkXbgu
X-Gm-Gg: ATEYQzwI67SwX7zFJ/J6T5dqgHXJfmuifXZd/DcA0XplO4ciedFOQo7B5hK7b/zq+7J
	p++kGAKywDamxMtlMbIF0v2tepeyqGM7gMYHTvgwJwNgDIfo7vgAcTZy9RsgCxRIm/9/EQvYM4n
	lrld1WQStIlp9W0A7SISkiwEEjn4Mr6SbpOzbUK2hyZ+AJ75bHmmkcPVG8Gb9S88HskgkA4iv6D
	I8Kc3bcXionZCPLfvzF/bpIzJLCga+VzTxBiPUNdaFdvhQ9ngOPsqUY6PKTmZdIxbKvfuakkD62
	+uUXA7v/LfL53vt99hyi1oBZ2ceRnKyKFwi4KwM1G4Q3t9sO3aQmrl+tUYiqxIGMxK+ry57P6y/
	C3lDmCjQ2Cks0uPE4MRMn1FBeixQvDyh2TIpZFb7E90JfELrD3dWX6PJDOzCTcyzz6wQU6E8BM7
	S/HCaVOYjpGpoBA/eng2jWkffgCoCOKiTfy4M=
X-Received: by 2002:a05:622a:1788:b0:509:1ece:5ad5 with SMTP id d75a77b69052e-5093a14da00mr12089221cf.38.1773196096360;
        Tue, 10 Mar 2026 19:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1788:b0:509:1ece:5ad5 with SMTP id d75a77b69052e-5093a14da00mr12089091cf.38.1773196095943;
        Tue, 10 Mar 2026 19:28:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636227asm150523e87.68.2026.03.10.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:28:13 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:28:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zoAc6vWxaOCa9U_rTFuIZ_ILF3TTa0j9
X-Proofpoint-GUID: zoAc6vWxaOCa9U_rTFuIZ_ILF3TTa0j9
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0d341 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yX1kTwPMbAsOcxosyjEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxOSBTYWx0ZWRfXw47zjQSMOOvq
 YqIcg6it/LFK0v1lOveArHrBTrgs+6ONjDgN4CQ9Q29ZwCbLUMi/SfIuN/G2kk+AY3/L54JTJXZ
 gVhWh6xBPEHNDp8QnyibHcN2+/qeDtS4G5xOlGXnzDL0IELwuIPPnw67RlIzUxt2rKgd+8C0Lmr
 1ng7jlZvT5xGr3kxEKCZUzzuA9GmhVbJHdWrxScrZgCtXKNVkO23oSAy05Y+W9qihzRRSM2iVi0
 dF3jEtCTb2H6eacO2I54S1eI3cnWmKCwB/AxGhmDXDyr/Nmtt6mBk0G2TlElPHFwnw7gH6vZm/n
 TNkrUSlAhXHOKK8xYz6gevFPLwaUYF/Jc53b0xJBsrV8q3XJKs/p+4YVp1A56X6hCWm+WYHtrNQ
 PCtP7j7HIghEEGNy5F7Px2pA9Atkv4KQHkMUwP2EQ2sC0k5zZ28K9kHuTv7QbgteKe/bxi3CuK/
 HPI5KAWAdGvP3cuKzlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110019
X-Rspamd-Queue-Id: 33AB525AF1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96810-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 07:22:04PM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.

I think here you have too much for this description. Judging by the
text, I'd have assumed only the if(pas->dtb_pas_id) around the DTB
context creation.

> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..3bde37ac510c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);

Unrelated question, but why is this not handled by devres action?

> +
>  	release_firmware(pas->dtb_firmware);
>  
>  	return ret;
> @@ -623,6 +625,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
>  
>  static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  {
> +	struct rproc *rproc = pas->rproc;
>  	struct resource res;
>  	int ret;
>  
> @@ -640,6 +643,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->mem_region);
>  	}
>  
> +	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> +						       pas->mem_phys, pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx))
> +		return PTR_ERR(pas->pas_ctx);
> +
> +	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	if (!pas->dtb_pas_id)
>  		return 0;
>  
> @@ -657,6 +666,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->dtb_mem_region);
>  	}
>  
> +	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> +							   pas->dtb_mem_phys,
> +							   pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx))
> +		return PTR_ERR(pas->dtb_pas_ctx);
> +
> +	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
>  	return 0;
>  }
>  
> @@ -838,23 +855,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
>  
> -	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> -						       pas->mem_phys, pas->mem_size);
> -	if (IS_ERR(pas->pas_ctx)) {
> -		ret = PTR_ERR(pas->pas_ctx);
> -		goto remove_ssr_sysmon;
> -	}
> -
> -	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> -							   pas->dtb_mem_phys,
> -							   pas->dtb_mem_size);
> -	if (IS_ERR(pas->dtb_pas_ctx)) {
> -		ret = PTR_ERR(pas->dtb_pas_ctx);
> -		goto remove_ssr_sysmon;
> -	}
> -
> -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

