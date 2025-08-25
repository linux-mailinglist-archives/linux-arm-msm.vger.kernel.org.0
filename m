Return-Path: <linux-arm-msm+bounces-70695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB5B3436D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADCAB202F6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC112FA0F2;
	Mon, 25 Aug 2025 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dStW5F9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181012FC01D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131492; cv=none; b=lFbMa+ui5b8CyvwbPtbB5lu4vhnCqJpVQCgkM3Kue4FaGJ2zpw8H7fx5RJIn9Dn5vAVR4oz8A/5aaHBOIfllxqcjYQl0ZmKJUwoQH5w/1pc7QPtNXw3tDWGZBbf/Lgpai3qZmGAvnHKrgiLP3DCaEkYB61XYGuiRSFN8iCBGWyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131492; c=relaxed/simple;
	bh=f7F3AhYGRgN4iUZzX4C4KkI59Hk2fJ1hIr0hCDnA4Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/h6dMz0aU2iqwdCcDdEB8VaR3P++IvLvQr1zuNg9GL4rHoHGYhB9cnLN1VgZ1vJYTbUpwfDvToRgmF6KbC2eKDlg54Ifz5k25pBWmLdrqaRO0HCB3yK5/lsC8wHGPykGU+FPqoCI65/6AbLnEa55urVXcSNct0HnjFzSYkjuuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dStW5F9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8xYVt010020
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tNrzkm6NnC5NBmKQusZe/7bD7M6yByAsNnMKNdXFAA=; b=dStW5F9HT/iazpGT
	ilpwA0mK/96+i+Bv93Crh5jwgGxqfsSNrjAo8esCaMmITM7WVDPZqqlKl/n2sjug
	lyvQnxO+m6uTR3/OuPNFaTbDQGJVfg/IZ1JhWZmwbDud3ZiObmTiLjJsV8ugbY+/
	r7aZHVFL7LWj0925SLwagMIq7ZjU1GWUGVkfJJ4AqlAxqag/4OMvcQ1B19oN6wwl
	bF/qHOsvvfsutdeDLeUPZy6r3JzoYv3MaTOTFbSXxqc+JIeYIC/B2JNQ4Cs4i/GF
	63cqzCyIh0pJJNp7dpknYJu94F50gsRBsJaSKpkO+zD131w9gCWSemMr434C/kQa
	U72J6Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47174c65b0so7908859a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131488; x=1756736288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tNrzkm6NnC5NBmKQusZe/7bD7M6yByAsNnMKNdXFAA=;
        b=QYtk7TpCyVFoRdG22/faSTB6vPUVOt9HIZdw4ypSKr6OSbs+K44Re44iQbSRaBVS3R
         xfu8lrs9YA9oi1lVlysgtJif6HenUR65389yHumwyQZnZjS3jDBCQOwHIFyL2+cRQyu9
         uf6wgltf2dDz1UvgUKWtXwNTQyY5WTXWrp9D6bY+ayQXeFy70GtQInU0Cj1TZMYLyaFv
         ckiZBhkEz1pO68v1QWFWaNB3v0yU1dFfarSMKDQum5gE6vuU77UOWyB8M8SYQRv+XJHm
         Oob21pFRbsQMq7v7D00nZPRQTQUfxLuY+38oKMSx58Rm4+qxeUUhfX8Rhqwm7Fp6RJ5O
         AgMQ==
X-Gm-Message-State: AOJu0YwnASfM+nDqeFtWNgRq5vnir4sYWB1Q6U+XFtukI/Z8JQAU1Fa4
	jEqJYzytYplvnl9pSEfYAPSit/5HgHwj2pfKWlAVguZvPLCh6JcPF/9hrGY2UuNVKlO9FsmfXNe
	OHMgDZJZ8/KuTw+1tRjI0/eoUUFdQ3QEMX3hFUj7ZC4SvkFm6+14v1IZdEDbKCIgZAIOU
