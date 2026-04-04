Return-Path: <linux-arm-msm+bounces-101754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDchKuPJ0GmfAAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:20:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E6939A652
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33069305E9C2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D103537FA;
	Sat,  4 Apr 2026 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffcfS3+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPRYAPXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25263A5430
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290661; cv=none; b=HqbuoCVGwbqK+xw2ihDnS8fmyeW7j5EY6vrJOqduEWQObCjGnz+NDBkNO53uWnfjNAKG9qHriFEuBfMuZ6TjGoFGdvaTTiNkCNFQbjlbyYOKUDHqiHK59jpQeRn112eqwG3R20jkj3Dk6bB1zbiBR+KeiJ0vfPu+L4F2OGtTwgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290661; c=relaxed/simple;
	bh=eLlhRSUUKQzMD4xw0eb0Pj6hBFVgOdEaGYz5rmdOD0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tngF0Pfl7cFwnPXut7Ku0voUw/B2zo/F1BXs+sip2uq8xr1Iv+zQs/cSvgAz4d4cVCa1Lh53ChChW+PZeUcEoRdjvXK1LR0HQqdKdbiBhlakw/gSlvI9BZ+esU3Qo3Wfe5nvCFTx3imnD5GSOgKZEaW9Ch8ovC9+GduRZefsTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffcfS3+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPRYAPXk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340gtwn1344906
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 08:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OB5z5FGO7HAe2Yk+IBBuPNkY5p8wo0CfJYzjPRUQkDw=; b=ffcfS3+BTvBbv+EE
	I1wBJogTYOW9h/dznyyI+oU00H/m+uCTecxgEZjY4aomjxMrR6l9k/XX0qNiUmic
	rucV2m6DOST2+CpolTqMA9+HsjeeREmg2PbqYguf+MfG/W8CzPkYLgNfw0KOVE6q
	vvqXT7/TwwSRhM1VMiZlrKgcpUbprCbuhjp+Y12mUh32DOSENOERsAiJuDehPnBD
	wm7kDGcfuCMzV6QJyWllRNXgBO32FfGJnOA7tTTweExUXUMHick0CMZBAIBszU9e
	meP21wXDwIO4MAThzwF2UF8TIPI0mD8XMCBUfPi2YJCQhr4Ap3lLXs1J39ksVaoe
	62LX1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfgpvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 08:17:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so2733334a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775290659; x=1775895459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OB5z5FGO7HAe2Yk+IBBuPNkY5p8wo0CfJYzjPRUQkDw=;
        b=IPRYAPXkHh/Pl7szWWUZgYjS87/oQrUEDzf5u1FoBajDMxL/ZAprfe37hrAv2iT9x/
         YrsUclLgwlVLv8jdF735DS4VKeTrLnf9E0zl5tNCQyQdL3Cmc1CDu1mjn2RyjPl3X0b6
         1URD8kBpPlxB692uV79KR8jVVOa40Zw+4oOPrJwg2oHPXHRPLguL83lmmLsSkfoQxhUv
         yvqz5tv559tptU23Z8RrsRf8OTrD5ew+yW8DZ4XkHQllPUYlOVadH/032d20sTn/XWDO
         j3Z1++kmzcQ66dUPXk9fvEvcfTyy/fs/kkgciBUofxfS1JOkEcXbcnqUdTg/uHxx2ErY
         +uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290659; x=1775895459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OB5z5FGO7HAe2Yk+IBBuPNkY5p8wo0CfJYzjPRUQkDw=;
        b=PgteOi65Wcxi8vncwmHPRyOWpw/GrJ7l4hAWe4auBN/WzFwK7Uk9OMjCcR8eqXjWEt
         F9XnWeVOzcggdZqkiBo4pf/tVxFLanO7k0nLsXZjzepzbiWZ5xoIJuNw+E9VydBZixhu
         CdbmGOZMbD08k4s4OXZAr1z714E/8CIK2cD5oYayQC+K8PhSUKH5HNt8Y0GccgoQVmxi
         Ykfvh3ntmnqQzA+uGOi972gWpYeIcL/4e70QmoM0uMk2ZIUA9xK+Wh8gaYB8qCVK5GzW
         /cHrn8mmi9Kue7rWY4nBHhbdAMpKhuUesOtu6ep4GN7JUvO1i8FmklF7Ks/u6i1uPPzy
         ussQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/d1/r/J9KMolcDGRF4G9gDYUA//6jOqpCAINUQpxvNjYD06rFFNpZBL/fw+zpYDT5ngtCbGAosCbkB2q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6YmSXSzTRMLmaW+ucVGIVosZ2X53ugwQ0bBC/j1sNtFWvfHmA
	nQd6UtDcZFEKdCvKPWpseLR8jseL+9dLIlUoLwYEHJNHrre10AQczT7j1mwLRhbdOehcOqoj5w1
	GP+Qs0PPgZ8/OxDwK6CtzIC59fbemO7wRTEImm3WXRwEzZSyF/gmH3rxZuxdeWZwb5vPB
