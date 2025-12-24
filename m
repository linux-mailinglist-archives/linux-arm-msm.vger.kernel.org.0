Return-Path: <linux-arm-msm+bounces-86573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0FBCDC2EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2234E3026524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D872F616C;
	Wed, 24 Dec 2025 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB9M1Jno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBxPBVLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29563212FAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578714; cv=none; b=mnaMnFXcPKdwDGXcRzcNB1wVdRhtccCZ3/t1swFqmRrfev2tFIpouT2ywQA0Mgov3N2iUMvib24yXhU04t4OEhwHA6Srp70aLb6SNEM/PzZ7Doq8loaFrVuOUMLRpilFguZ2QdA9wzlJXADKvYfXsL69KVV+qYRWv4qIJ6GqPhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578714; c=relaxed/simple;
	bh=RttoDVm9rbZDYU1m0ZuqxRkI4kjTd/WOmlXmr4PvGC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htTISL3CPpctDmUZDsc2e320sUdfzZUs5BEZl48pfjMqEQe8oH5rQ9rwLCvPGpiRrwj1eZSkpZdY+OxUsbo9S1vdOWWJmYIOri6jYRoJs9Hd6Z5mw0KWDjENSZMabb0lafZfrvmnDV994NIpVqncmRNIRbLt2fQkAL2Fxld3Pq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kB9M1Jno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBxPBVLH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3AS2B913445
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKI8QVztLgm/VTUggHqWkOdu
	mvv03Az0PJtQAcYfPWc=; b=kB9M1Jno4ggr+1Mt8zQ6HBEzDZHsASRLi7te1e76
	AZjT0U9s0PyTQffp7b42YQLC2sW6mw3XirwSBcwaTSvis736uq5raYVEs4lziN1A
	T+HnzqBRfh3B/vns/eVqvINhDrD1e5d/p7Mmf5Qz4HfuqcyUwn8pgvSwug3mLsKh
	c2IHbDt+MIGl/qvuOuNbzdOZQiZGXQQaPXuZncbVnJvdocKy/go5KVKKrRZOwUW8
	eeC+mD2vduk1AYHO+zkn4PP1zDrsxoVQuI5H8cuCKbsi59+eccovt1lTzDI5MM+7
	WpW6IjxhZ+ceXTfjK6uFNpEXWge6++UteYcoFxCSHgtJDg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k5sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:18:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f62c9ab4aso4790077241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766578710; x=1767183510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKI8QVztLgm/VTUggHqWkOdumvv03Az0PJtQAcYfPWc=;
        b=CBxPBVLHuHlssJigFe9+0p/MWTpFo1sPUygq9gKNA6MkLxVY6ZIXj+MkUI2N+QyYpR
         7/XuZwB/+bOAl1io7DL/DJV/BBNON3y3bgb4qc0g2YhXHnoV2xlOVqbi099OOoZjLD8B
         o+N40dE6TP9ELSbMQQ7079+61ZUGdIGBssGLvCKJRyxycVFGFu/eG+qmOpMJuIKq0VbS
         TbmYOmb5Qa13J4ANfFbNwM9bWTzqrPSUSQDNdsFYmCQZgi414IknvNvXnCuemyr2H+Ue
         +2A7dhVjFRl4imsDZeXyCo3cLrbgUCeFkJOqIrxSnPcPwoU+17f2dyh2YkuxlebObu8w
         7lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578710; x=1767183510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKI8QVztLgm/VTUggHqWkOdumvv03Az0PJtQAcYfPWc=;
        b=lkiWXPK3fg3MNruZvT+ZkoPX+K2WmMgmHBvRAlzlvPf4rhBpt5cplzebAk9AZhivC4
         wtECTMSTk3mMFMw9zRBhuezO+yjeY3bIqlQriCbO13qkKbvAm39rZZKieVz1Takoy7Yf
         9dyKQBgru92F1T34yHlKj5/50jyyJd8V+iJUZzBhfRQUsV6UFmpJpSSKYYf1ratuV0Is
         NHme8i9f6PnkO5ORP1Cq8xOWtOGL5aedDA50AEFgTxG2S8XD8PpgwgNSbDOz9Y0FiWqf
         Y+jnAu+cEwHp57oDzhtZcO3pCZnSZQioffhiYt3y8C51lDB0XjH9Isy4beICPtrKRiaM
         bUPg==
