Return-Path: <linux-arm-msm+bounces-83176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6202C8393B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABF0A4E863B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6645B2FDC30;
	Tue, 25 Nov 2025 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etfBD5+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVdGDhi5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FEF2EACF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053401; cv=none; b=I75c6TPHQAOTJHo23tN3ccbqWTnj3QuwRgenhdU4M1HuYDx/OFiG1R7T7qRh2fumU+PhwuPctsBmmUdif5v3QzwlZwxvaQOCvufUvDuN7ijqaH2GQf/y+U8IBRlfnJEvla+Rz8avkv4ULcaQN0ZxqnZwfMbeaASKlPkJQexGHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053401; c=relaxed/simple;
	bh=TNDq8mkLMSVU3Da1mrHQxKNiCXtWYOQqjgOYB21tllM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oCpBiNocTYNscbkBB+W1aNv87HJqnuUBWdlwH54nxiQyabGLRE2Buv4z+2fsEPPcTJLBTUIVYeAituuk32S+x72Zl7Is2eykQP85V1DBpkOBJFoL0o1s7o6IEU/nsRipdmqd79nyMkpVRNX9n0Z7cs+8+sDQCldCc0z3gR0Z2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etfBD5+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVdGDhi5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2h5eL1232791
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XxK3gfAsvNp
	9xX3RxeJTwwOUyerwBQHdHbIQLFQrL8Q=; b=etfBD5+5HCI9U7Be72roBIf1P4y
	SZfKmbtYXWEFUmvkxIaQ/a5ydYgsTD7fbBmjqBaNXL2pSLa3jJCMnJMDlcHFat7e
	970EDE4kmi7dW/eLFbZ6ezaA3BNo9GfsXggeaZ6CGj1ycLplcrZ1ccfC1IzYL5Fu
	TrGhoG0N6y7ZvnP8ry+HIPcFzTXAnHokED9sIGgiNM6zKY5Wn/Gx4e2hagRcpGeE
	TJKL/G9n8XL0ziEKJqlTgF5dZfv3JTWdmPWedhu3JC6dufsySRCggQI+gWYJnjnI
	5N5VJ7mV0gLDab3VAYY12XbTUDYZvdn2BzY+o6LDxPGN/BNzxtH3o4ONY+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyh37n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so50079151cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053397; x=1764658197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxK3gfAsvNp9xX3RxeJTwwOUyerwBQHdHbIQLFQrL8Q=;
        b=jVdGDhi5rmSlplYJ/viS7/BgMdAx4o0pU72Wz6inYxw2pIIyV3H9DxbFO4j8pKLs6p
         Ju56B5jR8/FLnRxT8pFxBtgAMa5/KqPl6U61B8/LxQbJQhU9AASdooVKPPfFE26pTjHo
         LTcNbIxiUFdzDEuIGkqz4nh7FhK2l/PdReHYVheBmFUUoJ8+mHU6+NoYbOwhDKuSI0Wp
         dkckqTMxWELnz5r560kv5pyOelcp54DhnXnImuSSAA2ipw0H1o5Kjt1XIoQdULjPFJxu
         SaP0pXuMAt7Wb/s4QEKsccEBdak4AUgsrzJrCcB9sAMTxDxzhFLyjUKtyo6B/5uuhtGI
         jGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053397; x=1764658197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxK3gfAsvNp9xX3RxeJTwwOUyerwBQHdHbIQLFQrL8Q=;
        b=vFFtRecdJ3fpDtJXajRtS63TtgbExgANyALyCGV/aWoGtP4cn/+mJ13B3Ivcd25F4p
         wPSJRwxhrUfCCuvHoycS9upw93dV0S7jP2ywTj0xbxpgFPKmacrUCjFUhTPk+idhUPQz
         IanJLoQa76dIvU/qotrydffyG4pAMFdCsrAIKGrr1vYBjstllUKfl37mY9mEENAU/kXk
         VI9FzEoBq8OP2dzPCNuaYuYU+3EOmzgEXZQcPHKjZ+UOisHpsebwoLGwwbWsnukwJP5Z
         v7Jm5gIwD2J2hxmx3eYL21acg9NSq1I0hQf9CcpN5lDiPDBCUno1aTiFa38tkilB489N
         eYdg==
