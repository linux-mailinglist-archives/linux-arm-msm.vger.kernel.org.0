Return-Path: <linux-arm-msm+bounces-70478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A84B32916
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 16:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F37B5C4BC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 14:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B35143C61;
	Sat, 23 Aug 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCzJiM3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BB31B4248
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755958891; cv=none; b=HDmFjPsblF1c6gilemEdniSnFIibibBtHVpSa4GDPDvXjVVfxs4IK/t/wJCTQtwoFvuDAXCI43jsp45npWU1Ld27AG6vluQX7aADReK29i/A9zYFvBgD1O96kZepbJk0SGUulVAOun2gcx6Avb4Feq/6lKVdFIQIj6gmlBOsfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755958891; c=relaxed/simple;
	bh=khbVORoJwmzj8VKDm/dKhHweKD4KPWw0WHkplcKZ+Bs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZrpSiFaI1zGTlyuPjJxOyxzAk6AH1Zh0ShZ2WAUF8+MpC3YIz3CQmPBZHsoLmxxEy/QyrGfenjaoxSPiSHgKZ6AE/U1qqK/9IHcbJKklGsbxuvQ47H1SRLWP4CtLLeje2yNl1aQqeCb5aUt6SzO/PF6e2GY4A7cmieFT852D/aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCzJiM3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N4BuOd002779
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ECk1LsCNk3gjT6xoXSEgvWTIsSpYG9wG+965yN0jkes=; b=pCzJiM3iXeqj/lbN
	IV/J3mt6UntuZdlR3Ql5v+ass/KUy5aSHm8CbHFhBC9mm/jj2TVb32KpOIBEwYp5
	QlcmpyeDvvuKpxB/F4r8HH81zxGA3gblbiB+uWnoH9sFc2QA64XKxmEi0MoL0NH6
	lplW6K+gf5NrLnI18QZ4xKgXKem+MTryp9xjAhyuxJGjAU+Dkn+h1tTDP5s0N4A1
	baR5OUcMbcNmBL0qEN+OzZzSQ3uARnI2aDX/bAnMotkfRkNpicaP2oHj2QuC8Vw8
	ksopgrjb5AI7c4WgnaNjEXlPtzn8rr3rHdICw3NdEz5+xFBIaflKVOnzQzKfZ5XB
	4HMIjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de0x8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:21:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bccebaso87652961cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 07:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755958887; x=1756563687;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECk1LsCNk3gjT6xoXSEgvWTIsSpYG9wG+965yN0jkes=;
        b=Asus184ChZens/XuFBHwu3ZjbU5M9tcQmY6eoJLDai7F5S47F+5p99cbdvLLjVgSDK
         3ls4Sop2zaY+72kRvELxaw27YTkP7m6TZGghIKT6C/T3MDNG0AFB3lBLTullrYH7cdZm
         ncRXv83xAbSMOhwCMRmx7H0RjDoFf8CBJXAxPIj4cF9f0C3bt8aVH8fhuhiQKMaJ4Suv
         TBCgdgzHSBHa8xaYEYabc9F0ETZ6sIhWuvVOyMwu95XXIxFc60GUjp66jy95zw+7YXrk
         uQY/pB1S+snIEaOoetcbfpiyHs5WzISoLFDA5E30BvlCUoTRG49Da9JcBCXjiZk2YLk3
         b0kQ==
X-Gm-Message-State: AOJu0Yz115I00ERKCBXXIQYKlKlz9AAkKGvuMSR2qC+SxjU6p+TWYU5E
	8JDRFJS7cO4/Bge3UPeG21cXpN4LRh+XN44So8wGfI0U45bBBJWWTzF44/bUG7mPNXbv/7IU0/5
	UeMzjRXdX/cbjWTf/3zv+TIp0F8ncEmJ82CTg5KIKVyJaXrHBS9Ylj3kZnFL7C/aM6vUC
X-Gm-Gg: ASbGnculCr0/BnbXWsn1LHVthSjE+MT3z+oB18VgNpO4i6G/q+PFQ54+QzzHM/sxeRV
	uumgZSZ2f0dQ6jd2ae6ZqD4xh6Hm73S8NGJcUP8evyjFMLvtJ5lDk13DhdwhihiJRrIVKLapCWB
	zIB/U/BeDlaah/Px4N3TPWWTIDsqYjto40Wtp7VC0B95LD6C6l0/QLElBBGIXXXJ2syd5yGk0KI
	wSdjeIG7W9b0akYn6UC/I6iD4MVOXRBADsmDsSk59wt6WpxByhAv5w4j6lG0G3xvS2rpk8DVLzl
	vlTONBggDdVPaDryNk1qVD41UVcaAxIfK/6Yg+Xpq+znp8b4YZtCwEpJ9n3lWZ0YryYzMtFP2WG
	NfKk8aLJgnMbpO0tVx2BkTmHPY6Dr0jHVuREN/sULtGEV9JxKd16n
X-Received: by 2002:ac8:690d:0:b0:4b1:a3f:adde with SMTP id d75a77b69052e-4b2aaa40e39mr103546801cf.27.1755958887008;
        Sat, 23 Aug 2025 07:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4PmkSmlgiF18xFq5d2W4o3JzzrwhL20Gh1Sspi04wdUKBR/io81yO2DxJF6sLkzYTQNqwZQ==
X-Received: by 2002:ac8:690d:0:b0:4b1:a3f:adde with SMTP id d75a77b69052e-4b2aaa40e39mr103546091cf.27.1755958886482;
        Sat, 23 Aug 2025 07:21:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a1efsm523398e87.118.2025.08.23.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 07:21:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Danct12 <danct12@disroot.org>
In-Reply-To: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-Id: <175595888536.1764874.11815793767108601921.b4-ty@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 17:21:25 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXyIdY0eners+j
 jObcLIZK0JjUkmnpyq06JR2RWrqZHK4HneJTmwDXF1NLggVvhY6sZKoohjr7ZsH4uROFiYoNTIu
 dRtJl7QA+5z/bL88v589p8ayWArcSHoe0hQ1AV5xGyVVKLSbSGOVkm/DJs4jj1fUv20vCrDMaeQ
 7fJQ+yRn9v3WeIE4hODmV5zRlDMUI4Uq/JR/cqUbQitKN2I1VQbaWxyW9+rxJjpCD6glLxcZk4D
 OtJLrf8zKN6ptX/5RAG1tbahvD4Z+VtjpXAGAF54AruvZJ7OLgtaXKiAnX+XoEJzh9TYy+SU/QU
 kKABXYGvhtzodPiUHgXfsLOkZxPC5fIS/cwYfsCn7YuHFATpvmHi0NKNjjolJCfl3Yx6SflV5VF
 0NdfPWKA
X-Proofpoint-ORIG-GUID: wR_D4ybNOYFtHRmJ9Dz9ztKfJrpMPkXx
X-Proofpoint-GUID: wR_D4ybNOYFtHRmJ9Dz9ztKfJrpMPkXx
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68a9ce69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=yaBPxWdkq7d3F1QRnygA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

On Sat, 23 Aug 2025 03:12:00 +0300, Dmitry Baryshkov wrote:
> Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> allocate memptrs: -22" errors. The mentioned commit reworked the
> function, but didn't take into account that op_map is initialized at the
> top of the function, while ranges might change if GPUVM is managed by
> the kernel.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
      commit: efe927b9702643a1d80472664c2642f0304cb608

Best regards,
-- 
With best wishes
Dmitry