X-Gm-Gg: ASbGnctz1xx107SyLTB+MZ5nBSZNMNv23KWwz2+YlwNYn7qeiImMf2nVfaBfzL2cq+5
	abAbJpEFe6RnhbzMi9PX66Hh8ns1lZinFp+VMm+Es+BMHpVuEYTvoZvGdTRGO+7250UfL9fsrYq
	pVPdRIswv3Yc7X9hBDQQf7ZMJjJoTy89ezV2EKBxj5HtXXMzbI5gerqBcUYeKKN37fIo+HmzOZS
	nfjIJtfxcNgXu153xgRVCTd4h4cE/7e4lLHoRxiAi0+MGifXfayhZ65y7skIbWZnjxmKzk/PSmi
	X/K3eQN+VM0vRnS+hAmbJq5SDeHpg0Ev+Y6bXhenr+c//HxTrM7LpIHykUN5vArhHMjCE1M=
X-Received: by 2002:a05:6a20:3d05:b0:243:15b9:765f with SMTP id adf61e73a8af0-24340d6f10cmr17849044637.57.1756131488029;
        Mon, 25 Aug 2025 07:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ1HzBewiXw9vfRQNLd4+B97QoHUnfjuI52e65+qx0ZYTu69HQYFnxU9HDs9qPlgpq31w3pg==
X-Received: by 2002:a05:6a20:3d05:b0:243:15b9:765f with SMTP id adf61e73a8af0-24340d6f10cmr17848973637.57.1756131487362;
        Mon, 25 Aug 2025 07:18:07 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:00 +0800
Subject: [PATCH v3 14/38] drm/msm/dp: Add support for programming p1/p2/p3
 register blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-14-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=11942;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=yEUuvDwmyu188sY/ZnxrJRIxTCaJhFliNhhqn1z3+u0=;
 b=HdTdBmhUk43Yom9vXzKoiZC4YTCXDcOfRJeZT195NBp+k8zPdMFzTLzSvjGOI20ebbVA7sxbN
 yg+hw5PHq7GA+gCbCqiN3FVUFYReEV825Kq6uo+XqVE+IhwX+AZYuEj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX/FVOiXVmKEuD
 qfDFjIP/AIpFGHIeO383ztoqzoDZO2ebeWl1a7OS8jr8sjykKQ/8cl/tWfIg5bz4y30teg3ItbV
 wrewO/gobwWeZtCntBfDknt3cNhjAhotY2/nTDpJGlH8eSe62BZFl8YUcR0AiL++sCCgmsEODTC
 g7T5CwOiDUbCxZYSbUzU03dKYIOX+c1uuE3oPfhEYxIlTy1lbJB7eMnhOLW97x11BxjGjBgM+hZ
 CBhD+ysErqYkS5DqA1V9wB2TDbNy/RXJUTZrFqqSuWJ+vMQnoqFG1tUcVf9LqqncLOimbGJA4Qy
 +67+6V0YFPOUvtczgPF5Mje4/XeJrJTm8wy46J0c3IO1HRXtNImz7yD7pFwrzKDetZltW/a3LC1
 LBiEHDxM
X-Proofpoint-ORIG-GUID: Sv78eyAnIvkErHd4WLLfAPPB2Ve-7w-l
X-Proofpoint-GUID: Sv78eyAnIvkErHd4WLLfAPPB2Ve-7w-l
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4aQLaHZKxtSMBsMh2sMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

QCS8300 supports 4-stream MST. This patch adds support for the additional
pixel register blocks (p1, p2, p3), enabling multi-stream configurations.

To reduce code duplication, introduce helper functions msm_dp_read_pn and
msm_dp_write_pn. All pixel clocks (PCLKs) share the same register layout,
but use different base addresses.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 68 ++++++++++++++++++-------------------
 2 files changed, 59 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3422f18bdec71a99407edfe943d31957d0e8847a..935a0c57a928b15a1e9a6f1fab2576b7b09acb8e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -84,8 +84,8 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
