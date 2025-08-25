Return-Path: <linux-arm-msm+bounces-70687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74AB34358
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999C3482F86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3721B2FCC1E;
	Mon, 25 Aug 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dezX248K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ABE2FCBED
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131458; cv=none; b=fJLEwDl/sCUlXXaRLNZW6I4TSIShFpwMKx5t6uQzVRDG08LMkxNkbvnDUCYMEPccQPhPJQrYW26iu9bxZQh4H3+SY+qkfFqqmSdoPcX3yS97ZseCnFxGoTc7U+6x/xPtAXqMyNBRIHbBWFM0FNDhFuz/uv6Ho3036TVBmcJLQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131458; c=relaxed/simple;
	bh=c96ZWM2YbGkHRur6wRdiO/jYHW4Vd3JzeA7uCSEtT40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQGb+sqxdTro8bVK8Le2KaYIzF24wr3soN6jJDT99El/fWrm3yPK7vWRf/IcGHhIQi5Kdfic3Icmyy+3vGb67aPymgocMkkgaOw15dT7lJcvkLY0xJMQ1GAyKCWYSyJyCiHxSg+YE/A0X+4RYDEyBw737G6P33xZVNEXu8AymkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dezX248K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8dHUF000562
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SE0gyMoB8H1CugyDSf0yuuJz5+xdbT3mnKETqrVtLJE=; b=dezX248KTCA8HBnZ
	k+1XoucYM9nNMkL0mTZDlkj234rYZWJdiHbQvaqqzxtKLhfyUWPpLm/0VKeEiNCl
	0bZf7vNVCMKE/obYAHL6JWAfg171ON2tJlFYPSIKIktLE15qGlSxulVUxFf+c7MA
	TiJhppipFBflXehXYu2B1ghesa1F5H3cWNpLP6AFoZE+9FNoPOXk7tI2SsUh3rcQ
	8dSnhQQom2xsSod+1p1n44+hxPXnD/vOtJq0HWHxz9vXMp1voV1Q9SncY+1c2P8C
	V8fhEEvaCnVhSxiPFhGLpI8lynUJcmZW25yeZOealxDGJsSKmA+RIia73j99Qen6
	y7h/7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5d7ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e8ae86ab3so4284976b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131454; x=1756736254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE0gyMoB8H1CugyDSf0yuuJz5+xdbT3mnKETqrVtLJE=;
        b=jeYrMWn9/WgCM274Fq4/FrkMfIxdiWQDT8AQjSzdui3B4ToFjHpoSFJe4pvEAoswDM
         TK/rboNvYzN4hD3WseVy7XfyWlJjKzXhlDXN07NGfKvEunGxD/v771fLn4jgNjaIg9Eg
         AeUf6jv3mvrEpQLGR0lYokVbL2YDJ+I7EnUO9ujmUoOhsSpWnyvvLTxCSsQXt0djxB7a
         SKYq4TxUFySlCPFfRjjE/FbbybrxPfMBTFxG/YrOusBp8rAtL+Z8wzfr5sgpCkfXozuI
         6pIYLGDFjXTtQNpgLi8cO38U5dvmmldsaJlxWz2NCgfJWja99m1eX9Z0l68IZH1eCFNh
         nBjw==
X-Gm-Message-State: AOJu0YzxcBGykWewg+HpNI3FY7fu3i8H++KQpTzym962GXi0tzCdXthk
	MrTpAGXnvNjzX1tROMbNJoDguymfzYcU3Gq6JhD+lvvblEPowOCYr7v+17kEaI4snheOKp7WPLt
	II+BOnMGWY8dG1wNI6TAZ+wsp45KU4o5pZ6jGIqQ4Naeziz2bA1UMHLvNFtCpKkAdiuVr
X-Gm-Gg: ASbGncsTLkuc8SEms3xu/OgdKS7HoPn/k3geZndysvSAEdyN4mxvNgbNTG17VCbn3X7
	6uK8dBpHu7ZBUZu/qWcDzxJupb7894zop7q/Ygf+LP9IZV47n5c1Vewuj363/Sn5iroiIZOSWjP
	ICR4D4xEKjqq6xzmU7M78voWDi+lh6CBcWodFp6WjCbsq/n/RCIzi2ghVkqBc7ag+wG+4VAVa2I
	02K2BUIjazWe4qrsR/g8sFClNe+J2qMSZKC8tAJGz5WFE58cLDaUMsBbMITQvJ2Kb0NKkdtFB82
	RA01lk7lOaOiweuNNscTWZGAO0R46kSQ1pbIWpoqtjHtOnitYERAIblMVA1hFy82hBgr4LM=
X-Received: by 2002:a05:6a00:1148:b0:770:343b:5457 with SMTP id d2e1a72fcca58-770343b5776mr12538560b3a.16.1756131453943;
        Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMy2R23VqH7KKGD0dAfeWxD+PQOsTGsim/ksuVooGj2cwAdBV6kfz9RNS/shNC+Cw70XbkDw==
X-Received: by 2002:a05:6a00:1148:b0:770:343b:5457 with SMTP id d2e1a72fcca58-770343b5776mr12538514b3a.16.1756131453406;
        Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:52 +0800
Subject: [PATCH v3 06/38] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=2040;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=c96ZWM2YbGkHRur6wRdiO/jYHW4Vd3JzeA7uCSEtT40=;
 b=7A1066X0KZACbntHPM+Jt/eD3ZsGYrvKe6zzDb5Z8KcJMssPlZjEANxf0jIuv1DUHGdJUBX6L
 K70v2S0HEELDa+s60FWY1wBPrH07gJDdKqrPryvvoisMjvel6HNe6/z
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX06l85hjZoKUO
 7jm2mr9Z8HKtT9oJXC8w31TM+BapVlVtN+OHifZTmiHEcmM4SU0d2oUAt7DHqncHM64Zd9aByFf
 atilIW5uowNyMLLIQaFxonsUFB8d+KqYPSSgLdng5+mYidmuHZmztRQS9dFD2z5/fTlE+sTHqkY
 NbjPPVvESfVcP1nWor9rtKZtFzQDvHg310woKdWwPVkoqzGQ3RpuSElszOYbEUeBWpMmACin6/2
 1YYB5pZrgriNVIzt5CVopYWw/chjXbFe6mqHUsWk3Jcs3P6Rxx8InpmzSewKIyFrYgVM9uFIasL
 +4ZAHlqQ0ZZXnW2V2tWh0iI1v0jCfUaDABRUoHgSVd/OXvdGiUYvjpptE1ppmRN3/OtJk6aXHuG
 Ta+e4oW9
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac707f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aoENilsEcffTQy9B1RkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: rIu8wfFkC122k7thrWeUj-twYMnwYKUE
X-Proofpoint-ORIG-GUID: rIu8wfFkC122k7thrWeUj-twYMnwYKUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

The MISC1_MISC0 register contains stream-specific configuration bits.
To improve code clarity and modularity, this patch refactors the related
code into a new helper function: msm_dp_ctrl_config_misc1_misc0().

This separation also prepares the codebase for future MST stream
programming support.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 45d6c9a7f7ddaa049443253cbf4c6fc5feda3177..6bfb639c1ebd33f1103c5b68dfb40701738fa267 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -447,13 +447,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 			ln_mapping);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
+					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
-
-	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
+		msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -467,6 +467,13 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+}
+
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+
+	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
 
 	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }

-- 
2.34.1


