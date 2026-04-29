Return-Path: <linux-arm-msm+bounces-105123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJkUBU+p8WkAjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:46:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D82848FF15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D2A330C17C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E590538E5FA;
	Wed, 29 Apr 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brwlGrWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cb0KhiHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5AD33F8B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444971; cv=none; b=Pvidupl9qWA873e14h7sGAtgSmhGA/XbdLVOCzjRhXORXe9VIDQb7RIi4C40p3C1x4ucU5D/6lPL4sKCwndeaRoquryuEk16kyXpwY4tkbBN3IJdqhbt2EiesKj4MKRQLdvPGDVAJB8fMLJMlF37E3pbY6EqGGyXAqJEDSh4nxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444971; c=relaxed/simple;
	bh=rgQE2wlPYdGz9Ms01FRnDjEVC8FuvzCU6MQDVXSfne0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/eO27oqWpGSkyX3gGCAj37Ug7lRbKh7TYpBYAPpiV5PwnMXeSvh57MbPLituyxc/1/Ma1lbZyU/Ikb5HnpDJjMXQ1Moiq9/E4yxjKSGGyo52ttxrXcEdfkM29BFyGfoiuHpoyIzbP9DCtw9G8CiYm/mEzxV4/Goj2leptrwDIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brwlGrWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cb0KhiHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T35tob831369
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=; b=brwlGrWbpQWvfnNg
	Ra8fmfZthkqCqXFWESuHgcuNJf+NkvROFCbDVvOAmdbwTMJh8EbxVWmR0svUTStD
	pUroBYM+Zuzepc9ZsZlqdCQuI/KGg6zCnO3/CHFVTWGdu5Ta6484bw8rNqzYBDSL
	gOkFDTyWBxumA6iiLf4OJKmwm7CvFdDcobEy1rof0AwCgNpGDoQS24py0XnqfrXN
	rzavcS94b9cQ3/aI7fklP6HEevUbVpBtRoeZx/GZPnrthvfzsqXRmMv/X0TVPOPw
	sZ085E3Aqu8krV+e5FkfHH+SzPKFFjjGDNyFy025DpJoAGhiUAgRO2825ej1CdCa
	k1sf0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqaeyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso28892772a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444968; x=1778049768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=;
        b=Cb0KhiHCbRXne212vMS+is/8uvEKmiZfXekFnXv9Ve+dB6tcFobr3Bve5Y/aYqDUpF
         cFEsx3O2qdHeg8lz9fs+vy9phMFxTZAO3o2vLfy4KrntP2bebAiHHFt8sxQklmvAu/M2
         kE5Q28p/Cq1f8E5vxXwPA19g+HFQtUOtp349sZebjMiJ5U773BSSxIqvLvGHEqla+ZlP
         h69K8XZ4rOcPLJuSPzAsK8uodicVmuWX0BAgwrjXiOLSLoAa5FBnOZitZINVrK14lQdM
         CZtEsLakG3m4z6LuldesxliUT8NfUFfjEol9KY3k5IgiduZWe1v2+WDQeZJWWGIIEcpR
         3iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444968; x=1778049768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=;
        b=sQbgFa9rj5JX28WTYTqZNMxClMRkSdKPvHrYsiJm+oto1vPF5uxEqvqL7J7bxBxWS5
         LqfRDne592Rjez6FHcNBCkWA5pLOXgtK+kWqnFCLHZOhgLA1GBJlF2snsZl+X8JZyNH3
         OqX7UuogdNre0UbErh7M9Et8f07kVVoHCAIXy6Q0qpcPCYJrGJGNK9OLm8VjoSaOjvtw
         q79yf8wkLHqnfl1bEZOS5SHEAS6Gi8IX5+LFrrSSo71ENTF801EfSWPf0Nr2Lxmyqfs0
         1wgsEOviYWU6d0Cx4bqyUoyvGsVdCtV0pu8QEz8j45uE2R5fnb0zX3NScI7LUWzq53wF
         qcJA==
X-Forwarded-Encrypted: i=1; AFNElJ/fpGXy27iA249QCwluGCKxk5WcdvUi47/Zhzax7BDg/QIGrax7gAQMF8rACxhqQg87a4d2KEfpcjzhhDHF@vger.kernel.org
X-Gm-Message-State: AOJu0YzznTSZ8t4/wjSNZQJN1kZA6DzV6w42J03QHKNaCaTBSuGyJHXW
	Zv8w8UK4F++X6l4asqyryU0hZpEmuPa/yPEeX7j4jP+nIM6bf/LBZXFlon1hWUgvROtJsCZHkvv
	0Mtqd3CNJ3W5HtIP/mGrlBQ1L4gq5cdWgxV5vFiwjhqxUSdyiiqfbFNOYRvPdMwqn9piFw/xTdx
	vO
