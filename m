Return-Path: <linux-arm-msm+bounces-106239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPKnGfsl/GkWMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:41:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B853C4E32DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A493303E49D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BFA330B32;
	Thu,  7 May 2026 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk00+noH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Em2z6wJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332CE32D43C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132353; cv=none; b=O1QlKTjP17q62GrEt42BCcnMyPz4qChKVs/FeKulZin/EeSPRlwNX/Gxuqys6d/J7Y87MelsTk69+pBBx7HFKK0cFIH/gYbfmcsGA3pUdeyspBrOa7M07BiozxkVz8nZin18hd1ukBTkPIClSJYqubPPli4CujhDm/zQszL3ywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132353; c=relaxed/simple;
	bh=wgVXCfHv9HFZOezc7cbXA1mOEQVApLKpcn+bcT51ksU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSWens7WCIRhJTTKNiktkjdE4I633RimIttKQ/NThNLDYHV0WNDi6rcHVeNOe7Hl2CWGscsNqsOh7BzKKxkcNmeUMOeWr58K/HHawBAGX7OmVDJrY5GlXDWvGzjzRzd+Ohn0xNgPiFQrKfMrxSD2huhZ5JMi0Hm8N547ZXmOIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk00+noH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Em2z6wJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475IlFe3924358
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=; b=hk00+noHmLJ+sqJD
	f78DRJum8/BTcJXy4Dfrjk8voyiLUXV9TA/Q7iYw73HZ/ng3yxSF1ZMu+ic3yAMj
	qlzbM1yrRP9djOVfmPqV5asHZVbCHV7mpGz+e7BMh87BXPoJ5PnZaLuU/cmbEp7m
	YPrfD51ZG+JtChxDbIrK57FD5SPg/IksrxBnHbk7zgjtiw4VlQ08btK5gkQ1MVLq
	tIoZc3uc17+iW/PyMQzYrlNH0g66TGXwTtbAecNXGl14yyZ/jCI7qW1nSGIWe9VP
	pVh8o1m9Qne5+kDQNdS3VzsX+W5uAqadCYepIFlAqBy5YN/ixaYYJMYQtrGRTFO+
	o1KUNw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c889kc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:39:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso304662b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132350; x=1778737150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=;
        b=Em2z6wJQ2Gwf+RYmgQ61L0T5wejiVDtHbHCowgfGa/qdd3IxcfpdfyhC4XIIffmiS3
         CsnFwOPWkB5Sc42bA0tAC9wDRvKnISGYOXTWYr+mppu3teThqlFTirtCakjuChC+K/sq
         Tsunuuqd676GcrrudgATh5GisTKM1q8ndrxXpLZ30g2BGMeTL+L4+7qwXsd32ufLc7HP
         jMQExTVc+bG/W0NKPEpCr4nail4HuZv8aNKvTqaXQqb8Cg6Q58GUoaSM11JeY0kELEfB
         OitEvYiBCQi1Xu+0qbVtlaLpl0LCQKHmHOoxKdD/Gi8v/p16y5ZhOSvBQfhdjSMhxU2F
         ulMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132350; x=1778737150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=;
        b=Hn2vUnObw56Tw74E35/22PcOIP1W0xo3tQRd6pzf9MVVpnJruPbghCiSGH29Uou1ok
         Q2BMHGLfcmFhqvSIxYQLR1BRlKrrRgUS8VAUXTgPZfY2I6723h7hjQBZeItPRUa8IJV4
         I9+eIq5r7aKMKTJpH7eXRf9cKsZaTOkYPHbjMo4DEkRsUGS6vZcm3FtFQI2aNXdH6y/5
         ny9RAb8+t49etukSrA8rTvhlVBvS/GMsImG/KomPxv/nwSwcmDsRJ4pZfNWLtOrdSpnW
         lkAZ6da3tdOcvr7aWTYu4sZBmYAR4UsDNaJ2MUI2xqH0u6fA0leOPKANQk+e/6wlJj0s
         7oBg==
X-Gm-Message-State: AOJu0YwbsRVGMvWvwYuuFOCjewgCF2DNgUqM16DcFTos91+TFNHgGJh6
	O8B7DNY9jc1yAdf/BQi7rw5paa+P2BG6WAfEVDmBmEl/ZoPy6KPqJowS3lXQNKln3Q6oCnTqH10
	0Uj8UXmnxBvpy6eedqyjJE3jENMv0BbzG1ORa7D8SD4Z3fqTVPOQ+IDjPKGvfPZkdmNGc
