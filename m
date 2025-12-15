Return-Path: <linux-arm-msm+bounces-85204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E286CCBD028
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D16A3008FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00F832939C;
	Mon, 15 Dec 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHi/ZNsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNXshZWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54430DED5
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788040; cv=none; b=A9EcnRgLsLxhbfLU1yTOxUP7CaBobq0clVD9OkdPy5QGghSdscXny879A1Y9QX9O2/kEzaOiafvW1fB9RXUA78AvchLnyV8CZJKPKqBIlOGuhLlM6Rt7Iusk5KueR8t5IJA5RnXlAFV9YG8ztCWW2PJoJTtM5kdpGdDVWw2M8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788040; c=relaxed/simple;
	bh=R1VM8ltcS4jz1YsMqy5CD0qOT8l5O47c//W7Qyj7LUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M1MlZpWg7ZJa3chlAlRf9+qgaph+7Zlm50iRcJba9QTWU1U9KgWJ8lXfyxwhbRRyTUbibFkKa7I3hWXznKBx5Sdv8BsG0fWu6ZLE/ToDtH78rka9MAtBe1ks7mqFRiLoXUEO6ER//f1wx++86kZcJJ10AtNTni49GfSyVDP8j6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHi/ZNsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNXshZWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEMQQwc3530889
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2OMfokriNEm
	V3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=; b=IHi/ZNsRuNRV6uzb5NbGEGoGzEI
	Z5ixEVnBTRJ2k2xyiFMbAv/5ZK8n1wFRWq/anDqcZGTq8axSCDYdG7uvv2GlDC/I
	2Bi3zwEWtc0MTzq5r1BKJgtjQmDqa9kyONYLdZntkhtobj41g9d/TMAWWtZ66LQI
	b1A267gEouKQ9tXnAsypiKtqTYU9Got30OAUMucCpp253PJqVeUYQG7PlG9Qp7mP
	7KjiYMTMGHLoRG5okShcokgSgdQ7K8jmCmdGnvbouOFfo5JfVuFeuKkSV9V+1XkC
	CDZA4iA1s5D7ImrzS09HAqjEYWvBygY8dafZYkdI098ACZN8imva/3Kb+Dg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11avkqfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so65937851cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788037; x=1766392837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OMfokriNEmV3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=;
        b=dNXshZWkghUBAQZcRVSCfHQTm7KOYcQrioochaa7Bsx7ZnSQrjiGgjzY1Ue7IcyykG
         UjtHpd2wSaKpBJmUXfU6LIXUUy9Vet3s0sGhjxDzPlPTqk/lZclmFsd2C0D0fhrvvQ9a
         1SAa6lGQbBOXFjK/b50ckXXDPUUwezK8Lvf/+NvQpYE2K4xGxdNwozhzUEgNZ8vjIb9u
         GijIXgiI5CaQRGKElXLTdCHLT2SUWeVFkqMg3CbVBrB9Hl8D4EU1al8YkDrJr1/YK0VV
         o5Rh/kAmPJ6K5i6PzP2NhZUjaF5aHGGI1fa9n+szu8T4RyBkzvgD1aAAlwDSBdeUl5Hf
         F5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788037; x=1766392837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OMfokriNEmV3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=;
        b=eZpCbss+58BbMX/u5FruDzECezU11g+AunnKZU0hMEPT16LKAcSlCU7IAU7CO5Y7NU
         VMsFfhkVK6Vfpt0lZJ0OsdrRGSCrjk/z5oTChk7qoKvocWCJhVfkXGyMDRpztJ/016eY
         vYqpeZ/jfmKLgyyA9L3w9vM4tsOGkoQvnDsQx+xaZvQDD817qc4Jzv3ACLGwcJ4xteV2
         lsi81EDyosXrZ0IH/sKP6WJjvzKOm79xujx/LaPzkQYHoa/sOjmw6KWxnp5dNXswD+f/
         Fi1ilsTY+PAd3RUtBc0OI4FrIYA8Rrwjr3bCkEsETDTwzir+13vN6/D3ESJtkVHgf+hx
         8OlA==
