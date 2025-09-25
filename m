Return-Path: <linux-arm-msm+bounces-74980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B060B9DC69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B5E1B26803
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C5A2E9EB8;
	Thu, 25 Sep 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK/OdlXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6972EA462
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783950; cv=none; b=uAM+zL6XiIX85cnzfKdgx1Hoi4bZPGUcGdC8dchZAm6vuXTEScYXYBCVoFdo8RYPSFtbtO3jOyqgfaj4GcWR2uWg/XakX+N1rJ/lNCMwYcXRGc4PnPai1YWHE3u8dwqRWlZjCVrd9xAIh/Bv8BMSB9LXeP3e5xeqkKfN25fntJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783950; c=relaxed/simple;
	bh=ScND5R19fNR4fxgqnX3CVdg+GNtnOHYJhlmcXMGybGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3alis3+bB9sfAeBZOB23QYvSKeU2g/1GrUMcq4XJf5CnVj09r/OFeTKuByOMdYGXKpr81HQlxAFy7ZkGxJycSSE7WgOOtalY4jrph29Byv4Y3/OIz1Sdl3JAAMa2Cd9xGucmVuRcaMQKMUzJTnjTIE0ZyaK/RjgRS99btL69og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cK/OdlXk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0oa89018615
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ph7HUhaBaiRojkAD3JbT6dqDUnW8cPmN0abiXHdzjwk=; b=cK/OdlXkZtcd4T/Q
	mgVAZlicyr/yPTGek5K8OsRqISqjTdJMhvZxyRnUNtZmXs5a3D+PIQ5I1AQdP1gY
	XU41Ih8upF6IYvj8808u5lZmTJou2hIA9G4TuBfA1XO0F4s0K9YG6ezZokzIAfXm
	zrnZmaHDz08en4EOYL0RLKM/RR6/1haXNFvR6bHG8GdIjPduqvmKIBap1705SVOB
	SyLxWojcfzLY0koa+hOswikznVGIUnFrQ1f/vaDxHcRmKnWnI2GnV+jFeqIKUXTT
	opRY1bln7VSH3R0QB1ziKVC58kWjqzjsQqLML5t6FG5MgdHugjHVb6wtF86nrx+P
	zE/6hw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0f67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2728a359f2aso1905475ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783948; x=1759388748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph7HUhaBaiRojkAD3JbT6dqDUnW8cPmN0abiXHdzjwk=;
        b=a3xVR6c8i9jQGoNZCSiSDUPuZjP1va6+w1uk4LpAv2eBASmSkDnfUaLD+gM82hkhXW
         bmWw7QuzqIMt8F/HgRd/L7nKErtlEkjoyFwJ/3EgXDBGCJ31CH8xXFN0kw8KKQtAa72D
         2ct9j4sQevGaQP47Erj+5vuA8QB8YdCkvPRBe1ihj9MJAIXGIu9rD3IfHWBlizfcu/a/
         a3LHdBIzgENZwqK3VGRVkRiewthPjgr4p3gotS1JpOpSOieJGwXvl4csuNRbz+qQ0U6i
         oXmSO0ji2fPiFZK9JFwZ/O+Eusl5XljP6FiJ04HvVyf9Wrp89ZwVZ2E1es2DSpxZRB00
         /VOA==
X-Gm-Message-State: AOJu0YwJ2T/P7nJP2+ogHYFW9VQg/eui+yYOk/hJ57ZYLzTI/QCDIMLo
	9p0JVEO6Uw2tRMdaw/EVeVOefOh+coWTvwLjMup8aTiiCBZDTmHXfy/hAalMkgkXPwQk3I4a6zJ
	XbubZZ01Y/vXlTkxm/0w9hZZ+8pnrm/DTZDpLauCTryvFEbDtSKRkIV21hXzLEuBdrmnz
X-Gm-Gg: ASbGncvlWE24AdfqPuPoqkZOE7xcggFixwwPReqp3cWY2U/DDEyElhECPP0t0dx7b5N
	fuZbyK1QLoMjD3ULP4Dq8mmNpHOH6fBzugPu6Vlotc1Idv9wEwtWNQr/jJucKnMBLXUjzQDmvU7
	U2W6YN95GxQBASHXRfKhD411LwGQ3oVRM5lrfA+KMDziiP86qmW6f331aXUof88m5w/tmvfqDfv
	E17s/ghj2p9tfYk2pbzF2ZFqsKZ3F+e+ez0TdZM7LlLzx4iTlUgUvZB3UIqZSHAy9lh2u12fBdP
	exHSVMFRMxXCqEmVVgMz7EFaw0CnILNl9uEMnPDxef+Wj6GOpZzXzTsR6tYgs28yFH1GGJwLVG4
	7neVRQ5bQ/c9YiYj7Ykl73o9fYBfOFFMiD6B5vHNqWnCtE2/kQD6tdIoe
