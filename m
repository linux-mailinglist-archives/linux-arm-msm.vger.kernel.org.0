Return-Path: <linux-arm-msm+bounces-89276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB888D289F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3E5304A9B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28DF327C06;
	Thu, 15 Jan 2026 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kt2BpJnn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9ox3/22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12632693E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511155; cv=none; b=Ui28YWJdwsQy2oW6LSpc3upgpIT8JZpQSO6mdYTYe3TtTtyRd7JupBM1vgLxazrwppwJ3disipGdRQMc33rKxSDQsEPGuOwLUGzJK/RQ9BWTSyCGCSQh5tMIwajx9DQU/POKmzK3zIW9ziSaYIlEBtPYJ7k8RQkS9DwCopR6VHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511155; c=relaxed/simple;
	bh=Xl0a2g5j42jYhUmceeF2veHo6Hj8FPFjpkdDfiMW68Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ao6/b3g8rnLKT1tOgAExGBxnYld36WVJPRRSVhcWwNcA/GmW0swl52P327zQzJIBuFoKds56z0h6XQ9/ee7JciCRUWSISYTeIkFVGWCLHQVUlh/av/++VGBcCtytf6R+F12YAVNej8sszHnSrM4R+7wCgAqw4dwRK76UZPMOHCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kt2BpJnn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9ox3/22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYLuw3113542
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=; b=kt2BpJnnIOPLzb/t
	T2pQToVIm4jefcFKAFEYgb0B3YH+X5CDOVZEUiMybZNAXiR/gI9BELDAiclL/ekt
	w78XrUzdrmPmC4w2FvkjprATZ8djSOYZE/CbPO0Pq3Wlf0U4AjIasTLI9o8LeB7M
	VRBOYqCMmZXrM7oITIn+IW/RXRICEZrRXolJ5BJE3LPxyKUjX60tP1Ry9sn+WgNb
	xpDmcjD/3GyabZdva9bylTKTgtHuiXheAKseI2cZ2X3+F45KNjaL8in/KoIQwmm9
	eNxeAmTXXGEuUSu2rQT2MXjRc9g1juOY/1umNc+EETJorixJ5pTg9yvN2YYzZomm
	DVk7Ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm11uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso404297185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511152; x=1769115952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=;
        b=H9ox3/22Tk/lLUMJLJJ9XRh3VsauSpEEihHzYIJr9Pqg1Og2iaTpvCCT7wxUMy99Zj
         gEqKBIQquWOY7Kn1lxjvDx1nbDtFjGoluHDXtOdodIj2ydM+X7LgDdi+VLOfHrAq0wpn
         G7s68jAbHH4yY1Lw8Wak9sW3PHWLuH9U6odVEh7sv0d9EUP2MuRCHaUkVE3CPT4j/aHQ
         iaZWG+ghrMFhT9iXpVMaky64kqgSgA1SxvrhYV7YldxPKhkmRH5N/B3IGbC9te16mzlX
         XmhfdK/bnhwP31Obkx1fMWRAmbVYCCszKBw2LwQa9yV1Y9kcJchnCY5xnvicz9SrF2MD
         6LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511152; x=1769115952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=;
        b=d7zWqlGMmtlvWlk4c4FRWEqZsej1t/+u+dVbozZHiXCOSHBQ+eDk1yhlckSkeFUPN7
         3DaTtaESmJFYWedoUXwf7bD1tiv0Ir7sZLhSagBivnq7L4//y9HeeUgt6EFDK7BTjLSY
         WXK6NZByowP/ltyEtuwK6tlbjMC0HTKF7wZNh8Bt1ngmgEObIvbbaoDNNVRuWNXnizAl
         QC5Qfl+nYmigwdbZRNyL1M42KJ06r7SmOda5yL3NkkGq6xgY60/LW+1MTuwVrfvcGsAV
         7yhbkYrKAdPETz6SR02jI7lPoxqARGC4yv2zAsdyFcZbv/1REHCaHHMxHT6xUDMUZukk
         m95g==
X-Gm-Message-State: AOJu0YyT6S4YtH0QBQMY8XTcLWkIHfxkunkJOObJgS/ryZ7Jz6+6Aj8d
	oA53jNHxLztvTqbKIoRg71wrdenyOF/UTOqE4bcn/kknvqXbRrsH5hPCVLiJXcsPehm0s33hhPT
	PhNTpBeG06LorGwLm9OikPxJvnZxlKiPbJA3hFta3hM2CURnhIPuMjX/6loJZHW+ZM0i1
X-Gm-Gg: AY/fxX7ZQMMuxNvfM2pblDXZgSkFzCSxy3Neo7xdk88W5aztR2E9EDt365apSrjxvYg
	sJKmE8A1Ce8MnTGSygD9DMnHhILMVpixaYBJqVtk0HqxvdTzvSpTCDPpGHNErPveM8E/qUuVxtu
	YU9rprbIagcbE/mFblj/j9GK3GIpy/9Eq7zowWtaA/NyHrGV47yqqppzQNlqtWgim1TEA5OXn9e
	77P8ITU9T0040eIfbSGmcdhVORCdqNVB0gbpomQ3K5TUlQW39U94GNiGfR95nMe1+B1AUIbrwDt
	8cjYsZgDUqOzjivfiLiePf3nFs2gOjGAUlR/mwzuJdAqd7XrOqJkyEEnnIe3UhMxEnbhdGNbyaK
	0tosVH94wJoVrMBahIr8TaTzAa0wyQKQwqFS7/iZUP0gTazXJi+Af4FhtorGZ8ohlVqqGw2OEos
	MGXEBnKChW3CtzSC5ax76N1X4=
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c6a66d1590mr131378185a.16.1768511152115;
        Thu, 15 Jan 2026 13:05:52 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c6a66d1590mr131373485a.16.1768511151666;
        Thu, 15 Jan 2026 13:05:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates table
Date: Thu, 15 Jan 2026 23:05:49 +0200
Message-ID: <176851111169.3933955.17203821768730103962.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
References: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CJEZJ3rGHF0MKa65HWy0TC8WtsGTI4Ur
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696956b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=uNR7pAaoB_IQ8-4UisQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CJEZJ3rGHF0MKa65HWy0TC8WtsGTI4Ur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfXzfDypTqRBkU0
 FDHWOU8BovdH3EHgcNEzJGvqnPmgn8ZMwsfobbu7zHvymPQS/IzIoAxoFGxdxO2RD3uMg3C8lzz
 GyF+Y9voKSr4GoEJMUmqSAjN6CvzRXQvtjuSqSU5FMWSul9wsDWkWIjdfZXp+y/PLrh/mDpvD8Q
 NDJmtDBEhW2Niu7MTM7pTIbfq+VTpkglcPPKcm93DUowPlA/smvGMre8NoU3PpJXBNGw3nUhgvr
 VRtcIQhXUXdGbgTXCUh1oHAD+VGFMGBsFk345MhUX0bnIFIWef4s1wIq3L+1aOPpkm1MgoO8SWA
 Od0fIocmdfxoMaqcpSFwpU8bJp0ahsEth4hPY0f6E73pIfZ8ic46b7nkmasM78Fwo6KQBjYDj5H
 mtgU4mLp2nEyKtvFaBW+NHht+rnT08AgNbwZRYqzKlOI+wgIb1KdUKou+kLeis1DgZ82e5IbHET
 Ug0H/lfqaC+ANIlPW/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 18 Dec 2025 00:19:32 +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: Enable support for eDP v1.4+ link rates table
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed100aa239be

Best regards,
-- 
With best wishes
Dmitry



