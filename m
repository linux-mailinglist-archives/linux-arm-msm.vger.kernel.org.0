Return-Path: <linux-arm-msm+bounces-80156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD2C2DA4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 19:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7273BD9E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 18:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92228B7EA;
	Mon,  3 Nov 2025 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXJ3DqHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBrMzvDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B38A2264A3
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762194022; cv=none; b=W/6iG236WpfrVDWgmNzZEvYCqjT5DVfFOVWoa/ROs8davvBQjxwU49wAdcCe3phEs7rcSpGWKrws5f44wv7R07Jsic78ReaYRIjQLOqiqC7s57qZpFO2sC1KwmTlABq+K3b1FBL8I4xOeCbGWc2TaR+lgUrF7TpLG38pGxUvmaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762194022; c=relaxed/simple;
	bh=Q6bHgr1oqrBnoYvPGNlD5xwgEH7qcJBuNaL/oeVsRJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fmmrlEqUvSgN47cJaRF1Exy1fYrImS7lX995CFll3Ou1QDUmG8raDQEyVBw6XTSfCD+1pF1ME9GEXWeTmTDuF0ZMLiYQrkbEmLbAMXKIfl89X4Bvj2hnF9hn/ZrJRmJM0u3V2ln28jQbE0w0IEo6UQPGwvQhMwLSyAlY9+C8W9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXJ3DqHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBrMzvDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H3CbG3845962
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 18:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8tRAlNWUh1T
	DOg1qx9b2GlE5CtgGaW52tx1QaEy3eJ0=; b=pXJ3DqHIdtjVmn9uoiKese2ZzIn
	WtnwCm9yQzYmydIbk7up1bmSWFRK3oMQ2/oLyrNKQrtcXsb6LC9vCGf26PyoM8I7
	JbZtsFuUPpFQfknm15cAiNiIfKkJOOj+2NLHThQNAmQQbAKh7vS6OqTgGc27A+7r
	5SpwOIQyRIknnP3IAxHfW68++2Pyg/MkqCaGfIg3abMtSPTttwvyh+4ikEhvHI51
	fkPeUj3x8+SAJDMMWJUssNG7oZIYWarA2Wn4L7xNvGdYtfBJ9AdZsp8wzewJkUJC
	7C+Xvz/ZtQkifsTpKdqEAh7/IMEhERQpoKn7QmA8pcrNjSZaZo6apiqeWiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70f1g89q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 18:20:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8801c2b9ea7so127156216d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762194018; x=1762798818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tRAlNWUh1TDOg1qx9b2GlE5CtgGaW52tx1QaEy3eJ0=;
        b=IBrMzvDN/T/zF4CG627hQTakjeGEZSBz9UwqwmvoIt5gBN3FPhwT/oncMf+tlovUcW
         ECvELNeIiRdrkt1zA13iRmmwoR9qosy5CB54UX+UqgELTKE02q0FFrrhG3SmSF2LCt9N
         NMrt80PyPVY3yY9cbd/2PA1F6BGioF/aIJ3C7uniHYlAbueybx+I8lj6JKbglZyPu1of
         o0mIv44EBpueQ51Qho/D5KemQnILyCvEaa6vQCYGxdeltvGMuB6XYN9wNO6Zr02mAXjW
         cW1Ynd/c+EIXd47/h5wk03OCE9whRDdFFSQfNX/tJKG/IKOIengA4z0VC/IAB3fLWe0q
         Ns1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762194018; x=1762798818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tRAlNWUh1TDOg1qx9b2GlE5CtgGaW52tx1QaEy3eJ0=;
        b=AQwtAcJ8gHbu/yTofMSbB7RUGwOsScHaV5zpargUr53kvpqLpRcSsynwOR4A8Djl4+
         dTTS0RwNCxrHM2bq8kkA4pHOBYrMRUzCj3hCZWeJr5Mkf8Xz5d6JXg4UcyiwT2WDGozW
         LcOGIRPb8cBE6wf3Ju4Qax0Uy11pyrKBvAjis0uvu9DPJuaufjlZfQrKycoaOLLrw847
         dVK+whW9LZCyczqkTHbxYSyT0lBPrC1ou3kDt8/IwUwuXrEa2FCmU2glX6b4LGWqi3pN
         E6RTXY7dgGfP+lK1eQDCZGBPRhdWet5OOgH0L56nFoFyjE9xdmTxv7p+nzOE1b6vjlly
         DA5A==
X-Gm-Message-State: AOJu0YwvACeQRKAg3hCn0xfsC/qCAqsIcfLxVJ2JG55udh+qSzOZTHZl
	nPC6nrkH3+DUtJdyXdnREEYgPJfkXz6Jim63Ba7NkV4K6gqj+A80oLjD0j8x/F0PG5FeB0DraOv
	gu4E/QA3e4OWBdlU5VxMiAJ9YTPDFr9sPR0U+RYx47ZV7ewRh+vb4EF2DmkF7420z5kaW
X-Gm-Gg: ASbGncsWJqndoln46wRVS2YuDwIDQ6tetKmAlISxtPTGXepNsi4O6+o/lUe/Mq0glQO
	lE8exQ5S4YkNOkhMg2GPKuyVYp2Ai5LfagXTQhxxZZnTMSTa/tOMU2HWxw2zjUtFTHUDVIiifxe
	U14od1uxkDdMppaWY1ZWjsGj2648b90u7fo2zRROspXcm5zqWOr6Aa1WQNFuPkRrSFJt8ljVH4p
	8LI8/C0/cBJxMPXex/a9P/cnag5yeCH2aPyNORfqNvdE2NhJqfYKgYUgZg6syk0RtwWcKxiSnb3
	2/x9O+bB/4nDdhDHS03Z3sl4wNe/s+z38DaX6ddOCOIS9HrYtmN0OfmD2m6CsY20cDbBmbGcfBT
	8MkUOuyA0gK4Cptd1e9HdcO8SmS7IR3Gvi148DAiqFtNRoP5pFdg8DT34V449npwqbA==
