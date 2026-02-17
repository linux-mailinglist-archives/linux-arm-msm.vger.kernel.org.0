Return-Path: <linux-arm-msm+bounces-93128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMowOjRPlGktCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:21:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898D14B45F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3309F305A6D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDD8330641;
	Tue, 17 Feb 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEL5cgui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFtmxDb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB8D330649
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327174; cv=none; b=guBFSw8iRk2Nit+Inq9BXqwsULZS2160+z1pjXAzbeWXydk3x//ZYDIDC9RtlLQiqTd5S4J/Qb3OTsBwGkir5k8wp2EDw9aDFxdOFmVutWXtInscnPrX/hyISydGu9J+Ug+Jmxop/pmmExuth4lUmWt/Yy4jOWrK7eJvL4zmuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327174; c=relaxed/simple;
	bh=RI4q6fSSubOmDgNNa0gqplTxflnkQiZtd27PDlBbjys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3NRXGw7yXFmUt0cepa8H8w1mt0WSj4WFhQiupWXBPXuxoBjvcsxoMerKL14nubK9JoEw/YeThAhe7cvISCInCBezkE0DDILQvG5xV5oAf+Cfmxw+TvM59SyS3spgyUClyZZNDTBhLa36/BXTV3KFZbb5MDr+50IC8QQo0uYpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEL5cgui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFtmxDb7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7kvX910705
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=; b=NEL5cguilh1bR/cM
	a7PuV9BQ7AW0HX4J9m2MdiGrG7Fp46J7YHAotQdZJ99z6/tpvSWGq5aapmVf6WIl
	mVHE48iPMzUegKNvvF+8XDpPBV7klhOu65cFgU4kb6HhUepYDIuWqTZE6VLlc/7E
	1gSBeEnAA2psW0prH43t/H3TNRGYcS+PAIrHPpicWQV4fbanLwIBkdwOVheoo7xx
	tw93XnNt/gsh6CuvrcyOLmlr7h14cePr5rCZVtXh5r+F1JrWOVvFrcdYlnebaykL
	DsrkIZ/OWeTcCqUv5blkxgBJfWSGrZxbch77/zrE+qeiuACaIloYhimyD/+pAOzX
	DrcxeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t3j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8249ba7f6e8so1899360b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327171; x=1771931971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=;
        b=eFtmxDb79BG5Rkqb+xGKLy77w0mcHOeZHZpr53xwMaCNvO1qM2ebhnXIbpL6FmHcfb
         fAuQQRfN9E7eUnjL/FFV0HgzDHPMyGYmN9nV8aZN+86eKUjl96FtzJIEuhvNWpyC4C0e
         lrfXl10UwcBi9cfyquWlfkpt/4PJN7qbF1RD4T+J4BV3U8TyWdKKM/0x/fkkSyrb4dQk
         tvUrCd8KVqu8hgbl+f9y+DZYR0afaJv3DMn4t8XhABBU/FIqy3XQUjnzRxKoDOzFQXsU
         5bnoGzTbKx8n7gaXhMwjP9Cwsp8SAXDqULS3bRgREeywW7UOnHkmqZMD8txrW6R/3oZc
         TESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327171; x=1771931971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=;
        b=Dn50ZeAO4CzHJkTOZuAWNVyTMYwJ0q3QsIWbGf+RVHEICMvO2RoHzVaa0xIj3sIfQc
         6wnCJTpJxUyF2lkE8nDQI6CA3BfcDgBSngEmxmG8YUgaNWbumtjnsiF5RerRonzJBByA
         22c6LcnLiWCPX/eex0EnbxHSe2/iAaylEiWpzQes2vvHvTbxNoRWdjLa0UjGEZpwRF8I
         MMfHGOxUkgI0skgHEZeDpSWsq/60hhYetzkFeDgKWX/VT46J96E/erkKmIEdZsnu9F7N
         pBg8CKeMTGpNapPP8kKBgao7f663DGUclYmo8gm9NMGhX+0ZupBh+0NH2aSW40Mxas8W
         kOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYy9ECn57NFB6i04bh/LUs3AVeeJ+Q9a0abqQEyPaRi7ZqdjER7NandkKeWTaA/A8Og9NBp9SPau8seX8N@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqb2yecsw3VeDqc8z0lk+GoX1SHuL2kB6OwUDhKfyRlcelcpa5
	w3Z3hnpZzgPuiuuQ61Z6Uab1p2Q4VIu274500H6P7/cc31NdcB/qp8kB1hNXkLU8NukFoodiNmc
	SrxX2K5AizBq3uqugwJ2YZZlL42HP9ZBXXU+DUacUQbRlh7VgUO1I2af0CbvOBT7UZZNF