X-Gm-Message-State: AOJu0Yzhvo0IhCzYqO4vN2q/ju5BtNN956ydOc8PEUvUffKzNHZbBpz6
	zfsbtZzwrUJ9kUZ6/mAXmW0cl5V+AF2nnjTsjbUH7+5hoVqGUoSFfR3KFkz8MgR1Bm2M2Qj8mL6
	MnzwqG2Z7I/NUncGdk2Z6xGy8qgJcettht7N6to5pioahxwiNHPEI7giGOTvLJKSnRx7s
X-Gm-Gg: ASbGnctd1NSh6XAIOmc/6eCwA5gcoyRmLdQNzbskdJ6+LAzvtjTNUvXGm5r9cfSCgJ0
	ZHLOxg2t36RtznjOSYqzCbSZqdovRH2EPTjXWoB2XlU9Ojo1w8T2ndSXvZxZ4SjpbwtWWvTWhu8
	SNr84R0RlNFipL148HZsFhuC+01xFBJCO1uWwT4aJIFBpskPvcnX75XPD7QiTBGEL7o2Re6ne/h
	2TW/TjgItmiTrJbnNDt820JGvaU1kO8PVweH+TQ3OK3V6ysz/wUK1n6sExz/W/1bZp9NC5t6YnJ
	0CRUmQoSQ4Sat/mBMbY76BlJAJeGWBmBpI1UuYoRl/IPrrdHiS5HFNeoFpovgAGJ/m0yIWszzEE
	KWwfpV71H4uRZFSknTeOtD7IXYRrP3uSV3YBQI/LUlQhC9NQhuyExDmFiz/jD8+NxIRbmgEQ=
X-Received: by 2002:a05:622a:19a4:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4efbda9015fmr21240711cf.40.1764053396888;
        Mon, 24 Nov 2025 22:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGX45VGw51UkNg2dhBcwFHvisr394hJNXjtMaVqPVKQtS9cNj7et3kANkvVHWgmGE8kyjz1g==
X-Received: by 2002:a05:622a:19a4:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4efbda9015fmr21240561cf.40.1764053396355;
        Mon, 24 Nov 2025 22:49:56 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:55 -0800 (PST)
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
Subject: [PATCH v2 10/10] drm/msm/dpu: Add support for Kaanapali DPU
Date: Tue, 25 Nov 2025 14:47:58 +0800
Message-Id: <20251125064758.7207-11-yuanjie.yang@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69255196 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iVC9QAuiRl3Xz_40r_EA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX6+qy5SSzDRvG
 zQuu/4WyoMNMcMp8AHWHNI/jUWKbwIXp6al56+qQHPsSBM62EZXpItyBO4XGLK/F0AM2SStUvmz
 ZCHxIUzfP1BDhM2a5Rr1xw5vxamfBjsSPLB2uH8bx8IXezr/MWd8+uO602P+TpF/YXCWSGLGx3r
 McZ+qIHu8ODNj0oun6PqtJT13a2X1sCoN28FtQZPzT4YfXWkKO1OarB5DnXj/cQ4LpHW9DMPFco
 djnFQV14NnkKyQxy84q3TwAFK9Avyhe8Aid1EJL8En4YYRbgyaLtavrvIq6rXFefc3e9DsuUmDl
 QPGncFc9h2Ztk5QiiaZPgBVkpZN9oe8XIeeke7zJuOiZQDOa97sBZ3pXTso19Nx9OJHUK0kx6hi
 Ki5ML2sM0H4NB3YBeSoCoEtShsZMqg==
