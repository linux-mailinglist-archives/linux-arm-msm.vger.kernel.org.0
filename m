Return-Path: <linux-arm-msm+bounces-118661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BJdAEjKYVGodoAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD37C748570
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I1HExbe2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FsNNPdVW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118661-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118661-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8745C30554BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B58839021F;
	Mon, 13 Jul 2026 07:43:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF639023F
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928583; cv=none; b=PUiGIi2YrVm68i7va/UxVzHJC2+0UfnsnW1JOJbpj5NaKbgMAWTnCroUeLhDiw/QHy7L34ATHzagDhdlzoFtJKiqy6kV6DJzQfWFm4kwQ1lqw8qDHbGxEI7oRACslBZR2EpXj9JKylUPbKrRND3luS3ndv4Jqm1qDNEng5Ju/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928583; c=relaxed/simple;
	bh=KGHvR2+JEE8fe51pL4GYOFt+Id/vPIyh/xzYWv60Bh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fi2mAGmIa5aANmF8Kw9KoANpXruzSzju+s5Ms+sUAYtbQW5G9/zEOs8BUnoFuVVjfmamaWEvWTCAjO97p8nvXVaH+YItTIJKxzPpdotkH9PcvXe9AQU3Es9vZ741royR7aJKiT95eWVhJdr3qQrgy+dGIhd/iBg5tGBd01GuTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1HExbe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsNNPdVW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O2VQ391141
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbgEqLMqAoeF/SF20KCGOOd7+BYZvWxnSyKnE5SbO3k=; b=I1HExbe2oI6F4tjZ
	yA/YVR2bi71XOqGawPGg2yFEHsImC0o4amhihZehMxPrKiCihtConvCuOV4Vfx4+
	udxB+fIS4J9ZQxIcMBluXf7Kr0sbvmENI/puBFi3PvGVjyzyuu6XlyENRQX6OjlP
	UH8VSqZxgakBC3GSitcA0PELwY/URTr8cMzdFdzRTppJR2kZWG5ytyt60744Y7tu
	Z7rvIeJOq6UGh//b+O3AtrLjEBG0zpXAiV6UuX3MSwdPlk6Sy4/8IfEcTMhmYZPB
	ibzAu0RcPfb06tNZ/PpQFjGVfDv21pW7NnXgLptBmM/KeBvA9CiktZAS7Q6VdE7v
	uD91Dg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmw9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab041eced3so2644244a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928581; x=1784533381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbgEqLMqAoeF/SF20KCGOOd7+BYZvWxnSyKnE5SbO3k=;
        b=FsNNPdVWTyqwLsDcp40QFeXiwlTlGiLvjJSXFvGD+sNW/S2aKqz4lGCPl1fOVGcbrV
         azb0Qx2Wx7MdDzJq5h6C0lokf0B1DZ/AxQFHzIDSqmCXaRmD8WLeRd6pTgVlOS7U6+/b
         O3sm8CQ6wUSMTbjMslJXScRjEUXu1/sg0CnPwnQX/9FKCwmdmnoxkol9UlyhHV6ddTwg
         jhUm8UnmZ0hvyKjyGYbDwo/EcDiG2M5UlEkBW1NY8iipaCViO+MHcBi9hzuvGV3T0oJs
         5OKEwkSZCSHUA/CUKVM77u8qn1LmYUNqXCZIjAD30Ggl3m+e7Tc6Iz/DqZu4+6TCg16A
         Zjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928581; x=1784533381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbgEqLMqAoeF/SF20KCGOOd7+BYZvWxnSyKnE5SbO3k=;
        b=qfXpIdoHH2vusgnvo9f3fHMuQuyV72KCaDV+ogCLN98F8Z7LwJI7AJs3JULOgvLAW5
         EEAbFwu3o6WOMVKDNtpKknGEdkuAOFS3dgIjI4qs/k6YXf6iI55rpPpgMP4PMukHh7CM
         qdh/tBkNIZvtLZlC1CHkTmnGr0GikIWwcAJewZM7zpqSVrUsyGbxejfZFlqK/XyUh+Qf
         k0RthF6/pSOw+drt/RGpITS91DhQaY1YGZRXOnAWO+pBQEMDf5QxXNe6YN3nZhLTAzF1
         fjITlsGR5eaJoyfHB0sUZHkXJODb+EPuuv1p1QW1mrpgVonTxEJ6qSq1pVh8l1qH9s+S
         gZpA==
X-Gm-Message-State: AOJu0Yx03pEt5Ptz4uDHU037bA0Y1KuG8uRTN/ek9AVCVqQiTNDGzPLS
	N/vlv6uCfkWL8IZnnSI0WnsA/DWvyn0IUADqmdZoiQVIL4WpDBqm36+CiGSYuFBSkivsu1eINPX
	4R2jrijpGt6Ij2QSCBKJ1qzq+978lgGTNVY57QuK8hjbVS8GkJJr4LadSNSuHDwIUfwGO
