Return-Path: <linux-arm-msm+bounces-56728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C157AAA8A45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DEC21893AF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FE916F8E5;
	Mon,  5 May 2025 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ1oK6V8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE45196C7C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404117; cv=none; b=KTBRHq4bbgl90Lc90ORErj5KqJ2CvQPGwZctfxtgxkYVBLNvVVV9qoHtGDnB45Civnf2aFhGQfb4kbdSS8fixyMhNukOliLtImDVesbOgRCrpU1bySoMCpmX90KT89+uFJKyB4fY+XsKkSrVCYgUiFrTf6uIFTjOJigof1GFsao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404117; c=relaxed/simple;
	bh=Q7+hSmVUziCvTJlqk5umA7RkOLupvCyy8blJqiPzehA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzce66VnAOQjs6bHId989NinFkuqZPd+ONFO0G3cGPYSBpa4mJvC3f+MxAmSxL2MhXfnOG1frl6r7YhM4Z8JWSN2g7VJqGLn6fTHg4DoyQALzu51FFn8krvtNT2N9aDpFGhoLwHoZyRop+W/aE7sGj7UdOls0ZMPEZxX0R6dXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ1oK6V8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Npi2C006487
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=; b=kZ1oK6V84mEwN0v+
	3Y6GE+RRy3ttADEs4G9dkCBiySKIBJddQpSz+L+IK82Bzrn8JDHUy5QMvX1Brchc
	v32VgXZLmP4mcLsoxbPrs/f1oMZ/montVVwKviY9FXnxZLPOD0QQI67wZFNOh6nz
	uu2jyZc7kryMHf8XUj8fllk7+S+1KDY+Tslqsz9Al0jelRnYKKMmwJLiQWFifRUI
	dMnS4kCRoZtT9DJtpDkRl+F4Jn/AaKEk3GAeKYB3DJ5IFhcvOM4Ets9ybb7GYdIm
	YAvfpJofWFtcdxHWdYIlq2C7kfI9VSoovL7g1uBXYyIcXhMZuwWDf42cDL9aG2O6
	XibAjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55tnv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:15:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47685de2945so67429101cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404114; x=1747008914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=;
        b=iacR+dOm+5pDljcNXvQ5v13gkHQIdblXJ2T9JrfOSRVVMkYrUFycPEwcmnbwjP7PAV
         JtsR5tDdI3UeAh0orbZsxdyQgA/UZwI1lWsCO8qaRtHwdST4fb3Wch7aybIpiEtNP5tD
         xdC2lDMyXNDXot+QiiGNfO5JQiTzcvqU3E1yNDQeY0aLBZZHSNzV5+scLNao451j9TTc
         yKeFc5lXZa0D5gBcW9HNudvHjaEfZS72HuSNVdc/FZhT4Cd/yDXbOB8DMuHciOFe8me8
         cBmiccdZYpA8zpdywobNuO74a8KzeA6zeDmTmWjBN3Ch3use0l9MvVIR3y931wgjFHeA
         2x/w==
X-Gm-Message-State: AOJu0YxY3g26roPVh33r7i1WKQJW6M+1KvzzrXwtzglrERtn/52hZM3X
	p0G7Sytfn3E3WobhPAzK2mEipSteTPLKB07XutZs1kWrfzFCmo/WrQ/yYjZR+Zt2A7d6t0lNoOF
	L4QlEXfCs4K63Gp7cAyc+WndMY2D0WlpHq2UH/Nm85se3gx3+QHxj7EqDw272JOGR
X-Gm-Gg: ASbGncsy/Z2MsPA1mfZxJZdy+/EDp8z2utunG9UezmHNCngyRAoiE9rtlBqP3iX4zXY
	r8xs7YAzHVJlpAdFSG37su6cUNZTzgNSBILDNovaFK7R9srFu+DAQo309wMI83wP9AcKjklb3un
	BxDa9QTfAN+P6Qz3JHOm1/Kb73gB76Nx1HfexN2v5AvQ9i7zAb3L6oViO+je+hCZQ7NBwL1inio
	jsGWnQ4I7f8G2qu0qR+XjXUSpimvvcESuwdI2IR9bxmX21kV0Id9nzz1vCU2SWvWXsb+GnLuunt
	qhJkeqW/M4jC/2a+j1uX4CGaTvh53iQC2Akg7Y6HfoqR3Fv4xEjCtH4K/OiqvXUX+/VFgvoAj0Q
	a4yme3PPnVpkgk9SHWB7t99TE
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id d75a77b69052e-48e01552e3dmr83378891cf.48.1746404113757;
        Sun, 04 May 2025 17:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjy4BDq/ngBUylfvyk62dWRjQlZU6LHc8tgPXKTj0ZxRujx94ZtnGHTZ4N/Ax9Z0ejvKtJ3w==
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id d75a77b69052e-48e01552e3dmr83378621cf.48.1746404113439;
        Sun, 04 May 2025 17:15:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:51 +0300
Subject: [PATCH v5 07/13] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-7-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+KLC0hKahtw/rbBVi8TNRT2LZxqudcybFb57eB3iUWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL8TRmPzNRqLG+vuhB2OEaPuUfxiYybPe2DY
 iYf3qhPCjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1XvzB/9S+1ACKUPSypEkRCWGDaqh9SspuUlnqat6JuNHZy0JmdmQyysnZprtX8J5FnlMWKfkSFg
 vkTXQbQ56FkcctwjfGdlhRDd3FnrRMd7S0xJGxu8ayZhKKz42fOr5eanjXTpu2hHoAQQyCv93tL
 2AD9FDzMWrYekF6U+KrooN1wXnjeaixp/nE4xl3Nsvn5l2IIGr1HlFClIkMbgcuUisOkODon2OB
 82+rZQDq4qkSb4dSHILyWcPOx8ThWXkk0d1u5ylyJSzB/Zx8nYn+hjj5CGcwUr16gM1YnruIi4E
 Et9ns3K0HrLR30SEUYGkS7S6+Np/5LAV25eMUCniYw5NYryT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX/55lrfMLjrDS
 zGit2qLyp3MFtEDBvB0EHf+Q4CSr2wqyFOk3zwMryMfk3rpl7zmhKIaYVAkBzhlhGRY7qw8h26w
 A45JVQNNAANB7nzmcvXaY+fe5JpnNotnkxjMTVfhqhlOY4JHTopTAbSEMZkNU9p6Sf2pwrDoaNd
 OjUOugPBlNCX9wq7HBD0sDF2bDg/4fG6GTQcy2WExo6cXUsSJ8X1hro2eEW+UDM2G+gVSuaNwqh
 VhD3BHGBS3bfuwCCRbam+d3I6NsmkTWqXfEcevjlkqlY5TzNf94nGQ8zu44oi9Ac9Jlg/hAHEL2
 UOO/ahFwH2YZ7PBIEjJ6WauMHCTJm9MIP0U/W76Nf8rriEQG1rOg1KQxj8d4Cf0gSBBuucAiGPW
 RDYvhzG6I1fQKzGqCMTif0/Yy98YzYWF8OmL2a6cR0MesCIfHbYlhjWTd4/MedCdmlhJWUBE
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68180312 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-J1M-BTCRiek0Q83fKAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qitL4wxZ6j_JwKm7G318NQvT0WzZadLu
X-Proofpoint-ORIG-GUID: qitL4wxZ6j_JwKm7G318NQvT0WzZadLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index e7997e4a741c3b27c9086651efe6b79dbba6bf88..3ae305e868a5931a8982e261f518cd8134d559cc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5


