Return-Path: <linux-arm-msm+bounces-84818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FCCB1687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DC633140D67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA10A310652;
	Tue,  9 Dec 2025 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gM4yK+Ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPgfqBPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B530EF72
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321804; cv=none; b=nX3JfF36PQM9UCQ600Ie7kpp26/131cUhjXoV6IAbNWsBMLRj6QkhJ4D/hYwCfnzSNKVHNNxqyltpuNW4Ky81QFE1e/6aBJ0V+UupPr/zpBnbfnIXJek16RcOdQreDjkWwNB4p60vMwRSdjGZ72uzo/vPBTWvatqCYXXedZuBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321804; c=relaxed/simple;
	bh=gyy3byt5p3+iFB0+Hp0QvBMJbJmYCfHK/Snl6W7EfPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtLIMbb+UZvuIJkhPM+qxCLd+n9mUyNvF3P61aIZ0Y8CItYCuAeNi35WUYJ9VnNYOeO0cYfE/7taG5usGpNrzRXnu5eWIcuFn1lKezT28mudcxNBz3YMAcX60RMFmO3CZyu4Ftc/SIg2O+MoDADZf8LlskAjDmE8ebuDy+gvN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gM4yK+Ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPgfqBPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MliU71012334
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rY6AOO08FTFDr3QMZMuJvPPweOurIOm1pIHPEjG3fg=; b=gM4yK+Lln9CmwwmK
	nyy7SzsQ4Z79pkh4D7TlQgmR//NVWhWGwQug67ofOu/7CENdayJZthmIOE5D/TWJ
	GdXsGqcVvatDM8+YoRDovasC5mEeg3hMrf64qqxUFp3YpwP2ayurBOS1XX0FZsGz
	7vQoesKOSOWbUY4MBdgFORvxb29enNByA1tPJOMtUgEAWWZXZkiPqYvF1TZ0uyfp
	ElByiyFr34R5C55KDWug72SjWqsuKjASD7LfcnY5k+J7ulhxHlOFBKRiCFyEg/2V
	F86cnpHbsj5cVqUhGvOumWHMJO6Ab27yfvwuN/SsVg+Sm6NquSFnFvL0oh2Gqodd
	t/JFLg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p1dj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11ddcc9f85eso542013c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321798; x=1765926598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rY6AOO08FTFDr3QMZMuJvPPweOurIOm1pIHPEjG3fg=;
        b=BPgfqBPfvfIKlUkX8uT/H9lLE3OsoeZhmhx1+68XgcZ1BHr095EliylXw6SzOySt8O
         HWB/IRWOu2H9TA89oO+UHujDZWbDxO0UytUVmmTDewXvL3KID4KG6uX5NTD455RU41uh
         +9b+tbclj6706gJSj/iBACa7N/DRdodEVeQCnN4IdfDjvaog00SryqUILvKCDBlLWTCJ
         uXazzrD2BMvG6LmcOm2aPsw4G+U4bOjN8UTY03zw6Xet0CYliqECKpj2aOPmBwNUTF2T
         2+9BhOAxRJqzKg7udMXJPRHuyyxACkUiMjufAI0HNorY6YzDuYDAPP9shT99EqUasEFk
         WYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321798; x=1765926598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rY6AOO08FTFDr3QMZMuJvPPweOurIOm1pIHPEjG3fg=;
        b=bts53b2Fn7pBQIFMYUEnPadaxV5br+MrdhuiZDbP6Q5G3Wberj3wLSOT4MzEQPmZ+F
         G12vhnXhAs8H4myliqlhU4Wa+S/z5w/jqDq+697iDpxYlNK+JrKg1uoJsPbhzAfN2CQL
         NDL/xFEreiRhXotDky8Z5NKxqjVyMCIA9lyGm2rJ6XxbU+VtZ4VhoNJZ0Q5XEA2cMKpk
         Us7bCffzPR3z1L0HPut3BKT/U9QNXXW2I3ovdlty7mK/nZtOKq35cg/ruvZAaW1DZiy3
         35raBeXUUFN3O0Ngv52QBdbgkyIGcW6IiV+yPGdn7t4vCzg1JpttvcTMw8OIaLzcVCYc
         gOag==
X-Gm-Message-State: AOJu0YzpSP0+MjGytTTN6YhBpPA1IeaBWop+NFPBqXHde0ufYJp6lxdn
	Vt74oO8bzBjUtdN6yyzu0lju4oKT1wGXhXWxoKR7oPlED0PjMUJRUlG7yGrWB5rhmogDhL3xH84
	G08VBQFfKaHhbgkaOgq5q4H2v90IJO8xURsK2lSswQyiaB5r/GAbm8vKPVp/hX/oGp/9R
