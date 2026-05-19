Return-Path: <linux-arm-msm+bounces-108328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIfXDl/6C2qISwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:51:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EAA577967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74B5E3037E77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B684E35C1B5;
	Tue, 19 May 2026 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqs38DJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGJ3L0Jf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466F359A6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169652; cv=none; b=ld86g6OL2yYcrn8Kz79v8MTkDwJSN4oKrEGx6mylEXXnkhTIV3OI5arpfICFETqllnjnzUgsFkblWeOWuHk/KxHtGa5HTD6fivwpO4aPPTXkfQi1aQM/mgIFIdnniOeLS6bIcHnzge8jYEOHGFVPQ/6iz3cHNuju1Ax/BVdikgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169652; c=relaxed/simple;
	bh=e+ge6SFVDXSZrp9sZxMLj4iJXXQDEqpoi4+iUcg4R2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UG1gWuoLr5SrV1RVHDsmJm940QbB43AVx0OumTU+yVSg+Kp1S8pkVDnHNO21EvGOL9JYl/6P741JOuXshqJuT/MJj9w5COEZLXtnAya2fIL/Hn/TmWAdc6aSo28+LGtNXvstTzKBJOb2AiA1hAVpVAgIZSC+jrxccZ5naPM+yPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqs38DJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGJ3L0Jf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1RYtF1146406
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0GSTBL64LgRqeP391F8PGtCzro2cCQhAPnIDXVHDdk=; b=oqs38DJXyTSw93BZ
	EbEaCCLfC12gFHVmKLvkvbWmmOpe8suAJbK3mxC09bw4re1IJFyhZcDVCgQRX1J6
	xsqATNXqVRkOIgRJSrm+fS7VL2RDpE+f3pqRyhPcI4hp9h7RJTlfwNMRf5hs63Yy
	3pHJM4uwfMg0F3dE9UhmY3WbrKraeni2zdgnM4pTBBlLqMDjmnJnez1CBMrYKjXo
	TTmKnnBBsV+HHj57chjmlrPAiUd1fBhaj1uv2AEpOdZukdDeGirBnpIIFF6Gg7L7
	0doke5M1hjTUJYqF2xvMDZw/REHOqDSBa5CVBIZ1ApLFuuC2wef5TXACNw/lyprX
	DHMHxg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7egt0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee34588671so3657333eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169649; x=1779774449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0GSTBL64LgRqeP391F8PGtCzro2cCQhAPnIDXVHDdk=;
        b=iGJ3L0JfmSWUejuRhxftYAiCq0nToX1KQUzy/vaWgBdt+bJPNk+PT/43R6hNbqYqkq
         r9+FHngz1EYqqvxd8pQTrbTB/xwivKLiHvbbCuBfX/j/ujz7xASneE3CfhPiafLyHqkS
         e5wwkZUIIqdhESEQyjN//AWUfKFd+f2m752cb7lehurUDjG+rPcPo9gEfCuKH0jDuRGx
         HUK196JqDiEoB+wfD/IQs7+vC+hh0E6DKzDmVGA0KmxTC6ngDmtD6KxeWKKudqvFuov5
         aeGqM9z/JAVa7g0Q1bD5FVqFm43IOOFW8AUWUO/VbbeyfsNnuqEG3g2X33rrOnRxpsXt
         iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169649; x=1779774449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0GSTBL64LgRqeP391F8PGtCzro2cCQhAPnIDXVHDdk=;
        b=dI6Of/7inBhMbKFVR8/g6/QK95bBbbnaSjgzaMtqaFDxLScSjcjRiE+bRPtzWT+cD0
         wqpi+Du6gDLw49Z3YjAcgnV7ndOn3Ie4TStxH/YG5fQbw3U8Ff2L32IY20jnEBrjCU/7
         zZdHRNGXDF/fZhrh3ypRl1CEC6PTZ5v7JqeMdWH9vkhYAyHtewZFiyKgwy4za5l3GtSJ
         HkwbBqSmxXOQvExuy5KKg4MNuWh7xtGJClXli9zFXBk3hGidaiwwyC/jEgp/XZZeC0rA
         gxjXR9sOJnFoP0h33tF16HrXOktj240ztxsYAjL6asDYSOS/d+eVMqAZyR/r9m8XuwUD
         tzEg==
