Return-Path: <linux-arm-msm+bounces-55356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19BA9A93E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F345F17436E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7F61FC0FA;
	Thu, 24 Apr 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozqrHY8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6341E8332
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488762; cv=none; b=YOX/gED5AHUepq3hflmSPtmnFVSoC8cRskrfeC8nf6dPNIcvMXBQSudmlbyYazo6PkBUAx5l6P4W0y4tH9EMEl9VYzT1bUVMB/pWLlrQmDyxsfkrKmD2EjkoVLoBDSUTMl1bhn+OcxmWG5aPtznv2UYV22QIMeI+P+eu3ERikE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488762; c=relaxed/simple;
	bh=aBtYyWx8XCPM8BgWwdjI1Z57YDtj0fMb9hGrxPmvmkk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IDKT9X+XtA/7mPCIrXJ3+SkhWGk4mu0NNdfqxw4Sr8fmIhwN4sKu3L/LcW/2wGY6jlsQYLbaWUuSgURlzljawWOVYDLkz15dekf3/op1c2uejDTvUOOnDspmgI53nw4qAyktvlzK09DZ85zvx8S4E9YvwXFNZhi6603sQmC7vao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozqrHY8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F97U007631
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zcarA8tjt9LwQKRWjZGBm+r2dm9TfpXygMW
	2SA2rBLM=; b=ozqrHY8Clj2y/nJDVraoVAik3PrwMIQlRLQWGP4l8mU4+PtPf1C
	yK2YHUZl8esTwpXYx1Sow7D/wG47Pv3k2GSpANaYx7c5kTwf+yF6B4tqns22DcdA
	lu0nAURPcx4YL+RtBM9WBi9ViyeXznwigyBgBwKo3HZuJKiVUX1UOljCEKzGsiMi
	+wNRyPgdKK2gqvvv2GqhtEPnE4F5bYypI2vqtG5kdyU/MJVG00Tu+Zlgy3QSGHPo
	2gjY0Hc2+YP5dRTBP7FrfIomnFT+va7azHFcME+8qQ4+7aIu+GeFVN4QenhLzjQJ
	NyqH/LMcNA8MG+wzc1/Aq2b0BJ8BdrmhZcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1n2xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:59:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so138227785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745488759; x=1746093559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcarA8tjt9LwQKRWjZGBm+r2dm9TfpXygMW2SA2rBLM=;
        b=NwNg6G0Y4T6LGEuEZXvFPJiutLWaRkFKjxCjwRiRDKD5x78xVOYEPvNZh/WUSZf8qB
         QgBLonc6O5ZBTQsfBmvKQ+OLcwRpw+tBKCDHNaa7+zDL/ak0AUPsTWwcQ9habI3tBzWO
         MUg7JzDfGxDNHq4c0hIE0CaWdDMi/Knu5cOO1vXDCetp7Hal0USf5jdPU9KYU1Wui1C6
         mQRB2vSsloqKMk8ZzQ2Gz+8D2WhCPOezrhyII8dxqB0Wp3F2P1KjAHNo3eFoxwSICfvI
         3kdw2gEzJBY5EltM2RRZHUmxtZdRep/VFU9YhFrp0PjUc45NfQwrNTyceBAJsCLy2wvY
         vCnw==
X-Gm-Message-State: AOJu0Yy7Se/MZuI0Z6Ouu2LNkzLoTim3/WstRFghHYRybzqI5wzJsrse
	Zd/vUX59WEEYJKahl5ABke5qLRoe1xmbOtdrh/AT5EYwVPxZXCrpT/SVp8LseIdS+j06NigS9Uz
	n/Gr6Z0reeaiC1IRlA541A+vuVvJxXqORSYogdxISD9uJP+7p5fQxVud1URU0QTmd
X-Gm-Gg: ASbGncskFkIFfCikmlURIdr7XH/WIvAQXL3HsY964LwwxJtm9zLblrt/luhNai7mMfA
	6EmId2/wrz2fK/VWcGmz/1ZkATmHM/c62ouqD/dYgKCqabaxvQ9tVAjPipjKL3H+qSDDDKmB2f8
	wz4LUX4o+wJatRfdLWc4IRYLiZjEVOuWnaFEeQBj8p24EO7SBUiDi2RK3I0BLdKdc2Q1+6PSAlc
	9WsXsqQfC056/zv+hnlCJCdpmbGvYvO1E8Q8LTq+NG8WtBJXx/N8ASNhBKORSDazBpvDURSLm6x
	yi4QfcQ+ah201Ql03GHhmYZwfNL6mGzgXrqDcG1hmLUJTpE=
X-Received: by 2002:a05:620a:1a13:b0:7c7:9349:e468 with SMTP id af79cd13be357-7c956eb3391mr298883085a.12.1745488758621;
        Thu, 24 Apr 2025 02:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+PbLFGgfxmKngc18sdTh7HDWxy7uxe/5S9qAp/wZQ8BuKfUXAnsyHpZYkQxoxxgMcZTQpgA==
X-Received: by 2002:a05:620a:1a13:b0:7c7:9349:e468 with SMTP id af79cd13be357-7c956eb3391mr298880085a.12.1745488758184;
        Thu, 24 Apr 2025 02:59:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c22e92sm80298566b.125.2025.04.24.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:59:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: lumag@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Date: Thu, 24 Apr 2025 11:59:14 +0200