X-Gm-Gg: AfdE7cn3fJBZrxHjyd1TUPuDfdWqmFB5bid5jd7u8g6p3FgzrvQIwoj2oi6TVYlOX9Y
	1WuyHp8xUUNPPHa528qj9vYp07EHtSxShiDxLfGYWOROrclEApiM8EYOLxSsTSMT4S+7peosZ+T
	D/UznClaOECaFYXUPWDUOBw871xlx335p79Y7i3pPNns1hwuxUEoVqqLCdU2EqfE9u9s4KJml8e
	yl1dXQSePVxCzfGMKSN3A9iZEza7OoVT4r389lBIe/5z6bsb7RDmwTW4uqqBG/iYuZMbXUQJxLG
	e3mY0/pck5fI/tzDB4qq7WxTgM/ElxdL4VDnS5Z2LsICaKUZwTUZhxmIgeHUOg3GC68uOpqTWrV
	cYaOEH5wOgH/ucdDu/l+nbOLkLPFLl4cxB/I08T1+EF1aPf02MFn53KntSQ==
X-Received: by 2002:a05:6a21:6497:b0:3bf:64cd:c45e with SMTP id adf61e73a8af0-3c11076511dmr8953112637.4.1783928580669;
        Mon, 13 Jul 2026 00:43:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6497:b0:3bf:64cd:c45e with SMTP id adf61e73a8af0-3c11076511dmr8953087637.4.1783928580257;
        Mon, 13 Jul 2026 00:43:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm61329797c88.13.2026.07.13.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:42:59 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 00:42:50 -0700
Subject: [PATCH v2 1/2] PCI: qcom: Rename qcom_pcie_set_slot_nccs() to
 qcom_pcie_set_slot_cap()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-clear_abp_0713-v2-1-4f0333a98d4e@oss.qualcomm.com>
References: <20260713-b4-clear_abp_0713-v2-0-4f0333a98d4e@oss.qualcomm.com>
In-Reply-To: <20260713-b4-clear_abp_0713-v2-0-4f0333a98d4e@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783928578; l=2114;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KGHvR2+JEE8fe51pL4GYOFt+Id/vPIyh/xzYWv60Bh4=;
 b=i5qguIzH2Ol9/nNf4c3t73N3AmgQyAC4822HCYx3Nt5goQl/HCe8AhbzBCfNgB2EDbEIJkFR3
 +7NUGW9l5+pATXjiv9e1t39R0QJxvAbBfPtOnQQ+k+GF57u8/php4Mx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a549705 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UWWLHM8_V65xiIckHG4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 20goqOX8aIbvgMAl8XNIFT9HClH61AMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX/ojLPYq87SyU
 QkzWvxKigZB2yj76aqMXibtAt8GzqaBS+9PKEN1h8/TsMfsOLI02jahmC5B+VX9QGy1k5jl/cIG
 NKmCyHqU8D9WRXbAqsFQZHe9RIQv6PaaYyicQITIkxGl+sZTGl6Nz3ovbPrcuXooLZ2F7ska25A
 bwM4g5nkPou7Data3zWVD65W0vRQqp+JxhpjHmQ8ev8khhxmUxc2SCNbNd4sHxmKOkrnCBVHge/
 +crN8hNrAe/sNdj5TiCu1Jmh1t4+9VgZCYI0klIaOEYmxSkUAIExLY8e+HUOj1DEXIheQcCjkns
 Eu4YkkUEL7EuitZ8ag92a2D9MCGpylcsC9VyQGczO4m20toDIChc1EORm3NEsv9GURgMVlhn6VR
 yDDySzGdVmCCb+YUOjPS6s6JurhJVFeF0uIEVTa34IBbW4yN8bnz2bGGb8AYyfVmakficQJTzXk
 KzR7rw22X27j1SGS9Sg==
X-Proofpoint-GUID: 20goqOX8aIbvgMAl8XNIFT9HClH61AMI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfXz3I+ERC2npFq
 F7zdyKTicYw+qdaPD9UCY0qT+rtKsnaonzkRNMzZ9vWpioI8SEzcdiJ0WSOdFFgl7gRkssKNe8p
 N4JBl34GsMiU+C1JiwIBD7xB0rlVTeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118661-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD37C748570

qcom_pcie_set_slot_nccs() currently only sets the NCCS field in the Slot
Capabilities register. A following patch adds programming of another
field in the same register, so rename the function to
qcom_pcie_set_slot_cap() to reflect that it configures Slot Capabilities
as a whole, not just NCCS.

No functional change intended.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b193c989b2b8..465c940109a7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -358,7 +358,7 @@ static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
-static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
+static void qcom_pcie_set_slot_cap(struct dw_pcie *pci)
 {
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
@@ -580,7 +580,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	writel(CFG_BRIDGE_SB_INIT,
 	       pci->dbi_base + AXI_MSTR_RESP_COMP_CTRL1);
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }
@@ -660,7 +660,7 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 		writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT);
 	}
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }
@@ -759,7 +759,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 	val |= EN;
 	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }
@@ -1078,7 +1078,7 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }

-- 
2.34.1


