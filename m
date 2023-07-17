Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D88755BA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 08:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjGQG2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 02:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjGQG1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 02:27:54 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7F910D0;
        Sun, 16 Jul 2023 23:27:35 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H6KlL3008950;
        Mon, 17 Jul 2023 06:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=MqEWrGeG/ZnvF95z5HGpR0drU93tYZcrpaNbirHIdR0=;
 b=b2gaZGiQoty4WPakNu0X3nLHHi6hBglNUTK2wazD/FFUsh6EkRAuWqSBSzveU0LWeBb3
 11ZIi6YlrYe2L46sqQVSXDpaYagF6ym55quBKxv0pIybZT82lgvwmMrxMvLPQWV/LkyU
 O9uU+1kQ0RphKCwNH3A73Hg3qA4vYxA9q4kxdZNrKJSz1JmwCGFKO9TMq/uwuuDdOKvo
 FKX0q+x4Do213xNTUf6pHRxVoeLPBrw7N+DdOe90R3EJ/nmmz5T8W+qNdYmyZrWEGjMb
 6+t1Wa0/DmHr3J8qfbaR6IkNVjjAijNbXTlVEVOR5dOqbruHSyWzSzZMADWeUut3QOlR rQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run0atm80-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Jul 2023 06:26:42 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36H6Qf5H020929
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Jul 2023 06:26:41 GMT
Received: from fenglinw2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 16 Jul 2023 23:26:38 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>
CC:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>,
        <quic_fenglinw@quicinc.com>, <quic_kamalw@quicinc.com>,
        <jestar@qti.qualcomm.com>
Subject: [PATCH v1 2/2] Input: pm8xxx-vib - Add support for more PMICs
Date:   Mon, 17 Jul 2023 14:25:47 +0800
Message-ID: <20230717062547.2086869-3-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717062547.2086869-1-quic_fenglinw@quicinc.com>
References: <20230717062547.2086869-1-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MZSVLHTkAavE4VZOs7BUhAdxQbZSR2nk
X-Proofpoint-ORIG-GUID: MZSVLHTkAavE4VZOs7BUhAdxQbZSR2nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_05,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=954 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170058
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for vibrator module inside PMI632, PM7250B, PM7325B and
PM7550BA. It is very similar to vibrator inside PM8xxx but just the
drive amplitude is controlled through 2 bytes registers.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/input/misc/pm8xxx-vibrator.c | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index 04cb87efd799..c8185514e711 100644
--- a/drivers/input/misc/pm8xxx-vibrator.c
+++ b/drivers/input/misc/pm8xxx-vibrator.c
@@ -25,6 +25,9 @@ struct pm8xxx_regs {
 	unsigned int drv_addr;
 	unsigned int drv_mask;
 	unsigned int drv_shift;
+	unsigned int drv_addr2;
+	unsigned int drv_mask2;
+	unsigned int drv_shift2;
 	unsigned int drv_en_manual_mask;
 };
 
@@ -44,6 +47,42 @@ static struct pm8xxx_regs pm8916_regs = {
 	.drv_en_manual_mask = 0,
 };
 
+static struct pm8xxx_regs pmi632_regs = {
+	.enable_addr = 0x5746,
+	.enable_mask = BIT(7),
+	.drv_addr = 0x5740,
+	.drv_mask = 0xff,
+	.drv_shift = 0,
+	.drv_addr2 = 0x5741,
+	.drv_mask2 = 0x0f,
+	.drv_shift2 = 8,
+	.drv_en_manual_mask = 0,
+};
+
+static struct pm8xxx_regs pm7250b_regs = {
+	.enable_addr = 0x5346,
+	.enable_mask = BIT(7),
+	.drv_addr = 0x5340,
+	.drv_mask = 0xff,
+	.drv_shift = 0,
+	.drv_addr2 = 0x5341,
+	.drv_mask2 = 0x0f,
+	.drv_shift2 = 8,
+	.drv_en_manual_mask = 0,
+};
+
+static struct pm8xxx_regs pm7325b_regs = {
+	.enable_addr = 0xdf46,
+	.enable_mask = BIT(7),
+	.drv_addr = 0xdf40,
+	.drv_mask = 0xff,
+	.drv_shift = 0,
+	.drv_addr2 = 0xdf41,
+	.drv_mask2 = 0x0f,
+	.drv_shift2 = 8,
+	.drv_en_manual_mask = 0,
+};
+
 /**
  * struct pm8xxx_vib - structure to hold vibrator data
  * @vib_input_dev: input device supporting force feedback
@@ -87,6 +126,12 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 		return rc;
 
 	vib->reg_vib_drv = val;
+	if (regs->drv_addr2 != 0 && on) {
+		val = (vib->level << regs->drv_shift2) & regs->drv_mask2;
+		rc = regmap_write(vib->regmap, regs->drv_addr2, val);
+		if (rc < 0)
+			return rc;
+	}
 
 	if (regs->enable_mask)
 		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
@@ -242,6 +287,10 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
 	{ .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
+	{ .compatible = "qcom,pmi632-vib", .data = &pmi632_regs },
+	{ .compatible = "qcom,pm7250b-vib", .data = &pm7250b_regs },
+	{ .compatible = "qcom,pm7325b-vib", .data = &pm7325b_regs },
+	{ .compatible = "qcom,pm7550ba-vib", .data = &pm7325b_regs },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
-- 
2.25.1

