Return-Path: <linux-arm-msm+bounces-64670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81050B028B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02BB51C8213F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5991534EC;
	Sat, 12 Jul 2025 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTK3Zm+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55AA1F4607
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281927; cv=none; b=HCbl1XqeMv4uIqYAWR7LMuMf2TDXw4EKeVefeLeEjQRmg2IcF4mETZO06Hxq669mFjuwi4HcRxtcY0go52aiTOrGH5pz1x9FKXtQLz2cxZ5u/rhl3/age3sLnwX5e0afs+6809XeG5Ssb611QgEIrziy1QSo3OAGWf/sIBRtBwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281927; c=relaxed/simple;
	bh=HTrS6sAi/jnAaHRctTTXyFxWe0sOyzNOXSJAQUs3eeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=As1mvtENXTY++1MXxrOHbjgLvTHAGiYIFOr08oGq2aduP+QeBpVm1RD4O4XHI8ekm5SVQiguKmeBfZWkBdamDKHCbxscPxk8b/SSSQbPaOflpMxJpvYUVZIJWQbBFURPpHfcULNL7JMGd3R6OC0WAFwE0Iyz8r1FQX2cQj/cdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTK3Zm+7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAu5gX018178
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnj/UdtLS2aJT6tt+mnkQtsgFuu9yNGCn+96IC2OnLA=; b=WTK3Zm+7AdUZi6nJ
	+w4v21aGD9luQc3Iy4CZdymSx0pOmpYXe1z3yzpi+GRqjkeMHsXIQjqpUHe+SLV7
	Bm/uqPeIeEfWiryX6IEDVKlBU6hUmYoB8esnMkVOuDK0gXvASWABIYN+UVGbA794
	VY9WQgUAwMrZlHCWmJUkRAzouEXm4Afo1zpX4jcSf7B2pBJdBmux6IBvUg+oeB6x
	QjQMSeGIW/lmfOycsAWh7YOHvn2Nr1j+WfpzWhc+uDWOr+zdJ6VcuB/SneuREgLt
	127nOOCoYn/fF1wKcg19GjEmbGn5kVH9Yozb6QIw2HUT+khoIev7I1R8NXU8jI6a
	YmDJuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234fedd3e51so24903875ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281924; x=1752886724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnj/UdtLS2aJT6tt+mnkQtsgFuu9yNGCn+96IC2OnLA=;
        b=kGCi+c1jR51M0m3n9BM+klSxKgQIcvXyTX+OkE7u0QLUYD/zjzdupDuaeFLDMDvOlt
         jWlAEiErybDwse9o/bWr8ss7PtnQGdgwyyIwNEECUbpPSr6dyKulwOJKsqOXozA2JAB7
         7t0WeD9Kd1r3tlLMIPtn4nqluepwpQDCTS/WwHNPdOEwCaXEO/EOxk1B9xTqLzUqkumx
         pgNVH4luSGsMHbecYWtubpcZziVH+rziJLOAQxnwzcSw4Mzhffn9WErYZk4x6Oe1v2Mi
         UFtWDwXMcsW8eJlAqo45BsGJIcQnt6jaRa5j0T5xmANQTI30r5x3hmlP7b5YL8AlQX4+
         rE0w==
X-Gm-Message-State: AOJu0Yx3jqOysDvEo6GIIJzv8YeynWBROaPDidtWFbrNOvuSfhjP7oG2
	2SUTKN35OH825NIDVYvjoswR1+2VzD56FjwZMIQcL4MdJqORpR6toSnzmE3TKyqlm6vA7Jv/QKn
	xYcuqQEuoUNoyLzNIrja5FOHa17q2PKT0G9XIf1FUkLPpJP7myQcpmaKxVuB9FINk3OTYncV7x/
	go
X-Gm-Gg: ASbGncv4ZWNxR4owcDbF/s9y6ofAOr2syFgy8Z4jn5LwTOfMTFPrPOYmn6imgmVaNJ1
	JGyC9c34A/OjoTYnmym3NjSooT0uwBJf6IdqclXRd49xDj4DFNZVc1S2naFxHUf8Zmh5I1XYwqz
	zGJELoi0MIUge47QQlxtFWJ6bvJpAeGkhACxy0alODYdNdhG3XGWiKmAY7WNrrwMWkFVTAQacyX
	PzcyMbPngFiBJVYl2nodpufdFC5tj2qoyUzDo5e/dAOAZvVtTf8mkz3fSjfFT++tmXdkJtXnLx/
	uPxo04EaauWTwXO+Syjz/eQzLuvNjG8jw4n54u3l/cKdbZPKkZX6zk82CmZ4NkiWMHussrB5JG2
	3S39OGTrBZuCqWrW371UKuj4v
X-Received: by 2002:a17:903:b8f:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23dee0b4bd8mr70465375ad.33.1752281924252;
        Fri, 11 Jul 2025 17:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpusDhFVgrUlTpfeonAK2ctLBAovrbfhCYztjelTtDsWRdvt1q8SMY3jgvBDzdtC7LdCLSHA==
X-Received: by 2002:a17:903:b8f:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23dee0b4bd8mr70465065ad.33.1752281923817;
        Fri, 11 Jul 2025 17:58:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:16 -0700
Subject: [PATCH 11/19] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-11-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1085;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=qiVAy7LBnLe6xWk8rAe5U/Lv4H0O1vYH0pwvmDHYaFw=;
 b=PZTBGq2SsGnfTa5lANcBGzPbzp7hYuocHgNU0oogVN6pQFC10FUz+KRyjf9Nzx284+35/YVOz
 5xYZPq9PivYAlMpkfEHmc9/ZugLlIvRMkX1fYAWogVCNFlRr7rNwUi1
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX77/WNQVdf5g+
 vw+PNHILY5DPOPyuNP2wP4H6caoA6t+0X7yaMkR1gYvQMpy7JzPKOVOhGDmfy6kBvqyVHRfUbaz
 9xicapIDlpT/6dZh+GRzHA/oCIQavXLh6YmzwGeBLXJxiC7KKoF0ctoXYQ67e19/CR9Bvxh6cxv
 mSGJTrBH4ZhG/lQ3umqqOCSMViN9lSt9mHpSCVZx3Vb9w90+qTNC5vwhf3Dl9l81l815D/797bu
 73v7+QsIcStZYuYu2FEWNCSmafgnikA4g2e+8e95b8piPbeiqAxlSYtn7l+l6mlh7SNKkvjI9PH
 JOJTpgAaq7AfgDmC/Wk4h78Le4QUN9R840DEVkgrTb+upRdH7FvbOk0tt+2sncxLdYx02YaZyk9
 g4rdn4HCUMm7FnJJTaStAcbkWXH4tKNo19ehiEO/6li3RjgoemQHWCsje+nVKmOOZ3ouMQXE
X-Proofpoint-GUID: UetD5odn-fIAxDWVurox0SPdGz4BcZgB
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b345 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5EiMiATjTmrooIwbMLsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UetD5odn-fIAxDWVurox0SPdGz4BcZgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4c9a515648bc..17093b78900c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -49,7 +49,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1652,8 +1651,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.50.1


