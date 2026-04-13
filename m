Return-Path: <linux-arm-msm+bounces-102877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLbXHN+M3GkhSwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:27:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E42423E7C4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66B953024463
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA773932F6;
	Mon, 13 Apr 2026 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ih1JlhP0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtxRPHK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D48392C47
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061585; cv=none; b=jzKAsWm9XCvZHyKZFwMAmNjSYSkmlIJsaMNIVap7c2HPuHDCVaeIsRxJXxZDEcpRJN+OhF/Rt+iV8a+Cj3MQY6AacAweOZoLPEseyVLG8SypEM99i/DqT0muUSta8RFyu1ixSnb2NNd/E2BsQ8YZlHQi++s3o7AY2CeKNE2oyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061585; c=relaxed/simple;
	bh=/sh7p4m3hFNioD0epggEq613q+NXtlboppQCvliy7QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzACyLdmXS4Gzyba0GGHVe2PkV86mX4gQ8+4/WS1pY/nqy3dgXWnCNe90y0fg0Hw5nUTZyhKlnoH1zjycyeIQ4RrbG7SUkRU8vCmxIm7VVHYCjCZVwZ3bXKISXAqNtod366EdHqPdeLQI8wbRsmMJ8HzZEWQNuD+imPWK39V6ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ih1JlhP0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtxRPHK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D51q9B3561692
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKF85qW/Qlo6fJnzknZySfPyHFggl0ikhnUJiBDk1bY=; b=ih1JlhP0Cu/Lo6oi
	XBvnKymAxEa/lPLN69VIPOZIYO/6r0Fi1dqUvIwdSiab0V+FRPyyF99mgB2Gn54Q
	xvPZiBxyqReh02fa8EqPK+8dR5k2RVEqBRhdx/ENWUBsKYlKIX5vt2/FCiRLtOew
	A7CNq+R/p0jUuHnbQPFNS6cY5qXb/rJPWWNHL8j0hkvGFwAQnRedGl4Zpa1GXhzK
	kafZEACxfr0cBZijvZN8agnROOVC8ZKGuFUfDGaMPcTTDuYErx2CCV4MVBH1uZzA
	D2u7CKf+5YVvoKSHt57L3q+MxnISjktqSfOj5qzCDbWE26pGj9VPWKgyM3M2n1Br
	330XaA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0m128-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so5527823eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 23:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061583; x=1776666383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKF85qW/Qlo6fJnzknZySfPyHFggl0ikhnUJiBDk1bY=;
        b=AtxRPHK52P75lRDy1j2QK226YeI+q8sLQ0TyS0xmvm87f1qAi6KE07N9wQvkO96tl+
         qsKgjVnNXz41sy8cZ6KPUsthwqwIRcpg4pa7ylH/dhHjo1cuZ3D8bZdsyA0M3hlRwNCk
         xPTqnu/lJtXL1eywXsfmT5kVcYeTdn/hQIzMEksXbgdR9g2wr/Z9nLZjcfPX5l0I0L5r
         kvvuUPL2TJ1lJThhg2sQDAl33dyJnsAqazx8+gO4fDnkKObKrcxv3m5vEkKmLWAKoy0m
         OguBGRjZ5x+diLI7+v+Ajcs43D7ulE7VbWsNfF36hTB/Aut2k2kELxvXeWs/ES+OKOF7
         /K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061583; x=1776666383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DKF85qW/Qlo6fJnzknZySfPyHFggl0ikhnUJiBDk1bY=;
        b=ZgX/q5W39sQkjnNeXsidNS/vd/qWgPzLvBicHZiInIy916UHQNmV6Y88bpOUKgeH4l
         yLH20UkibCcvCT8bGyYAkdXy1AdyE9gWm+aQCU9eGJda9YusyC8/GGQBqasuC9eUisoz
         RW9bBgep1vUVEotNjfwH2qqrcNPNI5nLB4mNqnoIEyvnzTiAt4/pp6RnuunrE0/A/dgd
         6brCrDc/LHGrld6Jm4yAnkfZBrBvigu63FY8Z5BhtKcE0BlFwyTj5m5CDf4lR//AtsXI
         IoVahgvGVwFz7bIXN+P2Zhvjvjev9mHF/MoxcXwMBRRD5M4vBAz4TxciytM9iQCSpeP7
         K12g==
X-Gm-Message-State: AOJu0YxEaU/zz8OSERVghcOYFOf42B359JkKD8SLYsDno1TtVY69f7lI
	I6BBIjSx9yX6B2OkokhW6w9tr2Ky/Yj/WIF7UYOWfPnEW491RfmrqvILf8w1pjSrGuRF2tjVqUT
	oDJthPYH4iOpvCBypZpdUGsfwl+HD3zikHUmMiDK/RViUfn3Qrob+anizpi2VtTsLeTw7
