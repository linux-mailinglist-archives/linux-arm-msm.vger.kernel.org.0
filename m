Return-Path: <linux-arm-msm+bounces-58321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37525ABAF81
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3F433A61EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA33C218ADE;
	Sun, 18 May 2025 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahe8YxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C72185A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565731; cv=none; b=pf7xZCqC86DC/4BKlQ1Qhvy9B0LJQlaeWiCbJBSJBbcu6+ozMQ/9qu2KaWoM9JPUXFQM2Awe9zJY30MhASdx0hLHgGDPJYgxH/8B26YGfG18oz2rHZUM+gBvkQR4z+KtP9UUU9aSmjvnmtL+1sG4/c4/37+ccMLGn+kq9WZ9j2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565731; c=relaxed/simple;
	bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E47GZPCjttwl0C8Oo9xO97n+leCvr1oTG7H7TvXp7t3nemRDD6c312L1N2GwlvfeCLJ+R920BNx4Bhqb0oArIm2uw8rIAPmtQRNNErFHPPGZNQwbCnBRxz+3tG57ZKIml3X/uLVYUtQjv/poB/odceIC2PrJwlQjRnM4BnwVuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nahe8YxR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAaxam028701
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nahe8YxRHW5xg9PY
	dXbIVB/TrD8zdCizJb8GHcupO550BKaGOv8QR3LQzTXbmj5omcdhp4FHBySECvkF
	lzkFQIK3B1YnxBW2v0kuFheHrpmH4/3G0OtTNl6+8LVxnuA2VB7uxifRjEJ/EUPn
	m9XuvYzU2O5XCfwArnxbCodmFsbBnuCkSxUq/EOhOrcmlWTUg1aFTx4h8adrBLZX
	JZycjE7CamaZurPG2gGMsdyociQjb77zX3LArgiQyvzgo7BxjeDizFkos4IWJBAs
	ZdnpDz6AfmYf9wwdaybR+FX413ik3Z5ye+s21yQ7esJjFq2ptA0EKVgBbHMZLS92
	/gDnXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhvmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so69759406d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565728; x=1748170528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
        b=nLEdhZylLhRCTAFXVuj2Td99Z7ovIPoUx3GZ9jxgp52ZzFbw8Uk/YVEF4O8Co+Um2w
         fYLiXlyl6Vbld7C2e1CBO52xNdAp/ZKm5xUz2uYl8E1h7hbv8ZZJ9oESLeo0U41qfiNf
         YBYm0fOvAg+uz7I1fPaOmUaelLD3XoylRL37vWk1Goz6m8gdFM/mKU8TkiqUrxaa9NEz
         Y1W+oYa89OFBtcSCmVIpgRbheBJ9VpH7tEgKmh8ypT39gvcPgqY2rvO4TmDz3HqF17Ul
         8B4zAX4ceanJC8V3iBwX7GOK4yBqlzMi/yP6Le511Kxtqm867Mhj+voSAxm51HH0eUG3
         wb2g==
X-Gm-Message-State: AOJu0Yw06wihDKT4hky96RvTKZBiHb8xigyyLnXfCdoNTRqa20fURsaK
	U3TXq4JoLdFGx+6PNdMmKcWlseTsD2r2JIXh4rlCSQ8b8/BVOyrn+giDKVWr9n5OcxK4WZ8RPN3
	kJGT1nUWYlI7dPwgIsBsVeK1asaC0o0GAuIBTpVToJDLk2ddcTyuV8DP4tP3vaBhyIo6X
