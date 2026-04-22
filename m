Return-Path: <linux-arm-msm+bounces-103991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB10GaUS6GnVEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:13:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF401440D09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 266D03010BB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C224F139D;
	Wed, 22 Apr 2026 00:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHCbP4zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxoZuMKl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4A35975
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776816788; cv=none; b=hugY0RK1B1RFsatAmv2RR/PCaosm4DsTmZChtWpT+N4r5vZeaeKy+EqmL16Ti6Ma/iPL5Z9FVuWshpwMchvG59pY6acbP1uAQ0FIQEupI8uxITREUWs80UoJrjxCtlxkGChXQT0l2pxNxhRanFsN0yivVOwF4AbKOUtwXeuF6tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776816788; c=relaxed/simple;
	bh=OLsmfXdAtnIFpTz2cPXMw8gjKWF979i7WgicUPCIwns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6Muy24FD3500HbU/N5l0R8jhHrTKRz42tRMTxUBgGXbKZ1QEmcxs/wkx65Fzs+h4Wi9+CM6fDVliFmbjc3ggYzeSKPeQyJ7CJOp1Z/EVkMr2bDzSjo9UnJblxugWq8YUDgTMrXpDOI/VSRJelGk9mMBeqazA0QrD+ggBZIgB6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHCbP4zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxoZuMKl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZtwB2123735
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t0sFYWqXHX1E0Ve8cIKEtFLv
	EiX0TTBOU1ZPl59+g/Q=; b=YHCbP4zE6GkQHsjwaq0sLINDkF8z99FlRmHKEBFU
	hKiphOc5329Gpn9CXvmL5YnpZO/woBAjnRAMV9I5kgbdChxtAQcL+z/pst+lQ8pk
	UxqFeMIk/ERvbOr7/DacJbWnLdyD2hvIz2rucEcxhUjrGZ3DbP97YHn1UO87f1z9
	bl070M4p9GbVkit/1CmfeuSptDHLfOirVcc4nvgAJwOTUzsSvQ5SMoS37zICSBCL
	0cob5GgWLffP6uBbkBXQu4s5BZbgvJkxJDoSITSogs+FFOA3fTwlPaPxGousXNap
	cS4+gzEuUVD2841RHDGkx36iwJWGrSL1sOFIiak7xka91w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfrv6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:13:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6059d4c73d5so2212848137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776816786; x=1777421586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0sFYWqXHX1E0Ve8cIKEtFLvEiX0TTBOU1ZPl59+g/Q=;
        b=GxoZuMKlvo8shEX9/BcCfO9LP1Dn3/FgYA5CaLB10mxIMB89f93eNkgOJpyp3bwAAt
         VsksXWi80r4sSw6mY760uVvd82UNzYzJbIgllxRkKgS7xYaSmbU1I2jJlr8YK6IXA/yS
         XbkfJWbQWYX4rmFozNRXeSDyhrii+p5L+5njOSwI4qETmXU3p0nRpn+TxtxqyV7XLVhc
         KwvwDcm237ehem10a++kIJ+jUM+UxpAmW2k5ghbmfcMPUE52nJzVC744hjtG+MwAZgLu
         xFemO2T4LWQ+E5T+glxBTod+Z+2u14EPFVXmmbHKdfz++Zv7L+GhliX7i89usvdG4SfS
         PnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776816786; x=1777421586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0sFYWqXHX1E0Ve8cIKEtFLvEiX0TTBOU1ZPl59+g/Q=;
        b=rX2UELFBBZ8ShJNnRjG9H5xDlw83JzGmISYUA7jt2dzBDsCdiZCE+pEA5nNcH9cYuA
         ZESHqyem3LhC86RfW+9VSANT5pnaUBS8m+Xf1QT0KbX9m4zM0kSo1Wis3QkcoMTUQ360
         lH8icEzfp0kUD61kLm9r6Ka53NHPPodh7z9nyGLOb4a+ecrYkpKfZIgKq0gfD+A9NJ77
         Tq7qC5sZHbtr3y4YLoEhJWt0U1u0CgLdNTRkbXJsuBW7SILQHLZ7vgpwIvXUw6PaMcyx
         0lipnwvqeGz2axKqw4H5vpZ0GI0kgk6Ledvbzb64Z9Ym5RU4PRvBNMweeAXizkZlF4Oi
         9Dkg==
