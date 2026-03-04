Return-Path: <linux-arm-msm+bounces-95262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJiBLv/rp2mWlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:23:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 322701FC839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5057E305E387
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29E7389106;
	Wed,  4 Mar 2026 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnK7TA4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXny0S+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185AC3914E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612525; cv=none; b=l5mXo2eldCJaQrloYIjsDB9cg7gr4T/x3mYUrAKHKFh5N30u54DMELweiNSQuWFYaQ7JhoibH2DHpMV5J00ZlR+ouoQqqjT7xCBJ7dX2KsWV/UfDukFfDwd7c49GeIIwUMgYaIoxAiSna2NVt1Xgwx8aOqkw53cr1Zg8BgmszgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612525; c=relaxed/simple;
	bh=pysVn0dtTrLL13JfTAmWaZskCFGo4Q8dXZlR8KxW+RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnqclcvhZ9OAustS7dmKQGal3BWpi2OYltCZHyXxaERLi/jkligqVk46JzG1yzm+zWuSl7SjEXcKCNo+kZMeSn41IzSCgtgR/rGEj/zPgx8zdwG+qguEX09Mj9VHoXKtl9VvId9EmvGVMyhijCzXDEKykdrhsG61jj2z00T+xh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnK7TA4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXny0S+C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SWDw1678050
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 08:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fpe91AwzgJkPRVG0kPNXA33C1a2urKT4TBX2sBM0Lyw=; b=mnK7TA4Yk6R4y27Q
	bmrQuBeJNOyG8oMHPcD0hxc5bp5CDnLddLPmtQFWbb93H1eCtOfmUANg20WwL3ik
	R/+yFOaG7b9+FRuUrXE2PwiPPRpAF4eJuHD+10u9JfZMkoYaAupknncLO2Lm8q2+
	8sSARFhnIYcSAQ3rv8nUCV8mpgFNB5rOrcxNj4kwfV6eO1tNV8gqlb+lhfcvk8Qo
	zYm4qTZhj2zXVgxJMJPJknuB6tMYQdWlz56HrCU3A1BCU6TZY9465PenJW9WQpFT
	QgQFbN3uDd0nXSulkA3lSqyUsSjHAZpeAhEnCQPgc3LRdPEjkMosWtzlYaUDr4G7
	xYqUVg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73ha0cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 08:22:03 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f11f18a89so65213613b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 00:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772612523; x=1773217323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fpe91AwzgJkPRVG0kPNXA33C1a2urKT4TBX2sBM0Lyw=;
        b=HXny0S+C5+60vkRZO5sXPiKgMAr4YxA4jtQZvGuplnupQ1v/KzHiY1aJDGlib9c6Qj
         3XILCjc6rdbgQuOlrTOGMh41Zx7Zof5tagQKuKllMlAxZKjcwmMg0/cj+DIj1ejt6apL
         I0cTut4SgTZz5t2xsz2KGJBrYCaoAVmZBKQfg0LUGaRgRJkImbYeWgMQu7XlUL80hx1I
         FUAHUGnmPTlyjQL5TKwI8Z5bCNG2ypKPiBH+ilHz/z/LBNUm0PdMkF3W2/lhf58OIQut
         Y0Y0si2hOoXY6vMChH6S7MNuJ7k9NNHnQlqMJ2fzUiyYVmdVrDJEj7iFvHyudAL9jx64
         UGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612523; x=1773217323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fpe91AwzgJkPRVG0kPNXA33C1a2urKT4TBX2sBM0Lyw=;
        b=HzC2Ih6oxiU8y9EVcG3Fj6fEdKV/33PL3TxThxBI8ruGUDRtVRDs8SG78s2ubDxFOd
         6SmXOuRu+PFyUis8HFOZ2y3c78CCcKn54B6j/kmMpLiRBbh0nTisp52q+rWsBMnxieya
         56luB5Wxv5WdsmvC/y3UwuiA7vmBR5Z8OhTTUQ6mGxsJ6ZZ/2NZpQ2VWJtCHT83XI+zY
         j8P4i/XcuDy+sFOvgtZU/VTM6X/8DM0o5qOkVMk60PCdmblBvGHHTf/rF8Z02YDXoR2t
         r//Mxs92zt1zddJX4NOSCKNW0J0srErgU+pRVzfyAT8ZszEbUUq6pPr8XxrFCt/bVq9Y
         TxTQ==
X-Gm-Message-State: AOJu0YwEgQ9msep9rfsh+/BNqPOr81yfyM0Q3+YW1MJx+7ZX7p1gt/JW
	tiNf9QXXZaxBAa+YxtZFjTc+xQgfKFuIvlD/+HtmatiamkYuD0YGtWophUhOFroXa3yPxWasnAm
	OkkEmnIoOq2DCV2N3x71RjRi6QIuxkGxpj4j8tkr6oAFaDIph/LqYzk7mH5VRVL1+U+XQ
