Return-Path: <linux-arm-msm+bounces-112471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n0K0JqZnKWpEWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:33:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D72669C57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k0zc5CRj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rc7dodUg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112471-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112471-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79802329B096
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B690A409134;
	Wed, 10 Jun 2026 13:26:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A92E8DEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098003; cv=none; b=fKh829f267oT1q+cMF6updf6EMWgpTDiQuf3JX+S6B9OaYnXaPUnFYnsyaw5ZpHA2/1hNnqLgbO2ktkwT/zwKIQRYYvXEnofwaGEDRmPfOOxCpW6nzgvroVr4BqxjQw43bwNG7v3trrDykxzoZzsmlBBujDQ6KeVEfjZX0Dlo0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098003; c=relaxed/simple;
	bh=2M2q41OtBWgY2Am2LjNyc0iL7gSnB5ihdyNkg4plOWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfJxLC0uC6Fn08HYM4cANBMiUV86L+cJtaNfikcL/HuO9Z0KPkppEHE7iz/uQohu4K2cjzKywHQAoI/uuSZssRg2OoQuIZguPxUR9wKhkYI+Jw0flQxzbla3Ne8psQ1CqfdcmF8UjICxycuEQTWTG8uf7ihEgVp/Dk/0CfXWyAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0zc5CRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc7dodUg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBtIm1169916
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hamOhHe/t8QAdeAMj8Ua1YUB
	t/FdWZO2oEFl5p9GAOg=; b=k0zc5CRjCHshLDdhSryPwwLfcD19Yzzyd+QBUuKf
	tqgP1eyB/+mn2t/NOXK8YVnAF3NgMxbtkne15sgIZ9IaZouo7m2TW2gvt8WPUOMX
	F91AwMp6QuVajkxRaiSHlUoc/D14b2/a9v+/SfCSrg1fHDaJlU7wvsQgKA3apnFz
	Y8y5e3Tl5v9P27bNdTTAiY2PBusZ9JeSdyaV/qybYGVtFfhhpJxd+lK1Kza+IL71
	gOO9fuhWSoPXA0m7WuSXaRpzVQGL38PHgJAO/O0U3j3dnphdOOAApULPCAt6twOl
	UbAWdX0TlB1n0Frj0Pyq8TVqO2zUTyrWuHDGapLgumsrzA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s00w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7670e38so7958601241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097999; x=1781702799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hamOhHe/t8QAdeAMj8Ua1YUBt/FdWZO2oEFl5p9GAOg=;
        b=Rc7dodUgyZUPeLRusxK6kxSdPX9Axa+LvO+nW0mWAT4lIpIkznZBfyPNr+mFKdob6l
         6Wux2hLZQBrjlSpcnH0ZU6lEOPScWo6DWTJ4PvJyVnyroIIUAHPrJzbr05iGY5Ceeak3
         mbvIvYu1+0WCcXtcSJ0PZmmhHRWym0hzVzgtjlqZJyYKY7WCre+4el/9QBRQxs2ffyLs
         NwAOIUWZFC+6G2sYte5D59jWqok2zOeszaDWb3GvhOj5Vpr2aZLnotDTnz1eYX5GmemD
         W6iZ72kF2y9s1/cXieWcUGYtkN+WBN1DSeI5WoXJBPvknnT5GFRRRvipzpmBbLOKddFR
         wIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097999; x=1781702799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hamOhHe/t8QAdeAMj8Ua1YUBt/FdWZO2oEFl5p9GAOg=;
        b=sG5qBeg+1YM+f5Y+JWU/GILsQGxXIMWtFaAy7YwxZbFtAmWlkKWB7wnQjjSdM/5jBh
         vqqoBEtQjsDdgBu5g7oZgnsvZ3BpkalP6L3SA+TGqrY/1jCM+W6IeYOrAGo3+lJMV+ct
         q1PWp0BrRUCVM/HyrdxnSRzBbWgXC+NSFtK1k1cvBmxwc0EOguIihyawJyJ3wEsLRc77
         SPztnokPudEiWZN7cERJ/jdsPn+FrrcgN7Q67nk8z/GSL5zxf/yaM+kdpf+UAV7t+zFr
         f+w8T/qeFFz2jRwqOxGpuwS2ZTjDeRFLfzKooCO/gEdlGv/7hJPaSDnx3NrUtwVUQhAN
         p6kw==
