Return-Path: <linux-arm-msm+bounces-64251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC21AFEB66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DB3A7B24DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248B328ECF2;
	Wed,  9 Jul 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoakLytA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC2298CA6
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070127; cv=none; b=TtnSKyynpiQ7FDjlMIgQf0cqiO/b6ow1ivAjBKUVZvYlTcVWBijSm36RXVM+s+/DRZZIsrbjR0MAOSc5Sd1yvJEYRRi/sCuLz0ReOpTcgcbWxzM9+0F5sO58hNDh7lyH7Iz+oiZRRm8q9GprfucfJIcv5YKAHoY57J9BXjb8pG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070127; c=relaxed/simple;
	bh=N15rSf8iJKl0ReWa+VtbU2UpgOd9Hpn+DD+WgHm2JeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pgOspFFdvF40rXQragmPBb6QaFF9llNMyxc9ezBcDnHwkr7eBWz4ObPr/U5dM15imeIfkm20GxuFj5J5qhIAbeYVDm05oi4F4GqfFV84QN54Yfe3KpM73wxtkxp35Ed/sYHfDcEJHEPhwbDBJlm6xza7pQGe9bWIuWdl+4RxH50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoakLytA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CohQe012446
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 14:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rPPPL4r56hsvE66g/qgGzmPaE4vb8iTxuoc
	fJHXWXUI=; b=IoakLytAlZco8p/91uXuY0gtrPN0/idlEnX8Y9KjnZ7UnlUxrIw
	T+zuG4lDSprHwG3errVFAub5pFNhvnBoCS59tsY3qOu9FF5wI6plVt8G5xlAPi5G
	QbHX0wSsZsLuCwVkHMSGywmr+9BScmLLClwA7gK4PGzBaQdbWpJVXmGAZMG5AgRD
	TfftCB9y/uFJkoRizTqCRnMVqIieDYRTu8R1eBKrt9QCIpCf/pxFUXUs5ai7DjEc
	yEbgkP5egB3saD81bMpyBU7ltQdFYX5eLEps86gpMXUXsRm8dvKJRRJ42WPWXPlL
	X6oCHMw8vN/vnyHw7/aTRHCMQ7cpbJl8/0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn4v1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 14:08:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a58cd9b142so117470361cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070122; x=1752674922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPPPL4r56hsvE66g/qgGzmPaE4vb8iTxuocfJHXWXUI=;
        b=QpUQUiMN2Y1TkQcmFrJ3A0uDRN1l/hJQcy4wAlwkjHKPYPXjH+dbrWAx1FATSOCjOH
         4YhfSiZXusbYdeB57Tmbh31WC+bgF7x7V57xlhrt2G8qUIZNEtMkIiUZlCTHeI2emgOH
         R5X7I6309xARtXU+K8pm6BEPsbADoKIXekbDIfJ/X/amzJminfagoERmGiPVh168PdIt
         txxAfbAX23xcL8cC5afovXMVCFOraDT4/XavdZmqnbd7kLz/FbhTmDVmAOEwz0hgoI5r
         kBG8Hok+3AZkQQFQv1Xipt0YNC5WD5tXuoZP5GWGRTk1lY3zMBGcQeTP7IwoZZ4GMXf9
         bReQ==
X-Gm-Message-State: AOJu0Yxyv2KIgJuiWVFNQzkAtFYqVSOFNCjYNAp8Nnsok65TZ9hOOVBA
	srw5csZjOh1yEd5FO0YV8j1BSwW5vSDhCQfmXvzdJa+LSTAxZ/Q8uYZCZEvRn3vx95OTTdVIXRP
	Zazbszm89mVpK7DwkASn8mR9MkElWvQJLOaHrDKu95bhfxHx+6Rgu3hfmLG3UbhLnQY8b
