Return-Path: <linux-arm-msm+bounces-75055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB428B9E9A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3E11BC6D65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280CC279780;
	Thu, 25 Sep 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqOvFjP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF123C516
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795552; cv=none; b=aTzh0u1B5099htkgWzw4bG+p7Zlj+mQygZS68HxJxFpjDt9ilYLooIsfU5ZBe2+MOYDGIBAah9TUOo7hw8SSNWy9cW1joP11U8M+DUbvCkVyIKczpSj9WLbIWAQ/ycDJqKhxrkwCCVjfS543Si2xVCmDRWy5bOn3VBDha8na7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795552; c=relaxed/simple;
	bh=O7xdGQ7WlDQpVmMZ2EYcuz0b3qYDBPaVranAc9pG9tY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JbHDK/Wp9p80uFpyTGvFMfEm6OWf5f3Kv75h6WQ75OD7hlOFUQqSHn8OAsQ2u+gFzwiPbM6vmSua7OyCQzpqINTjwIhh0Rd8LeKSu9FezDP/h9o5PQrJdVwL+y4ygg2UTsYwyRoItHbXRdV21rlbEt0W6j4f/W4ec0aFTyMOw+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqOvFjP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aJbb027521
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FZp0Vhz0526cJi0JWc5xdd
	yE5rIKzJkRtxo1vAAFWus=; b=bqOvFjP7UryimDYddVYJJ2MqSt7x1GyI/W3JZO
	q52xIgydOTFF0S5Q5QCE+iQzaCuyM3YySpjq6Gx50NpwSbhutZ9mdPCBTy96qxW6
	W+HBq5e7xGn+18bUyqf0U3+zDBDh0vmTySE8mfgSnTTV1KVExxds1xQS9ayn8l9q
	kEuRecjUGyGENvn2LdplXSLlC0hmJCDzETTEbbpdtpKXbtudL0FTh/n9BfeL5QRv
	YLOfwdt5UEnnU9N5BH+LWmlbefaQsug4z3yOQrEBG3EyHT7/xH25pINj56MDHpT9
	AiqTyKWxCbqKwOQIFAVODY3KtSoHPeKGWH4wEBZnMu+c967A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0xfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:19:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b550fab38e9so633195a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795548; x=1759400348;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZp0Vhz0526cJi0JWc5xddyE5rIKzJkRtxo1vAAFWus=;
        b=j/z7buZYOHWCc3GXVQ5MJGZPAk0SymGDCNQnjhFqHk1idCr+dkMfU3l6pwulkX0rLn
         +0FkxKGBKowHyd9rqzwAdVYp9RP7OdA7oQlhLJbM7EF4v+KD/5GlmzONhS1fVmttiNVc
         qI9hz8Xrq+idB+F/N4teq/ULaY46Okbd7y0LP6vMxZoTcMBAADYQII5WpvRHGPo6/r9V
         +O1oUwQTynnoaenY9D9lb26l3zOGUYf0BDQiKROm7iR/RD/HuXv6pMqpawbPPja++bcO
         M5VcYSq08HuIltrQWQ5C+wMjCUKNP7N7AFwCJ4MXN2mm/yHtq+KYsI6Nu6nyCBwWYPnr
         zl6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpy7B7lnKdMdPF9Yi7aF1wYwZPwbeoIv9w1bOlhEhy6sd/SZ8r6OSLjjCalLeAIiL6YnXED8b+9MtK8Kk5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uVMgjJxfL3bVd9Z9xhuA1BPRpsvg4jJmxdP60fFpVqk9mUKM
	7f7KbxSNGFyBaGCpEfu1nGtmmidrr+RebUq5YtiJnXjXB5tqEtPdPEjTzh0mFFV5afyrAO+hZC6
	dsx5MaRIiyN0e39wIOw/hyS2zwRAhrycqrRTRFHrAWEfjPKv+ZwN+SeOA66+5PTA/rpHG
X-Gm-Gg: ASbGnctpVH4XtKhK34ACaIud5suJAk5jGtcJ50F2cGYymtzG1tbU2BEq9D3VbVhJiSv
	lAL6xqCrA9rlmYbldLptmiUbqZyyh4t22BvGd19Mzoxii87X4Fn7q8Qf/kAlEuw45j0OZlmj/qz
	Cs90nZ7bkIrKcEaBPZ6x5sCQ565kFqXedkYrHCHNsdr13rw9lLtSRu8XxLw/3hTozizQbsTmcja
	/c8q44bFdXvKoT4HteTrXRnMQuXRHfc8xF2VT6bT99WgZB40mRQdYCM09C80kCuBohA30U42hvX
	G0VknfbPVP2aGhpF75QT7n0Ydqe/jR7JKNt7EpApLFaDbUenAkOKVpSa7/Bqnd4Z
X-Received: by 2002:a17:902:fc86:b0:269:8407:5ae3 with SMTP id d9443c01a7336-27ed4a60923mr36546135ad.54.1758795548351;
        Thu, 25 Sep 2025 03:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEFXfYAUFjjS+jeTaReul4kekMhkSmoFtUW/wQ+LM/4NiYF5ttSYxapSUrbKOFtJuOqwQwFA==