X-Forwarded-Encrypted: i=1; AFNElJ+euN9JQxAxA0+gGHsGF1pg7NWthRryOXROZALLrh7UbzOxTN0DYbv8bieX5KhfYPOjQii2tIrozJw6qnFl@vger.kernel.org
X-Gm-Message-State: AOJu0YykZm311tIMHgSyVoIytDc4hdvBVfD7SUuXc/XTG/3kqjeft65j
	0ZFJW5h3VxJkBNPPxr/2xvF7R2pcjLR8SqelmykKGf2ZJM8NMh9PkfIm8VRzTrGT6zDM+B3aPFj
	p4rWEXLOfT1n25l9l8C/PKIsa7ozfNWxGwXJ6LLW5n7x5XfU1nAEf7AjlkWSCqUxUXRER
X-Gm-Gg: Acq92OEl6yuzlfcUh7qW5h3KUWly8whzNjv8pu+RG+uvgaJ52WF4mf7Hsw2n0UtT9R9
	BlF9DgWT/oQENgc1IU/WjIMSeAgmsRM9o9AdRSJV9b2jph+HR6A6ZygSD6AXaKK2PXbRkQMzNp3
	EEhTPjAa41Wz61BDyBv/3G+udXmiH3WSFPVJ0ThWrnoDdXxOnwmb+/NkBVAnP9Y6CJs6gPamq/7
	JDIjrfc69mX2X3mG95VyxapOUUkbcwz8xWmZrURjCflbK1xXKslUVETPJ3Lb3O34KKVarzdJShB
	Eu3yDFq4OD3yidOU9lPBLKdgcGCMqi+zbJ1EJzXL5STySjnheDkmk6CrhB/+A38fiiy8NUBnSfg
	r0Rh0qc9AvKgvybciu4j1K5FcOip/UfL8SuRHp+yCw3DLOUxS9hKHQde/U/FCH6wMMhPE2HPuhd
	CiTHbKf1o0KvmLM1YRyDvA9phj0RndcCpY317h6ayheqd/ww==
X-Received: by 2002:a05:6102:529:b0:6cf:2b61:3fa9 with SMTP id ada2fe7eead31-700359f5a86mr6477774137.10.1781097999515;
        Wed, 10 Jun 2026 06:26:39 -0700 (PDT)
X-Received: by 2002:a05:6102:529:b0:6cf:2b61:3fa9 with SMTP id ada2fe7eead31-700359f5a86mr6477740137.10.1781097998994;
        Wed, 10 Jun 2026 06:26:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97afbasm5570958e87.50.2026.06.10.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:26:36 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:26:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, hverkuil@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: venus: fix payload size returned by
 parse_caps() and parse_alloc_mode()
Message-ID: <td2t7blr46ltikytckufcqpdwg73ycgepqjc2pvekycp7o765i@b7yyvw2fn424>
References: <20260610125655.10517-1-med08elkadiri@gmail.com>
 <20260610125655.10517-2-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610125655.10517-2-med08elkadiri@gmail.com>
X-Proofpoint-ORIG-GUID: Q2kcdv-7tBc5JyBDAVNa0sK327IJilW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOCBTYWx0ZWRfX/LybYotLTiSk
 62uR1DgO0+Xw3EEwfgvmgoraXAeJCYSFa81PzPtrXRUFyNO7IW56sMumXyzVXjGmSHaEGxN6gH2
 6mB3aeLxusG3F3OdkVaDXNr0YwaiIflp/5Eysd0tjS4PojJ8fKU3P5wFfTswXJ3DstlTwsYCw/J
 9LG6qaUNxn4S3CevVUnOGVgLakGuPGnj7atZHQnsnQs2/1aHYTRFcT9+2BIBSUQarQfd8ultvd3
 jfLZA2vBxS8Yao8hH4FvnrHiSvL8zg3owKSwYcK72tQtulpLL/ZCPsKlDrckapFhrWgnM5aaBRk
 CE1NWTtiDY9pPWXD9IKM13iLosl8xasKmNIlSKwpwTm/4T7hLnUThN0/OGPZ3xF07JkBT7LV7vT
 mg4w1hk9w2YNJ1DcZ7dfvndGAQKcs7tjnihAll066eM1cNQMjkEP0Wzfk5wyGY63e5/xllC5Ao2
 P+ec2kd/adVo4G9pHag==
X-Proofpoint-GUID: Q2kcdv-7tBc5JyBDAVNa0sK327IJilW0
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296610 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yqHQtdB_UFgTmeLkYVgA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112471-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,b7yyvw2fn424:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: E2D72669C57

On Wed, Jun 10, 2026 at 01:56:54PM +0100, Mohammed EL Kadiri wrote:
> parse_caps() and parse_alloc_mode() return only the size of their fixed
> header fields, excluding the flexible array payload. hfi_parser() uses
> this return value to advance through the firmware response buffer, so
> underreporting causes parser desynchronization.
> 
> Return the full consumed size (header + entries), matching the correct
> pattern used by parse_profile_level().
> 
> Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

