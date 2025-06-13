Return-Path: <linux-arm-msm+bounces-61280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E1AD98D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 01:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA904189DAA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 23:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF042E11AE;
	Fri, 13 Jun 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5doqY16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1062627F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859034; cv=none; b=ptqK2ByER/kYzmgjN+m8XdLMK63Fa/2H/pj8+m3dO/eZFDiTW4UZ2zCzRA/C6cAI7Rt8bodNBr6tc7WBxsgbXEk0QjKhBDAAtIZ3EECYgb2vywJ8VMtMVy9N1QTUerj9FhghZ4aU/kIrerGjCNpj4FVxvut5lP6XGjQUAk2RLg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859034; c=relaxed/simple;
	bh=/79aqH+JQa44dI4h3N7cU+cWM8XecAq4gsoOnUwZdHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsXom1dW2hFUwHzm/I2xy0ZzlflVutjMd5zyBJcgyg3bkT5onOKQPobEfaS4Sljs8ElY1grqxwdfnv/9tAJCUTTjAS3dOfxuE813cNwGdcGnYWySsDe7VuImPPMRYlkG63gHiJsmwhw5SMSwoGGNIx+1R8PffeJ/LDE+IT1XWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5doqY16; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9Aq0A027161
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6n4/m7XLpgv
	1bmn1KU5WILxeVGc6KBK6T1WyY0EI2mI=; b=M5doqY16KyIl5mXiMuUzorHKCki
	boR03cwKH0hqdP4Sm5/JDgyW5hXhN4lcZB1LTzhS/++yFUEGUAxaQ8/49CsYnwrH
	8OzPTskcDLiSGpUpQHD5hPvS+OvJMZRH1kHkWw4u+8t6Hju7A1is+DJiMLUAnjyi
	nzE92AsQbsC4uM9YIQkTSUyw+lxtACiKRDEvcEihou9dJ3Vdhs4R7XC5eQu29JBC
	zGfrS7fKlLlv+TD0DCXT+0g8huMFwR8RpPxV5l2QhQqVBWgFTHFuidKuGtuqkABk
	NdNq3qLqnH2KmYrtj29faQDvq/E3mmFc4F3rj2YS6WF9Fhd21Rpc77a1tiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvmmya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74841f2aee2so1530033b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859031; x=1750463831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n4/m7XLpgv1bmn1KU5WILxeVGc6KBK6T1WyY0EI2mI=;
        b=kTR5hojHas4y9zOdPnsjB+N0E5UnXmdhmNdgPVZpmun2q/Kt2lFTDF8y1Y9rCWwPUG
         ewwlH0hLsOQE8GZxSKi/ueWEHczbL1n8Zt0LWTIw8HftbsY9yzA3tWvQu3xoolnwU1f3
         dKjWg6xh9kRBGpieqW8B/SWP1S5G8gVIqgMApQTMW3MHiaNeOHYob+ZiaPp3PnIJNlMm
         5gJFkpIwIH4CvwdjBYkIs1Vexc9dPLUtA4EasQwNBHQRwo/fWxogM3+i0BMw/ZrVSO1B
         yHMdXkgZgaT0nMkPkOaYTPsG69euMkUC6Qg0DR85whOLdz6iSPSxGeEKQu1YCDR040ty
         tRDg==
X-Gm-Message-State: AOJu0Yx4HLJmwWZ5yEVRjsyCokMdA1bNUhXF6MZWnWshcPyYXgYn1cWP
	gef3UiLyI0pdFVB9LwWS/ZHwP5CZI3/umjdrC+NFwma4x1h/TpY8plgP44iIjyciOBVCjfbRE4B
	pQ59XKC05Hx5g5QiSqsLlH3Vceanjok7NuA05hV9DgSEci8A86OkEk7NEBZqdseyQsgET
X-Gm-Gg: ASbGncsBT4wyFLfM+o1+THMQqmMDZo4e8oa23XMqfQUOvQ6KH6uowt2LVSCu4Ij7gCG
	EVSg53P5CqMWutnoDMjVgObONBD1G+tF5zbmgswUnDBKtI5tKoI4rmZTQkHbL62B6IdYtiQRuHG
	w4bPJpnrg/W0jQGoocErarHkH0fQUtUK/AGvr/hAoUY0+wbPrZHr5opBzhFPGWVE9Kz4UoTLxfL
	UlAdv8Mie47cGOB6NgJUH7IzntUHjEtRqDzH56EQSJwu80jkt0Ua5wKIrxfigd+2FJZCnljeTkT
	AyxjXpGAr73+fbAT0nuXTeshmuTk3Zbu
X-Received: by 2002:aa7:8884:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-7489ce0c6cdmr1483736b3a.6.1749859031370;
        Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCRfklBUOjp5KBQmK/hK6hjxc67A7avI5+sKeqVuyj+UT0qNB0kPJETEj0TxOCbpS0dd+Z8g==
X-Received: by 2002:aa7:8884:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-7489ce0c6cdmr1483714b3a.6.1749859030978;
        Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b28b7sm2330672b3a.136.2025.06.13.16.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/gpuvm: Fix doc comments
Date: Fri, 13 Jun 2025 16:57:02 -0700
Message-ID: <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OCWGwJ3oQYDK1CCvxfw-inVziiCWAlu4
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684cbad8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=A6x8cpN4-4lAvlAOjyUA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: OCWGwJ3oQYDK1CCvxfw-inVziiCWAlu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfXwIz6KsbmERec
 LyHEK+dc3CG8cidxVFdz6QqGiZoBlm2jFdn77P2ZGUSlUSHlCg8/8nZ/j4ff8Nh7rmFuiM/bQxx
 9f2YbjdI79DbqM+gKBVOBM9qOj6yQFwmhBhpg3CQyPLzU8Mly3n4PA1T1w48KcSp8t1CYfTkAvX
 0O6UBb8NeuVlDoaFdi1RfgaeAi1TETd1NhqPyUO+KnuyMFXWwfu/0JF4ThwI2dSyOslkVQHfpqj
 M2Z3T5JTDq/BQ5pAdIWnkqs04XuXFYSIpeWiLZXOl1UnGgG5YcKJYfBPmbMaCal8VmvuV9dw7f2
 cDdAfkRW9c4Xe8B2RQTYNU7Gdwd4Du3j0Pr32MKJAaRzp57cVZat5C0pkKsImRMHItp+Clg5vIy
 8ub1WqJWxyWPSKbOw/7c962F6E5aBQKK8I/tv0j5bEfcg6/m8GHPqK0H+hXeIBVCcYS8000h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130177

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 include/drm/drm_gpuvm.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

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
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..0ef837a331d6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1205,11 +1205,11 @@ struct drm_gpuvm_ops {
 };
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     u64 req_addr, u64 req_range,
+		     struct drm_gem_object *req_obj, u64 req_offset);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
-		       u64 addr, u64 range);
+		       u64 req_addr, u64 req_range);
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-- 
2.49.0


