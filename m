Return-Path: <linux-arm-msm+bounces-89179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C79D23958
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4554030487AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C6B35F8D6;
	Thu, 15 Jan 2026 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSL54IrZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S77YNSEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6335F8CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469339; cv=none; b=N0sIKLtiAZrMp5hdKwGNn82mnynSaKOoyTV/YE+0Q2AH3Ef44Ndt/fQf+pbXNE7+kRfUKrZzl3tzKZ9EM/OUUuavEj57S9NBEdQCoSXEe2zpVKQgRMZWr9injJdYsTtQu1+qYguLo2nRFrDRQZ+WgRy4nZWy/2CIiSZjLzUpvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469339; c=relaxed/simple;
	bh=GPNHdwwPQhx6RHo0jHkO62FjrR7S3TzTSqPLz/MSGkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ad1LLvUKiqaa1S9gjL7bNuMljPynCWrnjP2P6QVNUDvximxValyLdrwS+Gyl2zRkWhMZvxAX+yG1kxub3wqTNhAueT7ZEb02YI2yStAgq6JbQgbhZytcoPSEk7BRnEkLyPO9sIIOotL6sGo28IW4PhQQsOK/G1DUR5akJqgEO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSL54IrZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S77YNSEV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gIIH1172623
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FQG5BqsGnCi
	ZEwc/eMkHo/ya5niea9nDglgo72tq9vo=; b=bSL54IrZ8IjgoL0hDzLC/tsFgeS
	U7Uv1gMuMaWXVV6W+ovoAUDnbTz37wC6Tz17xyxr+wA0NWvNIw6v8nAXthy/VqYy
	RcswOitxtZNMyMSHvm613gwSxYBDT+mBAocM39MR4sqJdLN5/XyYU7TgzEX+GUG4
	J8Hv5xvMBQFf4rMCersSjRosn5rI7TKmQIcqf69DS36Bj4Z13G7NvxerrNXsAZV3
	mvUkUaIHToHAtCEleFa1yDSjxH32lzp65wao3vfshP+KUici1P0qqbdkiJoAacIF
	3RaN0dFkS8BZ3QWzbW+bv8vlUFbHcWJfPFAe1buHuClyFDWZVwSMoi2nlUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ac91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-880501dcc67so25601736d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469336; x=1769074136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
        b=S77YNSEVKK54BS91LfGAQsYItfA900szwgrAtldps4iJ4jNgdzFpknSX8CApTp0cTc
         euzktJ53jjki0OUMBW44QiadJl+I6xC61RmCKdvM2Pg9jv671y/aKdT8sJ4ATTCt8UvW
         p+wq7s42zM+bfBd6XgoGY3pO/F7OE+DgvYZiD1FcEcCANifFLZmWt/CQxuygYAWNG7EX
         ZbH7rj/tbGJuHSPes6a2rFB/IvcZsYlBxyRhQxG8LGnFzKA0/A19XbF8/K70L3urJtPm
         kBOcgB16t/SjlsXkA+FkPogZuPi9TybBFpl6ZoQdmkylwRhT/XIgC1Sj6oRpdgiLlkLD
         zvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469336; x=1769074136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
        b=H0/QoSBghNxlQIlTYrfF/v69b9IRPaOwcgfCoIn62KgnfuJdHyTGK6YBFf2RYrqEgz
         Wbv8XPhCIQNgE+SYWlrYYGa5YK32QBYP+zPJASR6zHEph9RhZZ5SLjiZeKvS0uNwvk4z
         67vc9xkfkBy2NE+8JGU84WoBg9PqMyTMzTsHi5Ssuqquc74gbCrV+5mjRxpNZ2bCYvnr
         /NLxSYBSAkGjGst/TR/cml0FEJ0F3197QOL3LLpa9gqoEoRRR2IxR9YvlKm21a7oDimm
         6T76lSWG8QtkjAvG06cW3XseOsn3/D0jUiL5v2cHz2ggImNiIqUgBaWt18wqhZP1/FoU
         Yvmg==
X-Gm-Message-State: AOJu0YwkRYcjiWLt9gYfozBBJd/D440D961hgSQ/0LxD+FbYq3fu3UPs
	ryJRTG6dwlXXKOfKodNlOlIqicW7Fr05WgnVgUO6owMc9ThCpG4T8HVdK6Clj1bqbJjelIZi/g1
	k4hXDKGkkYD8BREPi5Aa26JgcE4WHNybtfwdfu6scPAtunjxp881WugKrn8nMNTAzO6ef
X-Gm-Gg: AY/fxX7edTaXJTM37ei93NyjprHc3d5bTMiGsA645VtGwj9Ekd51Hrc5GJNMR66eDac
	CEmU4X2sC9wFi4tf4qYGwDn3eWKwt+9PS155lmMOkoPk+tn0yCNSidnBr+FcptXnFrEdg8Ni/Pb
	Yxq7PZiVw7VKCp0f315V3o75xJ+x3gpEtTRha5N5n9HGv5Wera+XqFSl0JYtIoLvpv1WD5f/Vc5
	tZf2b4KjygH6gTGm+5icXneLtk3p5BBCAb+SJTdmD4fHhJfRSGdxpkSU30zkjTYn/FYEy+kziB/
	nflXxTHO2vjP4aGcxYbqgsjEdscdn0hQTokEGcW1aJUoX62LyDkV+YId/0pa7q0FjGnVhX/dmXB
	tF8hu6RwVHbxAYR5zNOROEdtfqinon+I4Y4gQY5DXFPXdpaVnXRSP/nKtoKq/uUnNcxQ=
X-Received: by 2002:a05:6214:1bc6:b0:882:4b1f:a812 with SMTP id 6a1803df08f44-892744503e1mr88982756d6.51.1768469335831;
        Thu, 15 Jan 2026 01:28:55 -0800 (PST)
X-Received: by 2002:a05:6214:1bc6:b0:882:4b1f:a812 with SMTP id 6a1803df08f44-892744503e1mr88982606d6.51.1768469335467;
        Thu, 15 Jan 2026 01:28:55 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:28:55 -0800 (PST)
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
Subject: [PATCH v6 06/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:43 +0800
Message-Id: <20260115092749.533-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX5z77AMYfmCeR
 cmGyg4BQ1YVN/ioGJAeEvH7Dl0YDtS3WHL5As1M5UMzzt6FolMMsZh9UWhDTWvcYjqLTSE1KC3O
 Jo8PW6D6B0F7dvNLIakT2sDxvYmX7cVP/DVj2uWEU38rjSJLsYIK0BdTOSnQaFi6G8XTONcQ4V0
 qDzmvTC14IgAGkjYdlip0OsRxtQuQU3k7fP6kBHCZr32r86/6KCRySSrIvHbvs97D7+mP1pfDd7
 S0YnvgigWSSrSSPLlIqQb73eyxFvuiPx/FnWrqZbc1ml8I/RK8IrR//w8ruCfPcKxuY7C/pLzor
 wHX8sEKjNY9TanZIPzUlIg42gSqK0oMMKZvy6vfAfrTVPk6p2YJZ1K6aBALdFOvq9XU7yr4hc5M
 kJl0NM7T3xi83qwGVE1cyhMUywZMWcwhjRIRP1AqRygghy1FJ2hAm8NjzG9sfoUu14MZvb/vZt1
 sKJjCaSzwktN+gnkxgg==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968b358 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 5p_uveNWYcQ27Iu9n-Q2MBytkxXAYDfU
X-Proofpoint-ORIG-GUID: 5p_uveNWYcQ27Iu9n-Q2MBytkxXAYDfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

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


