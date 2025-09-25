Return-Path: <linux-arm-msm+bounces-74979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EADB9DC49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B49EA1B25F41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7D02E8E0C;
	Thu, 25 Sep 2025 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqKrZrfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67A2E8E05
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783943; cv=none; b=Eu1GMxXIfiG75TjDia7mUqV++qlMuk9+bdtdKOJKsNRS4stxDEYYpzS5YCeEHHJVLPsl/zEKIe/2H3GPmFf4RsSaXRQar0HGxhHfRzdfGVCO0EHj8U7Wn+tPBSpy9gYPhI7Xd4VSonbkX/7Or7srRkVbGSzLbKG3v4vcnYbmiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783943; c=relaxed/simple;
	bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiJcWAbM2XKDJku5meGB8rUcqCR/TTU4bGYkMcFal194syEQMvOS0QmCb5ZJ1tyTgy/ewBT4Rzm4krRhP/fIWY2GDZD+BYSOc8hzC0TQh5Wuby7MV5LT7UPJwqkdgdEmswv4pbaffuNpeJxmeYs6M7am0SXVjPAvmI9jIzu3nxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqKrZrfm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0M9B7017424
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=; b=lqKrZrfmnA1mA49d
	BMGBV4DJ0/vxTosfPR90Pc4E2f5oXHiWVRexHvOUMa/OsMVrAoLIGm7yQnocHpSX
	ccZgtt9i/Uu+1iHLafyo5iUwbbRNSxcadDmTp4Eszsth66cIXI2ARYyIUoTf5J4c
	t4oWuZz6CnM5fEuhtOvh6eNiGyGZ5OYiMwgJYaLItz4/bZUfT/yUq16n1tAwrUkY
	j5G8N+5rGjKWdXoXhwM5mBjmcL2bcZ+BoMGsJio78CJnKMfRU/84v71ENg9Ir7mc
	5dhATCTLyEEfLO56LjnspaO8gzewjGHuJKvNoIX7sjniAYYKsY1xuUEVBTaDvLzf
	0jpHCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0f5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3253ba05aa7so174411a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783940; x=1759388740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=;
        b=d4neozVPiUHiD7JKqFHs3KP9EZzEKvLxrtB42XUM6t9Shkz4HGpkKkJeUu/uAqQGCc
         7ubfz2vP7b64rFc5Lj2R2F1MrLICl0UJJF6HFB5BCWSyATc5yqV8E2ciKRM5xW3U1pVK
         YjE7I2Lw0gji/NAFkkNTEI4nXDLZC3DoCuBlcsujBTY1l27aO6qdU2JtqZByi8uKQxh9
         m2S6YID04gOagri4QOh+Rjsap1fd2hGRXBCC+9GT1FbKZ49pB5J7yHs79b+DhJilStJ5
         VJ6LGnEau4GOkZzHuM0Z9P/3z2xcdSuCpgk+iOpyqJFgYobkwpF2cyfNJD7/ubeHRyX9
         5KLw==
X-Gm-Message-State: AOJu0YylSmpkuB+w3V1SyAXtD849FUsSR4fAXGmeTc/wMLcAvCmMH4Qc
	sQltb4eFMrg2m2NXzpZdH0nRbI7kTPMarE40nn4UmCzocPOtKztD/RrTQ2AdzGq0v6f9/9by8ZX
	0miuhZJ6bIEt5Rynysk9QwCY8HvoX6oS9riPvY1XHT3B8l8marDkcMxZ8H/MGIMq5QGb7
X-Gm-Gg: ASbGncsgfvb3y9vvt6urPPkcT5Lgh+FrChT7648Fw2mvPTEnzwQ4Ai+bGPwhkujiZR5
	Ov26NdA8C65d5dkGEshA14GAQcwOhv8Eo0vpSX9VJm5UBP3acr80XYo0Kd3QHyonkxPInVfKLUx
	vC//wYgWT1tJOW6hZC4kA9hbQn10dXJQ/Lofx18zv3lUPlGP7a3fl66yBaOvZsxH43o6HxobZyC
	IQr1PB/VVzmbck/sCQpAaLeCgT3TZ0YrJh6zYWBLIKjIWuBxXNIiLHJ9kp3eYxks6avppCLynFX
	BV7+oMj0D416WczTwJvO8nmfFVczLwgzOj7q4G8yCUgKPf+/r+NkeBSAzb+KGMgiFi8S72KAmBB
	fNuJGBVVwHEb3cjgDCoMdLfU/cEK55/zbq4QAd93idVUWU3Hdxv2OUGSK
