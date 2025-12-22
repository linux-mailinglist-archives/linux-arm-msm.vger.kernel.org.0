Return-Path: <linux-arm-msm+bounces-86211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE97CD5A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B5D5302F18E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0349833A6FA;
	Mon, 22 Dec 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIWJPjhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pr6pEiGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159133A6E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399115; cv=none; b=XoPIoDYrh/M2k4YX0knYhAKqnD+HaHfP0CYApA0xBEaxk5gAyvPZrvxJb1x0gQtbIstf8sZKtmcSbINyv/v8bYtA2dk7QOhy3r57JkIObAnwhTxubL68M3TrTS9OJjGFYLLLTvHKAkDgHHAQSj2scXJfh9J9DBJ6IqAVTOhaJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399115; c=relaxed/simple;
	bh=eYqbCgFTx7pO2+x0Rgwk8N2aIIU8O+9nShTeQC9NPWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZcYXlVeTy+juaLycxAQEtWYrgqzTFHM+nc+2e8N6lexWgCd0bu4p3ET8MlzP8JL0SFvUuTCKFLGMiw76G102NlrOUSunyUw3d8nvRdhsqtFK7Us12x9Vw6tSMOaJAfFfyymvoTynvrur29S3XvEuMSe80fqzpjYJvASc3Ap2xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIWJPjhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pr6pEiGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM9YqIZ1603511
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
	8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=eIWJPjhNJyZytoREYhgx+ouckqp
	DCHlgmRAZ1SRLAd2ngZ+6zmQEOtKVGk20nPC1bvTfc5IiBqBeIGZnSpLQ0VDzp5m
	5ShQdGAwFXvJchl9lVSlyDmWzVFs0vuof7uymB1AQ/ngIy8EyWyAEMjPwWHDIaUN
	BFT8UiyZ3o17hsTdM6s4j5urSpYwtFuVYgcFfRnbWqUXAZaOZRU/IAyf4Z0g8CbJ
	ktWKy4SHuT/8Frk/m7Dv1QMzxQiCYrxFSeH033NUqEeFlOKfpzhACQyHA3yBKdZy
	w74crMy9fubwxektUlBuoDEHmKcnvD61KwddFL+L9hzI7JCaIskLUeGKZ/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwr538-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so82348711cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399113; x=1767003913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=Pr6pEiGnA+ehTzaPU+P85zv6oaw2S9K2y++oMzAGtgZqUAWA/O8p3pbsajjHEU/8C/
         saoFuU74jPQDDNNm49ANtwzanE/WvthMvdUFDMzaX+L0ilR/qZrh2pXYdAg7MLCRT2B+
         yyjNEc42QBh+6eWVzaL70QeYdWSB6g0uSnIQ8b3bMF1nGJpDEQLjuf5oCD86TuahWTHJ
         qkF325lL2Rx10Q/8QSQiW4qbKkoAa1RrzYSR2StVCXsQ1jkrwh9CFSOthwnc+fW0VUfl
         5G36bjXk8eC8h5/lJmaxpmRV6ia5cgfv7na/UnXEvFAno8m4e0Tr/Rop5U8aGVC+p8eM
         f1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399113; x=1767003913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=hU7aWM6uH539iqVMMGBJHxll3RMFx6wHk82UMVF+e0rTSyq9saAeLaV5Thg9/0QxP7
         pSCRPOdqOFt1RDQI0OhZyJEKEMqI1hoQQ1ShktmnrMLFMi+tZu4XfuNNU0UHjVrkRp7r
         XVrBoNrccJgTtQNa0XXWi6WwE0Vihzcvk4PgKxZkI06kczsGkI2qEriSksPoE5N+JMyX
         +0RJHYZPRnRfj6QIWVPQCF6dKwu9v3DmwJMRgb8pp/BWpufqOsud89wTHLCAzSCzMLA6
         YHkRV1vILnYVUu0s2cytFD7sDX3Tb/56ujRSj8zJIP4bXK4sQWatIHSNJpqCk+fduafM
         KtbQ==
