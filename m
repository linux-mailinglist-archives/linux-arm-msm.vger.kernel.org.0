Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190B9597CE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 06:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbiHRERW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 00:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242756AbiHRERR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 00:17:17 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41080923E8;
        Wed, 17 Aug 2022 21:17:16 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27I1Zob5014519;
        Thu, 18 Aug 2022 04:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=KUONoaUOFJHRKGrKbfdX6+AXI/lcwNkQK4A8QD2lfnc=;
 b=a3mxSb7NXDSochlLqhphxB9+THZ2Mmzi6bWNQD4biPpNTINMq9FH++uX6qbJtbp22iyB
 pFNaIt05AqmtbBhOgNT4ql6h0/OhX6mwu3fcuSqkp3YNgRGJwMb+0PKDq4KrTB4Igckn
 MnwxyHPpV8kdZO43e+sP1WpNQEAVTgRDkRXLMUJHvk1INaJzYu0q1awHlSWPwAIdZxAE
 pdzoHYTA2SDRVq9XjzLc7Z43D1pD/JBrwGxfycCfEvjRG2OXa5VHoEfgK/RM5JKvNDga
 zFXO9leOeReDymIELhZlzNR0S2ZcGTlF0Fi9AsdnRZdm9h4JZ3NPJ6SV188Y2dcr2H5c Pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j181xhcn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Aug 2022 04:16:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27I4Gu0H012160
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Aug 2022 04:16:57 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 17 Aug 2022 07:58:31 -0700
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Douglas Anderson <dianders@chromium.org>,
        <krzysztof.kozlowski@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] clk: qcom: gdsc: Add a reset op to poll gdsc collapse
Date:   Wed, 17 Aug 2022 20:27:52 +0530
Message-ID: <20220817202609.v2.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aNX8P845pYdN_2nq_AVxW6Qs6khZ14HC
X-Proofpoint-ORIG-GUID: aNX8P845pYdN_2nq_AVxW6Qs6khZ14HC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180014
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a reset op compatible function to poll for gdsc collapse.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v2:
- Minor update to function prototype

 drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
 drivers/clk/qcom/gdsc.h |  7 +++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 44520ef..2d0f1d1 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -17,6 +17,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include "gdsc.h"
+#include "reset.h"
 
 #define PWR_ON_MASK		BIT(31)
 #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
@@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
 	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
 }
 
-static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
+static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
+		s64 timeout_us, unsigned int interval_ms)
 {
 	ktime_t start;
 
@@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 	do {
 		if (gdsc_check_status(sc, status))
 			return 0;
-	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
+		if (interval_ms)
+			msleep(interval_ms);
+	} while (ktime_us_delta(ktime_get(), start) < timeout_us);
 
 	if (gdsc_check_status(sc, status))
 		return 0;
@@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 		udelay(1);
 	}
 
-	ret = gdsc_poll_status(sc, status);
+	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
 	if (!ret && status == GDSC_OFF && sc->rsupply) {
@@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
 		 */
 		udelay(1);
 
-		ret = gdsc_poll_status(sc, GDSC_ON);
+		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
 		if (ret)
 			return ret;
 	}
@@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
+
+int gdsc_wait_for_collapse(void *priv)
+{
+	struct gdsc *sc = priv;
+	int ret;
+
+	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
+	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index ad313d7..d484bdb 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -12,6 +12,7 @@
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
+struct qcom_reset_map;
 
 /**
  * struct gdsc - Globally Distributed Switch Controller
@@ -79,6 +80,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
+int gdsc_wait_for_collapse(void *priv);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,
@@ -88,5 +90,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
 }
 
 static inline void gdsc_unregister(struct gdsc_desc *desc) {};
+
+static int gdsc_wait_for_collapse(void *priv)
+{
+	return  -ENOSYS;
+}
 #endif /* CONFIG_QCOM_GDSC */
 #endif /* __QCOM_GDSC_H__ */
-- 
2.7.4

