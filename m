Return-Path: <linux-arm-msm+bounces-40351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0C9E43D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58BAD28461C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEEC1C3BF4;
	Wed,  4 Dec 2024 18:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dRC4aAz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C801C3BE4;
	Wed,  4 Dec 2024 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733338558; cv=none; b=h0rU7FMkVLWnB8GM0z/U7pRe4l0BvKJ3/rad5mgOd1L2sdd/9VZezfzWYxd4J3NAHqHpYUozpk8Cl9/AMwX/Q2bxpnv0SKNv/HmgtiV6gctxwaGutN3F4TwCcmqsnC0IHbeWv46EgAcdgFWBclQ9OMkn2hNt0A7HopUpO01IZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733338558; c=relaxed/simple;
	bh=l5Ur+NHyEFpEQ9G/7f88w6ZBwnsBE1T2W6E3dQnmj0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=HrYyF8b3hwGuyL37KvPycy7XGXjROZaLh2yj75MVwTjtoKAvrwutfwzTkGvzr9uMYSHwvwqhIG8eB9I+OCnBHhLZmXYiG5Zsj0zFw/frvSx9kl1H8KytWC/OrtlM9rqW31Rjtrq0u1TAaiA9O+98T04NVkJIuQOz+c8wqtd8bB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dRC4aAz/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4DVP4x020113;
	Wed, 4 Dec 2024 18:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i6Ffa7zLL7ofyX0vlepGdY
	6qI4DbOQEGDjynU9CKVrI=; b=dRC4aAz/aJn+EIWURFw97sngmd4YY0l2ai5YfN
	4/WFFPo9d+nG8KtUDSO0PYQjj6kAqWvGVezKUmWW9bw5PXbIVRj5ekQ7KWYgx10W
	qZPdchQLOHESo42JaddgWgzGcU7Qq03M9y3/ihwI+WWYe7a32U36y2KNjdtndYfb
	zBiCMQOAWRABXw2NDMBf1TD5pN9eZz/V5zpYxwkE0rPnlrnzUMGj3tgrU7jNptHp
	O49UlEwPDMFZK+f0dzMlPwVvx45wwUZd9eahOLnm7ngtQdZUs6vNFb8Ice5xehLF
	FTzAWz4SqwIF6Yqi7+YDCOBEDRKN2f4YhKuBgU306E824tig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3exc50u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 18:55:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4ItgZ3015010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 18:55:43 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 10:55:41 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 4 Dec 2024 10:55:17 -0800
Subject: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016 flakes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJSlUGcC/x2MQQqAMAzAviI9O9jKEPUrIiJb1SKotCrC8O8OD
 znkkCRQEiaFtkggdLPyvmVxZQFhGbeZDMfsgBa9Q+tNuER3Gc6MrnyYJjqsY6ww+AlydQhN/Pz
 Hrn/fD6C+wNxhAAAA
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Helen Koike <helen.koike@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        "Abhinav Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733338542; l=1131;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=l5Ur+NHyEFpEQ9G/7f88w6ZBwnsBE1T2W6E3dQnmj0g=;
 b=AREUP+XPTuc9ygZVDFS4WfQ0mRLYvjPV6taTVWpPtQjpQqEKHKBkMdmrSuDr4Bjk3aIAiTRPm
 84srPBPba60Cf2D9opFuDGGBOXyr2WFQ707sikUvo/upzVpVHDBL09K
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: f6ySpc52AJFsiY5hlgcau7HrQnbEkV2j
X-Proofpoint-GUID: f6ySpc52AJFsiY5hlgcau7HrQnbEkV2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=825 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040144

From the jobs [1] and [2] of pipeline [3], its clear that
kms_cursor_legacy@torture-bo is most certainly a flake and
not a fail for apq8016. Mark the test accordingly to match the results.

[1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
[2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
[3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
new file mode 100644
index 000000000000..18639853f18f
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: msm-apq8016-db410c
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.12.0-rc2
+kms_cursor_legacy@torture-bo

---
base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
change-id: 20241204-cursor_tor_skip-9d128dd62c4f

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>