X-Gm-Gg: AeBDievDaSLjSHX70O7bz3P4RyHtQXP6lWih6bqiYV9ICinHbH25uApnG+typhCjM4C
	YHt58SJIioqFQfYpB2HEStY44kLL0Us0ddvoLNc+3PVZaKHtIzfBNJ+FM2yot+KSb3iOWctqDkU
	kMBZkAVgQ5fP0JeyKbSkj6Qe+VyDf4BX+IW7wfmBm8oFlAzgqWe0bBsCOoiywQ52Yy/6x8z5So4
	B9aGheJ7isWS8+XHQdwHY8iuK5t+Br00ZnKKDbPt45YIqgn1XFJlHQ8TUafCWbVUCQQAG5rWkPS
	8oyY4u6ucOVrdJIuZvp8i6qToPgKGJOpGMgdWuSBybEDRK7jg3DAKFFomjRXWdyYBjamOwf7ZJk
	wGbBT2EoOJxpGo8FLdpGSDXtIpBPD2MKXEGEOfTOei8FLKGsT9PNpPOon
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr6019721637.40.1775290659016;
        Sat, 04 Apr 2026 01:17:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr6019707637.40.1775290658531;
        Sat, 04 Apr 2026 01:17:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm6786408a12.24.2026.04.04.01.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 01:17:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 13:47:20 +0530
Subject: [PATCH v4 3/3] PCI: qcom: Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-t_power_on_fux-v4-3-2891391177f4@oss.qualcomm.com>
References: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
In-Reply-To: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775290642; l=2508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=eLlhRSUUKQzMD4xw0eb0Pj6hBFVgOdEaGYz5rmdOD0w=;
 b=FoSqAxwrZC+d2vwgX0vXTnnO4tPPZUWaJ/+SnJjtKhp10P54ksl61uq7Bio4H4ZaPODY184qU
 uXcFi/zk+gtBjD3aKb7GyEFrr9nbEPEMfcr8roD85aBqaFVuZML5aIg
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA3MiBTYWx0ZWRfX5mt70SDhfsqY
 4V80qTotJt4SKSNERIMf0lO2KxfsjN0NCmwrTfeAdCRKLBCluY7w5wQiIvnALVSdotR/caqSrov
 FEU0EaKmNQc1RPJTG2z8LE24BNxHbNQ8/eCFuCF6Y6MbBnM7XtNbEUS09acF5x0kuc3Z9JSj87F
 oyAtIgtrt5KsKPwDS6WxXSrV0M3XvDvKHiU4eYbP5/JDf3stw7zLKuBSVtzfi0CnWoKkuiW7JyI
 p27BTJuYJQlRYGJOmwD7CqW4Bx/tL5gDn2DqRH0xx3dRZullf+3GsqgGBTFxM9YOYxB5XTxge2v
 ly/JI1UjbbzZ3ZTYmdVti8KbMS9pjJeMDphAdhFLJ6jQyUYwyrD6zx/l0z5uxBzmPKM2SJqfms5
 OqwHXlFZQQ7nHProHmTZsC/lywypWvhL9yDvcvFwnNMd/2A1mK6yxPucvaXltjbHDBY8ad3Aqw9
 sxrmlVZ2xu/fXDvBbsQ==
X-Proofpoint-ORIG-GUID: SW6t6KhdFhheC1G70wzX5YTLVDNwFf6i
X-Proofpoint-GUID: SW6t6KhdFhheC1G70wzX5YTLVDNwFf6i
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d0c923 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wXczfBY3881IDOTkNB0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101754-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 09E6939A652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some platforms have incorrect T_POWER_ON value programmed in hardware.
Generally these will be corrected by bootloaders, but not all targets
support bootloaders to program correct values due to that
LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
can result in improper L1.2 exit behavior and if AER happens to be
supported and enabled, the error may be *reported* via AER.

Parse "t-power-on-us" property from each root port node and program them
as part of host initialization using dw_pcie_program_t_power_on() before
link training.

This property in added to the dtschema here[1].

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Link[1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
---
 drivers/pci/controller/dwc/pcie-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..a8f82f860c08fe2eabad2c0eed541b8dd121215e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -269,6 +269,7 @@ struct qcom_pcie_perst {
 struct qcom_pcie_port {
 	struct list_head list;
 	struct phy *phy;
+	u32 l1ss_t_power_on;
 	struct list_head perst;
 };
 
@@ -1283,6 +1284,14 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
+{
+	struct qcom_pcie_port *port;
+
+	list_for_each_entry(port, &pcie->ports, list)
+		dw_pcie_program_t_power_on(pcie->pci, port->l1ss_t_power_on);
+}
+
 static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1317,6 +1326,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
 	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
 
+	qcom_pcie_configure_ports(pcie);
+
 	qcom_pcie_perst_deassert(pcie);
 
 	if (pcie->cfg->ops->config_sid) {
@@ -1759,6 +1770,9 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 	if (ret)
 		return ret;
 
+	/* TODO: Need to move to dwc once multi root port support is added.  */
+	of_property_read_u32(node, "t-power-on-us", &port->l1ss_t_power_on);
+
 	port->phy = phy;
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);

-- 
2.34.1


