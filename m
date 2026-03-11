Return-Path: <linux-arm-msm+bounces-96966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE0jNUpjsWnQugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB4263BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9C1A30F36B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48E1359A96;
	Wed, 11 Mar 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOmD61+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkorusCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442613B9D8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232861; cv=none; b=V7hwVT2lT4+frkGSrlzpCYm59Gycu6YykkdZlNCkWx2aHQMgSGy3lk81K1fpaWtygTkNF+UJ7m/dK7m5TR+A66aWWiDKWtIOb1kE4KJ61Kzhnw8+v+aO70VGHKx2N9UPLl/rPUd0vcXKfWFhToSbyGh1SFnVasjZgXc+vxAzuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232861; c=relaxed/simple;
	bh=fCZai0Br+UV9JtDbXVN+nJASmxIaMenuxY5Mhb3FJSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mS3uBoEbGXnYYnhN/1GbnrMBOc4rbrUhIPjBAhtZanlNvffu1t95Y5TAkIL2f5IyTtkGHHQQsvZXl3hPDZ6f58RP2K0I3gdGInlwqD5F4jVn9g0uls2quL6fIAYSHpB0AEiAfCPnC2A1sXSnXLfB5Nqtprw6t0urU3I/zhgNiMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOmD61+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkorusCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvATi2621964
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or2aWxGkNMHGpvSv6Gz69lZrZZtJUX0pU0QL6U2L0WQ=; b=cOmD61+YGR8Nmkhy
	3gqXhNVJKdElLtLiGdZOUDayYRU1UPZRaD62K1oHns6x7ursX+5+icVC69GIhgwS
	2MXT20y+KGMAf/HflVZusLoeGd61Y/hA1yKBlALUDQ7xJJWm6S4UE7nmkCl9Z3Bw
	k9ivVfVxRgiqxtadsSNI+vi2Nwj8HyJxT8kooNGEFq+kJ1U08SYe10rUiWUrLjRY
	QkmDH9St54EGhUElyZuiydZhttYSNgly6ZERoj3gnWGKUgl+MCGJ5mNfyU5nEcKJ
	U5pcvN91YBo9j50J4J1lbmu6J74mlTwIwSqU/ePYW1VfjPAcDXSa0ks6ZjQGfMZy
	5gslqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h0afe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4f27033cso107786725ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232858; x=1773837658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or2aWxGkNMHGpvSv6Gz69lZrZZtJUX0pU0QL6U2L0WQ=;
        b=HkorusCnyfhICJQNTaKT2RUU7RHVHJ3rM1mlNZArNdTWmxc+uMZXpgju6D8p8i2dW0
         u4+AqBqIEEEcuHRxQY5ruf5LjbYd3BZ37bSpB/Cn8bdXMjjj5t76hdUNC1Rv41CwHiak
         f6DMzhdl4Mjbt6RSIcZxpnItynCnDYUy2UosB1k2vt2NHmyvL9fJvA++OA/I03chVkwq
         4l9f9Y42+nhOS9orJ4RUAcw4UCBVaI39VCx6m7lG+Mbupnu0KuEi3OlAG2WVW/oDBknP
         gtlPxUUTvShA2e4MSVSQJaiw9hpLUhs4hFL4tvZsBK6MtjOQGj+pXJuFY88NraNT15uC
         21LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232858; x=1773837658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or2aWxGkNMHGpvSv6Gz69lZrZZtJUX0pU0QL6U2L0WQ=;
        b=dg537JZoFt7YPMbOWbQjmtMfxH9ovB9rJAT4U7CbNTBmRtsxH/qkBGnEEKiGEt++Gx
         kaykpPL0bIPl/0QlTcwNcwYCr10Zz+CnvGwkGR9erk25OoNl648KL5JPghpNYd0Urv+x
         A+a2EJI1OQwJwMMQ9uY+ipy6u/1t94mkdGFCULQ1jRDCF4Yme462Zm/RM716W/GArdAN
         8QKoQhvRKDE3SXjHkZYBWvrXBQK8PosWFs1dCgmyb6EQXS79rMzl1SMwVCOLsAORcIY3
         ps9++5JxvWrviRMaJigkV2akFuAq6VihqPJcNCb0FT/cQF342jynr8rNX5RzJB4cSMZR
         qlDw==
