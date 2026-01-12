Return-Path: <linux-arm-msm+bounces-88525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4076D120D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5471C3145A81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30EB34C99D;
	Mon, 12 Jan 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTt/H+kw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFSV4ikL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C834C13B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214914; cv=none; b=p85uAYhrK62CpPcuhuzsw/rykSMdD8aJqrEIih9Ce9kT3f74a2lsTqSIZV2idy24/MF4FWfvGpMP3ix6lm7dGt/2amvcqyQjFzEPyHLVsmBE778+9ZWYSggXINCQdjlrdVReQp5XZFa2uQDWizmd6Guyz3aOX0znrHorxM+lFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214914; c=relaxed/simple;
	bh=5xsApeJnKutP/DbrLu9m78Eok6FpXw0T47Onyc9grx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fZmL1ug2LsJzCQ48aynqyHNYPdkFqYMpnIY1llb3FXZiMtZq5PIbkJFLJC4swMEZb5K6HH1YA+cf592P1gu3qBMs6jlN5VHJbbAherk04YWK2dtVFuh/8XbVKDzz70egBLld475XlRGTdDzc9KNB9b9JPgoG2timNTQn3fwiQco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTt/H+kw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFSV4ikL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEdax1315899
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sqaUgDVKZ6m
	4wCTCNsu1hZ5yx1Nzly5OMpjbviE6Ct8=; b=oTt/H+kwawcL8Jm1BtxTyPlVL0+
	q2nv9DB6VhR9W4wK+X3IXW1nvdm+Ia6Q5ErLXTDbwZ2Yy6AbQaWdTrFspIwLHXpO
	xqHRE9NSB5xy34Nsx4QXhU87RVC/AMyKoHjLWo/gyxOt80GvEXR+XZp6NQBKydGI
	ns6HqjqCwSCFL7s/iFZcdoo7K2B4oXuFQYG6vGrkQNOhzENpzr+BkPH/Gmk3i5BB
	WMUs/AClAU6srol7x/ua6P0tFn8Id7UlAEQ3GZukvSHULaJidDp0a1tyNnVNWAvZ
	qH4A3CplKPPaxDQA/XBH5r5qod0HWCAVDpnNrfx67f5o/tx3/Z1Zq0Q3Ckg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg2uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-804c73088daso3101644b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214905; x=1768819705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqaUgDVKZ6m4wCTCNsu1hZ5yx1Nzly5OMpjbviE6Ct8=;
        b=WFSV4ikLmSgUyQA+aiTFhRu/NNHyK12FW/39+qe7VvNUMZ1GhBwBz7htwXYeweZC25
         R0bDGM9w0QGykDU3sWygmd3/axlCeKcT93nhd0a3YRsELI8pXrxQ7d6Q9W65S9a6vF7j
         FQjEh52y68QAccPnb2k5BE2C+kpZubON9r6cYvyPoHQ8Uz3sYYTZmyB1Cf0NiUskjYRT
         Xr9sQicHPZhK/BWpYt/F9o6b9csTbLRqRek4ZF+MQmwsT4RLl8au+5g1SvwdtssaYsnU
         3lU1tpPf/sbiaeRjQ7B7Xx4Xi604rQ8bVsZgCmvf19KMQwDBX6nDKcH0+M/kghzTZUEN
         Ky8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214905; x=1768819705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqaUgDVKZ6m4wCTCNsu1hZ5yx1Nzly5OMpjbviE6Ct8=;
        b=ZbJU6B+s1oR+oC/zaF+pzsJqybA/GPWYETnG4L5Umj96n707j+otPLybJtROIKNuzZ
         aQnBvoso4hXwlgRieNqQM4BMJ9j54+e3nmq8OHuqdHCfBbPZlvNgncf1UFOWTNamXUOv
         tm9JfqzBSfGMoyclQVW50tXeOHk4GbNXRatetbPXKI1uXudjqkp/ZJHCl5SdmWk3quU/
         r5SIcAorjOSVoRCKvM7BHCvsh9rGYAkoSPDbbMCkbuBK7lv0qbIHT46G2h9zjcmPRMEQ
         RKM8C3nslxQ36Ukfh4m0BvgQG3EG9B+YlYHAurL572/zjGjN+10ymYTU4O46LQiH8AQi
         3xkg==
X-Forwarded-Encrypted: i=1; AJvYcCVecfcbKjOMaSOywQJAa6UjY3nkmkv8MsAflPo5UZrUS1VEq+DWUUVlwxb9fAARa1ubL3fGZDBZN+7Ny3HB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrt2a6J3cIkhYJa+yoIuCctDe+1WpsD9uoN/O7OKXyczDyFLy0
	ZnINB5o8eGjjEYb7rfri3fBgu4VGrbtIuZ0q+GpTVoRMV514UI4/Z+22E7sJI9sIYKQU1w2l7l4
	HJfj+eBWsb/XSsSqIOh9iA4JS06KkHsU4DhzOOoxfyqWIkqnk5MZzxlgCglT0PjLZrZY7
