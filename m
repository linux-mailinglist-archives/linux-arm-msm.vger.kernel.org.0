Return-Path: <linux-arm-msm+bounces-74202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF93B89F11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93202A061A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DF8314B70;
	Fri, 19 Sep 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+NzX6LL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3F3314B64
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291950; cv=none; b=HIbLzV+z/xrMlcEXsxCoQzkMVabvFkQyNyzcLNRfcNDiUWxeQ+xOHBdAULXu7iV0UDtPeXauvTY1dfWmkB2vYaFbjDf+p1it63Tj1RVf1TepwzNudLVivPCJzS3Ek3pvv0VZ7yPJhNmwyOVr4lVjwQ4DxLViaSMF1Sruw5FsDX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291950; c=relaxed/simple;
	bh=XrSS/d2gaygVONYk1zGP5cAfRhnUoDLRafnoS8LdkKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SScpqtQ0iyRVIuZrMWepsEuhOliCmzWap8xEbFCaATywD3X8fzN2una74bKV/UoRTB7l6BxuncKgRsnm7No1CfFHoQl3ZAoHrh0EEGVwZtrjbC3uo2sWpf4mqey+GZmZfteNCQpHJDaf73+mEPGhyXnUQneT632oWgkWF22lzYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+NzX6LL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JE6Gra018237
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I7hBf4vZ2bZP3U1JZ8JKB8FfFmgfZE9SZHbR+cbwz9s=; b=N+NzX6LLzdWPG7tu
	NVdmfey+qbeix0N5pE9vVp2b1iz3StgwSkIogzfvb3C81pkbdLFCNIClId1fE2+x
	oGj2XK4rCsYK+T0CDVZh+XaVnmwh5f0UyRRbERXkwFbe2zZUtcrYehtiJL1Odr9x
	WelWYV1Rbmr/NmKwr4CW6BTwx+qrQslDm/PJ+bQ3ChyMlDE0c3vKq0Y0vbtHqw30
	/gW3pCk5J3ibwu6ehtzGdmCb0dTU77gCCJpQqWwVGPA8YneAzW2ntvaUwMI2FtzE
	6LIpWXqceO6LuRUX3qBi0UTl/8NqY7njqIXFHFcN52i/gL/o3Dde8Ea2ZAR9q4DM
	kt8vng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjpjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2645223059dso4594365ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291947; x=1758896747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7hBf4vZ2bZP3U1JZ8JKB8FfFmgfZE9SZHbR+cbwz9s=;
        b=NzO2HbuYJJWVEh/1H45zIgLVLSG1+EUVa8pWwmEBhHVUnMzaHrBZLQeDf46M2kntAX
         yzPkSZRbYlQ051A3JG/UcXpil1c6F1VhppLHWaNypwUkWoF6IYY8ocXbUbMPycqhpg6u
         rUFsto1cmpGe5AzKsdllpmFUvzr+rh4ydLzQpf7Eemi55qdQIHs0vSoofyeR7GmHMnXF
         b0RYo0sMvneI9a6Ef3gfGD3T+WZNaLG/F7zCsArJW1YQeSfHz5gYrcbL5VQEDBX/+XTF
         3oa8qe4UbZ/xxfxC2AtUkAewltF3q3ayGCH34LNZRNMkUHZRBrpkyBK5LdUiieHsZ2Ep
         QQew==
X-Gm-Message-State: AOJu0YwSKxUtGUij20oz83h1I6QvIUzvDvFJyBAFzLJQX0lmb3ZH9rEu
	Ufe4J/nRjx8SOvli8Ao3mwIureGTCPfEZtTDtDpB8F2tviM341VNCVEKaXvj+NUJMHpQwbx8M5t
	gLoxjm/TDgjnrxOjVny/2Adu1KI92cRJgGSfzTf7le37SPzLV6PxXnbRFAyKIeYn9iZFn
