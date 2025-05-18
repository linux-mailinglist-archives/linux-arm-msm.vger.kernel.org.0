Return-Path: <linux-arm-msm+bounces-58326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89331ABAF93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E1F7A7CFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0C121B9C1;
	Sun, 18 May 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyDajpKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A6218ABC
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565743; cv=none; b=Xn4XeUICq2NaN03ea+ko5Pcm10fa52k4T8MSVEx07tES3g4ZSUmKmvSHS2V6ATQkWKEOHMhlonClulAYA3IaNhsw+88U/buuxMvGBj87mzJvqvyFW1N6oIJH4kqpApF3HJ6N1zVIHuJxnM4YRQwBRQ0+qnp2JUgZ3U56+bp/Drs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565743; c=relaxed/simple;
	bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksr55iUmzNIxmrQjTxRi2H/2wUwac489I/ZsEMiNkt1diQolxwStYMysvCtcFmFTb1V8GNGbV1juDDN8Ig9+U48lwmOT7OnqrEeIXm077X6QSs9t58DozBYxoTB9vsxTFZfAQcVEqRgWpk3JY3HJDoYukumm8Cb1bthKgwKZw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyDajpKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAB56T025360
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=LyDajpKgC2KGmovE
	vD7CLfxSD7e8whb0GX0P0hzQu/8Es0WBZLLBXLJBiPExzrBXmIeRpZ9X2f9c9Xen
	h0N9gyFAdSAVd1XQ/y5jGVyJpcwpx03F0TY78ah5X7hpvVW6+6EdECqu4/jWyRqC
	GWAC7ByQsojnNep9EWlG55tQXT5MR3F1KzS7ds39eSsqtfVtbqautVWFp6tdYq3X
	0OUkkJ1uensk/+H67jRTrbz1u/JyHtIzZeYnrXqfyrvOyZARxoIJ0xDreIKuPUWe
	vdPmTZH2nTt5wxOtGf3xJHLPZi7X07LwdgaCrDHpygANF2YTv/pbGczhRNH7R4j5
	jbKvig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1tvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so28464996d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565739; x=1748170539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
        b=tSldz7Oi4DkkzBuNJie2b85DuZp6D+Py17y7vS/MBCJL5YRY0BGA2ZBvFa6/e5yPwv
         bxGRpTJrK1LPXvO9ZXH1kA9n+x2B1RPNnYzgyLSsEQltV/2P037IHw0GDtEsyVRLcrFC
         4OTKdxg1IKgijhMHVV19U/WX6/NynG94Xen8YhFEVbRMuaGZY6ErgpX/xGpqi90fneTW
         YChi4LdF4kghjXnVUJj5kz1YKH5mimTwSL0rE/5GEAYaJPsItYHlWNA+8O2idA2Xqwzj
         rvAAdqHFA6htehMTMwsz1bEBFnDmRgez/yJxldiTa6DMuw0VHSKVzd8xYPN/eTvyirwG
         ecyQ==
X-Gm-Message-State: AOJu0YzXBAU/GaV6tUuqBPynyF8Wkn7FWIE7gtNTfLhPJBVOKlnkBKYg
	JHpg76AzxJnL14XIan7H8zBiKU3gxWAaY64/DNgh9L6Z+ttD/0grJS80J2FK3rNjOHUnfo6l3IV
	/Lm8SqtP+/Y8WjJoCxvX4Ou86pHHvvKawCyrUzTPv4JHatv5VSN4MV80e2i2nTiNgyZAP
X-Gm-Gg: ASbGnctjWMSRqxKM1bxxIqxmy9f+8ZJAGUFHABX5RmId6gxhbjYLxeb7W5zEfR30SOH
	wcTs1PXllb5KgXXPFNPvUrlRN9TX/kLQ6XEKYpuNZQipzdsHlSLUp4Rd/499MkipW8KWUDkhfp0
	Kme21fN7GVnXzkDS8nx0M0QAZ8sTTGyH80/aHWwe8VM60stT6nY+GLQfw18D8NEQZot8NUlcbrS
	3B/LtOXX9FpzuI8Eb91RqTrWwDrCNoz8uhiVoB4A/q7yKf/4KwE2WmdSJ3rLOUErXGYo25IgAcZ
	i/+ckgOCJ6GYv3dRCSN7ENdIqSz5Yuvz8alaXGE1Wqh8HCOxtXGrq7uASCLxVxXjo04BWaaSk5b
	iXGdUi1qOsSnuCiSgZ06vV3C4
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr94273716d6.5.1747565739710;
        Sun, 18 May 2025 03:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1sFBZ0jpOcZcVNQk92qKH1hJy1f0oX5GkS+yyQeLR6D/tyQ+iWs0QRbfpQspVibue1vU6kw==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr94273536d6.5.1747565739402;
        Sun, 18 May 2025 03:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:25 +0300
Subject: [PATCH v3 07/11] drm/msm: bail out late_init_minor() if it is not
 a GPU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-7-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyaqbU3hdPDIhnaYG5VTR+PRu1+nwwWz4ZU+
 2SgY3BT/7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1YjZB/wNZChpdTIpEJDDI5eGygeNTAmk9GYiIm3LbhSUdeXnfVFWyY0oiedFTFaGYtFU9So+yFw
 J0Ln9HLeBPSUgM4L7/c70Ly11D5Lb5uL0KOaXYgCrOpx1aDEaiselsy8C/gfSFujH6JKBFy7t7p
 S2a9n0gVcgka4S48jKzL214ip8nDJUtKDsnexIq6auUbfcSBbX0pZZHaPVqCYfEjVzWqwovVMey
 KAeqVtA8uiDJ+fNPematZ+ZEkYr/khR0KH4vD3cJmNh9nsILgXXOqxrgVVsMMQr/lKbjB4ShE8G
 kF0EYI/5S8T1I1C8LDKjsq+MNnXAFBhmMw6wEyz8gzpLkzpP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: U7TqmjOxs9j56Z5RvhebgRTBnza5XT-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX1PuZVjrmntEq
 Gzm3FYM/O0izJps45cOGtQqk2rmkas64j9KfrfSKUT54BJzoAlp22OwUNjMIovn38iOpR2PGjwh
 8zRXTCtURGPlJHwm9hhh80+rC9XqJOGW3ZPGw660bJd3QO93gkY91yZrvCQzJluNmYVibEj89bp
 zCGzmqt8647EDRnE9SHjKVUaveBMaDLmlfcJL/rUtuEpLiUTJpRaY60EdCCRUs+U9SY56hGZxMw
 IvVTiNZmRGJZjJxNlTS3smh6ujO4bWE/B1wBI/Qio12xLUAfwT79eSTplYgs5/wS1Z168jCULqp
 AR/8/upC9koKFpwdMfvRMa90C7UqvO/XEos4u9B1+A75DhVXsabwcnw89k462FDJVYqE2jHdG+6
 VnzOFTk/KcmCEDjspPSYFMad6o8HEjMs9N+rZQ5fs1UOCwmSZ1AIvh5gSmFF5Dzl7USPw9CH
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829bcad cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: U7TqmjOxs9j56Z5RvhebgRTBnza5XT-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

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


