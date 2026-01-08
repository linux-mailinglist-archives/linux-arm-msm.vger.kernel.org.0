Return-Path: <linux-arm-msm+bounces-88030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF64D03D89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE00D3030657
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8CF37E31F;
	Thu,  8 Jan 2026 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXpqs16A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlPTG4Uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58F3587CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862708; cv=none; b=Q8rUoQRIth/qFzjQQbDu9dUW8N+1qKrfBKzbvqdgP+4vkF/xJf2QoWmtTxiYLZWq3od0IjYR9tII8xhz2lxhA8HPjEBYJMuOKMAF3QZLlAZX6B/m4d3wB3e462B1/rLqAInwos4/keqBtyR7KqcpXAyBY24W/CDzJb+zffdmZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862708; c=relaxed/simple;
	bh=GPNHdwwPQhx6RHo0jHkO62FjrR7S3TzTSqPLz/MSGkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=neayDEZCqChb88nP4SSX933Hthoq573UDCpyJUPsAFuv6eDZQ7xyHR5dCdhsoqkN4jHMrtKW/6V+fw444NDqwcEHYeIESICYPyuO5xgob1BAUS7e6fYup3OgySYXpXcofj6LqEILndEwd/6mYfF1V5upLKDAz5KReKGjE2ufgK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXpqs16A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlPTG4Uk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6083tZ2G2593276
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FQG5BqsGnCi
	ZEwc/eMkHo/ya5niea9nDglgo72tq9vo=; b=GXpqs16ArlQM6ExhDe7TB9Mow9X
	JzBm1MTIQBIsiJVONT69vJMSgllTdw9dtrrYUuvP37HjXD1IEhcpvArbfKjvY5Kf
	2sq503cV2I9EomIC4Q034KPtWi2lR1DQUdWzLVg+KzY+9mOvvOVMM/5aphfHGJ5s
	BmpX1+ilFKdUGlvHzIvIJ9iGhLAXc/WJ4TF5lxZDMpG9ivvUQYpZsB1OYPEPKRHX
	FlUZKz34x8ChAsWfHqlEemgR+UF7KNwBe0Qo47bno/MaD0esXJAL8An05C/Z9W/m
	+Vi5aI+pEktOax9mT9Y4ZvcquTg40ydIuaTIj/dkRoqCpepfC7OmlRWUx1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29416p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:58:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso707958785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862695; x=1768467495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
        b=VlPTG4UkM4FeEInb0Vg9/Fzoo1bdKczTWBk5OrWZIjv39htTzHmHbxgsVZYDDgHH2h
         BuycLHaAYlY3TMjzO/luZstSsLWuJNHuMpCE2Kz95UQn2H4sx4w8pP4vph9qdVnb6HaW
         BC8hpuLvi8SoNP2xNEZfcd+drpLuH96jTvKpRU1cmK3UJwkne6GqZO8Xh46iwl/JdMZP
         K9d/VgDcBl3KwMsb6XI3dGOPQGlz8oGPLvc8TY/+ssOdt7LqL5SiPgB6gJ1EfKuUXVnX
         KzuPy7TCh/vbTwYCWli2gskap71+TSVgirMkiXzBwq1wvr7/HYT+h5OaGuRZQlt2+I73
         6KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862695; x=1768467495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
        b=fT1gw9JrBmFlJzV99UkPdJUExN2seu35wVTwhojiMdIUjp19zWFW7lantzF1xMPIse
         6aH3o/ZHAeivWnYTxy2gdwcnC8WZKC0S9Lhrzk/rVLPi45A9kGfWfjp2IfYe2FM+c5pT
         Ix8/dCHNBwNemuH7wPJosGk/AtHr7H39wSA8oBA3aJJaPmvQxUSgmxVCvcNv7wvRfflL
         8XXW0iTFwyFt2ImF99gzChSdk5sC8s2E8UzcrYGqGE/Pvn4vm4ODmOvpVrhNS2zDjznX
         6kMhkdZoBaj2wmsJTHqp0f6nf3IYCGiAZgqdDtMNTn9z5wcMKUYmQ9Ceb0dW0Mhhm4Ii
         /Zmw==
