Return-Path: <linux-arm-msm+bounces-104912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DsU5KrR08GkMTwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01F480919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2467F30FB23B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF4F3DA5C5;
	Tue, 28 Apr 2026 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKdGFCWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7s174C/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B23A7831
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365455; cv=none; b=N/qk//lUWH2i4CCJMJeLsrnrt7Yy1TjJXBhrb7krTtFzUVhlXsZLWuRKsu38NSRYPfK9JtNnWJbln5ijqcM8I1P7QajhK1A4npcXK7Q4LrIZ9LKvvcPxYq2cNU7sqR5OL8CDJUkT2g1NRtOLE17VC0BYqIeDfmwWvc7xnUFstqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365455; c=relaxed/simple;
	bh=XiLKTsze8J8AZJi/BMBbOlFuV680Mddl8yNvZzrLHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jsk48eh5iqTk/IdM9yyE/h+X8lsL0SZgdF18ws0LuIC+ssX9nxmuT3fwLRIDFIh8EnIKDfzS9YSQxw/79dhl0ktGFMWNCTAd6zJbNneL6lNYLhpfhQotuwfU7QbbjfTdlm1kNOQbcZvfm7o6J26LLb/zGYpC13uZd0X3+aiz3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKdGFCWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7s174C/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7uqbM3967993
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaIwIxnOhznyRxBC0cU16UUPAXL3RW+G5mxfWpJe9Mw=; b=CKdGFCWnnvTXRNTQ
	ZNksRjHxmXI01J/Tb20091Ow5iKHuUClqaEIbzp/VRM4LxDkwo7bm4EKCw38NyZO
	Opb/HOjcU0pl19LP16eQ8Aiq761dHW/a9vDWFBIPhojlMi2jlnf9Cb1kwDRlN486
	g468zdeKHFKiz7lvEHxMgL3tFgU6bMWFvf0YzSlO1ZRcWsB5bpCd7XaE+gNjALYd
	IAgKDz88lTNSN8tI5nCR8x026p5BFkAlfatfTNIo85MHDd39POzl8GY0iOGnNBwM
	CaOQoMgOsEnDvfbyevzgCKMYni9Ed0+/Y9laMeGYX9GAS8zZalHtKI61b1R/3g81
	MkiAAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0g539-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b465bf993cso114178445ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365451; x=1777970251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaIwIxnOhznyRxBC0cU16UUPAXL3RW+G5mxfWpJe9Mw=;
        b=L7s174C/SXP2VKKGL8Z/c4ZjtHdnKZpFOCFL07sgv8v6v64Ebban2Y/XWZFPPE4JsQ
         IVpJVUPYeQX57CK02lbzxDmdCWmCLg0RUfc5qYKgpOG3eXzy/N321Mq89KN7I7ctNsBH
         laJumJcY56WeHOeT7o11nKSgdp+o0lnPBdD9NFQ9yEvKwS4irT0LLex0oyTY293Cg8s4
         3xsqOV9j5tf05BZFzrf4IdjvMdB3j+lmD1fLxzQ2zMSqqSNLGpZZu1nZqBmVkkwFt0sB
         jlzvo+SP93A9+qqib/SVlXd7w4t8atVESODZwO+V1rSyCFil1G+rlM3EqpcVv7mAgvBr
         syuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365451; x=1777970251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yaIwIxnOhznyRxBC0cU16UUPAXL3RW+G5mxfWpJe9Mw=;
        b=qif8tcrPiLR69jKpeNDvpGZLE4cka20xOnB2/guOFFShHl7yy+6rKp86t5uqO2VrAf
         aX2Kqhm/kkn7i2xNqmPBDWo1U+vptXFIGE05fg1kAqShJ4NTgTtn/D6AYwfsqWxep240
         XMuv0rtqeBcUgDytGGAaiEpa7lD0vzjKkwBll6sRjycqegfwofXbcN81FuCjUwnQGQyC
         McXUGDx81jjskrfPFJm8QrYeH9fHmBV5hpKCoyfMR269piiZ6t3YNn4ovT5PPKCW0fnn
         8Ydvta9PBXYMOhNuCA1rsn073mtDlLv1H5bJ4aoU5Lmuup0rWbgNiknt/LPpUqFXxkul
         +BFw==
X-Forwarded-Encrypted: i=1; AFNElJ9rfXqPNkrThM4Y7QbdSrzTi7vNPEKb0ETAGNKLj0Gwq9oN/15rA1WISC9bakosqWxIcSFPM1sA9MyhWXGV@vger.kernel.org
X-Gm-Message-State: AOJu0YyKArBBs51NY9MltOEt+JU4pIW7lp1Nd5aq/2Sc5nLOVZfyn1zo
	m9egkRU39PXTIDJHQd5zpC40fqK8GUefu1Cmt2EPh8xmg9ETmGMhqZeLNos+jo1LI8lLhAbbpVJ
	QDn3ykZI0rHV6ImdM48543Yjz7a65aQcHQtkiWkReqCw91qvmUZDACGsyC2CW2VNyHNxf
X-Gm-Gg: AeBDieuYEqjiwfLv72YB1bm87hKCZEH1WsOvXSr3tV/kF10aasLncAvoHlxReX4FD20
	YcrdiCNTbm1RTV9w8MBXM+DGBZlCOCiLKAAx2vRlriP+A5Yr+5STaF2lbcSjver1Y5me0mdG52m
	kP2uzqcmoeUM9c9EYbDJjG2gsiOZLYX+854koBAUBn7fIJn2hEP3oyAi05gNiDRQuF8pUHyHcKO
	0IBnyg4Ri6UlFHPxSjztTo98XRK/nn70hKsYytWok1cimwRwPxGlqz2EPWwpeDZ40szUSpPO4hW
	ls05fmSeQWA/53j/mDL0mdKkwmy7AarCaND2l6+b6S0KVGRQKuMqk4HzdT1d289n8ezTxw8javU
	JBE8gd4vJx0VRtSjdgOyuic+vOXa78IEVZDU0QQzHGZgtjZ8e01KiXvCG8ehsyo8RQvY=