X-Gm-Gg: ASbGnctewUYkOayK/bYUv6MkkR3TWVWKarbRBOgnkkgQrdQjWbOI/G1Hc6gAMHNJE2w
	gzTa8oI+NFqM9Ckf0nl7G1AJDW4nf580MJwYZ6igAi2KKD7GIqVFv5NZWNgOdBOOWyh9GvqQkKX
	e1Vnr/X4FdrATYcuuPp3ufoTnQnvnLL422UfjWKniLhv8yMrtuHvcoiNHNGg1u7KtRbLLhulbGK
	4QMcFuS953wHnvYyJPSX8ls4mai27sHv6kbA0JYodHX2HUJl4I8lfe5eJXtBOIawUBOzYKe/qsv
	+NhghuEl5/NSG9QYxmGtAtcySbj/+gOobRm1D6Z4xCtUPzJ4dy7oay3DoKzCTaEQ51f6DxkRhrE
	iAkYmZZJ2jApQUw==
X-Received: by 2002:a17:902:da8f:b0:24e:af92:70de with SMTP id d9443c01a7336-269ba5049dbmr33353755ad.7.1758291946620;
        Fri, 19 Sep 2025 07:25:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5AQcpKWP/lI6E9U/08eAPdnKEW8+uHBZWuBFwvAEAKKifob3hr9t9NgwQzt7dtss41uZ5ww==
X-Received: by 2002:a17:902:da8f:b0:24e:af92:70de with SMTP id d9443c01a7336-269ba5049dbmr33353405ad.7.1758291946090;
        Fri, 19 Sep 2025 07:25:46 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:25:45 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:23 +0800
Subject: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=8690;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=XrSS/d2gaygVONYk1zGP5cAfRhnUoDLRafnoS8LdkKk=;
 b=+yqLy0/vb8w8ZupENLx/npr+1ewiqve2CFezy3lAF8YHtf07d8dnCqSrS30qp8IlC7RXtQzi/
 VP0j151Lt5HA5uu/BEDb/iZWlu6DOm2ZwpKw0adB3CFBItXF9jBaYM6
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cd67eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LV3rUWBglltBUjuJGHkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyANuiPV1AIlD
 4wAfqNN6/GHqn786VP32OX9vvJbufSTTls3NBLd8xWF0kiVT0uvpLh3rlL9U04pEZbfu3gz0MB+
 6AgAwyX1wwed7u1ptFt3aUR/imptet+OjW16pRP6yMXEsSHhMLEe7LvE347weVSJoFN6bt+2lG7
 LBkLYqDAV86WzW8Hn2rSjL5RqW5SmuXzlErzy0iwnAbcaUKWJn19KElqaJ6w0lOPwGARE3D6VYa
 ZTinV2LX5t5GroCe2bgwbAUxhOv4w79WIN7T7RygxEHEZYI6zpoGGyWaEED6B3xPSb7cR7xleZo
 8UJBBkn8GPk2fFO8vATc6S2jSW8mx5wKFlWXJFfBSrxB7zrmf3xMe9sqEer1+FVyPqVK/TbAwyW
 xOuLbDr8
X-Proofpoint-GUID: Qdy-QDMrhN7YgbxuU2TCeQMayvd1eQq3
X-Proofpoint-ORIG-GUID: Qdy-QDMrhN7YgbxuU2TCeQMayvd1eQq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
Extend qmp_usbc_register_clocks and clock provider logic to support both
USB and DP instances.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3d228db9ef0882eb76e7ab9e82f8122fa9cfe314..bfb94fa1a86cc52e1c67f954376d5fd8d321f4f3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 
 #include "phy-qcom-qmp-common.h"
 
@@ -855,9 +856,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
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
@@ -882,12 +897,14 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
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
@@ -896,10 +913,184 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
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
@@ -1044,6 +1235,13 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
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
@@ -1152,7 +1350,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
 		goto err_node_put;
 

-- 
2.34.1


