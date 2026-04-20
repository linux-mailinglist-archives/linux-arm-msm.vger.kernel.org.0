Return-Path: <linux-arm-msm+bounces-103817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDoqOmld5mmtvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:07:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AB9430985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC29E312DD2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEC034F474;
	Mon, 20 Apr 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHflGIUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQa3LNC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6228035F18F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702648; cv=none; b=ga1jP+BeH9ziKwjt/ZkFr7e/xp2fzNhEZFWZUReT3u9vvtiXCXwAZTtxcreWF08pDrIUZ8SBi73n7QVwWBYZpbig7j9EXbttHXobHWMgclSiqPj9IYf7tmC+sOTCS6JFCU2Zt5gLWFKrOLUisMrfH6MlX9UnlOWqJtbAGrYnnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702648; c=relaxed/simple;
	bh=mk4dCNBBr8ZVmNIOnHG8airy1Gvqc4Pj+PZBNtF+cjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPVraulEJAcYzu5MQxCDsjnSoJevoj7QP+oNElfUYvEwYNqu4ulRf9ouYKBpdCm+TKn9cCTmAOQed5nIqnuOxI6BysH6Ui9X8vi3cjSbB05p4rxDgYPztk4S8L6X+Cf+KAZ77I74WAdOidEio1kIwxl4kxc/a3vGlISLOgbY+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHflGIUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQa3LNC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCJZAq1532103
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3+v4TaCfS8cG1zHwAijshPJOmORhUEU1m+ODIyfKcM=; b=FHflGIUqtY3DUG7l
	kr0YHyI9ESWziOPmKOhf3SZcMgxKkC10sqXFFNAaJFGaXW8TSIFLdBkNI5+rP5Xq
	22oOjCyyi8ER1znJyZBUw4kKDmtxngYE6CTmCC93tMbj960BdB+iQzSJzz5naaUt
	Xe5ujBWibwbBRuT/lEDgDhGylTcN2rk+omfl2j5EJH57z+jmLjw1KZ/GuBndvQt/
	K6g74KZ1OPGrdeoE35wdo69huhdKNvzkOJf9WOS6wP6QfWjHjNU7Xtl+A82nGcLh
	rIWokXBpUS5cUYNvlDy4uvfar9vqQkAA255z6yuh8XJ+jMm9+lq973sCznOR+/4k
	k9cXRQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus2a1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078ff0so2063157b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702646; x=1777307446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3+v4TaCfS8cG1zHwAijshPJOmORhUEU1m+ODIyfKcM=;
        b=IQa3LNC420iYPBHvukxU5Sscg2cN9CXDJ15ZBXO1gNe2DnTo3taHDnFb5n+1GMCBOB
         VcZEDiEDr/jYgDucjpzpEVkRQbdbOyLtXuI/dJej5zsJQyopk/Fhh8TqT7jmENc1Syl6
         i5ek/HihQaQIUogMKs9HDwiiJuhnCDbvO618k+Qh4qDdHvLJXP6zJQYXFFhBG6Fzlsad
         ngVopxoJ2mKunQeLZW50rbE9Iubq86o8VgXgLDCZa/gqm03uMzIP8er0VcxvyxBb0wEs
         8ukP4juNk+ipXwgYnSiNXPlL5tQtX1NUo/yfn0SavzSKY3AolPiv6Tak1b/vX5FD8pxY
         9VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702646; x=1777307446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3+v4TaCfS8cG1zHwAijshPJOmORhUEU1m+ODIyfKcM=;
        b=Xi+fY7pZ2SA78R617fy8b7C2KmbakaCDu8E6gK10nnHIjy6niauzC374oY9Gmr8nxx
         t/osOQhX7tYRu+Mp6ZSaXMI6mCh37y3TPY1NbR7l6/2i7VNNbD7OfFczObDV22OY5dP3
         GJaKHIBZodXjkaHLHdBKngU1YAxATxCyfzJe99gYgtJXZExFyQtNBfkBtpsDvyzp1nqu
         pdmBrW4pk7C7wJJlF56Y5TuQRAzPLlo5As1vjpWn8HwK4x9a6Su0i9yZCtt5sVV0VBps
         1hknxV4PTQTo67fndpaTdX/qKX7FQhwZNGmBL2ttBYozZTjaDsCXANXdLa8udY/0sgvD
         IL/A==