X-Gm-Gg: AeBDies1nOPPwrXA6uvzRl+dywNFQPki2B7Gu9pr8Dz9+fQEk2Yh8f83vM0e3fWWhf4
	SOQ2dDpROMp6+KlnD0oqKaBb9Z2HPj1N7DsMbSUazILGTilQzcZyxHGhQ5ibpMWNGW7osXohjFT
	ZM7AlMGpgNUxeoBZhJnaULW5X1IGXmm/0kG+a3QapK5Qr9JiJvxf4wsU+Q5HSyD9mOzxnqVLBr3
	qWL4ClHSYRgGSrCeh9kWPxsdRUTWayZSwfMINxQiAJltxh5JBtDpr3i9ZSxyumVswoSxiHeT4B1
	idg0dMfKdaOl8b1OacPXuMdAnLyNUTKRhzVyo8QCOxJ7nzh60pG0ix5PW8GLslF1R7a5+EYUpBx
	mg5WGalt8DJ7Xvyc97sk2UqsJ62n9UVi17ey5IKeKhMz7OzLDMY3gxPaIuZzOOXUJi1af
X-Received: by 2002:a05:7300:c99:b0:2d9:db50:c6d6 with SMTP id 5a478bee46e88-2d9db50cbfdmr527221eec.21.1776061582803;
        Sun, 12 Apr 2026 23:26:22 -0700 (PDT)
X-Received: by 2002:a05:7300:c99:b0:2d9:db50:c6d6 with SMTP id 5a478bee46e88-2d9db50cbfdmr527201eec.21.1776061582246;
        Sun, 12 Apr 2026 23:26:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 23:25:59 -0700
Subject: [PATCH v3 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-4-affcebc16b8b@oss.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=2900;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=/sh7p4m3hFNioD0epggEq613q+NXtlboppQCvliy7QU=;
 b=pvccYJ1o+XBVXIlPJ+tXG8SdBY4cZG643kh3kxkqPJ32WmQKZoLgLWckoLu/KLilZa8tT+SVR
 3Rht1St7TeLAaZpcCplH+tybzbwzKjQN8mG0cTjv7LEeCAofyQes+ln
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dc8c8f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HL6OuJMUPOiLb2Wyts4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfX6VOojVGz5eyu
 ZLkPSVN+wTDG/nsTB1fuw+rtUdfTbiv4JN7ULE5/l2s3OojqmObOKNXxu3uXYteziOnWDsh1riR
 PKIleD8yYZdKJIZV5gTvVt49kWEFHQdTn0/naUC3pm1qlycmAwsC1DgpmGu25CgMYEsir1RcwXj
 IIrbMdnStSAZ5Prq0/cs2oiJVgERmE5wysUXLFQy84fhlOBwFAcxVNbaxke0xrk2EB6gHMlCtdh
 SARNXBWF1WWTdDmtI0g7nyhreckKNTgN1l/EOoTq7IFanAJnwE88nLimKaf31LSuIdYNSvlznPJ
 M4sqHX7/ow01DGrBe/Qqn3HvkcRvU3tRXvJ+hWNCnftRLP/KyOK9NRYMMsTVPZSUUv/hi1vK5Zr
 D6Mez0aWo2mS4E1/dZY1rtf3BY91Be0vH1sJvUiJyNHGMdilkvuBcLG2IFX0nt/lQ8LeWNRhC/S
 KpsBuV5geH8+QEC1rHQ==
X-Proofpoint-ORIG-GUID: jzbq8aq2Pf4KmEFQBzDLwbg5j5xODSRW
X-Proofpoint-GUID: jzbq8aq2Pf4KmEFQBzDLwbg5j5xODSRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102877-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: E42423E7C4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The third PCIe controller on Glymur SoC supports 8-lane operation via
bifurcation of two PHYs (each requires separate power domian, resets and
aux clk).

Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
clock ("phy_b_aux") required for 8-lane operation. Introduce new
glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 51db9eea41255bad0034bbcfbfdc36894c2bc95f..e872b50b11da50e6317ce7e1acf6385925f92cdb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3376,7 +3376,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
+	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux", "phy_b_aux",
 };
 
 /* list of regulators */
@@ -3401,6 +3401,14 @@ static const char * const sm8550_pciephy_nocsr_reset_l[] = {
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
@@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
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
@@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
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


