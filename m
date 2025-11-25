Return-Path: <linux-arm-msm+bounces-83172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC999C8391A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB7C3B0277
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16E32F8BD9;
	Tue, 25 Nov 2025 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nGru6I3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVCeGBty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E22EBB83
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053364; cv=none; b=ZWC9NF71xJtkp+hwlu5wRILer4nlQJes3e7CwSMkGBdf95lEgjK+TMEKrAmlz91Wq1qO8s1NZIr37lTQ20BVFarKIYbuvoo2G03/LjCwSlfA8rwNFYpuXYtY1OXCRM/BtzeheNIQPiTMkNrVHbUZbvo1OovgeFo1ao2ckrm0D+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053364; c=relaxed/simple;
	bh=vuUrrskU23wX33PjpqTBcL/IP1cl943DrlpkwCNd+WE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JU/6lM8WGe4GQ6sGzz1uKvN5AnB8D6+KYmJd2DKRKZXE235L/8w++StFEaNnUco61qCK81iZzihQBARO3/9f4CDTVAv2BLqbYHakRTkLQdnGywaQQw4dtARGkmMOMbtoZTHN+XhB7xkvGvxCq499KcbSEimWnG970KQ+Vy6ATGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nGru6I3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVCeGBty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gwBr1979250
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mTEpnqQDbzn
	otcGF0MdKYZhvxCR/jGVEFQI5zYSrPmA=; b=nGru6I3eZC4Kcyl6h6QAt5wjHNE
	p54D/D6y+YCW+milCaEbwqgSkbm5emB1ToEVha66h0J3d5C47xMcRadiuKI5aq7F
	17g5V3LcFsMGQVphlPRLd1KJ6FdRIwUtbfMa2wbOPM3e3nD8EBd21tCR/exefokk
	KD5s4ZZ4qfHXSqkpaaZyWQVYvbvg22xxzRuEsq/1mSzQtW7q2DJ2oUCrSDNA5rA3
	VZNAAsfRP84O7IepjIGTxO6PfG/WCBPcnJkvJAjtsPcHjAWE/rjXnso7KJdxy3Zs
	331vKNQ4Yr6svyaXhvmEtuZGXCTep3Us0zNCIb8Y+GrRqUPCTyaSZW7JPVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gsjhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1d8f56e24so1470783885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053361; x=1764658161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTEpnqQDbznotcGF0MdKYZhvxCR/jGVEFQI5zYSrPmA=;
        b=gVCeGBtyAoiGlmhu/lJ/McuKX4nhfAQdeWdUwbsuSZj5RzhlZpGsvFspz8pEe84y+f
         EAIsywJKcFNM9mXlpcREEBq9FXywhedvSoWHXvcLxgTq7dHd9lo/Lii68xQY4YkAvk06
         1tEz3vm/KOPvK2/ci/Pe4sPhEGs8BlQKdVlHsyky0ILZvv+NuURhKw4qoqISsOw3kdTU
         50Ui96OpInFHrLE6kYmz8zX8r9aHBEmuhKSPas5FFvhmBeHU4b/rA8h5RIZ2vARloZLS
         EnavcdR6Y5uigf1H3SRu0g3Isl2uZsQlU1ucgLUgSCqVYLnRp5BdNFiCVScOuozztjIV
         OePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053361; x=1764658161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mTEpnqQDbznotcGF0MdKYZhvxCR/jGVEFQI5zYSrPmA=;
        b=XizsM7Rg8s7r8uXyNXUyo9W6ws7l2ks0qOmJRzyKV9Yp1AIs2Kuw84jenPfrBL5Q4Z
         ebgxqDNzkGvKR/QxOOFwDJ+GZuGWmG0OR5WZDhnkuCdxZLxCjsF8qSVxWZJHIxh/LVjh
         pCxlO8Et8nJshNNphwt4tHYbmJfjiHUibY0cPAtENs4SMGkcjn5zNYuoxz0h4RpBA7ts
         5mwB3XICBS/V6KsPOqNFZtl/r27L+jSzKGJYVmE/u8kwyQqvgdu4j11AxnNfrGhj9/M5
         L2F6NKP/ydb3riQKJROBYx6rsADV2PXgpgkMwT9VpFY02/auDGJW7pCjHV8yw+1OnI+E
         tmmw==
