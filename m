Return-Path: <linux-arm-msm+bounces-72823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF3B5008B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C00A166C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7376D2749DC;
	Tue,  9 Sep 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctUGAk9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D322FDC22
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430084; cv=none; b=PbBuerj5wncqEc5SCHDE95BnVglXaCgOLL0g7zLLSC3yrIbZzVjgPEpwS2IGWa2bpUxAPhf7FWWQDotvOjTNdICg/JeWgtVVjU08YgePJWH4rDTr7OHwLHZQvR/3QvdU7D7T3NE0KNgxfy9COj0ycJJXn+5SUXylZO6JALA/H9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430084; c=relaxed/simple;
	bh=hTogHYn4Bs7eYKX2bQcxoYiKlhRUc0ZQ/bj6t0Z7yiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKKS1JYVcQuhe4tBYZOsc0f72MrwF0Qae9njXEkN3o9g7604PIlr7c/RLO0U77phCP7esoCPPTfXl9e2Uk2HLUKnJakWN1p/DpGn3h8EXS6G9t2iKqdTBblHM1pZKcURQYzep/TwFj9gdgP/GNeif5mLiXAB1jfkryVsCWkIGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctUGAk9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lobs020516
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 15:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u0lgli35YLNS03kPoYJ/ICz4
	vDSP8Kg9w05gBdHJbis=; b=ctUGAk9myr8+w6NoQvAu1jAZqPtUDtOgbSNbw8OB
	I4dHfBkmcwVK+bDv1pP1X1CsFfxO8vtbMbpt+ys57Qszvovc7EBAln/R+q+X+WeY
	ljkKidtjP4Zb5RZOk9g7iPWfXV1gVNZiMpfEfp4jLs9LoXrSAenS4K5G+ZPBdEA0
	YHRCCcljtfjf47vuyu5+AXTBfrnJUqi3Ub3me39B596udqxP9ZRCvi/HzZmj11To
	nPOW1LwPwcrpYVlYPUI2OA/j0w8C5tSuSF8hRm35ROoRZWZwJEHdtzwrt/gNHJP0
	9nrg2R8k46dQDfAwXvmSEtb3Lt8/z+BkBP2XPpg3dWZJSw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc24mnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 15:01:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-89021b256a1so7932167241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430081; x=1758034881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0lgli35YLNS03kPoYJ/ICz4vDSP8Kg9w05gBdHJbis=;
        b=raUXD2At7LToAsadDTab1HzuKPTr8/UNwoTb8s2+wMzzIOTb9zmRxm1u2LDn6pJ2ob
         vUqf6ZQ8eYa2p1sZx8bH7E69+h3/c0nxA22OScANkwNFIz2NokcgX+YYA54kBumdt+xN
         R5ICE8BgFstcOZhQCDhRcg4tXLpjpLFY4UFuxPjwmDp5CYudubjjAIpYcAJ75Tmry3Fp
         lB+hUlOxtr4j6yYby3Vf9CLvZ+jJRlOPKfYgtEs8CISk5kc0UyTkJbLXx8NOQzs0yMB6
         nNHV9W5J7WUxCVsRm7X7Bp0Si4K2gY8tC5Gl4U0/RzGuFoz0fZSnKj90+d1SE8vWcyBQ
         HQYA==
X-Forwarded-Encrypted: i=1; AJvYcCW181RYnrNdFxPuFue1avx5GwcbiDEglNX04t0a+Wnxws5oQEM0wB+W2yj1VjA5BvvF5t8o+vt+iJjJ/QYv@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9RseQnzr2rKV4DlR9FPhHgPRBbIKj6V+Mjgo3BFgPxojedg3
	EZDND99OKu6E6gxGee9Jjn05w9nxSXCqa3VtBq2pBf4HbinVVmnT8/ZHgis7AWf8OMqemVNP4AD
	HEnGX+wfpQk2vjp4jToBU4XL/h+BNJ2hdnaLKNGzu0dY7YtnMxR8c4C9u6yvN0+eSXUGK
X-Gm-Gg: ASbGncs6zuTHyLHyqA+HV/R4i0gCGrVDNh3pkozwnn7urOWrgti2PLTOmvooyfgUUQa
	LdE/feYQUVjTJmxXj6+7ano6/ezTTUOYswsdVV9x83oWYavipCbgLpKmhmiB1KUpRbLWKmQa5f6
	jmwBun2ux57ttX3AMWRXB0Nnvb/ALMKtdnfuXr1hBVcLQMH3+5kf/cDkM3msa+gJmiM58HiU0Bf
	MZFb1P3zvUGNQcs5/fl/xxqu1gzZSyHosIlmLik6nsDRQLBTyug50gGwNXZKYsj6OVbBzWn13GY
	y/DuWPW+Ud4uGFZaE18/DPh1IXdRGpN4p7j/SXU2KG2GHwRvtol8BlH/ZkJH/XSO8Eyj4LtrgUV
	firOoYSWTOniiStStGhLBY1TDK3CvRGXHtH3mz4DsdMwwESI7hbJ5
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id ada2fe7eead31-53d1aeacabbmr3520991137.5.1757430079251;
        Tue, 09 Sep 2025 08:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXQrC/3gfSjePsXH8DNK69GxDOTHZaV8vPPCw8jrU6FISo45tmgpgz+khuABN3mbrRzq6IZw==
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id ada2fe7eead31-53d1aeacabbmr3520861137.5.1757430078265;
        Tue, 09 Sep 2025 08:01:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d5cbsm561765e87.74.2025.09.09.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:01:16 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE
 an array
Message-ID: <onhosploceq2ksu7vxjh5e6phg7h6lasjdloxkirgps3tbkaqe@7vfqdbojjnts>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c04141 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sIHAvruKwB1gmBPwbjEA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: psN35ROikakUXBoAWARo8qlWVjNSl1LX
X-Proofpoint-GUID: psN35ROikakUXBoAWARo8qlWVjNSl1LX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXx9TCglhcIoKp
 oz1cyLwobTzdkj0bvOpQGnLSWgVsoBCzIkxOpvBmH745VuXJy+WUxmBNfQJGJpjVt2FksDD14K1
 kqJ+IRccQMdiizRLVU0pc83Bv5E01eyIh30jo6S5QKmV7DdO2msmXLv0ak0lSyzSltyO6DHNYg9
 bYhEde03LilNUlBmWbmdaGsSLqB/6Nk5jZIe0scGVyoic5tOuiFqE7ESl5hK9VbT9rOHuFrMabn
 G/KhEqz/nF/TWo3Y3xlyPPcfOdE+OkhSpr2YhsOwz5vWX8U5TeYICFk142y95teKuxTJKhRlAVp
 003/TLpojqm0sazjmOHQBiSQYwVb1nKMfIbyHHMwUi+1M7ABa3I7DlSLke1yh/gE09NCaUFTLcs
 vUAo+ToK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Mon, Sep 08, 2025 at 12:30:06PM -0700, Rob Clark wrote:
> Synced from mesa commit 77c42c1a5752 ("freedreno/registers: Make
> TPL1_BICUBIC_WEIGHTS_TABLE an array").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 10 +++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 10 +++++-----
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 18 +++++++-----------
>  3 files changed, 17 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

