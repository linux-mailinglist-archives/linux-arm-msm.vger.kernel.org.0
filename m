Return-Path: <linux-arm-msm+bounces-75264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B60BA2BC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD0437B7F36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FD32882D7;
	Fri, 26 Sep 2025 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfWlCmZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E452882C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871618; cv=none; b=km8EPSHGCRYJNFvq9iZK2B7xKYhlzDM4qGpBSaNzpB7cIOf5YT1zyDJpnkfTUajklYy6E5p8Bgw92ANvwEKe0Dh8f2lALrC0+oxzRrH4tAoB5mAsPm42fE2hkB7dNqEtPm9S5F75Wb9Lv/7g7F4Cu/wqvDyoJoLDezPpH2BXpcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871618; c=relaxed/simple;
	bh=sQPoZH4tUo3UuB961LzXNvDbVN6wFgUyJ1ykO8QOYP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZiDxlH3W0h9HMv9fd7bKlgzKd8mF/n0ELNWERvybX5/etOPGohTXCR2CRDwhuo6AcHDlTpA5Z3dgexcN6cooZqkdBDBDaVm/05LHDcsAL9uAMM/b5xZfW5A065mYyW4/nif8GkpgVuxFlzU3F0HXqUpsfj3htvDC1WtP5oXSo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfWlCmZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q7DuUu024911
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMgw8/M2F0KwYim6Nj5JuT6WMNpKSzRu3DCfLT5iw/8=; b=XfWlCmZEDn3jJxCy
	vmYktee1qJKKuMOvh7kV2o36vywOy2csQBP3fKJC8TZT9vtl/xI83eFEHsfz/PjA
	FfMUqaEf5+v9bbMFknUm27+pJdVBT978TWT2ienqrxImk9Zp7CMBDjF105cCqPkF
	oV6s1XxOYb7Q3o1SIfaOb31v+YLed6FuA5E/IgjTXO8sPJLtLeSM95ImxyJf1T8T
	IafWNSMornVMiQ9UXeZnw6w5LCS0Msmm5bYdkFvOrGhmRINWroMMYD+XKg+KvrMU
	SBhxJ9twsqwEiUbUg4r8F3/7WrbhcY2+DjogTo+XobvWcaKLw0XCuuPbYX6PAh2G
	k77kPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34hv7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:26:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2680b3acdf0so4402355ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871615; x=1759476415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMgw8/M2F0KwYim6Nj5JuT6WMNpKSzRu3DCfLT5iw/8=;
        b=Bt3/AdFUU1kUD1YX60mBCpSPYd6ghMF9tFpjm9IEPWKSi3GDD2UBPeySxDZTw3k0dl
         mLjsEHs+WHTToujxxzwz5xACQJS49KxQCwfquH9CWmfpP4b4uVwW/KYEEKYDkbNktj2T
         Cb+9073NQgRYWQzuo2/u0toZO/+rcvBJDtVsqLlc8GxVCiWz/n4upnqMDoTpPSmVinQ+
         q2tydi5ujc9qtbPCTLx268jS0ivNPPmZE7Z1evdnR/RC+WC982aHDjOdQ3qZfeLV9YzS
         70v1+F45YDzLZYseElsqhKB5TjBkECJ6QMUaCuCzRWVKdIXw6EAPtcXr4gxmNHlKRUmc
         rFSQ==
X-Gm-Message-State: AOJu0Yz9AnFAhydWE9U1u38VjIWlCgXOMEUDHhDMDLAZ5x9IjYKB9mjF
	x1nQYhwfkJsPpXyG3SbjuXS+yL2IfWYAal3OWmSsQ5b+uq6S2eAY6r/gmDZ8oHOHY+fIpHUkMli
	FOmP10hT/L0OSnwpxHAgL5XC/+vAPyftKFeRIXJmnRiy2NTVH/nLSUv4Ps94NeFcCmhEk