X-Received: by 2002:a17:90b:388e:b0:32b:aed4:aa1a with SMTP id 98e67ed59e1d1-3342a2becc5mr1437921a91.4.1758783940336;
        Thu, 25 Sep 2025 00:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF08XNZvMgLQSMxyP3a6gJQ7OHs/SMmu2hfWmPLLtMYILn3N1lf7IdRY1VjzAg/lXzvndi+aw==
X-Received: by 2002:a17:90b:388e:b0:32b:aed4:aa1a with SMTP id 98e67ed59e1d1-3342a2becc5mr1437881a91.4.1758783939828;
        Thu, 25 Sep 2025 00:05:39 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:05:39 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:49 +0800
Subject: [PATCH v6 03/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-3-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=3979;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
 b=Ae0l6papN9LzPWR+g9eFxMd4ZlEhIaSGUpmSLY4qxCCVUqXRcR6QD7bRTeW43zrHkOlMzP+Ve
 p5rKCT8LoSsCIdXV1/sNtFb7PSqek1AuWbZErM1yQ8AxonY2RoJ96Vg
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: F0xsdgEKCE4VFqAFcKygHTzU6Qs7qhCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXxsofH2g7ooyc
 S8lMyvA93x+moNVmTjhuSgNr3gppaSh8LubPMs9E5SkGl+PtNDXVgQi91O42qYk8J88+IafMtSw
 8kF+J9Q/bDYMMykfopQYq1xURka6ihEVQLB2+bFK99XQmrAa7OHmFu/fshNKFlPBQrIm1H9GRIm
 Ysg2DFupZVxlVU5gYFBTjIYfxW2F2R8BNfF1lYHeIbzlIotaW+WEMK4h2Pco/W8Gr+Kaw+o5Rh9
 FTGYCUoRsEK/m3uKGuwQDIfrUp5qq3n5x1V4JsJ6FKg6CrUxHhZVOS5BA29aSSwGpchvJB/WgXF
 Qs3zflWU2emvuN3LvaqX9OHGFcroAq3r+BOleuVFWevWmDvO8QNtZo7JUZzmbw7oHU4yaUQT9Qu
 fpSwIUWJ
X-Proofpoint-GUID: F0xsdgEKCE4VFqAFcKygHTzU6Qs7qhCe
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e9c5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jm3WsR2aq1IkTfYpOVcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
including register offsets, init tables, and callback hooks. Also
update qmp_usbc struct to track DP-related resources and state.
This enables support for USB/DP switchable Type-C PHYs that operate
in either mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 62920dd2aed39bbfddd54ba2682e3d45d65a09c8..de28c3464a40ea97740e16fe78cba4b927911d92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -293,13 +293,18 @@ struct qmp_usbc_offsets {
 	/* for PHYs with >= 2 lanes */
 	u16 tx2;
 	u16 rx2;
+
+	u16 dp_serdes;
+	u16 dp_txa;
+	u16 dp_txb;
+	u16 dp_dp_phy;
 };
 
-/* struct qmp_phy_cfg - per-PHY initialization config */
+struct qmp_usbc;
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
 
-	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	/* Init sequence for USB PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
 	const struct qmp_phy_init_tbl *tx_tbl;
@@ -309,6 +314,27 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
 
+	/* Init sequence for DP PHY blocks - serdes, tx, rbr, hbr, hbr2 */
+	const struct qmp_phy_init_tbl *dp_serdes_tbl;
+	int dp_serdes_tbl_num;
+	const struct qmp_phy_init_tbl *dp_tx_tbl;
+	int dp_tx_tbl_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
+	int serdes_tbl_rbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
+	int serdes_tbl_hbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
+	int serdes_tbl_hbr2_num;
+
+	const u8 (*swing_tbl)[4][4];
+	const u8 (*pre_emphasis_tbl)[4][4];
+
+	/* DP PHY callbacks */
+	void (*dp_aux_init)(struct qmp_usbc *qmp);
+	void (*configure_dp_tx)(struct qmp_usbc *qmp);
+	int (*configure_dp_phy)(struct qmp_usbc *qmp);
+	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
+
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -329,24 +355,36 @@ struct qmp_usbc {
 	void __iomem *rx;
 	void __iomem *tx2;
 	void __iomem *rx2;
-
-	struct regmap *tcsr_map;
-	u32 vls_clamp_reg;
+	void __iomem *dp_dp_phy;
+	void __iomem *dp_tx;
+	void __iomem *dp_tx2;
+	void __iomem *dp_serdes;
 
 	struct clk *pipe_clk;
+	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
+	struct regmap *tcsr_map;
+	u32 vls_clamp_reg;
+	u32 dp_phy_mode_reg;
+
 	struct mutex phy_mutex;
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct phy *dp_phy;
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	unsigned int dp_init_count;
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
@@ -689,7 +727,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -709,7 +747,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1