X-Gm-Gg: ASbGncsvDaSR12k6bBQuUnTXUsz0YowNeJKDzbvEkNJcb9VptGDeTxM18nqiz4Q/qym
	kS+98hBo1TW28q85iRXXE50RajZNj3i5Vitt13d9YqiLfKU065BGkpPiAnP2qWTYj313SCFjENd
	nBp+nmp3eGT2Pbnu18bjOcoNF506hRgXhD++KJFAclmxDozS5bS/q8JiNwNmzFGh7DXyqX5HYH/
	cLJFbwrYH+4jlrlvMe8gpxwtAPH31FnMcTdD7YO3ECGP+mMU5nqM3RwNUZgaWeXzsJ1yrw+J9z9
	IKQ9EhHAPSVNc3jfWz4oT1KD6vcAY95nlj3AcaBb5fUG67ZiCEv52XcsH7b+EXVMMxTX8/1fsVH
	qum4vunK28XRPmCC8l8XYQqWdd9j1PVLypRxSuQ5vA8d4sRji0hZRa+CpnbDOZg==
X-Received: by 2002:a05:7022:f017:b0:11e:3e9:3e8f with SMTP id a92af1059eb24-11f2946acc7mr303199c88.24.1765321797581;
        Tue, 09 Dec 2025 15:09:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlhgZt1P/WhUsjkzOnw5FTcS8s21n4FsN8PsrHBxyeenFMRaptqNGy/PIh+GChACyXopvMwQ==
X-Received: by 2002:a05:7022:f017:b0:11e:3e9:3e8f with SMTP id a92af1059eb24-11f2946acc7mr303172c88.24.1765321796880;
        Tue, 09 Dec 2025 15:09:56 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:56 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v8 9/9] phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms
Date: Tue,  9 Dec 2025 15:09:45 -0800
Message-Id: <20251209-linux-next-12825-v8-9-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6OM_P4X0RXp_YXhS8CCdHsWZcBEEYWtt
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=6938ac46 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=4fk61GXhQWy7FS_8SScA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfXz8RfXMhkESp7
 vhWorCoTqD6kzGtJ3wkFt6XD2UB+5UzWII2FbSMk48xwhE4WVhMf5kksSr0zbdJ/AgAncHOtlpZ
 x/txfNFuJN/Gmlli+dX+pm2JsejWW1JY7YrHLfZkJotDB8MpQL83o3W2G6IfVxXDP7EweJqDc72
 UhiMwJmZ8Y7ZgSTO1i7cZm8F8YUa3qSpE8h8CFBzLVOT7LWP5sSShCxh573hOvwsj0Yxm3gItn8
 q9kTcveDm26BEErN6jzH29l3rilT7YzCYVYmMSZGjWnZvauZGpcfMRYSwbNQsOGsz1bqCTBOUac
 OSYmiS2cgS0rV0PixlVaRXOSRdOk/Z/lR280rD0/2wPMGUk06TjTsEQf0nJgVtcvcSm4RLRvssh
 ZDK/IAS4eAKtIQzTS8OResTJi53cmQ==
X-Proofpoint-GUID: 6OM_P4X0RXp_YXhS8CCdHsWZcBEEYWtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090181

From: Abel Vesa <abelvesa@kernel.org>

Starting with Glymur, the PCIe and DP PHYs qserdes register offsets differ
for the same version number. So in order to be able to differentiate
between them, add these ones with DP prefix.

Add the necessary PHY setting tables for enabling the DP path within the
QMP subsystem.  Introduced some new callbacks for v8 specific sequences,
such as for clock configurations based on the different link speeds.

Wesley Cheng added some updated settings from the hardware programming
guides on existing PHY tables and clock settings.

Co-developed-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 355 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v8.h      |  25 ++
 .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  |  52 +++
 3 files changed, 428 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 32a3f3a4ab05..97c6ff46c373 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -48,6 +48,7 @@
 #include "phy-qcom-qmp-dp-phy-v4.h"
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
+#include "phy-qcom-qmp-dp-phy-v8.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
 
@@ -103,6 +104,7 @@ enum qphy_reg_layout {
 	QPHY_TX_TRANSCEIVER_BIAS_EN,
 
 	QPHY_AON_TOGGLE_ENABLE,
+	QPHY_DP_AON_TOGGLE_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -277,12 +279,16 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 
 	[QPHY_PCS_CLAMP_ENABLE]			= QPHY_V8_PCS_AON_USB3_AON_CLAMP_ENABLE,
 	[QPHY_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_USB3_AON_TOGGLE_ENABLE,
+	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
+	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]			= QSERDES_V8_DP_PHY_VCO_DIV,
+
 	[QPHY_TX_TX_DRV_LVL]			= QSERDES_V8_LALB_TX0_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]		= QSERDES_V8_LALB_TX0_EMP_POST1_LVL,
 	[QPHY_TX_HIGHZ_DRVR_EN]			= QSERDES_V8_LALB_HIGHZ_DRVR_EN,
