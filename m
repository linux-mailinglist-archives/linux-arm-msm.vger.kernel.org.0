Return-Path: <linux-arm-msm+bounces-61890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2BAE1DB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 16:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C879D7AE010
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 14:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016B3295DB5;
	Fri, 20 Jun 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCA1p54R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C567290DA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430608; cv=none; b=rr8u8GSUGYisTdkoRi+7PtE1dcUJaybxGnoKj57Nfu6RWgJhZhjisaxtkPjsZRc52rzy1BxACjuAnaujSC6WG03cRzTQuVo2ZXHc7IHMF/At3IaQZ36n6XVANQad/PwTrG33nEO65IUPM+Sbl35M8uyH9dYA8t+LJFDPpta2Mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430608; c=relaxed/simple;
	bh=S1RTIuvrxbs18DrRSrBZV5jFdVvNctny+MOIL0Fxzuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0GHhENmXpd60gTJ/qCIj7gAfEZz/M/Df+XaZEbYKL23Weh7wquayH6NguZJnvw4JwK19swoIM+YFHXqwIMGKOBDam9zsVBysOKIMSz7GlKAIveMYRXFGJaAVVdzzmkrD1vukM3lw4MJMSwc4lEvfNYdJOCNCcmdB3ay74CTmLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCA1p54R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8NXur004996
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+2lD+C9IWf
	fZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=; b=NCA1p54Rd2ZCYrDO02fRdPJ2iGl
	IfVb7zMuZX7p50zl4CiuIno6CGD6xuRSScz6Bw5s+JQGFyS25QIZXVlIK6FMi41h
	lM0uxwQr9j1q8L0COi7Cp8WURrqQ2yuJZXXcoDn3Lo9rKVy6dMe3MbPqe9ROnA77
	hvpzs4nasF0Dne29rH9WCKDlfeDhKOku8Gy4OO8/rpzLLD4uFbd48UgLMI/w5GBK
	QLe4LvLkEMZqyw5kEun/FPE+RQyIoTmXt7N6GZ3OgnATlVqVzQw2FuL2Qt9CQS9W
	aTfNo+O6srT2ffCF+qUPKiLgbnNLZVxCU3RHeuCXc6uTogewTYIRQXWsLzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mug0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so2374821a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 07:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430605; x=1751035405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+2lD+C9IWffZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=;
        b=YddIT8+UtDAOBbz66UrNmQbLK/8oTlnmOxq1U1lqCCKg1IjBS5NiznJGBfj/lHWAqh
         lVKXS/W5aLekuBSwhsY0OP8UoADI0EAepFpJrQV/Ru4g7J9YJY2PoB3dUU+noo9MRy4S
         1bKCPasxXg1zX60lmDqRTcdQ5wY6ZXLWN9dNYx6XrT0ijDDnu4xd063wtcl63IfvNjR7
         kt4xGe4ABo3My9Q4O5VfGDu0dDC3pyt8LTWQTiSDcpi5jJTcnsefOGW2XMKeYxIQ4ba6
         sOWhuHld40ZaDXT2zLKP9RhowY7qdQ+prv189G3VwbxKUpEfhivxm0brSzpY2EDGq45Q
         HSrg==
X-Gm-Message-State: AOJu0Yw9Co0/X+arXndL5Q1MaXicfA2gToovzrooHLs+IIG9wVN+PuCR
	q4we06dTgAX9XjBpu4Gz6+UGLp5oYbRt3oPIJukIrVcsvHa3DJ4A025vdCT8vmQ3+Uucigei2Jf
	i4SDjKJNp2ONdLNTuVXYQyOW1OPV82z6j16IJBTVonXIbRtkKFUonMgBk16ZO3wva3ZBa
X-Gm-Gg: ASbGncuwI8aH/n5JZvE6+LvceRDfe7vvCsf1833alXICBjEK8oRUGLuyIY6eKINi7W/
	V6MTgLgPgF6ntfENtBpvcZD0XZnyuJknRbOK+OSHjMMfJqu5gggtNUxn94IzcpDEqYyPtD+1Kxe
	XI8pbfU4Tats25pmUxLDChHO8Np5ya8NH7EHMT03CItTwPvqk4pCqRf+HtEMUgRczkvVv8eLuod
	DHhjPlGfYaJVEDkXDSvh87LinTmTxfxCkBtrVA0GT9nuvMS/hT+aRaB5Xm3Um1SN/QvLseoQcH+
	X2PT6mnNRO/17i/mjPhREDNGXaGzY+tm
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id adf61e73a8af0-22026ecb493mr6302522637.31.1750430604716;
        Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4frWgXICqPFw0JBjaV+WPfDhCyw+89W/qX0OyG987B9ALxAgWvGk3pHM+gFofmw1YVoc3Q==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id adf61e73a8af0-22026ecb493mr6302481637.31.1750430604342;
        Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118eebdsm1609718a12.6.2025.06.20.07.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:43:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/fourcc: Add 32b float formats
Date: Fri, 20 Jun 2025 07:43:09 -0700
Message-ID: <20250620144310.82590-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
References: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX1WM+AcJT1EZh
 ofrz6ATjXVmS9sFayYLitzFSiV7tcJ2L6e8aUJB6ybED9sjG33+F5K3h1q2YyL9PeqXbJ19TpVh
 vUk24BGYVx3avswDp5LmK2cHx/Wk1KGd/QL89XoMYsjwppEYXmyKHygs178Yma5BuwtlWKKVBJx
 /+3NFtkKyBxLKVx5Zy8ur85rGU6LJ3Y4826T3lH+tXrKUKPdZSGbJcg6Ve/3iJ/fM2GCxHWi1mV
 N+7yGn8RK06gw8IIC6hAtUWySjMXqq585lownQvzMtsKU6ajT+NPxIV3kRkzFf5Werdbpbw18cY
 h2gtOaHKDtKcZx3/0C1QD+yc9biFB509Fwbw2KTqfdP56yxu25yJZg6U6lC470nvb6fwy5+j2YN
 OAvNFkbc22X0LHEePRMJ2GJlO0lhvQomJ4OUE77hmOx1apkJDwKyeNiB1w2e2v5q6bFVEJ76
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6855738d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=n6CFGpYek-_V9AMlogEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: cajw8hoYNqarNABRUX599Rlo0whVWlMX
X-Proofpoint-ORIG-GUID: cajw8hoYNqarNABRUX599Rlo0whVWlMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=998 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104

Add 1, 2, 3, and 4 component 32b float formats, so that buffers with
these formats can be imported/exported with fourcc+modifier, and/or
created by gbm.

These correspond to PIPE_FORMAT_{R32,R32G32,R32G32B32,R32G32B32A32}_FLOAT
in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..abf47dfcedc3 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [15:0] sign:exponent:mantissa 1:8:23
+ */
+#define DRM_FORMAT_R32F          fourcc_code('R', ' ', ' ', 'F') /* [31:0] R 32 little endian */
+#define DRM_FORMAT_GR3232F       fourcc_code('G', 'R', ' ', 'F') /* [63:0] R:G 32:32 little endian */
+#define DRM_FORMAT_BGR323232F    fourcc_code('B', 'G', 'R', 'F') /* [95:0] R:G:B 32:32:32 little endian */
+#define DRM_FORMAT_ABGR32323232F fourcc_code('A', 'B', '8', 'F') /* [127:0] R:G:B:A 32:32:32:32 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0


