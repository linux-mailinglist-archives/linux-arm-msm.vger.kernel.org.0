Return-Path: <linux-arm-msm+bounces-112472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jn0IOapnKWpFWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:33:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29327669C5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:33:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BgDWq7BF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SQk3wCWe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112472-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112472-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FE0132A7CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7ED1A23A6;
	Wed, 10 Jun 2026 13:26:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36896404BCA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098014; cv=none; b=sHh0e9cNiRGUR3jKQWlquQbjjWoPaE4WcVHgU6Wesd4YFnUfdCScEaamWj+nQ7QW/UjKH4AJLEN35V+mBWLFkpcbosV5UY7B34GMhqa4w1aAhkmoh5Ar11GxWPlCkCuGwO/BdXBHxyKHig7M+p2w7Y2YsiQJXqT9xP1CRjLijyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098014; c=relaxed/simple;
	bh=m+xt0OKMYFPGrtA47zn/bJ/T1qaTtH9D6LA2llCivto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSchfKVuIuBEY9Tjjj8etH1ffZzAZpAXPnqAUN7iueyGaxwPEc7CDiapooO3oGsl4yrT7bvP4Ks2L5v1bybiGYY9Ki6YCmN3eNS2DMww9HCBfCLinSHAxQdGYxLcJ1zc4QZNn/Ixx8ukoCGsDojWqBDZ7nhC8KHs3El9oBR+lNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgDWq7BF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQk3wCWe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlTT1072711
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cPyo9aCMcqtXkO/xZlkG2ODm
	crf0CwEfPgyHB6erVLw=; b=BgDWq7BFEs61H3EmbBL49tTQEvoLxKwLqx6iz9e/
	R19ukDcAFzK9ExVmDINW5GSoTXXFIfWzxVuX4WXDeW7Qx54adPgfEXKMp4Azf3uy
	Xofd1J/BwOnFuJxR1HK4fWCNDTFvGmT3GVy3X0fpofj3vHft2/xknsk6ClVTshCr
	TAYkOD6jBkTZEyaJpRs7XKxfBKlwa3Go+mPc0o9GpgTPGSS1pS03/E9Ybw0Hs/AV
	YtpzOsqQIx1YjQaw25eC8+8Mt6mYVLpdxNLC0uOITOaEDJZZRar3lNIlwvGnKdQQ
	9Nz4ePhUNhSxyG4NhKFDbBlwox29dZ+4omgBSoat3idBKQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjbr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:52 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963da2c73fdso2000319241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098011; x=1781702811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPyo9aCMcqtXkO/xZlkG2ODmcrf0CwEfPgyHB6erVLw=;
        b=SQk3wCWexmPlmqiMlD5sacB2s6pTdMTy5Iv02o+cm5KyWGCxoDWxaJMFm64xku+mKR
         C7tx343up6JPHNi9F438tRTvzdP6mxT86U6NS1bwBnOhwNGvgQSS89Jl7F9dvSJ2oXBT
         4Svk7GZYcsksRUp9/rUuD61CFf1ul/0Gqvxgu+Vl3dUe9lEzKd2YyFjM2PSATL7z5PQW
         SSP3D53hVuE9dXec/Mib4egt6BUvxNzeSmGrhr/WPKIzrpr+UL3qp1Uf9toLO7nQ2koP
         e8RZw7snmfbed/nCtVBvzRLmgFjY3U1t8bEtHWUuvsfJtaY3nIk5bwucwTqNzY1f+6aW
         jjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098011; x=1781702811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPyo9aCMcqtXkO/xZlkG2ODmcrf0CwEfPgyHB6erVLw=;
        b=mEHwbvc6xT6gQvH31beBZvM35Vwmpp/AQODRUrnqRtsDpgAEjPa4DLS677FkyyMrdE
         gDbNmDneTikTECrX2b/weYfabI6M+fLOBgaFKFGZLeITdiSnXSmWLcyDOxTm6rKdaf67
         IygVomivg+P+sc3tZq/R0MGVlcaOIEz/uykmfmUF5t31X6emx7G6wNZ7PgfpieEJTsdz
         sTmaadBKITyDOqmQVkbiP33lC1mDMuK283mi/fWjier50vpOZ/E2JQUH8j5tF/9Ktdpg
         2s2flIb/qRVLXltf6ODya3KgLLvNRu/gM3l0EJVl16UqkmTDGsknVICiqOo1cMcxnBeu
         ZqbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ko29lbV2AaCnjh9ShYK/ljBThZpMjCrxQg8tyw66KTYoyDZv5Tbio6EtXhXot3Tw8Lw3u/7DVju8VJjVX@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCLsYQF+Zg+pCVeGbnqE7DwT2CU49HoyOIt/z/sgpnq+9bhN+
	QM3C1zMZApKDIEzIk8I2f0AT4Hbr32hVsslHgtAErWaAwsIgHG2gg3VDpefeQRPRvKia1bc2C+n
	i0zQ/MO43Hb5vvm55LydMAcwti8h4DXlenBPkW0KVwZPx1jUkr/CcwWB1sXIoaf+3DRl9