X-Gm-Message-State: AOJu0Yx2UVKK4MLJc9FJPwjM21D0hgI3NeYDJPLACVY/doFT90/wnO87
	pnwNrNHeWFKGBzyS0SIkWv0CspmMbHM6oZGyEIx6jWkjopLFHY6aY6efpKYKNOtlS8R0Rx9USeH
	ZoCSNYw2ePOf/4MDduEJQTV2R/AQXf+caD+tEY+THri0ffBgotn9VVehcqVHxMnHRWkOY
X-Gm-Gg: ASbGncvjBFMVVA9FfpFSpbGZi7nGNMV7plvAF9bAkwZhWFgpH5KmiKaLzAmQOBPpYUf
	QEz89D3b9ThcK6svhKWINILVA+nE77b5OZYoKANG9jXfuS4jsGot5jTaKOmBRk5NSORvrAiAJT4
	ybiTFXV78YPGJy24is7MmpVFYXgGrTB+6Tn08/MMZHdk3HnM64QLasQTk8IPyDsJ/H7u/E+DnY4
	yl3F2ArU3V4ylD1tbgCSO87N7Fb1sCbHVzOLkhWD0UiWwEcd19HP6A4MZ0foDwC8p2ukVVrMOi9
	YNR2S3iAvcj1GjARXGk/bpb/YLfwkMpQxMpe/FLr3pjo25Hwr7zoukL0bsXEPUQlNBvpTiLoSIL
	gZgoyp9SxuhgsXOnSO8IM3JjKB+70pHBrES+ee3hhNHQp/3W4YTmAKvD47A/201fgk/OsYhU=
X-Received: by 2002:a05:622a:118b:b0:4ee:9b1:e32 with SMTP id d75a77b69052e-4efbd90ca3cmr25013181cf.12.1764053361333;
        Mon, 24 Nov 2025 22:49:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGplJtM6PIhFpmRcTZ2wr4latOAgppymuITWXHdQsTlNhCo4gWclBzktAKtg0xrwFlPEesmIg==
X-Received: by 2002:a05:622a:118b:b0:4ee:9b1:e32 with SMTP id d75a77b69052e-4efbd90ca3cmr25012451cf.12.1764053359837;
        Mon, 24 Nov 2025 22:49:19 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:19 -0800 (PST)
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 06/10] drm/msm/dsi/phy: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:54 +0800
Message-Id: <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX+zZAy7uzhvdS
 OAvvQzZP0l4k5DWFsnGhehSgvakggtDPpCPqM2nOQJUjRG2EYhPyvATshNz7fT0PmCamBi+sM4D
 fdUNfIeknHT3stwLbTt08KnoDhhr+xOaI5vvcUtEn/KgcLyj37zEO7iY3KwD8BAJe6IVoEkg/n5
 4Qn9BE8sNBIVBmZyPp3kfALSWxj5ziRbRf9JpCh+Zi4oqPFYFJaaJEKIi8IaqRBocWb1lWceKOf
 wffbZlxTT/YNXCAi7TIZqdfrww/5x6cTpO/RepnQFK0Pel3rfWiuMcVAQC6jR7w8WYs53hU5TYy
 LzTjZ8EP6+RR+D56aW0EgqDn08MpVH/PrsAGANWVQu4eqZhqcjftIgm9mQArJkRZzsaBWRZH35S
 MJxDk8IFmHWS+6vI6PMyT/mmdc/xKQ==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=69255171 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4SYG6VfcyXRMG78uu_4nSZKuQEJpQtol
X-Proofpoint-GUID: 4SYG6VfcyXRMG78uu_4nSZKuQEJpQtol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650, However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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


