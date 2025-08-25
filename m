Return-Path: <linux-arm-msm+bounces-70716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6AB3439E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C25A1893F7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B748308F3D;
	Mon, 25 Aug 2025 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxc+lxbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BF308F35
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131581; cv=none; b=IBzuTCy7kL6/doRPnpaNWNCUW0up0+75th4M/0g7AOc3vbCvySz55Ssky9jyD3oz525yKEW19sXNry/bBsKAc5YIynWsiSXnXrLFNvQpD8OP07H7o/KP6qD5tCu99LP3doZTH79/zJDVb8Gh3G76ABan6LcL54O2IWogr+LFsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131581; c=relaxed/simple;
	bh=zw5evHx5jV2eA3M1QS3eDkuzJEFyEuoNzT6jZZy7sXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JY13EbMO34tGnIWSzHBahysd/4PorP5eboUMEFm2BZKN0LNjFwOZgwJ4wJWbbPsl3izhkDVhn5uk5f/oc+gfr3DBj+AcC4+f1/rj8A9lIVMJAk82GOMOhjhWkmVTDaKItKrtsjvOuHK5zRV3Hg3XdeWCZ8DfM/MKV8EHwB3hqD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxc+lxbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8EBWb014346
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MDHF6EGijp0sPM6TWeUG/trV7o7p3CC/iRMxM6EfKQ=; b=jxc+lxbvGnnOiVpl
	HuYN4LgAYuKfAFeT2G8/S7hQI+3ySUvYBUywsrpgqNQk5AIpHG4DwChjM+xZ9FMI
	Fc5yGkuWw0ibwF8gkI6o2OPwF90g4/yLzhjtYp3JrqEVjRktKeiiexckCBhWJuC2
	7j5QtzqV7wM2ft19XhFn9OP1aMPHOppT+/rsNT/xhPC3GsN1ueT0/uPtTzaGMS6L
	TqBE79H5avrKjOG/3PSmoc/oO4MVEaPAIfNmtO4GHFckxh4YfG7hah/ogywGlusm
	4rnEtruKhdNQwpcq+zqVaJLQoXjEPwfmhDCmOla6RwTK2IPrBGcB2Tv/r2nOBZda
	kyNn9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771e43782aaso914286b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131576; x=1756736376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MDHF6EGijp0sPM6TWeUG/trV7o7p3CC/iRMxM6EfKQ=;
        b=UPyGoBA3Dv/HcJWaVY0uBQ5DnH5YbsrFDBx1DkXdUyMUnC9tykA8t+T1gZK3QlXzqK
         pvlWPUq8QI5LH4E1q+1at40PsJLieC9HtDYuGtaRUS5MuvlYvNc8jPNlJkmApZkTipGP
         uxlD3sg1MTDrX2NU6YQ/iPlOw7mZPDdBAVlCz2ZdIdzG7UQT6JEa9ORnW+uW3HupVWP2
         3zxNYy8o9BSHSo0grbMIDNxTyEtLOiFIQfpmmVOM06p9GSgURmxkzWto0G3xU3iGNg+/
         eZLL4+VY4Zhk9w0nfkLO/WnMJSIvhTQOEm8Jnti6PXmCH6KryrqhSjezoEWKwzEaclBF
         gdnA==
X-Gm-Message-State: AOJu0YwFTv8tYsYVrat8Cnx6O3PijNiUnbZoEM099Vyq6A2blkpwJjBf
	DH2D+l24QWNthROCNDhUlN2SepaeQZH0MTJZpZ4zWuPhTRGlOdSEDiUFII7W4mWBBDA4rqnjdul
	ZFEztm+Zqe3kN2YwMtq41fYyOAl+keRJDkufuPAGJrbcNlmNRfWmaxcs8oPlMjjsoyq8Z