@@ -1378,6 +1384,38 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x0f),
 };
 
+static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_EN_CENTER, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_ENABLE1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x56),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_3, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PSM_CAL_EN, 0x01),
+};
+
 static const struct qmp_phy_init_tbl qmp_v6_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_TX_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V6_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
@@ -1405,6 +1443,33 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_TX_BAND, 0x1),
 };
 
+static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRAN_DRVR_EMP_EN, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_PRE1_EMPH, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_PRE1_EMPH, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_DRV_LVL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_DRV_LVL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x50),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x51),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_POST_CAL_OFFSET, 0x10),
+};
+
 static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
@@ -1521,6 +1586,109 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
 };
 
+static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x7a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa4),
+};
+
+static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xae),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa3),
+};
+
+static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xae),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
+};
+
+static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x63),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x4f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER1, 0x6b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_ENABLE1, 0x0c),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x84),
+};
+
 static const struct qmp_phy_init_tbl sc8280xp_usb43dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_PER1, 0x31),
@@ -2070,6 +2238,7 @@ struct qmp_phy_cfg {
 	const u8 (*pre_emphasis_hbr3_hbr2)[4][4];
 
 	/* DP PHY callbacks */
+	int (*configure_dp_clocks)(struct qmp_combo *qmp);
 	int (*configure_dp_phy)(struct qmp_combo *qmp);
 	void (*configure_dp_tx)(struct qmp_combo *qmp);
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
@@ -2147,6 +2316,7 @@ struct qmp_combo {
 
 static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
 static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp);
+static int qmp_v3_configure_dp_clocks(struct qmp_combo *qmp);
 static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp);
 static int qmp_v3_calibrate_dp_phy(struct qmp_combo *qmp);
 
@@ -2155,6 +2325,10 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp);
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp);
 static int qmp_v4_calibrate_dp_phy(struct qmp_combo *qmp);
 
+static void qmp_v8_dp_aux_init(struct qmp_combo *qmp);
+static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp);
+static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp);
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -2288,6 +2462,7 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2423,6 +2598,7 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2469,6 +2645,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2514,6 +2691,7 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2602,6 +2780,7 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2650,6 +2829,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2697,6 +2877,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2742,6 +2923,7 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2787,6 +2969,7 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
@@ -2811,6 +2994,31 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.pcs_misc_tbl		= glymur_usb43dp_pcs_misc_tbl,
 	.pcs_misc_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
 
+	.dp_serdes_tbl		= qmp_v8_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v8_n3p_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v8_n3p_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v8_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v8_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v8_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v8_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v8_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
+	.configure_dp_phy	= qmp_v8_configure_dp_phy,
+	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
+
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2980,7 +3188,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	return reverse;
 }
 
-static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
+static int qmp_v3_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 phy_vco_div;
@@ -3027,7 +3235,7 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
 
-	ret = qmp_combo_configure_dp_clocks(qmp);
+	ret = qmp_v3_configure_dp_clocks(qmp);
 	if (ret)
 		return ret;
 
@@ -3113,6 +3321,35 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
 	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
+static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	/* Turn on BIAS current for PHY/PLL */
+	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
+
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x06, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xb7, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
+	qmp->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
 static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3127,6 +3364,58 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 	qmp_combo_configure_dp_swing(qmp);
 }
 
+static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	u32 phy_vco_div;
+	unsigned long pixel_freq;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		phy_vco_div = 0x4;
+		pixel_freq = 1620000000UL / 2;
+		break;
+	case 2700:
+		phy_vco_div = 0x2;
+		pixel_freq = 2700000000UL / 2;
+		break;
+	case 5400:
+		phy_vco_div = 0x4;
+		pixel_freq = 5400000000UL / 4;
+		break;
+	case 8100:
+		phy_vco_div = 0x3;
+		pixel_freq = 8100000000UL / 6;
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
+
+	/* disable core reset tsync */
+	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
+	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
+	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
+	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
+
+	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
+	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
+	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
+	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
+
+	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
+
+	return 0;
+}
+
 static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3143,7 +3432,7 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
 
-	ret = qmp_combo_configure_dp_clocks(qmp);
+	ret = qmp->cfg->configure_dp_clocks(qmp);
 	if (ret)
 		return ret;
 
@@ -3257,6 +3546,62 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	return 0;
 }
 
