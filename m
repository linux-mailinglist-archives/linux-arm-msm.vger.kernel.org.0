Return-Path: <linux-arm-msm+bounces-85205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 712BDCBD037
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38373301B82C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07188313E38;
	Mon, 15 Dec 2025 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdLNK5jD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NC4Rk5FZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3AF30E0E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788048; cv=none; b=K9rm+dX5FVAcGVRzspkV031ydV26VnVTjn6jo+Jn0byxIQ3Unk6EvGw0QdvoEFoQcsxd4Z5t858zYOB/M0XwXn/RmrXsex6u7zWDmYPmSApqqtWwFhu9Ae8LwZ1t7DPeQCaL1HXQcvqgDseEGDCp8RaEyCQQeV+bZUK5k7X+fq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788048; c=relaxed/simple;
	bh=eYqbCgFTx7pO2+x0Rgwk8N2aIIU8O+9nShTeQC9NPWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ycr5OgtOxXaNUCbThIb9cO5PGg6UVXVMsXHVueNKjDWoMqmuOIdvkFtxFlmoXP2aDebdPiM7oXpl4leB8pWIMNCvN3x3+S2TIHov/TW5v6cQpSxp5ZDRyU0IlNXT6lHC0NXe8+Xcmz/70p3JOWopHVNiv0iumDi19o0FivS+D6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdLNK5jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NC4Rk5FZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8UIlE2608256
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
	8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=cdLNK5jDp8TBB7djLkAZ6HtFZoW
	WTej2mBmm7t8tW9Je6HRuT8zUzvjjl/E1dCsS+jz1SL8gSIVj+LBa2gF/tFSzOnn
	gnKYLsH7/g+1ybTm/TQyHPdboHESWBt3nz+LVX2rh+yJXq9lCscolQxx+Rus6neD
	4GQ/HItzF9rWj+WdhnLzSHXZmyiIfe6vXtpoSmOUR3QQJIX1nPgIk7tmvPTE3SPq
	iBXBCRec+Cr7zO56HMJHb6pBYnHiVh3DYmaDCnDnJkPHS5APwMbzxjGEiarLw3ua
	QCWXir820zTOKa0IHrdXwJKQzq/T3QDgYULHlDUvFaRi6SKCxO3ZuUl68+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6ku5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee21a0d326so33108401cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788045; x=1766392845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=NC4Rk5FZwnUPz1HZAJW1JO5uvQfeeLwiKszcxD1dATnidiwO2qDCy2GmMaNQqhehKZ
         k/cWnkNH6kibuElk0sgRjksxLgvhw/8M0tMl48DSCL3DOdPJ1Daf8rBDytvNaEWGiUUn
         vPPit19RhRq6V6svea5hW/wjLgVGFG2Ne4zHOgPS61QDjrwsPlSK4D3cPGNGW2pVVFX4
         hjCY+JSa6/AIPBkNyvTkx5wBmkn6jH0rP7lFL42LlHJULv5LKMu9AQJtlMl05srwUKpG
         BK2wNrOA2/zuBvnls35WxJrW6okO0wCgEejQcXL7ddri/BzWKhaXfK+llUMDpN800M6g
         Vqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788045; x=1766392845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=mfnm+wkTSPE/yZwyYyajEBANVAOpOvEn5eOlAke6iFFSXpIebNh6M8Hi2W2NuMG8S5
         zUOyfKuKa1TRaZlMJ7RG56y3/a6rF0ldNY+S49IZjcPpvERfICoCJjrv/RW2s1N8iW5Y
         S9U9+cdH9uO8ACb65ziU64kwRNiRQi/fvsxdA4BSq5DOgk3dFTEuL6K/w2QnlhbzMjpY
         Bes9u42yfCWkAvdLzFhrJr1dv2XFvWe/JkT6rUWUfoEdtQVlQgc5jSKQsnz+1Ab/TJsE
         eSMFkSEUMr/Bm2gJmENP/rteWXYIms1Qsoqh3bqZpheNUhmws9BpZL+b9mpGDi+9X/dM
         JikQ==
X-Gm-Message-State: AOJu0YyN/s6KZrMD25y6LazzpJGsAJo++SVyGd0HOGGIZz3gscZDZG1z
	CGKqPlavV/oNv7mXIeANGBI/DVQtcjRb6eJAaR6FxWaWfxkA9usdrNli0yUXCr0Mdu32uprlk/u
	L6sfsOBCX/kY/gjkld76qHi57M/yVOK9agh0r5AriCUb2i6+rPwyguOvpVJR+C6Y2FRig
X-Gm-Gg: AY/fxX5N7xM7pOIbKRSDEZU2EWoj2P+RD2r7yyHzSWzNYP39xtL8S08chjHYJ7bEobq
	SZPQ8s9CTPvW5w02uGSIKRtCh+16asm6K9L++BDLP49S87GyogRsM+RbO8TQWnxspkt3PtclPrz
	ykfKsmL26NTZNspaShHUTWa8bAeG1/MFKoFNz6yLihu6CyyjW4LNmAg8/etLF7/dQbeE3vnVWxg
	HLJgPC3KOXDxDA3a6+OiwAfmhi/q9iyuYHwT/N5Hmm1PteWCnvJxwSIKYC5rOrUjisCC+Q9UGo8
	OZ3yJGGicv8FV3N3TYXCuqJBzRKFSSnuprRqyVg93DFOd/8UYL6IGUuLRxnyJNNfApdyqORPUP2
	fxtzAlJjasP5qboBbb2hB3blXwKF0mVA0E9zkEng3PRpjTC6g8VhGXzRayWvOufvhn+I=
X-Received: by 2002:a05:622a:1791:b0:4e6:ebe3:9403 with SMTP id d75a77b69052e-4f1d059d261mr122345821cf.41.1765788045679;
        Mon, 15 Dec 2025 00:40:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkrFIAQoibBowZ+hZ+Nx8U5gIQEDXi5Q9OFXQj88z4ksCGjc3LaNGlfwA9GNy8uOY0+1Glhg==
X-Received: by 2002:a05:622a:1791:b0:4e6:ebe3:9403 with SMTP id d75a77b69052e-4f1d059d261mr122345531cf.41.1765788045177;
        Mon, 15 Dec 2025 00:40:45 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:44 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 07/11] drm/msm/dsi: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:50 +0800
Message-Id: <20251215083854.577-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fc98e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: R-hWoOosKCR-VPSJuofwolrhuHsIYY6T
X-Proofpoint-GUID: R-hWoOosKCR-VPSJuofwolrhuHsIYY6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX7/FhBzh/Ix8V
 gS6eWBjKrdar9PZlPY8WMcmpnMr9nab7QO+doNqYQXbjIIXbT/GEZUa7+os7WVEmEkM3y0bafF2
 Gnr720x5sZxut44gz0yw7QcBnxVhffQc+Jd0Yzhbe/x8xvBXfztxoPsQjynORgjAwgYFGJyWlnx
 kYCYr3rJjXkCknHMi+yVW4oZ3PPD343+0gj8LnoVKXKpOGLhLAXprN+ypb4Y6DOYYyo2aKHrBRJ
 Mm7rI4kX/LxJCQQNHiw63VOkbCECsDmvWvbpkimqiAQhbIT2dITB0Dg4qXRouZLj6uiBONu/ahW
 3NEp3oFBUaOFG9eniiK1MhnEYZHZatnzAp0y3L3D7JfzRypIljwzZmUVH2oxj9FS4lhYrAJmbJB
 jyI+jvl6g+XKkmwMuavTTHNEAqEqSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072

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


