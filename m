Return-Path: <linux-arm-msm+bounces-74983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294CB9DC97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9137B3241AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739E22EACFB;
	Thu, 25 Sep 2025 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFrevY6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6202EAB7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783971; cv=none; b=NeUvFpPN3jnB6evgII1WK+rgh3lCWLzju11tK0aHfsr3Xd1O+m5ry0p7roiRWJ0u3nHVdQR2GWv8vQAF7vDAnkyjLn9c8eoOGIZrbJnIuQNlc7BbVcG7zI8cGUIpUX+DbgPzj7dmQ9IoQInOPC0rW/TBRlwxgYPo4wdBW/SeKNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783971; c=relaxed/simple;
	bh=2OW0hX9TF4LQlObLysgxoFrzLXkqUgu/cavYoT3SHP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlMut37q7RdmqjF3jgcfI68FG+A6KVd4Q0JEpVFXUXzwz+r8KAQ3rk/cFy10NROFk3EUEbj85HPj/60MPPjreLxzT4tR6080tdnEPQnteXUGPswseE+89w6PSsvbhRH1G0GUH2lTAJbUHCW//HXOaYhpnCU4uJ5axizl3wdUmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFrevY6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aush028512
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=; b=mFrevY6ycobFm4F3
	AKnprbvloiBNdlfGAw6CJph+D1IOBgdWLan8NptDUin9rEm6/9B6rry8SwlTPCKw
	cpoBPbNO4ivPkKV2tvzoXs8n+reW8hA/FShtfkMTolDVB3K5xCOYbwOGu4YTDYxz
	brwxOn/d0Kk351N7oMMKevVB1rS0eNJ3bJpLhMEX52Ah2nRRg69TGN8cuD3499Zc
	kTcy3ybrwGLUMhLEVJlM/lG1ibDdYidh1jUeHLNs+kaBVZRhFmwz4CBfeahQf31V
	oco0IEJc9Pd9STaD1vbJLK2ks2QuLxK6YTrP2FO35hJyh+0ZYvXNZ6fkhnxrLpr9
	9gmjrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0bvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3306bae2119so299958a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783968; x=1759388768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=;
        b=mnH5n6vGftASHloYTe6OLtWszIyqAscteW7UQGCZRRpGvzQk1EkEqitpxT6phX2MFr
         126q/ZLQAa+rvmzkoJvzAByAw1/6l10xPP7T5xeVu0bNomwUsAzD55g/BGUBPl5g2Fj7
         cBMbVK01Lv+NOMUBDD22TaMaIN4T4bn9nZorihBGK+ZhRLjX2t1bJEaGLIVsgiYDsmz+
         QPJ5I4rjLK4WA+UutAqqahv9ImKEka8+ge7dVuBlS8DHKmwrip2iJbs4Ao7tvFEsLPCz
         PDeh/nlK4GJuyE7GVpajOs71J/OKJ6Q0wZXX9XdPSdzaWLGG4WrQclmR9pqMNYsjiCeK
         ogWg==
X-Gm-Message-State: AOJu0YxGcHOfhL0EaTu3LHJQv7OaL/E74pduXeSI50b4X8/ZIKnGnknl
	ptz78N11DFAMRb83dw86sOh9UNJfWi4gzUwum5slwI+pwkr+ikbjJ6o36pchA0WXCQsFqjed1Hd
	++lt4xn7sPSweYr+XXocugOINHe+qN75aWcLQgBQhyWsula4+QjpMoVJzU2WiLZjw9O6A
