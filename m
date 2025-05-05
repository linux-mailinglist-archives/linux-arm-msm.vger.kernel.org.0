Return-Path: <linux-arm-msm+bounces-56727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A97AA8A42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CCC1893BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3486D1991CF;
	Mon,  5 May 2025 00:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb5g2JOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16A191F8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404116; cv=none; b=qKI0fGXHSqnt6GjM7OONxM8eRfN5SIMKBElJFVLFbU60AREfi9nVBbEyesXWPZnuO3wKynvhC6iGfInOXnruW1D0B1edG3POFsTqmC903nBpoVr4oG3zynbhbxB30IirrajRIct6TCWfYzmMfZ/dEaLicxHXLnuX4+sr0BdVu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404116; c=relaxed/simple;
	bh=CGyDFoTKkmhzrRAoyipkeuEsWsTrarBvvUqR5tzX1OU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAy9kviaTcrLKY+5UoTYh9rT97IDWgQGojNGo2ZLzpld+O2tuSJYChq48nQb8sctjYIV+hABrhrQ8raS7d/5shx2Gw6kcVzPtZqqbfzGoW8x2XlRH/Vr4CI9IXd61RhD9VcL8ApBkx3VX3XjMAB7aCHVJ5CHRoKzUCqzsAheoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb5g2JOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MpcGc023086
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lC8ZDdX8r3ZBs5Iye6AaJxnm/2rcpDHoom4/ujGR3LE=; b=bb5g2JOdB16+G+Jl
	L2sb3h8jwYKQ2So5K+BTiykiy7u3KcLH9oGaICikOZlAVBZEPWM3s8A+bx6M+eK5
	ohjfHvxXwAvFJ7R+k1iKD7TCJVOTycjUmb9N4uwHHUduxOSunjsWqYRt+CLGpJFC
	tZ+cltes5k/RFD1LWzmiZUWi7upCfYcvPWT2CVsW1GxWdUw+FjkHY4wN47C/3AAY
	oUN1vbdKz3PzJwciIGS3NMOE8ctHIRzCm+qvaK0qfBmWux6R52q8Ca82lV2K7jC+
	dO/n7pmkabGA+9zLZPJUgcDgeJXbVniZdjxI6kn0yQd+nOyVbJ0ppTE9oIobIUac
	vL0p9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rtpnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:15:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c92425a8b1so708179885a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404112; x=1747008912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC8ZDdX8r3ZBs5Iye6AaJxnm/2rcpDHoom4/ujGR3LE=;
        b=G7Dxzgkw4SeTILylaKO3JCJLphtXlVSvj00SPCGNiicN+mGg7+Pmlqych6ScUXLXwj
         kUkWrdaHwmBN4o9cyRhjxTEnJhj+5UNuxjH34vZWS7atR91190oMCPSa2F7+hRHmIBh7
         MhZXRddPgp5FPs1WISs8tNFErA+dLNW0/xqFRkQ2oVdZeCMwcWt2ofj3VRfKR0frGezb
         7VKspZBLrLZrdkLP+RtJy9D130ttQPzbl1grtPX1gFDuMY00lsfBim5cY4mtkUcOfWIt
         HrnfNgjTZftE1wXYbtnD9ByBGfVXsm3xQ9g/UfRESSBlHuHeVP7Tdedb+wgrX0SW8MAF
         q5fg==
X-Gm-Message-State: AOJu0YysWXnBKviLqJ+/F0SGtqaA8qjFLopym5b4DmV0eWp1eyJ3XQOi
	YDqqUxQG9Yff9VYXFFeSQG6ao4sMD/UQiQBPAK3iiqkIuJcljFR7Z2r7BqEGG2uHGRZ0lWUt+ca
	CZhwzXilacxlKy0ngnRaveTmLZ4qdrlyvpLGK3VDxTtFdW0nMqh898W6DmLtPmWoG
X-Gm-Gg: ASbGncuqkZeCF9wLs+SBnBloPKJLgswONFi06uTIF1S+Dg8odG2JC4nnZsb4jCtNrId
	BGjd++Uizad7pj+4BmYAsxa4dAdhjtQCvRj7Xv1hhxM+LQfEqk9WiBk8DznSvKZUjS4eSODm8S3
	8tYC4BgbSvEf4mVitSLYE59LHZ6rAp5JLFE62aubEMao+S8uHm/lLvKoOp/KcMbpHXxQdS36LMU
	u+NSytHMldYRqP1hadazDBvrIGfRdZ+Jai1+IsyZealShua+4QiwxrU+NVQfLsZI6mToBeDvWMJ
	Ep3fbdD6TZ0/PpOtjWjrfxc2zLg56N26IQ5JVCdxynmcxy+ymc9l2m4ZuTG65UhUv2B+KKxribQ
	lQtj8CWRvis/QqsjvIig0mDrC
