Return-Path: <linux-arm-msm+bounces-88529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BDD120F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B7CD3090875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F30234C123;
	Mon, 12 Jan 2026 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIuQxxh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1tTuZSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EEF347BB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214936; cv=none; b=rS0tlfuKL9cjJ3qwiun+xKUH6I+qXO0vbe9b+wUrg1igES2YLc8HaUL6NEAaxmorQoB2NKw2jC61W7cm621RHUpawUl9MAhEUrHRmpUuqVA0YGtYA3PuAjD9NTepmiOZnDUJLOCcLSk10AiTXIWkx3AdpPI33yLY1Q90dDXCtY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214936; c=relaxed/simple;
	bh=YIHYMofa7MM1n5uKKT/qVy70UWWioCFNHYGxbHnXI7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=niQQRVWBgNioa1QZcrOYBWRITlsoku3uYKFHjxxrahmIFhrJeWoC+EOqXcLbw4iHciS3tDmYl7H/tTXQkLCPxTAP++DG877rK+JqVhRc3iYJP8Hd+0Bqs68Owlx3TZtjI4I0NsN25ILPCYlei0aAvLxwJ9AXrlgMgz18vlfmACw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIuQxxh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1tTuZSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9WktS309309
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQcAcBkjL0G
	3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=; b=RIuQxxh/ie3IlZVW0qIi/nCTwRc
	jT8YXmt8WIwiS+WwMHTXYYJfElvS2hWv5KXkGcroO3aGkOwrkN23h3YG5zv2DLpH
	PlRGksFC8zApdNakjaOSnFytI98UoPrsCUo3sMQ9xoYYWHEQYGj8PFuxJVuzJcAm
	9fVBkhj/SKLXMNJ1KEG3hSiseI6PdMFrZzi7ZpibFDj3zaPiu4ijvfyMbE7ZkPLN
	hXKZZhgdbI+Pb2hmqzHsVVTlK2j+PA6Gr0jG+K622xe0CPK78OKX0sP1jf/R+z9C
	YyoLppFv0P6+mpzt7cFrxaWIgn/Edov6ZpLLt0SX5SMtY9j3r/ApbTgRupw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvr7an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so1773468b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214931; x=1768819731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQcAcBkjL0G3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=;
        b=i1tTuZSDXcvKf6D5i0hC4SwrSeVXEQMayyughCQERul4EbCMLHDRvoB55fRQT1GCk/
         Xsv2Lz6GA5bZBqSTe4Pf6NGQ59BhzPor+5y19/jqR+0NIkBuzvWF8+dEnpiSoAAaHaIM
         /7auQy4fkf8n7bnEFQ1ceD1Uu8LMu5Er9HGAKX8/I4XUTjdDMBR7U6jnMrhkTcEWOcWg
         ftf+jpxTRvNcmt6vjxUHVHm3IWvQJA/d5X3g5kfxF40ug5SzVB7eo/mTb8Fx+qkxDz4Z
         Mj/ULCvP2kSQMx6w+ob2PvWtK64oG62ci1nPUym7PVUUq+Ln99GRY4WDvvH2X8CEBbxd
         fXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214931; x=1768819731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQcAcBkjL0G3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=;
        b=hqJ4u2UgOJ/tQGicv+qFRqy/LIUvLPNjSeib+tKm+5JwSqwV/PvMB+U3HpZ0f5p0R0
         gFA9ezIT9Q2hzIm68A4g8sXs807g7p/FDF/qgyBvpLymSnxewBEQs2GEnyqiRjf6ALAj
         o40WkKGovasDib9GVvpb6sdkiTULe3LxS9w6BytlU2NQCMCA3IlYrNSyPnFT2+5s5+UI
         vK7DjSglARAGT4iEbORNrAErpCgx7pYZFOsXXvBcHpfQX7y7RxXPsBOXGNvc9Dlo6PIU
         7SotONasXNGbGkQDIBHf8xaBAb7hFsoEJ8BUGcC2hWCudp1+bDqaFibQTnb6ZKSm6fiX
         Ynpg==
