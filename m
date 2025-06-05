Return-Path: <linux-arm-msm+bounces-60381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABECACF6FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4A23AF1CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7022327F732;
	Thu,  5 Jun 2025 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUa4wx1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912F27F161
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148355; cv=none; b=UPsnCnRxuUKr1AqDKoO3CydPpflkJO8qnvlwckfhVqLyjb3RrhXiR763Cr3VK2IKm7iQg7fb1iLrmX0GxLRorsNM6/pTypdaoALgZObXZ++oBZyarLtKRcDw7j6ph3cwRT0i874ZKBx6v+CRxb9Af0YCCpz6UoxLBRNR8kVWCsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148355; c=relaxed/simple;
	bh=GrGA6aQZ+A819VWvU0l5WrQm1ewySWpRFv6nLaO7aCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEOam7M6N40SBAi5/EWronGBIR0VTUpWHyrPO8Dvz1FFWQC3KG7Jahbi4WcCjzbcumhJlJzXB9JF68yKnGCvNgce5UPjo6ZWJ46rdDhZfego38631D2rCGAHT3qrUwGtzyKcADn9kHHVjRXkjICjF1NMLb+5q7XpOsJhTSLUfjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUa4wx1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HXrDG007808
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
	uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=JUa4wx1MONrVIMYhDve2lIQwsws
	4cOE0chvJ8aod9TXux8ng4rmXFhO/oFJadVBjgwuOWPdDkMpZ2oZw5z3Zmf3o3sK
	O9DsVa4mmS3kJ8cuWa8slPvUJePRZcNLoF9wpZ+6xyBa4X6lJd6Vdkxl7HDUr1dM
	gAwmBcbnAPq4devLEuvIT8/P04suQDLeDHJiHQLu5h3d1omNjsBEM0DJEUPHT8jo
	F+a1sux+uZ+2gcSTJrLy6WroRqAadVpiVVBnPlHHBYANN9CG8QraClFeg8EJRnIN
	i/jbXtrvVVEuDE+spHob9fewbWibvEbVG7FMhlZtaes71nIf4M5wF8aH8FA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e0fee459so973039a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148351; x=1749753151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
        b=VipfXodxSwOq4ypeXO4Udyq9GpZAB7hsodx/fMjJKQXnx4jqBSwi0442oH93YDt9jr
         SVqFCnVmXYkGqcq7nPVgnt9wOgQP9q21XLoCPgKl7y0inkK3F8Nicge7BsF8if+Q6a79
         tPMhnqXAayOLB3P0QIsB486IW2oREUr6hPbu6oindPnvNmbqsrRBDfjOhv3Rp0v+2qcK
         UiIh/uWg9PFg43++ikyOda5m55/ycqtuKM0DyM8GM9trQay4TB6y/UgfKWJ/0aI+nLmL
         TIzqvcSoYkyh1PdurPQMwrXrrvXO0/aZPDD/VmjSgviyEd4kGuZEOwLOJjRUEVP13hgq
         A3aw==
X-Forwarded-Encrypted: i=1; AJvYcCVWzaJzHunBllGj4nr4OWBxoixfw0XgNBz8HMRiyvUK1vJiaXcLXKGRktHYf68MePlhpkORtA9BguArJ0mS@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkfwC/qwwWYOA3XKmZzt9+BK+06DdkHNnz0QXYxfqaZfqXg0Z
	Ve2NZQiRrIR7UFd+/El7uhta3FJkEo3qw18y+lyTwgz1C1wH1i/aDo3/YQkNkptJD0EVVbVfzGs
	0H6nAi9lgtUNdhowZqCprYZV1K/moYXblhDKjTATD/LuNmhRESzCM3xVvpBs7nH4h+PO4
X-Gm-Gg: ASbGncsMuyccuuXsg6DawxXLyzu+SnEVc+hxwiy3zKrfizPkW78+dHDpyNQ0r5cWjMD
	T6vaaD+raPeWgnGqgpxWIkHIePxXj6de64dw7aMfe9LpEpMuwPKAKhEfrkUOnl7PO6KxeuMGded
	wCYZcAydSjtKUqrqVbSfUXc/NoEaYv/+gPpRsczKIPiSskmqnbq6a75bA1SBN8yrBxj9LVLojFC
	gl93ZNEkkmnNjxHW6vWJMJWSI9pNjd9uKXsSuCymvQ/XuAlcv9h7rOtgyjbgAahoo/fBWj8U9bO
	+Fgb8zE74s6nYnwBwJtDVg==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-31349fb9e7bmr314331a91.14.1749148350475;
        Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFf9Ed15WnJ0bK+g5LNOmp59mIQDowolw20rilCr32CVyAeCUxH7k2sAVz4uNjydss8qX1kA==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-31349fb9e7bmr314299a91.14.1749148350077;
        Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f6d8f3sm61281a91.46.2025.06.05.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/40] drm/msm: Don't close VMAs on purge
Date: Thu,  5 Jun 2025 11:28:53 -0700
Message-ID: <20250605183111.163594-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2c0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfX5JUNig9EQuWH
 lgykIVYhJovRAPx3WZ1mCQtlfFCjJW87WMT9+X+TQ9BeH5b5X9wgOA/SGjVKEsthvRc7B918sQ9
 yYNxIDETLrMDsD4gDW5ANejd3Hz5Vo2aceE86CQR16uweAx+aMXUYrS2TxG3Rh+5Cla2gwF2OrY
 JHPpWmMTh1aUD4ss4bVWGvRd/TXqpy8B/lKLjoDmELyQKWXd6mzZZfNpli6kVec3mQnyfBdTRfJ
 DppI2YY+7UZO7HefuQEILXxtTj2lUcoUkox07nt7YtdOVHCa5po2w4lUPWhlCR5NXDP/mkqB1Tz
 mzIEZ+MlPw551EAKzU+pXWtQWglWq/24Bscj+TANo0S7ZI1F1TE12k2spsl9vF4CbLKbtMMMaPU
 0Rvr4Gq1+q3Ck5CKAEsoQ7JzcKfCE5g0koQgHdvo/vGwQKjo0IBhDQcn3KgIsX393jZj5Q3l
X-Proofpoint-GUID: gt6piperoYqr-1lgn_uxEQcm3gOY6cUq
X-Proofpoint-ORIG-GUID: gt6piperoYqr-1lgn_uxEQcm3gOY6cUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0


