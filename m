Return-Path: <linux-arm-msm+bounces-88031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3539D04381
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C817361F135
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC2637F107;
	Thu,  8 Jan 2026 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr+cDKz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3jX5XSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75A37E2EA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862714; cv=none; b=r0+lO0YMKsuo3b/tegwa2kFQALPQs0Q7Y0dUpMZntm3baAUNTBJwwJSXsfwrSbflk1FKcEAgAaJ40V5/EpqsDRiO3BFzpeXArW6VGEW/hef2TSJ6OthAP/tAKZjN1bchZQMpWlc0SNciHMwN6d8blsIgFTngyblITLpIawSomUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862714; c=relaxed/simple;
	bh=eYqbCgFTx7pO2+x0Rgwk8N2aIIU8O+9nShTeQC9NPWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VxW9YVO1prSBzjP/71WHyWxwL4uUY5Xa+90Bb4QPG9VUtw3Ozf2vgjFefR+qS3Mye90kglhodsVvV83fLSMavdRwunrB9ZnTXUXM2K3FJh/8LgGu9LniGKmjsV/mZPOJQehk11pJs2/clHN7SKgW4CBazXOeJAuh+ribwbxvyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr+cDKz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3jX5XSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084aBbh3751537
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
	8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=cr+cDKz/xSZUWk6B06N+mmY220k
	I2lAAwjoK/uUXw+OQdofauEx2KHJHLu2Ts2WBb5bRLTC1fFG0gZz4hZB4WkDReOR
	D8x+tCTnwpWVWH+gYuRC43tuxo5CT+zM12+z0+LipTab+0vGlxRd1zvVWmnhUi0z
	rWWRMMuME88sXlMuePPDaKVDUhcVGaHfAjMGWC1wf0YQWshm/nE8x8k7T9/PFW1V
	LQ2I51KG7tlQU3d9LQ+k3pM4hNf4baKJsQbqM5wtYX51QxFDSCZpN84Q8His4zbd
	ziVL1uQv+eWtSz4Btaj4e1MRtbZUzX5tzTGAkfjAYJuoe5QCKRI2h/95tnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctjm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:58:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c38129a433so735977385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862703; x=1768467503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=g3jX5XSp7kzHPyAeXLeON+YMQSdMRY4nnqfaawnhKbeXiXDja51mrwTZGPgj0EUvBQ
         MpOSnUQpTgAwwi1JPF4SfyYTlC3vZwVW6m7ffIj/sb3gToPl+KldPnzn/FmsvAaNlHkM
         0bLhHCQR+3tn66DR3OL+XuGAuI5NBGd4C6oXx54fCmXtBQBrBUYyuk98M6qJMdiIqhK9
         xLXDtrLEC8xgQ74KHHKK9PebsUgXusVHj1PXyfRqrx9U2berCFMKBJzHacgUwSU4o44t
         is21kKsbD6bIgXtrmA6bD4iW1PqvxsjXuXjh1aWJJEtaDRFkX/IHYLQSDbE/85jEgu/t
         cn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862703; x=1768467503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=Dj2ocbEuKDYsXA8eiTy8oq2FO1J9MgnVC1aHEn+DgWbb5a7kfcQXAfWt6ffF+GvLiH
         hfDV0YzTSaljJw2fM8IkGK3pQGLcHFaqE7IEdIntD+uxNLF5JLZJ8RyMjrj34wvD8h95
         jg1MCrwRV4NjubkzJmqUED3C1GAIRDxHtoeKa3x5ZFOvZR/wjzxXNk3SRemnHJyh/x9K
         6/6LclTSAPe/B4y+sDyLtq+eRrtvC6HAcC+GucuocWUhr2ABWcyjv+cEvVj12tXAfvWO
         9MY8u7CcKm25Uc8gMo4/0vs34w//JR7EWfITNWoIfqi4mjU7VRe7o7RubJaai84TjMkV
         1YOA==
X-Gm-Message-State: AOJu0Yz344EUU08unQjJCj2bKLm8iEAoteT7MV0hAh4nzwsCYnOlSHh4
	CyF8UFgJ9JoVV9bqkpeJ1LlM+LLWXkOcyKrH757Gj1wpE1hQ8aZCXQkrFqI7XVcNkC8tHrunbuh
	wq88dMdGhH+e14heR8iu08N2JCvwJVzvBH998FaXP/bHyEqaDg2UkJiX3knF/o6dY1YmT
X-Gm-Gg: AY/fxX4JVRip2RKC+CVxbsLV1k3dHvrr0kqxxXRGUPNYagJLDrnnuMDjduS6IsL6oun
	srbO1S5kruECyOReKRyg+f4pOYAmF0ePcskXWklXrbfsnbFwupKkmQaAGKaeASLUlpxpJIPrMEW
	4tkBu8XEZpc2EybkfytmeC+py6Ag0UJDZd3PqfBbi061BP0WkYltfooVyqTzCFz/XD3OPHyUi3S
	mY05Sva67Hm2PjdlWny4MHGoD7K/u1/iSnmDyfRo3qzJ7CzOY6Vno3X0HpSeywVmwv6MMcRszxv
	Ehi7CjIlSayFM9foxgriG26+cyaPgQxl3J23VQ/IneMmvhjIn+pWZy7r4YHBkSzVrq1YwYemrBb
	kInljEUI2Yqr6TWooxztAPBJxmMaEbxY42s1Uarlu/IZuVUyw8fE8tApzoJOy+CqMx+w=
X-Received: by 2002:a05:620a:1aa8:b0:8b2:664a:309b with SMTP id af79cd13be357-8c38941c034mr652183885a.84.1767862703423;
        Thu, 08 Jan 2026 00:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd2KU0rDWQ/R3b6xYRGG3myKrYnDS3p+KmuStEdvZ5CG3nEDqVpppZIpNi/G/SxwTUg47LCQ==
X-Received: by 2002:a05:620a:1aa8:b0:8b2:664a:309b with SMTP id af79cd13be357-8c38941c034mr652181685a.84.1767862703011;
        Thu, 08 Jan 2026 00:58:23 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:22 -0800 (PST)
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
Subject: [PATCH v5 07/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:54 +0800
Message-Id: <20260108085659.790-8-yuanjie.yang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX7kBez+nlRiVZ
 VBrzJN6DXRGtLvF7Bi8K/RKwZOVz4CJrIpu3eLm5N9C8RrgDebZchs+aWO8FoiEGiqTRWopPO2G
 ORYuoxiQYpQxcAVC4oc1oVCzbzv/fRPUyyvWCO3k5/WnbNAm17up/igsGzNZJz2RkiwG3yDDwiL
 KjM5/HUFYJM8nhfVDwBlZQp90s7htu2mFODlSO6M9zh31UTJsMC+pedGIBdzUkIO5hPXxcH/EsR
 H7FHUZ+8CoZo+1DSr1ggJHY5ielocPPukqpWKc6Cbn3F8s/XbngLkaqGNZePpGzLzMAh+/sh5Ai
 wdpLzbi7e5Dq6pH3w6oaVjrfCLfKQLnl25IAV2bXqA0GHtXxrS8pH+IV6x83aga606iZKxfRrW7
 VqRZ/fwdXixU41X7+Hus9s7rj7/zqrek7YXmacmSulhQSDa5tr5GF4Xpi1D7LZJIx8c0nk3qHTQ
 vMen+WGNy9UEdHUgNeA==
X-Proofpoint-ORIG-GUID: _AZ6mcK4rucyfCVorwDrU0LdziTeJIji
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f71b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _AZ6mcK4rucyfCVorwDrU0LdziTeJIji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

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


