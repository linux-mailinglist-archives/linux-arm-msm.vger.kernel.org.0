Return-Path: <linux-arm-msm+bounces-56731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D94AA8A4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030C3171DEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A741B0F31;
	Mon,  5 May 2025 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJVHk4qT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F2E145346
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404126; cv=none; b=LY/iLRTnEmkfw+STkhPlBj+HHl0foij1d+fMz0V/YHafftFW/G4qcGfFtTzX5cThh6OtW6hYC7KccZVp+KnoualyN4Rloz3nDKGEwovCUbzhsAUwENIUtpmbyrdVVX5l2rcqgEj4/5Qmm3yM42Rdlh7LhDtLDlYajHmHaTzydIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404126; c=relaxed/simple;
	bh=9IyasSP8Tc0inHx2Ugrd2jyGWCstbici0EYKr4owmRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvgRmzPe5+jW+Ls05M9QwF7KC+5sWcBRrnK7vhFxA0kO6ljMEETgTc8EuYxDguXUnknxJHFFODa+BebsLwBjH1ItKM1ukPAcC+voD8ZPNAqt3tfEJCBkMvdz835ocPXUh3wzxoSfh4hUfvsI3ER/x/Ajj50dk4iT1QjlMCbkjxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJVHk4qT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NK4uG005126
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jajSFMr5lYMffK+9G2gWOOh1EauR/2XrX+fSYkHoXAE=; b=NJVHk4qTFVxyiCln
	EM7Ecp2Z0yhoTyZtUQcHJvnH2FP2DDa4etXsMlATuGxd+ikHccAgGkJTIR4E0ctE
	L0ctV6InLfJ6Rv8RIZyCSHTSQd7WzU1S1wwHPP7aPlgzmUpJQeyLivW55Rk7E63a
	aXlRJQmdG7/ZcdDkP/gzb348yK6MKK/R36qjetRArP+yqdz9alx+B54jXrrRINPG
	bi4JFXYPKLaiBR0uIXluuqB3paygxpttZso0N/NJiwJ3Cmxs0wh0eSPF3Zstb5a1
	PR7+XkWQ5Q7JehnlRb+c+fUAUikp4BpHIjYmKtDgqDLxmW3mqc0RLzyHQ/Rgy0Lk
	BD00PA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:15:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c544d2c34fso585051685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404122; x=1747008922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jajSFMr5lYMffK+9G2gWOOh1EauR/2XrX+fSYkHoXAE=;
        b=j4PBP5iasuvWC5me1BN2R55oDa25PExpbSnpRS98pDxKp61PvGvDWwsxMtFROEZlRn
         BTY32X5pfCwZN2P7JExC0cfrk6Hkv8l/4lL7WUJiBjw3XurH4Hfop26Nr3G0pRNAGhPn
         mUSyXn91h6sEoj/zCqCFyssaFmiVgSUokqz1Dq+Fv1BhJVhEihL05hu+1W5hrePbBaBH
         XZ/mnGkBV6m+RrYofKJDprWf/Rigs6Mk0Zb6JvUCeTAeFeUj8WWDHUd7WNw60bzjohmF
         W3VLUcvDvG8axmZlZ8A8XHu7lbelrRF57x/yIkToeI1eY62UKltPRu9Jnc10MIUPCfB4
         Staw==
X-Gm-Message-State: AOJu0YylbMK1IQcy35c02HyK8ews26Oagb7S0FFFTzUh+pn8wYpoGfQS
	ir0sTJz2TSCsvxNoJ7GTK01Ih+W92b5IN24+Am5RLBSGwXMIdGP5llkU5nE3l9O/KlmdB3nuWDE
	qjCsujet+Yq1VBbzok8It9xtSKmgsvB9jBPTLhGInks2S01KU8a3v1EyNtPl7olj5
