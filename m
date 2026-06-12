Return-Path: <linux-arm-msm+bounces-112835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1yybM4hWK2oF7QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:44:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C862A675FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:44:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j2I0MUH6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=REYCB3i5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B721930028D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC22521CC71;
	Fri, 12 Jun 2026 00:44:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9785A26FA7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:44:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225090; cv=none; b=VcM/FIyv69Wm7cYZRPGHGGLTko+uoe/OxOQy4hYC15uPrdyo/IqOkxtERQp89ip1yUmi48aPUw5G/sFn9Gm9emaA7xbRpU840r+TC30o6itKuhdyZtkwjo6v+T2rbhXam2zyYlIlkkF+DydAsghYKiY7VlFm6opPV/lsgz6pHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225090; c=relaxed/simple;
	bh=eRS6todM9tp8YCwfvNbFU1QWfAsmfPpPXV+1b+hwENg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHp7Gpf6v7E8iPbIgX8PifDFqD1B0JZX5m4/u9i42U8bUBeBiB9eZW2lmWNmH/P0GT/62eLhdnKptimIVZhq7SwWZGvblydo0Bt0kMZLHeLgWDohnJJpG5dfT5zzNj6v9uanphcfg4wnCECExJHceV3wTEFWgSiRpubZ8WyyFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2I0MUH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REYCB3i5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSo6a1892202
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R0LBBiuMgyGLR9JG6+0kFaVb
	NWMsmymTjQMdc9kPM6M=; b=j2I0MUH6sVMR8aZ6CWRRzTbdYXCS9Tu6wX4fZzOK
	LyDuPjJpcjKZFXyzgsbUDCtBtBQ5zOzN0qr+foZJU+7d9vpCt1NWL9ndS6LdIUPN
	CSg39rqU+eEzUn0t5UM7sNd4JCXkz8BvuwBWHxvpxaA5+imISLB7SLxUNi8dfV++
	aRQrSt6Q75pkLpHkrIpPqXOlpbYl8m9bLjLt/37DOGC10CwQOcGvhtuw3Jkh3LTm
	jpNAABL3W3pzhbeg8KOJf2C7KtjQOv33wJ9QdSG9gdtSErzFY+t4gRDq0zQPcYmh
	sFShYybSsitpJB9cs95k/dgiko3Ta/aCffCqAypKQ4c24A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5s49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:44:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177bddf6e0so10021731cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781225088; x=1781829888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0LBBiuMgyGLR9JG6+0kFaVbNWMsmymTjQMdc9kPM6M=;
        b=REYCB3i5t8lNpkCddMFcunFlr0uXwYteYZODDIbvgkwXITOhBufwTGsu+a05ybuP+b
         cAHowFk5n2LUCKF/jVzPmuupNqVXzVIFHMqkLa5RWKM/qEdbfwB2zTeJMioJ1zzdyAca
         wQJfHLaWCEh3vcDkrOVSkEh46oA0qEOLO7cZgJONJEZ+A0wCnTr32GdxhHtnjyN86nn+
         wpcJRb6udu3f4mX8lJcz/NHgZcC/A4ZqSkuR0aRweK9dR9FSzuzJQ0E4055Z9zWNVdw3
         K6/DoVj4IACqAWAlXPBtZCLRfx/ozSQOvqdEZVcKB5rZopKtvLedm8M/XE7buLdbyzma
         ASoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781225088; x=1781829888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0LBBiuMgyGLR9JG6+0kFaVbNWMsmymTjQMdc9kPM6M=;
        b=j2RXHZAfgzEMy2dVQTbVlNXFqQjMUUjbbG3Szhw1dHwx9v3f5splzBruy/hcGENoic
         4jXwIZGPYQ5RUkEghGwCRfKo1DIifoysoURAGu9UGUg2epYSaNMJSKEnmAYoGR7JWEvV
         dEnLgsMtK3IUyVg1BYNHePfbAHXhh3R5zkWIh5YnU51woDTjjzLo+7lmISIRYbaT5k6D
         LwSRbBcKuNN1K1+SnKjYMMDHUg9IeghSZpxtt89ZnpeDHopQ1pj6ZcL+bpJY1ek3/j3O
         Xqx+8mgr8N1c9c/rHt99F0DSLY9WK7KpgC8iH2SzqlXf/pdXiR84E2L+fd5xEo9A9J9R
         SOIA==
X-Forwarded-Encrypted: i=1; AFNElJ/E4EaIDePfnGV+SMS2Ixvmaa1SbxCsq0UJLvFgUN3vuBEM4evoqP94HbRT5WoIx/1DU3/OF1m9KrSabtPU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk87kK0im7D06tiDov/Agd782WQVfw9vi4q8+jJ2TflsvzOdcQ
	+jQhJ+fZ90Zifv+gNJXymM5oMtQ3rSqw1DGdzbzdkJKYdQE5uER0W08qQscHp6/bxt9mB+J5bEU
	F/rz4DvZm1PznxXihk4Q69PyQUcLGv5KIuLmDQVbh1cIbM82IWnu+9DVAEZZFNe/Z4P+l
