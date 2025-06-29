Return-Path: <linux-arm-msm+bounces-62928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FFBAECBD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 10:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36053AB1AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D71F55F8;
	Sun, 29 Jun 2025 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSj7D8hF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6878F4A
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187051; cv=none; b=DFFV37aF8/glMcL5y2qiswFgYl3i/eC3cCHxsQzRMAeNCYncxslwXjS+h8iSs3oZG+1duEFI/YVUG5VTTqODx2NFy7jqDkCvSH9wfj5PvoTRpOZ9HRUG0J5l0Rv9yWYAWCoeuVOvMLI5wZCG7Sf8A3YxkaLptsW8+NraatqK7CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187051; c=relaxed/simple;
	bh=DunH9N9NOFJgoZUkS+ojqHHWtzax6YgFcdbVMbLz5oY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PzPBa67/lR2XIiLpVF18gBZoB24E80flNla6mWbziXkmWehLmmqweZeTWtOR8ufHckWeUDPhv+hF6GcMMLg2YPfww4QQYa5wmv/aBgJBYH9SWSoWiP1j4jxu5Sc0C4wt9uOv8JUmzkYU2879tMPRXPHaZwdw3Y7x2hpV391+S4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSj7D8hF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T4JGvB013992
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 08:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0hMlDyDA0Cncyv17SlazKl1oOurrgn26mPK
	6B3j+WiA=; b=iSj7D8hFBCQQnbb1wnFI1cLknT+SVdnBKg8BTJLhgwFbusfBuQS
	M+mr/qVmMKuCmlEAQYJuI3V1WKpXCv4M8iWQqgqe+/VekssVI/EFAKgpnr62iyJd
	U40QTYajYpVeCEPPPn1d5SiR+jCeibMj6XelrK7qVPXmfoXMZqZqt9v5L4zFKPqw
	Xwwbkuworiq8P641PRgQd7vaV9GhMDZ6LFbYYZgQG46q2xFXoId0SJGZhd4NiyIp
	INhtAMVSdfsrzT271CYH3mWOwDT3D2fLIfwhlExa8tIniKKrmv/6UGsmMPNmwotY
	ZlU3v/if41EY/xKxR+TudATT0tVMU/X/zAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801sx4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 08:50:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d38c5c3130so213023785a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 01:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751187047; x=1751791847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hMlDyDA0Cncyv17SlazKl1oOurrgn26mPK6B3j+WiA=;
        b=k0pUr/vcwfsXTsIc4z3xAbMLqPriBFO9x/dFesuBAXmRxx3MBMa9Ajw0VCgAWZecHE
         7Sw3u5yvYQMCnh0EwlnjkOqDWOESKNvISm9tBLLuGj5BGdWi676w7BfSbn10tYXPgD8f
         pkWszMSgGE0hI/QX37sUQdBUZkbmjgnPmE3c29b6IzDqJLsPwEJVYrfDOWCgyug6ObG3
         trcedcxQdh/5uod3Ilgi5c5GaLq1BSuccZsGms3FROLff+7l7VBm4iqCXEdrQ0YAmd+l
         0QPOQtM1HsfO51RC6exL0KQpf5giFAHR9iIAqZZlE5ggUDJjccPJE6BHdfnXOESmbQUd
         2HWQ==
X-Gm-Message-State: AOJu0YxpxGOGd+AYuTflkFpk1qcgjlw39nUeSAAg3GcNYa1X5683xXM1
	roSL7H2RTB1SrJGrU0FSFhxjQuQ9TLra4WL34219gem6eNJkqfS+hlrz4zRaOK8mB8tJzfCsx1B
	/GASpFf3fn4zKwUw43xFXWSxwyxywtrRMdBaSKEc2tnvuwu2xfmX81zcTGIe3iMv9LKuy
X-Gm-Gg: ASbGncutuIz9JFUs9t2K4cz3QuG7CTKreFK5KnwobhTaaUrP+jolS6W53tA8Tec3yr/
	LhNzdVMsf/tEGcLg4oeEUnoXd+dAi3eBQrRhKpUeCYZkrlRKKak42Ip4FOzNBFahGsGUQ78F4D9
	NSwkmZ5QNOTi2AqlpvCykSbd2Cy2z1+wl40PewlidXToy9imHIr+gwp7nFY9EpGp5yw/O9YITom
	XhORNlOTtHqjUU1xL10yzksFU8wEYDzu+YeczfbmNQlYtiHWPT89xBYYD+oB2th19tj8Sb5Jhh7
	s5Kvj4Wj0gnQiH6t7KxqawmE2UR90vVxGHurTJTeSt+2/g3l0TjZ9jdP4g==
X-Received: by 2002:a05:620a:a101:b0:7d3:8d53:c509 with SMTP id af79cd13be357-7d443923426mr1326542885a.2.1751187046672;
        Sun, 29 Jun 2025 01:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7/wzur2ilMnXl00SgqKWW95HdeipYCmpE4UPXGQOX/T8tKPtvKwMo5gyNymqaUsH5MVU/Gw==
X-Received: by 2002:a05:620a:a101:b0:7d3:8d53:c509 with SMTP id af79cd13be357-7d443923426mr1326541185a.2.1751187046208;
        Sun, 29 Jun 2025 01:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([123.51.149.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc2dsm463754966b.136.2025.06.29.01.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RESEND PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Date: Sun, 29 Jun 2025 10:50:36 +0200
Message-Id: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Glu27j_22APbN-zZOKILqSTWxJreV656
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6860fe67 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ygdFXUo9QkFfm0HlBJS/UA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Hn5eap2Cq60OI_ydS0cA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Glu27j_22APbN-zZOKILqSTWxJreV656
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDA3MyBTYWx0ZWRfX+TiVhxjTGMie
 c7LkMpfsthEb4DxJPbY7lBxoRPnGh6VEy0OadIt6z9RKKJ9vZXHXpsQxdT/nvXUQVpK/fJ8PU29
 vY8szLUxJuxh5SulD9OTxkHYzk1z5qFpjvU4mxbsPe/Uy7QSHiImrt9L7l1wIkqlzipJuSinkwz
 egf3RnQ5rw+1YcFrxEV8v6R3p7czMPvDlukVNzXochiycQbjV+ylJmMxpBXOb3P6sVNx+Y7a/IX
 bLxDiW1veif2UnKaRmDFBF25nprIbnKYkuSP+Cers3qSK8jOgXOu3flln1V9P6fYXK98h2uYPwU
 MY/EGqtIuAo3C4/zph0Jc4Fw91mkd7NhwLjkQ6oaFl0Osidqs2SQ3svn1IDhhz2dL363fAjTZzl
 xZqqkxrNNMJhprQBb1gz6SChK1jWYZvOGCHzsWBF3axHm9OFcNG9s5n/Mll6oPYO4xNiHTqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290073

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
index 5973d7325699..015cb579c669 100644
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
@@ -696,24 +674,30 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
@@ -725,18 +709,19 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
 
@@ -762,7 +747,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 	dev = &phy->pdev->dev;
 
-	ret = dsi_phy_enable_resource(phy);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
 			__func__, ret);
@@ -808,7 +793,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 phy_en_fail:
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
 reg_en_fail:
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(dev);
 res_en_fail:
 	return ret;
 }
@@ -821,7 +806,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
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