X-Forwarded-Encrypted: i=1; AFNElJ8f0ktM/U475/s8szgdFzNQLwlm7TOqmNCet6EakUlXLC/mHi0O1cOLH4CsAxjqCzVWukbBxAD9dvGks/4k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9sQaBrzhC4wxliBtlpvCS2c2nenL+x6U12C1dvNmY5GD+8JAH
	EopDr+Nk7o/MM/KlrKQgSmiEwWfV5MPHFyJZ3QJ7SC+PI8/qBhpjElnsqNS6yQ5GAk4hB46f+qu
	sBeSL1dZFpOszm+BVf1eV+d7bL5cP8HVaat1o5GmNKMu5fU3XqPYn1nkW8Pjf1GskOiQX
X-Gm-Gg: AeBDiesNYTkjPuDjrIicx5aeZDFz/uxGuPUyzV3L6UtKSILDr8+7NsglanMdRZoUkNE
	sBfZCz29ElfWzM5oeiadKvOAn0mcsHYUTHRWhNM0q8HsbaRzO3u3S96YplONiN67hRw3lawqFCc
	t1ZuSmEPVhu89kXPR8t0gUTgOFuLMVPP4PLq/pc8ZpuFy26afFrPZJBlaq93bYBDadqqsBitQS1
	PHuMdeG5yf/p9PjzZg3DyiCd0kZlN54zzOUQY+W3lzZG9Z3/ttm6NFMlqJOAjeFI7bc6HKcm99x
	ECZUDdluthPO9SG4ApijaXBxSUQZNRJHP4/MfRmSjM/QyxxQlRfM6ymsddEjBNMvNOcWQkqLn8k
	22iqnEp13l79NRvQWRltadKQSfqlpwJ76NsFtPNIdiszU5c0AWaBwXSU4+wnfQVI=
X-Received: by 2002:a05:6a00:6601:b0:82f:ac48:8342 with SMTP id d2e1a72fcca58-82fac488922mr4807053b3a.24.1776702645794;
        Mon, 20 Apr 2026 09:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:6601:b0:82f:ac48:8342 with SMTP id d2e1a72fcca58-82fac488922mr4807022b3a.24.1776702645282;
        Mon, 20 Apr 2026 09:30:45 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:44 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:03 +0530
Subject: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control MDP
 clocks using CESTA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX+DVF/wxDqUAU
 8zuXqVNkq+BgxpaagZuRggqIGwe2hu9QJ3PwcoHeRD11coXyOd3bKE0xIVl1gqrltbtWJ90EEHD
 kNOUAsBkfbSqyvrg7Q4/xzz/3GohyQe3jKklrT2hguaVUwYfiTlTm+QWX2uA3SqjH291FRdi1W8
 gpKnkP0vx3UhLshW0sbk+pLRNeLH/UdkbFaWredL28Qk6uI/+jwl7WawoA3wIZU7eZ+uWnPYnto
 zRao5mkMMhWdYnsspKGdK+HScxOicIsk9bpq4+lAI2LmRipEpEOAO820JNcWzYnlAToB9obLzBV
 sQKD+QGIM3WaGXDciOtCTcnHurQHBuQFP/lZQGfuwZelkDeAbdlAks8rOu4bsXoFGYtJ98F8JZ4
 1+6AocYNTKtC/XY6a+KoCzA5Ar0Hc6AUDlb9UhjTh3Rjsy8wR/E69z6s+ZxiwE03ZkdvrNZSe60
 6qkz9GRNLyipj3nCc5A==
X-Proofpoint-GUID: FFvxuj4o7oBCK7FUJbamfJnxs3jJAS8l
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e654b6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XjfBnMjlHn5Gu7V44uUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: FFvxuj4o7oBCK7FUJbamfJnxs3jJAS8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103817-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73AB9430985
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support to control the DISPCC MDSS MDP RCG and the associated display
PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
enabled, the clock ops of these clocks will be updated by the common code
before registration to use CRM specific clock ops, allowing these clocks
to be controlled using display CRM (CESTA Resource Manager) hardware.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -71,6 +71,16 @@ enum {
 	P_SLEEP_CLK,
 };
 