X-Forwarded-Encrypted: i=1; AFNElJ+PIRDhzf2LeKvfeo6UNQvArRQiejYrPwDZpgO1TA5hl7IFsQBV0Gz5JRU+Zjk7cvO6h/rV2yVnDbfU7tW4@vger.kernel.org
X-Gm-Message-State: AOJu0YySfEMWj4BLA408gxGDngjgwyybcs2khXNZUrktO9Yjmip5+WpE
	hzX30paTbqdSdNEavU4s+/NI8QMTOnRCurdOUqzTdALr9SBLZBQlKdZttgStl6ZVzBEMSmLz1tv
	bhkIaB7dOLfSF0WwwMTZp5NfQVukfuUPIg4nLTODLiBNJ2ruQ18q0ONvrZKv68Rnlziko
X-Gm-Gg: Acq92OFBjBcrvL0mft7tci/WTqcw1mdKRCJ51av4etXFVtZgFBcutlX5fLFd9t0aPLY
	Eu/X/Vd1p36And6RRleZ/SjaA9irQAbvEaHJJY6OqeAYeKjBr1SSmM8ZYsGeymD3KOSbgipy3QR
	m7MxTxAb2s7lE+QQcJjx3a+zRBGYdG1qdPt5c7KPUcjKEHLGJRES/Ufw4dCjGqi3sIGNwyqxRY5
	euQ54/dGRgS9bqx5n3RKQV0qZbedpMC3tO3739cAw3KTBv83oJugkF5i3+j7IRwErGq7Yn4PhtT
	tYEK062zgQpidv5Kuh9LLYotA2Ncer/h8rGUluBGJGl0ERxd6Vj4lFhnLRUuUttz/aXeH0Lnstj
	tVdUCBQRc3pJmOz9gSw8MpP3NB0h1dQWBalQu2eSw50DFu+hml97KN6DV0haR50jCn1yb6qx6GS
	PmHNY=
X-Received: by 2002:a05:7301:198e:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-303986a03b9mr7271839eec.27.1779169649084;
        Mon, 18 May 2026 22:47:29 -0700 (PDT)
X-Received: by 2002:a05:7301:198e:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-303986a03b9mr7271826eec.27.1779169648521;
        Mon, 18 May 2026 22:47:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:28 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:19 -0700
Subject: [PATCH RFC v4 8/9] phy: qcom: qmp-pcie: Add Glymur Gen5x8 PHY
 config and match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-8-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=4238;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=e+ge6SFVDXSZrp9sZxMLj4iJXXQDEqpoi4+iUcg4R2M=;
 b=mPxErfRhw0SH57/BJgIP8D86VgsLj1bdZiVnh04jQhF6OAk+fnKRRhEMolsLD2qde6UVaDqBo
 SkCs2S9qWw1CzU1HreTkO/PN8p+uPl5URL/DPRfsbUMGdNFK/BnPWqv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0bf971 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=O3x3ihak103vsextEXgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: GP3z1AMu4336YUt5-IjDdBvtk1oLHJx9