X-Gm-Gg: ASbGncuwdmODUzElGXlhLCsHm7MxrMnpg/cMGaYe80jWOiQYOJ699jykzB+z7zuIIwN
	fpBDctEe2RFvMN8+ON3BJsoXoWA0hUumMEAB5VB9ce46qb/sbnkYEO5znW5B4EhdFIKmdD/A1GH
	gQuV+XWMy210Ka6zGCND7VdD+DkBgVhxPboTfqUgU0N4c368n3nZFuV1akhUdDbWrnrkYHWU5Uf
	ood+vVoVDSNpTphtm3whRK772DkSovSOL4CjzgKI4WaZ8LaO7IM6Uf6iTQa1IyZiXs0HpkDvoaI
	VMSnhVatyEnNNIxOpTYfpwvPZ+8ZxYtJxXICLAid4tFFnW8/CqtPX9BkuvUP0lufBG6nG0Q+/HN
	assJsBxFx95fmTTjbe9GFZ9yS
X-Received: by 2002:a05:620a:244c:b0:7c7:b5e1:4e45 with SMTP id af79cd13be357-7cae3a8944cmr668304285a.9.1746404122576;
        Sun, 04 May 2025 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHfQd4fdpXw2cyT7Pt13a3SfvjKp9b+b5JPOEFBwoYuX3US9TJSLCx2Mkjm87vAk3BLxuWHw==
X-Received: by 2002:a05:620a:244c:b0:7c7:b5e1:4e45 with SMTP id af79cd13be357-7cae3a8944cmr668300985a.9.1746404122233;
        Sun, 04 May 2025 17:15:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:54 +0300
Subject: [PATCH v5 10/13] drm/msm/hdmi: rename hpd_clks to pwr_clks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-10-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4084;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+WpYll0ay0xnF4O7o5nyBXY9cEIfu8gX+WDGXWRK1Mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL85+RFzHM4YW1ldHLSewJCste9D6pvpiH4n
 5xqiI3GQSGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1bfbB/43PPjrEo0fZiqjfyPKdV/fFRD0T1cm2kWrnY4MjGNPPCrcuHruIMnGeY6iVLXiqEepty1
 ZtAlbR6vbvGcNZcCw+qfBvRYP54xITkPSVDU+O3mTXaO3zBu3cNaBXE4ZkUurvvBbMI90kIC+5d
 7e2Pwj7AxIpS6gvWe4emxps0737rHt1k0NMB49iR0yki8RetQ4KpxJsitfymSZ7xyir+m1kt7pN
 90vTKvqo2y9IzfCeGw5fNa/Sd+vUsqHweUwFRlTtpG7j24czau8dS8xKs8KH3ggDyoB5ZvFtgn1
 /D2zKJ788jbDu5LEhWBdwoaQi66btF5XMGm66pOWOPopxY1W
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -wwDSWb-tT_om8ldXMxIlVXK6mEgjXZ7
X-Proofpoint-GUID: -wwDSWb-tT_om8ldXMxIlVXK6mEgjXZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX1eDabw+JVmV0
 +j3Vgbm4zXx6pwG7ZJhF5syAFES7lEFXJ1T0M45Ms+VEXDZCn7giMC9lP3Gm1si2H2gACU4QDR7
 aYR5bWme+2JT8p35b+RqupZ48e+9hwTru2O860VXHIDGhRpjpb4rCNvxLof5QAM58ZI+0FOQyLh
 NwL2wvlmq93AcahsNDaXSi5Ddvhtn/wSD6+GwcUWPnupG6k0sDyoMjjszXaXV4qJoSvinbLQZdC
 HfQ0f5EsBmkV0LSoIjXKSj2qSYwE+Qc3kCP/J7UQMuxNePVNM2OdPNBU7HDhMWtohbpXO9VsUjI
 +KqrDnT5BHUo7m6XjPP7CJnr0kM20mTdQZSeaOAvBxqMneZkt+jxgSqM08tAgfyr9uCuna2IUo7
 ijPns7FFRBVelqp7dCrlN4/lxKtl7fyduEtvzfJpXQ6YAWu+cYZpYMv++5R16MRwJATts2xs
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6818031b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=5NGqCyE2FtwQWQBj1xQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ded20176aa805db98b0599e617eb6ea9bce122d8..8e6e3e6a04bd2d86bcbd23c110f3533f56c17887 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -226,19 +226,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
-static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
@@ -333,17 +333,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -401,7 +401,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -424,7 +424,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 7e3c035cf913d713ed63379a843897fad96b23ab..a28437beb1574553c1dc00a0c693b390389353e0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -48,7 +48,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -87,8 +87,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char * const *hpd_clk_names;
-	int hpd_clk_cnt;
+	const char * const *pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.5


