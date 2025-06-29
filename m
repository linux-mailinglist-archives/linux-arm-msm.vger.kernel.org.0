Return-Path: <linux-arm-msm+bounces-62940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB859AECD6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A76B7A1BB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995C722E402;
	Sun, 29 Jun 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MH7bbc1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B37227E88
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206049; cv=none; b=iUWgRL2GXWlxgLo/qvFP0JE9xP9Vl5vYS0j4PUEgNfw2BMAuxxEN3uEO1PAshP+jMOtH/fvLajBRo43JEY6KhGt1PpMgvUho1wp5hwb6rry5zVOwTVl9sZRUtlpW5kGfJcXeO2jYl0JAbdmCA47AHbeOuGmptW56imTMiy6tvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206049; c=relaxed/simple;
	bh=iDEV2orWmuIXKriA3mh+ffbHZMX8dfi8nDJuhBaCic0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhBR8zgo/quOI0Sh5YDA3bQ3LF7NY2k+JP4C7B8OriFQ/O9GkQclfkx2G0hMIRudy1yMCj3TOyNei0cplzCgpsUB0TJwfcNIeV8kjRR6PAFBWnUb7mMOSAraC+eIh22l5m6/+XxNOij45ZWuQpYy+IOv+7bNJkO73k4TEvVkz4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MH7bbc1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBw9Dl003844
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
	gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=MH7bbc1DFoAnrrAiKzlxAKNKmNT
	eQ+QgTpAXkqU+HtEK4xFOsAXH+cag2pGJoQ61dMBgwxSz7vnu75G2ZvFw2P1vtp3
	e0gi7JUhhRO5MnbKPl+ftIGngduKQzriFLRWkCpRNoPT+Ty5+f2R7Fnb/zNm7QtS
	uR6Uj48qzdphwtx4aowL3etKe+n9tHEjQec3EVQG7uAe+t9vxn5EhMM3MCfE9Stb
	sonNhV/HPb9f5au9y3+d+xEh6Y14iMMZllfJQxSC2hljGQ7dcrrRB1S7JBRkFU1k
	cqtbboiLHTI6HU3ugLv4i46GXH5Rg02nmIltsvZgrgFS0EkSUjEma5BwLpA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2evk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748b4d5c045so1105839b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206045; x=1751810845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
        b=vTuilD/4TnqbbI0gBykWG7yZCiqjnIZnK5tXOSzW5601ADqCcEMJ9Ekepqerj6WEUX
         18mD4LZbqGxyzBBvEBK1W2n64VJw6IdE2I26dSpGi6fwIFouPnDgO8eQUvUP4QMXGrDj
         cICA65sw9IeIgkvdzxi4XBtkUx40BWyek2xlblMuT6hu3yVZ+QC0qL1AHvm49KoNdUA4
         31AVSbGjd6shK2q/JeE7ly+quRaOQkwfI+bbvZGUSE7+FXVLZYg8AH3uc3OScq3nWwy5
         Y43NCVki0xQN0cJSsJWpyXXhokUjc3UUsfW7N9Q6kqamNy1noCaPs0uXwL7FGShRMQhG
         xeEA==
X-Forwarded-Encrypted: i=1; AJvYcCW/jVs2WqJk9bzw8+zm6pr3Gb1VprX3+WJRJj06lOB+YgNofFIAiy8Miyo0rwavyjy6MibKHKcsYoog4/0F@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUrHMcDgp3VYuBb57roCV5siUf3k8AKNe98t0u7Tgy4rgem0M
	KgvXsXGcJi+lGY3vTUh/QSXRMVyYuP6zN6hbPu3vOcacnPDkk7RdjcXL/TCmAMLmwdZN0lYqCjG
	05+T3H0/vsVSc8njxL3JVMi3b0Z1EmdE+eP/ey/G9qMBbFLdqaCgiF7U8XP6dEkFuRj81
X-Gm-Gg: ASbGncv6o0rrOa+WsXq6/ztdT3ja8N4bQYeO83tiLJfMLFSvFqLQgeQD8AkOS9rBvUG
	SQoM/0WRblLweycQ6BMagNOXVLrp3GaUk9uenARI/73KPP/fODpJs6VbdM8NcgTl3BrYAyvyQsN
	TCKNqKGA3r7tq5zoy0agU8J+7igygivCtLkMbmFBonPiHqnZ6xJnsO5syNjiMvdtB/L3odbUSNJ
	13vZGH7PyJEWYJajKhD3VLnX/LV+frX7+mE3YViASZBFIWe9eTMdQbj9keEJZsvH0mbvO3+5LMa
	aY8JSrCclK4CjRQoNfFgR4Xqelk7t8bx
X-Received: by 2002:a05:6a00:a8c:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-74af6f75b9dmr12651638b3a.14.1751206045588;
        Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENZJtEa8Zo6YKK1VC7UhfnqyS3PG4LqHA7jxkHsRhyjRhGBPSmWMeaac3G6wvZ2uQ+OkNChw==
X-Received: by 2002:a05:6a00:a8c:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-74af6f75b9dmr12651605b3a.14.1751206045178;
        Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f1ef1sm6773669b3a.164.2025.06.29.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 07:03:13 -0700
Message-ID: <20250629140537.30850-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TDezaS3MHnoKJIyPiBwPdwpivmMPO5nj
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=6861489e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: TDezaS3MHnoKJIyPiBwPdwpivmMPO5nj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3JGmkMt4hrDj
 vIoNP+XcEal9SMheY+NwZWPDPXNdu420MQAajZpNHs1ay8uDma1C/bhqUOGS+jfMsme2kFaBA6E
 bF8ahRI4TuYJ3n4V7rARvyi8x4WN4OW3/KaxsoaJrFkoSOUUTzKEDOXR3S8UPLPswE/daT1jXW/
 IhgRmtrsqYoowKOUilarrQywzmWLzha2LSnkG1GDEnv9cFclyZmSUZNQ9ShVSIMIOQ0DAeqRYLS
 WZkUPhLzoDbutHBedgN75AITUyEOggLxcyLVrya41h2qqb1VEnZFwIljQYx779q8R/ycuK0rw+5
 sK1Y9fN2GbZvzvJoDmMJvXbXU8vvQtD4urdZWMMWrYK+y7V5uj1jUTphbujSvQug6y3ghdccrxn
 JAwCckBl966DwnzfYiQNzX3lDIsfc+JWf5lRL5YrsfShjL+vL7s+eNCgwzWy0bLoR0aNp0e6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7b0430628834..a20ae783f244 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -755,7 +755,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.50.0


