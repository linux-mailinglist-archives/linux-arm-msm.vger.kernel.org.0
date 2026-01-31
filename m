Return-Path: <linux-arm-msm+bounces-91343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM+JOo2lfWkTTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:47:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D3C0FE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3C9A300CE7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 06:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E533719F121;
	Sat, 31 Jan 2026 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoiKiec3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IX2ohJUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10992C0260
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842053; cv=none; b=TkZ7sT6HwK4JBCnbycJpDDHCfx7U1Y4yX5XlaleKuJbepySbPO4bEhWmDDZPNGHhiaapnoQyTO+hXrBdIXkqFb2IFYYtN+MRDAbp9FVq/yUIRsJadI/sGLp6svp9JknNVZVThVEfSnh1SDw6xCz/Tm5W4sRGu3hglRxqrYdB5fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842053; c=relaxed/simple;
	bh=d+C/XgD6fiotDEpOe9IIGJSGoB5I1mOVaKwM56sPW5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pi1bUdz8RvEZZ3N5s4hiq+8Pi/B+sCMNSaIKs2ZdAkQvP+qveI8Kmw/uOqmX3u8u81WveCH6Of5OLQ6vxhZDI7y+fpFtI8tHv8eb/kfNT5ld15/F+JJier9c+ZaIzWRlDNm1pIqG8/MGKZerNdCSFjAJLq2Jk5T0M71R02oWV8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoiKiec3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IX2ohJUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4Yqqq658496
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lxgQvhgem5eV1WuXxeaQiHKq
	HYhMae2bq2UrsW+VFlE=; b=ZoiKiec3nB/jXc0tqUWzatIuiFHlRXonSXHt8R/c
	H5SPYvXIZH/aLL00q732ZbWF9I4HjahSjRb8LRJowfmdgXrhxOT6PP7hQsJpqdzu
	eBL6RvpRBaGVNlkCtdVx/pFcx4grf3SMU+cjn4HOV+GCpOyRP9n5w25e1YeAT3vT
	sPmjL8UG4lV+jDPFIXFoZz57aekJKxsCl2F9ZE/lCiUo+XoXjqNU+9j9ptWhOdoe
	PsD0tVXRgOx+qivUJMpHF7VX5O12LJEKSrWr7ruxfimF8pnnTeJsVdfQCzsQx69m
	RIMS9Rr2kiLIltBtnOoKtc8g+eYDx7sJYD8WQpiq5Ptf+g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2g8uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:47:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948391cd12fso3422112241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769842045; x=1770446845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxgQvhgem5eV1WuXxeaQiHKqHYhMae2bq2UrsW+VFlE=;
        b=IX2ohJUCJWl0LsYTEUNQyG7+eIFRvkmmHEQa0te6uUKShbUsmkZi53jiOuV7SPPJy1
         1F6bKfp7I8Y1URzc65PUlSyC5SSlOrgdmIrZDNUwC4FoVgLWdRPdQyUswXMsdnsaQ8Gu
         J0rUEQ/FMZ1ajy63kAMCCOHFqJV8tdA0P1dUCMAQ5LdSjxUVU+rtutnfedGcVOPlJ3Eg
         frfwCciIO20ZAN6GSD8Oo//xxeM3bZ+EAwI6cpK8gvpxFcG2wNPPFFdbhuK4xWiJB5w/
         mm2eowpCmlx4DKVSNtIjWF62LHS5Vq2Dc76kPswbN2Ex5up4eYe8KquxZEc3Cz3LPuHt
         f4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769842045; x=1770446845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxgQvhgem5eV1WuXxeaQiHKqHYhMae2bq2UrsW+VFlE=;
        b=IzaFCdb6uF0jOAZiomD7k18zYpYAo9K4tpK4hdOavb6SK89bLenbvEu8ee+rWLnXJ5
         ogBlM0W28Y4yZrw27ir3G/8LEgEjpYeAJaRjZ3zPuI8YoK9SZL6rk4TV/Pd/DE0+Ew/G
         WuwzdXbUwjFNZtt9+brzTLiWQ772c7ibb6RkhhWvrSqWiQuDbZCD4kAkz5rwTDIMMZix
         v3LigqsV9uf4E4ZumMvv566y2xsPls7Ot51sFPGcxls3hwZxRVVcqH2kTx9XOl1/cfYP
         LIx2v1Dbsv8shd54uJg6fLf2Wy3ZtcwMctLIKz5qXxJkVnFv0PHm4Y3iHuuDv0g9cvfi
         D8Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVG486RmI17VwJiugwLxVK48HRL96OIFdFsSSbcOVEJBD3X+J33joL0TyyWwyG26lYpezGnqikvrS3v1v7W@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvJdgHJ7BokwRML04bcQb6lqSvFjYA9xrN6y9dq9TlkPvk1Ej
	r+Iz38qiY0t5C3VIzY/4ftNfdHDRng3TyS6ncNkWvUh3VZGyGfUhI89cbhrn3B/vQxBdMOxoES5
	b0kB9j3W5LxaCajvI6J2wHSuiL0n+xJ7V6QCezYI6cpd33pg981OIEpZTEbhk/04nJ9ej
