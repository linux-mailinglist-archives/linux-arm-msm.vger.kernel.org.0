Return-Path: <linux-arm-msm+bounces-70701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE1B34383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60EE35E6419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0974030101A;
	Mon, 25 Aug 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PldUzyDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E402FCBFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131520; cv=none; b=AeLy9PVqefOYi/IdQ7fSAMC3QHtCtG63mLfpxxYBfAoFrEyyW756bmCH/I0OERTtjEDAPGB3WXTlmy1c0yAWjMpsOGuMcEbpqYV/FtOF3JNpxG0Xj1e/ef7Tvy97ZFFoMsrxFfQtgsy1XiraZe+lllfGOVBR5PZgtbclV097RhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131520; c=relaxed/simple;
	bh=0qCsW8TFNc4x1da224v9yiseF4FY/uRG3fkV7UpAMwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kgON3+mIS6k5lFThFw220JUunyzxwFhpGa4tUeB8wwolGBqDius2R1WWEbM2lc+X+FmkAdnwWCgtoJemaNxxy2QfoFX7G5DSB1L3Ch1ehXmLH2kUErswLZAH9tjP2/C4ZXzz/vktYsHisscxFySHkVzvf2l3B1OUkCR19ekwc+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PldUzyDJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8eS7X026226
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvG4v0LG0z4YSxivyNcH4AvkwjEWRZAiWZY3zQdyg3U=; b=PldUzyDJwPGbmWZ2
	EjxSy6jx5k1mANXO7El7nZUiyZwXcf3w9zK7eydEVppDTl9bgOMvODhgKVjkH5um
	lasF0IYpLVsTqWTHH2wJY1iSVZe+kDi6nUoNAzBpT0v5IIivBTOTHNqkRpZYOu71
	dkzEtPP/jIGQuY63yYpi8+OwIGfjC1XmF+lxOj9J1QWZLN3ke83x7zl++X/c3x/y
	MxzKfpnVKo6UpYFpBy8u9uNH/2FNdOedqWwelARI3D0Ay1HJ2kQt2geTv/FS72/3
	RVYjiPrBpmJxLD+kYrCrxjfiTj19+45b/kssmv7JqgpOmNIFj50dfwt81fY/vE5P
	fpThNw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7704769dbb0so1714665b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131514; x=1756736314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvG4v0LG0z4YSxivyNcH4AvkwjEWRZAiWZY3zQdyg3U=;
        b=XK/XLYAfp/KijmP93I1QDrpZYl0lFyjVqnGO/eIf9amXQFFkWyRZeX6SU97AtkA1z3
         dDXPi6Ny1DGOj3Ux46DeKZ9ZQMtBVDyP2m9KzKcY934k1/madUYW9gRlnEKkaZ1wf+6m
         bKrskFjNnJ4XMKnp0fPLKNpQQJ8r/hoxO4+6W32FBZpH0n4zeal+khJEVlsCMlRIV5N5
         9mg5osuRbxbFmL/c4KSUwBg1RLjdIekEBGbXKUKIs1rC4HGA4X6OjmJ8VTSgbHPpsMhK
         eC7jAkqMdV+OS00dNqoRIKa7N9nYkKdPzI1vXee2S1vEVusGzyxjbT+26uwqBhW3ceZo
         /vJQ==
X-Gm-Message-State: AOJu0YyMMT3XRCBzV4xGd6meryLEO/MU1UiXTpQRmQ0HU2Fp0a13DC46
	4VfyXcqncW4NpnccsXv+R5JUR0Ndox7eJDC61fSGwuae6RG2lJrPNootkSkvskp2EYl8Mjuzk/w
	1jpoaHaHD/Jrv94T1a0dTmKXRILqbnrt018bfbjp2MfOC1H7D9y3qltkN3FagTVzwCLAX
X-Gm-Gg: ASbGncvNDRPvhmQhVHxvNwKpGdr5oviV36e0CUIEhBNieO3KxUZs/K0GwKoY8eLmie7
	YE5TUMNYqm+GYuX+RJEEAAAhdbPzoKHJfIqwHCTy3TSj1vVwRi9nzqm9C33XZyohUQkL/5H5XIH
	rebtGGuoOBXNMjdFlYkA7NP7wlM0YfWTuXyA9PIIk8W0NR8Amb8X6903rgqLifOgBD9RWT7o/Kh
	X+nrzYdO9kOYQP+08DI+Faz/R65MDa+AyAvZiUvgHcXHnsnnpybTV8v/xJfo+mbqliOwYyXKI6I
	983YOqhhL2b5KSK54C1qL/MjzsTovmqBOtgbq/RU004LNzh7abT3qE3ZvUiQWijoFUbvK68=
