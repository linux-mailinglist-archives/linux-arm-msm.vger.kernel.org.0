Return-Path: <linux-arm-msm+bounces-70698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 968D9B34376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0F4202723
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263912FF66D;
	Mon, 25 Aug 2025 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn/7odVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44132F360C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131505; cv=none; b=HJye2f59C2pGvcyc8JY3/tTFx9mfYO6GrFcuVYRJob/X699a7sxtHmCs6b1xHyHRJBQd/yMOQTtumWVeV/xUWxInLDVY46BrZ2WE8p32nhXmMFfSBKtJ7vsS5WFrWw2hOeFYLivUUa/p1S09APrtgcLgHymQrezGzkN03chBgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131505; c=relaxed/simple;
	bh=eOdd5acxn/QH/EuNsZd4s5QzffdHatbjC4bljw+DUps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzO775ZyDTc6VHVKPiv6Brhjvy8ypyJESfFJh2zJc8aCH76QQn61EjzDWvaULXxj4wAhxIDAgnmpnYIkoVyuGeaRUfvk4CrE1vNeGz89yolYnm0Tan+E+RtmAdW66a1Mji9RkDZ0zhK7CMFDEt5vxYVTTMxJ+jjLs8lnl98wWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn/7odVp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8UqkV025091
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S97xfzDnKS3Uzcg2dQp2II/9dki/AJ5FrXKBWp/4mJg=; b=bn/7odVpaPvaDPLp
	FPhbjewHdElyUb8dZSXKXoI3tk5gRhWF9d8p9JI+4K+d+vEhJiqWbC0gqxQEidXF
	X6WjqE6XjusFsBHcQBTZtbWm+fxWcat+aFaAn7pljsaaMqTUsO/g+yd3pNrZUg+a
	ziTqKtv7qVyWhpakTxaSRhY8gxXaVIv/sjKDuNdTI7chruckQCjnX8MFrOSapfLr
	4Rr7+JeOPRPuXJ2V/97eWNTBWfXBmF4CaAuO04B0pjnuM2V0RtrobbLL1QaN4Aib
	53ywALYL8k9B7pX4dcm6ZqkK0egVeoo6i30axacAVY64nskYYz0oywZcVHj7o5xG
	VmLCLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5ecc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c1d26b721so753389a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131501; x=1756736301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S97xfzDnKS3Uzcg2dQp2II/9dki/AJ5FrXKBWp/4mJg=;
        b=CRkuE2W4OA3c9RitaPNXjo2IWup9YrrjGz5T3aJ2rSrA+HPyheGfqkkTNi+wRv/S3u
         6vapIpiM+jBlexLAiohf+JlrmPVd4QdC0AhM2aMBeE/0dsSD1xH5FLBXBzgr05rq6Lqc
         gx+6TzFRD/j4jrPQq0lfDvOwr7djB430fy8sRmOPqP1Jc9SDlV17Lpu+Fpxi7EB9Rx6F
         r9CxcRumhSVbvxikSvgeUbCvtuLFrgkl2N/yl1fLvJ8kx/Mg0THdG42diMJoSCGfiD/x
         IfUdSTy7Bw9/14plf6PbljU9i1257Z0aGNU4J3kpmsoidJ9nj7i5tta8Vjx0kRnNsLAF
         vQUg==
X-Gm-Message-State: AOJu0YzegTbsOYaVOfQ0QrK2J/8N4rXd0Xw64REqQr+8WeVrnpqQYxHF
	nkMyMv7DOQ2DRImGHapIvab+qLWEY5Yb9E9OpqCwBqS7xPAXQoJkE5ToCWiDKMhtZpw3jHxm5dw
	8RACIyraYoPJcs7b9dyDRQFhAjxx7yDnfu5pe0VT3U3O3wabWSc9TpnU4atnkcsHbRUNP
X-Gm-Gg: ASbGncuwAu19vF7X4wBzcdh96lRPW+vprvRh/Yu0Uy7BDGteaOoU1MzVuQAxz9btrXr
	KyN+Tr8HLxfB6DWoMafmzBlNV3XeLzXhsYXfS2JVeLRGo0vT2NaA+WeUUAktptErfbsiv0Kf5Ix
	vUp74rsUH26+vUZS64sCIa1o+1TuKmhzUiC/YAYaIcZxMf2n5pVbLDABV+gAW72oCXBDhyH5i1h
	1B144nHzDREzz8ctlFrVzfllRJRZ9CVlBUH3TBWDbfwO9Rf4wcEQnb2dl/Ly2sFelcyCrVYEKci
	Y4dYr7ovlihLGM1hKTqLYRJGz/aNhKXvmZCJcRzZxZ0wgSKcq1zYkr+EF8QvchXQTb6yb8A=