+static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
+	u32 status;
+	int ret;
+
+	ret = qmp_v456_configure_dp_phy(qmp);
+	if (ret < 0)
+		return ret;
+
+	if (dp_opts->lanes == 1) {
+		bias0_en = reverse ? 0x3e : 0x15;
+		bias1_en = reverse ? 0x15 : 0x3e;
+		drvr0_en = reverse ? 0x13 : 0x10;
+		drvr1_en = reverse ? 0x10 : 0x13;
+	} else if (dp_opts->lanes == 2) {
+		bias0_en = reverse ? 0x3f : 0x15;
+		bias1_en = reverse ? 0x15 : 0x3f;
+		drvr0_en = 0x10;
+		drvr1_en = 0x10;
+	} else {
+		bias0_en = 0x3f;
+		bias1_en = 0x3f;
+		drvr0_en = 0x34;
+		drvr1_en = 0x34;
+	}
+
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+
+	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	udelay(100);
+	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	udelay(500);
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+
+	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+
+	return 0;
+}
+
 /*
  * We need to calibrate the aux setting here as many times
  * as the caller tries
@@ -3351,8 +3696,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
 	/* override hardware control for reset of qmp phy */
-	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
+	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
 		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
+		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
+	}
 
 	/* Use software based port select and switch on typec orientation */
 	val = SW_PORTSELECT_MUX;
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v8.h
new file mode 100644
index 000000000000..b6a8ab59c2ff
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v8.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V8_H_
+#define QCOM_PHY_QMP_DP_PHY_V8_H_
+
+/* Only for QMP V8 PHY - DP PHY registers */
+#define QSERDES_V8_DP_PHY_VCO_DIV			0x070
+#define QSERDES_V8_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
+#define QSERDES_V8_DP_PHY_TSYNC_OVRD			0x074
+#define QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL		0x078
+#define QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL		0x0bc
+#define QSERDES_V8_DP_PHY_AUXLESS_CFG1			0x0c8
+#define QSERDES_V8_DP_PHY_LFPS_PERIOD			0x0d0
+#define QSERDES_V8_DP_PHY_LFPS_CYC			0x0d4
+#define QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC		0x0d8
+#define QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC		0x0d8
+#define QSERDES_V8_DP_PHY_LN0_DRV_LVL			0x0e0
+#define QSERDES_V8_DP_PHY_LN1_DRV_LVL			0x0e4
+#define QSERDES_V8_DP_PHY_STATUS			0x114
+
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
new file mode 100644
index 000000000000..2bef1eecdc56
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
+#define QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
+
+/* Only for DP QMP V8 PHY - QSERDES COM registers */
+#define DP_QSERDES_V8_COM_HSCLK_SEL_1			0x03c
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
+#define DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0		0x060
+#define DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0		0x064
+#define DP_QSERDES_V8_COM_CP_CTRL_MODE0			0x070
+#define DP_QSERDES_V8_COM_PLL_RCTRL_MODE0		0x074
+#define DP_QSERDES_V8_COM_PLL_CCTRL_MODE0		0x078
+#define DP_QSERDES_V8_COM_CORECLK_DIV_MODE0		0x07c
+#define DP_QSERDES_V8_COM_LOCK_CMP1_MODE0		0x080
+#define DP_QSERDES_V8_COM_LOCK_CMP2_MODE0		0x084
+#define DP_QSERDES_V8_COM_DEC_START_MODE0		0x088
+#define DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
+#define DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
+#define DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
+#define DP_QSERDES_V8_COM_VCO_TUNE1_MODE0		0x0a8
+#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
+#define DP_QSERDES_V8_COM_VCO_TUNE2_MODE0		0x0ac
+#define DP_QSERDES_V8_COM_BG_TIMER			0x0bc
+#define DP_QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
+#define DP_QSERDES_V8_COM_SSC_ADJ_PER1			0x0c4
+#define DP_QSERDES_V8_COM_SSC_PER1			0x0cc
+#define DP_QSERDES_V8_COM_SSC_PER2			0x0d0
+#define DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define DP_QSERDES_V8_COM_CLK_ENABLE1			0x0e0
+#define DP_QSERDES_V8_COM_SYS_CLK_CTRL			0x0e4
+#define DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define DP_QSERDES_V8_COM_PLL_IVCO			0x0f4
+#define DP_QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
+#define DP_QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define DP_QSERDES_V8_COM_LOCK_CMP_EN			0x120
+#define DP_QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
+#define DP_QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define DP_QSERDES_V8_COM_CLK_SELECT			0x164
+#define DP_QSERDES_V8_COM_CORE_CLK_EN			0x170
+#define DP_QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL		0x180
+#define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
+#define DP_QSERDES_V8_COM_CMN_STATUS			0x314
+#define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
+
+#endif

-- 
2.34.1

