Return-Path: <linux-arm-msm+bounces-89180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E78D23AD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C15330606EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296E235F8BA;
	Thu, 15 Jan 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDTgE2AD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnAGSoLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2535BDCA
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469347; cv=none; b=Mrs9QpYdShMuJ9elH1olHU72uwN+f555Qr5nBsVTuWbrtS5Yu6eV261a6SehE3833BkX4IZ6VmcnEMMu+PLz+wpdtIxfK2BgzEwgYpdbqPWvjPN4ritPDxWYCCYAxi+e7SM18vp0oQi/8NxSMh7210lh1u+tqLmnX95c43maHXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469347; c=relaxed/simple;
	bh=eYqbCgFTx7pO2+x0Rgwk8N2aIIU8O+9nShTeQC9NPWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ihuAio85GZnYCTVh2lu0l49cm7oEd+GbOLaYmCcaa6JSc4pzWh5nCnBcW3xy29syL8w0PUdQN4vsG0uAP3kWKbiUtJC/cYH1GJZAkGA/Mk+7m9R2pfcOH4rl50VBbDswW71a376USM/9Yc2JFY6WJ6oopFBLZnSf3PZ0Mq9+Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDTgE2AD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OnAGSoLP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6flwk1850927
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
	8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=UDTgE2ADHhAYkSlFuJ00p+0Eam9
	NdoLZ9G8OwlM8PJ6BGKIqKLCKKIdA9gFPH4Oh0gfQ+9pgBkfRnJc7mVN98BfDd1X
	L3vUDcUpEz4sBgQrh9qNEeUiUEcz0b6H1VJS+C9x2m7xbDN5KERD9fnjLebgwMyC
	Yfulohv5RYLoQNeOXj5iR3+PEqNB0wTDNyZEla9+k6cVd1+i7xiOBmGO3sX9Ezfz
	QZ0owESgCF7x0XbURD9JXOAGOqdJmmk0NyvoDIjtCa+JKLBcNm7VMTfa3D/0kkFq
	cVT7WwZEZFvPvrChROEBSqAts+rxRAl1rG2jBFTsKRWMpwP+Cueo4zQSGkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej0wbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50145d24ffcso22815781cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469344; x=1769074144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=OnAGSoLPRFMcGCIlGNTGnzOc0ocSE7JESloX1Qc1hSpXbCVdGe9bqXEzyFyT/5sA+9
         2T+D/TFWAW2zOSQQuvJFIP/kCmkDNFsoGRU/B+JPrgH6bGJujbhgFt9avlvfKVQUpo2O
         QZ2TMM7K/g06Dr8XNJe5XCVNRu+wYzByLUNzjovLyAd/vLTAvicRVT/CcNH4USbJsbtq
         mWV4CMAwCBVnlrEL/WyoIr6oQwMOF7hQrFhvyJylrkvlu4q5TUAvnf7GOHyo5/7XLKQv
         ixuSL1rj8Usnurh+REafR6uTOrWS/WNICeqiprhZum1dHxyLkQIvMNQ1ynVvrVg0Lhfx
         Ey8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469344; x=1769074144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
        b=YWWS4aCZ5zNeEijIWId22vklEv+v77FI/bqVqXuc/eR4ZjfYJ1cNFCnSOOntJyiCQ3
         05CmSW/INYVqm2jcBP2Z/O0RGkZWO6WIweqsosSigc8xidnocSGQSSB5LXrn4CxlHGYk
         b3K9fKwnR5fsWlKUGPbaLGEsJW7bNNyHn1IXitx+twoc25R82BvXUxSrGEkT7E4xj9L4
         OuLzjB50TVbFzPY0fFu1s7pA2VECN52mcIscTwxfALLj4f2nna7IDKnkhPdF4Y4s5rjl
         EBL7bFJ+Ac4lxoG8zrU6muztuw5hHJnBx2lLbpJ734FYHfyCQG4rUYLRj30NuvCiw0qM
         x5hA==
X-Gm-Message-State: AOJu0YybYG1d0i6bLuIguPGBrq1jGwMNoX+e70r839B5I6QoGWxMgRIb
	teMXlgVF8nmy97VPc2ziRQdNQVCbDivhhnTX29umMaFQqWz4ZwqwU82G7be98PDXvp3HQjupvUA
	Xib0Fu3XIAY4hkjpvC4H4buZrQyGXEBI+olRg9CwdR/JhFE/Zbl6fdHw0TTxZsDpuugAJ
X-Gm-Gg: AY/fxX4Y+wetKt1ZD6CFwyuZEpyfu94lti+wEHDJUfL/ZHSyCMJ+uY7G+KPdZ/nlziX
	1VDY7VL4+5MqLQ5CXgKUFdukSnqXkuUNXoE1LSb3sBsHXoU9EwndhjtFij4OKKICQskP874uiHg
	a4Rs84C39Fk3Y65r+IeyVl13pNdNb5yeQovbgwPW8gGz6JnIA4wD4y3MhxXQwYJgTicn3L41/D2
	ATYxfeUeMKL6tBOczVzuqzzMHosQsV8qy06MT8vdE3ipzX6ApZOfOlgmCiRx4J5eVIecJFCi67o
	IWPWTpO0pmV9Y2ptJbTnsNaULtU8vX/ViZ59ILgUV1pTBOqT7EDg6HEk3YI5tnnMsJSB2PO1CIa
	NawVbNS5XoaOjOX6yor93wXe2kW+XfE42oyToEruYGBrcD7ju5oRtSUu7obifP/i8wCg=
X-Received: by 2002:a05:622a:1993:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-5019f906e27mr36433901cf.35.1768469344076;
        Thu, 15 Jan 2026 01:29:04 -0800 (PST)
X-Received: by 2002:a05:622a:1993:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-5019f906e27mr36433651cf.35.1768469343680;
        Thu, 15 Jan 2026 01:29:03 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:29:03 -0800 (PST)
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
Subject: [PATCH v6 07/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:44 +0800
Message-Id: <20260115092749.533-8-yuanjie.yang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfXxxw6LyG+mpbF
 tCromNfnOUrCRv0xfJlcO6mPBEqdOwP7zbUSPpI36Ja6nuWO/11IMA/hNZ0xf0z9TzzwqlWSzTV
 urjWfgOu+x8toUf1gJE6Qfno/AxgibWZMsFlGBkh8buZioelp4AxZqntL7M5y/ko3SQlvGZej1v
 1OIyAXPqo7GDiidKJwQbA08yEGd+drjlLdakW1DanE7MUeJxv8yHSZafZ21rEarpM8zCwJB0pfS
 73NWNRoD5lVYIEAP2MgrAuP7kCgYjwzd1TtR2Oipy2yioedK9XWpd+uSoTULtCNfVBIXJANZdFG
 dBqzCjZ+Y2MLLZeiiwqvmCYT7bCLqGxp9GmdAG7ag0Lmuagg23iQWinShYAmj+86oVz5Rx3XLhY
 NJQ+iYM1o/UXPtb4WG0JzGkFLT72RS9VfjbhaOAr8yUCl8747yHHvJMvWTsWmBI0amEwCnCf9ny
 TTpbxihz73kSYi5LdRQ==
X-Proofpoint-ORIG-GUID: pIJLf-Vs_iTh8CnKESb4zcmlvERzShpX
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968b361 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pIJLf-Vs_iTh8CnKESb4zcmlvERzShpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

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