X-Proofpoint-ORIG-GUID: 8Knlh5UGKhLBkFBsGrAX30BJZ2rB_tTE
X-Proofpoint-GUID: 8Knlh5UGKhLBkFBsGrAX30BJZ2rB_tTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add support for Display Processing Unit (DPU) version 13.0
on the Kaanapali platform. This version introduces changes
to the SSPP sub-block structure. Add common block and rectangle
blocks to accommodate these structural modifications for
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 535 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
new file mode 100644
index 000000000000..0b20401b04cf
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -0,0 +1,492 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DPU_13_0_KAANAPALI_H
+#define _DPU_13_0_KAANAPALI_H
+
+static const struct dpu_caps kaanapali_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 8192,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg kaanapali_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494,
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg kaanapali_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1f000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x20000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x21000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x22000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x23000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	}, {
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x24000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg kaanapali_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x2b000, .len = 0x84,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_5,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x34000, .len = 0x84,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_5,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_2", .id = SSPP_VIG2,
+		.base = 0x3d000, .len = 0x84,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_5,
+		.xin_id = 8,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_3", .id = SSPP_VIG3,
+		.base = 0x46000, .len = 0x84,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_5,
+		.xin_id = 12,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x97000, .len = 0x84,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0xa0000, .len = 0x84,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0xa9000, .len = 0x84,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_11", .id = SSPP_DMA3,
+		.base = 0xb2000, .len = 0x84,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_12", .id = SSPP_DMA4,
+		.base = 0xbb000, .len = 0x84,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 14,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_13", .id = SSPP_DMA5,
+		.base = 0xc4000, .len = 0x84,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 15,
+		.type = SSPP_TYPE_DMA,
+	},
+};
+
+static const struct dpu_lm_cfg kaanapali_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x103000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x10b000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x113000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x11b000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x123000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x12b000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	}, {
+		.name = "lm_6", .id = LM_6,
+		.base = 0x133000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_7,
+		.pingpong = PINGPONG_6,
+	}, {
+		.name = "lm_7", .id = LM_7,
+		.base = 0x13b000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_6,
+		.pingpong = PINGPONG_7,
+	},
+};
+
+static const struct dpu_dspp_cfg kaanapali_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x105000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x10d000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x115000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x11d000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg kaanapali_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x108000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x110000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x118000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x120000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_4", .id = PINGPONG_4,
+		.base = 0x128000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+	}, {
+		.name = "pingpong_5", .id = PINGPONG_5,
+		.base = 0x130000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+	}, {
+		.name = "pingpong_6", .id = PINGPONG_6,
+		.base = 0x138000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 20),
+	}, {
+		.name = "pingpong_7", .id = PINGPONG_7,
+		.base = 0x140000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 21),
+	}, {
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
+		.base = 0x169000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_4,
+	}, {
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
+		.base = 0x169400, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_4,
+	}, {
+		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
+		.base = 0x16a000, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_5,
+	}, {
+		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
+		.base = 0x16a400, .len = 0,
+		.sblk = &kaanapali_pp_sblk,
+		.merge_3d = MERGE_3D_5,
+	},
+};
+
+static const struct dpu_merge_3d_cfg kaanapali_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x163000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x164000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x165000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x166000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_4", .id = MERGE_3D_4,
+		.base = 0x169700, .len = 0x1c,
+	}, {
+		.name = "merge_3d_5", .id = MERGE_3D_5,
+		.base = 0x16a700, .len = 0x1c,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg kaanapali_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x181000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x181000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x183000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x183000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_2_0", .id = DSC_4,
+		.base = 0x185000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_2_1", .id = DSC_5,
+		.base = 0x185000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_3_0", .id = DSC_6,
+		.base = 0x187000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_3_1", .id = DSC_7,
+		.base = 0x187000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	},
+};
+
+static const struct dpu_wb_cfg kaanapali_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x16e000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_cwb_cfg kaanapali_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x169200, .len = 0x20,
+	},
+	{
+		.name = "cwb_1", .id = CWB_1,
+		.base = 0x169600, .len = 0x20,
+	},
+	{
+		.name = "cwb_2", .id = CWB_2,
+		.base = 0x16a200, .len = 0x20,
+	},
+	{
+		.name = "cwb_3", .id = CWB_3,
+		.base = 0x16a600, .len = 0x20,
+	},
+};
+
+static const struct dpu_intf_cfg kaanapali_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x18d000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x18e000, .len = 0x4bc,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x18f000, .len = 0x4bc,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x190000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	},
+};
+
+static const struct dpu_perf_cfg kaanapali_perf_data = {
+	.max_bw_low = 21400000,
+	.max_bw_high = 30200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	.danger_lut_tbl = {0x0ffff, 0x0ffff, 0x0},
+	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(kaanapali_qos_linear),
+		.entries = kaanapali_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(kaanapali_qos_macrotile),
+		.entries = kaanapali_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version kaanapali_mdss_ver = {
+	.core_major_ver = 13,
+	.core_minor_ver = 0,
+};
+
+const struct dpu_mdss_cfg dpu_kaanapali_cfg = {
+	.mdss_ver = &kaanapali_mdss_ver,
+	.caps = &kaanapali_dpu_caps,
+	.mdp = &kaanapali_mdp,
+	.cdm = &dpu_cdm_13_x,
+	.ctl_count = ARRAY_SIZE(kaanapali_ctl),
+	.ctl = kaanapali_ctl,
+	.sspp_count = ARRAY_SIZE(kaanapali_sspp),
+	.sspp = kaanapali_sspp,
+	.mixer_count = ARRAY_SIZE(kaanapali_lm),
+	.mixer = kaanapali_lm,
+	.dspp_count = ARRAY_SIZE(kaanapali_dspp),
+	.dspp = kaanapali_dspp,
+	.pingpong_count = ARRAY_SIZE(kaanapali_pp),
+	.pingpong = kaanapali_pp,
+	.dsc_count = ARRAY_SIZE(kaanapali_dsc),
+	.dsc = kaanapali_dsc,
+	.merge_3d_count = ARRAY_SIZE(kaanapali_merge_3d),
+	.merge_3d = kaanapali_merge_3d,
+	.wb_count = ARRAY_SIZE(kaanapali_wb),
+	.wb = kaanapali_wb,
+	.cwb_count = ARRAY_SIZE(kaanapali_cwb),
+	.cwb = sm8650_cwb,
+	.intf_count = ARRAY_SIZE(kaanapali_intf),
+	.intf = kaanapali_intf,
+	.vbif_count = ARRAY_SIZE(sm8650_vbif),
+	.vbif = sm8650_vbif,
+	.perf = &kaanapali_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23bb39b471b7..be3492df8bde 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -241,6 +241,23 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.rotation_cfg = NULL, \
 	}
 
+/* kaanapali SSPP common configuration */
+#define _VIG_SBLK_REC0_REC1(scaler_ver) \
+	{ \
+	.sspp_rec0_blk = {.name = "sspp_rec0", \
+		.base = 0x1000, .len = 0x180,},	\
+	.csc_blk = {.name = "csc", \
+		.base = 0x1800, .len = 0x100,}, \
+	.scaler_blk = {.name = "scaler", \
+		.version = scaler_ver, \
+		.base = 0x2000, .len = 0xec,}, \
+	.sspp_rec1_blk = {.name = "sspp_rec1", \
+		.base = 0x3000, .len = 0x180,},	\
+	.format_list = plane_formats_yuv, \
+	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.rotation_cfg = NULL, \
+	}
+
 #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
 	.scaler_blk = {.name = "scaler", \
@@ -329,6 +346,9 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_4 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 4));
 
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_5 =
+				_VIG_SBLK_REC0_REC1(SSPP_SCALER_VER(3, 5));
+
 static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
 
 static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
