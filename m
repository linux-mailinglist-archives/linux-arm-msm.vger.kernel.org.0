Return-Path: <linux-arm-msm+bounces-105122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMaDOCGp8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:45:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAB48FEE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AFD230A354B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E780E3822BE;
	Wed, 29 Apr 2026 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8IQRfIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icOUuqCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273D38644F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444966; cv=none; b=DBZKiuFvcCfSwfIRUwC7LzGFLgCf03fJbJQtrcPbF7Fa2GDA88BrnoBmP0nQgRYr5GwuCZJqJrQ3RyXj3GBEQ9MnUPqkaD0IPpemGlyL5TsK3YwapKFz1aV9qs/p/5lPTSiPUnrb7fmvKVlBavG0BQRRi9cJyl83l7yCjnhAnMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444966; c=relaxed/simple;
	bh=kJOcLpJ2/X+O6jVsxBIhyhEdHIhlOc1Lfh/fcN/6y0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGSGBC3VVJaeEAEuVnCfrtm4OVkc7aynaXUnnO1qzfjTeMNKJuYLd4p7bYK2IQcN/clg+kuEQ0Zc2oKQ/mt3fTqMbFF33dAsKbSLT5SP+ISSHwa5h+6LRF/TwZ3OfP/PotbII/IgKXtOlSXkakCrWfFLRcLmvodPYnGPCQxq9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8IQRfIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icOUuqCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZBo21015347
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEfRbstRjVHeuT0nzZzxKbaNveaGv52bqCxDptLPZ5w=; b=B8IQRfINvxXIN5tH
	/bVnZzf5djPZX2GOqJN6eUTg+n5KQzzuUYuhxrQYaH6NAAqKT1xX0Jwu0o0jX3EY
	OdsNe+0GGI8nEVR0PAFOK6td2G/icAZ+y4VWnOPgxNubu52Mcxfb7a1S38vDyD0B
	jQBTdmjqSoa0tRRTbZ8GE29rCMtce/AOGsiOrjQWc/fKJgPKHf80QXfTv/hEtO/c
	bTQGOeoGMXkRpHCjclnTsF94HY/0Ebv1tY6MA7UYubv4HxbgeFwAdcXaHNfXhYwW
	7E5e+XQIW0VG8eCl1GSjF96++Z5VPsdWeQ0hHwc1mryqYbrVswGSMCe6HTyjkPxP
	b6uIgw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua730k2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so14513822a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444964; x=1778049764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEfRbstRjVHeuT0nzZzxKbaNveaGv52bqCxDptLPZ5w=;
        b=icOUuqCLpssMkmMsIndh/TvUuSsz+Sh9B0xgH4XuHp6c/lKnDfhI9X6VdJZnCxJwaW
         QQExq5+3bKkl1WO+iRYlBLDDM32W//Y4IOBOYWrqLV9Kq3WvNSLyRINZDduKRf385Xyj
         /KILO2Yx+jMYt9096fenIP8fzLNdKfBilTGy9ciIkb+gn7K91fI2WNxII/qnth4Rab6j
         UFNdbgY3lj+NOspdksilxeQ0VV1uwt+IxP7q0wQtFVWRJPeYx1VtJsK94xrfGs1c2OQo
         mdarBqeQOhnjH0fAGkhqa39VgakDs1UIWnN7luiTzYCBuYJBQ3gXV4K7xE14bvIbuCpv
         bTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444964; x=1778049764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SEfRbstRjVHeuT0nzZzxKbaNveaGv52bqCxDptLPZ5w=;
        b=icW0yKMJ69JQgLxcSPFA56e+RVQ6mTXhseVMM0bJFLax8ZQ4h5MyVCrxfkiMMcZgzC
         RenObTPtH0o8lQbch0bl0MsKQvr9kFCHRJ/pqyYs6I6djqe5AH1B2QL1xknz3ByFhpTs
         133iNUEEaq179RV8Ufy6gkfZipJmb0D6I5J8d8fvfpieVswlJIUCQ429dGmiA6li80+k
         sL1DTcBTPhHA0+3Q5m6s2DADqY3ct/eu8jEeHYiZRgA/nD0nSuFF7G8GGvn9RsIY6YtR
         ZeP5AQIdwWvZoKshSHkKv1vEhSNlF3+fYT0Xzfl0NlVKl8Sh23GzvS5CPTyRMLxw/6L6
         mrGg==
