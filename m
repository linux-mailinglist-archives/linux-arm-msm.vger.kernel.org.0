Return-Path: <linux-arm-msm+bounces-54125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD8AA8727D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 18:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B51016BACE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 16:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA081A3171;
	Sun, 13 Apr 2025 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dou7qtQP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1626DDC3
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561987; cv=none; b=TBv+7g+ydWz8A+MuSLFmWdUrQget+8poxbiMblOHNqeejoJ9xSNKMXIknZixNVLHvTWSnJ7YfHKS3Elm/XKeafhIcdpXoba1jye3zvf163pB0lySGShjzP3K0Y8arsCLQipDRyNvhNCQqk22dMyFj71ZX4Jgz8Eu+JFi6MWdcVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561987; c=relaxed/simple;
	bh=q2TV3za2YMsS1/tN81KHJ6sYde0HsrTUt/tA1uoSM5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmLSvxx+yNHwEfam7KKhFQjE0JxpaOMUPP5tediItEvfGm/SQHhkW78lyqJhDgtKL6feOZPlEioVnPyDclp0VExm3CxsnpwSDFkILbR9E+bj1o0xgl4suiO/tYzQdk0mmcEmovVHC93krKl31upeinZyGkS5ibP8xNWPgbn3Crg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dou7qtQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DFUHRq018171
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lOfrQC97itnkemnTsDOXPlft8YCdkPBpyMvVoCbScU=; b=Dou7qtQPuTJQmifs
	fyIyU+hJUAibYcI5ro0nRZw4LRrRd5NhwOV2Vcw0Zm8pw9MAYTEvzL0XdbLdam1S
	Qz/iP8TFggdcpNcDo4A+h5VXdvOITcsZsKjYgho8W+8lYs6NMzHuWBQJTGbTv4rl
	QgyNQLDV0acWRD72r6+/GvWiP6nHvvwwJvntm+MJz9V0vJnEFzkGlrSqG2cZk5UY
	HtJGfi7imiRLwlcsPl07Uai92ubEnfWVryN7aAgQy1+FHSE6o66jCT8A6kx+I7yG
	Lzfz70ITzjwawtK4OzaT8i4f9qQOFoKkpDjqR4c1oIxZou5kcoZRC1AKHkvM0SDz
	kuXVTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6acy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so545546485a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 09:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561983; x=1745166783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lOfrQC97itnkemnTsDOXPlft8YCdkPBpyMvVoCbScU=;
        b=tLXnAo4lbolsa6ON+c5rV+k3YHNgn0Wfdl3fpOBOYraQ2lBZAnLSCOXxukwSNw271b
         y1KH2vezvRjZ0W7TwBjd5ywjv5fBCO60kqMthzoQ4b8Vds5Of4HSlyqG/ojKwirK4sIW
         uQBNQkBUdyjj/JX77TQ4uTkfCXUS5q0eSydt55S6A2Q1S9AxTyM/7O6s5B+sAa3xgT8A
         zo3tp2cIcVOTT+uhHB78pYX8XeGpXcQJFoTg1Hr5ayReWrVHSa+XYauY3ovPwu7inCb7
         Z2Jg9bVNebzqWoQJ8nBp/Dzrd6GDlBhJIqEVyXAnqYIZT52GyM71IX30EKUkhswoiZXu
         +aNg==
X-Gm-Message-State: AOJu0Yys+FsNAwFaaDWIxrK+x5VgKnOj+s75f2HDHhavLF1s6tKYiAm4
	ZNzSP29qhzCof3ofnffDg6RqpbymDN8kKy7BLgBtnEMsWfG+AKx+omj+awoR/g/gydaTEhESMQP
	a7G0Vz3+eAx6uAnGd/Y5lovLGU6yZx5SSborIxUUE/V4w3fn72Uqlbi3352dGu0Vq
