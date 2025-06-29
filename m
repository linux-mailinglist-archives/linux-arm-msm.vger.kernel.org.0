Return-Path: <linux-arm-msm+bounces-62987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A250AED051
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74BD617241B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C94F23C502;
	Sun, 29 Jun 2025 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBueRC+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2C23958D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228151; cv=none; b=UBE4auKTkNdPHgVMg0cWsP0vmySrNcIau5tur3LjtceYxw25BsbBhfZk379uvovtXge9Am+8Qx/yoZOtwdYkehg5EiWlCt+3mP9e8sEsfuuPtXV4RL81RqO2RsWJLr+ufke5c6UkiKgPWnQOGHd9zjgZ8vvZJNvbU5tDhuW9n1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228151; c=relaxed/simple;
	bh=8HUCsu07hAS/bP/QpqqCRLMr8xpiWxvBNsplcx3L6YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFzZhNIAtAcys9GIX17Eyg9eID+nE6e5XUpwct0QMuObNPgQFddpsSWn0V1bmWsJMGjwrD72jFa2UuYdz2+ttwr/dbTQz2bm98DNwxaep8zoq6MpeZPyYcLVpYAxLCtjbf8BXhYoGIgo0JXR2X8it8eJQ2GpUJzzxVN9GKtEuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBueRC+D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5w7kV001630
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
	8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=WBueRC+DWtG4IoBeo0td/gZKv9s
	LsG7wlfllHBIx3iAzAgDrI09reJm1oAWqhAwPNvi6WUmxXEH1YD3BleCbjGmnD9b
	PVLrrn1jtayMTJv+ScgufcCsct/69OQwB+MtqvgE26MEZXOs2OB6wtq4Om7sVca6
	oFu7J5NoSh4XnvbSt5xMkrcKckX76gT6IwY7IvJOIJMDKwIZIwcI7+LvRb20QSNs
	WOHos/5y/ZcHpzE0AMZTRbJddhmUe8Xel7aiYbmj26xO5I/0Yyp3+0LwmsdxOcqo
	HrZheKGcXcX6C3yDp59TyyOiEOuAwmDxzCkCgRO2ZoZybcojbrMl9JK7KUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234b133b428so25518995ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228149; x=1751832949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
        b=LdnjiQUcFC3clAeG1/dtXPHmm9FDfUkaV89S3L82vVnE8psXzAlI81dqCxlc32by+o
         0qp1SN82AD4mdcflIRWPkbJVZ8DzwyWjaHmyC1NBvrTd0R64mc7qpSUD674dSyxojzBs
         m0bkIsByKz3jwv7IIsuclqAGCjJWaSPz4AiDccBokOYY+eVM3BMm0ZHAPF+VnyVVsebe
         OJpnhjZa2TYjvKV3lN9+hlGE2lX3tVCN6SoN0NWDJ7QVlB30fp/BX79sBUNTpGCS8iUD
         8tcQ0TFBPa91YeKeThpX9hkud0M2q8bI5OC4ekP5jf0EEHdeLX8AwXkdFOixNjnkb+qM
         wJRw==
X-Gm-Message-State: AOJu0Yz1JrTHVXF1Renn/1pRtimyjWW1x25cUlF4lzvdkqepqpRmxtNE
	mNTUjiGbEiqF9tKIYhvZovPCaBAOcSxIGhtsntoahk59lS7aDTIIqRQxCKZoELZXhC6iFc+AXcT
	yjsReFElbDWS5Va/hgI8O0n3Ly8PIrt70RgQldscC/etM8+qEzOdu6NVZyXlRNyJePGKg
X-Gm-Gg: ASbGncu+cGW5Ysb7iirPqweg9ll+rTURfTN6hlLTC3+qOjqlnEFRpbqZNcqK9Poc42r
	a0ZQOzxLi6/drxJ69BMRmeJyMZgVrfM8aEmRL29uSplVRA7h4K87/pXFq0KR/HaJQnrPqKMjH2K
	bMNdjtRUM9DxHXw/qsHBtPeWNnZOVbkUt4jAdsxxiTZk556OMr9eLll//chVPLdXsTH10wyNZmM
	O0G4IGuLPCyxYGfHUtyeF+Pyx4YJmYdBzKqFjaQTUgGiMz9hk0ih1ZPKrLHk5itUzO0DmGptOVj
	S5FE7/pB/zROsU7MiPj+CWrg+Ct+UKpVzA==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id d9443c01a7336-23ac4645042mr135124585ad.53.1751228148715;
        Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeOYc4WiR21Bq+E+1OUk+x6dI7IFpiybjWV5ofoONV3kzSQEbyT8y1EfO5WQ1B1UfNOdo3Mw==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id d9443c01a7336-23ac4645042mr135124245ad.53.1751228148224;
        Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c54b8sm67165975ad.217.2025.06.29.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:15:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 13:12:44 -0700
Message-ID: <20250629201530.25775-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7ogjNAxGkyemPhk-MwH8MR0MNiJmJuAk
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619ef5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7ogjNAxGkyemPhk-MwH8MR0MNiJmJuAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX4K0adSBa2kHu
 Alfb43dPNjsLmcgd/VZxUBC2R/lGmIs5EmiRUt+ZMxBn6s6aVqE0lYf433sI9OpfNqUwYQvi57p
 psb1QLraMe/I0m33xqN7d8mu+KAinqFbneiwkDYi8ozv7UPN/4cE7/oLQLVHeWEx7R4K0okgiaR
 PjmPz0dcNn4XAJ3Vl3qcQcu9t7z2lSgHAAgfW4eEW8pFF1d7DHmCtMrPoBkWwXcxHJW/loILH8C
 xL81XA01p5Qs8+Wugn/EBUGrUgQHCVAnDLsmkM2GCeeIP8DaodmG0WrRU9OU9yfGTyNJKrvNMdu
 lXPhf/NVjmzTrfXeBERFPKmQ1/ibDxfn0+2z64wnHAR6k8Z0UHGgsXYKxYwfqLWNvWn34+VILpd
 JwfLv+hnupViUFhcA4dz4BrRzM1OiKnFr8X2iFclY6UkyMvug09OCU9W9os727EhDTJcQnf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.50.0