X-Gm-Gg: AeBDievwhEf3wHRVWGm1W+VcWgdJ+El7bNrzQ7LF1u/VBW36tpq0waNowNlZDGOx9Ni
	tAmT/vW/TqCHg3c84rdTabUQ+BOt8kv0M4bFiktxRr6FLrIF4PPSqytbKwwmXpUTfjpCSOYBY9F
	lDgReYU/dWpGX4+nHHfbHsiSU3EU4HAtfE+b4xD+CiKe3epwwIaY0cDQ8xO4sA51xe9Y49jqayW
	U4mI6hZmrHMa2PccyukY+ZHOEkRWeuHi4zRBg2Gljdl6q7/VUJWu4YrOErp2eZBhAU27KSvm7SC
	L11CHlEFM2Zf55RKptxEmbxPkpL66YNN/7SO8dhYpLVK9BsetAadhNAmetKa3FHCmU+OSJ3uuhF
	bk57ARaa5qd5jwjfyXl88gqZe0Z98yXLElE4dvFdbeoPsv+USGulssR9cFT11qW3St/nVT41mww
	==
X-Received: by 2002:a05:6a00:2182:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83a5d3874ddmr6299575b3a.29.1778132350025;
        Wed, 06 May 2026 22:39:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2182:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83a5d3874ddmr6299536b3a.29.1778132349529;
        Wed, 06 May 2026 22:39:09 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:39:09 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:29 +0530
Subject: [PATCH v5 4/6] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-4-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ychfljkOM1aeJ56eya5CZK1kE4wymZIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfXzE9vLjZ2eAz1
 xXLeqXu+upBBy5aUphigWDxl3kL50Mp7+Wtmocei2FxqPHNXh3GXs8xyOOt82Sbszy6juEXPaYX
 q+zjx21Z0sH+tfVqKW0vc1wwbACmAc+1uq8+F4AmC52QevIKwK75FPhscu4ODg9ScsbIt2OSPpV
 ubgzOnAMWE1nSC9a7A6jDLi2q6azB0FIrJYfdvL2EivlrYvcUplOHHN3xxZ4hbPQpead7spWnwL
 HK+qgW3EKjuZZz6lb093j8VmzE53RtGHFuHs5/w5LfZk8YOYMP/AEAr34w/ss/jFk2kavuOQkwB
 RcIXvqLF0kRMzE7d57QMVjvtgWP8lqK9kGYwQIcRN4PMYw416TuOFVBqw8+d07fRol+zwA5/4Yd
 nnDXgkPYkfx2OdW/jruLXkIvGgu4f7BKWacyjzal6bPlnFTaGrgFVzGuzhVXg+GjdyTZEQ5uSNy
 6iNhK2PJzVSf3cJ4s2Q==
X-Proofpoint-GUID: ychfljkOM1aeJ56eya5CZK1kE4wymZIM
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc257f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KO62ueLImIrNyuj-9MYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070052
X-Rspamd-Queue-Id: B853C4E32DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106239-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for camera QDSS debug clocks on X1E80100 platform which
are required to be voted for camera icp and cpas usecases. This change
aligns the camcc driver to the new ABI exposed from X1E80100 camcc
bindings that supports these camcc QDSS debug clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 81f579ff6993349f4993fd2de14605379711f90a..c12994af42cfc4cc1a2a32663940313b83311919 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -1052,6 +1052,31 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_CAM_CC_PLL8_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x13938,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_cam_cc_sfe_0_clk_src[] = {
 	F(345600000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
 	F(432000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
@@ -2182,6 +2207,42 @@ static struct clk_branch cam_cc_mclk7_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13a64,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a64,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x13a68,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a68,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch cam_cc_sfe_0_clk = {
 	.halt_reg = 0x133c0,
 	.halt_check = BRANCH_HALT,
@@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
 	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
 	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
 	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
 	[CAM_CC_SFE_0_CLK_SRC] = &cam_cc_sfe_0_clk_src.clkr,
 	[CAM_CC_SFE_0_FAST_AHB_CLK] = &cam_cc_sfe_0_fast_ahb_clk.clkr,

-- 
2.34.1


