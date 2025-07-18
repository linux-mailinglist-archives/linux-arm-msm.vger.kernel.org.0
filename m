Return-Path: <linux-arm-msm+bounces-65715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8EB0AC0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 00:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49D616AB22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 22:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C090221F26;
	Fri, 18 Jul 2025 22:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeXl4k9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D1207A26
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752876962; cv=none; b=aZubMOZjfgiCc3Br5dAUyvDF+p7b4NkDOV8hEf3Lm5EWzL10/jc6vuuBGoOj/MZjrS48cC8J8zSgcgTEzo5VybcqDK9h6fFDKgtVWgDvWDfGqtiR4sgqEdK1CHu+ka063fxBa0fW7b1joI4npOgB8Cevz8xQufTpDrd3adr8/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752876962; c=relaxed/simple;
	bh=+ObMCEP0xXFpmbdqHtBPYDKFpPRzfo7882m39lX89Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NVE2gvWQ1U8vbTieaA+WDXF3YZALfBRlccY/YBeg22QVG2a9Y0aqGH7UpQm5pk6U6yfhFBS3VVf7ZooN9puwtIlqvqyrKv0IZ6qWTP38v9BZbJHGB7vE8382XtQ/NbYqKcmrATvMF3Pwdww8G2U4rHePMoiohOUXDqwdBVtsM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeXl4k9G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG8S9u022222
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C0PvvuuzwRxUCUNTXNvI2E
	7eGEwqScHU67dxy7VxDIk=; b=PeXl4k9GhBPXSMyVIKR6Uojtv9cKAkDCsPzQe1
	ZAPxUeWKXFwBqe540fNFoTMcFEIfd2QXFSC34slPxhlAAlJQ7N8qqwPSoYlbPuGJ
	C59oKwWCY92Eb9z0L9RzHq6e1p4HfAUa9PY7jwqq7jkP/JbFtlFUfoZt6R8TzzhN
	w2F8ynS1pj5Qo4e29ZGjii4jBou5FXofRPuEcGSx/txY7Ic1HHjo7/DZOoS6W0mw
	eZZMXFLGjg9se9OVkg19S2JY6aXfq/0sNQV68pAfgqfCnxjYEEnUZz5L2XBrj7DL
	GHfgPNYvF4eDgCA+Al4zLZ9augU/Yup9OqLBh+A6G1u/Xpdw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyd1n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:15:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3f33295703so1103047a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752876958; x=1753481758;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0PvvuuzwRxUCUNTXNvI2E7eGEwqScHU67dxy7VxDIk=;
        b=gU+XNi+a58HX5zBpnogAQmxQf8N9epsHby9r96g0waHHuZEGj3a3V1IXS3Q0PjMuPU
         I4W/8vPoIUfXna8bnGjaCIANVV0O6c6ARkovPcGFdjb/GG7sBfzbpUS732unlBV6OOWp
         47RYEuLHj7DBn37hiFgijSiFRpVY367SHetV668ihdESqYZntyMzkFl0BSYE+ekK7E7D
         U1aHAn7ybRFJs/1iEVIgtK98D55yUr0SvmJFVf/sfXuMsFKDtLioTSjOElorZJych3B1
         od8b+SKlEcwYGxSnng9f7apalqCgH53IHP4UmalUdOfEN4hxBGput7oXE4JeK2qppn9Q
         NC9w==
X-Gm-Message-State: AOJu0YwSKfBdRDL+mFkvlNVsNaVtKY8bOv0xgNyis7VKGFkNpP7BLvmC
	wSmRPUckhX2yXo9fFH/uaCex5RR8zc07p6R5tIkwS5vDaVR5+CLgvXWGBtcmx2CJArnH+J1Fhuh
	8tD25JsXxm/5RrV+KL2EJ7SWUH3k2Egf/1i09/GL9cA2keqx4W8BLQq43quwpQ1Xlozdfh1xzJg
	EH
X-Gm-Gg: ASbGncuqzCA9kyMrgsQ8llG0Xd7lhXZ8tPO3uhWQwF7PXCiTjuRjd1b+tn8k8MUfrrQ
	hqsic1eShC50GATAB78ND4cOI98bamNGnuYP4Bgp0o88lBeWo7MhbV5eGvwPjWB1sLJtOjVux1o
	rB4uto3OLzZGLwAtoul+cBHdO9dJPs3pO+tF4lj0PSd0VTLADpRyU/6eAFxif5WiOZkDBHZo1cE
	/TV704q0CoIIEZGBaaoNY3Yoy0Oq7mcBB08PeKsievjIQzdP3TIsEZwZv6+enoVHivdTzSk8z7E
	ufplZlBWClsvmA7QjvQrDkux03ANzZDLvXYgOgTINa3unUKb9dT/4RB6JFSb8rtjQbHtFuHGEWj
	XnUlpjbfddRyjuF6bU9jxpfZw
