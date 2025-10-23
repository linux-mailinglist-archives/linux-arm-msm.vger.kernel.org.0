Return-Path: <linux-arm-msm+bounces-78470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E45BFFBA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFEDE3A80D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3362DE70C;
	Thu, 23 Oct 2025 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCqh9su+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA92DC78C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206108; cv=none; b=oJJMYS0r1bRl18NrG9EXEgQuux3u8fNPuOHKbDticdFr4RY5IG8MmWOFaCH7EKt0K+40C6U+Pq5u1TXxQLjTa5fyhmfYCf9CbmDA/LcoULyrHxqGUKl2Lx3n5xm6gQ6UeBiSx4bH7mhawtVpdCZdFUghG7VPEAJI+PJO7zjrS7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206108; c=relaxed/simple;
	bh=dLQWeX36WOw1tGMGQWa7Z/3xkwcHtkl603TdrHkHt/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jTsKTLBM0I4owDPY5wRTnLR9yuY6maSGiy5kSriLyErBkaCS/otKWQnVrKgAgZRnYjurwms6vYJJjtBNIj56uzYoJaAy6AsToN7W8Xnj+i0y07pMu2H8q4QeVzU4JAK4cCy3PTO1IyiOP9kI7e5jMkVzWubPEG0L6lUGGEZ++Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCqh9su+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7GdKP025827
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hxn7ShIYBtn
	ywIoj5z7bF8woB+YQ7/3kOpn9agNkuO0=; b=UCqh9su+0S8vwPc2G3kzO6ABdEI
	zGLJGtTbs6TcQjhPdV99Td6N6bWhLg8qCAWg3Jzi2E+eYAf420vl5e8xoQlQnxxJ
	IN0iTZr1SWzsSxjmh1/Ro+7TgiXgng3H0RUag+C34IO8/33lD0dedWxqt8Fk3WjK
	DxvcPZyi6tFE2iilFJ5vPW6IWKt5tsCpXuQ+WVOmD+8prh5Lpp2tHbjfHExuuR1s
	jhBwFrU24+A8em7FaumQVDbcxn5xuqF5C32HGrkPHKwVIF+k/02KnkCekIcOhCfd
	sv1XknS6jGMVIOs+s+QGY96+OHSpHB2U054ncfd3POAiEQysDkr0Ds1DmKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfb5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:55:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eca7298d9so14611995ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 00:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206104; x=1761810904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxn7ShIYBtnywIoj5z7bF8woB+YQ7/3kOpn9agNkuO0=;
        b=pIIsg4naUgIXZyBoUNnILt0dmDlWPpG5c4ndHR3nR30dJMnKMaoSwuGltF1xzWzN4y
         1UnwftLky7+Hcs0tNYHEin801NqqumrO6zHZOeZsRL5jiIlLVTeCKwZqMEZ4bSPGXRk9
         HXNqNFGE1bSGvWmUkOjGlq7LCizyIWJkVcQe+Cl7G8r9HQfCvrjw5gkcKL6TzumXpcf3
         snPOpf0vi2U1AQ3KoNAG6I2/qCPy4Cmd01rybjHYBkdSq5izeE7DHOh2ZzUrLMDyxZAB
         91B2YCCX4NN+BjzKJvOGe77TvCA73eKbwTOLqYoMcUEAV6RdMsWtKzIfjvyB1YtiWg8R
         k4Ug==
X-Gm-Message-State: AOJu0YyoUowTTYb+xV3761AphMfguUo80dS9zJMP1p37DC9TeihKp+s/
	/TUiB4tQHZP7epK/64JeQHsvlTVHaUjStqfCwxmy6tGF0CbtNLFYmATRfWsLH7n/DQ+wrjR3FFy
	X6lAlJ8wAiUe51P/YEiMTZKpKkW6zr/AkYecEF1cyh4s0VTmusoUovrUrnoZIdMos0N0N
X-Gm-Gg: ASbGncuqR9NhDfQLXiaJb5PkTX1kwF1gGOEh65wotsGdbvCAVzQ1XK2kF7Oye+i+p9A
	2X0K0GJKjx+lfV/NSzBuDgUe+1eNp2J76iO6KFJvUUkSSsSnrJJnslRzIHWxE2g+fwjrWmI7Yi6
	t9SLElahiwYlmAxVtkUuolr1Qt7aCgDbcy6tRqrypqWnwB3PwLiBrYib14uEV9fLjn9yXhK2p+U
	h2YTfnae3AvscszfPTRaqtzbWDXZQNUMzSKvL/4qnpGB4n5aKTYrd/LhasTiGw8kgGk2gV0enhP
	Sab2Lmc7XSVlXLYAXOzr2lQixewwoIFNR1u56sdZyJHm6U80o3fTr9uOcjSS4t5Inbzde0AsdNG
	fdECuK0xt4HAtlOrj5fL7/NPlXXLW4kMadyeedyOZLm3X2upVZg==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr298783805ad.12.1761206104359;
        Thu, 23 Oct 2025 00:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbPua/PqYedRnSX1LyIiA33Ruaseb4k4MVB5/62weZo4u2AYpakMUmfxzI5Qq0e4u2523ZLA==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr298783445ad.12.1761206103942;
        Thu, 23 Oct 2025 00:55:03 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:55:03 -0700 (PDT)
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
Subject: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:50 +0800
Message-Id: <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZA533VWLqiFrgdn7ZHksQwmvt-fHuXAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX443xg/uKK3hD
 Xdy2eg5LTbV6UGXNh6lNpV2YQGv6Dp+Aea1M8M2SHBiVtc5gufzkP9ywAfJrmKZBKM/ADExMq/d
 OTvq1yjJ1MBqoKduDZHgUrwFPzsFuNz1aZ3gk/LKs5grz8fkjbjNZj+XFd5qH3YnirFYGgz099D
 1hYCS+rrmE4sUJJIoKtAxougdAcSfZD0EwE+EPtMB/zFT6c80kBQVmZ9FJEoDJgLj8J2ebuo/XG
 OkuFP+ldRt+D0JNfj4CfPJsJsFYe2Meh5DMIuU9hChBebsnlLtgDhBvXYQ2wbtCCiOypkPPkYmY
 zBA0cbzJ2yn4U99eLd2MAVFIp76zqdm5/9noBMLIyu6UMQWeQhrf5GjL1mjUD4WsLiSfrtB2CDB
 kMggXjqJ4EoC0QcZfLUS8LFYz65hKg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9df59 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=B1tu1MuE3RNTBmX3WhkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZA533VWLqiFrgdn7ZHksQwmvt-fHuXAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
index e391505fdaf0..8df37ea50f92 100644
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
index 32f06edd21a9..93e53fb8b4fa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1518,3 +1518,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
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
+	.io_start = { 0x9ac1000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1