X-Gm-Gg: ASbGncvNu2C9MlUojMftGDL7mVPmU37DqLXQtb23G4vRh8Wml3Dq0DKZnHYCgJGgo57
	uJD/W92sNmFUocNwYZjYswetZ3CMIL7f4ZN8ENpCZm6AS4TEtjG3tD3iJStkJ9TUNaCzMYuXOdm
	1T4I5HnLPK8kvOD21q2HdDCbziZ387Y5AaW6TqgeX8IZCULw3p0F9BY53qWC/PFSkCQjkaYlbJ/
	CPZMpI0QSMz+qBas0gCy1HxSAwYxjhW7nqLb3h/qM2nCZIHmo/T6AhtiES5vwGyLOp2fJWtZTPt
	9ejckw0Xfmy4XNQCcg/IeUArYvrxu9I2tUERgUT72K2YDKA+qeF7v17c04yyM75g/XXXCLQ=
X-Received: by 2002:a05:6a00:2e21:b0:771:e8fd:a817 with SMTP id d2e1a72fcca58-771e8fdabcamr3409685b3a.14.1756131575802;
        Mon, 25 Aug 2025 07:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpW6CmWEIQgWCszUSOnMtZ7sW9kbTpGqPkyb0wn89KFA51RGSTymdfLHBWqN+kzflAOfyMuQ==
X-Received: by 2002:a05:6a00:2e21:b0:771:e8fd:a817 with SMTP id d2e1a72fcca58-771e8fdabcamr3409634b3a.14.1756131575307;
        Mon, 25 Aug 2025 07:19:35 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:21 +0800
Subject: [PATCH v3 35/38] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-35-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=3071;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=C+Go3XquSNn2zh7+j/6tFb34Ivx9VwVNL72WyLqa7OU=;
 b=KljTiOHp3LZXWwkE/6kAiOgOMb9Onx0q0Af2bhmvZWyXdDphfqZwhDjqZYm+TTue559zko5yk
 sKwWYioTEaGD9BKLV3lHWGAw6mqDpoURTwpiWHwagrS1kbtn33gUvfV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX4+cIjMYwovih
 /6rXXwo3eu42o5LhpqpWUtA4ZZd7GaIpk5NCcQmWVGDCjV6/hLKRWJV4+5zYWqd9kzc0G6hpXao
 9vt67tpPIgxvzV3Rrct2GsWkiwWD/FQhAHC2sbr4Ai0gpLP5lbdsLfOMD9Ygw0XPX/mzICj6Z9y
 aIjfVaU/hZ+OdbEbBPz5yk95Bl2FZ8l8qUw3ReV+i1x2JJhxGkM4jITWAF36kNR7KYCeGP8Mfk8
 NPqcZLcKniEMfz1xhPgtXzii8XQ7avzH78kgmFe30sDiGIulEg0M81OFqM0cWhXPAb3gPTFczv9
 n01R18jCCbgwlngDMmh2XthG/quUAbqEV/m6XUbJsVsn1nzBVbKFmutV5yK2apar6QnTuQrRG4n
 9pim7Qfo
X-Proofpoint-ORIG-GUID: iA2rWW00fihMZlILD9EWunmZ40FAVuU1
X-Proofpoint-GUID: iA2rWW00fihMZlILD9EWunmZ40FAVuU1
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70f8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=AOHtyAuHbwWPpPzu3RYA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
 drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0b9d9207f4f69e0d0725ff265c624828b5816a8b..4036d3445946930e635401109ac4720ed2282c2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -681,6 +681,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
 
 		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->kms->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
 				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 909c84a5c97f56138d0d62c5d856d2fd18d36b8c..897ef653b3cea08904bb3595e8ac10fd7fcf811f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1586,6 +1586,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+inline int msm_dp_mst_register(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_init(msm_dp_display, dp->max_stream, dp->aux);
+}
+
 void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3e64ec7b7dbe1d1107e85def9aa80277131f40bf..c46c88cf06598df996a17c23631570fda078b371 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -365,6 +365,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -392,6 +393,11 @@ static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct d
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.34.1


