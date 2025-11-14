Return-Path: <linux-arm-msm+bounces-81768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D44C5B34B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02EAD3BB4F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200F127E05A;
	Fri, 14 Nov 2025 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIizMgKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfsKVhPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419626ED2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091835; cv=none; b=SBdzENjB83pkLiaRQ6p20tXfEJjGK97zs+3tsPdPn3ghnZGBk1sYcuQusXbFPhzyszC5Uc8neDOOfsCRCTxjNm2fpCeUMKDvI3PyPzdnf2YuskGfe4JKOTkM5JTGuKHfFX8fsIjCCg6K0VeWLVofto0CYWkpJHnxk8SNGWufygA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091835; c=relaxed/simple;
	bh=qHCTHjIA5laS2HK+x6axVpCJPJY96pJ2AxcbIbNCeaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ry4dMkgb/tocxiOUHeWaWWIWC7vxC55MsWW4lZuwkLAhg8xwqumfth3HzZ7v3AdALuXc4ECNmcgMH+sbDavkPo90NToOIGOY6aqP8ElGdQWwNgiZkadINUglUxHvmCaf7Wp6g/0nVkdeH59w+qT83ecOteBuy00onBpfDaTWNxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIizMgKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfsKVhPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaxH11427916
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkNDDeEkFU3dBwRVznIRKCYbh9s0YY6BLe7zy3wV/dE=; b=JIizMgKGHKU4uDWD
	PFA1hV5KOQDEvhIpG0tmOwq8DSpVuXLV5IBDp7OVJrRhfLZvrEN0YYeILJyAxENQ
	926ZZsV7rzFFcrsBnp2lgsv8xEGBV5nFcnzUwrKGy/Jxcbo4BQjAxwX7MEONpVv7
	29nFZxUdvcOYtLpYpmuT3/IK10ZXUR8u3ejVOJXgLz8QmLPgGNIsCpORo1lgqCPZ
	vD5HjtpmI0kwXc/RmEryzw9DkxX9mfJIh0BJCfR9L06Vo2vP7E21gUiNF3hKRRB4
	rWjrvHMC3J4F/bDHyxlq+uzDxUK1ZpkqhK53u08CmeSc28EiTaGsjy2JY/PhTA9B
	kZpP3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0p55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88249865db8so50423056d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091829; x=1763696629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkNDDeEkFU3dBwRVznIRKCYbh9s0YY6BLe7zy3wV/dE=;
        b=hfsKVhPjrss1JlmqwPZZQ/nP8r2XYn73BcEJ0vOIcOwzKINeNjAN+MZAq4O39nfJlc
         4GTsfd7WsZBV/gJIhq8LP6Ft76t4CzekU/DFd3jmcr9EGNBpxyor3bO2aKwSXR2wjhyg
         OC/2bTTNj9eIin6hSupyo8Yy71D1jK2WuIIXNew6jN6hh2qZLsoODe0BzXPh5EovOcrK
         EuJTmJrQND4AmdD4gUGOENF3fVkB7YZ3UR5yiQTsi1fHFf1HEe2CRpBhxdYkC6IaIPj+
         JK0cfWc6k/9uEi65O+CVcyIPdvDzyCCvwgxBJL2Wnvyc+M5mEDfby5sj1EYhaEW6nPNM
         LuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091829; x=1763696629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkNDDeEkFU3dBwRVznIRKCYbh9s0YY6BLe7zy3wV/dE=;
        b=biMpziDkxufkY+Hcb+ZJFnGmnxk0w1Dbd2NkYNNiNc5UvYf2Nn8oNi5U+TT1d83vjn
         fkCAfiBbMr/uD0hfLkrosxXnUqMO6QKnhKfSoN/47wHe5aVz90dVclgegEobAcmsqjE6
         AekqvXqsI5wDcwli9ffbKodPid2/fuA4v6hW7KNHmQm86dykOe5exn0BLDbv9qqW98QN
         5vbHM0m2ga4YjJKgqOqxFTFiFK5S+QhW+8KULZxDX6WrODukmTlmGf58Jco2QL1N6YSE
         FqS4+8EbqiORYfCI7kwJi1u08z4w620bQMT9U92yXROcNzBbmDmsfJWUVBHEEHvMsvPj
         UmUA==
X-Gm-Message-State: AOJu0YzGfx3g4YBxCgPY7aqftkCg2q9cl3a9XZT7tNWXTHMx/yKToAbh
	1r57KkIWbH5Inca/0R+C+FFdVd8OBgdu6TJjLtzZ7jri/re8/OyRgEg0YEJA5UjmfULqy2h2fNt
	PVtg6d+LyexNiHnMYsvB9DhBkA9lskNPqQNpm64SL7rTMDMlv1k+NYPBVUvwx6eCr2q+d
