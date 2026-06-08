Return-Path: <linux-arm-msm+bounces-111684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3nAmKQxdJmrlVQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:11:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 975166530E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:11:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XOuYTKdD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Nt3PKXfW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111684-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111684-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 997A03002D24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A108F386439;
	Mon,  8 Jun 2026 06:11:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821E3793BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:11:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899076; cv=none; b=aoXka7AVy4XvJvet3vi8qk4ygxOi0/jrvhLYhNGWp4aQpffhBQchW4ovTrdl0kYpPp0DUNv5YErlC1PoYN9fiKAjBRAba3qA/WopZHsGD+rpk263Zus/3EADzkUBk4Dz5QBKzKtPLlQDiYDOFtRcusoYMnBR1y8GVSAW9B1De4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899076; c=relaxed/simple;
	bh=DLOqMLZZMTVQzwhk8/COWvbpn0F1ywMoIoal5ntCvw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Msx6pK0JIAlTiHoP/XvB31hlvrS94l2vHHENugprvxsTlpTsNdF8uWJPbzv+vzu0fBDmnmfS136szNebP06Z9pqMr+p+fscPmr9NdtafJeAQYkvBZbXQTAYkpbpc1Z+XEDQmIfOEKOwcB9kmtxnEY3O41Pn44HlrTYp9TKQki4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOuYTKdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nt3PKXfW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GgP32027783
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zl/gOSwq/zJx2zMCoSWpfKLD
	oa29+U0nv8eXcgWpFDc=; b=XOuYTKdDQILkohl4FW7OdfjqMyyh201CrXzLPbby
	bIx0NgRKEC1GIerHteRUryoPmC9MLffwm6AXzvCdEJGB0UonbMGnZKLQwonkRq9C
	koCsPYjRSB45vMI51K+BW1c2P+4yJyBEPZMoikPkrz70XBvaLN1g+BTUa239rK60
	b4mBuRm0NQP4Gx9ZdkWC0SVOp9L5Lc026Wm7orpE334ycotsevx+mNTggrzFsOUo
	oueBTEPpBiVCy4dAPRk73RPVzQCYsNdrj6YZ8kNPF3yFAdDmLCcovl7fVhgA2Ro0
	slcqFisG0oLu3rxhd94j6TLNlDiHrEE09+dhCVoy4fmX7g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xg78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:11:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7e5ac48so4477763241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899073; x=1781503873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zl/gOSwq/zJx2zMCoSWpfKLDoa29+U0nv8eXcgWpFDc=;
        b=Nt3PKXfWzYFGbM5wKdyLQWkdJzgLIzHMZomSTllhl/3ihgdev7pHBn7dETw9CmFBzL
         9eObU7E1+XuQF+p8xZXVwheYF2yKfVSRnpENxjfjq8tCrXy9WpY7meNaCjCMlnavrwBH
         ERgiqa1KLJHloWwqIY86kRNVwoToQuomwpUDVoxMzbzCNO+MQbsm6Q9/N8zMwT/QZJeG
         GimnCesL3TXA0+FgqxuXXJTLEfY80efcxiM1dn7Heea7f/osh0fLceCfba3M5mkAVmVg
         EiDlIN+DjxUN+eGYIT5woAfObq90Cn3mpUFt52l7f7TBWqNXTOjJ+nG4XPHY/qjoyyt3
         /wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899073; x=1781503873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zl/gOSwq/zJx2zMCoSWpfKLDoa29+U0nv8eXcgWpFDc=;
        b=AR7OHwfz8lFCxhNQ/MEXUEW5wLvLIfIyoSP8umfYMaZmZ2clmJndX/stpzVGcdjAA9
         iy7DNEk5xGBcYBgzWLHBAtlEywGug6gIQha2R8w5ke3gGSpLugFIe7unPEairncnVR/A
         dVfo4MQl5OOfmdoijbNjfg/KaK773zXqSopOvrPiA4ro4SITIttXtxa//ljeulDmCoQp
         k8oFy7e0IyVeelkc7l7u/7ta+2YUkmhhk/LshBQzqewuIDBTJUk3Q3tVHkdLs2JCD/aT
         oqc9JzUyFCLSXXOHhkIR+rx69PX1GRBTHRHUdIfk0J3cNE9PMXmd2Y1td4+jCcO3iLqG
         3tdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9h6RJ22YJR5mj6sc611ykhbb+8vCd5MvKJr6Bj2kCvEJ03tBItOt3FfhCDmuxuUKZlFXGOIafuY+sORxZi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnvqkbk+gBWy66rDW/qbD/AU5PKEVqXpgUUr/zD1d+vKYEdV3b
	4oHfozaBDh3GScxUvgXjpTreXzuHMsgQKe7pT1gS/uTlwQ5UtNp873lPJhvJFMYL+q8F6bG+oJ9
	94YSHyr7ivZLJJKjx7YfZVK6wCCEmLYvPTSpv3zgLeDDQ5zLsrCBTICazvt4uvDczRElC
