Return-Path: <linux-arm-msm+bounces-102163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GpQFh0B1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:05:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD663AED1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 779EF306023F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648183A1D05;
	Tue,  7 Apr 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neYlXzff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ec+GAdkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C513B6C12
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567018; cv=none; b=L2ANVmGC4XD8Cr/tTCEPqYRgJNpeTIkcDL25w3giflP/i8vIoF9yo8x2BKgcuDgQxWLcl6/LwbWyTMDDafPUj94YoZ/WA4uAW7/hD7Sgq8zV9BBLisNZAo2L+tAg+beUahjqdLFkXAXN+BTBr4y2aMJXrikKx2xUWkhoOtxvVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567018; c=relaxed/simple;
	bh=p9k1+/wF5h/48gQ8oI4Nz1vPnqke7I1l9Z0Jkky+eGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMt4mVj8CaxQ2ksXXn1Zkir3257QQXN696UamaOlRkr+ec0uaJADvN/Upbitr/aPbMz34OOX1SdiNSBJ/eeoByQ0/utJVPIOcWe7Uhg20jI1h4eDuzYs2/0OBajtSBocATBeSfRpiieXm3JPumXBl6YrIrCtfOPlYr8LULB9WAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neYlXzff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ec+GAdkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CUajn493331
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=; b=neYlXzffH3/tWdGL
	BP23zbmQhq3CKOr3rtHAP3Ji+bi/3KtGu97G5CY3SFnDVt8nGg8I30fSmHLF9elC
	d9Z1h5q3cvKELU2xZv0ObmZ2w0GUhPC/7o+mkJFGi7a7Wu33Xax2R5TjL1SlLrzm
	fH4uBzVFcenFQr1KGfEz1hzBEZTM9wivgAGYwqlE0gM+CbEhcRZTeXBS4M61bHk6
	765AIOAf5ZjTbzkqHSc746Ikw1jw8jlWeiTIwtQvAlXkMWmnr8YrDLVhKqLTp4FC
	3SLHHiQhwbmHCh6yLgfbyeQhmaAwZfpaR49e/KcxGcfqign5q1vLq9y+RoM2mQ9s
	o/2BDg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8trms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:03:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0bf2b3879so133076455ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567016; x=1776171816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=Ec+GAdkIHuhc+YAvqdn1YS6jvFcrJdxh4NZuQ/VhUklXQKZDHOsDipLRlAzEz9tYWA
         IN9MEhLjMhplEoHEj6WWH6CuuuyDmj3ys9y8zN3XdztUacj9p6TYK0qUwx2ChUGAbby2
         VRJdVdtmCBwt7enMimf3Qi5dquxKqF728JIhyjiGgLVEvOwlgfHSPD2PmQg0ez3L/w+W
         kYKqAC0SeI/dcgmM35lOr0h1+NlB15kiGh9kKASTjJj/hjIdy/WtaBNER/IucSDMr0Ax
         p09tWe+zlUcpnyjxaIRV7Cd9QtBtheVLNgV3HaG9mpsOsq4QAXd/xu9J9K9NVYwtRQWb
         Z3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567016; x=1776171816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=YbLzQyg7ddGPGxD2FbD6pwEOp6N+WxO13vdJF7i5U06WKSjLeS7mwsbdQy1e2s6gND
         i6zbcLINLWjRt1i9AV3PdA4nE11dEMhe7kZOb56dLMgRF2aweuVz7yXsuQItFbzE4QbV
         /BeB8hJKcexyjkJPdeXWyNQxyaQLeb7Iq3P+pLccoWtobQ9g7UuiNMMdxRjg3ul6Jg+k
         ZMowdJzLvvGjHNVTCzjUG+vzGWRc3VLIsrH6OH4XcJ75XUsY+yIc4TSQCY6MKKFpkbog
         AWxw5wb5TUMmADaKpxDNEpoIbV2wh0BkEiTRtYJknArq82jumpbMCte6J50ejwZSO01g
         j5LA==
X-Forwarded-Encrypted: i=1; AJvYcCWv/wWu1G2IBRhfpuB0+MWl5iSioOTKGKKu1kTetYCR8aFBInsuYyhGPqmSQcu80ZmlxqaKsu8IoTE6g05q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nk8XTajj0aQ0wIT5i8R6EQbgzBa/4NfYO+RJbJ3o3214HzgV
	F/7wUK5Nvyd8YfZPqjpa4y/VRoG3mDOow68gOCGBUzZ/9tYwmYHrfZkN89Fx0RjLHeRqNSdqs+o
	Mvdqps7DG7H7cUZ6ZyNxEYfEv0BdLMs0rftYBoPjlM0mHopYxCFqyXD5QpVYpbcOqNGwJ
