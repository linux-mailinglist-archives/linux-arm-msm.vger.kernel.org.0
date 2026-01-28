Return-Path: <linux-arm-msm+bounces-90989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id S+IaM9X3eWlG1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:49:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F1A0CEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27D28302C64A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E1B34F46C;
	Wed, 28 Jan 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGCW27Wf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhbIPFqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768E34F495
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600468; cv=none; b=RyQYtA2xD/iHE+BMwOy4OlnQdN8HdGkSaOVqbfEFbcoHX6pH6pQZ/PdRpcuMTntWDXOcXMsp/J6u1hTRGN4Jv5z5n6oMwhTk5c1siRxTWG8UQn7H8O4M0EGab9NnNhUvywGidymyKeQJSAiXghTwTUuoDx3/7Q7aQUZaw/Tr+o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600468; c=relaxed/simple;
	bh=HVoOGzL63Ijzzcm+Ssa/TUlQo3nbrzHFSzAS3cC/ySY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhdTI1DBdVnc5KuKulIKLqI07OWeWid6fHYPFR7IPYnYVF1q5YL+xcMyazXVf/WVms2xDeVrJaqrGA1mmmHDwcZXKsjuf+kGAS31AKwbcNgUZSS/n6E3PD0eC44u3RZlDK+YrvJpk798seas7vxsIPOLv7mQCWuzx89dV3Q8Zxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGCW27Wf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhbIPFqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927jV320202
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=; b=lGCW27WfxOhtkMg0
	xmAYayt5U+Y4tPqs+Uhg0uS4WmAMsvMTCmP16m52nowl8wApNPqpodNX8gvpZTju
	iX9dlYsJ6iO/VFEqU7MWR6GOiLGS6305WEwB//yfv6xL0ADbMADFJquemAasWEWd
	Bbs0NFoYlsIRhIVnc7Ox2E0Sd6JzgPASWJt4pDBu/tAC47Cch8q0qv4G4sE5XDhe
	3Ne6hfc8LNysM2HYBOpuuljmwVCrjJRYZbrig8DblK0I/henJJErPRUTfqbgIGiB
	Kl86j1oypwFeOd8sGoZm3a7O33LGXruVlX+LD36QEcG2rwNo3jCu+cxQ+A6RSz7B
	OMKPXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtj6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:41:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso18731083a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600465; x=1770205265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=;
        b=jhbIPFqR2uByjGBFSWZAYp1ehyAIJ6rsNQh0PseQeOP07Ws9v4XMyF5UQeWEg9opWo
         6V+HvLia/hDE2wZJ5eAMASSxnNDoeyCIfy5dchPTjEgEi/Ovbp+9Xf4XA5cBs+DWbhlz
         h3PFoidsuBdu72td7B5huK6+JjW4DSY2kqgoJQM8B6ck+CzfQPxcHCZo8VU1JcNXoqhw
         RkFThP3rDltm1Qowvx4sDXfIaMcysKhdXxlGKjIwbi8clIeTDLhadSbNqZXQ5mPrb3WA
         68Z0kDyEZFCkZ4nMFY0hltDWg3oJEvvQg9qmXC8Ljup/cJ7j0aY7XoT0yR8nepz4r4mm
         cNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600465; x=1770205265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=;
        b=DK7BIBFKo9Td7CTjgemu+p4BGo7HhSuykjjx2lbN+nq7wfux3xSlgY8V+sWBXYXiVP
         W7lv342OED1/0u6IqR9qcKpuV3V9SoNL4ekZlnwC/OwGPyaa3TpS8n0mdMyj9z68+wU9
         NP3Wb05ZWJehCBMboG7fGZINmDIdNmDDithdUkfKakvbep8lqhJueAsppj6JlIQCmeEw
         /g3+SeRKh2PO5Fr39kNS1oVKfKSfDfAyu3FSKv+kbtle8Afsryjn1rJpQD0h4Q4jMNKm
         hhwhjeMj3KPcuA+bGDgEfkk6e4q9wUxHfy3aVOOUjwom8QfNU2gnSQ7I0iik+SDf/etO
         v4tA==