X-Gm-Gg: ASbGncvHPybxtPe1zdOfKrWatD6KFLm7I8+bQKprryTxCLsmJw5lYJmtG/zjCVfEypq
	I7GyQ9xhoWTLCJ+RFQ9VwC3EP3R7e1GLpylyQIu4YRKP5JEzShykleyw8jEPpu0uksMqcd8QIkP
	kCqA6eiVKkzjMIn0ddnnxQcja492Lch0TvKu32fFCqgnQEZc74G/4Bzv7dM38ReJGoIWR6kE5Tr
	u+mKUxrRtVMb2oQvOBDYuiqicuXz95Oi2oVPhAluMHp2/Xu4kZcGfqHNyWLhddzPj3UC3pdghef
	A/5LcFjmZPA0nd2owAsQ09jPRnXXZhVRWwy1QdIjOAK3AdtXKRR+JmkqUrnMlexO0OVlM8L8X4P
	hrjI/Phja9TVgwOsfnOwQaLB6
X-Received: by 2002:a05:620a:24c1:b0:7c5:9788:1762 with SMTP id af79cd13be357-7c7af115a88mr1553672185a.45.1744561983377;
        Sun, 13 Apr 2025 09:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoYxRLeLUP8wwMv47f5bvT970+5SGoyAUvtb70jI/1SHBFVXLdrQfg1QuWdHYnMb2Kidxnlg==
X-Received: by 2002:a05:620a:24c1:b0:7c5:9788:1762 with SMTP id af79cd13be357-7c7af115a88mr1553667185a.45.1744561982876;
        Sun, 13 Apr 2025 09:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:33:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:56 +0300
Subject: [PATCH 2/7] drm/msm: move helper calls to msm_kms.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-2-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3462;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q2TV3za2YMsS1/tN81KHJ6sYde0HsrTUt/tA1uoSM5c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c514hgycc6s0hl5iJqgNWSan8fYW0TqNOeE
 In8GBkJzWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1R+sB/4xQ14DFSepN3Pc/dbRTGNkwhgiKH0xD3kf8gzdciIq/WiOkRHnv74I0gKlgWOluGtINBd
 kJZzB7nhyLthcwogNvGAFbuNK8c1pUImkP+KZbO4YTfNXvcsMq54NO6G9CDEKfaI2XjGMbcQmBd
 rDRSAjk2H+FTk599L8VZnHpYvggAOf8Gvj1qBIPYSNVXLkS5DG5m388FtcQjA3TTD3S74Oi+Dhs
 k2umJR9C8JNvDB/7m/QVEAReT5xjXU8rUjErbWERr+cFD/6Ot0oiQjjWMDi/f2AG4bbeFFVzJso
 dK/XWFH5cnmw9z4QIAcNhuSiuuuMZ5WTHWRwVzkANkKmr88V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: T1LrY1bZRVw6nLbOdzGBQbjI-wVIpTXR
X-Proofpoint-GUID: T1LrY1bZRVw6nLbOdzGBQbjI-wVIpTXR
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fbe740 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130126

Extract two more KMS-related codepieces to msm_kms.c, removing last
pieces of KMS code from msm_drv.c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 02beb40eb9146941aa43862d07a6d82ae21c965e..b296d1315aa249638e073d08d43e8d41a4354f3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -79,7 +78,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -275,10 +274,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (priv->kms_init) {
-		drm_kms_helper_poll_init(ddev);
-		drm_client_setup(ddev, NULL);
-	}
+	if (priv->kms_init)
+		msm_drm_kms_post_init(dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 821f0b9f968fc3d448e612bfae04639ceb770353..fdb22c41bdc1a772b45c6940dda787dd96879bc2 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	return aspace;
 }
 
+void msm_drm_kms_unregister(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_atomic_helper_shutdown(ddev);
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -373,3 +383,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
 	if (drm && drm->registered && priv->kms)
 		drm_atomic_helper_shutdown(drm);
 }
+
+void msm_drm_kms_post_init(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_kms_helper_poll_init(ddev);
+	drm_client_setup(ddev, NULL);
+}
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 43b58d052ee6aae0ce34d09c88e1e1c34f9c52ef..057b20367724a4ca60f2d60c038077dbcc1c7abc 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -192,6 +192,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5