X-Gm-Message-State: AOJu0YwoJpXeKrtXKt7qJNm+u4CX20NPXW12yxBcDKFFvknqPfk5bwJj
	9CYcYJd7XHDXaAd/g3wAd+w97ItIIDYX0nqaE6hxdTRMEG/hQuir0ol430grBEyIaK9wfE1SJU5
	f1blgNp6GIHZjlpkxcYpsJ0Aa5kay1iDKyser50kEQFwd8KoyyzyG2z8DSGB9OFdMovpVm81XfH
	FF
X-Gm-Gg: AY/fxX7REFkYQeaMSG5XiJeSD7AY7dK0b8u33nxj5NbH4SbzmOLtoX4fnaq635S/qvy
	wCJBZnTDoMIDhQ3PUHFicKMtDsP3luKEWNhoG4gUtlqBjP66xyb+Y2PbdT3p1L3Hzzf60dpeGZH
	FcS782++m/Ds0pauSbNjkWz8BDOr/PRuvyrl6a/5BZUSipjYsdZbXeMFYadlyy4oZl62U+N29ru
	I5YtQomJC6onFpukUfUYaTW5cokMqLTDPCzz8/MrN0k2YqjBlDrU3p7AxKvUvFe0MFPXe8uHDFj
	sthF+l7VrPtkiVBbT0sgS/ohvhqro4ZkQDaBg5t4eCyX6n/mYO3El+CRaPuYT9H6wQNpsEOvE63
	cxmSJU76NlIlOxX2E1ghE7W6s/F1Q5aDj4gtKb5whxzyO/BrGHrcgy3r4aNMZchnTT3Q=
X-Received: by 2002:a05:620a:28c4:b0:8be:6592:f823 with SMTP id af79cd13be357-8c3893853ffmr707781085a.20.1767862695119;
        Thu, 08 Jan 2026 00:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE1l+9FTOJ+Z9xJMvA2OgwRV2jSHqoYIgGuLFFOfrr4dq2w6v3q/Wl47LjzyQVU7zH3mMFhA==
X-Received: by 2002:a05:620a:28c4:b0:8be:6592:f823 with SMTP id af79cd13be357-8c3893853ffmr707778285a.20.1767862694611;
        Thu, 08 Jan 2026 00:58:14 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:14 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 06/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:53 +0800
Message-Id: <20260108085659.790-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jxGg_znI8JzO5L3cap8b1X2giqIyE6uM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX/gFuGC5sY1/h
 trTN+waXbciS4hf9YfLxxJ4jp8SIdr+Jz3Y0QItTDftkpEhdZPNVsyPA8b2H5+4ZL5Zr6YYl888
 QWyIdO7Ksb8Sw2O7YzmKlniVoZqVZfSVPeAhv6SQAzvhETiHAD+gb8SOovJ8q3mKvA+alkt5uWf
 CpKS7omafTy1TVE29fhRSe1rEnO1MVePouVQ1eCm3r0UMVrattUuljodtJP9gdPxrm9c3SHGdrn
 9/sihog1F0eKGIFRtHFGUAgUgNLScdm8QFR3AOgG5HXRFKF6S5xjC+zan7/UmQxF5A84pdYzBsZ
 3wKmsLY5i8HrPB139VkRx6qd7DnPFCiu+CEz/sHaXlT9O1xskpK/W6bpU+43Y7KT0rzqZ1nEQ5b
 /QaACszlLpTGA/QFpFXlO1Mho/Oik13MImJyJw6upN1zBqgIt4Q5h5osV2+IEfhgpBrdTbmPi2O
 StT+fFh2z+bhZvICgfQ==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f71a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: jxGg_znI8JzO5L3cap8b1X2giqIyE6uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, Kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650. However, based on the
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


