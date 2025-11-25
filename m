Return-Path: <linux-arm-msm+bounces-83173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69EC83917
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 664D2348DA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3082FB978;
	Tue, 25 Nov 2025 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzGbr7hU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OG2xQuQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFA52D8DDF
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053373; cv=none; b=PbSdspCn20x18RlGByPIIAIWfiWN1511AkoVmRpYF8kdjGtlJyfUJrUt/T9iGovLqQ2q6TW2R1MV/plc58dEUOcrBVaFTA907PPsAaajIJxB53W1gYn737+b/Win3x4Ii5CUm5442ZQJee8PIQIxyfKDvMqcUyLGODE22q/vquA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053373; c=relaxed/simple;
	bh=pryC3efeva7N8Mb8bqhAcLUUN+nF1bsHQT4thpYUZ4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=miOqLFi7r9UzH1KnzhBf1Vm9/Gyr7KKdw9zAadDouAjLF194q/unaD1GQMeWZEcxtk1J78hy3M/+ovHELtK03Q4b77ZiuRWRqQW+2ON9X+xnOCeKN5+S6AvC17v804CTHyBMWtMHTT873lUp9NZXnxpwxCv23/RdYTCJqCLxzYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzGbr7hU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OG2xQuQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2guNe2009186
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OMLdFutodWp
	WHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=; b=FzGbr7hUJh58BwhxTL7jr4/MvVM
	d1v9HaelRvizsBBOD6RCFrBjvkKiB8WonI0EVHh6WemqUaUV0yAorgKbP4SW+AKT
	GWsefpJiht89SYwlRQpefVTZdvHhqaI2e/0zVHVjH9sD1ybMOu1i3mUtn42Kjmpb
	0bwIuU0dm6sFWeNNEranwkPh4OpBYLiAes3QyDRaSpoAkXCc+mDutU+62l+Dn8kW
	Sv0Z2Ov17Bb49afLEwXfbuFqb4lFz96KkryiZRMTp7KHyhQqihIwG5s7wsSC7nti
	hkDpGxOlPhXXX0paxMbchyys735MatGGbMcdWGLjU7PgTCXIUI3wmA8ILbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknuhx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so635590785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053370; x=1764658170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMLdFutodWpWHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=;
        b=OG2xQuQim0xpPkmkN/QC5o4Twa3ppQCMlA6A+yWnUr+35bHZ95Rr0ZxnFdpVVH6CyA
         LY0X+1hGCswT3+mQeBGdjGpZxOQKso5VTJgxigj+p4Caet57hd9AFFNFcpOelU+mMezD
         5mX6T1J4JG3WzMfdNZZJDth7zORwL77S8Qz29MsfHKZcTb0mbKCPsNB+nAaLDfHSncAm
         muJTkf6WTp8x8RB4hJ7UViRudZDVnR6Nio8G208PMvuJSbYlqRjfVACsXsgKri7vxj8H
         0sacegtChnrjVgIB2N/JmzK8ntuz+XGC4+20ohJsH37XSoeVkiqhHZoWDBlcOoxZ7HmK
         B9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053370; x=1764658170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMLdFutodWpWHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=;
        b=c6wm/1qy8lDWzmUCX+7O0G0DoLWW42Pf+3bjAVBipxotK3YCW6feDnKcIO2qAE3iU/
         fhgWrZBBAYbO3OZ23XxVlFiu8E3J/yt+Y+dJtp7ql6vFmETVuakq5hJihDY0lkQkoALr
         OFeIP/mQOFK0SZMhBfSzFS+zu/O4EoQHhlJJieINGTol3J5u2XyRtg3TJExteRE2njQz
         Rb1On8Xfeu1LwasS6iAByHGEVHZhFtBJnRZBcv3F/idxz5J2dvjNE2WL3qbWCUmLy9zH
         pr8po8Cahw6LVlYXo6maszevUXHt85PnrKFWDs+cH1PTeS41505pd/UEHDc4gRDpYLL4
         t7QQ==
X-Gm-Message-State: AOJu0YzWX5lNtjVN48vaUrAuzWA3ZG2vwq0CtfL6zGMAkD53tCv//aIt
	ILPz2gz6ZHhGhhP9PIr3ug409wxOm3cA9WRE0yPVskViZMfDw9pyCG8a9NaK3szXhWCUo1z6E5C
	nn9vd1+THdDkodDwG/41H3a+EdpZbmaDxsl9pMwMnTEdeN1Lo+G0H0qE6fDRTzlk6YXrK
X-Gm-Gg: ASbGnctgx8tsoK4q3OCRq8/AJJzZUEmA3llKZzW7lteMA/JrfYjzl9p0prquIY1HPv6
	i0gVijWDH/JjSKVFRuJyKyHTPoGbPVP3ZEJo1Geee4EZoZEBO/cJi5pAkxhS1n/Ul/IEXWhwr+x
	aOdcl+hbnCbLTeg4YnDfeOKQSjScpw0JieKU7wxff396Pgnw3+h+C0ev6MRONCU4iwM8np6r/d/
	KtQUNrPAcjMgB0VryyxZTXeqqGrjgMDCTu+iPcWLFkBQcBx799V4LlFXfVgHs9A60aveuzDVbYa
	3R0bg6/tAaR0omx+forrAcEZHQ5zxELw6V7UP2JCDGvl53ZXyKsJnbxX0c4oq97SkcJE27IZJ4c
	89Yp+y0H8CbZwRNeUgoPB4ocZUQi5l6Yh0pzuKM3/evWFSNL1p1it1B9h5WvaiUnwuxiipoc=
X-Received: by 2002:a05:622a:1b8e:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4efbd8ca5d9mr22383911cf.14.1764053369615;
        Mon, 24 Nov 2025 22:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiWneXixXB3xjrJUwkHgPebGASZPAo0VwGDiJADDtvYnesA26C81fRxH8HLYpaCJG40TQhxg==
X-Received: by 2002:a05:622a:1b8e:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4efbd8ca5d9mr22383761cf.14.1764053369213;
        Mon, 24 Nov 2025 22:49:29 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:28 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 07/10] drm/msm/dsi: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:55 +0800
Message-Id: <20251125064758.7207-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TgjvD_9_uewBtps8wHZUjk7u-M3ajhV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX6i4n5FVQt77c
 FzrW2JxTQOo1S/69EwFmPjeyPFih4t3YTXTr713X4BdA+ApQwrRgID+EaH4noweDhg1zMfKVTCS
 z3Wzja3kR+uo8+KIrTjGThYnpaTUlNFC4E9DjEVTf9ziIAvKgGYPQ6xlZbDl63s8U9JV1AHNBgL
 kTL/itsrKkoFfm+VwKSlgbWmDvrlqAUCUW1bicw9hhSkwTQ3wTyssaSOkCA+V3G3dTgLpLjv70/
 yJb56OyvHrlrMcPY1RM65MqKvcxnQE9hWaONyc8rkaIJrlkUXAMw/OUZwCDulygZh9ckm9Ftdaw
 H3ALuNRmzJhyuvy85zZ1svj1FSfTxnEZI8twHJ6jvvhWQEYEBqsq2Gl1hq/zoV3to4fy9G1Vhwn
 xZ+Hkb/L6prFdjhUvkrsHgn8ATb7vQ==
X-Proofpoint-GUID: TgjvD_9_uewBtps8wHZUjk7u-M3ajhV3
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=6925517a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


