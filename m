Return-Path: <linux-arm-msm+bounces-70705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA59B3437C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0EE189B7FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D25301493;
	Mon, 25 Aug 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEUoI8gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF192FABE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131535; cv=none; b=XEzrmovVzLVzXyYRFTJzZPtW1HTXuB00toR9wNaCg/KPdMK9QbdBhoxHlXFOAYSUI9RJ9mOwqR0FGxP9hR+TJoRYGVlNjyPDOZAHlJsxIKekqxrm0tVG79tqsMvt74ZDAY/jy7UeG+NFrdGKOHrVooU2hGJRxr4kZJi4A6r4Hjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131535; c=relaxed/simple;
	bh=ok2J1ncKZhzq6h8j0iyyMlsBdkk+QSoAY2tlcPlXCOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ft02W4yOfEOEkPHiAqolHZozLYrZ2SHPp2OCtCgM/urNg+0G7tYeiR+i7w7fb+7Bs9fAS0ZneGBVMwy36DJXkei5kn10no5xSI28T9vlGfXV2sCuiAnSxgb2DOHna53lLG+b/q41/MWBGQb4MYmfvW2hz0eflYhiDHinlchqddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEUoI8gg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Qllm030514
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSyq8KcWWc9SY8S9T7BYsynBMQBCpqZsSmzW34yxxkU=; b=GEUoI8ggB360UQD4
	/qhtxeoSHfBYO8ZUmY3haNumkCE9dgCIYWmkjZZziftcH2DZ/5zyKYYCrT29/Wkt
	gqQA/pAwwioZEp2P31p3gG7zoaHV3cpgWUkJBahGoKj2jtHThZ5gxNR6ZiXx1CHR
	TvIybqoX64oh8D6nk2wdddW+E256CTC2yKIGBGXoUBGZDTOiK2fk1vWnt/uLtV/t
	GAQkdeVOAqhjB5dm2TlYwOE71yyB6P0iX/Njqcs2ZDS6DjN3ZxoKxXYW/ykoQmQh
	syUFXesNH9vrZspxtEXws04FrcLZ+qBA7xYXrqIY+SGGs3Cz6tKBHP+Edrr0P8Dr
	rc+YYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so4476980b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131530; x=1756736330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSyq8KcWWc9SY8S9T7BYsynBMQBCpqZsSmzW34yxxkU=;
        b=Vm9fdZq2l0zsy02LT5aXmVgfDzQlLZJquyxWoqU/G0W5piUidwGZOgOE2+GB4ictxV
         0eVjNrrpykRa/D5gQf5rf4OLWLxe5dDyl0CBp3kp/RytH304WjW9V810R/2++LbRMgNT
         OUxeVAEsxfdQhjOpeGVM8QxPDldRIZquhY+nlANHQHdCIy0NupX+t6d8ucy94/+5DkBM
         PWEdPP5fRg+M6rOJBK0Kzw12CTbW7FCFUczCS04l/Sjn407vovvwg1Mi5nkJOyguPlIW
         Ol7hmcwFfAHu6E5uE7Vkf5ZkvMwSEnW7kSjMxI+HPisYFOFHnVvH1HOhDn58XDaa9jNk
         ezSQ==
X-Gm-Message-State: AOJu0Yy1HFRSWZvjjDw0+PTNp/ouni6XQSe9sLATc7dgabe9D0kzvDNc
	U2gNz9Z44374FFHeuShQQM62ZXa5JtJ3F/+MTX5WRQa7hMI9xf10Q1mH+yZ2fSSI5BAG9NpxKNo
	yCLsrr7fOlAXjhp+0XdaP5FkIgijMobx22M8FIdLWOKY5HF+TJNjDexZKO79kG/S/HrNv
X-Gm-Gg: ASbGnct1DH3Pt3E0Ham7irwhsehzffg/7YQYy2NsEnB/MBJrBAeQfmD9w6PtPVKKwD8
	wWRKhI4NrMOBOGa3ql3xfxI9EfV4xwiBkPDuJlnj11w/uUHJQvBjnY6vp5SVL3m3eznFL9D6TVp
	hfOhAmSHchLQKvfMLfkzG/i6cEv7fCOk9sCqe9lfA8BtdXbV47fGB9hDWDY9TWbszy6DvPZcTk4
	ha/4bp8HcQyvDXrykvws96YLF1ZONwF8cL6lpN6W+Y0rb3oC8FdGRIlQLG3H17xMDhPFmWWSNe5
	oY13kntdV39G1yUcqcfNm+wYyLk30lDPTAv3kgaiF1SYNFEthx8dlBTnmAtp+foLyztdVT8=
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7702fa08e63mr14047921b3a.3.1756131529840;
        Mon, 25 Aug 2025 07:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdWfy/69r29Z8S5fLfch/hFfgjrzV796tf8bajnXTxbMLA8UFoOV3MUvUSypvtfuCMn8n0aA==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7702fa08e63mr14047878b3a.3.1756131529311;
        Mon, 25 Aug 2025 07:18:49 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:10 +0800