X-Forwarded-Encrypted: i=1; AJvYcCV7/PQ3h9hzT1WhxUcbCPo+cuHf5Ark0w/d/t7mU3fgCuBY3sTn6tpEtmmwxt6763SsGD40y5jTNVZvPVOt@vger.kernel.org
X-Gm-Message-State: AOJu0YyfSVH+6IOEGR67EbHBQnqk72cb1YUvprObtH98iknVm0gKSJqg
	GvSSMKA91PVhTLyTXw5GYpL7eyjqgOwVx0XwCA8wx5iYC9p3eRXsrBAhri+4npD8qDjQAt55vnF
	WSENk1rSt9SpGRULoVikQDgKzo3eZoYvoavShSMPJ0EPuSZYuSrSyebCoiDLMX/1h/pNK
X-Gm-Gg: AY/fxX7HU2jeo2XKhym56MgF4aT/tACWkzCcAtLaIdu73AhxDKQylq+VlrxDdiXJ2vj
	tGGvm5gm5Nl5P+DfezvXqhWYYQau93SNbL/CX3n3ilitum656RkrIvqfUKiAPrF1VHuoJie2LrF
	J4ZCHz+ogEQ5s01OePz9V/9qccGD0Iu7M0b2Ga1WFx01ukcBh7iE6OP3UbARBIgs3IICbXFff7P
	h0/WrrGko71kE1uiT4P1PhH+T2AbWL2ozC/KVLLelU+oxe9ejIzDZmA7004QRp2M9ISlHpwFN7b
	H9HyHdncasIvTf1W9ljKMCvrkqH56Ylp1EH0G49JbeLSkbMF5MI6qrjFaoUe+2p/73zpOlX6Oky
	iPVJjwJDna/Ed6kAs+Fmg5nts24FZb5xYfAC+p9QLn4A=
X-Received: by 2002:a05:6a00:ace:b0:81b:ad93:a874 with SMTP id d2e1a72fcca58-81bad93a9d0mr14171021b3a.16.1768214930700;
        Mon, 12 Jan 2026 02:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhPyAERmzr9Dw2x35aSuyt4PyrwayfBvLR+kwrYNIeRwGfH7SfDHmMlNc3aMJf2XF21+hvew==
X-Received: by 2002:a05:6a00:ace:b0:81b:ad93:a874 with SMTP id d2e1a72fcca58-81bad93a9d0mr14171003b3a.16.1768214930105;
        Mon, 12 Jan 2026 02:48:50 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:49 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
Date: Mon, 12 Jan 2026 16:17:22 +0530
Message-Id: <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: StiW3hRMhkNQVKLmhip7o7h15xFGfr7c
X-Proofpoint-GUID: StiW3hRMhkNQVKLmhip7o7h15xFGfr7c
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6964d193 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zgZzUwpPmSg69XYvEVoA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXwF/KYfXsQen0
 eqZc7mehJwkrFPJV5DHsHqbfnRiJ6h4AeN5oU3PtzxwDcp4DcA/ngdr29Wjpn//WJe5uw/J5wcb
 D5oN6TQ+SIWr1djkAcQCarR5CKH6fVVxfOe5xefez/1+XVcMnjDPUc/F/MR6hwywwVosiuSmWhU
 bLhWSeA/0VX+lWvM1Xaz+4XoHLylbuaEv8OcuqNiSYUcdk8YQNEZ8qC4hAVS5i9/hqrrD8oYJZ9
 o4OIhEOQpsNaf96lr9QCIaskP3IR1iKgrcBX23LRvrLc6vvgVJNuu6U3sEpLsoj6AbLpacTM0mg
 W/h8vUbXOZPqJV2dcym1tzrQqtCSvYX0EeH1qWPMgFUb7+cgtg/oaXYZX21M9MjvLWDQob4kLSU
 3Ob/MKvd067RYypVgD0tBqxVvFQ3RwoENNZV5lFt08BZRMGz2AGNbLbIC33Zto2mKKNIBf9X0ab
 PbLXyWzgW8HUiuljHsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 1c9356e13b97..72457b98f155 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -82,6 +82,10 @@ struct geni_i2c_desc {
 	char *icc_ddr;
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -203,8 +207,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -217,6 +222,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -908,7 +914,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1041,8 +1049,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1095,7 +1104,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1154,15 +1163,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	gi2c->suspended = 1;
@@ -1171,12 +1182,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
@@ -1215,6 +1228,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 
 static const struct geni_i2c_desc geni_i2c = {
 	.icc_ddr = "qup-memory",
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_i2c_desc i2c_master_hub = {
@@ -1222,11 +1239,21 @@ static const struct geni_i2c_desc i2c_master_hub = {
 	.icc_ddr = NULL,
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
-- 
2.34.1