X-Gm-Gg: Acq92OHcG/6766t7UsBds45u9HsANrT7BT42lE+IzIGq8B420evCi+VgncK8Tq9FaiC
	fJZGi1w/3crxgfNuOtp6eqeRDkm1Ck7Kvmat9KqJDF5szBXfMIa9FRAGCpR0vlukMfLdPHmQBWv
	qqk5I77Jik5LCKkSTpD8IyGfZZCKC8k2OjLMD8Otdm6V4IWFYqu52SoavH4oSfc6nmgNx5/T77H
	mpAEdRCG+E4N7WAEJfkz4HFUh7RohXEn6fZd7Ec5nWvUH6M9KA+0RN/yrRBGgVbufLeNDr7W4ZL
	8LjB7xjB3tXbZ9/irDYmAnamFg2w++2kMq3pOChVNh+sEoBbO+ZCPIJ2AsDBLx4gAYmHpSB9CVw
	ozqxoJDDrZ6KxPewqgp7GCyL4v2YLNtHez/KjTpffC3slbhXGBZMuC8UGkvu0zMwL3Zzle/aWCq
	VApKIDTTB5LXG4qkvec4e5tSZQqOJ7kQOAw6E=
X-Received: by 2002:a05:622a:14c8:b0:517:63df:91a5 with SMTP id d75a77b69052e-517fbe61a18mr15595871cf.19.1781225087953;
        Thu, 11 Jun 2026 17:44:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:517:63df:91a5 with SMTP id d75a77b69052e-517fbe61a18mr15595611cf.19.1781225087547;
        Thu, 11 Jun 2026 17:44:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a729fsm60822e87.54.2026.06.11.17.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:44:45 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:44:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eddie Lin <eddie.lin@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
Message-ID: <tiug7vw6ozzel3oed62qzogcjxo36h5vfy2d7xwlfqjecqptuv@m35i37kapu7s>
References: <20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZeZJWTopcf-rzUazfTIlejN6vW4WQmJ1
X-Proofpoint-GUID: ZeZJWTopcf-rzUazfTIlejN6vW4WQmJ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwNCBTYWx0ZWRfX56vSVmbeOfeT
 iJXEhSBUs8T0ZM3oAGMDe6kHornOyVvbTgEZjKfQH40zFDH1U+lly8pzyOBy6caM+hkTNxEta/d
 sY4SS0WweBSWLqBechyV8yCam3eoJzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwNCBTYWx0ZWRfX7TlQhHHKf60g
 sdS26fH9MvqrbinsxF8ouvP/AFHTM/XMFcWYChP+owGVGXkj3BuJmsQwUvfVf6G97JPeGOKeFlS
 /fW7yaN9g0muxm4YHI+/20vlDfERfjFF0JOLYFGWq35+FZFVShUn4UXOWML7mymEczXrWQYRLC/
 JKw5AsvwIsAbMv3tVaxiW17KRoAFVpHf9ar9soh7P6ipOMS8I3TO/xAHfPHE9VxUpyjCS3dSS1b
 3gVvtgVEXzc5C2+7s/5gUI0XIo+E8IEBXRPuIqnU/3NiEj6SDVi11H7MJasWMlVu0Ar/PQtAQcF
 cN3NTfka1nSnDmK6GR9UzSAKif8GALiL7aFjYSqdC8U5BxN5EIrOSkAKXHm+LCOkgqNoUrb6hJ2
 SvYpvkqbNe0rmDawHWva+Wb8XdpMmk+Am24vghLScJfifxsa389v/3q7JDSNob4QNeReOmaOKww
 l21FLyPE7PIEVrAusFA==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2b5680 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QzKQqk6toh7SdGiYyI4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,m35i37kapu7s:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:eddie.lin@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C862A675FC3

On Thu, Jun 11, 2026 at 02:21:44AM -0700, Eddie Lin wrote:
> The 'ctx_idr' is initialized but never destroyed when
> the channel context is freed, leading to a memory leak.
> Add idr_destroy() to properly clean up the IDR resources.
> 
> Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>

Missing Fixes and cc:stable.

> ---
> This patch series fixes a memory leak in the FastRPC driver.

It's a single patch, there is no series.

> The channel context's IDR was not being destroyed during cleanup.

Duplicate info.

> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a9b2ae44c06f..7727850e9240 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
>  
>  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
>  
> +	idr_destroy(&cctx->ctx_idr);
>  	kfree(cctx);
>  }
>  
> 
> ---
> base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
> change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
> 
> Best regards,
> --  
> Eddie Lin <eddie.lin@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