+static struct clk_crm disp_crm = {
+	.max_perf_ol = 10,
+	.regs = {
+		.reg_cfg_rcgr_lut_base = 0xd8,
+		.reg_l_val_lut_base = 0xdc,
+		.vcd_offset = 0x268,
+		.lut_level_offset = 0x28,
+	},
+};
+
 static const struct pll_vco pongo_elu_vco[] = {
 	{ 38400000, 38400000, 0 },
 };
@@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+static struct clk_init_data disp_cc_pll0_init = {
+	.name = "disp_cc_pll0",
+	.parent_data = &(const struct clk_parent_data) {
+		.index = DT_BI_TCXO,
+	},
+	.num_parents = 1,
+	.flags = CLK_GET_RATE_NOCACHE,
+	.ops = &clk_alpha_pll_taycan_elu_ops,
+};
+
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = taycan_elu_vco,
 	.num_vco = ARRAY_SIZE(taycan_elu_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
-	.clkr = {
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_pll0",
-			.parent_data = &(const struct clk_parent_data) {
-				.index = DT_BI_TCXO,
-			},
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_taycan_elu_ops,
-		},
-	},
+	.clkr.hw.init = &disp_cc_pll0_init,
 };
 
 static struct alpha_pll_config disp_cc_pll1_config = {
@@ -681,25 +692,25 @@ static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
 	{ }
 };
 
-static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
-	.cmd_rcgr = 0x8150,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_9,
-	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_mdp_clk_src",
-		.parent_data = disp_cc_parent_data_9,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
-		.flags = CLK_SET_RATE_PARENT,
-		/*
-		 * TODO: Downstream does not manage the clock directly, but
-		 * places votes via new hardware block called "cesta".
-		 * It is not clear whether such approach should be taken instead
-		 * of manual control.
-		 */
-		.ops = &clk_rcg2_shared_ops,
+static struct clk_init_data disp_cc_mdss_mdp_clk_src_init = {
+	.name = "disp_cc_mdss_mdp_clk_src",
+	.parent_data = disp_cc_parent_data_9,
+	.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_ops,
+};
+
+static struct clk_rcg2_crm disp_cc_mdss_mdp_clk_src = {
+	.rcg = {
+		.cmd_rcgr = 0x8150,
+		.mnd_width = 0,
+		.hid_width = 5,
+		.parent_map = disp_cc_parent_map_9,
+		.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+		.clkr.hw.init = &disp_cc_mdss_mdp_clk_src_init,
 	},
+	.crm_vcd = 1,
+	.crm = &disp_crm,
 };
 
 static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
@@ -1562,7 +1573,7 @@ static struct clk_branch disp_cc_mdss_mdp1_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1580,7 +1591,7 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1598,7 +1609,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1616,7 +1627,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1844,7 +1855,7 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
 	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
 	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
 	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
-	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.rcg.clkr,
 	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
 	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
 	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
@@ -1866,6 +1877,11 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
 	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
 };
 
+static const struct crm_clk_data disp_cc_sm8750_crm_clks[] = {
+	CRM_CLK_PLL(disp_cc_pll0),
+	CRM_CLK_RCG_CRMB(disp_cc_mdss_mdp_clk_src),
+};
+
 static const struct qcom_reset_map disp_cc_sm8750_resets[] = {
 	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
 	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
@@ -1885,6 +1901,12 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
+	.crm = &disp_crm,
+	.crm_clks = disp_cc_sm8750_crm_clks,
+	.num_crm_clks = ARRAY_SIZE(disp_cc_sm8750_crm_clks),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8750_desc = {
 	.config = &disp_cc_sm8750_regmap_config,
 	.clks = disp_cc_sm8750_clocks,
@@ -1893,6 +1915,7 @@ static const struct qcom_cc_desc disp_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_sm8750_resets),
 	.gdscs = disp_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm8750_gdscs),
+	.driver_data = &disp_cc_sm8750_driver_data,
 };
 
 static const struct of_device_id disp_cc_sm8750_match_table[] = {

-- 
2.34.1