-	void __iomem *p0_base;
-	size_t p0_len;
+	void __iomem *pixel_base[DP_STREAM_MAX];
+	size_t pixel_len;
 
 	int max_stream;
 };
@@ -619,7 +619,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -937,8 +937,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
-				    msm_dp_display->p0_base, "dp_p0");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
+				    msm_dp_display->pixel_base[0], "dp_p0");
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1181,12 +1181,13 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 #define DP_DEFAULT_AUX_SIZE	0x0200
 #define DP_DEFAULT_LINK_OFFSET	0x0400
 #define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
+#define DP_DEFAULT_PIXEL_OFFSET	0x1000
+#define DP_DEFAULT_PIXEL_SIZE	0x0400
 
 static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 {
 	struct platform_device *pdev = display->msm_dp_display.pdev;
+	int i;
 
 	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
 	if (IS_ERR(display->ahb_base))
@@ -1206,7 +1207,7 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		 * reg is specified, so fill in the sub-region offsets and
 		 * lengths based on this single region.
 		 */
-		if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+		if (display->ahb_len < DP_DEFAULT_PIXEL_OFFSET + DP_DEFAULT_PIXEL_SIZE) {
 			DRM_ERROR("legacy memory region not large enough\n");
 			return -EINVAL;
 		}
@@ -1216,8 +1217,10 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		display->aux_len = DP_DEFAULT_AUX_SIZE;
 		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
 		display->link_len = DP_DEFAULT_LINK_SIZE;
-		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
-		display->p0_len = DP_DEFAULT_P0_SIZE;
+		for (i = DP_STREAM_0; i < display->max_stream; i++)
+			display->pixel_base[i] = display->ahb_base +
+						 (i+1) * DP_DEFAULT_PIXEL_OFFSET;
+		display->pixel_len = DP_DEFAULT_PIXEL_SIZE;
 
 		return 0;
 	}
@@ -1228,10 +1231,18 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		return PTR_ERR(display->link_base);
 	}
 
-	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
-	if (IS_ERR(display->p0_base)) {
-		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
-		return PTR_ERR(display->p0_base);
+	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
+	if (IS_ERR(display->pixel_base[0])) {
+		DRM_ERROR("unable to remap p0 region: %pe\n", display->pixel_base[0]);
+		return PTR_ERR(display->pixel_base[0]);
+	}
+
+	for (i = DP_STREAM_1; i < display->max_stream; i++) {
+		/* pixels clk reg index start from 3*/
+		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
+		if (IS_ERR(display->pixel_base[i]))
+			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
+					      display->pixel_base[i]);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index eae125972934bb2fb3b716dc47ae71cd0421bd1a..e8c1cf0c7dab7217b8bfe7ecd586af33d7547ca9 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -26,7 +26,7 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
-	void __iomem *p0_base;
+	void __iomem *pixel_base[DP_STREAM_MAX];
 	bool panel_on;
 };
 
@@ -45,24 +45,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	writel(data, panel->link_base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
+static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, panel->p0_base + offset);
+	writel(data, panel->pixel_base[panel->msm_dp_panel.stream_id] + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
+static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
 			       u32 offset)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(panel->p0_base + offset);
+	return readl_relaxed(panel->pixel_base[panel->msm_dp_panel.stream_id] + offset);
 }
 
 static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
@@ -297,33 +297,33 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_pn(panel, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
 }
@@ -333,9 +333,9 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
@@ -369,7 +369,7 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
@@ -559,7 +559,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
 	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
@@ -567,7 +567,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
@@ -673,7 +673,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base)
+			      void __iomem *pixel_base[])
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
@@ -692,7 +692,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->aux = aux;
 	panel->link = link;
 	panel->link_base = link_base;
-	panel->p0_base = p0_base;
+	memcpy(panel->pixel_base, pixel_base, sizeof(panel->pixel_base));
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;

-- 
2.34.1


