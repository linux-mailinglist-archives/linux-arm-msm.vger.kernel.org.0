Return-Path: <linux-arm-msm+bounces-41152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E54AE9EA01E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031A41888263
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9980E76410;
	Mon,  9 Dec 2024 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RdRhLhvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1755849C;
	Mon,  9 Dec 2024 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733775398; cv=none; b=HEBw36l/3urWmlJ3e8zrlKnFw9xmmFhww/CibpuOBJTEmnR0gbtF+TYCG+hYJEEzxMcetowRW2gAxkycvRBb+GajOAXc1djNYJc3l+hYwRy0aiumTOnV9Yfn4NflTGRgXmAK5Oo0SZq9KfWfvML9QVb6jd4q2fQciLe/XsGFHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733775398; c=relaxed/simple;
	bh=gGy+EH4MidVC/WmjHzW+a+OjqC5q4GnLeXA1BNCg4GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kOwdKWimpRK+EzBnc/hmrPtefY0Rwa7bMB2upB5vJdSVUHk5GrYq1JtWyoDj5X7IHv1Wmi6PG4isOP3lbOYsNdI/mwcGi31E/9g00cYy4VY59WdcePt3KW8Eoa3uJ3ATkXZQnGQWodBgPOe1dSJLVI1H+XaI9mBhcjQomSQtYXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RdRhLhvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FdCw2014037;
	Mon, 9 Dec 2024 20:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=voDHPOjpIIczlKiJEkdREa
	rWTQrrb+/67DtoS1xQ0zU=; b=RdRhLhvzJYFOUjd4MyqPe20d61rOWAPi7QJasd
	b7pFGTrgUDWnHwTseuN/SKjmhZaeXkwaN5hLt3Cf+WyQEryrAF7hqKvEmM+NANsx
	to24GP1j4JjnGzHNhDB9t9iJvD2wUSO7suvxUx+ASXNmt0mvVz5r7LUy88OP+qxk
	rM+j0kyuTes+IFOTLzvjGnV72yQ82E6emOH5AHcKwES2q1mpSnVAWFUH4PxrAG2R
	doGXoDOR5S1nUKc7OpSRg82uiWkTtjHAJ1iqe3Bbpor5/nPK3CoTBGBXo1Mo6w82
	V8n3Zlqq6EKJjPd0ZKaoyjJRKDTLRDmO4SXuLfF2glg9Z7Jg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyaj9wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 20:16:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9KGSMG022003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 20:16:28 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 12:16:28 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 9 Dec 2024 12:15:57 -0800
Subject: [PATCH v2] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPxPV2cC/23MQQ7CIBCF4as0sxYDg0B05T1MYwignUXBgm1qG
 u4udu3yf3n5NighUyhw6TbIYaFCKbbAQwdusPEZGPnWgBxPArlmMd2lH+eVKRRWqWC51mdo91c
 OD1p36ta3Hqi8U/7s8iJ+6x9kEUwwg9ajNsZKlNdpJkfRHV0aoa+1fgFwe2vDogAAAA==
X-Change-ID: 20241206-no_3dmux-521a55ea0669
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733775388; l=2291;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=gGy+EH4MidVC/WmjHzW+a+OjqC5q4GnLeXA1BNCg4GY=;
 b=eemhZJati9Zykc+cw67xFAFKp9XW819+Qm8CLyWCC5zC5DXzoNaSFVdi8Lw1zf31rBRiqrRVx
 mJpZlg9wLdqBq13ecblPps38Ao9QtOWtdg38L3bOQAuiYN8C4FTy4yB
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gPuQSBa63HdpCR1niBfVtzPw-6IzS0o-
X-Proofpoint-ORIG-GUID: gPuQSBa63HdpCR1niBfVtzPw-6IzS0o-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=709 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090157

On chipsets such as QCS615, there is no 3dmux present. In such
a case, a layer exceeding the max_mixer_width cannot be split,
hence cannot be supported.

Filter out the modes which exceed the max_mixer_width when there
is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
to return failure for such modes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Note: this was only compile tested, so its pending validation on QCS615
---
Changes in v2:
- replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
- Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f6ffd344693ecfb633095772a31ada5613345dc..87d76f388bef48c880ae70ddcdb76ccb0336ad32 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
+	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
+	 * before even checking the width after the split
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge
+	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return -E2BIG;
+
 	for (i = 0; i < cstate->num_mixers; i++) {
 		struct drm_rect *r = &cstate->lm_bounds[i];
 		r->x1 = crtc_split_width * i;
@@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
+	/* if there is no 3d_mux block we cannot merge LMs so we cannot
+	 * split the large layer into 2 LMs, filter out such modes
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge
+	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return MODE_BAD_HVALUE;
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */

---
base-commit: af2ea8ab7a546b430726183458da0a173d331272
change-id: 20241206-no_3dmux-521a55ea0669

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>