Message-Id: <20250424095914.4002346-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kOSEwGUWuC23gSbxCv7w0hcsJ3xpcaSw
X-Proofpoint-ORIG-GUID: kOSEwGUWuC23gSbxCv7w0hcsJ3xpcaSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NiBTYWx0ZWRfX84waaw0EnELA /jQ+9wlFYVi/0DhFrxII9PQAp7oaW+Dh4x7aY8SwxkJ2fp3pOQFRP1kwH4SNgcvZOu+mQgVujAw 5PjRZzXCdH5Eao/CLAkKQhsOeta+a3Z/vQfoQ0JWlbYcxoBLhGhgtaJpEerVuoW/oSt7ZyQq5az
 z8jRBiM1ZW4Sdfh6oS9zXlqjy53x8F9yWlrrWayhUu9DdL+08L8D75Q134hMxlcOvYA3RqL7vH2 eC2l2kbPWnZgzg2rlSZ1z+3T+eaRCrTOtKv5uaEDq7XYHzDMNE8G/A/QaCtXsIy1pqHW3J50ci5 snW8dRfd/Nj2+97GwSXOELZvfl478QtdzsZayncOcvBgSyWOPJY1515+rtywphw3a8aUy/p94jN
 eg4nqjzJcuW5pc2PgwZ9Hie0QQSQLzRHGS5OT37Ll22mjTT6FcmMjtuDGoWL+0F9ty//PKUt
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a0b78 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=Hn5eap2Cq60OI_ydS0cA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240066

To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
be active for MMIO operations. Typically, this AHB clock is enabled as
part of the DSI PHY interface enabling (dsi_phy_enable_resource).

However, since these PLL clocks are registered as clock entities, they
can be enabled independently of the DSI PHY interface, leading to
enabling failures and subsequent warnings:

```
msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
------------[ cut here ]------------
dsi0pllbyte already disabled
WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
Tainted: [W]=WARN
Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[...]
```

This issue is particularly prevalent at boot time during the disabling of
unused clocks (clk_disable_unused()) which includes enabling the parent
clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
14nm DSI PHY PLL consumers).

To resolve this issue, we move the AHB clock as a PM dependency of the DSI
PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
prior the PLL clk_prepare callback, as part of the runtime-resume chain.

We also eliminate dsi_phy_[enable|disable]_resource functions, which are
superseded by runtime PM.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: Move AHB clock into a proper PM dep instead of manually toggling it
     from the PLL clock driver.

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 65 +++++++++++----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
 2 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c0bcc6828963..7c1cc06eec28 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -5,6 +5,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <dt-bindings/phy/phy.h>
 
 #include "dsi_phy.h"
@@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	return 0;
 }
 
-static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
-{
-	struct device *dev = &phy->pdev->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(phy->ahb_clk);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __func__, ret);
-		pm_runtime_put_sync(dev);
-	}
-
-	return ret;
-}
-
-static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
-{
-	clk_disable_unprepare(phy->ahb_clk);
-	pm_runtime_put(&phy->pdev->dev);
-}
-
 static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
@@ -692,24 +670,30 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	phy->ahb_clk = msm_clk_get(pdev, "iface");
-	if (IS_ERR(phy->ahb_clk))
-		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
-				     "Unable to get ahb clk\n");
+	platform_set_drvdata(pdev, phy);
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* PLL init will call into clk_register which requires
-	 * register access, so we need to enable power and ahb clock.
-	 */
-	ret = dsi_phy_enable_resource(phy);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
+	ret = pm_clk_add(dev, "iface");
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to get iface clk\n");
+
 	if (phy->cfg->ops.pll_init) {
+		/* PLL init will call into clk_register which requires
+		 * register access, so we need to enable power and ahb clock.
+		 */
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
 		ret = phy->cfg->ops.pll_init(phy);
+		pm_runtime_put(&pdev->dev);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "PLL init failed; need separate clk driver\n");
@@ -721,18 +705,19 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to register clk provider\n");
 
-	dsi_phy_disable_resource(phy);
-
-	platform_set_drvdata(pdev, phy);
-
 	return 0;
 }
 
+static const struct dev_pm_ops dsi_phy_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
+		.pm = &dsi_phy_pm_ops,
 	},
 };
 
@@ -758,7 +743,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 	dev = &phy->pdev->dev;
 
-	ret = dsi_phy_enable_resource(phy);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
 			__func__, ret);
@@ -804,7 +789,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 phy_en_fail:
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
 reg_en_fail:
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(dev);
 res_en_fail:
 	return ret;
 }
@@ -817,7 +802,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 	phy->cfg->ops.disable(phy);
 
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(&phy->pdev->dev);
 }
 
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1925418d9999..d4bfb7dd7ab1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -101,7 +101,6 @@ struct msm_dsi_phy {
 	phys_addr_t lane_size;
 	int id;
 
-	struct clk *ahb_clk;
 	struct regulator_bulk_data *supplies;
 
 	struct msm_dsi_dphy_timing timing;
-- 
2.34.1


