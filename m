Return-Path: <linux-arm-msm+bounces-56630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8FAA7F28
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119E49A389E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC71B0434;
	Sat,  3 May 2025 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iRs2dOwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08C1AD403
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256635; cv=none; b=RfIxKw/ibdLK2MsanKzrT3xyJHKZMtk5eu+2+UzjMjzZ0Lgj8Zp/jK1YhXS/+rxEobpoDwxyoxMsDokEYEX7N+OLKsr8tKqvMkBaGlQ0Mmg4znOw97TgittuSrTSgZGrCCSFB8pvy4xqnpFfGz46E/G4Gq1dWect5od/ovxSp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256635; c=relaxed/simple;
	bh=npSuxvWMmhzKLh8mAO06E84f1kOeMHWURDV7gpjmnuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U641kjfMRbOQwC0b3IXkbcJcOPVD0kx3FvMWYFOWpjhsqGw/gRkPxN9a93eaSuVMA4zPwpPLlLqVUUliPfoLGrCubbLjVy6Guax9SLGrvI0kZbhNikRvkWM9KE25dBUQfilVIrNxp6CqjMam4lLaSwGPcvOhlgkcWfQ86eI0Qtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iRs2dOwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434uwUR022090
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=; b=iRs2dOwMq5IQqXmF
	KjALF2RGDnzu0JmOj2OA5fsPDQjdmzzlF1Q3cGTH5e9icMWt0Muq2htKsbpxKmCp
	k4/HYa+BZg0X9Amp7Uc2oWOcOUnhXcNfnGEhxjxEdNjOZ7og47o4byRINAgVFTCz
	iXMyuglhw03Je6IGvBwhZ9+3NpKmcpW20QjE0GHLbdTsWFP4yQ6uqSt6KAqayeFp
	pqtIUe2gM1y+F6p3s2HqYXNQvjAAiuH159ShXLV5Uik2HPCFb+/0yQk9qVYZtrtG
	iK2LmG9LYjSxKxDWcS93MaZMuEhoi6gzG05T7n+lb8hwNsFVvSXie/BBc7ynSXbi
	Wx443A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rraty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so329872885a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256631; x=1746861431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=;
        b=oCmsH+mnBYI/snNgCWzAOi1Dj5f/gb9wCbyGE6gfWXa9GaCV0RMqcip15+61yjUYLj
         GjAie1lgOoplLeOT3vs0JXVf+8G2PqQAHo1Y8dDZMw0QmXnDF0o3OuGx72d32X5cl8Ka
         2/B+SDk0UBkJvnPe/W16EVrwfxgZ7RuC/X7cuWiJpT+G4qRhZZMcJ17VEdwA9OXxH7/z
         bFCdd+GmhI827BRFcMCRWtYvPXE9rdVP6uJLhTuLzir5bTO/UXW6zVgX7me+jxodQRB6
         qvgCjkGjjWtrPRVGQAYv/12aaTqBOgtNUtYBj5A0Pg/yVUGnb1I9P2aPENSSnhFgtKfj
         NG0A==
X-Gm-Message-State: AOJu0Yx8JCBcJZzNx9kaC1eG/576AUAzY8uuUlCg20pVSKrObPk8mUoa
	na9GXcAYb3z9qDmmOD1W1mDXuYyPQR9/Y8Cl4vTL+k3nG4R9vjbDsfADVdWF7kUoDGq8tijESRV
	ovghYHw+EkHz4tGts8QqXE08Faex4mrDKKiCVn5TpaYZeZGPqU3RtpOTRceMypKZcLIPwmuHQnX
	Q=
X-Gm-Gg: ASbGnctgD5FkzNAYhT23PHD4nZmuSS2it+yd1kBVzyhfJWZLDnRWUYw6Q1MSkLEQuhG
	p8yQJ0Qr6vmquoiraCQP56BMnlaNwyOwMb9DyF8Dq/Eitn/g6pa3wpTLm11AhNY6mwz2fUtnaSV
	9dQhpTDqS/rdtGtyBBqHRpr7ALlGuSkbc9AfwwXxo/g6bWVtxCuvFanh/Q6pFo6QCnFYVetjU0y
	3zR1thNgJum9Hq1l1NZ+HrUilwDV+Pe4TkP9usTX1ZdvFfUqy+7ygDqB0hsv8L95AJpEejYU1CO
	G7Bn4Nt1nP7qRHfmRuybhH+IRAD+8jgp7kII7jgmzjuUWJJ22HLnyRowG8tCOJ7KlTcRx/DNeBJ
	DnaDA9q7mmt71weplXtCLZPXO
