Return-Path: <linux-arm-msm+bounces-88473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4FD11180
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E40893061145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08E633C1BB;
	Mon, 12 Jan 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbX4B3ZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ds02Nuk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3F333C1BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205481; cv=none; b=HzaWetangXuMNWjWE0N0dgGSmz35rtSfaeM4jxD3gLbrlmr47gaMJvPxx0uRA7YnTMhHzYH0A6LvjeJDAr/tuk3fwhQOn5bmC1ABYCMy0ec2tYuhoTSkuQJbBF0bFHIZjRF8heHAonxVE46w9YY5aeJpAZnTKgTfFHT2sBwBxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205481; c=relaxed/simple;
	bh=7T8vgAkN1iRq56eTJtnuXnjThKJcOshuvvlIvEcslgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tSDIxOJn/ENJQt5oPhgP1xb2E78B+cXP1GMaKLKs0AVkXdsCa30Xx+3rHXCGZLHlbR1CUPPcQZEA2rIaz4B14X709ysCMrikQMfY9NdceN3QgmffSJOnEL1wjLoOTpxunsO1B/f78oeYtlTQpHBLScNHUeMU+64z0c+DOfFAp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbX4B3ZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ds02Nuk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C5BTJI2277051
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+aW01MHjFglmw8m1Dm+eiQ
	DA4p0GQEOO6R0QXAKCp4Q=; b=FbX4B3ZHvD2bjnnLPBhvwioZD1ZCSXhFMAtxst
	ClB4AZVq6feErliqVKQGWE1a7VZQ/XAgxPukbkG8Fc0XORkq19kmKrfUMdt+N3wk
	ezvMxhsndhcEsTAqxfOvJa22N0RAVv9gS/yOqC65GX6eLzry/+m9h33fTEtbC2Ki
	8GLBWD3rz5U+WsaY9UAMONnNTjKKC9TR90AY6j3o3h+mzJ2mpoI/JIM8CHj0P4Yj
	pAk9gf9lMNhKN4j9XHtEOwglNxzehYpWnGytMwGZCOzIwj+Xlch2DW/LGmirNxUW
	ipNEkS974NVv4n7JPTHP264CtJiAyVUi9uWxTxjWMiSP9czw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusm593-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:11:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac363a9465so5210575eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205477; x=1768810277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aW01MHjFglmw8m1Dm+eiQDA4p0GQEOO6R0QXAKCp4Q=;
        b=Ds02Nuk+CRDSBrMi+Iq2sEK9WU2p8BIQTS0+0utdNoKGULmpZA0wM2K4MPThNb8IxZ
         73ge3N6pwbxhrdYLdAoUkL1iRXRuf1H61UR/uI4j6XkNTJbAC0j23CE9GSuxjmQwsf5/
         TZO2uDhSSeC0QsgDNSJi52o1/4O3lQKzzm85xY1a7nkLdoU21ifU1G8wGZ0W61znBjo4
         wBvlpyPyxs6NqPLeWfGeDhKyYrdMI/vdNL8Xsd+1fPHsFUrIR4CN+bcEGKXLII1rtrQ4
         Av6nK3gnuC48N6nkX7naBgCofYTPG36Qsbfk8jKeSnanKOH0Uvb9kEit9w6T3T8K/C1U
         yGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205477; x=1768810277;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aW01MHjFglmw8m1Dm+eiQDA4p0GQEOO6R0QXAKCp4Q=;
        b=mIvxAkIFL5CV1ZMFtSsq3PdH9R9iO4iZTHUYADG8fq70xvsVknJVEh8mfGRiekAOg+
         ujggogPRNTHNk21Vd7+Va9ZiS5RPd60cYRWreQOSNu2NXeywGe9+/jSNhouWFXEL2Wam
         o4UBn4zcFBtH5Lor13g0VYswAfQv8tsnXUjrsZBDwKwjCmEhN8jD6gqswN0FcNul9SRD
         jZWhrV5hoJyTE0AZrAvB05HqNVKvI6br5Uqq/q0ZYkYzLveG5+Pdgcp601RJNr/BYq9P
         xmiL3yKPqK6zW1bW+wTZQOSTj+QakrWCs01hd5aeshSLwAob0gx2t0ZMQRQVZzJUuiM/
         el7w==
X-Forwarded-Encrypted: i=1; AJvYcCXWE2a/bdoSMZfOjJBHP8pc+HVrREqhzu0BvLpMv4pYMn2SD3aqQSf4pF4E/pa41wnUSWgRFzB64uH9Yrbc@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0KdtZA4e18Bts6Rhqn55UXSwMqF6exRTQzEgdF5btq+O4V4x
	N30hYBUnD7NRvscg8i053zNyOwl9qLUm/Ce/lZ+h4b5FFdrEJU4Qo6Am1hvSypxrRyCKGbBnhvF
	pr0sTPXXDomKUhVqugAvHkogoQG/ICfQ7B/2zM28afR4eB/ldns3SxM7JC9yP7oJ4ARPJ
