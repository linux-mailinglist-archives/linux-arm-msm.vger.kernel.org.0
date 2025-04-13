Return-Path: <linux-arm-msm+bounces-54127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57994A87291
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 18:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB2083A9E6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 16:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2E11E9B04;
	Sun, 13 Apr 2025 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNFxRR1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E61E2838
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561990; cv=none; b=hrKlT4N39KZEHKCS0sAm1dEjKrBbxNts0tja+VMtZu85biLxSNv7v0N1V8FVbjFmj+44r2hRneiv2KKeY95Stho4Z8VeNNTnJ9VHhGdQ/Iq+T3sgllzUuENum8WSSWSHRx66LqdcMKlio//rNDuzCAONK+7kwNWEbS5b/GsTgYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561990; c=relaxed/simple;
	bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVpNPp/Tn1BI0zCvLlP/kUdggEiE5FRRXXOi1j0YUaN5/wc3MxVeO65Zg2KH1XfWMlK+9g5/ddM93agNoM7W3Ruk2jWWnxzc+ETRLUlzMyL2FI4qdWD0DUTiQJVCX47h24a8kZPjTJH3tnhw+nFnbwQtXfrcsMvbzBk2YqqDzi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNFxRR1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DGBajK023741
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=mNFxRR1m3X4F/rfZ
	SzNyS/4UrnRiqZQFXlnmARW3+J7zlyctBx+auILE8jjyTVP0mAszsWi2ue5GAcUH
	T53BKEtsjA+czQUJsGBavS4uTDc/+kyvRFJsKmHvZT2nx7A0vuak56XkoeFm4HkD
	6zjpGGwZh5VqbLmI3ajBp8cBCn2nmdMvGgkmfP86W1jy8xeWfJ79g4CLu6U3IvJ4
	415CxRmDYwTFHnWrUxXILhKaCvyOv6Zc1xBPlphTk8gcf5jy+Rr32zUXJkwcpCcp
	M9Dl5kg2fC8xRQ4OFBTSpb7CBtMkAEAnyNLY+KkAH//fsNRyuDLXYPjYpMYRWNsJ
	Pr/NQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj92bv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eb1e240eddso65046386d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 09:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561987; x=1745166787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
        b=wa8Gtfr8WrxIQ7oajcUmMY0UD1YTn5buminPWX098i8O7sIRqT8MnLJt0whj1SdoPA
         bDakdWblAbku6I0HGSP4XlBnOPdKBDm/r/EuFS0Jhe8UvK/wf3xYr1Sqaqb9qrTpysOS
         +Yve2rXUfM5xgnJX0ynrYcUehNUN3jHyfUAqYabFm3PmeetxFHsSvgLx8jzY7Ixz/1Zh
         2SClInB7XtSdbX4JONCtzkENqiKUf+S8qtD1gY92Ok/vRmjULc8ejSrzBHZUzaw6VhXM
         93TmjlqD9jFtG54fi/JwVgCeyVRfGPsP01bjhHGU/jxb5U37HQkU7/yMIYh94cgB+UA8
         NVMA==
X-Gm-Message-State: AOJu0YwI7bFjWZSTmF8WhfqEp82kG710sCGTnXaH00SUPxsohsoWdLVP
	CPnChnSqQ5slNufQt7Z/3PvBfzbpDZtM577K24KRw2Ki6FIm7KUtNG+/v5Wt58s4r4ndpYV/tci
	T+PCZomKc0Vka2rYKDoLULjWQ0Wgb7S33gkiZ3CUI5V1tuDNemJ5IsXqDVVvkzZew
X-Gm-Gg: ASbGncu2P5D+GCW5N8ds0XY91N7vfWGx4GaapqQqmzLQ0M5JcPneUssiP7VQrRthHFT
	h80YOAsayRY/8QQ4PGaiO4pHwpwDS/NkpuF1VSrvepkYS09dMwLP3iaqS51/WZhC5oRJEOaObym
	vxvFN8c9ezhhIyAykzptpHmTKuBe6MjjY5dkWPA9FmcvZ86HDwMwZPxfkmFQIr7vyZ99bpu2Vj6
	WvM2inUQCtkw2d8RpQsem4ZCkPPNhgqV6uIoBnePMRGooPMUG4xE1boHGL/y+e/dgF735T6Wi+7
	70huYT7sY+vaRsK7dSS73jSRTZXPO/MGximJFR698xKqg/x4S3Y6kc8Dv0TSbW/AXerQDtks2ig
	5eQBwDLMdJmRa3Ea/saPs6ozz
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f23f1188admr152015336d6.34.1744561986925;
        Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGLodl/w6+GHQYPiMmhn35zt6NHmgJcWNBOid2Hlk9AhNDjaBExDvTcFzQwqXWWmtQcU0lIg==
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f23f1188admr152014846d6.34.1744561986403;
        Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:33:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:58 +0300
Subject: [PATCH 4/7] drm/msm: bail out late_init_minor() if it is not a GPU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-4-1132f4b616c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5I7hkNUFspsI06/XZ8R8h9Li5mG5fqSSyf
 SjGe4M9r5qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1RnMB/9pV6fJTmE9QLlRbc72gU5cp9CDKzI2cO0Ye6XCaZ/bqfpv1aTYAKtPFFa2t/1tB9tY7jK
 70eMELu1I1l95w9Hifvki8tRXsCdT5DNAY7im3qjeYvreuE8Y/WfacKOweJZ2n/pjJIEh2ubl8B
 oRuDMx6SMc08WiOJrAGnj2MmXNRleIRSLrcekS0fpJnXeYjrkRxImZOheaAWwcswwyZapf8F8T/
 kJWigmJ0yWsjDMO2ojx5o0qGf6ssP8tJTVgPTjb/goTnRIJZiZPiSaSxPP3HAR13nDz0BaDcgUi
 TTjK+Ub+RejLZ0huYFCb9ToGBqs2eGcL1lx91btlTqlMQT/g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: AKb9v6rkHmxNZas5IhHLlaASEGM2mieH
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fbe743 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: AKb9v6rkHmxNZas5IhHLlaASEGM2mieH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5