X-Gm-Gg: AY/fxX7TB0w/qO9Gvc83VByt9qUJ1WvomNYVSymbW28TCrjxl4rcznwCgyT6C7SdNKL
	ngQ7f9OEXjBd3mV+dSMB4ecZeiyuzNTJNmXEcNv+qiFagLwgZh3DurIKB/i5ZxwH2ojgNaM8iST
	TjpNGqhQlW0urLnwWCgxCB+NdBluz/ru8UCqKgU3+JXglovp7vIB7JV2HHoRrdzYseHnX8plQby
	UUfirB2QR2qPYJZ/6F4gdxwBx35Xx4762fVTjoM/qA072TiMlAbhPnux/qNTkO5WXcHBO2x9j9f
	QVf55lc/s64wwKLVdJemiotZUJvjRIu9DQ12FRYFJrHyD4lkGrpTqPTGDDUPlB0jGFSIKIj2KT2
	5Xf6vADqGfExD8nMk6l14Xbag155z++iB+85QQMtVcd4=
X-Received: by 2002:a05:6a00:4907:b0:81c:79a3:57b6 with SMTP id d2e1a72fcca58-81c79a358e9mr9079647b3a.9.1768214905355;
        Mon, 12 Jan 2026 02:48:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQgN/pljh0AWTwGXIEghkl8dkJkuEQnyyPyNP4Ss1SBJX6CGd1e5duSSgKw5sChhNCCTHNCg==
X-Received: by 2002:a05:6a00:4907:b0:81c:79a3:57b6 with SMTP id d2e1a72fcca58-81c79a358e9mr9079630b3a.9.1768214904724;
        Mon, 12 Jan 2026 02:48:24 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:24 -0800 (PST)
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
Subject: [PATCH v3 08/12] i2c: qcom-geni: Isolate serial engine setup
Date: Mon, 12 Jan 2026 16:17:18 +0530
Message-Id: <20260112104722.591521-9-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2k_rL2ouYzAL3KP9wxj9H1w5i1-7e5CW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX0zAE1/BhF/E2
 JDB8Cd+wS96jRfFWWwfPfjCN8Y+1T9arPOfcGgPV3IW5gYtYhZFzz514FG/vjbxwOf9SdKL5n/D
 q/+SWUA8k6glBL6XuOGEt0SeMO3EPX/Kr/GtMoTa3mqzLdbwnvBZUFcEeAkNl++6kE2rkDI1onv
 HDRZGryUwl8zcn05zr1ai4gut+sM2AVfAhdPgaHckdQgTtO0SAJYuG4dz63Uu7Y+NmLXYuNkKw7
 SrHvOd4MUnprsRrD21ZrZh+qZhRXLaFvGTgtJKYS7+7fdUgCw2akZpWZPSh9tf9EwSjAMIgecHm
 T/8r4W+uwZpdXrcZ83abvbK4jE2373OatmeXTbjie+naWbMjk8MoVXtugkw774G0EWs1lBU81KQ
 WiFU84NJ/hN6jjjzWQviLIP1p9O8103K0i+opfODgMQWEmabXbAIfm5lMBISrT0RSQnoVSsQXSF
 Mtisbmi86XQYk1Nyjig==
X-Proofpoint-ORIG-GUID: 2k_rL2ouYzAL3KP9wxj9H1w5i1-7e5CW
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d17a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6GPvvr__t7aM35KwLhsA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization like
hibernation and deep sleep features where hardware context is lost.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 154 ++++++++++++++---------------
 1 file changed, 73 insertions(+), 81 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3..58c32ffbd150 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -976,10 +976,75 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_init(struct geni_i2c_dev *gi2c)
+{
+	const struct geni_i2c_desc *desc = NULL;
+	u32 proto, tx_depth;
+	bool fifo_disable;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
+		return ret;
+	}
+
+	proto = geni_se_read_proto(&gi2c->se);
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err;
+		}
+	} else if (proto != GENI_SE_I2C) {
+		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err;
+	}
+
+	desc = device_get_match_data(gi2c->se.dev);
+	if (desc && desc->no_dma_support)
+		fifo_disable = false;
+	else
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret)
+			goto err;
+
+		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err;
+		}
+
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
+err:
+	pm_runtime_put(gi2c->se.dev);
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 	const struct geni_i2c_desc *desc = NULL;
@@ -1059,100 +1124,27 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning on resources\n");
-		goto err_clk;
-	}
-	proto = geni_se_read_proto(&gi2c->se);
-	if (proto == GENI_SE_INVALID_PROTO) {
-		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
-		if (ret) {
-			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
-			goto err_resources;
-		}
-	} else if (proto != GENI_SE_I2C) {
-		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
-		goto err_resources;
-	}
-
-	if (desc && desc->no_dma_support)
-		fifo_disable = false;
-	else
-		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
-		gi2c->gpi_mode = true;
-		ret = setup_gpi_dma(gi2c);
-		if (ret)
-			goto err_resources;
-
-		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
-	} else {
-		gi2c->gpi_mode = false;
-		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
-
-		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
-
-		if (!tx_depth) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "Invalid TX FIFO depth\n");
-			goto err_resources;
-		}
-
-		gi2c->tx_wm = tx_depth - 1;
-		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
-				       PACKING_BYTES_PW, true, true, true);
-
-		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-	}
-
-	clk_disable_unprepare(gi2c->core_clk);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning off resources\n");
-		goto err_dma;
-	}
-
-	ret = geni_icc_disable(&gi2c->se);
-	if (ret)
-		goto err_dma;
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
 	pm_runtime_enable(gi2c->se.dev);
 
+	ret =  geni_i2c_init(gi2c);
+	if (ret < 0) {
+		pm_runtime_disable(gi2c->se.dev);
+		return ret;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 		pm_runtime_disable(gi2c->se.dev);
-		goto err_dma;
+		return ret;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return ret;
-
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
-err_dma:
-	release_gpi_dma(gi2c);
-
 	return ret;
 }
 
-- 
2.34.1