X-Gm-Gg: AY/fxX48zDW+0sTeFwDW58uUU/6v/9YHlGRPBwRgbZUJMF5hhCO/pQbUJV19AuHPm7i
	HOxuajGOnAvTQ1zhfm3KiX/+q/SEfTuhsePbhncbU3z222+o45lelZg9prx5sStjTGgHcdGdFiT
	0k7uhCnZOt5HXg+3yCmUEN5v5LbQE2GnZR0brb3ZCpmokc7cywY/nTrlbQRn+Ovf3rQ4y2oHP5B
	HZ8pvYk/J7ZNDjkmcAhjMwFHXD/+a2Fujb9nuUcPybDkkaiZMzXU42Eh4fUg1GMrqfyYb/Zn3Yt
	stz5CrHq27Oa+qdOTq4K5h2Kq8rnXwkllGBGAnvCOlUqABcdR08zKe2KpXVmkwPik5xeHXGzEvC
	Wic4Qfuc6RKkFmAsWkUjNMrC0f7eMA64v3BJ2B5xkUEWaIsbjy2ydNrCAoT19EKo3
X-Received: by 2002:a05:7022:41a8:b0:11e:3e9:3ea2 with SMTP id a92af1059eb24-121f8b9ff28mr16780794c88.49.1768205477220;
        Mon, 12 Jan 2026 00:11:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0dh1tKE35w+qhEQZR0WEWIHO46+PK3rynuF8rypSXo2l6vQvT+YkeZQSk6zTDK210PtB9ug==
X-Received: by 2002:a05:7022:41a8:b0:11e:3e9:3ea2 with SMTP id a92af1059eb24-121f8b9ff28mr16780777c88.49.1768205476586;
        Mon, 12 Jan 2026 00:11:16 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm23991992c88.16.2026.01.12.00.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:11:16 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 00:11:09 -0800
Subject: [PATCH v2] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJysZGkC/zWP3Q7CIAyFX2Xh2hqYG7pd+R7GCwbFEWVMyozG+
 O42/ly0yUnb7/Q8BWEOSKKvniLjLVBIE4t6VQk7mumEEBxrUctaS6UUWBOJAO8FJ4cOLIV5fEA
 0Nidodnro/GboWukFE+aMPtw/9MORtc8pQhkzmj+zVbLe8PUZ/yQqpiz0A3Kx2Xwxxacc4aZAQ
 bttdNNo553Vex6vr4u52BTjmtvPNeN14Sjlay0GQ8znlVD6auLf4RtHduL4er0BNn8A4AQBAAA
 =
X-Change-ID: 20260111-camss-extended-csiphy-macro-486b9f3b950f
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: UL0yvT-um04YZKzGeo63cvcvPa6O4WCa
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6964aca6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9Q_BnDspRnD-vgfqZOIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: UL0yvT-um04YZKzGeo63cvcvPa6O4WCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfXzO0a6oLD9ngR
 IwX467e6XJLCIPmcOXv0hj0WQdcXVzrl2EnabVBv4W1dqWpHJGjg/BXN8aw5ovyPYWkjAQefLrj
 0OKqqV+j/erpX3QNu+9UJ/9OO+OYiE4kXKXhCCfadxqrJqso9YsfhHCPRMMriyFQkYXmyEzB2tQ
 5VOaj9xJLhIImB7/5ag1zaoZ4eQB1qz4Zhh0nSiZ14Ik1txxKY25OyMJH44uaNeYdvuvKZDVHX5
 VAJ1akDSQdVBsUkw/f4+P7/jCDyZ3ppN4MKVuh+1jmJlPk2/eKP6OiNbNKAamMDxsjYXAPSF9MG
 GopCV2VLlkrutYB3wXn1jUAOJkMobZ8Pj4Z3n1jVL+kE1pqGW9r2v9McB8T0jgMlkpEi/wx7yTH
 yMnhnXBgmWDtKKHIclU5GPxm5OQvVrxMihkKxzQ8mzy+STmxR85ub2fjIYzbzlSP6QiUGQKBTWd
 YYIbuDkjiAe+IvSdigg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120063

The current value of '0xb0' that represents the offset to the status
registers within the common registers of the CSIPHY has been changed on
the newer SOCs and it requires generalizing the macro using a new
variable 'common_status_offset'. This variable is initialized in the
csiphy_init() function.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change introduces common_status_offset to replace the hardcoded
offset in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn.
---
Changes in v2:
- Rebase this series due to conflict - bod
- Link to v1: https://lore.kernel.org/r/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++++++------
 drivers/media/platform/qcom/camss/camss-csiphy.h      |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 619abbf60781..d70d4f611798 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -46,7 +46,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_DEFAULT_PARAMS		0
 #define CSIPHY_LANE_ENABLE		1
@@ -810,13 +811,17 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 12));
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 13)) << 8;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 14)) << 16;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 15)) << 24;
 
 	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
@@ -845,7 +850,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
 	for (i = 0; i < 11; i++) {
 		int c = i + 22;
 		u8 val = readl_relaxed(csiphy->base +
-				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
+			CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+							  regs->common_status_offset, i));
 
 		writel_relaxed(val, csiphy->base +
 			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
@@ -1086,6 +1092,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 	csiphy->regs = regs;
 	regs->offset = 0x800;
+	regs->common_status_offset = 0xb0;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c44..2d5054819df7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -90,6 +90,7 @@ struct csiphy_device_regs {
 	const struct csiphy_lane_regs *lane_regs;
 	int lane_array_size;
 	u32 offset;
+	u32 common_status_offset;
 };
 
 struct csiphy_device {

---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260111-camss-extended-csiphy-macro-486b9f3b950f

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