X-Forwarded-Encrypted: i=1; AJvYcCUV0I3rG6yO3wCkDBryAAy50iGs9n7c9QtIWO1Xb5+Ze3r+W/fujMZ5iadnz5kEVMoJq1Aun5fzpp9umRw8@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWZj4FvJdbiT/DTfPEKM18cXFOwe+q9H7vyqPMa1NBHitzqRG
	I4uMxOZ6boI0+bQjs4FRb6r5016HFRmM91LVVTxjUNudViDQd2fjO2of7PMwfsO2Ne/JHwW7RTW
	3tZXqxj/3TSKaJaBbUsDc2GBHL82OeiPWeb/Cw4SlfeepcCEYQXTWNHFgRl0Or6dB4mf/GmTUE9
	jB
X-Gm-Gg: AZuq6aKt+FMzmBWr0TOrLThdLvekWEBflTDSF1T/R+HD6fG6qkDSJfZOpslyGaGuOwK
	nFcXqGiDgRYfqj1yb6+XkeDiC0TGUqOtykb2W9ny9rVMlZvyNRBdCeL123eEUSsq3viZkDO45zF
	DwDa0Oy3CaZg4yBJ3gcWk4DP5meHuiLrc6QNkD1ge9YugFihDN2KyzM2be5FUX0vJ9mx/diE3A/
	oG1jfOqn+wV3dibzpZPCa6CK4bhK1rttng7Tvg9B0cStf6TflBPbLpcwJLH9XVP/lBHPLZWLpa8
	3sF7th00/52xI01HmROvONV5xInzkQmELuRK9JH2pPJGBRn3c+9t5kD9D6LNhSSq9elTF6MatLq
	ABAY5Y6Hfhk05WiCbHicDPDe5kqsD5x5aLBSWJbNq2Cfp
X-Received: by 2002:a05:6a20:9f05:b0:38e:9c64:bd39 with SMTP id adf61e73a8af0-38ec6551533mr5233568637.44.1769600464652;
        Wed, 28 Jan 2026 03:41:04 -0800 (PST)
X-Received: by 2002:a05:6a20:9f05:b0:38e:9c64:bd39 with SMTP id adf61e73a8af0-38ec6551533mr5233528637.44.1769600464044;
        Wed, 28 Jan 2026 03:41:04 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:41:03 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:10:43 +0530
Subject: [PATCH 3/3] PCI: qcom: Add D3cold support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=6254;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HVoOGzL63Ijzzcm+Ssa/TUlQo3nbrzHFSzAS3cC/ySY=;
 b=CsCdEyib+IazFFEPavyzrwGgd4MZSvEXbcDP68eJlH11HaYRD0YNkrmgi8ygULfmBrSAlkeyQ
 wq6ImzoJ7xsCVXM7kQgEAsJ3AC/yE4UYBzxQ1iYDV0csAg8B7Rcy0P2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX6ceCcppt2rTI
 +TUOYvoyJ881Hi+O4qw8AowmjRkk+IT4SHx5qzDzmXZGi5vbJueMUvzCxlNjmEWoPSf1BdOrvxQ
 YZIiascRLLzZPWc3YX+NY78Wej/t9nlXh5anw8h9yOWME71O3qKfsRAFXQQXVrilN6l82qWZe2q
 V2GnJASBgzl4BJmdAbJOn3CplnN1s4thJjuOYOTwmV7dno9+lfzrg3j5//O8buDog5+dMcdOwW9
 S2cL/5aiA+UBCGj/akHLRuCb00P5vbaajg8NU9p9mNdyaBrdJnQSpnaJdGjVSRlZd8dn/QhRyOZ
 XzrTeQpXz2uOu824WIeVA9lldVQVru7QPhzjqRKjzqjkFkpG+lgFbGmHLyzH5DMj299f7bzmKzi
 aUS5ks1V5rvatThMWsVCYOBpTc9lcAvYFDmnhVbRoPM0sbNs2EfA4kL9ztCArbOndKQMnpWsXZ4
 rdeLCKaJ8FFEOUKqUgg==
X-Proofpoint-ORIG-GUID: xJdiGUzBv4FsiW71vlin7NfHhUN3QKDb
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979f5d1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RN3yzfvplrNe8VIVIhoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xJdiGUzBv4FsiW71vlin7NfHhUN3QKDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-90989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 631F1A0CEC
X-Rspamd-Action: no action

