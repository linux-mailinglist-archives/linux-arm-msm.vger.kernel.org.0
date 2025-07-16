Return-Path: <linux-arm-msm+bounces-65271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48121B078DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26DDD5663EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF9B266565;
	Wed, 16 Jul 2025 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENtc1zwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31106262FC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677993; cv=none; b=MkznRjfcipUxwIOAGQXK96U1DK/HwroYvPWLY91yqNEq0E3ZIxB3LTMH5f9xtZ9/24yAKoyYw96WrAAavFAvMVNjW13tlZZEUt/7OAeEvwf4nglz7ePh+WwAhszme9sT/dn4HIZfdr4ZzlmedUt8ZiI5LfH9oiHbH9b9MfkBUm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677993; c=relaxed/simple;
	bh=z1xOyLsQ2NEWMuv9agDhfAfh5K0V7Ewcvyd/GS0+6g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuOca9Z6fWPohUs03oY8YsMjQaTEnB/2az1gyMEx+czAIVsbcPHwt3mhiyNsTo5aN7FIonyjFGLQmrf+wZb0ZXIQ8Es+oyQm92uXBYnG1OLW16k6UKCCHb2n3jJWf/RjNo5vtnMEgxB2JYwH5C7eDkfUQWygdhlf6jU6E4NhCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENtc1zwP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1bBW031963
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WuGVsQmvruWGoUm+mN8dqEDE
	dXmWp9FBOHdzNsiopKc=; b=ENtc1zwP2CYrmFozXCdyLayBkERMsj2s/7G34aSN
	HyX4xgXLwHznVkN7gctFe2V1lOe199NQDClChQkb+lEj3ikyGQK2X82bWSx7jCdR
	1+qhvcZm4+lARKCBxmWYz/nuXwR44w5Vn50d6ToX8klOxuRp4M3KJOeo70GE6r1S
	1SRvikl6XdloQH/hP1jsavqiitAvMV0HAg3ebf8NI0XlqTwKW5BMPVZhNmIv0h8v
	/0XsIq6ZDhHxM6seeeZa4grmfKsEmL4FK+AsOo4inG6DNLU5DU4CQdDin2hb0uVJ
	VbMv7ZKhpx2q5agYS5IWmwuEjgA8UUHBsvMEg16yaKHYQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h4qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:59:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e269587d8eso597591285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677990; x=1753282790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuGVsQmvruWGoUm+mN8dqEDEdXmWp9FBOHdzNsiopKc=;
        b=gm6nX1xJy/ttvuIP9ALCIvGjwhWgRWm/o9yWvRfF3K20+ulbTrzv0myikcK7cKssIM
         +SAKPMaKKGI99B6B6/7ZWrrGWr5r6HukZ/30t+MoLm0TOI1Nz6R6BkvrTr6A8KHmiE05
         UGeNZvljq1E9ZZ1p5J7pDut3H0qNsS8H5DDI9CtECj1MOyXZ8IvXZ/pZC2Up06xJNg5a
         kVe989S5HlC6r8TG2Nmp4/riJIna5tMyAn10dHcDAO/ytNX9/TvKEUoLc6G32EzJndmp
         tc1az1Ms4OcE/QYhjlLC483QECuaJqzDDg5/z95SmqPyLwxGOSCDY4Y3et1A1LbxXYhD
         1oqg==
X-Forwarded-Encrypted: i=1; AJvYcCVhDqocZgBBAo36ELrUZG1JmL41WoU2SX3oCZ5/djwouyeD8Q0trFWBsknS246O7vG3B6QsplyJs8GikSj1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4oAKizlaNX8N7JsGJhv3EvAzgjPouuNfrzKOTAZhxYb0fFSjP
	NJbE3GIEyUzbwkJ1veT9FeAh7ECfJgQoKZUy4KMFS4WF35aWx0bF13Y0Tz1fHrIgwJjxUuDtGQg
	+o3d8UlJ1Mo9RmCyWswexorWyRa1Nsm9lLsMrNW9Grbs4bSNqykfQ4rF1ZCPw1s8+VQ83