X-Gm-Gg: ASbGncsev4zICx4UQpnLU/aXIZ4yhcv+Fk/ImAdcm3QPr4KzbJoMQRDxiLKaHFTRk8I
	Kmlwl1SFuqg04sDirdeIva7O51b/77ZHq6rBIpAanJgS6h5JZGoUE0E60NbFxGp91vxS2FxzrHA
	byJd4RS1K6nOL3QTLyUOQoDh0ohAymjbCcanU+OMLlFL/OmhY2jI6m7fbueJtr5NkKZOqt00UI3
	R4hrwDEaZmLZmKtEFPPLFt916Yfz/lSG2Vq1ILtrlNhTGbcSTABfaveC0FHfZ5wiFBATZZbVfcn
	iAYV8ymrus/LFa5/Pg/P6WOvuOxlJzKcVlEE017LuVn5yd9ZNMnN4OxKwWr8JK3RH8tFkO2Dxkm
	tRRmpFsRBv22yWvF1E6mfqEMl/+8CCJ/Ari4lsQGzLdBoJ8C67hyl6LVc3/1F7UWJO6VNv4x3/P
	Az0UcFYiemm3KB
X-Received: by 2002:a05:6214:519e:b0:880:50dd:16fc with SMTP id 6a1803df08f44-88290dccb7emr26463956d6.7.1763091828675;
        Thu, 13 Nov 2025 19:43:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH28088MQo54QH0F65cn+100QuWktEp23e4SSzPV9enf/SnCeM1n3q97xpogjYU/zsBIc5+hQ==
X-Received: by 2002:a05:6214:519e:b0:880:50dd:16fc with SMTP id 6a1803df08f44-88290dccb7emr26463746d6.7.1763091828223;
        Thu, 13 Nov 2025 19:43:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:32 +0200
Subject: [PATCH v3 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-5-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qHCTHjIA5laS2HK+x6axVpCJPJY96pJ2AxcbIbNCeaI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6bY0lSxl665kRYnJnUJBDR25pY1h7p1dO5f7s/G0HQ8M
 4On4VknozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbCUcXBsI7Zg2N6+pxHXqvL
 ewVc+LTzm6MafK0jmTf05uw4FsOrs4P7FUOIj72xSGnpRA7m0i6nvjelbDEFAecWcbztvXf4zzQ
 X4fNNhvO/Rj7reW1uHB28ZU27+NudlxgX2hsXyRRW7WQPDOC0WHTAZ9vRGA6n776xOQHmJrdidy
 2qTv3UzXVm54Rc0WlV0pHcblODveN+32EzqTGU2/epfLqsRJaN2X+hP8tCbjmqLOj/IL+X1515o
 aNkVoX0NJ3OvNXPZmyd7rmbvbctVPesws2ymqoHkyPWV1vV3DY5nh4dKyJ7hkuGXX27+F6befdv
 W8YuSN992v9ydtD81dXLp0vkTGoy3XfVWzSyxeJ3KwA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a575 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dZuHSUUM1Vk3wmwcgTEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX0k3h5ahhigOR
 xdadkamC9GoeB7BWbRBna/7oj+/jVdJCXKuyUAj0UDiypVo7+/HqU8hlY4M+DH0PyLzJeK5DmL2
 cPHmj13YV25CctKOHusLWYDXlywU9BjLaHNJU4tjTZtBj/6Zn9VFRh+WnXarHHJnBsFrZ8BS5Yh
 35YXeB6IxY/ivlLiA7KxtBVsbgKXyxdoUCPqhOo+7JRFcPTXpMpvatyxOPt/zlHo0LCGuqFTdXr
 THKesi0MluUy5blVNhBiG1fsYszD6+877UBYCjuVnB6VSVAMZSAaOrb1+1pMjDVAw9m/hLjMmxa
 W0jqpmtHBlYGgIoRdBwGprpk6tNzGV314fS/3qNOvUpk0rB2hGLV6t24dnMX0ARq8pxpa4/9fzG
 EoikLMR6lW/uEME/ZbtfkrQ9LqutFA==
X-Proofpoint-ORIG-GUID: mzPJ5I1Pfmwrfcp719a0ANIgaUQGGVQH
X-Proofpoint-GUID: mzPJ5I1Pfmwrfcp719a0ANIgaUQGGVQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg)                                               \
+#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = 0,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 3,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = MDP_FETCH_UBWC,                                     \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
 	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
@@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
  * the data will be passed by user-space.
  */
 static const struct msm_format mdp_formats_ubwc[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
+	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
+	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
 	 * natively.
 	 */
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
+	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
 	* natively.
 	*/
-	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.47.3


