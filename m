Return-Path: <linux-arm-msm+bounces-107450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PxMLPnMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:11:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D1539ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32AE231CF0C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389493A2E07;
	Wed, 13 May 2026 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZfKTljJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sek72pQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564D3AEB37
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698670; cv=none; b=UKmBAG2rpsNLEn2sGGSltL8EnyECPaWCKCpf3HA3PvQNQ6Ia7P1hr6hOJqKUUAjtqJX+EEj+gSVDer5zrmHYDw9T0aNGCDt0EoE0KA979Z3KA4vPYKFa7kyCQkdWLFY7Ahx6ohiw2fdXSf3sT495sHzAu5nfKR6y+WWN0Jp52cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698670; c=relaxed/simple;
	bh=YxoNcc8P6dFYIOCrLK2Oh01sYpSM06B6megcYtRH2H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msJRzOtOQJqIPSLstKSYCDW7avmKWeM4s099/9/kzZUnjxQIzgGtbit/8bd+BVlqonH5Rv8Ano6hCE8xLtzGgsth8J7z7VqJ9xCpLq8ClZGAKzfmzUcTIDEaPFpc8HXyDOEHnuqGCQQvAGcJSdl4FgRFqKpnZvJMRKDAV+Yi1sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZfKTljJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sek72pQG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGwUeD3430147
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5cyuH7S6t8FYHEcWaWo4Sxp
	hyV6ndXTKkyrR2WlTzY=; b=HZfKTljJdpWmuMUYYQ8OUMxdSUSTV5RDCaVAMQtu
	ZsyHAxIN1pdsGQ26g/K0DQ+833Kl6vGuVX2mPzY6FPSKR6jJWuYSUepFOCFAP8U/
	lErL0F6rhW8LHixdIqrEkUoaI/2n9iumda6+BbUhiX4wJf+LqBzGV3JUFc32fMO9
	nncFrLIXI+I0R3ldkKb8du68DCnk72p8epyCjXnr/IveephB421yl16muPic36az
	7uBy9MKVJfW8jVS9KHkSBB96Q3b5irpWHTue7ie+0fx0Zm4jotLwn76b5O6pjiIf
	vf5a7Gqlv2LbBikI1e3cwnWq+HWs1DZCPRx45TqY/yHvfw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcj1rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:57:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-634ce585b41so2221035137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698667; x=1779303467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5cyuH7S6t8FYHEcWaWo4SxphyV6ndXTKkyrR2WlTzY=;
        b=Sek72pQG99FbjS8ro3DlXFuxymQFSagmzTlWMaO23pxIqz1avK21K1o9JwMQzngTvF
         csSSZeIN6DNwyFFB6jH0JcnPY2+YeaTDBa3uvJ4iaxMajKrohyhtrpzZHtpp7h1oyZpc
         zo5tX61NS+MXrdN4n25Pz8clKwOyO44kX03ZpmpBGR1KNa+Jps/3FtuAnAtQCZZtl9d4
         lh4nh+JnwYUj3bs1OpgBJbqTl+bv4Q5NPYuMOHtzJUDbVFAOX/Tef+wdBWdGakc5Jc24
         sOaPY4oY1oYCGpULtZ1sckpGVAlT1tbCrxKX1qEk86cRcKQKN1IQgAauZoEbhkzAn4JZ
         z7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698667; x=1779303467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5cyuH7S6t8FYHEcWaWo4SxphyV6ndXTKkyrR2WlTzY=;
        b=NhPi8AW0YJayV5uz2P4n/TTDw4F0Jk2vOCBFpgZppSLNBVgnXD5FXRUoL1AeUQe0Pp
         u9PWxtv0P+wU5+HdwjNArUxG6MD493zWBquwj06sny1/r7p40/NtQLqorA2P5yrY5+9D
         FoxyNUC1FCS+FS4cEV1J1Zjd9d3dbNFHeLdhEDBww4mXvn8qsCVO/hw+PE6xuvu3Zi4B
         oA1LfyXsSvw9xeHC/rY77HV0EWyQTUP1K5Y3ap470lcYsAojKbPX910XMDs6jPbuuiLP
         6/B1zig3BPTLqldgnGB21ignOUpk+7xeG62ODqYKR0YiMj2BLCQ4keeAGekgkO6n2pU0
         hHvg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZXMhUH4jiFZZQXy11RVKX8FMpCLgOZN/QmbLi+3KlsUwLKTAk34y318IWsijxEbqJoVSGlx4llVQX/c6T@vger.kernel.org