X-Gm-Gg: ASbGncuuQLTLvOctdnTjZ9mT7V+HNHqCHqQSR6V7uX7Y4ZlDTVdYtYNV4BI74cNoLu+
	bOWEVkmBySFXYr2f20aX+cSRwbiU93fxUs4XwwZt+clNGis/uwoeqMqipj0L3W/5wHwFTDQtNJu
	HuM+gEFHL/1kWXrdFZsBVlbwQGkPgwYf2Mvcca+bw7SrcpXySwL/nkTOimi4Dk/phzQOqiryizn
	8QpS1oIVzogl+Ua5zb2JEi1AQJQwwOAncxg7aUSKESiZN4NqaLfCikswVz4B1S5PJuZTj+6dHkr
	hLc3W6LGalLh8Tghy8skBPdgr3N0UX4m15rENNMpPFS+e80E/gxhsoAj2vSvvRaweUFJR/SmMxU
	hhtfYAP1DcRo0AayCj+H3TW82Fqjr2tYzxF+YNHRSfiCNnzJf925OnFO+
X-Received: by 2002:a17:902:e886:b0:274:944f:9d84 with SMTP id d9443c01a7336-27ed4a66e4bmr41073045ad.11.1758871614621;
        Fri, 26 Sep 2025 00:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsfi2wwW0tWeUBY8/O37c4Y9XpJiHSJa21/wL035u0q2mXXnzhro70UfmYHqzmO7iOK8lapg==
X-Received: by 2002:a17:902:e886:b0:274:944f:9d84 with SMTP id d9443c01a7336-27ed4a66e4bmr41072765ad.11.1758871614026;
        Fri, 26 Sep 2025 00:26:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:26:53 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:42 +0800
Subject: [PATCH v7 06/14] phy: qcom: qmp-usbc: add DP link and vco_div
 clocks for DP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-6-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871563; l=8823;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=sQPoZH4tUo3UuB961LzXNvDbVN6wFgUyJ1ykO8QOYP0=;
 b=XXFbkkhdiDA++yzkTbAlNVJdQSHQ/w8nelb5pzTli3tQSIoeL4yLs1KMDwtxLgRjW4ABCFlbB
 0kjfLiH5TShC4IAK5YW2LaOHmym/nqU8+vHWus5PZBM4KJsHbjCP5x/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX37r6hCfvVD/6
 z4XRBaKYqNrCVhC9g5usJqwtD5TbL15T2TUIXcWPLHTFMmqfDKTDA30L1lkvu8xDmXf8LOZFU6V
 SAxVr8qGSuKgccbNVBh59MSxvcoSHdBpBfGsXeTUNWARXyd5Z6BNZFHadfjLo+buWpgnDeIxdIQ
 z3WLqYhA7PGjbs8rSm4Sbs0YOOoj95TMhQaebPvT2PytAZjpZbJxStsZYLyTp8pJEDPx7Z0dNAh
 bvGtfzns3s/22gO1Sj8STCeyB3Su0DYWti5N2wIFe2ML0vMsI4J/EXpNAgCt0cXALEa1uv3ERnO
 7VapJ2RTiMrxzWkicvb7Ql/lTr8/Pm58ZLxOIPZnOlzruX/ud/XfLaoQYIOIFijP3WNi8uOogfp
 BDxEa6cf5rmz0jGNgAQ/XDCEb2eLyg==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d64040 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LV3rUWBglltBUjuJGHkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DSyJqjCtgj99WDuPTjr9spTdTYVWsNsM
X-Proofpoint-GUID: DSyJqjCtgj99WDuPTjr9spTdTYVWsNsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

USB3DP PHY requires link and vco_div clocks when operating in DP mode.
Extend qmp_usbc_register_clocks and the clock provider logic to register
these clocks along with the existing pipe clock, to support both USB and
DP configurations.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index f9e20f43435c050e33e9490343a4693a339d692a..7139f4dab82fd7b0d1362dddefba178465e76fa4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 
 #include "phy-qcom-qmp-common.h"
 