X-Gm-Gg: ASbGncsQBfpYYXjWcbJlpsCjeF/DuJwQGNz0axFgQVSn7BLxz3pVaDhYVgRE6r8LjZa
	HayVMvz2nFPQaFHc9nHPPfnuOJ/dV2+kRlyWKG02eoie8Ey0HYLQYMaf3DSpu0YivqlQK+FIQgr
	xZbEwDCYfFqtV02LO63+tOrETPcaBP+K1yp7SAc8yVujwHzYZZsKJJGsTGRNtjVYlMQmTni19Jk
	08Tum+Z75c4WxCOl8HSXkVMJ8akuIVpSHTZCEvWY5aczlfKAFshOoFyl+5vdXOahoO8S/oUhpHw
	9cmT/osPUzOdtjVBCvdenAsByjeYIze+bqVDRqWN1dLh8X5q72w3j7sa212t0+KirPmAlYfc2ox
	9Z1bjj5pWE3+jNSVmZZhGGvY1cua5NJUCDfItW8cbGasmSk+I86gPbPLH
X-Received: by 2002:a17:90b:1a81:b0:32e:1213:1ec1 with SMTP id 98e67ed59e1d1-3342a2c1012mr1392349a91.3.1758783968299;
        Thu, 25 Sep 2025 00:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqm4vqi9INx9yrFdrRGXI6EToe4coF15uJ9HBu3jvVIDzDTGN/9Crhz4syIBdRqrXfjzrKqg==
X-Received: by 2002:a17:90b:1a81:b0:32e:1213:1ec1 with SMTP id 98e67ed59e1d1-3342a2c1012mr1392327a91.3.1758783967897;
        Thu, 25 Sep 2025 00:06:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:06:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:53 +0800
Subject: [PATCH v6 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-7-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=2424;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=2OW0hX9TF4LQlObLysgxoFrzLXkqUgu/cavYoT3SHP8=;
 b=Zt3LO6ayN2gVmBZz9fMbnffGNND2tPNJsWMfyvfI7ZhWbNlv4laRaW2taqVXBUAQuoOOJ358i
 WNh/BeOChdWDMyylnbxEoajRmPXHQasqALO3KOps5erPlBA080l0SFx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e9e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JIg05Gv9We-wtn8mShgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX4uL2bB8WKnn9
 dHZU5GN4So4xVWAIvtVGk1IUHcZGtIJ0DXbbB1KeLn5YY6V7w71476LikdkzKgt2IdQ9n5PpSHR
 hvr5tROG0eofYYwu6Gpbd2BVg19J/D0VjJgAge26jrJfUavIiP3bnaQM3i1RLg/cjjb4aL36vYZ
 ZY64gcyoOc/GjVqpAZlVJ3fm0Aw4LPymHdM6NazAUDcIzsTPgR9NW79WbxUdiDfYZYeWSGlpgzs
 j5pbUXHHrj4Om7+zp430j5V26PLHfp73qsGrHETXBELwJ/k3VWqvF7YmR4MsMO+dj2g8S2yqd7C
 MbDbNXa8DpTkNrJeVK4QhAi8Fa/gDSWodLIrtPOTGIojQGN91VW0pR4yNw6Zt0Z9zPsTFr/bnGv
 FhXgCOiC
X-Proofpoint-GUID: EJPG7op2cGyphi2EYmK94ooXD4y-fcm3
X-Proofpoint-ORIG-GUID: EJPG7op2cGyphi2EYmK94ooXD4y-fcm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

The current implementation programs USB-specific registers in
qmp_usbc_com_init(), which is shared by both USB and DP modes. This
causes unnecessary configuration when the PHY is used for DP.

Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
so it runs only for USB mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 7139f4dab82fd7b0d1362dddefba178465e76fa4..a971bdc3e767727e69ea07b14d9a036347d365f4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -30,6 +30,8 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -531,8 +533,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
-	u32 val = 0;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -557,16 +557,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
-#define SW_PORTSELECT_VAL			BIT(0)
-#define SW_PORTSELECT_MUX			BIT(1)
-	/* Use software based port select and switch on typec orientation */
-	val = SW_PORTSELECT_MUX;
-	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
-		val |= SW_PORTSELECT_VAL;
-	writel(val, qmp->pcs_misc);
-
 	return 0;
 
 err_assert_reset:
@@ -599,6 +589,14 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
+	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+
+	/* Use software based port select and switch on typec orientation */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	writel(val, qmp->pcs_misc);
+
 	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 

-- 
2.34.1


