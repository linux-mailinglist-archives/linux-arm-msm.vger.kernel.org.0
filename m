Return-Path: <linux-arm-msm+bounces-21678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 324498FBE50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562FA1C2104D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 21:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC8514534C;
	Tue,  4 Jun 2024 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AJq/IzHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AB313CABB;
	Tue,  4 Jun 2024 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717537893; cv=none; b=I/NxaRaS0QKXNFjrV9DF4EuZ0eTB0l+sj9FVGvIedI/l3rjsPmvgfMyanl8POFhPyZ6/fT1s/agcLP6RPbO6HjBSmr+AtTVFn/GlJ9qBJVwywFS7tdONqFx4AvseC5EAvuh51/Q+JOjw483GHd7QbTGtLp50qO304gvLVaWTwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717537893; c=relaxed/simple;
	bh=NKrVVaT2VSenG5RCbKYSlOUEbICJ7JwfxOaMfSP1uts=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gCYwoxoa2kzbMQE8Cg3UOD7MqfgRZ/uJZoNthcck4S3keHGj02oRv4t+Y9WfqOUFveg8lmpf23spDUbY2wZh4TB9SoD0S+3uxfHeQMoyzlA7FxA6x4PgSv7hRvRmtPc8T7hPMAo5AbfA45+LS2pJ7z0SGpvR0HSnYNNKz9LzhXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AJq/IzHv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454Gr0hU009373;
	Tue, 4 Jun 2024 21:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YLq+m/pw8D/FB1z2FxCUtv
	Ua9O85tXqCcv0sNFbrjkc=; b=AJq/IzHvYdlut9OFfNu0bXOuLwdixNBghCq2WB
	mmLZica0lyoxqZImLQhJ5IWYuX3DQuzCmpM+2HdPYX9BoXl/RhAjku4INMzvUT/W
	7Q3fhKQ57sQHfWE1f/mfbhhqchQ4yOPsLsQs4LV32tkfoXttyjEmdpVlrWhDXqZ6
	tQ1c14ueqx5rSg+sDFc/z02N+wS3wjs/V/ji/e4giqdovFZ28NnRcDEabFH4lqB/
	7ilpYJS9KsmngD6E0ipvxmRmuBiEkcrqUE6cNL5CZCBoayS4vYHRlPTR4FdVhTEG
	nWT0vmWxaCEp0MSQf+RP0/2rc7tl7VBLiKgkPtjhv3NzI66A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj6u78mcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 21:51:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454LpLqb027421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 21:51:21 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Jun 2024 14:51:21 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler warnings for gen7_* includes
Date: Tue, 4 Jun 2024 14:51:04 -0700
Message-ID: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YHtPMzSLTHxjnNphM8gVa4gqld3yRZp2
X-Proofpoint-GUID: YHtPMzSLTHxjnNphM8gVa4gqld3yRZp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406040177

GCC diagnostic pragma method throws below warnings in some of the versions

drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown option after '#pragma GCC diagnostic' kind [-Wpragmas]
 #pragma GCC diagnostic ignored "-Wunused-const-variable"
         ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning: 'gen7_0_0_external_core_regs__always_unused' defined but not used [-Wunused-variable]
 static const u32 *gen7_0_0_external_core_regs__always_unused[] = {
                   ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning: 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
 static const u32 *gen7_2_0_external_core_regs[] = {
                   ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning: 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
 static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
                                           ^
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning: 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
 static const u32 *gen7_9_0_external_core_regs[] = {

Remove GCC dependency by using __always_unused for the unused gen7_* includes.

Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0a7717a4fc2f..62ca0cf24005 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -8,19 +8,10 @@
 #include "a6xx_gpu_state.h"
 #include "a6xx_gmu.xml.h"
 
-/* Ignore diagnostics about register tables that we aren't using yet. We don't
- * want to modify these headers too much from their original source.
- */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wunused-variable"
-#pragma GCC diagnostic ignored "-Wunused-const-variable"
-
 #include "adreno_gen7_0_0_snapshot.h"
 #include "adreno_gen7_2_0_snapshot.h"
 #include "adreno_gen7_9_0_snapshot.h"
 
-#pragma GCC diagnostic pop
-
 struct a6xx_gpu_state_obj {
 	const void *handle;
 	u32 *data;
@@ -1350,6 +1341,10 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
 	int index = 0;
 	const u32 *pre_crashdumper_regs;
 	const struct gen7_reg_list *reglist;
+	__always_unused const u32 **external_core_regs7_0_0 = gen7_0_0_external_core_regs;
+	__always_unused const u32 **external_core_regs_7_2_0 = gen7_2_0_external_core_regs;
+	__always_unused const u32 **external_core_regs_7_9_0 = gen7_9_0_external_core_regs;
+	__always_unused struct gen7_sptp_cluster_registers *sptp_gen7 = gen7_9_0_sptp_clusters;
 
 	if (adreno_is_a730(adreno_gpu)) {
 		reglist = gen7_0_0_reg_list;
-- 
2.44.0