X-Forwarded-Encrypted: i=1; AFNElJ+JkJzCpv65FvC+S3nRg4XfoTg8FbwVcd1hUbjDuInxl55MJoFraj6FG1H1WMxLuEEcPng8cK1cOyCKAo5r@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Na9rJyccjX4GEdum3h2DiOm1PRiKUGnQGiVL4qipIfrOjUG3
	nJQIVZvXJ0cq6evg4e8jMdHYKa4S8mXAyjmjQCll5nw2Bf/HZnGpcTmBdcB3qxsDWefXi27vTa/
	npNBq6hnIji2GuBoBY0RjuAzgbqtr/T6grpHoPbYQTDYp2VO5h4PKXxf9YfyFS1tl+dmm
X-Gm-Gg: AeBDieu7B7qj5hmRClmbrY9C77D7E/FJE8sTqq3KN1XkaSmjGiWxXF+ljRvSiixYKyP
	+6YIVqgK8Q/n7BYhHU1O+I9Dm9vf5Qfh2jkhXR6hcas1ToCI9I/yV9QS3ZqHQeHiaKZ6WwMeMeI
	/mEZqWaItcF5FKHnYYg9iP1692CcfSwVaagU91E3U8z+rpkYPZlHQls5xwZ4gvuDZsiOWmAWM0x
	FqF0tS05llIPQxIh/uVat7DzNl1XL2ibSh9Ykx1it1hzLk3EQiicAD+Z//1JO0AqCrmLHaoVNsz
	5QICDXV7xvNDdKG5IRP9hIznQdLYU39CVC02u/UyApFrRBC4FVB0+9mjQF/XsTKV+7dCC8UtbPS
	B14WvymZhRXcFLk9slsSU5+Kv6nkumGTv55dNDIkrASoDsQvJ7hnCcf0TZzZFbLp5YsYupvgsRl
	WpD4MHo3yam17n+9gXWjgQWtb4qUGnZtcK0x28RdudWXgR9A==
X-Received: by 2002:a05:6102:41ab:b0:611:7c7b:4d40 with SMTP id ada2fe7eead31-616f91e60e1mr9313015137.30.1776816785719;
        Tue, 21 Apr 2026 17:13:05 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:611:7c7b:4d40 with SMTP id ada2fe7eead31-616f91e60e1mr9312997137.30.1776816785263;
        Tue, 21 Apr 2026 17:13:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb73de2esm31656651fa.36.2026.04.21.17.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:13:03 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:13:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/msm: fbdev: Use a DRM client buffer
Message-ID: <2bdnzz7piljtvm7wdldz522tfsq4g5alqqctxja7gazpa4znly@3ircmzhrt43u>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-6-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e81292 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=98PYG94H7RBuGLCuRjAA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: KDGKHJuU2fPzl9-aRNbtcxPINor0yoZS
X-Proofpoint-GUID: KDGKHJuU2fPzl9-aRNbtcxPINor0yoZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwMCBTYWx0ZWRfX7Pb2Hyk2eHZB
 5A8mTmtjtQDK7hKFhYx+suRoTTmj5BPZUwObnUMk3uF5ErCh48lzdP+py7RjrYOfQZDaAVjFlfn
 freUEjKs4poZFjhYTsJQ85mQzxDvy25gzmWl9K4XVfQ7sFzMy+wuPSWwWdO5ZCfSuyNEGLTTRVj
 /ierO1AN7dhWZ+YhGOuB2+kWQJRysQfvP/HLQTE9/NBRnMT7m8dLP6XzR7Mte79sS+di1aeuezR
 B52Xz5q/Q8msP4hj67R1TPz1DX81L7dnz3BuA5yiz6cBvqIfcOSj/Q/zuMp6K18ES2Kb+b3XCma
 Qa/U66d77mM0MR6SdPd464nM0sYJKXZaEuWSW7YsO039RnosZllYof89ayO0H6T/l3QihQmO5+X
 tCdQIEIoiNyvY5JUjlZxW/SuZg2vW8IUAPqU2znOfm+eLnM82H1vvODav7q7nUVVcRVQkS8FfTD
 fLtR5hp4FeN4rZNL5sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103991-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,suse.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: BF401440D09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:18PM +0200, Thomas Zimmermann wrote:
> Replace the internal DRM framebuffer with a DRM client buffer. The
> client buffer allocates the DRM framebuffer on a file and also uses
> GEM object handles via the regular ADDFB2 interfaces.
> 
> Using client-buffer interfaces unifies framebuffer allocation for
> DRM clients in user space and msm's internal fbdev emulation. It
> also simplifies the clean-up side of the fbdev emulation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 55 +++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

