Return-Path: <linux-arm-msm+bounces-74563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26758B987B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 09:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CE791B2094E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 07:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C1A257820;
	Wed, 24 Sep 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeptMmlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9126E165
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758698242; cv=none; b=XoYgCacqb6Vqq3U0UKIkOyivAZJ5RM6B8gHFBG/U9tHDHmOVOmXyUISRDVzWppXuT5UBFEfbLiRoxQpg7153QVC84KgpWX8JM+xUfQPniPgsBGYvoiVlxiItV0dBoGtrC/K2zTMWJzRKJiGqo+ZxW3CZaqqHduB3wMAlLqf4nzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758698242; c=relaxed/simple;
	bh=F2Cs9l23rLUaJsZ0gN4TAq/w4FxXrrg0yBY2WbgaIhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SayYuHfond6hPO1cuuX4Z8z11Gz9xVF20GIKvtAYs46RXLqrbAMqTsyhTuzM6zAsidTe9+41OeMaJIGyc7f/LsUWsELa81AK1rhz9kL816jedP2LRXxNCdndcBx5e23FfmNND0lvyhU4K5cgKaurtea9VdOkEKdNydCPOqlcgYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeptMmlZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iDsU002662
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ls5rHwUZzWoTdxASMbUR/S
	efW8vGQPtUzSD9l0c8hi0=; b=KeptMmlZRVsaoF/vE0vORdfo7xj1UYD9qoHcG0
	jfzBPKwKguwsdaascEBDyocLIDGrbUJ1ZDvscMW2A7BUmAiYRkB6kKJthZZvRbmF
	gy/OAPC3X54vDjq4R3I4nucMVKw67X665FyjO5RqfhuMLqt/nwF4mFj9QzpwuuDb
	8vzuct+2iCwHjLeGT39/fBS+lHrFLmNTXq+XGAzk9RQPwh4UvIeRXTXzoa36Ku+4
	Jo5jB6ji5E/nB1J8tpKWfthGLvQN0RRXmtwXmQgPiOhKbNcqkNgR01h/8KRblRUY
	Ql5nOaO2O4an/8Ff1Rov6ax3qaPf5Ua6LrheJRmKG5qkL/bw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajewx6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:17:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-252afdfafe1so66513405ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 00:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758698238; x=1759303038;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ls5rHwUZzWoTdxASMbUR/SefW8vGQPtUzSD9l0c8hi0=;
        b=YbFOmv0otRyRhT5NWpOzOmCiZOZj6XffoS/Z0HbTjWr3EeVoh3Ogxt8vdQUTYO6d/k
         5msQewkX9QFIfkn5lCXl32gC1f4bbovsnEvwN2sOHu9cymCufqpqE783712L3kIkN1Ux
         E+e7E1wkH5qgmbdpOEvG6Q/g23yanVM68c1/2AjYK/YR595+J6hLg3b8oN+lxTwknD05
         Xo+JkKBrgKFmREGRFFFkZpl4yq2mMx/zABf0P2LtxLGtS7yUKB2CnJLM2esEsxYrZSG3
         vU60xbkoqnbhYIGGyYYBvrcQaNcOis2UuMg4dQiX/8OXPpfOY2TacmjmYuv07Pt58rK4
         NA7g==
X-Forwarded-Encrypted: i=1; AJvYcCWGaFyq3BW201EgMZWF1GYTPsOXQk3HH7/599+P9SSe6+YxvcQlanhQj/3EqGaN0Zcb95XAuElKHhc/XimI@vger.kernel.org
X-Gm-Message-State: AOJu0YyuhjZ2hZMTf3nPK7EknLYuLOhxMcZqAWx8qeZ8RNzqzlNm8lOP
	NzMYs8Klbcu1d+0ubdAkJ+HrWYUJuGDDkCjK9lqRtEaNr+NmlFJhLT59i2TwR/JIuoa7oSqxzp0
	qOLSezDIKM/WpdFKMk+72C+38bsLhemRjD3NEfCzaNzDn6dC2m5Nh2RDb7brJ7HF1Sa519GgKA5
	d7
X-Gm-Gg: ASbGncumcxGUE8Wm26xqXqGvtYylHFeaG86nmIq9G/JUmtbB6F5uuCA43AleVK7Cf1S
	Pq+f4qADpVWp2S600jJ0ruuqS7pu+7RqK8k7Mv7rly9ciH/iGIwLACM9ZaW8MUABW22C+EFKvsQ
	YS4CvdgKJmEdPfbjLfmL1oyLyZi/EcNOAAxZ8MI94DPp9UfErG6GoXN6rxsD7xc5hJ4aUtyBSfx
	UcKAWOgC7I6z5tnXKyEQpx3scTOB08Mb9a40QzHgUmuomwxXkMtp4Ah7DG6pQpN1DhOUdL8wano
	yIlfDetG/kXh8D3V53DhpZ+vGDPbkg4VACO+8/08kUz+609pIF4/ECyWzjEwOiIV
X-Received: by 2002:a17:902:d2c1:b0:271:b6b3:71ef with SMTP id d9443c01a7336-27cc5de0f46mr76039205ad.43.1758698238143;
        Wed, 24 Sep 2025 00:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5XUsYYjc6Q3W5JjV2krvu6VsFrIBob/PbMRkyJHcUOVnrQacVEDwqlpsh6hVyvLfCUoMYfA==
X-Received: by 2002:a17:902:d2c1:b0:271:b6b3:71ef with SMTP id d9443c01a7336-27cc5de0f46mr76038845ad.43.1758698237693;
        Wed, 24 Sep 2025 00:17:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980310e41sm182846855ad.108.2025.09.24.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:17:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:47:08 +0530
Subject: [PATCH] clk: qcom: gcc: Update the halt check flags for pipe
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPOa02gC/x3LWwqAIBBA0a3EfCeYFGVbiZCy0QZ64WAU0d6TP
 g+X+wBjIGRoswcCnsS0bwlFnoGdh82joCkZlFSV1KoUfrnXGIy31kQejaMLWTS6carQ0mlZQ1q
 PgH9IZ9e/7we6riZ/ZgAAAA==
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
X-Proofpoint-GUID: zV0-MVypJEMLs2xZV0_CodcnHSFMcwrM
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d39b00 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZkscxO_R4YqFwkMorTkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX0ZxTwxGGSMec
 qnwbCV9L4Wj5vfBAqxfm81EBRxscTs75sVZBcE2ZwlNvtDLbcLD2VQral/9BbIsF0Dz2PUw+Lao
 BwrqWvSiy1Uwd1bfxCFgiV9wxsinjEF1j8KxOaRNdNAh9XuFlvqJm7HYFKmHR27PNeujLyAyfLB
 sMzg30HRKnhOaSG2SHao+aIQTnSMrpWphB5KK0amN0HR8hAyhc/7wOXX780GloqMLvzjHfMq2qS
 8vssjhBMFIHZ9AEJqfX31vpN6VAgD2GFsRAap13cqobvuGSY6+pFf6hieqlBTOb5Ux619iAbot0
 Gi/dp2suC8XVD6FUsbU2KTjUNwHhL3JyysKcgUKfbENP3vRl/PHX1I40EoxYKb3pFmsPHZX1KEC
 TJDJNToE
X-Proofpoint-ORIG-GUID: zV0-MVypJEMLs2xZV0_CodcnHSFMcwrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

The pipe clocks for PCIE and USB are externally sourced and the should
not be polled by the clock driver. Update the halt_check flags to 'SKIP'
to disable polling for these clocks.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
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


