Return-Path: <linux-arm-msm+bounces-66937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28FB1435D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 762DC167D6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBE027E061;
	Mon, 28 Jul 2025 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zn/Jihe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEF27AC5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734868; cv=none; b=DsPwJv/+ac91/6ziyiT/icGRE9pK9j7axypw6k/Fhsf40ydh3erZf7tCnu9lIOYbXG74rjJXZTe3Ivz3oT29vzsUtnO3nJ60cXYvuhkCmeEH+cSPKAEJs3cD7OD2RlUJXuMoS1tWnetqMh7uocfkSPn/Kv0pvx0yH5XSe9cQj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734868; c=relaxed/simple;
	bh=8V6l3AP57/Q2ToIGiQ4XYsiXilViuzjLKRtk6DrANT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQNkbxJO+EOozgfKtGGc/IR9oshA1Tolm4n9rcfOc1VeMjr/8yEMqdw5iYLLMqcgKw7Y+eyrgALOzBmzoGdDv2XteeCl+8F2KzliqTC14Rj3Jj4gl2tba5PCw6sXeM6E91cTAvmUgeAhi0wK3v/y5GUtuFZHA5HsOQmR628/TYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zn/Jihe6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlPAB031269
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I8t+2xKA9TH
	HZTmJzGvWTh6YVgWzaeQG0zONpcACs58=; b=Zn/Jihe6d+bzp6z/IcaME1UWJC5
	GillVYY1LDFxQ1lU6yCMRy6zJ9eDOUpeeLk2BDSfXrjIDPQdU1oqHMxhDHUsX0nI
	fZCvXDNCn/8+y3k9RddhKe94kfDoKawqT6p4oGEaMFFBNWFsM6EimnAHT4AsWrMB
	dXERVW8mi4U+Fe3AXQ6Vtouqcps7GtB68ykAow32KhqSJkp//9DAi0pnIbWeMyXV
	LuVpFO5gOaYg2vAnHqZpHBPj5eh1ubi0qfopGR/VIPND7xH/AgUkfWI/FyW7tP5j
	g3LLkwIe9X4zDktg0zi+FtTf7taMjldos6ut6xJp+zya5amVH5tQ33zOzkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xb5ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so7691679a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734865; x=1754339665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8t+2xKA9THHZTmJzGvWTh6YVgWzaeQG0zONpcACs58=;
        b=ZYvOKTtQbeQCxWINDOQfLaSho2U9szYgKSwG0Hkts68DknyH/QseiQrIzs2LcZnX5b
         PtiUH1skr4UwcdqHcMr+Uys18v9X65Klw1VN/yQPFiznZZldkfnrDlvwuvZ66SNDslpM
         LUe0qBn9vBTjZAmv1sk4gSIRveDRlW7GzZFLnbbyEyuh8ypgx4WTdVz7D1XSIw+8/Zs8
         ctzNhsy8LicFObPxzXFsD6KQmSXcDecvrJGBOEhF4ttM3tMElOCG5PGC8yzVkekHrkaG
         MYAn+vy+2L4+4Um+Zn4I6hEPiEurUW00FjK/VERZHU9nulodtYk9kci/VR4AZBPKl6yE
         LwvA==
X-Gm-Message-State: AOJu0YxJk13JDjrh1TkHCNqJYhkPlvD9V9LhPtFC8Y6eguzcgK86bNxD
	hTJPLSwa/1408TlsVV+RMCr67x5pZAys9LwVBHiM+VN2JGM25JaemE80PyM+ZjjSjPKP/177qEL
	gJSzmkuhhV4Sr6JC3/HtjXg6d2/bFnC5Fqn1r5BZP28tI/OcC6cOlVbkOuPLtwel5lh0l
X-Gm-Gg: ASbGnctebAVxs9ZgXUbZY4BoZk+dMvtl2oUAhVfk00D9XLNJRTQE9WbhVzb1MZ2FLn0
	Qvw0HXNvyc0kmgsZtj48y/XgqPB7o08mWNd8MJJkR+brkgda3rTcqvs4Gz8ymyRcEC5eD8EViWb
	J+5UjJ8QpHlH5s9K6XStxjXQaiZ5T12nlj7x99F1wFDG4SYY4zklYPgBqrkDGe0FiDeWmxI+osE
	7xKvp8SONtDMMsmkBJxQv1Tr8q19K6e2Ew0DxYhwq0m4B5C4gJiIK8UfP1H5ozwkXtxtG2RkF5I
	f0okf08OM0gHUA046RRiVRl/rZzSI0/Knn5H21G7mqc83u66xPA=
X-Received: by 2002:a17:90b:2409:b0:31e:d2a5:c08d with SMTP id 98e67ed59e1d1-31ed2a5c5a1mr6681374a91.33.1753734865324;
        Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdlbZQJgZiV/klf4QMEE5MCR2s1YEQimkMRUs0qJyT+RaCeltmukYVdgn4Uepp3jzkO6MZlA==
X-Received: by 2002:a17:90b:2409:b0:31e:d2a5:c08d with SMTP id 98e67ed59e1d1-31ed2a5c5a1mr6681351a91.33.1753734864911;
        Mon, 28 Jul 2025 13:34:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f00e778f4sm2480959a91.23.2025.07.28.13.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:24 -0700 (PDT)
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
Subject: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
Date: Mon, 28 Jul 2025 13:34:05 -0700
Message-ID: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX5PTuDcQtYk/6
 qe3/m6XFyWv/GHm90K51JJBxxJei8gp3o79RJl/gc1+KB2RRSVhzIXt3LCgb15kgxro0QoChx3S
 P1SVax9O0gf4UB4/a10cHwV4NWADcV0yfWfJIwLJxOH8JSoQU6rNLJuxb3POSLUzMYKkMFVFdbT
 RK1X/GJAQYQu1TWNi2kiGjMbCPyMNe9uoDgupQMor4AfdU1EkvIDNI5l4qhNMh32/xRXFG6ev+C
 yD4TPW0sp9ir2W8ju7xXm5FgrQfp2ZFDvQur9fUg9Sl2XH9WZ57F7AC1iSZvp19+pBmr5tKdu26
 niZKFS59byZOLpSxIz5Fk+F7gLbQQOxIwMafPfce+UT2jn2ho2H73nkaCVyJBQAZD9XTkuxR50R
 gkq+sSABw/w4DE4jDphEApN2TkRd+za3CBzodwmUUYs14LDrPlR7YXkDSBxXw1H1E71heD9j
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6887ded2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=E4Rgrv4FocJ6r0LxV30A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tFmxPdrOoo1RiRLurx7WnuJc2JHf85HR
X-Proofpoint-GUID: tFmxPdrOoo1RiRLurx7WnuJc2JHf85HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151

The bitfield positions changed in a7xx.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7ba7113f33cd..33df12898902 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = FIELD_PREP(GENMASK(7, 0), offset) |
+			FIELD_PREP(GENMASK(24, 16), block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
-- 
2.50.1