X-Gm-Gg: AZuq6aJtDzSx+YGAqBwrPunsMNMQErtenjzGbAzP5kYZ0v1Bb0Ga2FjB9iZbPUIq853
	3vi9iqLF6avR4XvoLb+ePMas/z4TfQJBBtVTOkDgdp4+fc0fkdWydnRGkSbaUArLpixrlAFSLCh
	TjnHe3CJb9WCYPnHn2Pa6I8KYzbiO9mveQePA7KApmwlnB6jv3VgX7bM6nH388QL4lEcRFo2EVr
	oGIHTu96yohyRKFUnjb1vv0nnlWLCRofxX5WVKJIOspPdmwsA1Y+Yin7EpZUlvnOrQD+8dGyxvr
	fZ4zXjYqVUpwI9PZr5N2VL+2ElI2d1m0VvEJx8gmLN4yhwHaupyabSpMzelz5hly1GBQIKfJ6aI
	SM83eElerjjyqOA6PqL9iFgF2x+95XjrM0+MbZ9DI6Yu1dxuXGxyvnMcF
X-Received: by 2002:a05:6a00:4acd:b0:823:1406:8797 with SMTP id d2e1a72fcca58-824d953488cmr8975264b3a.31.1771327171109;
        Tue, 17 Feb 2026 03:19:31 -0800 (PST)
X-Received: by 2002:a05:6a00:4acd:b0:823:1406:8797 with SMTP id d2e1a72fcca58-824d953488cmr8975235b3a.31.1771327170627;
        Tue, 17 Feb 2026 03:19:30 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:30 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:09 +0530
Subject: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=4007;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=RI4q6fSSubOmDgNNa0gqplTxflnkQiZtd27PDlBbjys=;
 b=li0xu+gi3ab5XV55aDVCdK4EDUgeaa7g/6a4LpfP39jcV9HM2K+TWtxoLN665Lm7JJn/gDR6A
 p55CKSh6k9fAoU1f+ldOyKH3B3W6LSkcx7zyXglg17snwRy2jUfcT+Y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX55VFDrsDeuku
 ZAo+fXBrucGlWaBSc4GVVtXhIFkqOI55qJbmzsAAbe5BnAKbpnQdCnEyWh2l3FFi36eRrMmTzH8
 vjXu66gKV2Wzc0zK7avCMLiZAJ8BRctAliLnw14pJ28GapomRvr48/aYBVhcx8Q3vdT7VpjxEdN
 F56rKLdht1kG8G4Rw24jr3kYVQ0Bs+3+ey4bc2WeOKRGWUURoM5WnwDDjzamX7CVm8ugu6HzSV1
 JSiUW1vhqXf8O7pErpCVCGRjyodhKRg8vNZW/6nYEvtB+5ox72U0QduFK61Jx/3UAfsZVdky1Xp
 wjYEJ5+0dAMuqP19r1A2ssUviNKp7NXfRu0oon5JtzwUBx5tOPE5PTkgc+VC385iddavC8zqvoi
 NIq4X6V5GmqiSueUKi5kT2ujeNcYaHMt5dczwuDUgWCpl3aVmJ7awzSIOHen5mvRBEGFaRn2AxW
 a1WC5E7qTbH8r4WHMRQ==
X-Proofpoint-GUID: cSa_E_fOvlEH4WK3VFRoeBRIN96ZqSZP
X-Proofpoint-ORIG-GUID: cSa_E_fOvlEH4WK3VFRoeBRIN96ZqSZP
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69944ec4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93128-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3898D14B45F
X-Rspamd-Action: no action

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
 drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* PHY power ON */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
@@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* PHY Power ON */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -994,7 +1006,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* PHY power ON */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1065,6 +1077,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1169,6 +1187,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }

-- 
2.34.1