X-Gm-Gg: ATEYQzyMJd5uynN8OUAC07BV5nehIBPzJdTG3biIsa+mEPwkI9fkzSkxBCtmHsPfqUQ
	c0GqWEASb32DgExN4JcG33VhBzo72dbpKL6mxz8gzxG/vnuMORzLmexZRf88WKrgrluoMxC6/hf
	fjVGMDJ66iuaZOzUHF9N+mEhxSyPKNLn3i2OaTR6mRdcPmtyqSL8HI2NgsKCYKkmDZbM8njp7Mb
	qIdXnmYlHIQVmdUECbtA33CJ2TYYeyYe6kLc2nJ3KV0z9Qt6DB849nl5rKCcldxmdstMyPpJ7VW
	wbHRhET8O30sOGWD9gG6b09Xhkyeoolqo8x9EVRYBJweZvE1iN6kH9Lr/FXNJiQdS1fp7g0CEeg
	PiDlmtJs8lctPCBTnU0uJzBVOKRjblyMjuhioB/vBfzm5Z3PlHEFahMxd1IgqT4JL/QTj
X-Received: by 2002:a05:6808:2226:b0:45f:42d6:3006 with SMTP id 5614622812f47-4651abb49fdmr697284b6e.15.1772612522753;
        Wed, 04 Mar 2026 00:22:02 -0800 (PST)
X-Received: by 2002:a05:6808:2226:b0:45f:42d6:3006 with SMTP id 5614622812f47-4651abb49fdmr697272b6e.15.1772612522359;
        Wed, 04 Mar 2026 00:22:02 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d26d9absm18006952fac.16.2026.03.04.00.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:22:02 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 00:21:58 -0800
Subject: [PATCH 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-glymur_gen5x8_phy-v1-4-849e9a72e125@oss.qualcomm.com>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
In-Reply-To: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772612517; l=2780;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=pysVn0dtTrLL13JfTAmWaZskCFGo4Q8dXZlR8KxW+RQ=;
 b=BrV+/QVloaGE61UM9FsVTPr1aD7EKrsxuuvTAL97xJSWFbb/nvTDE2ZYO448OIIlEvGWGJ83b
 SwWOHOvIf64Cmwl8OEAmycjsaK2g/zz/ahP2entS4lQoIo00OhmC+Ri
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: phMsspFhnsV5DMT7U-F9SWzpm2sPb-C4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NCBTYWx0ZWRfXxyseUmLXaR44
 YLIm3Im9BUNjKacUnueRF2j6tLi7OqPBrYQ4z5iHbq+TzeFg2RTK07AjB9GA74TyccsNP3x+vHG
 lDODp2JP6hb8/jTnNDng38aGhvUDukxnIWT87CsE3/GpmfHYHenqVssHwO0uSVw7wU++eBvsegN
 zeGONsbpl4O9cCX9XV85FgRTJbOr2qTvS+Mez4SYRkdneddUYqHBnyku88KNEg2pwnFvAATxMBz
 EFRA14KgxIdfTP6Un1DNgMBnxddgVDVskFTEa+HC7ouPF5YcLivqDOzRjvv6aVU83AaGobcshQS
 RGlWaJ3OgaxhK07fesOIrggI8Orfu0U/uOaGlmJy/xzu+/lC/lV2NIZaasB+M1R8m4Sz6PsjEql
 Q7VQI8elZePmku4SQT+cWiYZd9FcU6HqtoUotqK//fJyvYio9YIZ9AL2OUE1wXgFBwXE0PHuHy0
 DrNLJxldpA+G25bdnCg==
X-Proofpoint-ORIG-GUID: phMsspFhnsV5DMT7U-F9SWzpm2sPb-C4
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a7ebab cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OKc3O2-h_waFBcwqEmQA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040064
X-Rspamd-Queue-Id: 322701FC839
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95262-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The third PCIe controller on Glymur SoC supports 8-lane operation via
bifurcation of two PHYs (each requires separate power domian, resets and
aux clk).

Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
clock ("phy_b_aux") required for 8-lane operation. Introduce new
glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 6b6c10218229b74540e520c6fe9fd1f890480b68..29bc0fe5ce37ecd6307da97d4e091b3a52074d2b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3378,7 +3378,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
+	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux", "phy_b_aux",
 };
 
 /* list of regulators */
@@ -3403,6 +3403,14 @@ static const char * const sm8550_pciephy_nocsr_reset_l[] = {
 	"phy_nocsr",
 };
 
+static const char * const glymur_pciephy_reset_l[] = {
+	"phy", "phy_b"
+};
+
+static const char * const glymur_pciephy_nocsr_reset_l[] = {
+	"phy_nocsr", "phy_b_nocsr",
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_qhp = {
 	.serdes		= 0,
 	.pcs		= 0x1800,
@@ -4707,6 +4715,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
+	.lanes = 8,
+
+	.offsets		= &qmp_pcie_offsets_v8_50,
+
+	.reset_list		= glymur_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
+	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= pciephy_v8_50_regs_layout,
+
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5484,6 +5509,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
+		.data = &glymur_qmp_gen5x8_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1