X-Gm-Gg: AeBDiet8PagO6cdwkS66Be2R/kLWbGvyotzVlnar0odWX4UAASIWdoP4kFOrE+S1Tlq
	J+cId2u9NNwewG6kar0KYxx3ku+Txdeqv7YgEXe1Ofj4gV7PMAADfJB9RUWC1zUL7Zv3q5t687C
	e1ftYKGx8mq3Tlj26ATBDvf8OmEBLpR3Vpv7wBcAPYTn0sox2PbJMlc0gxOrGO/PhzAvLmIPbOv
	yfrGDuBc4ftgADZ8jDRbz/dKE5YRtvSbYvVZkj5uUxlrJLudWlH5CtG5o6/nE+006N48LOh7Luj
	jOgsPTjqtn6vw2XzadSFvQV3/R0oiw+lA+zlY2IsPdupyHvPHpgXRjwlblHElf4KEA3F9bGW4zo
	s+ZQzgzm9igldygdds3S8gwiFfpNchGJlgpl3XwzJd2A70cOzwTa2WnXm
X-Received: by 2002:a17:903:1a26:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b281675682mr168863045ad.3.1775567015088;
        Tue, 07 Apr 2026 06:03:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b281675682mr168862275ad.3.1775567014367;
        Tue, 07 Apr 2026 06:03:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:10 +0530
Subject: [PATCH v4 3/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-3-bb171f75b465@oss.qualcomm.com>
References: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
In-Reply-To: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=4739;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=p9k1+/wF5h/48gQ8oI4Nz1vPnqke7I1l9Z0Jkky+eGc=;
 b=A/9mrwa1cEZn/665Ty4xv3sS5FQbruMYgdYZxpmFWpzrmLcBwUA+5nbcZx9i8UdCzGN+Mh8Kr
 4mLUc8D2izrCNZohAfCFDN0posPPlZAgxsuu+twsHUjGoamViF7SSMd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 1Hs-8hReaNes25Kbw35FQMVA2beqPZfp
X-Proofpoint-ORIG-GUID: 1Hs-8hReaNes25Kbw35FQMVA2beqPZfp
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d500a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S-wDCh2AgS0RhsWIeBgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXzrPxWRPpyaUU
 9sJanBzpry4njwtdxMoi6u+JzA5W/GlDi/Jih5MLProsJWKMTcAAyPQ0rAen4poAeirT9RAMG+Q
 +uBxkQuDf7hyUC1z+liJmKmvPcti0GukJ923OeyzyBolNCV89O7hWlKSp6SkMkpaFOa5OgMkstd
 MP/nrLvjWaA5oU0kAei+arckBjlR1kGrocnLx+LKjH4jtia85sFROK8DjSxc2PV0+9N8sUtrbif
 FvjlI6HlbWA5Y5/ntC44c9M5CTc+WDc9x6hew+Ki9LgBH+GX9WaXwCPJAL7IUo/5s9NKIPTLvFY
 PcGmedCDb/RJv/yo+954BeiIJf+kNY/3HETiLOrD9/dbqKWlTiOmlxmcHGETD8HVqTwKlRGG9/z
 rG5+zAsLqLPOZHn1+x5nZAYa+iDRrUnClfQkw8chSlEXCyBZbxAGbRQqwZHzgmzaUcFSFrN25Z9
 /qBtrkZMTYvmwpmRQ3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAD663AED1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some Qcom PCIe controller variants bring the PHY out of test power-down
(PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
towards D3cold and the driver disables PCIe clocks and/or regulators
without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
partially powered, leading to avoidable power leakage.

Update the init-path comments to reflect that PARF_PHY_CTRL is used to
power the PHY on. Also, for controller revisions that enable PHY power
in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.

This ensures the PHY is put into a defined low-power state prior to
removing its supplies, preventing leakage when entering D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b00bf46637a5ff803a845719c5b0b5b82739244b..c14c3eb70f356b6ad8a2ffe48b107327d2babf77 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
+	u32 val;
+
+	/* Force PHY to lowest power state*/
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
@@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -899,6 +911,7 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -994,7 +1007,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1065,6 +1078,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1169,6 +1188,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -1209,6 +1234,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 	u32 val;
 	int i;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);

-- 
2.34.1


