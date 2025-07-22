Return-Path: <linux-arm-msm+bounces-66058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD9B0D88E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B54A1888E31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985D92E2F05;
	Tue, 22 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqYDjf2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC3219A95
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184952; cv=none; b=cRBhvM+cTsr7iz6Udzed6bpMGlL5wHyzZGvMvnSxhK6SnRp7aT/nXegFwPRV1ZZbdkk7BjFI6T+TQe3wiN9OgrcG53Tq5qrdCBW/Lmcvr2Rz2YFlx9oxPmwFMqnNFXVvy2jG2VHfxIeaMLaJOP0FT9bURcmOVykp3Bc+0KCI1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184952; c=relaxed/simple;
	bh=g5o/NJLgr/+KZfh7NhSKbgenLoX8ddEIOkGuZqnLS+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKpSW4b6tJILJer1FwOmyP5Muja/NFo1jEvppXd/qneHPTpWKK1mAAQ9Ve0c2kaVA7WdfR32jOyzDevwbr7U6hRFxzTnv3iNlBDE/Rv7syI5iSidqLxwHFiDdHZF3lXAGDrMx6HckOFDuoQ9pQCMtFlAuBPjneM33rtANdjS8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqYDjf2t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7W5WQ009759
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B5yI/2W/uYPNoZ/4GmFrmy4p
	o+IDogR9AhFLE+hirtk=; b=GqYDjf2t2uVqAHUeg3Vd+LkW1TXtE4eAV0g/7vUs
	6jHuV78xQ3CAewTGWj8qF74gcbU2tLapuvs3S1xhEeImjZySEk3Y2gK4z9rrXO0u
	mCcsGJ6zRqEk+KnldI4G5YOeYfwOySeckQ886d/PnjfQjenMoY4M2A8IbOZG7r5a
	Tm6MMDQqJlnNhNYX0r6GdNfUmymuA5eiVE5e/XP2ZYP2Ww6XH01/ujjG93SpMyNI
	y0FQhwkUbjYkZlurh8UQyjZqhpUhY+8vsut8KE9PDBbnAznLsSs/jx5/f7xUqX5F
	fF8ShTYqTp3rewB1P0XS2xOfk0JHgdSZlcrihCn0QKm8dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3em3b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:49:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33d32c501so1245575685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753184949; x=1753789749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5yI/2W/uYPNoZ/4GmFrmy4po+IDogR9AhFLE+hirtk=;
        b=rbxzEWQhZbIOIhw0HvD32C5OXvAYSUyW0ETqgorLsPmEaPi1spSrHxADYDkHS1GzeB
         oLgfo7PZ/EEmrVBhDmiMjhPz5Zc+YH0IViI/wdzqW1T2Uxp8zH15A88B0aVp96/6uYAO
         Pdxr3JdgR3zXBob0GMbQqAL/eDMbrU9SVoYWHG7WUoGvnzT3O5p1i+Bj1yVjSbkzq3gs
         zBe8GBi7gp2nqoFtTOLe1gWoWxw9WLq1qJbtQtwjlqXrZ4S5TjMhfaNLQk9Xp2YzK2lg
         ZuKrjLQjJZa3s0XIJU9k5GEips28o/nCTPdAn21b+F0qe48vHUnWCL/GURVMPEXqislJ
         YXTg==
X-Forwarded-Encrypted: i=1; AJvYcCVUVyb8GaZ4yixXZZ4I3UK64y2wDT/ierR8YFuhq9KG3VkLxVh+1NCMPV7e1MMFuORMNWP1z84C1GVn43qB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IT04S2oAkb99KifDcvw8i2HVMzCs+w3QccLwPWXIkhkGBiL7
	HldG22RPpQRdMgGS09V3xZlG23ZdYfuc/xQ5/gGtEPrwihwSiNjT1attLWcJswx1fIvhpWJNHob
	e2zM87VvvEg5bu7jqRPGLAoR0Y3NY88GelEHRqdCkUhAdoUz+s6PgHyxCVDxz0pteeiWW
X-Gm-Gg: ASbGncsK7N8dpGBSR6aK3ihtHDzVvRZZEfej15hk7jCH2QbLpfemIhtKN77W3QDXL8I
	o/of3LUrp+oC8tXg6QypEGN3iPM3HsczSsxkIJPspWyzvZEoCjUdivMwl/rx3UCy8UuzbjhJvUW
	5r6lzQGgY6WL6PDTkLYAgMLaOnJh2Di1YQDrX/h1BJ2Yi/PwvTZ2aZBohvMz870PitDx97ayyaP
	15Q/VVuCAyzdi/RFz/cwh+wmrBOTcpxeM0mj7gKbJjCvq8tl4LKHXCtEsTTKXGZ+wytrhSlMVwP
	uCETMm4LA5+wux4vucz9BSLwI2w5QYH/6a8Jdux5vuClXBPBXINrGtPRaFdpTm3nZFtPBGgHjmr
	T4hykmfg202Pj0mRivtKcf9w/4xXBKWgnD8PplFOZGlG87LpFgQfg
X-Received: by 2002:a05:620a:318b:b0:7e2:733:542 with SMTP id af79cd13be357-7e3435e9e32mr3649940585a.36.1753184948561;
        Tue, 22 Jul 2025 04:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEePpw0gnZfgOgD+EN9ULc+lx2jNFrznEEMSRNdte1hYVihbfjQ0YCdAjzvf6azH9JLj3QIsA==
X-Received: by 2002:a05:620a:318b:b0:7e2:733:542 with SMTP id af79cd13be357-7e3435e9e32mr3649936285a.36.1753184948067;
        Tue, 22 Jul 2025 04:49:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9cb18sm1909407e87.20.2025.07.22.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:49:07 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:49:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
Message-ID: <uh2lkqa26lavl4evsckiontkmjaiiwvz6jj7zjwylrfojtd5ne@ibk4ckgrsygn>
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
X-Proofpoint-ORIG-GUID: xOwVT__R_TOgLx00JelY2ZKdi28dXkQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5NiBTYWx0ZWRfXwTGjapsuvt3x
 tOnqr7dJcNhlf/90S+zarOypbKZ9WPgguYO1FzOb0KJ3LM3Zyg9DQs6knu809w22WT4DSeSgVSt
 0QhNXkoRFVmppgmMXGNluzSSmQBYTiZrKyQWkDd/546skkk/IM/iP0zdmqFEsGfaSKuKhRE/8Le
 Ph8W2PV8q+KO5X77cwgk6r5LKfbxcdTNt79jkxc+XC3KSD9IubTWwv38in9QEOJ168w30AoHD7x
 D4Dc7GNp0+qoZ2ImcRcR//EYuH1ux9jKT0FRAkZa8tsk+6zXeiwKjZyZCeENcw6DPFSJzxnm1uG
 bVn6EO3EGcypgGbiMPSoHnSfH673f6Y0OQFkuQuOhgeVhEKRtsuYU74DKuFYU6swaLQWOSQkp5j
 KU7zj3rDrSZSQt+zEwM5fnWZ8+itTQ1PkrmOgW+6Nz7mov+7sEcREtGLDI8WyAlvnKQvRq0c
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f7ab6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bYW4DojQpC9BwyScwp0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xOwVT__R_TOgLx00JelY2ZKdi28dXkQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220096

On Mon, Jul 21, 2025 at 02:35:04PM +0200, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

