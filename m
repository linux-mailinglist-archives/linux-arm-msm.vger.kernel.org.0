Return-Path: <linux-arm-msm+bounces-61461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D597BADB4CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D225F18902CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A4A230D0E;
	Mon, 16 Jun 2025 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Haj0Tu6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D46220F34
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086024; cv=none; b=FzfWYb9USvc/q/fjegg+MK+0q9Dv3UPfYgM8gaUD5IUESe05GeCcmua4rEveWy/ymLqzVuCqpWE4Dgmzww50upc4vLt02e5sSQpC1tQeFK2w7riIVmIYFnAjO0oxvOeuCammfY6C32leBxSj0YOo7KL2jgicecPwr85CO5W1rAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086024; c=relaxed/simple;
	bh=XUa5fu/r2ENmgcJG+2qRElP/JPIBa3Wp3LBdxvtfB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJmOzVyf9HE2/wU238LTB3p2+RrJIy9bsXjChRScOwMNaTC4ROhNzpSK3V1/VhUt/uv78rKaKRtZjifX97TaT+b5c3CvP3aoGm/lJ2ywVdXfEGXOTq1ZFYAxH8XMcayvB/r3O7hYGUkUHdaQ4lph5cjZjjvuF8wFf96r0O9YJGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Haj0Tu6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8YeRL006520
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1k
	k21RgCQU=; b=Haj0Tu6M2xT442eQDTceNCrrrvqsloZgSta/oVj2dnQjY1eEU1O
	LTB7RKgx0Xpvxr05RSyqIn5AI/dRbaONgTEKXxarvHv3+kLXDbVWvTZR1YoZ/Cat
	Eva4xLN9pWtSK3+Jq4SCCnIf5dpDd5QTRe4oUMCbCJ1AiDKwGVJ8Nd5koS6xIyNw
	j4iO53knWFtI8XUsJjQD+UycKDrfzUHGsAmAVSo+iwfsUAuUvwxYOBS9WTAJDyTv
	cO5rgKLRLwPYzLLLHjSziU0frmFgOnQ9k47RpeqAZApdG0akwiLBULuOmbMA4Gkc
	wwj9iUuaSCyprJgLyNLqWeM2/oJEt4zKZYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mcw9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311d670ad35so4568652a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086003; x=1750690803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1kk21RgCQU=;
        b=YZB8GFOmuxq5QIFHEuMNCOUIweI17Vmt+aeglrPQYkfv5T09xmbgivF1UnpmVUoyrw
         bQNUrA8b4wJ7eTNsGSnQC7Y+vyFouUFGfxjcYZEmPQqKUPFEpk1XblaKDhwINCxVSRIv
         BqTKynNEQoNFzRT3JaX6LCyl+zGbpbGcyjOaz9h9fqM8KtTgBd+JFs7nq9XDRrZikAg9
         o8pQ5EbbykCaZwNrAczP5tgsJyd9Wif2156mXhyCWsMjPDWbIuAum5lwMly50G/Dhcdg
         CP8omq9vvKagFxrIULIqdSNjYuGZTj8WF/OJCJgcnKTdMnHOC4tEzDYtBTnw9pyzBRfd
         UxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTdEU/iU91z66NCq84MOuVCw+jVQ7Q2FmYAmv6egdsSF14QPplGQ2WEL8xq7HmFV+/fuk66gcl7ilCK9pN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/k+iSkS7abc4Ws5dwX1AK/YYsd5ZSNtehJUtbcCMa7ZtRtlVP
	aXn7X9E3k/RTF3CLGPeaAlaAscH1tvgmzaxmQCYq3uAnFlzt99prEuyE5Bv+eca1HWSPIsveV2f
	qxbmtk5fairueZn89+k+6ZUVgmlLY07ZQijPY4KF4LAEMXzjUG1umqBzV/pqUqQNLVSSf
X-Gm-Gg: ASbGnctem2YnWJEGAU9gUVNHeD4uHtbHnSX92uBdT7BuDyJa2FGCjWAxa//+FRVlHpW
	l07MPpRCQh17RgA87NmrRu88cXe42qpiTSKsiKyt/HWTkkCuu10Cz/nmdSkLheEs9b8hxl4IlPC
	y/vngvLUNz3inICTZPbA3SoFjgPNDBSAK71LYBfv9qmcW9dST5yfJQcWx3OLL5iJuAtuxH/JhpU
	jUlViOVP5Je3pLSghiKEC/mZdkbbW7Q5WAw3YdR1dsWfRJelIF70jYLxuhj+5XWKK++8vTL2b0I
	bTaNzvFCGNykuXmysAOi7jeYhxcepp8A
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2366b3c3897mr135205035ad.37.1750086003242;
        Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByieJvQC5PoCbVHaqizg7yUTH2Fgq/z/jFnF1lZLOWUWRn/2Xz6BKqzn/JxUX+pb3is1aaA==
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2366b3c3897mr135204465ad.37.1750086002816;
        Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0fc2sm61892525ad.180.2025.06.16.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/gpuvm: Locking helpers
Date: Mon, 16 Jun 2025 07:59:55 -0700
Message-ID: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfXzVJSo+riEIlu
 WCaa6QihzqdO52a6Hch5toIMh5UGNiY/KaIQfW2ijTbPu+2L2glQaofrHF6VgtdbyeyiWAyO2Ur
 hcSEWgIKWEtex+nI7CDFb2FJJtFcXnyhWXvNBKocgs0yVjO//gaL0bEnaN8/knouiEwDOJLcgX2
 iSwR/B2GrkjU+88DwSv4W4l2E3zn9ea0eYw/XYrO94hkBBAt+zzmb8Ocp3BjW34qg/ogBFgBpkP
 DqwPZb4De0HeHQ8KjKSUkiwzkU46TvvNVz/cD08Edj7NhlB1Xn9t9WBjBBmIJcp5POPC84wrBha
 Ywrg/x7YjpkyecIIaOORsCKLdvRsJ9le4JHfMjak+iTHIUwUrGxcpL5l6cIROQCr8a8sZEdX9YX
 tGoAZgATbqtvhSqBVPzTLEIQRfVS0LlPKtRzHFPsFE4qrGIrM76YW4qwvpMrbyGh4YXCGcsp
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68503185 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dt2PBLOwtrpqAq2hemsegjrDkv7hmuAV
X-Proofpoint-ORIG-GUID: dt2PBLOwtrpqAq2hemsegjrDkv7hmuAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=886 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160096

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.49.0