X-Received: by 2002:a05:6a00:2d97:b0:770:5031:180b with SMTP id d2e1a72fcca58-77050311f1fmr7461436b3a.21.1756131513378;
        Mon, 25 Aug 2025 07:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGStcFG+AT6nhFXlkQJ3lstXJQ8R0h8Zzs+ICJwjTF59ziTrOQkakiLgLGX/D0jrjeHpEC/LA==
X-Received: by 2002:a05:6a00:2d97:b0:770:5031:180b with SMTP id d2e1a72fcca58-77050311f1fmr7461399b3a.21.1756131512756;
        Mon, 25 Aug 2025 07:18:32 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:06 +0800
Subject: [PATCH v3 20/38] drm/msm/dp: Add support for MST channel slot
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-20-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=16233;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xogR31MBUp3CM9gfRpBjpDQfwDjJMe5I6s7gqiinsoo=;
 b=e8/zbWTqtvEmhTenBvTvjZX90LaBmm/zQ7fqJIJ6um83IK1JdCn1XB8p2qtL1XygpFqGXh9UP
 YqAMzN5EYduDBvGVTyTwnukg5wwgFgE/Xon5NyZIj8Z1AB3p2j869n/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: qLPxITlKy4CLMV3IqWLyIoQpPtHRNNpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX5Es+AwbWnwT4
 QPg7lS81AGVNle1LrxK2wUnZBFg75mxP1/+2R09/lWnkekUO5zBj6i2KWMg8Yqdqb8B7xB6zc3k
 7M/91CL4bxz/ACDXcTiQ7Mb7jal19OmLNk/6ueLQ8RsrxjzGnccKs/f2Qxdn9y66tQuPErxibyj
 LPtE8NzZkE+Qmk13c8AWAhzUJBJ1JE8RDj1VNP6RhIfXed7/Qd6lidkQWRUucvd/5uGJCmr8ySD
 UNH5jYnuED/u12TGhF63rebAbq0sJOuzDUnNpDYPvDToDwiPj0dvvUak9tUE+/hjPcpRp91M9ou
 pZ8QNWCKNiTEJJ+bK0IxpaPib6zo1FkTjf/3e5G23+/TX4thNbzKIOo7JbyKjzevTGwzaV8a/Xe
 ScdGMiGN
X-Proofpoint-GUID: qLPxITlKy4CLMV3IqWLyIoQpPtHRNNpS
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac70bb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=dHIZ7lCY0nX3Y9ypm_0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP MST streams share 64 MTP slots in a time-multiplexed manner. This patch
adds support for calculating the rate governor, slot allocation, and slot
reservation in the DP controller.

Each MST stream can reserve its slots by calling
dp_display_set_stream_info() from its bridge callbacks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 213 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   7 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  40 ++++---
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  14 ++-
 6 files changed, 262 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c313a3b4853a1571c43a9f3c9e981fbc22d51d55..9d58d9480fc4ab33c58218ef9beb54c64805c34c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -109,6 +109,11 @@ struct msm_dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