X-Gm-Gg: AeBDietAU+1HcI+SekfbDvKLiY2UDs5Yo0hdiDb2xIjHg5Z0E/cKxnqTXksAymlMks/
	0IxDR9vfl71z8FJ1VLDFwpsZgQpesj8IX1XPrxCUU0ouS22opXHX3dYN6b5PTLsgGD61ZAaiXsS
	uaioUkHE+zX5V/MmWIJBW9VMw8ooczcSFwY1NFqqXLW2wnXxocMIB9P2b2lGwcgnaukP/BxQij+
	GgJOM7WNITs52wIouYXK41oM9W9YFcw9pmVfZ+pQriGe0AUQWXuNm63/a8zFiK/thtwgbLVTzu7
	Y3OEbu/QtWuHfV3BO3GtU9UVDWkBOmLS+i+08fFWl0bHt//34GshGuEBwxEMWivTI8kCR8ddIXo
	XU18eOWnwYm99h6bTYGOpbrPFeWqP6wwsO5m1ycW2a5FYJvOekx7OYu5hbY973fjE38M=
X-Received: by 2002:a17:90b:2f8f:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36491c8837amr6235753a91.0.1777444968413;
        Tue, 28 Apr 2026 23:42:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f8f:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36491c8837amr6235723a91.0.1777444967930;
        Tue, 28 Apr 2026 23:42:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:25 +0530
Subject: [PATCH v5 3/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-3-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=5203;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rgQE2wlPYdGz9Ms01FRnDjEVC8FuvzCU6MQDVXSfne0=;
 b=JaOQDILfJYOoMchLl/cEYOB0wve+tsQCiwlZ6fMiP8IcMh282moLRs2rp/lrg+7a8ohN/4Pgx
 SXKbz9xiUeNAK/x7N3nEAaWjmjNYdphcZac1xnsDzcrx7NiIDmtyHad
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: py0OVmPCxW4mn6BBLeVU7K5klWh3s3R8
X-Proofpoint-ORIG-GUID: py0OVmPCxW4mn6BBLeVU7K5klWh3s3R8
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1a869 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oQbQ34n3Jerzy_GFPTkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX7oo274L089JD
 XmQKgoPp7lT83t+EwzX54VMU3mZIcBeMLl7dJeKiWl+JoEDgxBUE/3pt105pukDngMvP0ltFWWS
 mLHSHzHG7Zv08vx3zyVE5Q1txiFN8FhZA9Rhv4EW726gfmJ1EKqRTqTVclGY1h9kUP4+9rvISIm
 9Y8gCXQA6wCKFZdq7PNqnPZAQUq1sJeM544B80U3f5nluUsxXoK0p6D0VyWWJZRpLFXbKeLcy1S
 LW+kHxqyfFLu5wiRiIa3vq5E3Xf3KjWcwEZnSvKUHKywHIO2xsdwvJCaNDSdGrt8DuvioW5up98
 USfvOrZf5IZ3G++qaYvPuK8FU1a1yaO/yTGvtQfs4cQOjInGj6/iQSXrnfT1CCIEXMZm1bxwnfD
 u3FDYxG5+PIUMYczew62DenIJgwJL9FD0qKelDWl9YJrhuIpvXEgqSPAVdYLIQHBfW6wo9QC1t8
 HVUcmEU2X0/G5qClFcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290064
X-Rspamd-Queue-Id: 8D82848FF15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Some Qcom PCIe controller variants bring the PHY out of test power-down
(PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
towards D3cold and the driver disables PCIe clocks and/or regulators
without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
partially powered, leading to avoidable power leakage.

Update the init-path comments to reflect that PARF_PHY_CTRL is used to
power the PHY on. Also, for controller revisions that enable PHY power
in init (2.3.2, 2.3.3, 2.4.0, 2.7.0 and 2.9.0), explicitly power the PHY
down via PARF_PHY_CTRL in the deinit path before disabling clocks or
regulators.

This ensures the PHY is put into a defined low-power state prior to
removing its supplies, preventing leakage when entering D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 38 +++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 085300c1d1ec..9dd808e85409 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -532,7 +532,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -699,6 +699,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
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
@@ -731,7 +737,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -795,6 +801,12 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_4_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_4_0 *res = &pcie->res.v2_4_0;
+	u32 val;
+
+	/* Force PHY to lowest power state*/
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	reset_control_bulk_assert(res->num_resets, res->resets);
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
@@ -863,6 +875,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
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
@@ -918,6 +936,7 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1013,7 +1032,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1084,6 +1103,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
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
 
@@ -1188,6 +1213,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
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
@@ -1228,6 +1259,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 	u32 val;
 	int i;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);

-- 
2.34.1


