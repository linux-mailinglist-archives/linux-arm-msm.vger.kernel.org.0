Return-Path: <linux-arm-msm+bounces-44465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDAA06887
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2D118882C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAE420468A;
	Wed,  8 Jan 2025 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QuVwCHMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1C202C5D;
	Wed,  8 Jan 2025 22:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376098; cv=none; b=pra8wdrTtbVFKqq+orcz8gnB47Z6tKhkiFlL3vvPhAbGXRdsc6cIJJgDZodQYvX2f56ThriAKevb4Ez0k3zshrRHE+oqBq039vP0nZh7fG6gJgfIOeew1K9CM7Dw1fpe+47ymQZ1JCa7q623oSIKHAJQOWC96LjMRcO2yhIMLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376098; c=relaxed/simple;
	bh=JvhnzdCkzx8UxGEDqwY/7d6wrr/+0swpIVsU0GVlOpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=owUdyBXy+I3VJo8TuYY9AijspGuV9L1KT0J/ORODeOTrJccqbTqDwulOH5FwFwiHiyiP3Lb6bB1B4iunJKEkQkm5OKRwmWZw5v9Z/yYZ/dC0h/vbwfCL3yp/RdWWLuUFXVKOpYpgusVYMSdMCygn0PgQkRgq63cfFWMUktrqSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QuVwCHMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508JsvJU018173;
	Wed, 8 Jan 2025 22:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HL11VLoNdpJQ+iggHnvfL9+GiILbWPOPAyO4WGoSviU=; b=QuVwCHMKtN8zLbf7
	+coIXkkq6ejlx+nvFxPY5j30bh1LDvJH5JS1Gf5FZacvWHn1mbxwbrt1/LFaez/T
	5n+xnma7YBHfrEdYzo859gOGI/7jZ7jXcgA+BaiH76ojTjasCbQZHrH9rOFFkZcg
	Nvgp8JXML9iQdWZdJwNNrPYtRZPvSvcSGVkrMxhF0hPmbA+jeEfBEC8LQoeiEbDq
	+/3KCppEJdqVufRu8PbXt4dOnU3D9XjZ1pcv2NT+pWaS2S1FT3oR9zoxHAVNpG6S
	I6P2kQOWB5ibCnOni98O7PCYFQcgTpG4BHUZair5nB9eJW7MpPaL6SikVw5ONeYj
	9mvlwg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441yxfgag5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:41:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Mf6EL030465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:41:06 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 14:41:05 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 8 Jan 2025 14:40:47 -0800
Subject: [PATCH 1/2] drm/msm/dpu: Initialize return value for
 dpu_assign_plane_resources()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
In-Reply-To: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376065; l=983;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=JvhnzdCkzx8UxGEDqwY/7d6wrr/+0swpIVsU0GVlOpY=;
 b=exZwUm4sOLv9SvUJDLlfd91wfvsVNz8VHiCrDMakf0sJsU5WWN8mSKDYbpReX9NuYDFQ4fIn5
 /HWNbJ9LeeDCgKNF85Sv35+SENS4yibhpuu+F7SmH96ZuOeq8WXC1Za
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _KA7mnolnaLcX1JDlR1ZQonyc2e3gNZE
X-Proofpoint-GUID: _KA7mnolnaLcX1JDlR1ZQonyc2e3gNZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186

Initialize the return value so that the dpu_crtc_atomic_check() doesn't
fail if the virtual planes command line parameter is enabled and no planes
are visible.

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];

-- 
2.34.1


