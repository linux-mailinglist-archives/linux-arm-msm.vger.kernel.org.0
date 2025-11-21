Return-Path: <linux-arm-msm+bounces-82840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DBC78FEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id BA7D22DAB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE39B29E11E;
	Fri, 21 Nov 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mT508ZRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWyfhlci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648F46BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727422; cv=none; b=og1ltXvPWaTdz1FPbeA5obAKZJaA/NZMCo5PLrf/R8arNOeTCEFXjsb7wyzAaVruBqt+svMa+bPtVqQeiK5mUGf7PHvm6h/b8ukJ2Od/nbXwP8lG1qA+ve1Yrw4Zr5Wa5FCw9Wn/VoHZ+kdPp1nXdVHwFrhhO/FxDkl2+X9HX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727422; c=relaxed/simple;
	bh=FqNTIVaqJr2eN/W1bQX6Jk44J3Bq6cqUQY2BiOC7CvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElPpiELg7zN+HNKNu3AdIL9i+gLNsv8d5GUNmE3NRBEVX/KJaqXD8eS1BkbpZan1RwJEq71SK8YCkTybPrl5MzoJXKuAE4DewRXfa8Iom9xYpzAps6oSF+AMgBpUWwe+lSDPwPqBNqLeqiQ4clPGWMXvHywsZH1fpvkldU8JWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mT508ZRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWyfhlci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8YwXd3139698
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QaNnVLYnlnRhWIm4jNcLz6mZ
	ygcebyyLlqzwUaRtrnI=; b=mT508ZRsNRTqr8DnFSkjCZTkAd4GvUBjLQDw99zg
	Tjsl919tISAJp86joL1PZInJ6CpdjjXMNTmeRjMC3rETaklabmdoLekmgOiMP750
	SzQYbWukdIQ2Ow2mlpnuXZwTxS7IqgzgUAwzV9i275tS7T1FJ1/kkEt/DPeRyLCK
	jXbkZGSnyHo2KlZL4faVNA13LX8EmH6ADe9wF9mZ/2Chud4Cbw/OlLcN3UnBA1Dd
	b7mKe9ajPbvRh+vZgpPueE7FcyJd+8QtjamxyDt0kc+8hb/LCgBbmGOPHEz8YYRU
	OnIVAkpHyFS7v7/VluOvAdCeD8K1S3BSGC8g1ROmaukgOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgtxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:16:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991a54so77854526d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763727418; x=1764332218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaNnVLYnlnRhWIm4jNcLz6mZygcebyyLlqzwUaRtrnI=;
        b=XWyfhlciIUtNWiI1rN9RJPlfoIPgUuWxt1lS3MldllWQOoWnoewuqnJ6miHm5Ls1gG
         F8oj441gJ6aNCeL9rrgctSMCaKzP6lmnzH+lW2fj992yR8Q8GYxyDl07G/1Ryjit4iSX
         fBPQIvaovMQWqU2PlFNqTTSktgEeeJWyIih2ZnFceg84Axu3jExdpboDLEh/ZxINtEvE
         el5D8grJ0EFZeIqSKxGYTNwIQBV7TwO8L2IWWOVLG5hcBttRs3aLMFQ1fQ0juJGJz9wq
         QRk5bAuKghoAtqmiCJQ2PqdoD8vWYRy9eDxIkAgyI4xf7GykLxLh8C+GY287MyXFmJ+N
         knKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763727418; x=1764332218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaNnVLYnlnRhWIm4jNcLz6mZygcebyyLlqzwUaRtrnI=;
        b=Ul90dNT6UEorw7PGppyvEiSkl9wIzvjDGChdNl1yAXiQYWdPSq1e4vG/PksGUKSffR
         O+ksWfkTUWEaU9X/KuZc6d7pX0IdVjgdh1YEtRsaHNNhAEeQRqzFRffxIJk6v+M4OXqL
         X4/JX1bXy9VWZpTwygveGjtRw5exTyQJ5r9VvyJBjNcWasI0ljrT2WUDRuEBWcWu5dGx
         dALEhzz8RgC5KXBHxpC/fFFVc7hHpJEbMEz7hqm5C0DJS3bbXPUweo+M6PTY8E5tOyOM
         ZXSsh0i36iJ8JIU8FJWfqimGiFz8AhLmBtBvA2QPy7lKO5Sf1303IlVSOn7uvMMAUN9U
         9PSA==