X-Forwarded-Encrypted: i=1; AFNElJ95eLVafGq2CC5Z0p0tGEUKHDoA91NF6aTcXMJPsGxj9ZOvM8DHnekZf0R9IIOAewLBJq+Lql2tQVaOM62f@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5lpLz6DvCk/Oi+ZeBqcSU3sk8JD+3kHBFDwQO/PBaZhBuAlaR
	qw5NiXfRCLJ0kLZN4DbAhhUBwU3JLMrTzUwm9YqeukRhDaxDM6a/Z5RMTh6/kt0WkKRnXMd/Ai5
	nh360BhllrhnUSpyi8yCfZyjDF6W6X6d9wS+IpvM1nbCN3N4Xqyjatqa4hs5LCEAih5XSy0HKQp
	8+
X-Gm-Gg: AeBDiev1mDasIlNrQBrjMsWrp0byHmZeeHo/zrrsLexPdLHbplQicj/rvwv7hks+JDx
	FXRUVFgI2UPClHBNcxbfQCo7yaBTSvhOY9EBu/YI0oJ/fTCsHYG2UNlUOJEwW8oFajBI/BVJq04
	dBISxc99dbUDiWZ4Ct5aWNpAsCkXJz/XXEYuhPLn8Rfxj4UfM075gkeczCNo8BJOu0iUC7quPhY
	GTHtg+Gmw+BG3LVWeI4T+nEl4w5ZrXi8CFVVlcadE9iwL9R+GwMvvLDf6jMAGKs1I98V4d5kvx5
	fko/i0SPsCm/V0uf5qJP7DlUIRR5XXlhWqpsc1GAN9MCoP2AmJEUwG5tofj2cBqW088AzxYKGa3
	n56bEtmpqR/+HS6iXch7Yh3tsEcm6Iz9YxZoZ3hsr5/dMU2TSU+fOuASEZDSuw0eZNRw=
X-Received: by 2002:a17:90b:554d:b0:35d:a380:6d1a with SMTP id 98e67ed59e1d1-36491f89850mr6689662a91.2.1777444963726;
        Tue, 28 Apr 2026 23:42:43 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:35d:a380:6d1a with SMTP id 98e67ed59e1d1-36491f89850mr6689632a91.2.1777444963231;
        Tue, 28 Apr 2026 23:42:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:24 +0530
Subject: [PATCH v5 2/5] PCI: qcom: Add .get_ltssm() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-2-89e9735b9df6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=4016;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kJOcLpJ2/X+O6jVsxBIhyhEdHIhlOc1Lfh/fcN/6y0g=;
 b=XJXnUN7dlDghLSLQOMsNyk25AY1nkORIexsqqq+avIno/Mb0yfR49fPhveofsZcDVoM3HEBRC
 QbzePAgnlAbAtE0iREwuOauc0FMh5cJy2CWrHfPnjffh5SR3E15uxZo
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1a864 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX6xK2kjqnCnlo
 zqNBadBrotTkKto1vo7/IMrdpS6i/T5SdOTEb/jT4vZOn6CATOazGMki8rvjXGW/7xxlEMZORGC
 xxJC42SwTRmFj2kQ+K1+zVbjJaov0IPQspTnw/opbfh/azFLeQc++Mk1n6bpiu/ehJI1nu6/v19
 MB+71o3Iw9Dobd4rkFnB74HNXXZu6VVlvNOZ48WiXr5R66MwXSRDc2I5lIVgYg1PdUXVMODRVry
 1MDLBKM3pU6oj/iN8t5tNpoCmU3yL6t0OJ2xnRrl9LUvyAXbL/5Wfprh0+4vu7fHBxzF0SD7UFq
 8Gk6L7/nQfzenCcxQcqhc1K3Y3fbHSbN7wikd0MGN/YewAwq7wkc29X+9Ra1mI3cys8vlJY4kPj
 ddCQKDDpwEV+tMDS+6qFvYHgSwn9IT2bD/PsO4125JzPqRT8WGUYo27Z/VKfZHXLlChed7jtKrw
 M0D4lxpTrcuDIzWCi5Q==