X-Forwarded-Encrypted: i=1; AJvYcCVFoPh/idb0L2MJIPvy+g6eszfTufrKlo3skbI28+ES0G0YdACIxf10HIiuEFaE8JHYpX9R4jvfdvMe8eqt@vger.kernel.org
X-Gm-Message-State: AOJu0YycjJPgcGURiZnxu9cOhHmoV2q0LtOVXKEOb9hSTdIam1+lHYZy
	ieo5PSw28nQjgFJCzRBHNrp8+b4TvFXF8ba92LZuMhsOokufLCj4HMEPdYMIzVxZxou7bLhDqhf
	lL/1JerlDBdz6zgbcMu+xCNRZLYJLPo0kmeC6OsuGtRkROcoL1zKtAIzuQJ2AC1inY3cA
X-Gm-Gg: ATEYQzzLjCoDJ1wsYo9+Z96Dw5EcJIeYwG2mdeOyU4lMvq2jElJMo2WO1GDyuP4NEfq
	95/HrG6+C+mahOTdVkajGwNs2WcG55mqlnBUkFdT0CkiWbfvjKyVfWmyRVh7YCYiz2EGXNBAHJ8
	SrA9DNRq+fTfBo1o/fnR4/kG2JhXZPDiGZAhELRlw0M1BzJT+JxS9siWuEMw1FyZCG9yD2rR3Z0
	SogHKSkq5DJ5eUefUhKqSzLSuaUVc+LgGVbthlLBW1mb29e8e3xo/fafsypn3eq/aKoQr68VDBK
	hFItU63Xr6g/KTrJn5ejTXxdcW9YNJxP4bX0mfANjBwVplEVdunPPlPG2sqxDMQ8Ex9Au9HkllU
	+wKjiiq4dKe5DyqnipFQQgoJnTShUKjfkmPPFo/Ce95u9leHMflGSUObX
X-Received: by 2002:a17:902:f70a:b0:2ae:a577:55b4 with SMTP id d9443c01a7336-2aeae8dd2b2mr24993705ad.40.1773232858030;
        Wed, 11 Mar 2026 05:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:f70a:b0:2ae:a577:55b4 with SMTP id d9443c01a7336-2aeae8dd2b2mr24993425ad.40.1773232857570;
        Wed, 11 Mar 2026 05:40:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae2466a7sm23304385ad.20.2026.03.11.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:40:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:10:40 +0530
Subject: [PATCH v3 3/3] PCI: qcom: Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-t_power_on_fux-v3-3-9b1f1d09c6f3@oss.qualcomm.com>
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
In-Reply-To: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773232841; l=2432;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=fCZai0Br+UV9JtDbXVN+nJASmxIaMenuxY5Mhb3FJSY=;
 b=Q4gJKXQ9XWkdvcloTyy0OjYGuDQaSF43IWeaLQVPmMM1GCZviMKmSu7O8NOFAscE78vI2fQM/
 hdaFH1/lNCIBaw+ez88sFt9ZfeVhrD16b2XYpbl5LlpIudxmRYbrE3I
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: OJW3IbBVC-1o1xqJ7Od7SwbE0kY2O8ZE
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b162da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wXczfBY3881IDOTkNB0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: OJW3IbBVC-1o1xqJ7Od7SwbE0kY2O8ZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX6MUCfvVK+35y
 q8EwdotWu2LFC3e9XjKUQjwEfFSteBEkXWBW7UgbJnNTSrqzPpKpk5idlpImdwrQJ2KYkQvxkoW
 tlBBI+fBNy04RvEtSUsOeD8/pIS2eLjipFu6AleKYnsBNegm5MeLYWQS7ApkzswSrQgI5aT/zXk
 usJYLmVUgZI8j4M9JzUEG64Y2V98hERDOErpbh/Xy5yJJV6uWyGy3/JcrsbNhgSYAY/5gftcUzK
 rmrEsnUTdoHY5YHfe6J9yICEkSuE4F4BdwKZJFFl/LyUbIiwkQlqx0QRFh+RlsXW0cmIyGfxQl2
 hKo7k0xsgwVWlgnSjpO1ify+WMgTBJXyfiXg9lknWNjpZYdlcdZxX2SdzAt9Bt8CACabcMvj7si
 bwdSwVrK0lSnnZQlar7oZHW30UvSVy/v2XZyRd0ja1GpmHZByOrq5bFn1WwSRq2Z3iQj2rQp3jE
 qgC7ULXj93jCYW7/hrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: 40AB4263BF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96966-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..63d5628e988d3c07f42099c0d86e6b80fd54ce32 100644
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
@@ -1759,6 +1770,8 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 	if (ret)
 		return ret;
 
+	of_property_read_u32(node, "t-power-on-us", &port->l1ss_t_power_on);
+
 	port->phy = phy;
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);

-- 
2.34.1