X-Gm-Gg: ASbGnctKEZrCfVoinj88acbTi/r4qNeIoAnNcoaMGnPW44z+vfuuExA5caZXkoATurE
	LFGQAEAh+invGjvGPr/mjuklzDyFXqILSrCorLuLr77vKwoGNi40tBFXADO0FkTkUcssYWx1Zlv
	bUkHdbL9WzDu2wcrICYrvkqX/RgkCf2ECqXzFSCE5EmaCm8lFoLTruxxqSdDndEXovgD1IAzkpj
	yuLHou70nUSV2eb1OisXvVOYTQ08BCUfeYUwA0HHUz4F+esSzN3/tlwmLDW2DovPXnpusfFkMdd
	KomasSquAFvf5QsIZgJZ75I3Kx8ByqlA6byWmqvFbEOByKLlUZWva5p0E+V8UG2FMRlG+4rztUG
	cOdXTj4eCbDXymobtcvkUnxaA
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f8b2c95b78mr153800176d6.23.1747565728054;
        Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwzLMkmBkdbwjFViOIMLrKHJUrUiuLpJ8M0qtJYTrZeZHRoKtHam4c0qJtlboNh/7FpPSgA==
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f8b2c95b78mr153799976d6.23.1747565727641;
        Sun, 18 May 2025 03:55:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:20 +0300
Subject: [PATCH v3 02/11] drm/msm: move helper calls to msm_kms.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-2-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZDa8XSHH8mycqheTvtaIQ9DTALExlx1ErQ
 VrWxLqtNBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1bufB/9xNZEFnQ3iUAr5/qfQECmudD+538OkFFnwxzChSUqhOVDUvBNMhKH9eMIKYqXiLTyXbnr
 NXQh5FdSYae51nMVEfLiy/HVdJJ9kUtpxF3iB2aV3dhMYiGvIppuxe3QrXX77Cd+d2ovZNCtf6E
 O9qjdbopuZWbMr/1dE2f7aNOJPsTb6Ofl6L6pNnLTRIiHSQ9mpVLM5q9qumb21edQiWxtqKlWwc
 C/TuIQ5Uk1moxvvnCTasRV44BeM5UGg4oIz+NJHjU6iUTSKi0pKXvp/sw9SS9AHQ+owMLqmNsOa
 spGY/zt8ns9QKuPTUuDuYflG4mXrcFZgMMKdfreD94+z+NXL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: XQ4IdxmmL5YF02jQy8NBXx5H5Cbtlemm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXwTqC1jsqpC0U
 ai++H1Yqu2+McjZkiwB0qj7j05snuN/i+K0cVWHwWOuhoxQif7tjiprf0foLwZfB5Ge/tOkz7ut
 XzrIQm8U0Si2An6H9/ECkatAZRMvHIFEDShJyDaJ3BxJtFs+zwyPz+MqHMPGcExHmMXesbLF6My
 Zk/SV/dMDUX2JA8l27FWZ9k8Xhwq0qV7o2XDTE61YJ1dXPA9D+IxfrfAHp/bKI7Du7K2fwsRJRf
 XPaHtC8vQtIQqa83Nt94Q2y1JzXQ/5U6vzYX9NOEtimHprQD6r3mbfbFzDIhuYAZtUc76W0Qdow
 L6g27BfDGoewkiyxm8mmAfyCfWqhDP5ZYAkCRZ8bcJ2Mmgw1m2tvnWZ8oFyYuQApgkP8T0mYa2S
 11h+qs/7zJs1PiI1RopcyGvopkY55fBPS30eaO2zpkK8V0AqcmuZZaDcSa/yGSurjbYbz6xQ
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829bca1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XQ4IdxmmL5YF02jQy8NBXx5H5Cbtlemm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

Extract two more KMS-related codepieces to msm_kms.c, removing last
pieces of KMS code from msm_drv.c.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 78cea9d4999488648b4131a2da425fb349d1b664..2c6997c85fbbc3767315ca3a166a99b322f1218a 100644
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
index 184a4503fef0deff7234a3ce332e0bf564fbce46..49a56873100b2fdcded3eb6adcc7032bf404212c 100644
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
@@ -366,3 +376,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
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
index e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b..26cbb662e7533fdfd55fb7f200b99c79c3fd3211 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -200,6 +200,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5


