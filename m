Return-Path: <linux-arm-msm+bounces-58338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C8ABAFFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 13:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781543BA789
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A5E21C166;
	Sun, 18 May 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o70IOARZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AF621B9CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567310; cv=none; b=DyzKqRQZqvntHvU0vnGZoZcWANvj3dYhXAdV2yQI0sIv5we6ucLdK+qMxZFrV7sCZqPXvNoapPoXumNGWNoVGWJjRBREJTjGm16QBxOGH22Idcm/pfpNtCBgBHAxQFoCDJjwfOrm5g4ObGH/PuhIotvwcY+d1XHCQ5fMCdhwKwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567310; c=relaxed/simple;
	bh=ke2tlzaXBDi/WkjoeX7VnhxmZXFVW77Qa8Cr51NAe5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djQsB3S4P4K4iz2Wk4H09zoimhE5NUcMGe+2Ue3G08VUSpwRkmrixtonUZ5JuqSagvEsD8bC8Qaxju8Z7aGs7LQO6bEp/BHJGLPOZWacRVTcxxSkzN20ISuZRASAIxUp3SSO04yPeRpu+RkmS3O4X1z6ib3Hc2fPJt5t51tX9ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o70IOARZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5jJHr002518
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POuM4QyYBSzs8lEBebuLF9SmwUjGap5CnJ381Bf1bNg=; b=o70IOARZox1upD7F
	wz5ZSYxIJPTHb9+qH1fLSW+a2jNcfX/gBLk2N76zG9QlywpWXcp8zGhhNHg2InOP
	QPRX73DCu7o6vD39EDIg9ob1wBy7rRmlnrnXhCac3nHsZaLvJ7UeMLpltdyymKtZ
	RmexzfPkXb+8ZyRIZF4hRJvmryBkCnOD69qX0xv+jcfm5Z/wIDXYVURfY7BZQC+y
	stLllX9ydvN6E7cxcP9NCofaYSTOjpwqPKmPfW+YfYMzYnMu+WoL0zDPYH+z3uxE
	5tkU7R05GYcfvbTkNZ6d3dO9imoJjb2TE4k+HgG8I/+mkVLAxUqMFVlkLaWGAzCh
	Hz9eDQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31wc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso37158036d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 04:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567306; x=1748172106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POuM4QyYBSzs8lEBebuLF9SmwUjGap5CnJ381Bf1bNg=;
        b=WUk9GZTkjgvhw5jLhiuXn8Wp6CIAjRfatfBlSpfD06Iym3ZNTIK0byO9pqSolY8ew4
         djqWbxan5ywisN+xDze5WPL7v2OGMFVz0O6dYO1bpL4HJZRqrFxSk49Y47ptw41bkktA
         UPh9NVaAWvHEyxTXTWhNBaRx2pfVr1ikH0iQ+qJl1j+QBPuQhvN/21c/22oiHIP8UMiz
         DVgLgASJnKCqBlSZdEfAmrfZ4n2yHGrYh71mguEiMkSxsfuMdRDU3M7LeVvoUAGGDu6t
         f2d7FwfcXy2y7sBcqjy1wS4oLsmi/LlgAgTB06x3mtl4XWA1b3Ekd8erJMGb3NSMNvek
         CVpw==
X-Forwarded-Encrypted: i=1; AJvYcCWnB5X5zZXennx11/OrjWTh/JAtdxxBQcFdRaHiOV5AFKBmzAGxDQHIaScDobWCCo8Pa+S0U4Az6mv19uVy@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJgaGvkyrLbYkiBbsKQ4Gdelt/IAVFAPqKbAscZHFklow1/BV
	8N5zDKBq0+6WcGT7tpxB8qSQHy0jj46xmHNl0HfXrcjf1LLFXqN2AKql8EZPGkh9/bY0QOGj1Gp
	3j5ZC26bKF9PT9JLm5JIMeEkHxWV82IYBBjgSvWClp2rJqz2OAMLn1iGJIQLhLqNm6Zei