X-Received: by 2002:a05:620a:25d1:b0:7c5:6a40:6a7a with SMTP id af79cd13be357-7cace96e8f6mr2088728285a.6.1746404112285;
        Sun, 04 May 2025 17:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvNGkmAp+rxz3SE+ZfwFuR/iGSBPHH9E6ffeZtwrAcxALVaQZ1RkFPFE+vyWxNBp/1C1a25w==
X-Received: by 2002:a05:620a:25d1:b0:7c5:6a40:6a7a with SMTP id af79cd13be357-7cace96e8f6mr2088723685a.6.1746404111831;
        Sun, 04 May 2025 17:15:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:50 +0300
Subject: [PATCH v5 06/13] drm/msm/hdmi: switch to clk_bulk API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-6-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cNUywERI8hGQBw9l50SO0xvsuUis2RpMcSyOPQXrk1Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL8Ff/ghUad7hDlMm0gOBS5v6Nsc98AilCUL
 zHv2mb15caJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1SIcB/4gGV8loPoCtbdrusFh6IGwRUKH/Sb5NvGDf3zyWHQKwsgp77/X6b6c9UBLyj4D2A/gylP
 zhy90TSoPZQoB+HBJyvopBsZVrEFUkiMWlHSO76LXttNXcFELN73lfgR/4/E9ROPWK4kYYLItoO
 0mV/0yo5uVDK2Zy1KciXDUnGi6vLh41/MeFwxM3mGaluvD1BT5onejUSzcocLx31OzxGnMf0f3e
 7aUcZH6IP2Qh1Pgd/7pmjfIF4i1nTEqEIPSUmrRw+arYkZltAKGxQBVxbFb4EsR29i0RGWGdDmX
 E9kYu7hrHOcQC4S1I+0LZdQ0Lu6tbnDrw2fQAmRerUVQ9Fvt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _LxmcUwB_vhoMKSt7ojF-4v3E3jA_qw4
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68180311 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=crT2GVGf2cMoZBaL-JsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _LxmcUwB_vhoMKSt7ojF-4v3E3jA_qw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXycHIKst7vrrA
 lHswMNWK/xrvZrLupFWtDsNvGPQEIWjJNJ9J62fk7fNPnqxtTmmmQh/Ka8nMHCn5y87CT+tHxf2
 E5K6IPDJ9HvEQITwBGFXCp3jk9owWyAvs418SqclP3apWgwdGlN3vEV1rnggDBjxiqAUlcoVQHL
 AyciA2Er7RYez4kaW64D+WmJFzXtogQuEI2FquC74EmQKxa9tz2X2wDuakVeFq8/5tgaEnnVmFW
 o8exSlKRq+Ew3KHdLlss/NphvRnivC99ElHW8Xp8bJzQ0yLrN/L7fijxd/TUv73000kllyUcyJG
 O1F/iglrxQsJIqBcNan1rhQwlQBgm73aOEa8qJe7AB9f/w2LiEX/9Yg4eLudekwRhHkxhauHkHc
 xYSsPd9l0QWxkq41R6ec1q90bQjF0BWAlwi3WWsWaQWq1rhB1nmtH78mcclcqsqWrclkFYcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6f09920c58190a9c195de0407e4c2dcc3d58b30f..69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,17 +353,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!hdmi->hpd_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
+	for (i = 0; i < config->hpd_clk_cnt; i++)
+		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
 
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get hpd clk: %s\n",
-					     config->hpd_clk_names[i]);
-
-		hdmi->hpd_clks[i] = clk;
-	}
+	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		return ret;
 
 	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e93d49d9e86936cb6c1f852a958398de2e134ad4..3f87535bcf43e20f0618d3016307fe1642d7baf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953f0ee6deea8a216bfa9d3616b09af..e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct device *dev = &hdmi->pdev->dev;
-	int i, ret;
-
-	if (enable) {
-		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
-			if (ret) {
-				DRM_DEV_ERROR(dev,
-					"failed to enable hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			}
-		}
-	} else {
-		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
-			clk_disable_unprepare(hdmi->hpd_clks[i]);
-	}
-}
-
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
 
 	ret = pinctrl_pm_select_sleep_state(dev);
@@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	uint32_t hpd_int_status;
+	const struct hdmi_platform_config *config = hdmi->config;
+	u32 hpd_int_status = 0;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto out;
 
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?

-- 
2.39.5


