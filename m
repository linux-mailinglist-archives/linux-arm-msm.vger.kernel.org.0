Return-Path: <linux-arm-msm+bounces-62504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E1AE8B98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C605A28E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395F92D5C6D;
	Wed, 25 Jun 2025 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAt/yoOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B992D321A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873046; cv=none; b=E3ie7hzhZcTF8wHaLFeYZ9nvWbCfuOOFEYbnQynhi7tDbVLaxqfhEU9zEL4LLeRD3GIrOsAdoMgDy3U2Sj0jhySlIhNnAPXA4W2g10IJtw8ZWsl3T2e29PsJ1885M/Dh/jVFSc6eqV0iHld/U4sMWI0oQMrYBXETdYqUAgqoZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873046; c=relaxed/simple;
	bh=8PB8oES3RJFPhWVRT3Tvtjybt+TrM/SifZn/9Eyo4UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgFYyMjPWcboon8kKkbMVkBReiNnzIt1e51JxKkDMao4aZyYwzOc+U2rZUOKPBUbJzR2PQrZnATNsHOL7SfEhaludtR9sNbPJLofP2PlxJZB75cHbk4j5dQKPuXfxapyzlVgt1CYpuxkXd66zn41Oe8XdVsG1U7L18jdu047Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAt/yoOI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PA33V3032470
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ckmpcZmveJc
	msZUFuiT/RpgJEDPikgftzrJym6w4+0k=; b=IAt/yoOISlrjfvms2SYcBU3NWDJ
	ziIUjVKYkVfYJskuW83tRi/WBwd4BOTUvv9B3iO6QASPxxVA/h4fLzucz8umMLzr
	phZHnwum6YBph0oIbdwS0hNByekX4s3/J34qblAulrwFVjVpRRz/zCIoGN93n5vK
	v3vjnCvvFNxpMfnxapFG6z6F0cFZa2DmSscDvylOY2S4P1h1fSuuZheEdyLjk5Y+
	sIjFT5UUyEkiwKE30QwndOg8gAWIRJexl+eoMd3JMMoyGjDP8PHMuf5cZmd4Y3yM
	rFO8B1LE1mDjSGg1I/O3gNVfamlXubaUOL9jVkLBOAB+XarvrW1iZ6H0yRA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1yb31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2fdba7f818so89897a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 10:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873042; x=1751477842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckmpcZmveJcmsZUFuiT/RpgJEDPikgftzrJym6w4+0k=;
        b=VzKPFXGnO6cHfcUTeDTpiATachXBKYuqbborSjgCSzwkDYy45WEOuwRM26ApqHxjHi
         ksBQnWpKhMYKuAPeTogN09D1Dj+dTPqz1Whq0c73d1h/R4kHSIThpRV/j1Zt0M3j+2Ba
         WHtfpULEZfUeP3DXpzbUQBJnWNIlngDTqBBueZrNbytASnXiZ5MiEXI88P577u5s0Ick
         lL54h2LQI2tChGVKm+U8ZWhF4aay+xcr+i3GZw5H7W2Eye9Oxy9kGZRvEWGIQ3yO4/51
         mA/wKPgA8Dlm1rY4GRx909n/TL2VSXUzyW7fcHnA8q5tGUDYlp75xqmF+z3BmjXJMWwJ
         wtdg==
X-Forwarded-Encrypted: i=1; AJvYcCULBBU45xN61Tt82mbSHOxYQDt/XVSqHmISOjgax/8pg3KmoQRDHWn0FATHI0QSeBG7LaAcpQpfT8kKy6ih@vger.kernel.org
X-Gm-Message-State: AOJu0YzMFMIR5VBDhr4ThTUkqf49m5aJiL/dhEiaGht5OBiNXnXMUrrX
	tNqeuwUzvNClj7rM6+50eLq5jhWgKIjoKULDmp+mH7NpfRZcvPciTFoQNNNtcQUdQ+LHaSKKpIq
	ENPCfQ3qyWisobhAHqhMJNkEkwiIqq64Fsmd228HLSYjW6ZRJAENfErMaVHGlPPtMt2EF
X-Gm-Gg: ASbGncvVOjmDxqOeeSh5bR+AUfkmFlbnHyOIJhTw2vCnkjBHCeRhC4cbRxoIYiExcD8
	cC1wUoJE77HDrvv2iT9aP/QCyHJuAPXAdOhmQDrNxlWeYEqo+tBgivDZcgPzw3h+KsILOon8Gom
	X7shSguZYfXVu1++8cxZEb5FLez3kumjADJWUdGg9H8IYiUg2b2gc6+FNbenkKzsq5DMy8xbmbs
	WebP4BnSw2GGpyIPDo/WmGmzjkYzk/Q0wkSh8H+qchYmoy10PTZxJOtcPP2O5IHxSKTPwwARQdr
	Y5naG2pIXCRqnEaF40M7j5+zGVogtMPv
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-315f2623c5amr6932419a91.12.1750873042099;
        Wed, 25 Jun 2025 10:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHisPZ8e1PdIMAqtxONK/SJTKlziax5CcCuFowOdaVXodfUQiW5C7P6F/abrBzQuGI6mBDiIw==
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-315f2623c5amr6932377a91.12.1750873041680;
        Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e862sm2199928a91.16.2025.06.25.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/fourcc: Add 32b float formats
Date: Wed, 25 Jun 2025 10:37:11 -0700
Message-ID: <20250625173712.116446-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c33d3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=n6CFGpYek-_V9AMlogEA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: b6Y01Q97ojyQwxgW_OL9HV2sdEC9eDST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX9dEbuBCLK+le
 xRi1tp6SaIk4l6JFo+2n3tyrYlxaaqsfzPWhMzcAur6M+ee3WP5ytonP3uJEO1hb2MvFQNQmYHe
 AdRS068az/qAzCN9jRKc6sYE9PErQIeVk43VO8Qhje52rR7+XcWCEQAmOYT1JuibixEV8znjGX7
 foAorB67Pk1EFICDK/udPIft9heQOPg2tmrj50ACFXf5+s0VczhnqO2ud3qSZ9YDedg55VFTryR
 vFZhjhMsV4h6WlcO/f/F8BhIq6bV8taOVQuaH8fHZmU+eNCNlOSx8Pz93v3vkeoiuWwb/a5LnwY
 G7xIqoJMq3JFaEqslc4eV7gevKdWQZCQ4XNV9U+37rJNNrw4Hfz/ZN5GFU5ODDtueUoPXP7cAnO
 /szwbbbnUw0SeRrk4wQzdGzs5aBAzrX/LzigQ5mm3Iv2gjibaWngJsDtyV2e9YHjPQrXPiMi
X-Proofpoint-ORIG-GUID: b6Y01Q97ojyQwxgW_OL9HV2sdEC9eDST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131

Add 1, 2, 3, and 4 component 32b float formats, so that buffers with
these formats can be imported/exported with fourcc+modifier, and/or
created by gbm.

These correspond to PIPE_FORMAT_{R32,R32G32,R32G32B32,R32G32B32A32}_FLOAT
in mesa.

v2: Fix comment describing float32 layout [Sima]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..6a3f1b32cb30 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [31:0] sign:exponent:mantissa 1:8:23
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