@@ -851,9 +852,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
+static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
 {
-	of_clk_del_provider(res);
+	struct qmp_usbc *qmp = data;
+
+	if (clkspec->args_count == 0)
+		return &qmp->pipe_clk_fixed.hw;
+
+	switch (clkspec->args[0]) {
+	case QMP_USB43DP_USB3_PIPE_CLK:
+		return &qmp->pipe_clk_fixed.hw;
+	case QMP_USB43DP_DP_LINK_CLK:
+		return &qmp->dp_link_hw;
+	case QMP_USB43DP_DP_VCO_DIV_CLK:
+		return &qmp->dp_pixel_hw;
+	}
+
+	return ERR_PTR(-EINVAL);
 }
 
 /*
@@ -878,12 +893,14 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 {
 	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
 	struct clk_init_data init = { };
+	char name[64];
 	int ret;
 
 	ret = of_property_read_string(np, "clock-output-names", &init.name);
 	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
+		/* Clock name is not mandatory. */
+		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
+		init.name = name;
 	}
 
 	init.ops = &clk_fixed_rate_ops;
@@ -892,10 +909,184 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 	fixed->fixed_rate = 125000000;
 	fixed->hw.init = &init;
 
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
+	return devm_clk_hw_register(qmp->dev, &fixed->hw);
+}
+
+
+/*
+ * Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |         DP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |   (DP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v----------------+                          |
+ * |    dp_phy_pll_link_clk  |                          |
+ * |     link_clk            |                          |
+ * +--------+----------------+                          |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+-----------------+
+ *              |   dp_phy_pll_vco_div_clk   |
+ *              +---------+------------------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for DP pixel clock
+ *
+ */
+static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2700000000UL / 2:
+	/* 5.4 is same link rate as 2.7GHz, i.e. div 4 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_usbc *qmp;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
+
+	dp_opts = &qmp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		return 1620000000UL / 2;
+	case 2700:
+		return 2700000000UL / 2;
+	case 5400:
+		return 5400000000UL / 4;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_pixel_clk_ops = {
+	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
+	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
+};
+
+static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 270000000:
+	case 540000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_usbc *qmp;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	qmp = container_of(hw, struct qmp_usbc, dp_link_hw);
+	dp_opts = &qmp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+		return dp_opts->link_rate * 100000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_link_clk_ops = {
+	.determine_rate	= qmp_dp_link_clk_determine_rate,
+	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
+};
+
+static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
+{
+	struct clk_init_data init = { };
+	char name[64];
+	int ret;
+
+	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
+	init.ops = &qmp_dp_link_clk_ops;
+	init.name = name;
+	qmp->dp_link_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_link_hw);
+	if (ret < 0) {
+		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
+	init.ops = &qmp_dp_pixel_clk_ops;
+	init.name = name;
+	qmp->dp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_pixel_hw);
+	if (ret) {
+		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void phy_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
+{
+	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
+	int ret;
+
+	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
 		return ret;
 
+	if (qmp->dp_serdes != 0) {
+		ret = phy_dp_clks_register(qmp, np);
+		if (ret)
+			return ret;
+	}
+
+	if (np == qmp->dev->of_node)
+		return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
+
 	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
 	if (ret)
 		return ret;
@@ -1040,6 +1231,13 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	if (offs->dp_serdes != 0) {
+		qmp->dp_serdes = base + offs->dp_serdes;
+		qmp->dp_tx = base + offs->dp_txa;
+		qmp->dp_tx2 = base + offs->dp_txb;
+		qmp->dp_dp_phy = base + offs->dp_dp_phy;
+	}
+
 	qmp->serdes = base + offs->serdes;
 	qmp->pcs = base + offs->pcs;
 	if (offs->pcs_misc)
@@ -1148,7 +1346,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
 		goto err_node_put;
 

-- 
2.34.1