Add pme_turn_off() support and use DWC common suspend resume methods
for device D3cold entry & exit. If the device is not kept in D3cold
use existing methods like keeping icc votes, opp votes etc.. intact.

In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
in the controller.

Remove suspended flag from qcom_pcie structure as it is no longer needed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 114 ++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 46 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7b92e7a1c0d9364a9cefe1450818f9cbfc7fd3ac..bb4e5a29c452a6c0d4b31b2a9ff3aa62b984fb64 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -150,6 +150,7 @@
 
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
+#define ELBI_SYS_CTRL_PME_TURNOFF_MSG		BIT(4)
 
 /* AXI_MSTR_RESP_COMP_CTRL0 register fields */
 #define CFG_REMOTE_RD_REQ_BRIDGE_SIZE_2K	0x4
@@ -283,7 +284,6 @@ struct qcom_pcie {
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
 	struct list_head ports;
-	bool suspended;
 	bool use_pm_opp;
 };
 
@@ -1075,6 +1075,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* Disable PCIe clocks and resets */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1355,10 +1361,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static void qcom_pcie_host_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	writel(ELBI_SYS_CTRL_PME_TURNOFF_MSG, pci->elbi_base + ELBI_SYS_CTRL);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
 	.post_init	= qcom_pcie_host_post_init,
+	.pme_turn_off	= qcom_pcie_host_pme_turn_off,
 };
 
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
@@ -2016,53 +2030,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	/*
-	 * Set minimum bandwidth required to keep data path functional during
-	 * suspend.
-	 */
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
-		if (ret) {
-			dev_err(dev,
-				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-			return ret;
-		}
-	}
+	ret = dw_pcie_suspend_noirq(pcie->pci);
+	if (ret)
+		return ret;
 
-	/*
-	 * Turn OFF the resources only for controllers without active PCIe
-	 * devices. For controllers with active devices, the resources are kept
-	 * ON and the link is expected to be in L0/L1 (sub)states.
-	 *
-	 * Turning OFF the resources for controllers with active PCIe devices
-	 * will trigger access violation during the end of the suspend cycle,
-	 * as kernel tries to access the PCIe devices config space for masking
-	 * MSIs.
-	 *
-	 * Also, it is not desirable to put the link into L2/L3 state as that
-	 * implies VDD supply will be removed and the devices may go into
-	 * powerdown state. This will affect the lifetime of the storage devices
-	 * like NVMe.
-	 */
-	if (!dw_pcie_link_up(pcie->pci)) {
-		qcom_pcie_host_deinit(&pcie->pci->pp);
-		pcie->suspended = true;
-	}
+	if (pcie->pci->suspended) {
+		ret = icc_disable(pcie->icc_mem);
+		if (ret)
+			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
 
-	/*
-	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
-	 * Because on some platforms, DBI access can happen very late during the
-	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
-	 * error.
-	 */
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
 		ret = icc_disable(pcie->icc_cpu);
 		if (ret)
 			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+	} else {
+		/*
+		 * Set minimum bandwidth required to keep data path functional during
+		 * suspend.
+		 */
+		if (pcie->icc_mem) {
+			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
+			if (ret) {
+				dev_err(dev,
+					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		/*
+		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
+		 * Because on some platforms, DBI access can happen very late during the
+		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
+		 * error.
+		 */
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_disable(pcie->icc_cpu);
+			if (ret)
+				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
+					ret);
+
+			if (pcie->use_pm_opp)
+				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+		}
 	}
 	return ret;
 }
@@ -2076,20 +2088,30 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+	if (pcie->pci->suspended) {
 		ret = icc_enable(pcie->icc_cpu);
 		if (ret) {
 			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
 			return ret;
 		}
-	}
 
-	if (pcie->suspended) {
-		ret = qcom_pcie_host_init(&pcie->pci->pp);
+		ret = icc_enable(pcie->icc_mem);
+		if (ret) {
+			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
+			return ret;
+		}
+		ret = dw_pcie_resume_noirq(pcie->pci);
 		if (ret)
 			return ret;
-
-		pcie->suspended = false;
+	} else {
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_enable(pcie->icc_cpu);
+			if (ret) {
+				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
 	}
 
 	qcom_pcie_icc_opp_update(pcie);

-- 
2.34.1