X-Gm-Gg: Acq92OEst9eK9DFPsa1pwuk+0zoLy0i2iHfUPTsiLO6k3TJLZiOCZ1sBXMIUNEXD6h/
	H8hEN3boeBnqO4AuL73tLfB01OhVs2g41c3MWs/1Vh3z9sAhf+WAtAq2DPN3U83yaMozae1YxhP
	p0AXSYO34W645pn6jLREPcuK66+HHPObBe3caRSjeF5+ll+FVRCdqenEgae6rrShxv9BMXqmE+L
	UvlIwGTSrV4RaZwDj4MRcaDr94s517Cm1cTHLPnZQ3ZeS0CjESBxVHzl7AvvGnUH30DZpHHqTUk
	Dida/IN3fsf5IaBD+qXyqmvCht36UnyaAacYaOKTBM6Xtnc8Hw2ygV5/Spo036bkPu9NQxRI23b
	+rDhUHGTEzRa1CmvPG0x6aczNW/QkA1+od05knVJ0/WE2qjBl7byikfqpJM5bTZEWvN/KUkI5EA
	JuNIJ+C7UNpYWtEExhGeVxSYDtq0n51KkHJzcchEl71msUIQ==
X-Received: by 2002:a05:6102:8001:b0:618:442a:9e76 with SMTP id ada2fe7eead31-6feff813ee1mr6808975137.10.1780899073264;
        Sun, 07 Jun 2026 23:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8001:b0:618:442a:9e76 with SMTP id ada2fe7eead31-6feff813ee1mr6808964137.10.1780899072865;
        Sun, 07 Jun 2026 23:11:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm3559059e87.1.2026.06.07.23.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:11:11 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:11:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v7 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
Message-ID: <bcm2eufawifaq65i5qlqmbam4wtv2du5re6c54tiamdbynmras@lbfd44kjb6da>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-4-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602071750.526-4-jianping.li@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lwvr4bocuHftuAXlsFj99qEGrBOBtKop
X-Proofpoint-GUID: lwvr4bocuHftuAXlsFj99qEGrBOBtKop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NCBTYWx0ZWRfX6T8XtKmoKUi3
 pz5WpLPLLnIrUAFZZeW7657dOjtTLkbTPZ7++SdzLhCXeliWDdjdf3joTGRdSPN5s6nR18iqx47
 KBBWXVmM9t/hfQmZ8TCgBgRm/LKv646rBmBYpuUxBW0iskVxetOobKWzfJ/63MV8+moulgn67J6
 yjKi/UMQLhemllh/+vFrnl7wX3ZdGc8nsw1jWhbdkigYQBzKK/KWV27iX6yIni5P7epLouY0Nwk
 L8+A52uVvfUipcY6rd1wD5U3hLljQ8qIkJPX8MKxwQPHMf4RuPtS4hYfv4lMm9RetfEShGH+ACm
 nQX1tnXtvdfn07domfGUc0qOtsNyySkmnqf5OixR071SCpUBJPLRtgXSpJLAVRh234pZdeRWeZb
 ZiTJs3F6KMZxzmcoEyaqHaL+Mc9tkwa6teRo4Xlnu/hQQp29S1eT4lg99GTZE71J8k4a8lI7BvT
 zJWelmFqPIGbkv/IJ4Q==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a265d01 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t-0ExjSqTYZ73aSqprYA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111684-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,lbfd44kjb6da:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 975166530E5

On Tue, Jun 02, 2026 at 03:17:48PM +0800, Jianping Li wrote:
> Audio PD static process creation assumes that a reserved-memory
> region is defined in DT and exposed via cctx->remote_heap.
> 
> If reserved-memory is missing or incomplete, the driver may pass
> invalid address/size information to the DSP, leading to undefined
> behavior or crashes.
> 
> Add explicit validation for remote_heap presence and size before
> sending the memory to DSP, and fail early if the configuration is
> invalid.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a8a58f889d07..f46a8f53970d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	} inbuf;
>  	u32 sc;
>  
> +	if (!fl->cctx->remote_heap ||
> +	    !fl->cctx->remote_heap->dma_addr ||
> +	    !fl->cctx->remote_heap->size) {
> +		err = -ENOMEM;
> +		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");
> +		return err;
> +	}

Won't this check without the next commit break the kernel? I don't see
where else the remote heap is being allocated.

>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