X-Gm-Message-State: AOJu0YwNbMazKrewfRuWh12aWYZLJmxxqKwHNIBl349VVakMwiQMH3ib
	OqfCIA5GM0DxQiA90VUZuKc0EOp7I+8XsU6BPz1dJu8iGtgygd257utlw4KkoxlZqHg63utbcIn
	Z3A7FAAyrM1+BuvlsvdJqkBbXFwbBXPuyizlQR74zA1uU7rRcWYmAekGysFybEoDzSN9V
X-Gm-Gg: AY/fxX7YSLUqINQqV+8k6VOSYmkC6EyVuO5ADCwaaIa/XjKx5plpGk3fVau78iQNqW5
	hPvY3I+6s3HEexwSGAEKzhmh1dSSEZHOHwShcyvlelWTilQG44UAHkUyHI6Zwa5w34cqB39BBbT
	XLkPLu2Lek3KtVVJP5MvZCSF7H3+1NvEueTYj6jT7Z39+6+PJoIOxuOmi5OUx6MwKxP7NYAekZR
	wv0sfZ9ZwWI9QwhQ8pyH59R82Bp5G3QsxSS2RnxT4lG/YvFyC5oRuL6oVOtH6HML+CaPMqZxenA
	yEvwyHFHqDdXmFdl/OukoykVGlz4QWvFBK0LhwzSL6h7uIOQF1dn0FcRLbwu1OykyIgBtoUgc7W
	gylBj59xHVNnOAKozU/pXfw76aVX30Kwngy6NaPleSlgum12uFcsW3MCQW+oTKEHWTr4=
X-Received: by 2002:a05:622a:a0f:b0:4ed:ba4c:bda8 with SMTP id d75a77b69052e-4f4aacc4a8dmr146465851cf.18.1766399112797;
        Mon, 22 Dec 2025 02:25:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuH+UxR760LE2LGBvlVBLqGJgZnX8ihzwwMGi1X2xSzsKDEWstX1Kns6pjYrJIRbxWZp/pCg==
X-Received: by 2002:a05:622a:a0f:b0:4ed:ba4c:bda8 with SMTP id d75a77b69052e-4f4aacc4a8dmr146465621cf.18.1766399112402;
        Mon, 22 Dec 2025 02:25:12 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:25:12 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 07/11] drm/msm/dsi: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:56 +0800
Message-Id: <20251222102400.1109-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69491c89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX7a22WqirYsWJ
 Tc5cenJ90txVA3gWEjEAVUNSR4ur7AkpmjTdO+5PuxrjB9HxBMtF3J2hv0AOQFNjtN8UwTC2yzf
 AW++7nXrRN9XQK+CYzdStDYneX8wFL8M5Uvg8PUv8C9DAagPYx+GWHf7mJiJe8YsxqK6GUShfOM
 W08gvIXe+1akIVhn4EODNuIc9R4DznwIjJsjVFe8Dkdx2nk1Wwp3lBJFbqE1GJ3LMuPux73AJs0
 9NYmmCfl7agC+yyZQ7zd5WZ7c/jbTC2SfkQzY1v9S1rEZ1QMAr/8a1tlytbrW2Bv85zJvSCsQGc
 qBRSPsx4zOoK7j2YBQFpHAO1cqM/XPHtiIDHwtNvoYVa/MfY2QDDO926pb+RiUxbVbvUG0moqPk
 QHHFbrI0SMl1gGKqQy2SlAWRi5rTcoXaRSIXl46//Y70nWqXLjF9XaSe/Bx+niwRrQnbWsdxJAd
 MSxOkT3sRVvYbpgWbbA==
X-Proofpoint-GUID: QgWN_rtEgd347OY3cbTP9P9mKNEr1uE0
X-Proofpoint-ORIG-GUID: QgWN_rtEgd347OY3cbTP9P9mKNEr1uE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..bd3c51c350e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config kaanapali_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0x9ac0000, 0x9ac3000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -332,6 +343,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_10_0,
+		&kaanapali_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 38f303f2ed04..5dc812028bd5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,6 +32,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 #define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
+#define MSM_DSI_6G_VER_MINOR_V2_10_0	0x200a0000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.34.1