X-Received: by 2002:ac8:5c82:0:b0:4b7:9f68:52d6 with SMTP id d75a77b69052e-4ed30d84740mr199283631cf.9.1762194017716;
        Mon, 03 Nov 2025 10:20:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2qfi+M04ye33cTnZO0lu9yM7vkU12Xr2q2GEjdvMB7mCD27JrucNB+izaWmXtzykpET0+bg==
X-Received: by 2002:ac8:5c82:0:b0:4b7:9f68:52d6 with SMTP id d75a77b69052e-4ed30d84740mr199283101cf.9.1762194017193;
        Mon, 03 Nov 2025 10:20:17 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:8842:5746:daeb:a8f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c53ec2csm169096545e9.11.2025.11.03.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:20:16 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/5] power: reset: qcom-pon: Add support for WARM reset
Date: Mon,  3 Nov 2025 19:20:03 +0100
Message-Id: <20251103182006.1158383-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JLQ2csKb c=1 sm=1 tr=0 ts=6908f263 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=SLKSYyjenuDOKbfwxIIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE2MyBTYWx0ZWRfX2Ulfo4/eMyNT
 +VLhYkqHci+tEgNxiquPnY0hYbD8EB3AZWM2L0KjixjnpBUldi0UulI5vUkTQxLk6V+bdrGc302
 kVP3hRPDcELcmf38LV7+T+ZN6n+/u9LGuEX6fvlWOCWFOH/DbnU/AhW6ftVHDGc5VXb6QVFnUfy
 YBl/N4S7e0H6sWFihn+guUypeFH6d02G0KGwS/dblKtLqQTrlSJc0Diwq2WCbnUttLEsxHEUebp
 r5z0et3iLhz3j1jYDFEH/tkMRauxzm4Pq87+DMq0YwjBvTbHTAyflVPHyWUzMrMUIkPlowhCLNB
 jUpNYmU60s/q38vObNUr4rhtlHL0VzFAbAUWWHyL5EmajynEvo6S5Bl3JQIJ6rB8dD4LCyDyu4Q
 Opme4fAKlO0zFJR9mEY08n3xYbaFaA==
X-Proofpoint-ORIG-GUID: rkx9KA4Sz7E2R1UgzjP3BBaMJUKqTN0Y
X-Proofpoint-GUID: rkx9KA4Sz7E2R1UgzjP3BBaMJUKqTN0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030163

This mechanism can be used when firmware lacks proper warm-reset handling,
for example, when the PSCI SYSTEM_RESET2 function is not implemented.
It enables the warm reset functionality via the PMIC.

This fallback is only enabled if qcom,warm-reset property is present.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/reset/qcom-pon.c | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582..684e9fe9987d 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -19,12 +19,20 @@
 
 #define NO_REASON_SHIFT			0
 
+#define PON_SW_RESET_S2_CTL				0x62
+#define		PON_SW_RESET_S2_CTL_WARM_RST	0x01
+#define PON_SW_RESET_S2_CTL2				0x63
+#define		PON_SW_RESET_S2_CTL2_RST_EN	BIT(7)
+#define PON_SW_RESET_GO					0x64
+#define		PON_SW_RESET_GO_MAGIC		0xa5
+
 struct qcom_pon {
 	struct device *dev;
 	struct regmap *regmap;
 	u32 baseaddr;
 	struct reboot_mode_driver reboot_mode;
 	long reason_shift;
+	bool warm_reset;
 };
 
 static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -44,6 +52,37 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static int pm8916_pon_reset(struct sys_off_data *data)
+{
+	struct qcom_pon *pon = data->cb_data;
+	int ret;
+
+	if (!pon->warm_reset || data->mode != REBOOT_WARM)
+		return NOTIFY_DONE;
+
+	ret = regmap_write(pon->regmap,
+			   pon->baseaddr + PON_SW_RESET_S2_CTL,
+			   PON_SW_RESET_S2_CTL_WARM_RST);
+	if (ret)
+		return NOTIFY_BAD;
+
+	ret = regmap_update_bits(pon->regmap,
+				 pon->baseaddr + PON_SW_RESET_S2_CTL2,
+				 PON_SW_RESET_S2_CTL2_RST_EN,
+				 PON_SW_RESET_S2_CTL2_RST_EN);
+	if (ret)
+		return NOTIFY_BAD;
+
+	ret = regmap_write(pon->regmap, pon->baseaddr + PON_SW_RESET_GO,
+			   PON_SW_RESET_GO_MAGIC);
+	if (ret)
+		return NOTIFY_BAD;
+
+	mdelay(100);
+
+	return NOTIFY_DONE;
+}
+
 static int qcom_pon_probe(struct platform_device *pdev)
 {
 	struct qcom_pon *pon;
@@ -80,8 +119,16 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		}
 	}
 
+	pon->warm_reset = of_property_read_bool(pdev->dev.of_node, "qcom,warm-reset");
+
 	platform_set_drvdata(pdev, pon);
 
+	/* Higher priority than psci to handle warm-reset properly */
+	error = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
+					      pm8916_pon_reset, pon);
+	if (error)
+		return dev_err_probe(&pdev->dev, error, "reboot registration fail\n");
+
 	return devm_of_platform_populate(&pdev->dev);
 }
 
-- 
2.34.1