X-Received: by 2002:a05:6a20:6a10:b0:23d:cf88:e31e with SMTP id adf61e73a8af0-24340bce29emr17260207637.8.1756131500628;
        Mon, 25 Aug 2025 07:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5arkjUzVNJ5jCXhjWga4elq02RJLl5W6tBVkQ9iOtGcyqonaD7uN0htNTu0O1qjKh8C2UGQ==
X-Received: by 2002:a05:6a20:6a10:b0:23d:cf88:e31e with SMTP id adf61e73a8af0-24340bce29emr17260152637.8.1756131500122;
        Mon, 25 Aug 2025 07:18:20 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:03 +0800
Subject: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=7389;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=iRovUq7/YF+lGbK1zxrqjEtTAew3+WgTHmJO5xYvjx8=;
 b=lmw7H+vN3zd5qVpSfFIVCnf8kQnTPXdjUzsGImdvNsBFqa+0VP2DBmWRp637jKata/BH4J5lC
 hkLaLkQkGHaBEUXf84Geuq6Y46eIEmFd7HmWktWglfVhpRnedSSNLB7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70ad cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ohnT9xpZyUatSXMy1HkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+C6WAGCcZLVs
 pETKo8rWCqyKj91hOcBhaUUzuI2k+PZwa9O/n/u9iqI0MRzo4OjXqvg3MuHXqlIvtXAH8qJCpdU
 NoqHJyU6IxuGF5d6JN4I1pCEI/P85e11NanrD6AWtHOkJr1zcVT72wne41qJ+nmidZXzvyVuZav
 ickPD6Ob3W2D9glXg8RqkdUztLVywtUutH5P8I1sN6t5ba8Btii53g/+apeaPZ4sk/MjLre31/2
 W+Qp51+d9JlpztetRQ9t5QxQf/4i0nddlJXz83BuqylfpCIMb8CRHlKcnGpckGleTLa0Rn33BtO
 9SMKBMBhpB9e52HawUU5/7ug7d542O2K7MWZhrcpNmDK1CzPTTNbvG0FSD/W6V1lCGcF7Iq1qUj
 Day7LUbF
X-Proofpoint-GUID: klSoqcMxQOKKSdMVk7O7rThE82gDAFBO
X-Proofpoint-ORIG-GUID: klSoqcMxQOKKSdMVk7O7rThE82gDAFBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
 5 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return 0;
 }
 
+void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	bool act_complete;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(20); /* needs 1 frame time */
+
+	act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
+
+	if (!act_complete)
+		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete SUCCESS\n");
+	else
+		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");
+
+	return;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2079,6 +2106,8 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
@@ -2275,7 +2304,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
@@ -2355,7 +2384,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2373,6 +2402,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	ctrl->mst_active = mst_active;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
@@ -2643,6 +2673,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2682,6 +2714,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
+	ctrl->mst_active = false;
+
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
@@ -2849,6 +2883,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2baf7a1ff44dd7139d2da86390121d5e7a063e9a..abf84ddf463638900684f2511549a593783d2247 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,7 +16,7 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -50,5 +50,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
-
+void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 562a5eccf3f08c5669cc7c2ad1268897e975d0c4..eeba73f81c5ce7929dac88f4b47ac3741659864b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -709,7 +709,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
 	if (rc) {
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
 		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
@@ -1557,6 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index a839d0a3941eac3e277185e42fddea15ca05a17f..9442157bca9d63467b4c43fa644651ad2cbcbef5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -21,6 +21,7 @@ struct msm_dp {
 	bool audio_enabled;
 	bool power_on;
 	bool prepared;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 	bool internal_hpd;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index a806d397ff9d9ad3830b1f539614bffcc955a786..de3d0b8b52c269fd7575edf3f4096a4284ad0b8d 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -158,6 +158,8 @@
 #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
 
+#define REG_DP_MST_ACT				(0x00000500)
+
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)

-- 
2.34.1