X-Forwarded-Encrypted: i=1; AJvYcCWF18JbAG5jOlqentJ6pNK7UD6OrIRveoIchl8jvSl9U66rEdGNIDLbymWu87GP7kWaeg2V0ai/CtJvYFrX@vger.kernel.org
X-Gm-Message-State: AOJu0YxEO+S99GEAm8EvedOwRCSqDs8AYgOmyMsCILIQRcHD+2rDvHSB
	22pdEXuBw++RP4RluSQPUEQ1qPlhstms4GyqJFz31Imdcu3xWfDxdcZr2eDA14cfXauQd9jpY8n
	7LTemQCRO+gHaJAHlODl6MDBro0aYuEZkGFirGqojc1PbmIwevYVB45qgma60XNnyqA7S
X-Gm-Gg: AY/fxX7RKdBZEKN1jLukukySQlg/Du/8/1sa0j86BpgmMQwoEupL3cC5Xh8yNoy6OUd
	GPg+cP8Pp1iLiXZbmH34dGMKDRimn4mowcCnDjKXtm6COwtdCcThtRgNJMyjMAweRT3+JDHR3Ix
	wTOVLqGq7kMGG8fmNeqj3wDdKj/ARu87aOqjo19wbgoCopZ+8l0mvdGMRLUQxvTqlzG+ORPcEnY
	1HQlb6sUXCtxF0Fs5oW//rjuBJa2eZ+K1JM7OjXHivYyplSrC85/mt29V2p8uwuqVrn6GMFCk2w
	OVu0eKywXNMtajsQ5CsLpTsKMoznubPccFuOPI1B7cJ/xyJDyDIE1zT58UEoi/G2R0X3klXGx1n
	HVYV4loeKq1MgJVJlOboD+Tib8Ywefo8JN+JHkHcRl5E/m016HFWPiE56OYOY3AGHpdA5rmtOBl
	//WSIHJZskp+H2IbYTgReP9ys=
X-Received: by 2002:a05:6102:9d6:b0:5dd:85b8:d82b with SMTP id ada2fe7eead31-5eb1a67d474mr5554696137.14.1766578709989;
        Wed, 24 Dec 2025 04:18:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHiwFoU6VDGIWYRpV1cCuR3GUum+5cqV36N0kvTseaZzfOA1lWmDijjG9KtgAAiCj+X0GS5w==
X-Received: by 2002:a05:6102:9d6:b0:5dd:85b8:d82b with SMTP id ada2fe7eead31-5eb1a67d474mr5554692137.14.1766578709538;
        Wed, 24 Dec 2025 04:18:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de6eesm44436181fa.6.2025.12.24.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:18:28 -0800 (PST)
Date: Wed, 24 Dec 2025 14:18:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <oizhtyik43eyaixepugzndv53kn23tqsvxxwhjtiewbignqd4t@kyhnf2ttyomk>
References: <20251130012834.142585-2-veyga@veygax.dev>
 <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
 <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX3PITc7WFNUT/
 +637AapVGVslh3ea4tRx7rvNVfpMry5Gi+tqeJaIV8DlfKUB+Bdk70bINu6pJUXnaCHID0ktiqb
 55pEBO5SU1Co3Vos977sp5ZDbrpbFDoS8KjdZjZYAVTIiqflFIHeh4zRLz9cCIMk1mTFlDNptvY
 0TIzL3Ixgi2Dbj2+CiY7p/Not6o/wlniZxGXOjEig/sGCif9INDT1hp/fWMJ1jpc00mVsVM6H8W
 65THs7B5hzcS6V06YPIJIxdzZ+NcyiYO/T/PX2NFiL55DYQ242Jmoi3JMw8ycFlTYe/IcKHaAHB
 rTI37cRlp2ipTk1Hw9dU+2uG8ln9K8zYbpW6PJM1ixLAL7X/nrrZOAxdhjZWcAao6ugqrHDVeCT
 yeDSWAUxyPFpP6SO5PibEF4BnhJ1ngT58jDs6QIdQQswIyUtVJvW/WhE+0FEAyDrXqGQuWLeI57
 XeWvJWwx4fG+3+o0dfg==
X-Proofpoint-GUID: ljMB4-TtPpoLIdSv9HuYnp7HBsMc4dfQ
X-Proofpoint-ORIG-GUID: ljMB4-TtPpoLIdSv9HuYnp7HBsMc4dfQ
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bda16 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=pwWpIS086ldQWxGsuL0A:9 a=CjuIK1q_8ugA:10 a=Qzt0FRFQUfIA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:07:29PM +0000, veygax wrote:
> On 24/12/2025 09:27, Dmitry Baryshkov wrote:
> > [1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
> >       https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382
> 
> Hi Dmitry,
> 
> Apologies but I've just noticed that I signed-off with my screen name
> instead of my real name. Would you like me to submit a patch V2 fixing this?

And I didn't notice it... Yes, please, send v2.

-- 
With best wishes
Dmitry