X-Gm-Gg: ASbGncsv9aX7+TBIOhrERDAUqpp6rlHP/C1zqu77gpGexHOLy0ZWI58FihqtOYBIVdD
	Qy7o8yXwU4OkZh/cilCnc5InvkZSodYnC/QtigkyPc6g+NB30GCXmRoqBrchE6P/MCRA4Uk+pK/
	NSKZSDudAgMkrkNnC562wFip5hQQdcwuYaQu5fAuktGXnAieYvbqkni2pz3G67fuYkzTM2bBubE
	fJiq8QMSWTrq183nNaXDh9za2kd45XEvpkUAwC+iSc36+UcGdDYAG8F+3oqrKwvN3jOziViP+im
	HJa97qYjMhafDV9zJF+exgei7NOTRhZ78jrB7sufUoE6JmQKL1dCdJLtWFMzbXBFcX/wDu+/bJ/
	VAACSabeyBAceTcgje9gVdiUqCe87RraeLaOE2cqUGvLbP4xp3AZL
X-Received: by 2002:a05:620a:6501:b0:7e2:814c:1128 with SMTP id af79cd13be357-7e342aaaa08mr434965085a.18.1752677989755;
        Wed, 16 Jul 2025 07:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrHmKHxpa624AnnTtpLvo+zOY8qqGnIXbP2uifVTrJp40Mq8mYDsdHQz7DZhfYPOjT98n0og==
X-Received: by 2002:a05:620a:6501:b0:7e2:814c:1128 with SMTP id af79cd13be357-7e342aaaa08mr434958885a.18.1752677989068;
        Wed, 16 Jul 2025 07:59:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b635ecsm2658518e87.166.2025.07.16.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:59:48 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused
 bq27z561
Message-ID: <c6od65q2e6bnz6jxq65ox7burhjavjmooe3vq6nhhfq3ikglz7@4ufcxbjhp23o>
References: <20250716141041.24507-1-me@adomerle.pw>
 <20250716141041.24507-2-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716141041.24507-2-me@adomerle.pw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfX5C7ef5w9UsQf
 DkB9xu89Jhh6N1lnK67Q+pcO2VyG+qn7eyA7XM175sE51Ysl0e/qCgCGT2cthHslGhBBdUw6dcl
 /GQRyyT9ZrvP9HwpdAP4/q83Qa+ZW3x+M0gXqhaEa6/P5+ap7SqpWsZNFaTe8ooi4k0fu007Nlb
 28CLd/DQG/v8KXIK6NcrFjjEqLH4qkye+b//QPmVuX7cRJcYacGde/P6fpE+Jp4kFYWFcF4tb8n
 1DowNJzH8QT0RKbi0RrrmwwiNXIjDkmgYoKURRh0F1aZLlMVSabkzSU4Ye5q9XdRNlalDixckkp
 8F53qhWyx9IzKEQ7OwYcGgb96me4Hfq7qtxWF27dTtCT/SNxrZVW3YgIVXCjFjGdXRO/8D3dmHq
 YvEcfOr0n+vfNPd5urKdUHaHGpOuyQ+cGkGDEfFyH0xYmaHhTsbIMhi4KynJTq/96fSAHrZp
X-Proofpoint-GUID: PY88Rju4kTXTC3BisQjjRxoif0kmFcxt
X-Proofpoint-ORIG-GUID: PY88Rju4kTXTC3BisQjjRxoif0kmFcxt
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877be66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=9pW74NbYAAAA:8 a=EUspDBNiAAAA:8
 a=N_Z-4l7e5lD0AiT6xuMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=67o8LzlnqLyy2xoPAWJp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=874 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160135

On Wed, Jul 16, 2025 at 06:10:40PM +0400, Arseniy Velikanov wrote:
> It looks like the fuel gauge is not connected to the battery,
> it reports nonsense info. Downstream kernel uses pmic fg.

If you have to repost the patches for any reason, please sched more
light on the 'nosense' you are observing.

> 
> Reviewed-by: Luka Panio <lukapanio@gmail.com>
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 22 -------------------
>  1 file changed, 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