X-Gm-Message-State: AOJu0YxhbEI8q83D5z/1jvnpIY09Tg4+DtPnjWCOnXABZDhm7YF/bXhu
	On2Umo1fmFA9PPbtj1m0TsUJRHwO3sZ9tQDJJd+YTMqz7AcPPZJWUcHwwzR6/mcQNTiNS9v32jI
	hFXJSNvJd/xHy/GAGLlACYz9gzF9ycyKfwUgLsYDJHeYeXhFMrsr4vW7OW9pafuxmeUd1
X-Gm-Gg: AY/fxX6sHUzgBOWkTeY/79YUF04RbaCzHdQSMom53oWapeayT+J6VX8adqjCmTSMffN
	KfS/sYmBY/sB2feyIlLA+LFi/ZOVrAaLtmVOvp4OCb1Ui0nGoavjspGZ8klLSqCSd/1XTPxIpdQ
	E/9I6cUL+qKbOUanjiE2epruU8nmbvFcuZUFPO8jWmi4aeuwm8u0tfGRajh5jD0eKGSIDt8JYzb
	MeUA7DCF/arPtbKlRYU6VNdA5vJm9gknsgblD6Gy5pGG24bh9hEjeLTMha0SyZ+YYgiXNiannDw
	VYRvf3KYYoY+42r/37L1+OhwUQ+rzZF0f1s8c+7nQvl/S9UAMBPjIqMyQcK6x5NpZMxXKFjX1CC
	nXxrkHfCQ6TCprixHlDeHeVvtYe3DPRDuPSAWVkTcJjQSapApET693oBsAqcgOezigno=
X-Received: by 2002:ac8:5a49:0:b0:4f1:8bfd:bdc0 with SMTP id d75a77b69052e-4f1bfe6f7fbmr194668491cf.39.1765788036887;
        Mon, 15 Dec 2025 00:40:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFquCbinPDhAbYXnGkJ0wvZmDim1bIk7PfXYefiaPKtBfDyxhsk5phSVASo5dAYZ5Kl8RU5Tw==
X-Received: by 2002:ac8:5a49:0:b0:4f1:8bfd:bdc0 with SMTP id d75a77b69052e-4f1bfe6f7fbmr194668261cf.39.1765788036482;
        Mon, 15 Dec 2025 00:40:36 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:36 -0800 (PST)
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
Subject: [PATCH v3 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:49 +0800
Message-Id: <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX/I7ikD/45z92
 fYj2NflpVC0z4ycFavps2NXWUXWG10/hMr8lzDLXZbNkujcaCENqPby+55pCGlrDbA+ZBmYNiCr
 5sN4SmLbzJwbkU9UH4nHByA3zN0DbsIzAr2f+eA/GlcPhbDlQ/zlvyeZYMWOA6icWQ2H70uGj/c
 rX6Tk+Z8b4xzIuHwegHoDnXkqcaBJWN4LLqAnWvo7VVvv8vMh91vkmW8P7Tn8NCp1RMzRsL7Ktz
 VUkXOHbNVq2LG4eVkeNPY+09auO4/wMb2uDh68vvafIpJhk2nCUobBXu3xH9LC8do4FLUuc8ji2
 P5mEO8C6ic3zrWjL0vGlJF4si0qMHR0oXY7CLbGLaVwkwC4fed4djCRiBQzrCD3JsfkD7m7PRRP
 Ip2q/0BW7EnIjnBDYgV4LmqGGlF+vw==
X-Proofpoint-GUID: NeDLNsPuf8J1WTXbkzQwWVAwLlJE-z6K
X-Authority-Analysis: v=2.4 cv=PJQCOPqC c=1 sm=1 tr=0 ts=693fc985 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: NeDLNsPuf8J1WTXbkzQwWVAwLlJE-z6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650, However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7937266de1d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8650_cfgs },
 	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
 	  .data = &dsi_phy_3nm_8750_cfgs },
+	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_kaanapali_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..c01784ca38ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c5e1d2016bcc..8cb0db3a9880 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1504,3 +1504,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x9ac1000, 0x9ac4000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1


