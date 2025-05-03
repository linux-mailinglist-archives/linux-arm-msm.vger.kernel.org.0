Return-Path: <linux-arm-msm+bounces-56631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8DAA7F29
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2411E9A4430
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94AB1B4254;
	Sat,  3 May 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPD1/afz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AAD18DF80
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256636; cv=none; b=RE75mlzoYvetg+vZu0AgMgYMyZqBDy+rULC7PwcxtAXy3H/lNzUe4a6BcwAyhdABwtNktbrkAmWQCDExLQnVGXLuZrbgm/m3rqtGSkRCGW/PfEzF8zqhXZH3WMiKx5e/Im1CmtipOPtAOb9JZpib15qTYo6V4roIWkILMIWMLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256636; c=relaxed/simple;
	bh=x7cM2Rqp4n6JjfWiK8DuKNRjLhu0g1Po0+oqCeMtWC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uap1YoyNWZq3RunsTOlLkzIjy3Qd08IO7rulP9z96HixgwRKtmOr41VknrUkR0jHceQoNZl+XDEQZUSxDip5BmakcxmElWzKASpTu4eP4ICq8EtiUjuwviV+4v9+ttYW5hZcRAyWO0p4vSLt0SyOutrKOqJsyjHZE52Tgk4HSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPD1/afz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433bn9i007314
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xqg908SIWMwTmLhHkCP5zPeST6KmZTagNBLZ1+txW/k=; b=TPD1/afz/z7kAcLI
	8a0wVa0c9dfu9j3G+2j24xRHWcerpI2FquUGWjX1RzC2Ka2USnl45NHjbawTOsCY
	9njjjZ76FRKIGWaGbPCVKJ607+TnvO3u7jbwuZ+G5vwL3AAGmtSlh4Xp/p/LLlcJ
	K23g2IQ/+y6IRzUH+67+RX10OdSMZfkNgM7R4An3BSiRRipQ/zVmkb9WV7VO8aSm
	SqQM2CiC896g7EDxP6LPZjxRHWVfbg2RPADlAVcC8JafqmtRxqnZcV0EJULsYiIF
	0ymbVaSrPdbPOtc2T+6U6vTlf9TqQX4Sx3wqqdyXkolnlnMyCvX2mxwKpde3ntII
	GVSFoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rrau1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c9abdbd3so274540785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256633; x=1746861433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqg908SIWMwTmLhHkCP5zPeST6KmZTagNBLZ1+txW/k=;
        b=TGDi+qc/ksisYd+rQrf+FpFv5nEdAwGHxLlzX5YfEGjR1v29UZc4p7vYGPbeMIN9Lo
         Ba5JPmTB4kLbyCvMRigUno74hDDdmC9jOsp3d9k6ddSY1YplPVO0YQjhAfQ4p3NAB/ej
         zqv8m8IieJM0Aw8J0CAswMVrRDxPwngP8vvLa4EDK+9xh9MJahN5qXIslx/oBkIqdvmB
         Szc2Sm/2JvWXRCN4T/JUqHlp59yHy1CeoUTlz4R5B3PrAfG9kpxYcFs6v7+ExiLKURy2
         rO0EFcvqK2poIdM+vyQ8MzUnwsdue/24og2hOs/fH+UL6kLUIl6LDmweq0WSfSVWDd+j
         vzkA==
X-Gm-Message-State: AOJu0YyVgQ+e5lht4S+BwDrnLubK26YHZpKhKdXaG7oYH/zWzjmzGvfA
	CsqJHW50N9SOMl4vx0YemPrMNEztmERpndh+hBaaJ1SUmj4XaUu6V88zOcbgfrZWmtqxW0En24s
	Smtd0+3Mn4b1qiff1btgea9wW6nNnjljogh7i+pgNZRz92X8KSoi5/jVL1aRSB3yj
X-Gm-Gg: ASbGnctZA5yZwjWWEmmUszRLTssG9l/IfSoI45iOR1JO/MbwcRAtOP9qIDCAR1PfjkJ
	amGWuZTZr7egAcGwWJM2HGezmRO04cGTx2dVLkkRUr0c6/EuReeiN4kCRM8UpmBBmIoMmI6hlMj
	Wx4kS8V4E9WhqgLV86Yja9H36O1zt1cwYkktRoI5tcKGkD6FoyH4psYSNaDuSZcp7O37UyIrJPE
	1QY2DvAyOS6R8Wp79xTNE1QY+08JOCf/kpDCrkWRrWHF+DsQ5jGGAQNvF+i1wDy+SVaIPxEHDEy
	wW2XwvhocO22tMXknwvbj8mf/XkbEBs/yyaTeEOxfbKyskrUQjHUJfzNa8sIHQuEr+OgTBx2jrt
	2tyG/EQ2f5ABhcLm8h/9t2niz
