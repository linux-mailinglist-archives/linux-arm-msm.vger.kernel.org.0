Return-Path: <linux-arm-msm+bounces-102162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDHoF7YA1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:03:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E65803AECBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1247A301ED9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4195E3B6C1D;
	Tue,  7 Apr 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz5ZVzbc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmzI5/XJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794F3B6C18
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567014; cv=none; b=ZfT+Txuqn/B5l+hXIb7zVbjxf1ThKVCQfgaXCs5hkCjkMtE+BdGv0cjWOSaQpCfFlBE0Hg8QaZF95Ilp8k4WgT8PiY86Mi5nvH6tvip1OXh6Q3dNu5QyeG7XKWYZYgIkApWcQP1uHB2XXVOCwz6h47PN79zFG5bPZtTcczgTV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567014; c=relaxed/simple;
	bh=pO8vVScrKCYroJtbrmCEg0jsQAkeOLwy64wLlBodYLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBi97vm4+n8IHfmH1joRJ4oG84M/JrdCKWCylV7qaSLkugLC1iLB9/OdQsjal+atn5qx5mEssa5CVgyCiQ+rzy7wNm11xK/OBqwr7tkUbP81CWjWiNcanswDa6fxA+MODbTpZYZr5eEFptSYVdM+st4WlAxLSxKiHk1jJP+pxTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz5ZVzbc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmzI5/XJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376YpNc2327993
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=; b=Lz5ZVzbcPa+zPuxZ
	8PAmGhNHX3aP2/zMbFaj1bI/wpj8xPjAKe1HEYaT0kNJRCzj4OvsWI5u5iWUWiEg
	kooZHIqWKDQcFmsrfU6QA1s3C+0UH6VyXBPyJyczmTvZie8FxxO27xfFxveuHfuk
	zTtnbAe283gRn5hAQe8OkG6d4LUOKxvol2Xa8I7vN+AfH1fSqgcozZLk5/NHcxv0
	9kpqZLSFrB+4//CeUpfRqLHQ4L0H+OmvBRa9kA6m9qRE5yFUzpLadXV/l8pxZtS1
	iIiQoE837F6p/DR4h9+2BxuNmjEUcbBLOehZaq1YYLznl3m3zUWA+i9IicSvUgBA
	oKyf/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tssq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:03:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b23c909256so71555965ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567010; x=1776171810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=;
        b=UmzI5/XJnruyzKNc8TKTUMf62FbfTNWrtwP0MNkpjIM326q9ffUDXzM8gK1F+8usUu
         R8qkCebaU5fYB5Hmun4TTOPP4Cpfhu+hzqJ4ZTSP+EOu+01YUXIH1NJ/Kk79ojugAZ6T
         57sdbhw+o4TfpwHWOgnCs1qpBJkWWsMuDoGdSCptfqUcZ2hyU67WsthJ83EsJyfS7box
         zbrEQsP8ZAyONIeMzdHMHAXNBgiqgBg+iJKyJckDXx6xMProkIhZ/sSfLGBL0qa5eLqT
         Y+3AD9kGEZ7U6AOIaHgNskFBn0rKqAkQBL9iClsswUPmYbU4Wf94ALOimL7Nl20hNxYQ
         7g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567010; x=1776171810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=;
        b=Mgby31Lg+hs6pFjiTWrNFZQNcRwOYiHcUIW6/ODB4e+rZ/K6oIkrDu/J8jHnwt6KQY
         krVGLYVz19M+Lx9Tr16ZwA7B5g524NBuWwBSvdq6o0wkLIgEfLoUHFS8fv/sf1swQVzn
         0sGHqA6zA6wHv0b58q1oMNxvr6LtA3WU79VXS52Dp2Ac6T3yDYl2qLShpBhrXK0sru9r
         rQafRzS+ENJMCg7R3w82Ruc2sqHUnxXDzVGRq/o9Yf9UDp/qAsJ1Xidhht5HqmZM/znd
         FErLNNMTvjvLky1KG7LYgvYSC02nACA6ZGL3h0NohqcRMgss14+4k0BVhgvC/nzS5ngM
         LeOg==
X-Forwarded-Encrypted: i=1; AJvYcCXNIBTyl+WVft3YadHYPAu4v5D3nGHMcKR65VIXjhxlhLldHDT2LYdm5x++k+jGOeyiWyB/1mlt5VlTwEp1@vger.kernel.org
X-Gm-Message-State: AOJu0YxFuHsYoPb5T0Cj3k8MF4ElGvzDQmPzE1P7EwryUxP0ixPadbNr
	wSR/67J2jYjLYArGOtCGByBpx/n1NKbO6iGtzYrlLzs07PIxvCv8CReMSFdt8RQu08e8A2Ppc+g
	RrZv8t3Gpe/I7KCdgPghSzx96iVSg1I0T5YR98y3+YIb2GdIwObWC97EX9pvNNwkqxANK
