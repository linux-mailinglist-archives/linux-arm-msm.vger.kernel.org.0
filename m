Return-Path: <linux-arm-msm+bounces-56629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF868AA7F1B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A7CC465F8E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93ED1ACEA5;
	Sat,  3 May 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLdV+a9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157941A76AE
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256633; cv=none; b=bWQKOSJotxcjm5nwlrSeim+zwLqOQSbjq87Sx/9qoGBGnysaiQtsvFLSSpwkNEFPm3dLF1fGAOuewVA5DULD+D6lkKEMbSZosxUFAYQt2rbvAteF9YNy5675KtK4O7SR4rThJFtAm8Fihd5nQhk+3BUuNKi+j4FHeS4RtF2VyKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256633; c=relaxed/simple;
	bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFPRtTzCuBWACozpIqIaxAtDJbhmM1f9iuFOHyDGouZ5GOw3ATXgdowpJ7XDJKwfi9bRXOdNnjIZel75HkwG1Ar5u1fPOkGHK9EEHsYIMcakY1govQn1jC1WLpzLTqNFSv9NFnNybGc/sZkj9VuV/hdDeHFbzizwm7GpWPdaYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLdV+a9l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434PlQs007763
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nLdV+a9lAEhrHXPe
	Q9nhSZ4GwJdEzH0xbmoOqR+VsmGlYeUJQw3e95TpAfMkUwVukHBeyPqzgK+6Hep6
	DVkHpV1u5YOlFOyWlxEsqyYcNyuSlwbLnJCQBiykrf99R0pXlKPs7EhKhNA8kquF
	Eokmwikl5lM3TNoNmZdNgGakNQE/3Ha2ie0hZzMBiBE+9xA9XwnbNNDucSS4/cg3
	5ScIFT4iykt7w99qGk5L5VDdLlW2LfBFy+IE6tNdqykOJW7HRrAMgMLXWtua0P4g
	1nRwvXr0uC4pHsFpud0mNWcwTrPUJKGXA0zOIkirO02OMqhkdkE38Q8Gi7zCgdmn
	aV7qzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc587tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47693206d3bso71894671cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256630; x=1746861430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
        b=UgNIhYAXeDIVAJpPoQDl1To7r0eH3zl07LCCbVdN7ij7/78bEJ7LEmIfuKBOcXn8or
         RuvrU5g6eT97RSnPZnOGZdEgtpo9wDTcIUPmIR8MCpLFnY2Gep6a3cWrNfIvqZeKCld/
         huJqQE2DLoogL4z36vXx56SUDEXfOE7r7CRp2YTG1K6LlV7HxAN7nZHj+BQOtZ6HeNv4
         4NFtldF5aa2faX68lb/CSzXB2iamerMsnaQdDBJMk/4ZKB8O3G16xyZ9hMauObXMbVKn
         q4LOIjDXGQ5c4XwAehNMdtGkn/YELRY1z/KdGlA5TGlmKvhOozAxugf02fQN53kJ84YC
         XOxA==
X-Gm-Message-State: AOJu0Yzp6AC+8vgPGjQibOeSzfV+p+Q/aJ9wpezLlYV+GuCD0bxeDSnb
	CCsEiq3E1BYdC93FVSjnScDFWosyEP5JJzu7yna79L/eGoQryuA6XxN9BSrw9l0iHj+Z+B7tANC
	xS6XMLJH5Yor2QhYeNB8Te4NO2rg6elmTN/HRAL9Q8xdFVfbQvXf6RqByouJzbY7V
X-Gm-Gg: ASbGncu/hqWr10ma6HZqmLTOlzikaAd6FNHaLnsAryhboviJ4fagjtDI7QiFYe7fOKi
	sSTG1l8WyfdhRXV2x5dFEKeZ4Eo70StJ0lMwKZVIOQYfvPKjlPHowkIr4gN2mzxwgGhB2AI55Vw
	YBqYDl7XbGrMCUKqs2T7xVhsPPFdjikKDbudeNFC08SFxxoB17Yh+BtT8lX1AtMkpDiwWD+lJzv
	vnZ3Rl5uuH5k4st7bWwWW5XAMVPN5eR9iAcyjLp646bPRpBshvBjDqEUizOCHAPEdr4UF8R2Dxm
	gKoOQF+6394fA7eGvyw22rJ9e3yjrSaCMb5F+c034cM2GU56EjVbk+JQ3Xu/gVgWDf1C6wraDtk
	IIBBvdNIrgchAgUV+J/NiSH2q
X-Received: by 2002:a05:622a:1b21:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-48e00f621cdmr1472241cf.34.1746256629812;
        Sat, 03 May 2025 00:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm0jFYRk4k9eoPqumXYa2PPwJCKZO+0EXUpA1YyKCnSe4V9HXyQYhK9M9D3KaH0j278whFHA==
X-Received: by 2002:a05:622a:1b21:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-48e00f621cdmr1471971cf.34.1746256629495;
        Sat, 03 May 2025 00:17:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:01 +0300
Subject: [PATCH v2 02/11] drm/msm: move helper calls to msm_kms.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-2-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtYTbd5OzodcUJUnhRC27sbJGt58qYgYGzq
 PktPPGoqoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1WTaCACkFesjPuDPmfjrkI3mXxI7MJlsZxMTfbupVgyVn8kuECSUdTvpyb2lvKN0QMPPqaQTGMI
 tYW8W+qJLW900BgRbT6SAxk8uzwHKoGgpygtcxF1zFzPLk8cmdBm9PTZOIqY+iRESHItwlJdc65
 06Pjaj64nLPcgspOxq/5Yy1kRBoq8P5x0fqA1VctfLyCpPTlFCDiuXGr2+LlsX0JJxQVW88FTP1
 jhcsCdBYXgpn7+SXLT4C2S8s4WA8nQujmklB+iMx/TllElINZEKtFXQfcNrgb+YflWqBe9gURn6
 Y0Eu9ReRVjJgW+0VJpej2ThHEp2O+oloMspMttM4k+lbcMYc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bfFddMt0AgtcvlwXUxS9LWGKIna4leVp
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6815c2f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bfFddMt0AgtcvlwXUxS9LWGKIna4leVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX3r783oVStPYD
 paffbSxXl6XkihkhEx8gLH2ebgbtHRiS+qthqfzior8SvhEPdZEaH4wyO3h3k5be70g7cy4/4G0
 5wLtmy3qyaoDFIFoMK/zwfd1cGP0AGMVrGDIPkrYUiJKx7RIvQG0wSe77ne/hK38H1vBvVJEeNm
 ZFBkhHQ5Dx3QWbjgOTv6hwrea8dzQ/DlEmD8s/tLLaVMfiMpc0mCZV/+ERs7KpsMsJa+RJPbswA
 YXIww3uCQ3zM9mfojHj5Wk31K+0KHe30+kz8raxVn6Lrl0h+hTN28o7zs+FO30v8GhKT6x4DEj6
 gqnZVjv5j1Nj3+vzs9By2tFf4qwttJS6WRSnSXq7rdTp8ai2GUK4GnCCognBaEojS903ehvz9nl
 05EQ7/sqKWzz46zrEJz8GXKEAl9eW9hy2wMAt8SyQpL3rl0n4Uhb+4PUtEK5OS353Ga6KT40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

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


