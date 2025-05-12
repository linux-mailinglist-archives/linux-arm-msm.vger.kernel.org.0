Return-Path: <linux-arm-msm+bounces-57573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5AAB2E1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 05:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5083B539C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E18F254862;
	Mon, 12 May 2025 03:31:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4D224FA;
	Mon, 12 May 2025 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020708; cv=none; b=UiC+lrg4hHC1YKtYS40S3kPDQszs3y8vIBT0FiHAwLY0RM7yqcs5Lw5T3/qbokb///3wLxiUbqYnjnf9i1MoaKaubn9ZS585gmR9gfhx8Y3aPrY7AriYaEEOmwiqRyiWM21olaizBkncBhpCHYco0UUbYio2LOJIiulXFcZBmRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020708; c=relaxed/simple;
	bh=1UfzN0drI/52aA/1kE18PAPZsjm6Wigacdpy3q4D0FY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MMMsFfSZRtPAsmqrjC9ad8h31w+qB1qyTJeepHqCZCD7Bd3ynsBTXZHz/zNfueyynZZrh8E12+79jFJ+2MnQRhR8drqIsZcXhqyGrHLpYXw6/EB6i08YzAaZFHHHb/BROYJTyMqnpzOaxAu/Hywq534vg31B95GcsaoyO8KafvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C20FUr026933;
	Sun, 11 May 2025 20:31:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46j6ajs10s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 11 May 2025 20:31:35 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 11 May 2025 20:31:34 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 11 May 2025 20:31:30 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <jianqi.ren.cn@windriver.com>, <robdclark@gmail.com>,
        <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <sean@poorly.run>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <sashal@kernel.org>, <quic_vpolimer@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <quic_kalyant@quicinc.com>
Subject: [PATCH 6.1.y 2/2] drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
Date: Mon, 12 May 2025 11:31:29 +0800
Message-ID: <20250512033129.3331690-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jUe6BD8Shi0-jxbKpTp8lwmGI_5xvz9Z
X-Authority-Analysis: v=2.4 cv=c8irQQ9l c=1 sm=1 tr=0 ts=68216b97 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=t7CeM3EgAAAA:8
 a=Il65ExNKTjwmHhc7HzsA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAzNSBTYWx0ZWRfX4lurK13BdaPG fEReN2NNX/aSdG5vmDuTxPLaP+60ScXivK4QA8yWKzYrkQ2xlsr1M8pTV25ZshrX7jADPCS+0L8 TZaWdX9Y8LNRKQo2XwfWJDuMbr1hiwBXI+JjpYTz2nLfwwv1xduQswcNB7GDbt8T2uqx9sWO4X4
 5XKrTzgLW8RqfhB86Xfylqggt6afs3I4AD2SqcZITEhO4/XPnBqW+ildly3IYx+0Ig5Kvx76X7H Rq3HuPgdI74NOA3vkaTcVNr81IIUg5K2rm3+a/O8/xpwLEkvrc7CFbuGCnxMVGuYqPMFzibnw7u AmGo3b1EqPiNWXuFEZF8j4BJv2HTwl0SN59y7l6iP2Gg6pO3UewZXTFLqRuXHbtrUZ3k83PylSp
 lQ99a38BIyEVQVRSlYYzsG/98gnbN5Kwqqp0yndqF9pa6fUXR8fgPEEN4VAhxiD9IDL8BCXu
X-Proofpoint-GUID: jUe6BD8Shi0-jxbKpTp8lwmGI_5xvz9Z
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120035

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

[ Upstream commit aedf02e46eb549dac8db4821a6b9f0c6bf6e3990 ]

For cases where the crtc's connectors_changed was set without enable/active
getting toggled , there is an atomic_enable() call followed by an
atomic_disable() but without an atomic_mode_set().

This results in a NULL ptr access for the dpu_encoder_get_drm_fmt() call in
the atomic_enable() as the dpu_encoder's connector was cleared in the
atomic_disable() but not re-assigned as there was no atomic_mode_set() call.

Fix the NULL ptr access by moving the assignment for atomic_enable() and also
use drm_atomic_get_new_connector_for_encoder() to get the connector from
the atomic_state.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/59
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK
Patchwork: https://patchwork.freedesktop.org/patch/606729/
Link: https://lore.kernel.org/r/20240731191723.3050932-1-quic_abhinavk@quicinc.com
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[Minor conflict resolved due to code context change.]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c7fcd617b48c..94f352253c74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1101,8 +1101,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_mixers = num_lm;
 
-	dpu_enc->connector = conn_state->connector;
-
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
@@ -1192,6 +1190,9 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
+
+	dpu_enc->connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
 	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
-- 
2.34.1


