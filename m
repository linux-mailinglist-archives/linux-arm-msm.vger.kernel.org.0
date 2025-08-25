Return-Path: <linux-arm-msm+bounces-70684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AE1B34348
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2B43A3D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815B42F361C;
	Mon, 25 Aug 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpM+GPDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FBC2FB997
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131452; cv=none; b=uRilb94FFudY2yZYKr3MmmgCCnMSQtTpxvJ4njscXACmkjZrGmrtEaOn6pk1fP5lDSFEJ0blUz83MyzF9xVCQJSycPI+7/xisF3m3PDQXLVlvhOn7gDKMeO8Fh1081tdefkKxC2SpICJv3DtvL596iuvP6Qoq93xzRiTb5lBInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131452; c=relaxed/simple;
	bh=iTRo8wy0PIfQSLKFeU/qyafbXc2PXNugXLjV876bmGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBSoMePqm5LSqlm3DG1AOUkF6pAtY2bVNKNc2whbHp6H2kafRywdSLc9ODjMRsSxnm4SPttfVLQkLsfUFNY7Q2PXJHt8xYBph4joNW+lzO1Pk25z6kAUuKcMDKasysByCs/Zff4NF7pNpfP5G9l53v0vCRDZwlOleamULPkGvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpM+GPDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8ciCW032598
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wm/C4JzEIg6Cm/QS551nKnoz4iRb942rxBRXI8/cIlM=; b=GpM+GPDw3AxK8szD
	zCVNDLva+zw52uslKJVJUjxUPdiDhfJoX16eKGUG8uP4Ayw84BNZywx5M0m7XDJz
	OOeo0le3Y+Tra6XA7C2aJJ+RDkpe/6KlWfZBGhgtCbpvMy/A1GXXSEFJ1GxbnW+2
	alJncWHn1aEmzWdMmCf0UOKRRlDOmoNTrvg1u6RMxJlNKCqGbuyKi1329F0SijHA
	MOHv6/7sYqTZsA7r/6jqLz011K/hTrqE6ISAajarGPJv3rbY4PkMMNez9f9D3gUJ
	14PiU9CG3pkGR50WFApp4ACuzgCOC8Xq381yvXZhYhVJMm6cumyErmM3hxOrnekz
	cGOs9Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdbjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771e7d00fd4so1148357b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131442; x=1756736242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wm/C4JzEIg6Cm/QS551nKnoz4iRb942rxBRXI8/cIlM=;
        b=rX3SwLW6jHIV8amElTDk/4bKNrpb1yoqMZnycAEx+WodJDclSbvwRkgO10qPhniZMT
         oieVcfTIjCNr5GIc7T8uCyjgP8olo04R1wBumVfYZEzHMTz+gUAy9na3B9Dk1tKWUOey
         yQEhdLZHeWhuLvvvlKVVxwM//SuWWRmG3970XqSU4hAZKZfAUZDs3i7dp+ZyIKSgU9JA
         g71Q6YgezZjD/iZ9a8saqx1d0p0qdGmGtp3eOSw7qX+DDgMTDtwo4Es1FiQLzaZoY689
         9qhWKuR/RT3BohDB6GkuwF8jBxD+Vveld3A3X6x26OqALjSQBXg3aIALH72mqXIwzs6D
         JBUA==
X-Gm-Message-State: AOJu0YypBxpwQyUElYF0/kMFiCjj2XUfjEdZWnNSWeyRgwlKyVFXSjM4
	0UfK+ffjAIWfLNuyCqkma8WUcuDS3kJMVICU3LE0EfSlh2D4hJa6KS+cWfNiioQ1WAnUNYetV0p
	vJfKbi005DnfGx668qBOjPHF1XYKk0tXT7bYIqQgWciKaDhJ1ga8khF6YZ9gxu3I4Jx+N
X-Gm-Gg: ASbGnctcvvI6f2fdCp6xbCsPf6aETjPfdg2EKRelnLsKG2EkWuZGJ6LJ0lK50H0n9Qz
	EZ4z4JeqefgyGQye3qgFVbUNj52C1shVJ6oV8ZL/FGgcfTROML8GDKvxE2LdqLA5o63z8L5Uod/
	6MHGVDrJHpBI4LcqwDyhVYo3i5Zde+3fbMdFJ9nPv+AG3/9aEQfd6zIGJT7LBW1wmCMMieObcq+
	72IeB1/u3gr7cvA9p4/inhbmDP6f2VbQlFCCY90MohHm/Q/MxB5prLcQ5qyqWfMjmp11ASSeLNR
	0WAa01Sers2AuTBP3d1mWi5/zO9BpV3EAjG6X8PkfTNZpYvjUttfSwL8coMPHtC2ziFql48=
X-Received: by 2002:a05:6a00:2195:b0:771:e179:343a with SMTP id d2e1a72fcca58-771e1795904mr5180402b3a.17.1756131442059;
        Mon, 25 Aug 2025 07:17:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc+fXq09f/Szp54AJ0lcANseWRTO0Gz07qpl0xQUNNwTO7fG6O1+z3lH4LpnQeBD3uKzNLdg==
X-Received: by 2002:a05:6a00:2195:b0:771:e179:343a with SMTP id d2e1a72fcca58-771e1795904mr5180342b3a.17.1756131441376;
        Mon, 25 Aug 2025 07:17:21 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:21 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:49 +0800
