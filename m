Return-Path: <linux-arm-msm+bounces-70135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 008DCB2F584
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1092AA1632
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7EE3054F7;
	Thu, 21 Aug 2025 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOwsiioD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E80D3054EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772691; cv=none; b=QhI8dfRJfm4JlWstciY3Ses6AmiMP6kXwsATsJsmxr2PiDdspHqiCUIsIMgZ9rpZC3ifqXW0iByFNTKp5X1G8jYa0H5E00F/7m+OOX9iRt0pDMxste9A1NG18kaQLsU1vFu/0EFGfuFVkObvRFYW4RBNW7wPSIY6agdV69sHpoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772691; c=relaxed/simple;
	bh=6B2gofMQeXaFIxttJOCL+Zl7gixeHkUQAMPgca1dQAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+CiQvJtpSgWaN0wd/4ll7vHkDvOrKUDQnLGaSC9BmYw8Sew6/G/12hZ0dk1hUkWkNq5FHqocWWWH5OqG7p8F18W6ABaC9W+EXKrw5i6PxtWyx/FlmlX3IHCcAaJXCmryzmrrEOqeaJkDL1ocHyrrWkf2lUtEji8LUvlNbBIDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOwsiioD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bCaZ012935
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r914EYN2oHqG39oPT8nQaNOs
	AXvKl/bytIkZsYAvQVY=; b=DOwsiioDOlsSL104WqMxnj2XV3DqmzE7CeRShTyE
	wDqeftQd3Vz+ACmdeVP4+HwfkhmMH0U9ORUHKNVFrnko+HNulb7/LJpiWofgCspD
	lSgjAqB1LNfXPRLwx1MSKoWCshW+ZDYJ2oNc77x7fuLc7vrK5ZxMUl34yy6zjOqD
	kQscF2TreHZ3msQmxZQJYfThzTCw9H/7BK2r2E6VSp2aUT6dcQPhl70t/gxygUgd
	WWLoDKfB1tbQl3VyEetdumST3BYf4+aPMQsdKkuRmYLh3dIM5BAYuh2Yk42DUBfq
	WGz5lhraaGeHq/FTlarD9ZFn9vXeAfdRfRBWkVk4iPzMPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn18v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:38:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88de1e26so26603296d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772688; x=1756377488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r914EYN2oHqG39oPT8nQaNOsAXvKl/bytIkZsYAvQVY=;
        b=PoEOSazmAuB6+7S9vp03baO+qYYr3V1paR4hI0C1Syj+pqAhoXF6qwrsgtsGJKidy0
         rgkxbaBU7ES1Na/k5RiBKA5E89C3+5Cec+3VeXuiXDICxBJf4z8QqJ3cpTugbQQCnSkn
         /S6lByvuG4f1ItHm5GuujxFAR/UcQOb2PGQbGpw6o7x9FiDd07XGh31x4o0VAljdEHo7
         6PpWWpiaKSLR1IX0dGVMj37p2PoOj6bQY3pPC6cQAV/2W6UCiaA+oM+tAyE4XZScwnDP
         RSs8orZCIF98tONe7Imc+ELfCWzZWp87aDv2GqdO4kwlgrjjLQ/GIh+IaQJb9C86C82j
         neow==
X-Forwarded-Encrypted: i=1; AJvYcCVRAioQ1dLrp3cmQ7ebTIhTyonEvZw8/kd3C6Km+G6PLmKawJogrMzxjtrdezRgC1/xCpG/vJ1QkD9uMfgm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9N9nn1MIuLW2pxZISwbFlhWA0/uSF+lEVkPCi59/cejbvnG9D
	R+Nfh0PSg4gmOrgdGwsHL8Q1WpLE0fs/46MEwHQRhyl8Qd07kEVAs/66JOJ8Uy+gRZwl5Nw3Gc/
	87UykLihZwIAbO65UYjVYVn1BurUS7YLD/GKxe/AB1c96uRpeBtwNisKDs0xN78OaiIGW
X-Gm-Gg: ASbGnctU+Pp/5qmQwcQbgmWQ1jKEKTlvPASj6TX7WHjF9W4lMWs2ZA3lWVro06ZDw91
	YyRr+NDBdb1x95mpyKd/saqYF3AQLyCVaUHmx+zbDV3iLhPiY39IRhj1The97BTLmxuiXYUNfww
	c9UeZ1fSDYOhDI75GZVulEAjFLEFWRvNW7J1K2G0oGkiLA9D46PHKPle6qGhdZ4n+Z/aoNZBRks
	0whVKH+mTVuk4meplIwkMZ/emIs5wnmV7xnDVMxEGU0LsR2TA4pl8RaN+W45FI+KZFabD7Nnk/H
	fGfsh086u+ioDuGIMpIG5Q3mIEa7klPcqaVlDhCliN17Si/FGlWBD120Y1BMQEUwGbCFksbJSBd
	VOyIN9rlhETpcI5Syg1Lymh1HD2DXEpxndCuQwYR6WtAXsLHBV5Ig
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id 6a1803df08f44-70d88e3741emr15983766d6.4.1755772688292;
        Thu, 21 Aug 2025 03:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEa7hNzXAx5DgTP1u13ijsgfOsTyYMteNBIqzj5N6IcVZ3PMpHJWc/EQSHJlepAFEYsq9ykw==
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id 6a1803df08f44-70d88e3741emr15983356d6.4.1755772687617;
        Thu, 21 Aug 2025 03:38:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef368d34sm2973505e87.58.2025.08.21.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:38:06 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        "open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/mdp4: remove the use of dev_err_probe()
Message-ID: <kefrdoyd5dr4rjvz4lmtznxw552wzuspk3pdse63zm2kmtnpvi@wzzddue2acrm>
References: <20250820131300.499727-1-liaoyuanhong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820131300.499727-1-liaoyuanhong@vivo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5+XsBZOpvJRl
 tP34BlWJP6K+dXpciRMn/s1ms7dxeIXf0Gyrj1RNHU5p7N34MyO/f31VoH+ookSACxNQLbB7a+x
 MXYnC1uqjb97GyVVGv4EFyL+GitdQPG1MQN9QvdthY42CvKffhY466yZjcPgT/ayFNAc0vHU/b4
 87DiP4YRNtFV+yKqX4O8V/6it31SWPOG/RNsWDUPOlB8vt0QP5KEnxISgTxyBLWyFnqTxuKlz4C
 Zr/mLUVPx29mVuF7AWKxw4Xw8PyupnMFzmlK6CTz60BhF9USpwzbGVwYTi3+FlKSVZny1gMQmi0
 ef5pIQJL2uVL4+mPnKud8RrtTh5DdxTGWBh0VXrov4NpRqadjgssao9ZgItOcYx9zpgAWyOs9LJ
 4CDkCTDNVwJwu2Z6VESNJoUNPCuxHw==
X-Proofpoint-ORIG-GUID: eiCOblUsj-2NC5ds0iIttIAktfM1DR55
X-Proofpoint-GUID: eiCOblUsj-2NC5ds0iIttIAktfM1DR55
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6f711 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8
 a=i0mAgyhDueMVXABGR-YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 09:12:56PM +0800, Liao Yuanhong wrote:
> Logging messages that show some type of "out of memory" error are generally
> unnecessary as there is a generic message and a stack dump done by the
> memory subsystem. These messages generally increase kernel size without
> much added value[1].
> 
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value
> instead.
> 
> [1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

