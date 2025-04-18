Return-Path: <linux-arm-msm+bounces-54714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB08A933E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 301533B696A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F956270EBC;
	Fri, 18 Apr 2025 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeegHoj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDF26FDB6
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962618; cv=none; b=czdkqzUc6PbFIWQXvFV32tbWeNpHvxHawP//aimNotb+JRk8mFOyEPbv+u7FCplnf+zU9T1C7xmJVNSLoNyJCBXoRgDvHq4WxuC7lnBT0Xn6eIqeUg/MkYBPyk5HrloMq7PYrYx9KpB47BvVCmZ1P5zjfbHrs2EpJdnn97qjD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962618; c=relaxed/simple;
	bh=+1no2bmgs6MuDDaz2UkyIJNIWjs3RXM03IY6VUWb8zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVOXM/maPr6X/MWiXRjyW8ws2rF7RFPUauVQDzRqXWy+4jsu9vnOeSQ+f2GKOC+mTMzekg03NeDid+w/Hf90MEztrYTvaQWVznhTc3uQKqn1sohwMe1Iht1JdA12yed3LKijPjHUzVBMLPXJa8WAUdU6vNx85RSk0Cwko/I29SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeegHoj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2aAWP032057
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3jJd3tpX3la7lvYFrEWmDfyU53nCPlZfvukoqDcIKc=; b=XeegHoj9jHtykDbM
	ta0q3arlee9WC4O9TiKohQ3azh1jTlZcv9C2Cf0sOGv5Q9h4kFZbYLLnqohiPF+q
	7GWu7NOkF+tyrMQTZZwpIOy03WCX5wz6xGgnuaJZOjhlHm7I3Udm2WpWv0pncgAv
	47wGRBReKyLTvCDHjOd982TmQKfC/03dpzn8mqdPif43nA/5uTPHbEiY5IDvLhWe
	VCa/MPP831BBERBjDTn4S8jQl27gOfNlsrQgvY3LqSLW7go71bFWEjqWZCVP6vnE
	dB1ENa/ok4YIQR9wEJKyCVZ2Fshv/3g4oztzWTsID7MoLWzneElzXtd3V7ytLDnk
	uiSNRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wsddg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e9f6e00so376866685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962615; x=1745567415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3jJd3tpX3la7lvYFrEWmDfyU53nCPlZfvukoqDcIKc=;
        b=d+efrCJ36wDz1g3p8OCwe8wt9oyQGov1oRaHAFoys+sBjjS9LrBBsdJCMsicfz6Ipl
         bnlE5/VpE6aT9N4Jcq5DfoZyqJRDVq0E5C4jyjto9FjiA7Yr89L5/qlmQgJsvqXGV33O
         fyR1jhsOSe1zsaaVT/KHVXNmQ6YawlcCRJZuQWSYSrSILfbmDV0sxw7AmsW+NdE30wRn
         JUh7KEBVplHVJ2/iJHf3XKzNF5r3pef4j1vTJruSU6bY0jH6LJnUvcIUd7nvI9A2djYC
         0nM6d/3D7UYrn+6eH8i8S2JiiaXV+pd4qk1kD2Sx31daBqc+q+3vOXNdNYLt2F3KOJ8g
         mOmg==
X-Gm-Message-State: AOJu0Yzo0LnLhRGge3iBSSYtjRCqkmUR6HflQmlwxXA5a+LK9bncLfbA
	48rdm/6Jgv8A6UVHsa55IhRCl8zOSqrWgzUigYpgGZJTxHQ3TdS39qYvi4c9H8InOCWrwBJycE/
	pD4rJqtBK9wNfgdx8/s7by9qqK9gvfL1b0XeVd72KDtqcHhZpJEr4rPDGKVZXZsBW
X-Gm-Gg: ASbGncvLjWjcyGZDHtaE0HjVGkKslA7wg1F2vplL3+ajsVqhrwRKtSU3vbO2sod/Kpw
	nkkAqlJDYxhmGteEsnwu/c439xYg0SH/+9FlFdcCLEqWEJLhdT6vOZ2PPo/meZIYD7kp9ctMFJZ
	j+K8A0rrNNWJ/cQGLZpZmg8xtJN7kZKWLQ+lih3RLAJGX+dj5+rg2ePliWfZN5DfKhyhbgEd/Fl
	xcguAv+KlNXsASa+z66Tqma4eDw8LpqlOJcYDKyi2UqyiXNGzyCOjFMIARENVosfGHAC0Hc/N6o
	bNrVsoOETSxja8r/3oQAxT2f0aUDrAeCtjJVXS8W48X7wKE77lzt0XFl0CJj2GDgFbMYHVL4Jml
	rFLRPMuuhd69x+gRuY5XV9EZq
X-Received: by 2002:a05:620a:1a0e:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c92573799dmr456563485a.1.1744962614970;
        Fri, 18 Apr 2025 00:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZhz7yFLC0lcOmPg14/IfBCqziyWqNbF40pJZIIcJDYe6mx7+7YBKTQoKiG7zT1FHjhFY7/A==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c92573799dmr456559885a.1.1744962614626;
        Fri, 18 Apr 2025 00:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:50:02 +0300
Subject: [PATCH v5 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-7-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VXFGPbLULr+xGELX+USGVkfaqafdytyi08lrC/x1doQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwYTi6a2Wr67jEC9QrnSD+lo0YmlQd+Zve2SfD1/nGq9u
 KKT70AnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACZS1cnBsFy0yGSlf935k8c8
 /H+oJh6bGXGv79vWPVfWGyrYybjsyhKXPVm16rnw5bdh+hITGx4sV451eT+bk2UFD+OCGdGXA6q
 seR1EDA9GblcqsWbepvJWOfji9Bk+/DKyKfsbOnqmVX6fc/ZOxK2KLJuOn+v8Y53a5389vJfdZD
 rHo/Occgc/ibDy/v8UsXw3o5iaxLJO1o5LpZeF/B88bt5+J3jVxKhzrbLb33ltf8KtJMnaeTHGI
 qPGqKdk+qSMCQ83vJzw9/dchWU/Pq8Kk0+ca2L7oSjlecO1e9Ge01z3m7FGST/8VKnXHf/g9KWX
 xTP8Fzal+Bo2yXkbbMrrlzQWrno5d8mELX+lnLpM0u27AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68020437 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=WWvJJprN3eueWNfT7O0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2Wy3uXrcaGYMrpM0Sx18lY-x2wVmyTx9
X-Proofpoint-GUID: 2Wy3uXrcaGYMrpM0Sx18lY-x2wVmyTx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
the configuration is the same as SM8550 DSI PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
+	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
+	  .data = &dsi_phy_5nm_sar2130p_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
 	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_97800uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.39.5