X-Gm-Gg: AZuq6aLftU/tkk0D5chrfX+gRNCgS/YZ5lHVDJkqqxJBvzlvmMBm+We/vnKdLwlbTg6
	zTN5trGlJS7Lpl9REhljG96zZyUl48Op2R1sxfPjhHOV9ePqimt33NydCJu6vB1gINEMeszLPrP
	CmKZl4xEdQdUvI1izqTcKuYX2AblSUcIrSBXxhyHp5KWQtKJqrqoh746L69gGJCqhMG5kYsa0OT
	18BVAXiXVCa/T3qR/zHBts4milurPEHVi71ec1Unz48Wp/M23qNIll5MqwcAcoF0icW/ZhvvSuf
	s7X5AzqHAvH4joLkwANL9sQ55uDdEpyQURXPDWgbypAMcbgzhkWpOgAxrcmsr4akyIcEALJVkAd
	rGYjrEg30IVxjXgco0rAsEkzZrccHDFhKL9d2BxfbsEBZGIDGqlrf6LTAESsfHyE17qmosAP1ae
	Xcg7tPLjysrGM9b2uSpaomLqM=
X-Received: by 2002:a05:6102:c13:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5f8e25af0ccmr1734478137.30.1769842045071;
        Fri, 30 Jan 2026 22:47:25 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5f8e25af0ccmr1734470137.30.1769842044633;
        Fri, 30 Jan 2026 22:47:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2177867e87.61.2026.01.30.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:47:22 -0800 (PST)
Date: Sat, 31 Jan 2026 08:47:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: wcd-mbhc-v2: remove unnecessary module_init/exit
 functions
Message-ID: <jwyujnzrusnnpczbw6lnzzi74miypm3bkwohcplbfquihdcguq@xyhonwtmb2nh>
References: <20260131020111.46108-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131020111.46108-1-enelsonmoore@gmail.com>
X-Proofpoint-ORIG-GUID: XSoVqpj3ekrCpE_sjEbmSYP4RVIO28aC
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=697da57e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OBgr-n6dxthDnl-XeRYA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: XSoVqpj3ekrCpE_sjEbmSYP4RVIO28aC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1NSBTYWx0ZWRfX+BRn8RcwSfoo
 VsRjXSUHTEVheyeJdH0cW51l4z1bj87VSBtaIDzb1XNPVp6GuWygjirB3tItw/8fPREl2hlTFVq
 71isSE7N2wHEXVXu5sn+hMm2m2n/ABpvdNpdCZbuuRSjPcdvoCIc28uFRig/a2hMc9BQa66U7Q6
 UbGAFCi/xF+/dCoEkLMB9wTX/tXS7//eg3Lk7YZbPLIu076OI83rlHmKmyoLmpvslihBtdt+Xt4
 nc42YvSacHiL3NhvznWoaFYaP4bpgg4y7Z9VUS6VFc8vzNbWQSYZf1/wtcuFkmM0vcMZhF6oRMB
 cGsOSFNkQI0/QMiKGt5b8U53f6Ts3fyRy2yz4YLJnvs/KzKh4MQEPNxqpNkxiRHdgtR2OPryeP3
 iX3mAhtRM4YnKqugm9KdptMgMo0kb8QaDfrrG4SV3yURHeJARq4jnNpPvNIv+lK/vmkRfuB+4pp
 KMkmsW0aRWgo/DMWN5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91343-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B7D3C0FE2
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 06:01:10PM -0800, Ethan Nelson-Moore wrote:
> The wcd-mbhc-v2 driver has unnecessary empty module_init and
> module_exit functions. Remove them. Note that if a module_init function
> exists, a module_exit function must also exist; otherwise, the module
> cannot be unloaded.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  sound/soc/codecs/wcd-mbhc-v2.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