X-Gm-Gg: Acq92OFp+2E3VBDhRwN8JBq7l3qHisljN73Ew3pqGxhV1Zop+71jY+54pbbelWMknxr
	ULyjsdxi20tTaJPJBSwITg8RIowiddISC3qsBBHpMBLOlaXs9ZEO9AaE9C/40CMTGgeWrPgnoBU
	peXSYK9RJqTOS0rOu0X8s0prDq11bnXsnNxsjwhMXvfaEGLEGk30lfIUMjvBhjLPBPXr/eIl9So
	BPsoEJV1w22n07iqMJca5EBsNPJtytbM7Zm+YlAlhQHYhPOMPfos9nS7Z75GxVg9tcR8/EhJfaM
	053SUFWUFiobL0KynFCauE5aERmGsB+FQkFyjgDxiJ7QRPFSLWqUvGJqps3e9UebpncOmmELf4J
	NlPwhAtxiZJFO/GbqakZxIR4Ow6rK+GsI71si0sL2/+biBia09SkqA2AS9yTJ7Xu4CvKKc1jvri
	WMzAuylQYcxi9SLQ3qW6hSUWdsgpTW6cBHR/ARWFfeHOLHeA==
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr13342344137.27.1781098011502;
        Wed, 10 Jun 2026 06:26:51 -0700 (PDT)
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr13342318137.27.1781098011112;
        Wed, 10 Jun 2026 06:26:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm5332813e87.68.2026.06.10.06.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:26:50 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:26:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, hverkuil@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: fix payload size calculation in
 parse_raw_formats()
Message-ID: <n46tdwyiol3c2br3epxh3lffxmxey67qt2xbrbwwwtlolvcdk2@4r5mj4hmy66e>
References: <20260610125655.10517-1-med08elkadiri@gmail.com>
 <20260610125655.10517-3-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610125655.10517-3-med08elkadiri@gmail.com>
X-Proofpoint-GUID: kxwErpfoZbZla4cFjSn29JLFdOf69tUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOCBTYWx0ZWRfX2BRD6yVL7b+i
 j7DezIXXlEH6HWIuFEbFy0zX5z1uuB5uCfl5Jhfw6RfVWpyBhI6gtp/N+ctiPvd0U3Sj9Vf2s6I
 TEnAFXYST9O185klfq9A7e5wSs4LRxMtNbarT7re+7YI0uSb+/dnap984ycVk2IVSeyJs2UKiyk
 p0JPnn+BeMp+ogA7/51uyoWc0mwNwN2S/aUEbfh3A3wJACc+hpEOXE3sRMl2SAO296BBNohzZXm
 FHJjy+uBq2sJDqJCVR/iS8DKt3w8Wxp6v7SHslRCfkTbFa/hOp40K98qPA5ct/Vt7+ZNibQRasJ
 Z40sVqOSQ7cCyIz7ZHvrFUO50Sgtnt1kvJu4pps2b31yGOqd4bwEkPDMH43gwNGBv90wxafd4Tm
 DpCxenh6vxTkNzD8vFivsCLEQdvUsAshP+1ff9dih43S+7UPA5IwvgZuJRK/m5kXzZ87SJGBqYm
 ajSHqyQJg9OznO/1MMA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a29661c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uTaGIaT9vMJbWL2ccsAA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: kxwErpfoZbZla4cFjSn29JLFdOf69tUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112472-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29327669C5C

On Wed, Jun 10, 2026 at 01:56:55PM +0100, Mohammed EL Kadiri wrote:
> The consumed size is computed after the loop using the num_planes value
> from the last iteration for all entries. When entries have different
> plane counts, this produces an incorrect total.
> 
> Accumulate the actual size during the loop instead.
> 
> Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