X-Received: by 2002:a05:620a:f05:b0:7c5:4b91:6a44 with SMTP id af79cd13be357-7cae3a99ff9mr20444885a.19.1746256631331;
        Sat, 03 May 2025 00:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO8pkqYTjfx0aYWe9ZJaRvk9TWmCpxmnFrPc/lMoywrhWLT1B4JmwtyoYh9Yf3IJ2pBAI5QQ==
X-Received: by 2002:a05:620a:f05:b0:7c5:4b91:6a44 with SMTP id af79cd13be357-7cae3a99ff9mr20441985a.19.1746256630977;
        Sat, 03 May 2025 00:17:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:02 +0300
Subject: [PATCH v2 03/11] drm/msm/mdp4: get rid of mdp4_crtc.id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-3-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=npSuxvWMmhzKLh8mAO06E84f1kOeMHWURDV7gpjmnuQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtto2vqAsBNHAxZIqy1DBh8+q2si90ocVxb
 arA9opd+w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1R7OB/0W4E9JqKrkJs0hOC+CF5VnWoPE7MsErFPX5GI8LFHKdd88bcdMGp3fSWR+w5uWuNNUylw
 og+IFhEVLrHyTTn71oQnTOPWyvpdDS9McnBONDrBUrYTDep81AiMhEaUTpDBPoqG0JSfc8Ee3jQ
 p5gWy8MQRBtFUlD6/2fHor6yTRio+Av/4GFNLY7/lWIrtzJrEMOrPjU0us5tTdfM5QXgnn4HUcs
 5hnpD3Y+TZjO3a5UzorXPcsvnmip//CcuZNqHSNgD5FiUXMnsaDmzIJYp7OHCdxd0KnYihnTCMR
 E53tLbVTUm6fLnHNI+Vx7oRq8K5co5FK2uSdBfolUU8aM1ND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HgS2Aev5pU9UjKaPCQAqesD1C0Qf87v0
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6815c2f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JeS6effYNUkig2QXyjUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HgS2Aev5pU9UjKaPCQAqesD1C0Qf87v0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfXx/2JpCOnHAJR
 mx1+Ad2tA9oTv8+kyP3biU6zGSZBGH4sUIY/hVhg7JZMw1XSgjhCBSCtuRG6I8kQC3bmKnGphiR
 KIM+z/SpB53IOxxMoAZY9hq1d6BW8ck6Bejv3zMVFNUR4dIPPEulzTk38tVymoHT7j6l3UIAXli
 MJbHMZ6lIFQDZUl/xhl3Qkb7gvw1BcfGvZqK/PedUUttTjOBLkc3qSvpbfS2lndRzuKMv/YHHal
 O5Hlv0vWZA84nbH4kztGvJK8h8I0J1hGENmolZnaibmFvQnkAtW5vJcyH1X2/A9cFEaT/ofxVe3
 8ZEMyiE5GHV/9oe7auDTL01qtg7axcMaXXrDlOoqMU3EPGdHvpTzH0cwzlEH/89o6FpTsgQCeay
 IPrS6aUqZeAK26qlPMLpMJ3z3LebuspcW0Zsbi30PSkglezCOYyPksUlLfOAlANMEcD88Sw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=968
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

There is no reason to store CRTC id, it's a part of the drm_crtc. Drop
this member and use drm_crtc.name for the warning message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 5e1e62256c382426f70d21a5312fb40dda68d695..7596b45e234bdcf1b7cf37c4a8d39862f48819a8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -17,7 +17,6 @@
 struct mdp4_crtc {
 	struct drm_crtc base;
 	char name[8];
-	int id;
 	int ovlp;
 	enum mdp4_dma dma;
 	bool enabled;
@@ -539,7 +538,7 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
 	if (ret <= 0)
-		dev_warn(dev->dev, "vblank time out, crtc=%d\n", mdp4_crtc->id);
+		dev_warn(dev->dev, "vblank time out, crtc=%s\n", mdp4_crtc->base.name);
 
 	mdp4_crtc->flushed_mask = 0;
 
@@ -624,7 +623,7 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id)
 {
 	struct drm_crtc *crtc = NULL;
@@ -639,8 +638,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	crtc = &mdp4_crtc->base;
 
-	mdp4_crtc->id = id;
-
 	mdp4_crtc->ovlp = ovlp_id;
 	mdp4_crtc->dma = dma_id;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7e942c1337b3597d557abd3e2e418c3958e5eb3f..00920bd44f6f73099ff2c293473e427caa49b873 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -338,7 +338,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		crtc  = mdp4_crtc_init(dev, plane, priv->num_crtcs, i,
+		crtc  = mdp4_crtc_init(dev, plane, i,
 				mdp4_crtcs[i]);
 		if (IS_ERR(crtc)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc for %s\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index f9d988076337cb6fb63af8e76be59b2eb34ab327..fb348583dc84de5c57c77fdf246894e9334af514 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -185,7 +185,7 @@ void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
 
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);

-- 
2.39.5