X-Gm-Gg: ASbGncuMVSyeMOoIxSgdMw+fCyZ4tlZ9gMF9w2RYFJ9VwhRBl/eI+BYFHhEMVjuUpnd
	YwPV7ntrOtjOD3RE76bUUEXKbKjKgShRo6Kt1NERbRjlInoKmRNQex6aohZ4E+ZHHBptoetI2X9
	pbNpPMJK0hpS2XVpFj9072MFWkCxI8s01OA15j9k2nkO0W4nJX47lUjXjXZo3KHPjlh2nzw2Gtd
	/UOwxVM00HfjXyo6qLDVaSWv5syqg+WRYr2HYDm/gOI5qXlxJsioyuJx64IZg4KomBlElMuX96Z
	kawHOL90w1YjTChD3Xpm0VPmtduDTLO2OwzIb1dWqySejD1c8iuuxHlj+w==
X-Received: by 2002:a05:622a:4d47:b0:4a9:c8c2:12cf with SMTP id d75a77b69052e-4a9ded44edemr33688421cf.36.1752070121481;
        Wed, 09 Jul 2025 07:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp7LPf+6/idzkddzwujz3AEqLRHZrm21CUjTuJ/s23DbxIJCpdWglwm/uYktDx/4ddjHotCQ==
X-Received: by 2002:a05:622a:4d47:b0:4a9:c8c2:12cf with SMTP id d75a77b69052e-4a9ded44edemr33687861cf.36.1752070120920;
        Wed, 09 Jul 2025 07:08:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:55d5:c328:45d2:bf55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50503c4sm25555615e9.11.2025.07.09.07.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:08:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Date: Wed,  9 Jul 2025 16:08:36 +0200
Message-Id: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686e77ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=Hn5eap2Cq60OI_ydS0cA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: yjvpfbL3zUt0lTA0rk9Copm88GswCrjJ
X-Proofpoint-ORIG-GUID: yjvpfbL3zUt0lTA0rk9Copm88GswCrjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfX4ZnoCc7NAYH3
 uCOcMqf+sdSMWwbrSC1oLpotQEB7KDg0g3mqQxHluOEUeY3Fa+tqsb5+Y4qJ6VMwjYlSCZfDCIc
 8IyW2PeZd3KE9I4spib/cU1Fh0f5gXDIQtNOketynHP500QIbLimiGfrjTC/S/3hbdLbtf2ITfO
 G6Tqx2aOH+JthuW6Lp/y03PfQRyOxpz1Ab+Az4T4R7Ay7Gh4OXz7Lai81ZhrFmTZjZS0f0AbdsM
 hqy96CusMOYMwxWUqY7PhtOX7QHGp0/2AWZGh+iKet3C72GgS078pmA1lW4V1a/vp6mQSw7zy8+
 AvDIrWjrtqfJKEJjns2lH96WtetA3aPYHhWkvOqfwwr4qiBybmeJGpc6nyGV/y9uHhhn5GOnSMy
 8wBDSKlmu9EB6dTOWtdU5d3v3uO8eKOh1/E/n4+LJVHhUpv7rla0CK7yTC5EROjJ2YV+efhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090127

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

Note that it breaks compatibility with kernels before 6.0, as we do not
support anymore the legacy `iface_clk` name.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v3: Drop extra pm_runtime calls from probe
     Reword resume error on message 
     Document compatibility break

 v2: Move AHB clock into a proper PM dep instead of manually toggling it
     from the PLL clock driver.

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 59 ++++++++-------------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
 2 files changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 5973d7325699..cd6bc1fdd038 100644
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
@@ -696,22 +674,20 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
 		ret = phy->cfg->ops.pll_init(phy);
 		if (ret)
@@ -725,18 +701,19 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
 
@@ -762,9 +739,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 	dev = &phy->pdev->dev;
 
-	ret = dsi_phy_enable_resource(phy);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
+		DRM_DEV_ERROR(dev, "%s: resume failed, %d\n",
 			__func__, ret);
 		goto res_en_fail;
 	}
@@ -808,7 +785,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 phy_en_fail:
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
 reg_en_fail:
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(dev);
 res_en_fail:
 	return ret;
 }
@@ -821,7 +798,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 	phy->cfg->ops.disable(phy);
 
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(&phy->pdev->dev);
 }
 
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7ea608f620fe..0c65821a3db2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -103,7 +103,6 @@ struct msm_dsi_phy {
 	phys_addr_t lane_size;
 	int id;
 
-	struct clk *ahb_clk;
 	struct regulator_bulk_data *supplies;
 
 	struct msm_dsi_dphy_timing timing;
-- 
2.34.1