Subject: [PATCH v3 24/38] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-24-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=6349;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Wmlm2KyLe1jBJ73nlakE9DMYOCD/MAofE3UhilE1SZs=;
 b=S7RZjos+LEElqVTvRT9EXfqvPpuPCqk3yJcpgRrk9APeu7hnseMXL4DOodYBGeI148NuqozfJ
 QNdhnoNk/AsDvTadx2oGD5MhSSIQsQLsYSRBg+jJNjlas6LnBaP8OCj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX08KVlHE+T5dA
 ErGxYNUfq/XxdJRioAGoAo2x+xJSHpJrYBLVXSzrc56QRJXvM8Yp8FKesb6G0vMVZr3ciL/ati5
 N9E6aUmFfridOD9kc0oFa8gvMhjqPcCBvxQF27RW7Ry6hvtjev8wH074wMS653xXeJd2ScJFKAa
 LNIBJ4VZedBC73qghbnJ09U6U6W4TYdKGMYgGBP3x3msGiyNKRWSy+4iYNnB751SZeRnhZC3t1G
 7EI/zgFOEalWMX3J21vR3zA3xuKl871zI+NmawfZZ4zxzD/n+HaW5Ls66KTvpy74mOARnwCiHiP
 1RFrZXWT7JSGENA4rmBjXtlJ/VuCzyZ9kVpBIMi1pvJtc6Bchd7+hray2+a0wqKURPqgqHkskGl
 di4rul75
X-Proofpoint-ORIG-GUID: P6YqOUJs0B3nOOF7BhRO1vzPl-dr72zb
X-Proofpoint-GUID: P6YqOUJs0B3nOOF7BhRO1vzPl-dr72zb
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70cb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qjupdTMWzssTVndNP84A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For DP MST, the link clock and power domain resources stay on until
both streams have been disabled OR we receive hotplug. Introduce an
active_stream_cnt to track the number of active streams and necessary
state handling. Replace the power_on variable with active_stream_cnt
as power_on boolean works only for a single stream.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 50 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
 3 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 41018e82efa10ec863eb4b60d8df66c23c432fa5..e84c8b8e83d9ec689c0d29e8ac69860a745a4877 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display_get_active_stream_cnt(msm_dp_display)) {
 		rc = -EINVAL;
 		goto end;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0815973e6597492e09f33359d9777c0e8ce31e0d..e2e6b0ea2f9dbfe49a599ca19b1d205669365c4c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -73,6 +73,8 @@ struct msm_dp_display_private {
 
 	bool wide_bus_supported;
 
+	u32 active_stream_cnt;
+
 	struct msm_dp_audio *audio;
 
 	void __iomem *ahb_base;
@@ -175,6 +177,15 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{}
 };
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->active_stream_cnt;
+}
+
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
@@ -709,15 +720,17 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		return rc;
 
-	if (msm_dp_display->link_ready && !msm_dp_display->power_on) {
+	if (msm_dp_display->link_ready && !dp->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	if (!dp->active_stream_cnt) {
+		rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
+		}
 	}
 
 	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
@@ -731,17 +744,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
-	if (!rc)
-		msm_dp_display->power_on = true;
 
 	return rc;
 }
@@ -788,16 +794,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 				  struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-
-	if (!msm_dp_display->power_on)
+	if (!dp->active_stream_cnt)
 		return 0;
 
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
-	msm_dp_display->power_on = false;
+	dp->active_stream_cnt--;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
@@ -934,7 +938,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * power_on status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!msm_dp_display->active_stream_cnt)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1543,6 +1547,8 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 		}
 	}
 
+	dp->active_stream_cnt++;
+
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
@@ -1564,6 +1570,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!dp->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "no active streams\n");
+		return;
+	}
+
 	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
 		dp->max_stream);
@@ -1590,6 +1601,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		return;
 	}
 
+	if (dp->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 20b7ed735b3f428e894b82ae2756d0efcfa47624..b1ea027438d952c94f3ae80725c92e46c631bdb2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,7 +19,6 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
-	bool power_on;
 	bool prepared;
 	bool mst_active;
 	unsigned int connector_type;
@@ -64,4 +63,6 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
 
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1