X-Forwarded-Encrypted: i=1; AJvYcCXpa+vxw/c5P5pAuk7nYlbo62ufS8U4S0W9Jv0qS2RUdYvuT/RHm1uKlbHEI1Sy8EcCTzYxr0IDaQGuPjms@vger.kernel.org
X-Gm-Message-State: AOJu0YyR4GOQV0IbTXJ3pn8aLcdoEE+d8iNetg53tIwFo544bjNSKhxo
	MdQZ8BpnmqnGfUQd9a50okQNQWRCBKO5ALbjugSwNxXPcPA6urlNYInwD7ydyFlEDp3K3s5ioht
	ydh1rqP6D4GYLaQ2rcgq2rfWBV1ZL/YR5YGBQ9wwxEDBqxug57LSwpuJNOSm4gjR5ufsH
X-Gm-Gg: ASbGncuD/kics9Efi/d8oOkYkjNv3NwMX26C+g/M7J3u6A3py/522qMGO36uaM+YLvn
	zmB4ST56Y8pinP3SQPYNtECsg+AHjI++J5TqU8KMk1BJTh0VMPzyiepiI5JZiyk8kFCcYogVcLK
	uIHmzXhy9Kl6EJtwSEgQLPOBFlJ7+F7j+lcvvPGVSz29YR6CpihYamd+sZicUFICUIkt0V8aUqR
	xk8TaUcPiYb2d3WyTggYS+9pnYWgXMyB3FRxZKsasfRCtQCzZ5Std5ouERnO/6wvwsGdh/xnN/X
	vw7OKKPQEDe5MuWtdcZwDp9MHRfTTIRALbur0F6nupabeL+XNuBZPeQU6zFPZW9qjkeQysc5jIi
	+6wIv+JuU5iNExSFMif5Z73QGgmQHYO/HXiuyWP+ZVkiR867OIBr9ykmaaj6G//NAYv1lWooaa7
	tu/3ncEaqWtqypODEYpFKfm3I=
X-Received: by 2002:ad4:4ea6:0:b0:86a:7c95:126f with SMTP id 6a1803df08f44-8847c4c7de0mr27551446d6.27.1763727418531;
        Fri, 21 Nov 2025 04:16:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUoX/mjzI1b4o1ytqdR+jI1yLiJw/zVz9VwmNQMbCqUbuv4Gu6bPjAqN2mH2X/VzpmYNsHKQ==
X-Received: by 2002:ad4:4ea6:0:b0:86a:7c95:126f with SMTP id 6a1803df08f44-8847c4c7de0mr27551126d6.27.1763727418121;
        Fri, 21 Nov 2025 04:16:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6a9fb2dsm10503991fa.0.2025.11.21.04.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:16:57 -0800 (PST)
Date: Fri, 21 Nov 2025 14:16:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Proofpoint-ORIG-GUID: _2D2-a5MQntWOCJkCDiP7yZ67p4Y4anL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MiBTYWx0ZWRfXw+0MGJx2lB3H
 PGT+FwItDvB3h2IL9m+TOQYMfVnj9yDDKAcz1qt0UE/93tRSEUgp7sVDNVhY3xxbq5E8vGlDTxz
 fhH+xuy3MmiyK7D7Iscz1k/Q3ZrZypce3EtR6l/vu4uADvl25MLO8ocNUXYZhCqBmXr3BtVmh3b
 QPURb/7mvwgLiowzgqkRBq8DrCPWfWCUN6rKKbzV44gfbl6v7gh1EMB82m7XeDS7TAQvrDivYeB
 vB40oZgIR5g22tvrYpMEQo6lL8LpnJf2zH1S8QZUSrLvIOoycv6DIxgurDSGTKAGDQ3TktefPI3
 W/a3v7ZNsU1xq0jJhQ5XZfPSTnR3wYWruHRPcI/NFkAa9bIam5KkrIryYgd+7H9+KXDCu6cx9hx
 f4hkDKrVdKnECQT+yaXQNFNZMxdsNg==
X-Proofpoint-GUID: _2D2-a5MQntWOCJkCDiP7yZ67p4Y4anL
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6920583b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=Weq4iwZbzhTgL2Q6ZfAA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210092

On Fri, Nov 21, 2025 at 02:02:08PM +0800, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
> Changes in v2:
> - Corrected commit message suggested by Dmitry Baryshkov.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