X-Received: by 2002:a17:902:db11:b0:24e:af92:70de with SMTP id d9443c01a7336-27ed4a7e773mr18675355ad.7.1758783947518;
        Thu, 25 Sep 2025 00:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+bwvxBUG8vgoHHmPF6ytXc074CDD60FgvKn/jVxkoKD6yq0QRAunDpbU6JJhFhqnTIsG/Q==
X-Received: by 2002:a17:902:db11:b0:24e:af92:70de with SMTP id d9443c01a7336-27ed4a7e773mr18675055ad.7.1758783947040;
        Thu, 25 Sep 2025 00:05:47 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:05:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:50 +0800
Subject: [PATCH v6 04/14] phy: qcom: qmp-usbc: Add regulator init_load
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-4-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=5441;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ScND5R19fNR4fxgqnX3CVdg+GNtnOHYJhlmcXMGybGg=;
 b=0fB5OjPqaagCd3BrReglBJJPeOjzulbqpFpWXN0Or0+qaUYtuwJ6Y+P4ZYRQZ5ojyxU730kA2
 AGd3Qr7RGYzBTupWFA88I5M1Mej/W5qDL+cfYtOkEMlWj5pze7kwRdU
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 4-fAUoqEHntxTv7yUaefD6zevyOcGnh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX8ZOFmuEtlA65
 lqj4/b4a2pu3RHR/+nN8X6CP/c6X27GPQCDTVuaQH4WtYH7iDUYQ3pB/fHkwBi3SQ4O+475bONz
 nbRpNGGUH1l92i4h3klQ7aPgihZXHSb5WHhDK3Jx8Sb2rGcmcZFFffaKWbs0Gzc0PnaTe4dJ+3K
 5Z+JzSNFsEL00E1Tuq1iXB/2Pcc3ElXdiZE+MJ8kHJi1L1MuSFR87DdIoOaPDa6fg0bAe1VChF8
 J7Ncr9UIhj2hiXzP3ypXkI8hpRZyvPdDeKmxnqOzp1qlEn+M9U8xxXIJ/tU94y0oHTNcmXR9CM9
 AFnJYqKTw6bCDsdLA2xeKnMStWvsbQXFDoG1555aQFqm2NKPshEHwtj/n8m8O2GGfu1Qd1/LnWc
 jSkTk9X/
X-Proofpoint-GUID: 4-fAUoqEHntxTv7yUaefD6zevyOcGnh0
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e9cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6BFfyeCpfu5Dl7vuC9UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

QMP USBC PHY drivers previously did not set init_load_uA for regulators,
which could result in incorrect vote levels. This patch introduces
regulator definitions with proper init_load_uA values based on each
chip's power grid design.

QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
regulator requirements differ. A new qcs615_usb3phy_cfg is added to
reflect the correct settings.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 68 ++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index de28c3464a40ea97740e16fe78cba4b927911d92..3b48c69f9c3cb7daec495ebc281b83fe34e56881 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -336,7 +336,7 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -428,9 +428,19 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 68600 },
+	{ .supply = "vdda-pll", .init_load_uA = 14200 },
+};
+
+static const struct regulator_bulk_data qmp_phy_sm2290_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 66100 },
+	{ .supply = "vdda-pll", .init_load_uA = 13300 },
+};
+
+static const struct regulator_bulk_data qmp_phy_qcs615_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 50000 },
+	{ .supply = "vdda-pll", .init_load_uA = 20000 },
 };
 
 static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
@@ -454,8 +464,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list              = qmp_phy_msm8998_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
@@ -470,8 +480,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_sm2290_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -486,8 +496,24 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_msm8998_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+};
+
+static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -773,23 +799,6 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}
-
 static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
 			      const char *const *reset_list,
 			      int num_resets)
@@ -1097,7 +1106,8 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_usbc_vreg_init(qmp);
+	ret = devm_regulator_bulk_get_const(qmp->dev, qmp->cfg->num_vregs,
+					 qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 
@@ -1163,7 +1173,7 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 		.data = &qcm2290_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,

-- 
2.34.1