X-Gm-Gg: AeBDietJ7VkVobt0/NLEJsMSg5uzE+eke++ETNp61D2qUBG4uvHTWIpLdA7e8K2tSmx
	WLUr4TqCPFdf2I6kh3iNiyS+H056TZF2og1L/3uIy7ffENjGjo/g4mPGjHNEKiP+HOJeUGYynpX
	+WT0+IuBLj5bZCVBBjQ9hg1vdTA3n9EqoNRwFiFPqqafbCXpKXIfjO0x6LlrIBKP9WmAOMMS1w9
	SuEJQAyqezt6HXyAqny0j6lonRuheOj7S/q9lK0MAg0dCccB2IOs8nzZ/A3QqfsSNX9pqMQ4Tn+
	jtGBUxNNoZ1LlckD11ZdR9NYen2TKtvxQPvn4A5ULaxK70Zeh9prJy0xYxJFouK1L7bJ02zzbs9
	FFQ1dYDGtpFMmRRwB3+yMr5LUkW69b1ZERv54OsEDRPjtfPYKSiVmETgo
X-Received: by 2002:a17:903:3904:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b2816ae915mr193382895ad.14.1775567010281;
        Tue, 07 Apr 2026 06:03:30 -0700 (PDT)
X-Received: by 2002:a17:903:3904:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b2816ae915mr193381885ad.14.1775567009563;
        Tue, 07 Apr 2026 06:03:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:09 +0530
Subject: [PATCH v4 2/5] PCI: qcom: Add .get_ltssm() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-2-bb171f75b465@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=1941;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pO8vVScrKCYroJtbrmCEg0jsQAkeOLwy64wLlBodYLo=;
 b=M3puhT4nVYwMiJ7XYXSfcZrmSGJerFMTB6LFXEag8ihvt6K0hDXMWnl/7zCZKMVkQqDUhuKx6
 6VZ4rPuVn4qA5/B5oeAe+YY5sgXYSSIlGet2S5d3Rm3zsRU3N9wVOH5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXyjM7F2CmPJAi
 7WLkkS6zejyrdhjfR4LaWWuRgezE+mJ8x3bUCrX6hsVQbDIdBm1hk58/j6EZ0sGfXCl8YTDiSHF
 ByS4XoGHrd2fhtua56YtNfZfPBY1ANwr5SHn9PmYpVGCAhfoncWjjy/yEncvJhvw6aHaxQKv1QY
 9U0KcYb2OVKMY0WpkhLd9Dj8lZXuzDseHpQCmgyNjGjwvcGT/XycmIlQt4yFjtsK10XOHoW4bd6
 LF8QWbbMXeD8Uj3KXcunK7eASVj3bR0Oo3ZU96ArtQCI+b221N9YDwezIWsgbjL+pskWKc5yefh
 HKH7wR8uYcq4PoVKpuko0cC5EbinZqrvUtlmQ/B5GP5kjKiu42ie6Q9MNNY2egTS7viPPuDlbk3
 RQq+OFPlmS2VXszyEHDH3ty58Jcm9+9OtC+k/UVdJ6qmeKDRwQfAK3+y9sCSmczFYzv31zJkqgG
 vyKVh8PndqkW5VGmtLw==
X-Proofpoint-ORIG-GUID: lMXe181wIerxyGv-H3x_dWWa2ZTDh_Jv
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d500a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: lMXe181wIerxyGv-H3x_dWWa2ZTDh_Jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E65803AECBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For older targets like sc7280, we see reading DBI after sending PME
turn off message is causing NOC error.

To avoid unsafe DBI accesses, introduce qcom_pcie_get_ltssm(), which
retrieves the LTSSM state from the PARF_LTSSM register instead.

This helper is used in place of direct DBI-based link state checks in
the D3cold path after sending PME turn-off message, ensuring the LTSSM
state can be queried safely even after DBI access is no longer valid.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..b00bf46637a5ff803a845719c5b0b5b82739244b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -131,6 +131,7 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
@@ -1255,6 +1256,16 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
 
+static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+
+	return (enum dw_pcie_ltssm)FIELD_GET(PARF_LTSSM_STATE_MASK, val);
+}
+
 static void qcom_pcie_phy_power_off(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_port *port;
@@ -1507,6 +1518,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.get_ltssm = qcom_pcie_get_ltssm,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