X-Gm-Gg: ASbGncvE6veUi+4y6KDaqHZcz1Hq/QttUQbxU6qFvDyMfFAET/5gWxX7OERy0nxI4tk
	tyGqngzXqfyNXUa/38/dkVjjdRMhnpoqT2YYbr1x1Jiz3SIgXG9q6xmOKciDmRTru/dOcG9WhOp
	yyBCSXaqkLHLPvnLbFebM9LJXsl5pL6NpOUtQVEd6h7lq9ds3FkeDpkXqXt2Ylx56IziFJBpQAn
	ZHOOl5HmYDUnLWHuUize1QchIbjvpb7p0qA1tBa2MHvjCdMF3N7vQD4OnyAtK4nlFupRorQzTWE
	l7SXuCSjpqppJbwbxn6iyL+DJry1y1uvERmA3tT+n80b/2UhJeHHtvvjWDWfuFJDTrPe5Ig7/cY
	yuAWd6vyARO1e0ehLc4Dy4tPm
X-Received: by 2002:a05:6214:202e:b0:6f4:c8df:43d2 with SMTP id 6a1803df08f44-6f8b0935339mr170238436d6.35.1747567305946;
        Sun, 18 May 2025 04:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4fR2ucbRVFRPSQkbMQXjGJ1Hxtylk9FgYTSGqRkdqAOCHzKlKaMxCW1Vp/0NfYlmM0j4QeA==
X-Received: by 2002:a05:6214:202e:b0:6f4:c8df:43d2 with SMTP id 6a1803df08f44-6f8b0935339mr170238116d6.35.1747567305572;
        Sun, 18 May 2025 04:21:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:37 +0300
Subject: [PATCH v6 04/11] drm/msm/dp: move I/O functions to global header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-4-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5605;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7PLWki9dLUTSYTbO8lnYK4VQogj3alhO9C5gmUos+0o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/fx9rbbfR4U36rgYWYAu1S28GUFWgeqdzJ
 +CN5aCZHPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1dWKCACycRH/dlVfJIyp68ot6qbT/rPE5BqvnjGZyMkHzwxgOLy4KeZdr+Uu796aXYGtEgGGrVA
 BvtpQCHIno67+x0FFN88iU82AKZxJ6G0tdYeqWpFmp7Ha42Kqekhg7dp2E6mcpvi75wIZ43B7Dh
 JQFmRc25jJ/6Cbh5mMccbx2r1/XhronxFslkIy1e37JoxNCUfZc2O87fA0MM4NDb/Vfm7DWxEF9
 PDPzRggDOfqbJOm8D8i/ocxSUu6mKPkSDYGgUoLUvLXzdQT1b++KyINPKHyBTwfYi5yJMdRZEkt
 1BymanDBxDfM2qWx/GwD5zJggLmV5StvjxxY0di6oyNjThzn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829c2cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=J6TQEPGwCORx6xcX2JMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4FZd-Gd4tAhK-0k1NoNRQVIUF3uv0FfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfXxZz1IyndZqbx
 xd9zeP+A8tgLD/hG2ibqkhu2LGMFdkes0aS83FNlt8vh/iZqmViXxhLuUlea1xE2zj4u1FKpWkO
 PdRt6ocoZJ4cdXRlBnSeLU19/Cdenp9IvJUKNtvIlv7N3per0g1BmGIFZi06wOMb78rnDkoLRwD
 /rQx7KzIY3YDxK4wE0guru1A6nFaI2cqU1b/oYsAypAIkNVusEBVhjssb7F6Ss2qtxwYOvPIMU8
 Sv7uOXw/p2uGMdY0uYKGlzAuDym4sxMun02yd4SsHPrE8/Wep+e638QKML9O2uLnVsFQ2MyS+sb
 NUSSxkbbp+RNzOnzdICF9acGzzJGsmNcfMjyA5heFEsRR/G3SBVUEG4ufuY9iIeb8RQfBtulG+Q
 KunwnUxCPMmcKMMoi1qKdabimeawrsH/mrV5JZr9KHi7LqN1Bc/EY3So2n5zS8V19MnPszU5
X-Proofpoint-GUID: 4FZd-Gd4tAhK-0k1NoNRQVIUF3uv0FfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180108

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 74ab86035f3b98b498756673229218558b6713c3..a22efb1e83d04cc5c9bc768a275df9cfb4752a2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,71 +81,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 5a757671d7310b43e7ca0155ffdc276c83d1e8bc..10fd0086132092be88bb698e53124f87a906de70 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,6 +48,68 @@ struct msm_dp_catalog {
 	size_t p0_len;
 };
 
+/* IO */
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->aux_base + offset);
+}
+
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->link_base + offset);
+}
+
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 

-- 
2.39.5


