Return-Path: <linux-arm-msm+bounces-66933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF60B1435C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893263A9603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69E0229B15;
	Mon, 28 Jul 2025 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVH+Tlln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666C1FC0E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734862; cv=none; b=dXK0Mm3Ntxo81uqEZ9hVmgOpIwSuX2iMhXnSZSzGui+zAO4JE8UCwsYVZKRk7/R8xm54PH7Cod2Kr1OILxrbzA8tRUT5Lp6LxyqyZKEOR/Xn8U+d8y0Cd1QHwaW9FaQPg9WKxRi6pasglkThXd/+iMLmdmTBYWkYxPBQvbOjt4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734862; c=relaxed/simple;
	bh=U+ZmNomacuLxHtKNQVm5cEtjh2nkXR65mIV/H+xO5dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f21C/FW9QVCamAJxigoGUcgwKczXdT5d2Ex5zNVzsngxI1B5hPhDnuy6bXSmGIHo/AWc5qwdPHUZJhOyrmlKEWufaM6enEdy829hmEmvjxEFJWBtUFlTP+Dp20yy7fmIDnCdiDteuTgsK5I+6bQfVe/CQQmHNkBJWjKhssCkibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVH+Tlln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlNce005104
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A0+lIarkug5
	bI2XIrG4czP8gMx8w85UfEvs/RUlisrI=; b=eVH+TllnKQmh+pn8Li5q7mtiA5r
	teO23vGhVz372m5F06S0sneA01PZmQMLBtOr8PfuCtm91UC36diTq/BDvYfp+XLA
	5N1ZEnGSAQXZM+4m9q/aDRNCo3RmdCv1oPm8T3FBVEMgYMjgecjbMpMg5co0uatf
	EPTF2cqwM1bX6qYjJWKl3gpxV0mgc0ojGUp367vC+bLp3eNrozTEBMXhw7N6ETN8
	JHCWo+poPGUf5ci6hKgPHHefemzZGxSAGn3tG4rsN0tJyj3JCziNmAnoOoGcAmnx
	PaXB5VyvIAGDQa3U9HEjMke9RWeAOTn6pbU2oVELhvtI1yBy5yFL5sbOpxw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytx06m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ea83a6c1bso2128476b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734860; x=1754339660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0+lIarkug5bI2XIrG4czP8gMx8w85UfEvs/RUlisrI=;
        b=BVHObiCwUmsc3x68vafZ1uEglmURppCQq9XpZAY7w7CMw4rOcY5KgFSEkahgD+qROE
         2UU2Tewk2sVGGQnfO/EUMUl1+NmOrCQk8mqBSFD7AxCKga5EmNOgRQjxkH6d3aVv5DOs
         UgKOiVsGGKt+jUhqUZRPe8TX9GwFH9s0yqFqJHt8alQLTHndiQwB5i3OgO8xs/nhXVe4
         z4VuXp36+31x7MKiHAszZCwrnAIgie9kSlh/ivJN715Dtb+iwpjDhEvNMDKwPq0vxKd3
         USE9TL7aGE6ROj9KR5AAaCMnrakRGaWOyFDyFGhRfyMmLR2hXiEquNra74Zm1SUv94Yd
         T3jQ==
X-Gm-Message-State: AOJu0YyMpCH7wDYgkC14OjjZr9zONtgMAYEIKuxeHyu9CxlNcFsFzUQ/
	vH1gRXwwBbsArpSQSRP2scoZCXmRi2VtO9UzAOrUOkoBjdP1LOwh1IJONVvMraP3QtZT0q1FCqu
	elXY5O66VSIyLsrANxMMx7KP9AbxIspJeZ7GN3lfy5+hR1xo+L7Ws4CHaNIZqSfHTaXlS
X-Gm-Gg: ASbGnctrfunwsZjgbHjdPLOOgcGYBHK1LmhuVznfBAY9V0G6GWMYbfTEiutQ1R2pTT7
	tKoWMXQIO/f12CR753byZLcc5loDrkR1JitRZkqikvlcU+aYOCBA8JzEwjFr7YmQ9InPF1ddppc
	IyZ2cBxXgwsVKYf7OJOYLr3J47v2tiVd6cSv7ZOPwR9mgNlV2a9MURhVKzW/j4YDDlznbnkl8fe
	MJl6ngIuExp1Q4mPotQ82FceDR9HqU+VjbAb/+sLBuK9o08F2pAemEmrsgmRYbeh2XvGtZ75Z3j
	SONjTqIIfvV0ahjEkstcDHcSLE0qmPduqja3JYaUHdAg1i9cFAA=
X-Received: by 2002:a05:6a00:1384:b0:748:ef04:99d with SMTP id d2e1a72fcca58-763386bee18mr19109549b3a.14.1753734859639;
        Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2U4D3i5dSnzRYsZjd3vL3u5W2DMJmemVWB+nFUZJ81pGCKxZrWX1gOYjxX0lk0X30atUWdg==
X-Received: by 2002:a05:6a00:1384:b0:748:ef04:99d with SMTP id d2e1a72fcca58-763386bee18mr19109519b3a.14.1753734859229;
        Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c02706sm6282388b3a.39.2025.07.28.13.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Mon, 28 Jul 2025 13:34:01 -0700
Message-ID: <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R0OxH7CZQjSQIuTNl4EKkfuCEv_8VWYy
X-Proofpoint-ORIG-GUID: R0OxH7CZQjSQIuTNl4EKkfuCEv_8VWYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX6chP7KiOpB5a
 9zpYTnBeRF1W8nYEQVpC2RSxJK6sfsFSaYKAjnoluNQs1e7URalBdiUv58/7rt2nvIZnS5t434N
 lEDHbmx+poR0J1lOozMqDwqsN4tig22mzCDkqRFR5TGJn1f68HIY8pwhW6I6PEQkGQQj5OUhpP+
 SWyNv/kn5hm5OGI391PV7oL9GhhTOUinehs7Ziuo+locOwZxoNeAssUu2IoG9BKiC27ykTJ5pG8
 7l6QLhIhpz6iMfbhzmUlUggEEE/7iPVT8qPHYCVYGh2vCFcyVwVInF6JODJ1KZPTSIni0gSJBh8
 PWo7OVtPGL91+8MU7K17l12SMksEzpsinKsJjrVOLe+UyazCrQ1X0s6tv1Zhl5XEOCqkmDWbbIn
 Jyz1nMIIJt6xmq/NI6Ha3pfFO8f06zJR9iKboT/aQfNCPuvHpnNYpZNDFJGloxaPIM2uMmsS
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887decc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151

This is needed to properly interpret some of the sections.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index faca2a0243ab..e586577e90de 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1873,6 +1874,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1


