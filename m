Return-Path: <linux-arm-msm+bounces-21691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B88FC0D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 02:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA611C2097D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 00:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B60F5C96;
	Wed,  5 Jun 2024 00:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fJdOoOd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14819463;
	Wed,  5 Jun 2024 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717547374; cv=none; b=lxE8C/fvhI8sz6hXuScP0cFekkvt49qYfSv8pzOBucOZ2p6iOH/AXCdaFN0FgNYjwVGrjQ1Avh7qJjxm61EhFEy57GyxSGeUec2Cv2ARlpLmAZ200QLaQ7Fh+VgDu0salOJJQ0Q4/slP11YTmuYVTIFLQBbWDRYRtgRF53+/kCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717547374; c=relaxed/simple;
	bh=u/knzlM7OjEmdCAJzyoWeHguJVEbDjQoLTrldoBR9Ck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RVfHAQn6eoMJnG7AeZltLTxokBM5cDd5xK18zw5YmbL1fX+8jkPD2Drp15LqF1wobSGkTXXO1tlM7mB46Publ0ip1y7jUNuauJmQDchC8uasZ0+RsVl2BrgWyNnx0RSluAVazrYlWBNui81TpOya5iJMROW25jqnzTk3hVSUh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fJdOoOd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454LDBC8000992;
	Wed, 5 Jun 2024 00:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gs77EA47eNwbjJSZUfLLf7
	l+3bRFgEdBE7WweJq2b/k=; b=fJdOoOd6LYb4tGX2KYEUTr5GmPu8uIMENb3U1v
	JlW0jm0BCojNhUM8Yc+kVrYLtWP6slgwsmAeph3VItdls02K/OHW/2HspnB+4EbR
	2iOWiUyCXZkIdxlddBh28poJSD4NnP2VA5nfHR8+TtdA152eQEQxUXPddyzkmi10
	i+/tPHYFSoaPq0opeSpxV4ihqHuz6gnrulbr0iKZi6ajJSsdjBlkkcOtoal4VJSH
	MqTNuCwERfDCmaKLnKWrhhn59p5jLPnlDnjEWuwjLjg0qmnvC59SeicujPBdTrZa
	MR4yzp5MJyrBcmCGaitsLJ6gpKwUrtJ2Miwh56N75i41lGSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjan2g9up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 00:29:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4550TLaq017056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 00:29:21 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Jun 2024 17:29:10 -0700
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
Subject: [PATCH v2] drm/msm/a6xx: use __unused__ to fix compiler warnings for gen7_* includes
Date: Tue, 4 Jun 2024 17:28:58 -0700
Message-ID: <20240605002859.4111643-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qQLHf32RZceFfHAguF2nkrk5o70kSj-p
X-Proofpoint-ORIG-GUID: qQLHf32RZceFfHAguF2nkrk5o70kSj-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050001

GCC diagnostic pragma method throws below warnings in some of the versions

drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown
option after '#pragma GCC diagnostic' kind [-Wpragmas]
  #pragma GCC diagnostic ignored "-Wunused-const-variable"
          ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning:
'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_0_0_external_core_regs[] = {
                    ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning:
'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_2_0_external_core_regs[] = {
                    ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning:
'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
  static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
                                            ^
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning:
'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_9_0_external_core_regs[] = {

Remove GCC version dependency by using __unused__ for the unused gen7_* includes.

Changes in v2:
	- Fix the warnings in the commit text
	- Use __attribute((__unused__)) instead of local assignment

Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Link: https://lore.kernel.org/r/20240604215105.4057278-1-quic_abhinavk@quicinc.com
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0a7717a4fc2f..a958e2b3c025 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -8,19 +8,15 @@
 #include "a6xx_gpu_state.h"
 #include "a6xx_gmu.xml.h"
 
-/* Ignore diagnostics about register tables that we aren't using yet. We don't
- * want to modify these headers too much from their original source.
- */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wunused-variable"
-#pragma GCC diagnostic ignored "-Wunused-const-variable"
+static const unsigned int *gen7_0_0_external_core_regs[] __attribute((__unused__));
+static const unsigned int *gen7_2_0_external_core_regs[] __attribute((__unused__));
+static const unsigned int *gen7_9_0_external_core_regs[] __attribute((__unused__));
+static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __attribute((__unused__));
 
 #include "adreno_gen7_0_0_snapshot.h"
 #include "adreno_gen7_2_0_snapshot.h"
 #include "adreno_gen7_9_0_snapshot.h"
 
-#pragma GCC diagnostic pop
-
 struct a6xx_gpu_state_obj {
 	const void *handle;
 	u32 *data;
-- 
2.44.0