X-Gm-Message-State: AOJu0YwPptZwhIot8RgYkSSOKKysHTFlSj7V8EqjAcbMGYMjBHBlBsDP
	6Ey0S+wB6eQnezwTe9ciJ3yx4df9/5Qioku8iQTUeiYCC8ljZZiwmYEQAxMgKHvVJrH1JYvtRSf
	X2J/YRWJe6g2CH5YpJj85x5AInDq8H1KW7srYLwMJfj3O7FII1SiIwV5VrS7DHKeQq0BWDoRViO
	zI
X-Gm-Gg: Acq92OGzl+5DXuQ/Qv/L8+xFWkAZ2QAzPQVnNKYmGlYt4VzV8qx0j8uvu3QwJb7GJzi
	DLMPmv4ieQM6DjBQKu0jjvoK2B8qKnd3BOjAQILP6sS021ILVpwPVOPnH0fgvvjl/XNIxM9pHdi
	WFF3f4B0lxlW0mbAalyuW1BFkI/SslkMT5DnwtXfffsi7rFl4f8b6qeGe13ReLkaBA+TlVjIvkZ
	tBC8aR4k4Z1fWghE42TUYG4anqZ46fcLAypjSorN+EagS5Fmg6TAVD1gqCFpvLK37NJvZ/WoKWi
	Xq3Q+zHEGVSvz08k6ys+eMQ1S0YXN6/bKksrNc+tEJEyqoxJqvsXMpfGG7bHA982jiFi0gn6vi2
	HOt9H2efD932idR8QLhLF8bi8T36DSZaay8vWMJYNt1GZaSE2G2fKqiQFCKGCKPA/szUjFemFSP
	GOOQE/D7Cppnizc4NRY2hpizWmSyzpnVc3ZLM=
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr2571576137.6.1778698666868;
        Wed, 13 May 2026 11:57:46 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr2571565137.6.1778698666342;
        Wed, 13 May 2026 11:57:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b2acsm4158737e87.82.2026.05.13.11.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:57:38 -0700 (PDT)
Date: Wed, 13 May 2026 21:57:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 09/16] drm/msm: Add per-context perfcntr state
Message-ID: <npv72eupja2jczwrhssujypuigzplbqcid2qt6yjo6fj5wftoj@u6uqcxj2ic2f>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
 <20260511130017.96867-10-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511130017.96867-10-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: LB3OdqoNRC2kTtMTwyFI7ezyLCFdO5Ee
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04c9ab cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=bDk2b4Cu3fwnQs1PW3sA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX4aWpxF30FWGb
 RjZ/UHuvVjXA3wzQr0Uy65VkZ0dCEp3ubtEDaP43QmUaEUw2YNslbeIugvH4VSisDGuuuKcEdia
 zHxfObscXnDkVmnP1tf2iHa2IWTClgu2CSB6OuI/nWVHFfk3YJ80Jy7Qxcy9Vi1R02ZT5Pj0s8v
 tUl0F+OA5/MAGkkfUKjdn2XNMqRDnxrvnfpeGOytPgWjw0/66Pj1gbRG50Ja+bFXcqSDyOTiKGj
 J05iHc4TZHiMgn4pyMRKSPvTqSVxgmNEYj6xZfAkZaXGtxDur5co/qQdF4XUgxdW9ERKbdkG24o
 jxyTlPChHSemtIYl7WpCNdUrGl/cNTQLLMg3p538P8IfD4B5D/awpRxukyyJHm88mKpDfEdTU0c
 jCWRMWTSensY+t7+FEwW2o6SAi4VRZrxwZm64wK2ECBZSNcycnJb1Ib5eHB2jX89lQ7fwhbPCnS
 4bkmmyuU3vhRIopLNHA==
X-Proofpoint-ORIG-GUID: LB3OdqoNRC2kTtMTwyFI7ezyLCFdO5Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130187
X-Rspamd-Queue-Id: 233D1539ACD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107450-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 05:59:22AM -0700, Rob Clark wrote:
> The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
> collection, and per-context counter reservation for local (ie. within
> a single GEM_SUBMIT ioctl) counter collection.
> 
> Any number of contexts can reserve the same counters, but we will need
> to ensure that counters reserved for local counter collection do not
> conflict with counters used for global counter collection.
> 
> So add tracking for per-context local counter reservations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.h         |  5 +++++
>  drivers/gpu/drm/msm/msm_perfcntr.h    | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
>  3 files changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