X-Proofpoint-GUID: l6vLqDCHJOEKB-wXDK_nTjWEAzUc0Jx1
X-Proofpoint-ORIG-GUID: l6vLqDCHJOEKB-wXDK_nTjWEAzUc0Jx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-Rspamd-Queue-Id: 37AAB48FEE5
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
	TAGGED_FROM(0.00)[bounces-105122-lists,linux-arm-msm=lfdr.de];
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

For older targets like sc7280, we see reading DBI after sending PME
turn off message is causing NOC error.

To avoid unsafe DBI accesses, introduce qcom_pcie_get_ltssm() to retrieve
the LTSSM state. For newer platforms, the LTSSM state is read from the
PARF_LTSSM register, while older platforms continue to retrieve it from
ELBI_SYS_STTS.

This helper is used in place of direct DBI-based link state checks in
the D3cold path after sending PME turn-off message, ensuring the LTSSM
state can be queried safely even after DBI access is no longer valid.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..085300c1d1ec 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -71,6 +71,7 @@
 
 /* ELBI registers */
 #define ELBI_SYS_CTRL				0x04
+#define ELBI_SYS_STTS				0x08
 
 /* DBI registers */
 #define AXI_MSTR_RESP_COMP_CTRL0		0x818
@@ -131,6 +132,7 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
@@ -145,6 +147,9 @@
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
 
+/* ELBI_SYS_STTS register fields */
+#define ELBI_SYS_STTS_LTSSM_STATE_MASK		GENMASK(17, 12)
+
 /* AXI_MSTR_RESP_COMP_CTRL0 register fields */
 #define CFG_REMOTE_RD_REQ_BRIDGE_SIZE_2K	0x4
 #define CFG_REMOTE_RD_REQ_BRIDGE_SIZE_4K	0x5
@@ -245,6 +250,7 @@ struct qcom_pcie_ops {
 	void (*deinit)(struct qcom_pcie *pcie);
 	void (*ltssm_enable)(struct qcom_pcie *pcie);
 	int (*config_sid)(struct qcom_pcie *pcie);
+	enum dw_pcie_ltssm (*get_ltssm)(struct qcom_pcie *pcie);
 };
 
  /**
@@ -428,6 +434,15 @@ static void qcom_pcie_2_1_0_ltssm_enable(struct qcom_pcie *pcie)
 	writel(val, pci->elbi_base + ELBI_SYS_CTRL);
 }
 
+static enum dw_pcie_ltssm qcom_pcie_2_1_0_get_ltssm(struct qcom_pcie *pcie)
+{
+	struct dw_pcie *pci = pcie->pci;
+	u32 val;
+
+	val = readl(pci->elbi_base + ELBI_SYS_STTS);
+	return (enum dw_pcie_ltssm)FIELD_GET(ELBI_SYS_STTS_LTSSM_STATE_MASK, val);
+}
+
 static int qcom_pcie_get_resources_2_1_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_1_0 *res = &pcie->res.v2_1_0;
@@ -1260,6 +1275,19 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
 
+static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 val;
+
+	if (pcie->cfg->ops->ltssm_enable)
+		return pcie->cfg->ops->get_ltssm(pcie);
+
+	val = readl(pcie->parf + PARF_LTSSM);
+
+	return (enum dw_pcie_ltssm)FIELD_GET(PARF_LTSSM_STATE_MASK, val);
+}
+
 static void qcom_pcie_phy_power_off(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_port *port;
@@ -1385,6 +1413,7 @@ static const struct qcom_pcie_ops ops_2_1_0 = {
 	.post_init = qcom_pcie_post_init_2_1_0,
 	.deinit = qcom_pcie_deinit_2_1_0,
 	.ltssm_enable = qcom_pcie_2_1_0_ltssm_enable,
+	.get_ltssm = qcom_pcie_2_1_0_get_ltssm,
 };
 
 /* Qcom IP rev.: 1.0.0	Synopsys IP rev.: 4.11a */
@@ -1394,6 +1423,7 @@ static const struct qcom_pcie_ops ops_1_0_0 = {
 	.post_init = qcom_pcie_post_init_1_0_0,
 	.deinit = qcom_pcie_deinit_1_0_0,
 	.ltssm_enable = qcom_pcie_2_1_0_ltssm_enable,
+	.get_ltssm = qcom_pcie_2_1_0_get_ltssm,
 };
 
 /* Qcom IP rev.: 2.3.2	Synopsys IP rev.: 4.21a */
@@ -1512,6 +1542,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.get_ltssm = qcom_pcie_get_ltssm,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


