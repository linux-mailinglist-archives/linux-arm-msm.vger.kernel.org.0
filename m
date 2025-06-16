Return-Path: <linux-arm-msm+bounces-61459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FFADB4C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AE5188C761
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2363D20E310;
	Mon, 16 Jun 2025 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbYSMFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B36C20CCFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086008; cv=none; b=udLNS85g/pf0ThGR6T/Vsq7dP0jDbZvvSkH53jBjwd+D8vVnewGF/8Jwpbxxx7wKsJjvUwBSCk9amMdYn9AS2es7l1dkiHWVQqlOIqwNS1WzCVHJ9C7BbWwD7K+tzrmwSBgyu4J9avybwqXe5yrxzTLu70rSPQd1olwISa56r/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086008; c=relaxed/simple;
	bh=nXgUqQdyDTDmUCSlus96vQ7zp/8O8nNWvr6C6TQ8+ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3q7Sz9cSk/yuLTq/zqM1qjrbrDGl18+EwrmKyiQgSZGm0NeLmalmeB/AhNtJQH1mB83bPnAD06y4PF77TQDchHaVc3takq5l7i0VjGlOQLnBTKVu9nE1zjGR0U3pM/wjz7oaDyIUv0BRVdcKZjNkkQkk1hr9oG2jTesFUBzFSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxbYSMFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8rGHg032725
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
	HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=ZxbYSMFrn7l7CisnPoThSRW7Vr1
	6wo/B1bmVhyPYilbv6eAQ8x0DTGbHzQ3+P3PlfK6VD3uRlaBfkI7c9f2I45rYcCY
	/5+R0PYNux+VnLhw2uzm/2+wEEmDMtXAhWu5W1Xq4xBuJo44ua76aso1xfJ/Nu2d
	0vVCQPTTOy3vNv2AXPDpSzBJDqSKAYha34GRF6Ie5nvK9dBp/NTlHaJEkTxPodVG
	Yfq2h56XLfCGzdafhhf6PTeY8xnNFOmXCd7hvXO/X8ovJhkS4XvQiBtT3etYsNST
	Jgzg2ChR0cT4swJVH2uA52XK/JOel4yTa08r2FL1oQfagLZOtX5zoA5gLZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9vxkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so7639332a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086005; x=1750690805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
        b=fKl4sqEqCkpJ6V9OaWkCEostAxtXOaFuiQ62O9BpnGu28h2JOO8JL/+P79kVJTSbFT
         74Zq9J7T/PBydAR66Qs6boPN5z9XZcSAxTwjTbUc60lkYe4wCSFFwFMmh77MWT0hnRTx
         bQvaFvwyIaarWESuGrMaCXlenuApkXrd1PcQNntfvnHI3fuJpFA+ogE9W1ECRgaUnX7c
         88w2j+/mftUTurjm1yN4QtW0WDIdcEr/D0NxESrdZhYBq5HsQurssP28wD3q2WbF+Naz
         PGAtpuYBVFghG82srpqwUbnSryTsQG4fimkRqecoH8zedNaD/x22sZ5wT8Tj4yfJ1HuT
         oJjg==
X-Forwarded-Encrypted: i=1; AJvYcCUZS29I1M636E1uV3v3B8n/ylWqmIXvJTlHZhY++v4IHrwzwvgynKpYvatr8++RwnW/LRrWVxELG+vmAbIb@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIwDlto76RbUDbWWtbYzVyLt8l1O0o3SK1AMuaU4478zlJ4Gs
	h0jjAxsWbxwJ6DlNG3r+v3g6CwpGWRnmA96p4t3345sKKSZ79L9VVy6MFgm8norM98BMr5KtfSs
	tI2qNQl9qFVhYN80vPJJ7CI/YosWZs11qOINeC0R6z6R1YGaZ063Dvvv6LFUAMEcDaSj7
X-Gm-Gg: ASbGncvJvyaD4ZiIzxGRiOmA+hgl3graf/6x8p+fJZsBip1OxfwxFZ6EK5nhm27J5Bg
	rQKnldkZOX4Sc6vlWWcmMDKy3ghKd+0xnTSgU0AYDw4Nf7RlQK+h+teFBLmT4TA7qKyyAHBMtSj
	+pqc9qfMl5wTcYxytAcdYT+gdM1mf1Y0mQ/3q/T1+i2VR0b1FzSSRBJxukL29/etREPnZvcAwfK
	QiMwf5BMxDSIBWBo+FTEoLCE7u0T6pmHliWV55zgxJWiQMoHLC80JcV4qNjZKsM6WjRAuJ1ksE7
	ELTyjv4TqB1W3tjAb4HlcRMVvU3+OTs+
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-313f1cd5a81mr16293973a91.10.1750086004607;
        Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSwyYJbkfuG+cowVkLmWP7rTUfqw9+6BV4SQmAMwgYeSuRZuWklUdQ7zzXGTIOcmBX5tInA==
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-313f1cd5a81mr16293906a91.10.1750086004136;
        Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b6d4c8sm8716826a91.48.2025.06.16.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/gpuvm: Fix doc comments
Date: Mon, 16 Jun 2025 07:59:56 -0700
Message-ID: <20250616145958.167351-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CFzffrKMmkZ_3SI2d_CRCFvKcLxQVH2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NSBTYWx0ZWRfX8W3LgwP4/R0/
 zhiRrWAqmGBoF2jYDbWEbXPksLm+XIOiJD/U/eM7yucb8hXHOpLSMMDyC0SKk2m4QYfRcLjtByG
 0yBZxMrEYSF/In9AZ0Wj3jh3ulrhyTWVQiw8TmSy+zjtmDxqYOexxcQ/KqnT53hrQaG40MRRODu
 c1XgGELwAKRWhpCxlUyS/r1uZcP1kLkRWxsbXnYRMfCJJLoUG7R0S3j2BLxiw4QUuN6K+f9116I
 fT/tiMzdb7Kuwq8zVcJAfsBL5epbMfh1AjaTiaRM3kSAfYgwVONVSb1+YUGC3AVQZYBtfhnT9pr
 CwE91ZouNR+mmCxr/PWzwlm69HK8Kc6CGL2Ta5U+51IQKOtcN+ZOVKhDB+naF08gYuMMFY1OjR+
 BX1BxhLiJla1v/N4pm5iPbCt2MRLi838hXuzqJ8YNcRPvpNkUc2RI5CbT2rbJmi+V5cA5j5I
X-Proofpoint-ORIG-GUID: CFzffrKMmkZ_3SI2d_CRCFvKcLxQVH2m
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68503175 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160095

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
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
2.49.0


