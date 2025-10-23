Return-Path: <linux-arm-msm+bounces-78474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC72BFFBDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B52333A8974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1236F2E2840;
	Thu, 23 Oct 2025 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXHjepf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7322E172B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206141; cv=none; b=TAC0Z5kXGSOn3yd/9TcvaYcfu679pPHVlxe33FudaQUqFxeDDXOElRyhydFhyBLnByMsdY7IJPyblCCt6i+ByTNgBOSfOHRt0mdbTgpdtmizwFgr5UCautS1yqFCIX1oDpPlBzwGigZycRnp5sht28LDU9QhlbxMOf0aRX9U/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206141; c=relaxed/simple;
	bh=8rdmNQAo9Bd+9bAr+NPJwM1gYXFJ8g2yQPEWjrxSiZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DVHep5Pwte7sO6wQ4ofNF7QCbL9C7fJrj02b6fqDVR5/fFagDCyWaqJQ19aNfaJsjgK7X4WG6qsNQKUWC/oRjPTSlNw8fPnYRyQisYJ3cJ4+4fjRVaAmrExv719GnOl8zxxmk9+HOs2QunTsUG6SaIDxzMJ6spToeaEKkJe2NRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXHjepf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CXFV011737
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w2fC93DLUlG
	GbUXGQjHhV8DdpBbQi0xLHsTL8o67LJ4=; b=WXHjepf5MYu5cijtLVVBVnTLOW0
	byGMo+foJtSjR30FlSqtQli1zp9opvPqeV2Y4E4KXpRvOdiuB05i6KenLguS3Aam
	xdK8BY5Worl/S4qTrfpd56v3PzLukhHL++qUa+DMs8+uayfUwbcsCb2SOnymMHFo
	1+rGKCfp8+ofdFf8uGZXvrCFtvoA65Gt5sf7V172DEF3WWQGzwud9eoBgxJ4GfNJ
	5wM1mBfikEc6m70E5vFUvemDiGRxH/7BVMVD8FHcTeBasz2WEVoHZisveWNSHxv1
	CLIoTAtAp7aY4gCA9b4WDkD2lzC6tBMAdtzfDRVU6F3g3ao2ZDTHmdyrhXw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5249ps2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:55:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so580644a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 00:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206137; x=1761810937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2fC93DLUlGGbUXGQjHhV8DdpBbQi0xLHsTL8o67LJ4=;
        b=GtQfVmSuHqY59+nq+tnOayVVDqqUbMm5Z8Ppos6jZmZ4ybpsoPbwC3GkWLbuaBn8Oo
         mHDBUhPLFLlJ8f7qd76a0gMiyynhJjADdYjtc+AK/NAXmWHOh46ivvS9WvyKqygFr6gG
         coRDDqxvU6RMsC7MDzzdT7jdCbpOTu2uyb9r7Od356U//V0MI2e066XEkNSL/GF8dnjk
         NX/lO52mb2kjFl0bKjOAEFsv4vjuYQn2yZ6o61lbO0/LCtWT9VKrBotrL1MJrdwM6sB9
         YWrBHdbre/LmtJpgea9SHsrCFoMfAYnOkmvDI34lWDW1D3p2zFfQOPIMXDI+khinaCRD
         lUBg==
X-Gm-Message-State: AOJu0YwArVORA/XkFtAq+1N8WkrL/7V2Y6v5lrAZsjpbexTyLmMclW0h
	BzeUqyFOO8bosCjsDyPT3QLDB41MJv6pb57aX7AhWd3hl5n9CzVnBQWZcCMrZ071OSBDb+fnPAu
	PTldIf4lxj0X4Y4ToKTsuZtnI47eRB8Ebija5FU9EwEZfAC6o5eBF+T/pvSoSuRQPeaDC
X-Gm-Gg: ASbGncv0bDYaPQPjt9SRiy1l1aM2xlSmrCpc5I2TTNVnP5pvtgK8MKAowM2VM/zPjvO
	6mtsV4K7QiQR+X3kWJr4bWk3ETqDKoFmRnjZYUQX7wEfu9XfqB9IgFDATBa0vr2y8fmwN3dmd6c
	EFtBOQqCQ1CvD9J7bTAckJ8jA4Uu1YGBfTtGFsHeMsylqkOVskVvgPcuuBpIrMG6o3G0aFYetBW
	5s5X7dMcFgKRkEBRehXWJJu+VucEzgP6r1w3KoW7D5nRXc7KLKa4iPW9Y7YMP1vnvHThvNA7rOM
	pbVeBmE+R10odkidkVNXzY8HdVlclMcTNN81qMN8aWSx31R4bWwZqqSqqX1He1Hgu4j8Errlw0+
	M+Fex2tsVvFHLF2Rx4CFBEhqQBiozmFSYE0+PSt+JXx8JRGJYLw==
X-Received: by 2002:a17:903:2310:b0:28e:7841:d437 with SMTP id d9443c01a7336-290ca121206mr291270445ad.38.1761206137432;
        Thu, 23 Oct 2025 00:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH682hkGWt3dvBEItqoe9UCqS26mzJjNqbQjGPbVOBXOGQ063Q1XYvwVWIAZvw9Ki9Hjwp2hA==
X-Received: by 2002:a17:903:2310:b0:28e:7841:d437 with SMTP id d9443c01a7336-290ca121206mr291270225ad.38.1761206136943;
        Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 05/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:54 +0800
Message-Id: <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX1opF4eYHcT0T
 AjQamYhdJ5TlXIAmpPQcVLdedHxGmndoKc4K3Q8xO5zu8+ft8zDjYDX+BSaCBpbHAp7R2cprjyl
 0EK7VBd0BUty2jtxHvpK/F/3FBjWlv5UPCc8eYQ54sA+ZgnTN/TZcYLft6LUqg/J/kpG1LxXZmj
 1Fx2raObyAps+RlwPOueuAkM1lvJD2+fJTXHmEIAF5/6hjnN6XR0TVUjfMNvFiD59+tZnjPA6Ru
 LGOG3R8IsWKbhQKxASHa7h7jkOwNaWW8wPWSPCYq7EpTEnPrz5HTXScr1/oHa5DQZlO54CS3HPv
 nfryUQQS49hvHpiYTA9AzLiopu5xsE/QtUKNNdCoj7dCF6wFi50dy/dMmz8pZqjZDgY2yHzaDGn
 DounzX8xZWgrGHgU/V4gxnICdNC7hQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9df7a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EGddA7oXPexY6v9tJfMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: AWYaqONuWixHEB2Npls8jf0TqertHUT4
X-Proofpoint-ORIG-GUID: AWYaqONuWixHEB2Npls8jf0TqertHUT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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