X-Received: by 2002:a05:6a20:3d89:b0:22b:f4e5:d0ee with SMTP id adf61e73a8af0-2390db6ab83mr14277060637.14.1752876957750;
        Fri, 18 Jul 2025 15:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBO0ykGTBfx1qrutnG+D2aTIW4RWxzLxSjTOcm4yBjA+VpO8y6BfIeSt9nGM4mM6vLEZlXAA==
X-Received: by 2002:a05:6a20:3d89:b0:22b:f4e5:d0ee with SMTP id adf61e73a8af0-2390db6ab83mr14277020637.14.1752876957315;
        Fri, 18 Jul 2025 15:15:57 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc680absm1795568b3a.144.2025.07.18.15.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 15:15:57 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 15:15:51 -0700
Subject: [PATCH] drm/msm/dp: Propagate core clock enable error in runtime
 resume
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-dp-clk-error-v1-1-9bb5f28d4927@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJbHemgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3ZQC3eScbN3UoqL8Il3zZENLM1MDMzNTE0MloJaCotS0zAqwcdG
 xtbUAe16cUl4AAAA=
X-Change-ID: 20250703-dp-clk-error-7c1965066541
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <seanpaul@chromium.org>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752876956; l=2330;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=+ObMCEP0xXFpmbdqHtBPYDKFpPRzfo7882m39lX89Tg=;
 b=dgS9lNvWdwfby7lBzTlT1cofoz3lNYpyZ62ENSpTmdID0SgnlzSsj9e0Vdl8ysD9gnJPYJXlP
 3o8Eta1eK/GDXhhc3Dbp8FQ1HzTSVUSTi+inNYbjgPWxPp82OplE178
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE4MiBTYWx0ZWRfX41PIb0/khgE0
 hNtK3nUPIGbDV6JlcOGQJeBbWQOs764bxDeR7ut5rzrO0UbRoI8SBaq/QLfGRJ2O0LacnCzIEyg
 TcwS4gQtP6dBLipcrwynMRr5j4MlLuv5viyxaBYmRisyNnQ9ouj5DQ5RoJ6O6sOJmPjIWpe5k6c
 QLaNLNVomGgEEGb2Fjw+oT4WWvfCEu+ftad0H5ZVcq8LHOU6fX4rGN8lDO8txxldVsuHtXbsIoa
 nUdQrQ/AIztynqhoZdS/gO33cVC1B9qJZQ5vSxRrKdw3f4+ew8+Y/NgD66OdiBhrJNAKh1uXt9+
 kb2ZtQtFQW9FVskVxCqpD6qWR/MzLHnnrZ+IhnlX+2LKd3auSNSLbH2Q3tPcbUE9WAUpQAYgmMt
 J3TmKhl5+1/3P9bjwl9NKD6FcvT23Vqq+/bwzgkQRt4EFVFWRLJTHZvzx2HuE3NikwMZTSZU
X-Proofpoint-GUID: nLjh40gymhR6sBsuJNewxneWJ3cMKU3A
X-Proofpoint-ORIG-GUID: nLjh40gymhR6sBsuJNewxneWJ3cMKU3A
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687ac79e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_9WUdxqi14MbyrDA3vYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180182

Currently, runtime resume will always return success even if the core
clock enable fails.

Propagate any core clock enable errors during the resume to avoid any
crashes later.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..77d5e89239d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -463,17 +463,24 @@ static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
 	}
 }
 
-static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
+static int msm_dp_display_host_init(struct msm_dp_display_private *dp)
 {
+	int rc;
+
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_core_clk_enable(dp->ctrl);
+	rc = msm_dp_ctrl_core_clk_enable(dp->ctrl);
+	if (rc)
+		return rc;
+
 	msm_dp_ctrl_reset(dp->ctrl);
 	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
+
+	return 0;
 }
 
 static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
@@ -1453,6 +1460,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 static int msm_dp_pm_runtime_resume(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	int rc;
 
 	/*
 	 * for eDP, host cotroller, HPD block and PHY are enabled here
@@ -1462,14 +1470,14 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
 	 * PHY will be enabled at plugin handler later
 	 */
-	msm_dp_display_host_init(dp);
+	rc = msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
 	}
 
 	enable_irq(dp->irq);
-	return 0;
+	return rc;
 }
 
 static const struct dev_pm_ops msm_dp_pm_ops = {

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250703-dp-clk-error-7c1965066541

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