+struct msm_dp_mst_ch_slot_info {
+	u32 start_slot;
+	u32 tot_slots;
+};
+
 struct msm_dp_ctrl_private {
 	struct msm_dp_ctrl msm_dp_ctrl;
 	struct drm_device *drm_dev;
@@ -143,6 +148,8 @@ struct msm_dp_ctrl_private {
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
 	bool mst_active;
+
+	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -267,6 +274,77 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
 	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
+static void msm_dp_ctrl_mst_channel_alloc(struct msm_dp_ctrl_private *ctrl,
+				      enum msm_dp_stream_id stream_id, u32 ch_start_slot,
+				      u32 tot_slot_cnt)
+{
+	u32 i, slot_reg_1, slot_reg_2, slot;
+	u32 reg_off = 0;
+	int const num_slots_per_reg = 32;
+
+	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
+	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
+		DRM_ERROR("invalid slots start %d, tot %d\n",
+			  ch_start_slot, tot_slot_cnt);
+		return;
+	}
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
+		   stream_id, ch_start_slot, tot_slot_cnt);
+
+	if (stream_id == DP_STREAM_1)
+		reg_off = REG_DP_DP1_TIMESLOT_1_32 - REG_DP_DP0_TIMESLOT_1_32;
+
+	slot_reg_1 = 0;
+	slot_reg_2 = 0;
+
+	if (ch_start_slot && tot_slot_cnt) {
+		ch_start_slot--;
+		for (i = 0; i < tot_slot_cnt; i++) {
+			if (ch_start_slot < num_slots_per_reg) {
+				slot_reg_1 |= BIT(ch_start_slot);
+			} else {
+				slot = ch_start_slot - num_slots_per_reg;
+				slot_reg_2 |= BIT(slot);
+			}
+			ch_start_slot++;
+		}
+	}
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id:%d slot_reg_1:%d, slot_reg_2:%d\n", stream_id,
+		   slot_reg_1, slot_reg_2);
+
+	if (stream_id > DP_STREAM_1) {
+		msm_dp_write_mstlink(ctrl, stream_id, REG_DP_MSTLINK_TIMESLOT_1_32,
+				      slot_reg_1);
+		msm_dp_write_mstlink(ctrl, stream_id, REG_DP_MSTLINK_TIMESLOT_33_63,
+				      slot_reg_2);
+	} else {
+		msm_dp_write_link(ctrl, REG_DP_DP0_TIMESLOT_1_32 + reg_off, slot_reg_1);
+		msm_dp_write_link(ctrl, REG_DP_DP0_TIMESLOT_33_63 + reg_off, slot_reg_2);
+	}
+}
+
+static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
+				 enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
+{
+	u32 rg, reg_off = 0;
+
+	rg = y_frac_enum;
+	rg |= (x_int << 16);
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
+		stream_id, x_int, y_frac_enum, rg);
+
+	if (stream_id == DP_STREAM_1)
+		reg_off = REG_DP_DP1_RG - REG_DP_DP0_RG;
+
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mstlink(ctrl, stream_id, REG_DP_MSTLINK_DP_RG, rg);
+	else
+		msm_dp_write_link(ctrl, REG_DP_DP0_RG + reg_off, rg);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2634,7 +2712,105 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 u32 *p_x_int, u32 *p_y_frac_enum)
+{
+	u64 min_slot_cnt, max_slot_cnt;
+	u64 raw_target_sc, target_sc_fixp;
+	u64 ts_denom, ts_enum, ts_int;
+	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
+	u64 lclk = 0;
+	u64 lanes = ctrl->link->link_params.num_lanes;
+	u64 bpp = panel->msm_dp_mode.bpp;
+	u64 pbn = panel->pbn;
+	u64 numerator, denominator, temp, temp1, temp2;
+	u32 x_int = 0, y_frac_enum = 0;
+	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
+
+	lclk = ctrl->link->link_params.rate;
+
+	/* min_slot_cnt */
+	numerator = pclk * bpp * 64 * 1000;
+	denominator = lclk * lanes * 8 * 1000;
+	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* max_slot_cnt */
+	numerator = pbn * 54 * 1000;
+	denominator = lclk * lanes;
+	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* raw_target_sc */
+	numerator = max_slot_cnt + min_slot_cnt;
+	denominator = drm_fixp_from_fraction(2, 1);
+	raw_target_sc = drm_fixp_div(numerator, denominator);
+
+	/* target_sc */
+	temp = drm_fixp_from_fraction(256 * lanes, 1);
+	numerator = drm_fixp_mul(raw_target_sc, temp);
+	denominator = drm_fixp_from_fraction(256 * lanes, 1);
+	target_sc_fixp = drm_fixp_div(numerator, denominator);
+
+	ts_enum = 256 * lanes;
+	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
+	ts_int = drm_fixp2int(target_sc_fixp);
+
+	temp = drm_fixp2int_ceil(raw_target_sc);
+	if (temp != ts_int) {
+		temp = drm_fixp_from_fraction(ts_int, 1);
+		temp1 = raw_target_sc - temp;
+		temp2 = drm_fixp_mul(temp1, ts_denom);
+		ts_enum = drm_fixp2int(temp2);
+	}
+
+	/* target_strm_sym */
+	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
+	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
+	temp = ts_int_fixp + ts_frac_fixp;
+	temp1 = drm_fixp_from_fraction(lanes, 1);
+	target_strm_sym = drm_fixp_mul(temp, temp1);
+
+	/* x_int */
+	x_int = drm_fixp2int(target_strm_sym);
+
+	/* y_enum_frac */
+	temp = drm_fixp_from_fraction(x_int, 1);
+	temp1 = target_strm_sym - temp;
+	temp2 = drm_fixp_from_fraction(256, 1);
+	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
+
+	temp1 = drm_fixp2int(y_frac_enum_fixp);
+	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
+
+	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
+
+	*p_x_int = x_int;
+	*p_y_frac_enum = y_frac_enum;
+
+	drm_dbg_dp(ctrl->drm_dev, "mst lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
+		   lanes, lclk, x_int, y_frac_enum);
+}
+
+static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 u32 max_streams)
+{
+	u32 x_int, y_frac_enum;
+
+	if (!ctrl->mst_active)
+		return;
+
+	drm_dbg_dp(ctrl->drm_dev, "mst stream channel allocation\n");
+
+	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl, max_streams);
+
+	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
+
+	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *msm_dp_panel, u32 max_streams)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2688,6 +2864,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	if (!ctrl->mst_active)
 		msm_dp_ctrl_setup_tr_unit(ctrl);
 