Subject: [PATCH v3 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131418; l=11015;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Ms2uc9eBMt6jRIp02TopKwtLr/uyJmjCVRkfuIZTXtQ=;
 b=h8ufd6H57GE2GTZQxc5uTknlNAXt+KTujZ/VrMdaX6xaXi9SluY8sWlKj95Qc/3iy2yBgRvRI
 QHHj8Jv+T6HA3DQOyRfrX0/ztsNwdRptz2RME6WubLkE9tOgZAA9oEp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1bzX54iApPS7
 oJx8sxn8rM6vegJkkCipznkVMADr3mK1NYH7rZbE13rWNJ6MvnbEFCXL5InD6ecvPALT7sD85mr
 li4w6kkA1jdq9wxlS6ZS6QQzqr9bCQpIW2GvyNz4es/+AA7FdiagdtDVtRJ6xRXKopuFdrhMpwV
 YZLXMrx6hFrEk0E5zCiWslKStnA1NgpCaYgSvVKVKEcmBod+HutcUA7e1NkVMlyzBlNk8Kbme6c
 z1R0kqYchyR/uDg6k6Qd/zWNojM5iN6c5tvl8SzupOjF1/oHYGuPkiG2jJbSupzs4dGkyNSSgXv
 5h9EAYs4438BULseLUgkwI7N3bjCWwyZyw5XKRWk3XjnRw2/iQLtuPLldG8ZnXCdrdaNeK42WFK
 wkpqGDLB
X-Proofpoint-GUID: 9rESiCC9hluuvK-kORzct-Qxy0GIh0vV
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac7079 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=TEiEX4AJ1PTtM9jp4KoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9rESiCC9hluuvK-kORzct-Qxy0GIh0vV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_enable() currently re-trains the link if needed and then
enables the pixel clock, programs the controller to start sending the
pixel stream. Split these two parts into prepare/enable APIs, to support
MST bridges_enable insert the MST payloads funcs between enable
stream_clks and program register.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  51 ++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 113 ++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 +
 4 files changed, 113 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 4cf269b98029a55e6cbdfb297587de320019b833..6bfd8faa1e212c3a25964677a4462e7a3a162fa4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2446,27 +2446,19 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
-	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
-	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
-
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		pixel_rate >>= 1;
-
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
 		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, pixel_rate);
+		ctrl->link->link_params.num_lanes);
 
 	drm_dbg_dp(ctrl->drm_dev,
 		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
@@ -2476,10 +2468,39 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
-			goto end;
+			return ret;
 		}
 	}
 
+	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
+		msm_dp_ctrl_link_retrain(ctrl);
+
+	/* stop txing train pattern to end link training */
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+
+	return ret;
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	int ret = 0;
+	bool mainlink_ready = false;
+	struct msm_dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
+	unsigned long pixel_rate_orig;
+
+	if (!msm_dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+
+	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+		pixel_rate >>= 1;
+
+	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
+
 	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
@@ -2497,12 +2518,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		ctrl->stream_clks_on = true;
 	}
 
-	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
-		msm_dp_ctrl_link_retrain(ctrl);
-
-	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
-
 	/*
 	 * Set up transfer unit values and set controller state to send
 	 * video.
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f68bee62713f1650354b37edb8e1d76134d8d395..1497f1a8fc2f00991356663c19c87eb9fad48a73 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 632a1191e4e48fecd7dbda2f6ec6b8ed0aeebc93..36a12150925246b168acbabf77d1206a1ef8eff5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -674,7 +674,42 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
+static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
+{
+	int rc = 0;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+
+	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
+	if (rc) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		return rc;
+	}
+
+	if (dp->link->sink_count == 0)
+		return rc;
+
+	if (msm_dp_display->link_ready && !msm_dp_display->power_on) {
+		msm_dp_display_host_phy_init(dp);
+		force_link_train = true;
+	}
+
+	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	}
+
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	if (!rc)
+		msm_dp_display->prepared = true;
+
+	return rc;
+}
+
+static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -685,7 +720,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -715,13 +750,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	return 0;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	/* wait only if audio was enabled */
 	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
@@ -732,6 +764,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp_display->audio_enabled = false;
+}
+
+static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	if (!msm_dp_display->power_on)
+		return 0;
 
 	if (dp->link->sink_count == 0) {
 		/*
@@ -1395,44 +1435,34 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
-	struct msm_dp_display_private *msm_dp_display;
-	bool force_link_train = false;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-
-	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
-
-	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
-		return;
-	}
+	struct msm_dp_display_private *dp;
 
-	if (msm_dp_display->link->sink_count == 0)
-		return;
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->link_ready && !dp->power_on) {
-		msm_dp_display_host_phy_init(msm_dp_display);
-		force_link_train = true;
-	}
+	if (msm_dp_display->is_edp)
+		msm_dp_hpd_plug_handle(dp, 0);
 
-	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	rc = msm_dp_display_prepare(dp);
 	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+		return;
 	}
 
-	msm_dp_display_enable(msm_dp_display, force_link_train);
+	if (msm_dp_display->prepared) {
+		rc = msm_dp_display_enable(dp);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(dp);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(msm_dp_display);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp);
+		}
 	}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1447,6 +1477,15 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
+static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->prepared = false;
+}
+
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				       struct drm_atomic_state *state)
 {
@@ -1462,11 +1501,13 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (!dp->link_ready)
 		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
 
+	msm_dp_display_audio_notify_disable(msm_dp_display);
+
 	msm_dp_display_disable(msm_dp_display);
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	msm_dp_display_unprepare(msm_dp_display);
 
-	pm_runtime_put_sync(&dp->pdev->dev);
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 }
 
 void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 60094061c1029bc7a06ffaa80d9403b40aa07eb1..2fbf16f27842bb7639efaa2baecac7bdf8908432 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
+	bool prepared;
 	unsigned int connector_type;
 	bool is_edp;
 	bool internal_hpd;

-- 
2.34.1