X-Received: by 2002:a17:902:fc86:b0:269:8407:5ae3 with SMTP id d9443c01a7336-27ed4a60923mr36545825ad.54.1758795547888;
        Thu, 25 Sep 2025 03:19:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821c8sm19366165ad.74.2025.09.25.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:19:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:49:00 +0530
Subject: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags for
 pipe clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABMX1WgC/4WNXQ6CMBCEr0L22ZK28lefvIchDdYFmgDVrjQS0
 rtbuYAvk3wzmZkdCL1Fgku2g8dgybolgTxlYMZuGZDZR2KQXJZcyYIN0zavXg/G6JXuurcfJNa
 oppdC8V7xGlL16fEIUvPWJh4tvZ3fjpcgfu6fwSCYYJ3iZdXU8oxVcXVE+WvtJuPmOU8CbYzxC
 88Tdc2/AAAA
X-Change-ID: 20250924-glymur_gcc_usb_fixes-898f2190f907
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d5171d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JYB-Luj0ZXNNozRcq10A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfXwqBYFcq7MXVS
 z6pbezsplLEtQIaCJoW7rUpCO7NynFSEeDTfnM+rWIe3Y+hGrpKyFGaJSaZ+ewbEAYoO6+zky+M
 gPyp0cy7wVVPaXE90V2N8jwXCk02dGJvHCVv6vZKCqqdeib02xL9y1fnXBKZ+oHPDU/PKsE5ERm
 KPJiXY1cLxbpC3bFc/T5p6bsZizHV365QQuPT35liKprA9ndoZdY0N5I6DYczKJVxRID2E6Ij38
 KRF7mPu8Dxs15oLGpe+YOrA8yPDnfZG9ppNTiukvdHp0IURAShpc+fDFbg4MZ/s9nUP1SV+mPPx
 7j2swMKfoflthiQ/T1B3t3hLGrc+GpUWINv9eBmZ7m62zMS2SHM6k2u/NZHZ4PEsXnw2X2Mzeac
 L50a0MwF
X-Proofpoint-GUID: NvDvryD0i1NSXMq0KeEIODMWHjU72GOK
X-Proofpoint-ORIG-GUID: NvDvryD0i1NSXMq0KeEIODMWHjU72GOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

The pipe clocks for PCIE and USB are externally sourced and they should
not be polled by the clock driver. Update the halt_check flags to 'SKIP'
to disable polling for these clocks.

This helps avoid the clock status stuck at 'off' warnings, which are
benign, since all consumers of the PHYs must initialize a given instance
before performing any operations.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v2:
- Update the commit text to add the SoC name "glymur" [Konrad]
- Update the commit subject to add more details [Konrad]
- Add RB [Konrad]
- Fix a typo [Markus Elfring]
- Link to v1: https://lore.kernel.org/r/20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-glymur.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 62059120f9720bbac03852c0368f4de3038a559c..d938e7dc5b66ec539c3264a2e212b3d6878b1fde 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6760,7 +6760,7 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
 
 static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 	.halt_reg = 0x3f088,
-	.halt_check = BRANCH_HALT_DELAY,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x3f088,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -6816,7 +6816,7 @@ static struct clk_branch gcc_usb3_sec_phy_com_aux_clk = {
 
 static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 	.halt_reg = 0xe2078,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe2078,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -6872,7 +6872,7 @@ static struct clk_branch gcc_usb3_tert_phy_com_aux_clk = {
 
 static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
 	.halt_reg = 0xe1078,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe1078,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -6961,7 +6961,7 @@ static struct clk_branch gcc_usb4_0_master_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_p2rr2p_pipe_clk = {
 	.halt_reg = 0x2b0f4,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0f4,
 		.enable_mask = BIT(0),
@@ -6979,7 +6979,7 @@ static struct clk_branch gcc_usb4_0_phy_p2rr2p_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 	.halt_reg = 0x2b04c,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x62010,
 		.enable_mask = BIT(11),
@@ -7033,7 +7033,7 @@ static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_usb_pipe_clk = {
 	.halt_reg = 0x2b0bc,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2b0bc,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -7196,7 +7196,7 @@ static struct clk_branch gcc_usb4_1_master_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_p2rr2p_pipe_clk = {
 	.halt_reg = 0x2d118,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d118,
 		.enable_mask = BIT(0),
@@ -7214,7 +7214,7 @@ static struct clk_branch gcc_usb4_1_phy_p2rr2p_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 	.halt_reg = 0x2d04c,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x62010,
 		.enable_mask = BIT(12),
@@ -7268,7 +7268,7 @@ static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_usb_pipe_clk = {
 	.halt_reg = 0x2d0e0,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2d0e0,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -7431,7 +7431,7 @@ static struct clk_branch gcc_usb4_2_master_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_p2rr2p_pipe_clk = {
 	.halt_reg = 0xe00f8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00f8,
 		.enable_mask = BIT(0),
@@ -7449,7 +7449,7 @@ static struct clk_branch gcc_usb4_2_phy_p2rr2p_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 	.halt_reg = 0xe004c,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x62010,
 		.enable_mask = BIT(13),
@@ -7503,7 +7503,7 @@ static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_usb_pipe_clk = {
 	.halt_reg = 0xe00c0,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe00c0,
 	.hwcg_bit = 1,
 	.clkr = {

---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250924-glymur_gcc_usb_fixes-898f2190f907

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


