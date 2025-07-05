Return-Path: <linux-arm-msm+bounces-63825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4FAAFA095
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 16:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE94F16D8B9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E4B1F37A1;
	Sat,  5 Jul 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCbwx1Od"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE001E834F
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727172; cv=none; b=RfsyXDazRiTAFqAAnyDphDkCwbd/M35KOsCSVRd2J1byup+zXvhL4zEoMnQ2oBZNYyfpbM0oz8rtocHtplkxNNQmiQb1ZtRY2lkrOy+qpB1pBZvYfeKMdSIr6G4woFp40udXCofrU6mCyxVshghm7OCAah5fniL+/B8WY5XmOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727172; c=relaxed/simple;
	bh=Mc5soiGjmg4xMxRz4Dpb2vBENdG9Q6wchlnSfNSxRsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IA4yNMF4LmcTr0wNolBosPC3K9wR/Bsc8L4rarK1fvaQacsnnBrBNiu7dnJeGKFbTfRkG9CnOVH3E2eRTb1juSUaFZ/Xyr56GG4m8OlT4xKZhgYs0XEwRnF2gbgdIEylVHt/KZTGtraSuA/P2GuUvYDedeOtCZAAC6FaxGTrOe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCbwx1Od; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565ElohO026061
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q8N8EuMWRa1
	mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=; b=iCbwx1OdTY540JdijeWz6mmxNtN
	jcHGzufMgNE6sGGCM60+73X2CC5hB4a6n+mVQ6+mYuuvlMBiz2FIIWOUV/trq2ee
	UMff44up788BP/9Fy0qCuDj1vBt9XfVc7m0n9deNVhbfiOA/yIg02c60zEYg+UFT
	1gw/mHwX4iTa19joxGK3rdMAymAyIvH2bunT62OgXRwX5Q7P9EvI+qpC+eXw27Vf
	1gkUdMMhYJm7/xKconn3a1m1U3sFRSv5D9e/D3rcx7cZEu7LCUTOdHVBF0WeeYQK
	d2frJQa7ongKYNGoDsd64B5leBQe7HyseXZ1q8o4dxbEXvxwAO/VLaoPQNw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q1575-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 14:52:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747ddba7c90so1297005b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 07:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727170; x=1752331970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8N8EuMWRa1mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=;
        b=AN3sgNVtPapISuFybSXqtqKXl+b9ntPmg1Vjjph46dZCb4p4x+a8XXdq3DhI0hKzuJ
         nOfsrlJTSUd3fars/BL/JIeG+FFjFYpyX3LoZCIrTICQDzeiAeZgAO1XmE8sYcPGrfXo
         IE1FlRP2rQN1smsPJQbA2rtZ+OKltia8ITKhobddsWMxFNdsdOlxgcnp5sGZGAGJDhei
         v4byUWm8luBa/nksEsY3eS5i0ZhiEYdGu5U31FdC439n+MhB9zxHELOUm+lyh7YxLf8c
         pAZiBvO+XiUTQ/q7+QLyRkrMJCl7o8EDGSirUVvxjGVs5iNo/xqfZuI2W4dwhustVdE7
         5FmA==
X-Gm-Message-State: AOJu0YxlcL6aj6RaBrZpfVfyyzL7/OQzoqIs7DudZoaiENVf947g7Ber
	rxcoC42lQ7LRSu9joDAF8yYqqirBczQn5WE/FgjrwityVZWU476V6n+KdV9RzBX+q5+Qb4Glpce
	oIJzxPvKREWQDwXE3kw1dJRoLz7LFExude3dfep66SInPNWvPjgYmURJu6JOgFM58fQ+nZM1elY
	Cj
X-Gm-Gg: ASbGncvtqBhuZTzAnsInEEn0fHYFOZPPJTd4f5IJIMFRyQ28H32cOxHQdNbLnhunqNm
	5j5ymB3TW95glEHIA+LepfRteJ0u0UGzhOy63f0UFA0keffV3xQjkQPfyqC+TfG2FFwf68dSH2V
	gdN/AJdNcZg7FKLL7znNgyz3zHgCu02CGXEuwtREiXkQnylbLnVhKUAzwKv3AmN3IDseHVI1pbP
	5eldooZjGr3lTQ7xTD9wRAuBgZ6NlRV5xz6a/j8goYqBUF8DMdXjeUl0gvCLFHhg5Hv/+O8Dsgg
	aEI41Ow7pyKMN/4rcH2wvJ0d25H9OW2BXA==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-74ce65d7abamr9077979b3a.20.1751727169709;
        Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl5WMxSoNRG+3cwNkna22DGFREi0kKhH38n/zY2ySFcmwRRf5Bf2PvyWedYjvXUGUcKiTh2A==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-74ce65d7abamr9077958b3a.20.1751727169338;
        Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce4180e47sm4753893b3a.103.2025.07.05.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only driver
Date: Sat,  5 Jul 2025 07:52:41 -0700
Message-ID: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX38NrtajxgxAk
 ROlbyloj9XlF9W+guMUqu/yr/8dcDg+cZ9qdmWj3jM/3HNbg0sCXXz/pw1dapRCcdAePLeuogNJ
 Hk7gELqtmZ/9QgGJMq8ZAA85CdOzN0khL/nnEgaro+KbKkz/B3/2sdl2hd2MSb9rbSt7VI7Hvqy
 uhzzvT0fzkrW9bPMPM+/d7F93fYrInHdgFRml4HjL5U58PmD4U0v90uYpQrUj89IsZiBhJcBSjX
 dubVLie9s+JZtUUw4sV1edBK6eHHqpJ2ocnIzsUiExPjQB72IINtvc1O6buwR5f4K1OC+rPHCBM
 94M7YniU4dKteQiCp7nN5ejZHWZQK4lPkFbiXbWW0r8LFlasHk5Uo+XhmKHTOGR4TEtjzWBoZKQ
 6KFY/Xr8J2wOEVyBGCCD9Si8JU7niXt+gXWX0SyyLJ13LB1Q/o3XRMQbjATKbiZJiVJHdJ7u
X-Proofpoint-GUID: JZJGnl04XMzD8xZgvAu9M7yKOLBn-0zV
X-Proofpoint-ORIG-GUID: JZJGnl04XMzD8xZgvAu9M7yKOLBn-0zV
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68693c42 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=2c09coKmtNN1XW7u8z0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=939 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097

KMS-only drivers should only allocate dumb buffers.  The driver custom
ioctls are only meant for the usermode gpu driver (mesa), and not for
general consumption, so they don't make sense for standalone KMS
drivers.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5695de1bbae2..3c856c0ae855 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -864,8 +864,6 @@ static const struct drm_driver msm_kms_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
-	.ioctls             = msm_ioctls,
-	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
 	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",
-- 
2.50.0


