Return-Path: <linux-arm-msm+bounces-61889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B8AE1DB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 16:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD8117760C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 14:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB17328DF0B;
	Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7ohHmMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253F28DF1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430606; cv=none; b=qowpgKjn/n7Pqb1GyPHUGXBuEvdJpRbaKg9XWqajvbjKUcb0wUYQVZRcDHt7q95FImTV2CO9Pu6HtS04UlOC2/LnkLoURrlzuhs3yffTFjoJ33sp/Kv7VwdhHLMubskHer01HNM8JXeJuoOJ/Lo0jovFrop1KUkUvtNR3NjYjHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430606; c=relaxed/simple;
	bh=q3+mMLzi1XBJ7PohZjjpMPMhC+9PoRP0OfuNA0C+/hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMp77uXx2Bc/2PkohXjgvzeK5JxCTTtNZCG19Y75W64TlMxXKhOpSisWc1+EvAXn3wM0V2B1/47xr3vKtMVzZqVOqiuiWk+PbcDx0JpsV0tq4E/LgQkK0CD0BSc493lu3gtYCfpsLxTYtiSkEWfs2T2dQG+tLhA7wJCqN6WLRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7ohHmMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEAe1H022895
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HRDy2PkiT+b
	Jp3nZw0dqpJsJDfHdIbBg3CgFYYVmwzQ=; b=b7ohHmMaBH6/bo1E7YjTnSPn0Fj
	zfq2f76Z0Z9cQwczCpob8P6YxOjr/sHaH3u7t2kCC+kA4yGG95VBl3zzj1D3zcmu
	JE4xhuHntjJtYVVSgNCZF4UEjKGrHnKZHPwAFy0CG2j8f1aNkZMm3YegvMXFfmJi
	75utTkipnb0Qy4sNwIJUJQDCiU1SR7lQDTo004Sy1VUHYANcH4Twd/BGkxolm/cr
	TVbsTcsV/HuX+yTFZ30zMkjtnwzGskFt7Xqz5fFgXsh2+RtIrlSKtXE4B7u7rR4Z
	Q/9vUZjfNpgJZDW3f0rixW4t/GoJEm4IE5CPXUslC1Qmh/VhONdlmRMhD0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdbq01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7391d68617cso1650508b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 07:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430603; x=1751035403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRDy2PkiT+bJp3nZw0dqpJsJDfHdIbBg3CgFYYVmwzQ=;
        b=XssKBHGu9EouP3sXS5Zs3RWthVF4QBhdoLxbw2h4zcJ3cjSaCrZjV9C4a3mtM+RFcK
         aFIbMYO1Ufi/LdXjiH49GHWoVl9HP/qKOaFSUGNdD5XavOHNS3nIQj8TeinP/DW8bPMO
         5nmfKWCU50rnw395N8UjtgrSpmufE3oUArSdo3K7Jy41fkWvlEQEWY4YYXqTnczmd+nV
         +eR578HsBrkLR/jaXPD92NYhGuSkDBP2BBt6hSyJM6RTyX1zcE/PiRmeH092sThjw8tV
         wxOZta/obypVaA24VgiQUW2dmMkf3SusBtthgV6Fh5fSIxWeMerdH0KBi7aNUQbuN+O5
         SpXw==
X-Gm-Message-State: AOJu0YwOnpoGWFi7PPZXd0W5t4fzoJ1Ooaj4sFoaVxGLnob7G20WWPCB
	l3hAIthkZnfCkRbUqP6URTeifdXNm1xngdG4PkvDMT4LN3PBQkqE2v4gz/dd1A2NtK03miG7UEQ
	iULYm+tUqRVTmbbkCTD4fI5B0riDZvtAehIzxOGKc81rrdX4b/4clCJzgRldUS4/2ca08
X-Gm-Gg: ASbGnct9akT8KuyWAPXv+7QQmee8nutS1fwl76DfRGEuYKNHOHP5pQzY1FMJIjrXclC
	fBfl8oxCe/9QMo43o9vq6jQ1oxKGwdaHod+Xw+MO72TYj/EozLiF0IkSOtZM2czlCUXbz5ZLR2N
	+tfSs/ikOc4vxrs3GnJcjWK13MN0mSwhc+GH2IhVgB0lXYW7eMdDFCydq0BhAP7ApQnP/F9oOlh
	4y0zvux8OSXPUohB25DeHaXd3wyDs36ntP+Y7YGZ3Jb/aDRZPsgNCMDujgh6aT7YXctf27lh7xO
	GN/UqWMFz1rTum5mNgZmQUl71lJQjgbR
X-Received: by 2002:a05:6a20:d48c:b0:220:247:29e5 with SMTP id adf61e73a8af0-2202915778dmr4964067637.4.1750430602934;
        Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFngm+bBwxJRzLg91zDCmzRMd4IZHrpLNM6IeTMuAbWKdDIwmWciPiCOoEVycUeYJx8shFpnA==
X-Received: by 2002:a05:6a20:d48c:b0:220:247:29e5 with SMTP id adf61e73a8af0-2202915778dmr4964024637.4.1750430602499;
        Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12427d9sm1598224a12.48.2025.06.20.07.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/fourcc: Add missing half-float formats
Date: Fri, 20 Jun 2025 07:43:08 -0700
Message-ID: <20250620144310.82590-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfXzY/bJJhKS2vp
 hR1QunQOwJ1s3nPUNK1MWBP2Fwcp/ivGQy9tTCORg7eshEBY8qZj+X1N7uMQ7HtibNvtw2jcpdz
 S5PbdySyklE2OhWEP6Z98a1XKRbIeVf/r0Vo3zFGoP/iok3vY+y28CAxISOMiZEkIyejZ5L3dsQ
 fTXI6dfzcZ5n3JZWcqDaLDkqf7TdIlcjGJHvYwq4GlwGySrnAxecEEJvYimPI+KBLx8HB/cqVLq
 TF3kVRP0MLo8+IPXrAYXLJ4qiBpWs6neKKLc0zo1Hszo9L19rnnA/uPv8/GEGxr6Ogp5hrTNxbQ
 5WkDGV0n5f6ZAq+bexgox8+mY/lgxlmKiD1CjHncv5OMQTSOHK3B2J1Ll9Xqm53l3bPN8txqmQa
 BabccW6lrrEztvR8vS36dNAShtLRmbIJ8k1BZldbrbG9UvS0JhuthFYNU0MOkN80DXvL4pEK
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6855738c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: gkmLAiBFurxU-pY_j9wX2UITcER2ilay
X-Proofpoint-GUID: gkmLAiBFurxU-pY_j9wX2UITcER2ilay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..3560ca1ffb8b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -218,7 +218,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +228,10 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0


