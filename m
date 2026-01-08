Return-Path: <linux-arm-msm+bounces-88111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30FD0458E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB67F30408CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544EC500969;
	Thu,  8 Jan 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxf9T7xt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoUwf7e4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADE1CEAB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887400; cv=none; b=YjRACwDiILna6WL3jG0gkFsj4RcqYom8sm+5I4JcSBx4X9/rc/+dm3XKWa58COsIrClKs13uIllb8BCptsmvR5GSuU7cjV8rnk6TcniPgten7rY55Htk+LprLJNpwdwd1XzquRfnNKRvBkOPEowH1HBQNSqh67obzSTtK/rPLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887400; c=relaxed/simple;
	bh=h9wKPd+3kei0rCrah594I/4gDm+lBlMbtvZ/E0fAtZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cz2vjghzuKjVESnSJT/d6l3uVEJLxgyQV/KBqz+Ay3Mf3tNBrs+lqLOENh+TnOX6ApZq1RVubkjmDzU9/ht532YuriOsdWipN0ciesB8EixKGfIOQ/KFOKX3yQx4fAu/eC8j+CsnEBmKPY4mEWPErVbjnSbSy7Z7WUKe9hyLYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxf9T7xt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoUwf7e4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088w9XG1570556
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 15:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sslvioVRc5f
	6lALrQVFB/a6o3Iqkw7kTe14OBUMjs3o=; b=bxf9T7xtfKsax1z8Jy77iuCV3FC
	pN/5Te7oc1zVLs1SDwJu7U+bfu/n5JUbn1fNbQOBQqwzQR/Iw5U5s+E5XAq2A6sQ
	3ufOSOMN2NdyhJCwNrm8noV6yfRyq7S9CC6VcHuDe39Z/ATOaBfUwpKCPRDGeG58
	EDuR2HvFfKwUNdO7AreooHrs+fgUgNiUJVAQMV1FgergA97ZcMHRFjHDGnRf4I33
	OzNqeBdsR5DnUVdluCW7NDQnpD29ggpbBVxFzhvAMpZQUFReMriPtk0fV58Dc7Gh
	uMy8eWuASzp8GE1ehyBT+ZeOWv5bp7bLMHl85X0GUbd59zRgp4GjDj266JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqs7tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 15:49:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2a3a614b5so639732185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767887395; x=1768492195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sslvioVRc5f6lALrQVFB/a6o3Iqkw7kTe14OBUMjs3o=;
        b=EoUwf7e4PrPvjVigbXUeISYuf8SubVC1UXjZCZ7BDE910xiNWkRJOlO68c6asarxD7
         Ho38arDV4P4K4Kl5iv27nWJmqE1qgBzKbXVeRl/GKQFmnkpg8eUKfnOJg3and/UMp+bB
         gdR1/IJowJenwW1yA0tt0dmMXHFGwLj1XEoxglrrfQKDRaFdq0/GfndjTcABkwc9IkVX
         LhnAeDzfJCQLvAqJ7KekmgOjj6VmpiHWemcoGCk/4RtkJhgh3hpK0B+ft1k0rpHNFpld
         3KRRwQlp2CT0qDzGat8OVVxtOs1UAxXetRhhww4XGHv0g0Vyi+4ZI4CdXhhysxxQtvp0
         3MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887395; x=1768492195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sslvioVRc5f6lALrQVFB/a6o3Iqkw7kTe14OBUMjs3o=;
        b=IdjkG5d7DdhYkIBSKbaDf0W9ONiJJYQoFU7J6iL4+4teKHJzxbM5h9C6TGQ+fkU5q8
         YjlW9FCv4hL1oNxTDZNjvBTr5L8ySRvq8VNVmQb85ipvlNt1yNzHxt8OnxqJla0+zZaO
         3uJhGY3LDu6Luzo5Wkz1nd7qmDEG+/W3hkbmKUEuCJrEtFzdvZrP0N5XnvVD8jCNpcSB
         YFJY37DThK2MoqR6jqQqK7xuORvW3QycPfTpMthZeSnCgJANxHdtLguNC8cVSp8SVkc2
         MhDGBeSd/S9uhpZzEnbsZiOX6N8zmSp2pAn4xazLP6K/Af3ZIDqk9iG3fkwOtwBy1Gth
         T7Hg==
X-Gm-Message-State: AOJu0Yxu33PURtrsE7K2frWZ7Ik5IrBPOb15YFHwD2o0wpB74ZPuGdC/
	WqOY74yZnCKzPVM3JldD2bHMjK8tzAY04xJMjGh4Ci9fovSmRrB3707gStdzhyVub19QJjsDdDG
	rD4UehO9uk/TkTX1D56CTyyg8MGUQk1telw3Eb6MG/be1Iscc1jTUslMPRBLduuZQkxQc