X-Proofpoint-GUID: GP3z1AMu4336YUt5-IjDdBvtk1oLHJx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX606vgAMAUDDM
 ORKA4lD6doKHacECxGN7kL0o/8ZCwE4pkLxmsDqwUJHub3O3L23fPejHPQcfIe1BSPPjl9ev4QZ
 pgc78fHQ3r7f6qekhTVtkhMjfzT+ppB7dzHxnt5Hg0xEZtHglQIL4fVB+hDQ2RsG+Ab+LyOdJFZ
 jVdspCLZOWbgGIENzOkY/0LSkiC4jlzHBo+lCe2zl8agyN2AyKWRMwl1eoAU0s3/k/2qnFqFDa7
 QBbrrtkTHFb46aUlllxv64WkrnqhRu0mPOVrMJfQTlbIztSfo6DWwDzpY+CToHSnOqLgCU0+fy0
 t14ybAV9qEnd7x9O6Kdh+qqSW9Pa5iyakoHzB0gOHRlTtVm8lKXoaKRI/t22ktOvbpMosmMsLyg
 DQCnQ7+wJ20CWhanU9a8h94LQPSHpYSb3QgWQ+IIff16U4U+Awcykb6fYqcJnarVKxJ9wRTsd/2
 udfiunPi9kPoNNlfXqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108328-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1EAA577967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Glymur, PCIe3 uses a single Gen5x8 QMP PHY hardware block that can
operate in two link topologies: x8 as one 8-lane PHY, or x4+x4 as two
independent 4-lane PHYs. Both topologies are served by the same DT node
since they share the same hardware block and TCSR mode register.

Per-topology reset and clock lists are introduced alongside the PHY
configs to reflect the different resource ownership in each mode. The
per-mode PHY configurations and match data are then added to wire the
two topologies into the link-mode infrastructure introduced in the
previous patch.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 80 +++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d78d57fb64d6..d4aeb3e00955 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3399,7 +3399,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
+	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux", "phy_b_aux",
 };
 
 static const char * const qmp_pciephy_secondary_clk_l[] = {
@@ -4746,6 +4746,81 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const char * const qmp_pciephy_secondary_reset_l[] = {
+	"phy_b",
+};
+
+static const char * const qmp_pciephy_secondary_nocsr_reset_l[] = {
+	"phy_b_nocsr",
+};
+
+static const char * const glymur_pciephy_reset_l[] = {
+	"phy", "phy_b"
+};
+
+static const char * const glymur_pciephy_nocsr_reset_l[] = {
+	"phy_nocsr", "phy_b_nocsr",
+};
+
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_secondary_pciephy_cfg = {
+	.lanes			= 4,
+
+	.offsets		= &qmp_pcie_offsets_v8_50,
+
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= qmp_pciephy_secondary_reset_l,
+	.num_resets		= ARRAY_SIZE(qmp_pciephy_secondary_reset_l),
+	.nocsr_reset_list	= qmp_pciephy_secondary_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(qmp_pciephy_secondary_nocsr_reset_l),
+
+	.regs			= pciephy_v8_50_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
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
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
+static const struct qmp_pcie_link_mode_cfg glymur_qmp_gen5x8_mode_cfgs[] = {
+	[QMP_PCIE_GLYMUR_MODE_X8] = {
+		/* x8 */
+		.cfgs = {
+			[QMP_PHY_SELECTOR_0] = &glymur_qmp_gen5x8_pciephy_cfg,
+		},
+		.num_phys = 1,
+	},
+	[QMP_PCIE_GLYMUR_MODE_X4X4] = {
+		/* x4 + x4 */
+		.cfgs = {
+			[QMP_PHY_SELECTOR_0] = &glymur_qmp_gen5x4_pciephy_cfg,
+			[QMP_PHY_SELECTOR_1] = &glymur_qmp_gen5x4_secondary_pciephy_cfg,
+		},
+		.num_phys = 2,
+	},
+};
+
+static const struct qmp_pcie_match_data glymur_qmp_gen5x8_match_data = {
+	.mode_cfgs = glymur_qmp_gen5x8_mode_cfgs,
+	.num_modes = ARRAY_SIZE(glymur_qmp_gen5x8_mode_cfgs),
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5797,6 +5872,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
+		.data = &glymur_qmp_gen5x8_match_data,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1