X-Received: by 2002:a17:902:ea05:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2b97c3a24admr24103065ad.3.1777365451317;
        Tue, 28 Apr 2026 01:37:31 -0700 (PDT)
X-Received: by 2002:a17:902:ea05:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2b97c3a24admr24102625ad.3.1777365450808;
        Tue, 28 Apr 2026 01:37:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm21645315ad.84.2026.04.28.01.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:37:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:07:15 +0530
Subject: [PATCH v5 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-t_power_on_fux-v5-1-f1ef926a91ff@oss.qualcomm.com>
References: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com>
In-Reply-To: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777365442; l=3731;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XiLKTsze8J8AZJi/BMBbOlFuV680Mddl8yNvZzrLHJE=;
 b=g47OKo/9QXn3oxthv11scYA0upYKny9R5Bl2k1j632CT3/up21E5N8hSJv3ggEu56+2lyzWt4
 n21McJlZhbxBJrQSTW4DbelAKFikr5Q/T5elz49WhQrRghTr/GJjNow
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f071cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=j3416i00YO8nPnzCGbIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: bP2b6gCkKfUF_m2c0qcjHLz49HhLOBVX
X-Proofpoint-ORIG-GUID: bP2b6gCkKfUF_m2c0qcjHLz49HhLOBVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OSBTYWx0ZWRfX+8bVQKTAklf0
 oUQNv4rOWTyHQB/Y1dmT158/6NiuT6AusipUxm1llUr3yP7xPVZBHoXpXQhgyz5JykdNS7girYK
 tqld+fOW998pQCLJ6htSirt3U/f5ykazBPu1nc9uOOXHSdyb+ceLkALhfD79q768zSt4fuWprHX
 yZd7dzMW0jo4bwFmhKf+4u+49AP8Lig16sfXjpuGxwkuLfNFMjScnUKk5+7As4NyxHelnBxqTqL
 GeLRRhCZ7MvVnjFTdup8XYNOnFVKTt8gfUJvsCCfhRKH9ys91ciPO/ebzG5zWHjqS36GAkWHL2X
 vVn/50w1SBGpbkcky8tmMoy4cxwbBXHxmOA9BAZ+/O6ICsUfxPYR+/0YgxuteSZGtX2QEjbJDUV
 BbTD+Xf1Zf8r+P1XgqrCvFXAZ5JqiqLL2QQnr4sPfNLd6iXBy4TJmUBb9u993sl3UDM8vDGow3d
 zS79dHcjnSzqsKTVUSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280079
X-Rspamd-Queue-Id: EF01F480919
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,rock-chips.com:email];
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

Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
parameter into the T_POWER_ON Scale and T_POWER_ON Value fields.

This helper can be used by the controller drivers to change the
default/wrong value of T_POWER_ON in L1ss capability register to
avoid incorrect calculation of LTR_L1.2_THRESHOLD value.

The helper converts a T_POWER_ON time specified in microseconds into
the appropriate scale/value encoding defined by the PCIe spec r7.0,
sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
to the largest representable encoding.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.h       |  6 ++++++
 drivers/pci/pcie/aspm.c | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e543a..c379befe1ebe 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1110,6 +1110,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
 void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
 void pci_configure_ltr(struct pci_dev *pdev);
 void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
 #else
 static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
 static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
@@ -1118,6 +1119,11 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
 static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
 static inline void pci_configure_ltr(struct pci_dev *pdev) { }
 static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
+static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
+{
+	*scale = 0;
+	*value = 0;
+}
 #endif
 
 #ifdef CONFIG_PCIE_ECRC
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 925373b98dff..457d469b8d49 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -525,6 +525,46 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
 	return 0;
 }
 
+/**
+ * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
+ * @t_power_on_us: T_POWER_ON time in microseconds
+ * @scale: Encoded T_POWER_ON Scale (0..2)
+ * @value: Encoded T_POWER_ON Value
+ *
+ * T_POWER_ON is encoded as:
+ *   T_POWER_ON(us) = scale_unit(us) * value
+ *
+ * where scale_unit is selected by @scale:
+ *   0: 2us
+ *   1: 10us
+ *   2: 100us
+ *
+ * If @t_power_on_us exceeds the maximum representable value, the result
+ * is clamped to the largest encodable T_POWER_ON.
+ *
+ * See PCIe r7.0, sec 7.8.3.2.
+ */
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
+{
+	u8 maxv = FIELD_MAX(PCI_L1SS_CAP_P_PWR_ON_VALUE);
+
+	/* T_POWER_ON_Value ("value") is a 5-bit field with max value of 31. */
+	if (t_power_on_us <= 2 * maxv) {
+		*scale = 0; /* Value times 2us */
+		*value = DIV_ROUND_UP(t_power_on_us, 2);
+	} else if (t_power_on_us <= 10 * maxv) {
+		*scale = 1; /* Value times 10us */
+		*value = DIV_ROUND_UP(t_power_on_us, 10);
+	} else if (t_power_on_us <= 100 * maxv) {
+		*scale = 2; /* value times 100us */
+		*value = DIV_ROUND_UP(t_power_on_us, 100);
+	} else {
+		*scale = 2;
+		*value = maxv;
+	}
+}
+EXPORT_SYMBOL(pcie_encode_t_power_on);
+
 /*
  * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
  * register.  Ports enter L1.2 when the most recent LTR value is greater

-- 
2.34.1