X-Gm-Gg: AY/fxX55V14ZDxHOcYREJ1Oe1lcaNSkorRIW7vhvCy/SUNLlwCoblWHblGtj2757sT/
	9L4a00gCLwu3TJkRvQKvi29PYEe0kt/i7vnHRmgUTs9GNu8iZwxRQeZ/sw4a564eVIdKgA2dfZL
	LfduxPzslro2h5VmSozqM3PvVvun6lNdAh2G84mSfNMTdi/UeZ0Y3dQoHOxrP74ExfPNHe5+NVd
	etvkBMY/lcT5znyTDeG5fUqMPF0TQqV+dsHYCfZ+4nsqo9LZsLIkd5ff8e/9rBcsJozm3H35mzg
	y0YOMa98oXZ/IYnKtyG9roDUZGGjvi4PHsR6MXPZVB1x31HeCm3Sdg9DaE/zeTaIwtHzScXW9sV
	LoOyMZ75iE/wc78HUrUGUgqame+Zw9KwBNdYul0eBwopYx0N4t9SnagP7u9z+jOKgfN0nAc0eHd
	1c
X-Received: by 2002:a05:620a:394b:b0:891:7008:f2e0 with SMTP id af79cd13be357-8c37f4c2b42mr1385494085a.8.1767887395185;
        Thu, 08 Jan 2026 07:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz+EkWaD/eIlEyBC1oPCnJs3ZfQillVtZ2tId/uzroLw0JvPOLsrgMfHa/XM4WhHdq/DNjkA==
X-Received: by 2002:a05:620a:394b:b0:891:7008:f2e0 with SMTP id af79cd13be357-8c37f4c2b42mr1385488785a.8.1767887394673;
        Thu, 08 Jan 2026 07:49:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm8078121a12.17.2026.01.08.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:49:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 3/4] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
Date: Thu,  8 Jan 2026 16:49:43 +0100
Message-Id: <20260108154944.211886-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=695fd224 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yEucIi0xZ8PcM-TVcisA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vKukWkZHZ0xad7mQzXpDxYX6mI-5EfxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNSBTYWx0ZWRfXzq801p00TH8s
 lOi8LT3d8o6LXqoR18J8Cj+YhmnmEaJ3zjm3r8XOhdi2sCMTcCJ/YCDRijZGLxeDc4gfOpMx2GD
 NgNWgbllyqtXUzZ+NhJqEkxs+eU67Miaj1KSzB1ZO0zWPi9DMudKadRpdJqzaLmlIU7f3JeDKBd
 Z/GCHqk3JqH0vV5ueqzZoIiKKy804j5onYKHJsWREFms4dIKQJKFfAG+7FJF1cxr20KHOvUz4rG
 aNRYLq3KU2D47RpMfUFyuHW3ln0xpVKT1JGRuliDYKuLh0C+UTAHYyo2x6spwVZxR+Bmb8W7OWz
 mCmZcn95EWEoBEGTHoAKKZJ8/rjMl6oLv/tm+QNzMu+haHdWzb4IkN/Bm8qI1+wfMSs2T5FXta2
 UkpvOtI/lcLGRIUEGgqPJCd/4ZxYPDpUFaOqhlyJCfXFXzBxN4utJt9/F0uq0xSp4XEJ0SV+x4b
 04PzhCWQlTXIxkCLiiA==
X-Proofpoint-ORIG-GUID: vKukWkZHZ0xad7mQzXpDxYX6mI-5EfxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080115

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
        `if (!qmp->phy->init_count) {`

Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
variable that can be used to avoid relying on the possibly uninitialized
phy pointer.

Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent the window
where an unnecessary runtime suspend can occur.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490c..73439d223f1d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -541,6 +541,7 @@ struct qmp_usb {
 	struct regulator_bulk_data *vregs;
 
 	enum phy_mode mode;
+	bool phy_initialized;
 
 	struct phy *phy;
 
@@ -895,6 +896,7 @@ static int qmp_usb_legacy_power_off(struct phy *phy)
 
 static int qmp_usb_legacy_enable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	ret = qmp_usb_legacy_init(phy);
@@ -904,14 +906,19 @@ static int qmp_usb_legacy_enable(struct phy *phy)
 	ret = qmp_usb_legacy_power_on(phy);
 	if (ret)
 		qmp_usb_legacy_exit(phy);
+	else
+		qmp->phy_initialized = true;
 
 	return ret;
 }
 
 static int qmp_usb_legacy_disable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->phy_initialized = false;
+
 	ret = qmp_usb_legacy_power_off(phy);
 	if (ret)
 		return ret;
@@ -988,7 +995,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1009,7 +1016,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1277,15 +1284,15 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-- 
2.34.1