X-Received: by 2002:a05:620a:244e:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cae3ab122dmr23768885a.25.1746256632986;
        Sat, 03 May 2025 00:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECXGB0CIIu2ecyT7u8vAg1eMWNirPhcQIEsdIkfsQk1htP9MauQoWor1Y/MMWU2yvQYWnINQ==
X-Received: by 2002:a05:620a:244e:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cae3ab122dmr23766285a.25.1746256632659;
        Sat, 03 May 2025 00:17:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:03 +0300
Subject: [PATCH v2 04/11] drm/msm: get rid of msm_drm_private::num_crtcs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-4-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x7cM2Rqp4n6JjfWiK8DuKNRjLhu0g1Po0+oqCeMtWC4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtsFdPNQ6IzgKP6qzeOKCEUKP02mF14ahhK
 ziLZswcrGqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1VhdB/9Z1IZhwrnbkT3rTR6XRW8OhCkiZ/IgYH9M+tii1GEjLj+lS20+G51k89ahrVECY351rb1
 WF8KubJolcytW8ClZk0X9pLNGR6P1fPlujsUC5Av8oT+nUqbp1srnY3vQQ5+RrQn6AHV8ZaAVy9
 ZrLF2rBQLEoLe5FDGHNL3Rmf9/WH+brZIB8y9bynoSnDss6/7kEC4VYHcVZ0UdeqcgbF0MgccI9
 AT+wXdkrVduzswBnROLVxCgRhvpPA7YlQKimT7RvEvrx9mo3sMU8RE7XprGmTKJ1Fad2UJusqkH
 1bJhIbuZrREqLUepMGTb8SSirEzQAU866zsZ5nJfvH5GMDf/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4FoddPo5Y1rI8rFQtOZ3sSF0dW0PORvu
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6815c2fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=F-HcN3iq_yGV61sY1bgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4FoddPo5Y1rI8rFQtOZ3sSF0dW0PORvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX1ribEfQ6lt69
 Gx5XAptLLDDrs6WmZ0+COxMwgJ1Aw/1MJR1V1Y+cGvK3l9x8gh0c8v3P03ze6xbg43dLlCLkKHE
 XRYkkb1I3BSq/eE1YMeMoo+u48PDM73asYDW5jURzr0t1WSSBuU0uWlEBovjfd50drN6EAcPoe1
 4knflN1jktgm0Bx3EZfqqChXdtZ7YgGUKyvZJJkG/IMBXpW0/ZCVExGb4WuMmljgJuA6pMCuxvr
 1fU5va+Ng5ZIrlCpgZ0DYMptY/FB4EJRMYv+P8EVHax9uBjVv20CK8nNVR3wqsV/W2LP250uhvT
 RF/zi48WTn4oN+Ef3plW8rAb3zHuunIGBTTfFAbpLFX7k6MkWlOJPa/aW/DRSID/0RVzxk6xNf8
 X+lPUt096+IBryF7HiasNf877vwgHe+3mX2LmlHu/Dv8E5+yQOrAqMkCtByxQLdS/sxvlptY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

Drop superfluous msm_drm_private::num_crtcs in favour of using
drm_mode_config::num_crtc or MAX_CRCS as appropriate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 +---
 drivers/gpu/drm/msm/msm_drv.h            | 2 --
 drivers/gpu/drm/msm/msm_kms.c            | 4 ++--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..4b95fbbda8e120c1eb86a23e5397db30145d505a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -874,12 +874,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 00920bd44f6f73099ff2c293473e427caa49b873..99ca1d6c54b2c24cde39de44bb55151576dbe188 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -296,7 +296,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 static int modeset_init(struct mdp4_kms *mdp4_kms)
 {
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int i, ret;
@@ -346,8 +345,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(crtc);
 			goto fail;
 		}
-
-		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3fcca7a3d82e7aaa74379b19763c22eb43c953dd..5a706be17e2e5af2148366eacdddb378b2f69dbd 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -374,7 +374,6 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
@@ -442,7 +441,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->num_crtcs++;
 	}
 
 	/*
@@ -450,7 +448,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * crtcs for the encoders
 	 */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index cc603bd4729e909e9381a3c277db262b13361de6..09d5f57e9343cce404d4f8a3a6d8a285f662f60f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -177,8 +177,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	unsigned int num_crtcs;
-
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
 	/* VRAM carveout, used when no IOMMU: */
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 49a56873100b2fdcded3eb6adcc7032bf404212c..9dfe0fb4755ddd11277f524234297ccd5ea96001 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -245,7 +245,7 @@ void msm_drm_kms_uninit(struct device *dev)
 	flush_workqueue(kms->wq);
 
 	/* clean up event worker threads */
-	for (i = 0; i < priv->num_crtcs; i++) {
+	for (i = 0; i < MAX_CRTCS; i++) {
 		if (priv->event_thread[i].worker)
 			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
@@ -313,7 +313,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		sched_set_fifo(ev_thread->worker->task);
 	}
 
-	ret = drm_vblank_init(ddev, priv->num_crtcs);
+	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
 		goto err_msm_uninit;

-- 
2.39.5