+	msm_dp_ctrl_mst_stream_setup(ctrl, msm_dp_panel, max_streams);
+
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
@@ -2742,6 +2920,39 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id stream_id,
+				      u32 start_slot, u32 tot_slots)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	if (!msm_dp_ctrl || stream_id >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	ctrl->mst_ch_info[stream_id].start_slot = start_slot;
+	ctrl->mst_ch_info[stream_id].tot_slots = tot_slots;
+}
+
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl, u32 max_streams)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	int i;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return;
+
+	for (i = DP_STREAM_0; i < max_streams; i++) {
+		msm_dp_ctrl_mst_channel_alloc(ctrl, i, ctrl->mst_ch_info[i].start_slot,
+					      ctrl->mst_ch_info[i].tot_slots);
+	}
+}
+
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index abf84ddf463638900684f2511549a593783d2247..751f00c97b94dc3b9e8fae2a86e261f71f293425 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *msm_dp_panel, u32 max_streams);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
@@ -51,4 +52,8 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl, u32 max_streams);
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id stream_id,
+				      u32 start_slot, u32 tot_slots);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eeba73f81c5ce7929dac88f4b47ac3741659864b..17633ba79aa7642856051b69227e8f5b23d76730 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -733,7 +733,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -817,21 +817,33 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-int msm_dp_display_set_stream_id(struct msm_dp *dp,
-				 struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id)
+int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
+				   enum msm_dp_stream_id stream_id, u32 start_slot,
+				   u32 num_slots, u32 pbn, int vcpi)
 {
 	int rc = 0;
-	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_display_private *dp;
+	const int max_slots = 64;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (!msm_dp_display) {
+	if (!dp) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	if (panel)
+	if (start_slot + num_slots > max_slots) {
+		DRM_ERROR("invalid channel info received. start:%d, slots:%d\n",
+			  start_slot, num_slots);
+		return -EINVAL;
+	}
+
+	msm_dp_ctrl_set_mst_channel_info(dp->ctrl, stream_id, start_slot, num_slots);
+
+	if (panel) {
 		panel->stream_id = stream_id;
+		panel->pbn = pbn;
+	}
 
 	return rc;
 }
@@ -1533,7 +1545,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_id(msm_dp_display, dp->panel, 0);
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
 
 	if (msm_dp_display->prepared) {
 		rc = msm_dp_display_enable(dp);
@@ -1550,14 +1562,16 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_idle(dp->ctrl);
+	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
+		dp->max_stream);
+	msm_dp_ctrl_mst_send_act(dp->ctrl);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 9442157bca9d63467b4c43fa644651ad2cbcbef5..fa92f763d2304f15af7c4e1e7e8aab5a6ffd3459 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -48,7 +48,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
-int msm_dp_display_set_stream_id(struct msm_dp *dp,
-				 struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id);
+int msm_dp_display_set_stream_info(struct msm_dp *dp_display, struct msm_dp_panel *panel,
+				   enum msm_dp_stream_id stream_id,
+				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 2bfe3695994235d04e209a2785915107c6a8e413..cb5bf6c99a6f7a68995f0f0ac48382dc90beca31 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -50,6 +50,7 @@ struct msm_dp_panel {
 	u32 hw_revision;
 
 	enum msm_dp_stream_id stream_id;
+	u32 pbn;
 
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3..ee4debf796910e00d370ab4c687009747bae5378 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -364,6 +364,19 @@
 #define REG_DP_PHY_AUX_BIST_CFG			(0x00000050)
 #define REG_DP_PHY_AUX_INTERRUPT_STATUS         (0x000000BC)
 
+/* DP MST related registers */
+#define DP_MAX_TIME_SLOTS 64
+
+#define REG_DP_MSTLINK_DP_RG			(0X0000011C)
+#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
+#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
+#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
+#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
+#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
+#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
+#define REG_DP_DP0_RG				(0x000004F8)
+#define REG_DP_DP1_RG				(0x000004FC)
+
 /* DP HDCP 1.3 registers */
 #define DP_HDCP_CTRL                                   (0x0A0)
 #define DP_HDCP_STATUS                                 (0x0A4)
@@ -388,5 +401,4 @@
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA10     (0x018)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA11     (0x01C)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12     (0x020)
-
 #endif /* _DP_REG_H_ */

-- 
2.34.1