@@ -412,6 +432,11 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.len = 0x20, .version = 0x20000},
 };
 
+static const struct dpu_pingpong_sub_blks kaanapali_pp_sblk = {
+	.dither = {.name = "dither", .base = 0xc0,
+	.len = 0x40, .version = 0x30000},
+};
+
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
@@ -452,6 +477,13 @@ static const struct dpu_cdm_cfg dpu_cdm_5_x = {
 	.base = 0x79200,
 };
 
+static const struct dpu_cdm_cfg dpu_cdm_13_x = {
+	.name = "cdm_0",
+	.id = CDM_0,
+	.len = 0x240,
+	.base = 0x19e000,
+};
+
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
@@ -639,6 +671,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
 	{.fl = 0, .lut = 0x0011222222335777},
 };
 
+static const struct dpu_qos_lut_entry kaanapali_qos_linear[] = {
+	{.fl = 0, .lut = 0x0011223344556666},
+};
+
 static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
 	{.fl = 0, .lut = 0x0011223445566777 },
 };
@@ -668,6 +704,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
 	{.fl = 0, .lut = 0x0011223344556677},
 };
 
+static const struct dpu_qos_lut_entry kaanapali_qos_macrotile[] = {
+	{.fl = 0, .lut = 0x0011223344556666},
+};
+
 static const struct dpu_qos_lut_entry sc8180x_qos_macrotile[] = {
 	{.fl = 10, .lut = 0x0000000344556677},
 };
@@ -727,3 +767,4 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_10_0_sm8650.h"
 #include "catalog/dpu_12_0_sm8750.h"
 #include "catalog/dpu_12_2_glymur.h"
+#include "catalog/dpu_13_0_kaanapali.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c996b08076a9..7c53490c6c83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -775,6 +775,7 @@ struct dpu_mdss_cfg {
 };
 
 extern const struct dpu_mdss_cfg dpu_glymur_cfg;
+extern const struct dpu_mdss_cfg dpu_kaanapali_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f4c9767c418d..0623f1dbed97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1506,6 +1506,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,glymur-dpu", .data = &dpu_glymur_cfg, },
+	{ .compatible = "qcom,kaanapali-dpu", .data = &dpu_kaanapali_cfg, },
 	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
 	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
-- 
2.34.1


