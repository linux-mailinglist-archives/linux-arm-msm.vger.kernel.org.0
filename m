Return-Path: <linux-arm-msm+bounces-104914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ12J+J28GlgTwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:59:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005E480C25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB1E311305C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4CD3DC4BD;
	Tue, 28 Apr 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyjygCdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVB9o5YK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF413DA5B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365462; cv=none; b=IBIXrY5eCjmvzRsewF2IdbCkG1pSZY6HKW/nRM4rLCvxDgkg0R3XjDHVqZ0yK8PLWb7YognXNFe+FCwnXt83h/dY0cO5DKH9rw2Ksx3csWUHugD4QIULw+xuUUEiub29jOX0sLFPBnKToB0a1PUyF3IGNi8PBxMhX0uIbGpRTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365462; c=relaxed/simple;
	bh=vt5YE7wXt9WaDQtNgVd28OtMNl95FIkNup1m283AaoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGuYsa6ajBVh+TZCwnMOfqh/VsXpt89u30v5Kp1Yynq/nmdVK/bXGZycGFUF8hnDKo+SLK5N2lQimojzHyI2E+NDOQhN0yslAQJEV5S8c0CVoHfp9RSzVGrF4gGNDX7tJ9mhF1+hy5gOKYfJssUuk9cs57jdtgpJtMMHvl1g8vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyjygCdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVB9o5YK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3k8Um2111945
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Tj44f4tU9rPyjpStS2CB8zxmonpsjSFqeb8FHEyg4c=; b=UyjygCdQFVfTGaGk
	o25zaijW7QQfU15HqhrTP3j6oTx3xGqDpS/ehgfpM+oIPStUcRQsKfeEWaoJohMd
	tFXdaqu3RVEIvvb9wbwW/4uXF/Tt8uTZlCMouW7KVbXnogJhTatwrjgWGu9ZInoy
	/NgPtRdXGPO65IYbT/JvcOwnwTpfS2NlQQNmrVJVYVuTGthcubAJaUV9v9dDya2w
	B6QXE/gdIk+OeSMR+25XcNG3sPYUVFb72Igne2lTK0dEClgtsYWLh3KMbQs1qM/A
	hB4JtYyiSbL8TU750SRDneJehjhIF23mCrjYy6IDJE2z9nLMxiiRmKujb+z4h2EA
	G+1z3Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbjmrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so85560175ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365460; x=1777970260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Tj44f4tU9rPyjpStS2CB8zxmonpsjSFqeb8FHEyg4c=;
        b=FVB9o5YK8OKv2Swd6JJn0e8BoP+GfldsAqKYWIf4dbN/Ez8gjoVMA/ZBLP8s2zkO84
         rOn0Q7mjLcZbctWH85ODwCEXzOvYlINL2ADhh/XXjdR/scK6icdGTiHHjPqtDvxk84O0
         mf72AIdFMdCPP3KJQ65Oxazjax8uAAqFIdmHGRuSYMX1u2RZrpMjzZQLqwrV3w0+tU5n
         P7FrN59aM5JUf/G1w5YDTI+no4wa7FPh0MTu/fziiPWoiPHrVMDOg8Qp3beF9//RuX9z
         bDpjXj4VXOWAWHVQH3/GI4ujPRXzrgm2X3HXSTUMYQvdPa5TSF77HPjNy+odlnqJXIpS
         1WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365460; x=1777970260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Tj44f4tU9rPyjpStS2CB8zxmonpsjSFqeb8FHEyg4c=;
        b=YMMrlN2yMhqqzmGcX4+DIFWolcmWFq99z13QIDMJSX66rGsAhzGJ/D71gDZLxRV758
         ZoVhHg2cXU/cezg1ovX1zxhKK87IlLBUNO5wKA86RDjlugSLUR9CWMsfsUUG65iDW/LX
         NtIQH+Agny8AVKFVQtDiQpo/PMxivBCFEUx58PRxMmm1mB1Vdg3wYYc6SADwBZ9+ElGT
         VVCF2+j8/YKFHHMF+WhzLPlp01tIvJYkmiHZFwG4LMVfAzqyndvUjO4dduFhvcwEaoNk
         H5cARDiVGJoM26+mUf8W912OOFkU8vy/sSTZRVeKTw9s6rbPcfUlW2cUAgHjmhWKYlcI
         iavQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0oWsqKfPELT96iLxqjmxT4ChKI+4ZUXPPbHwmw34mIKG4u2vFAACwjzjrzyrfk8kX8AV/UOYMFEL0rMfb@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3oBCF1KJ8oijHSd/SbTF4BjTKEHJwvOuSt8Ajc49o8t3VM/A
	pxzrz7L6azdKuWeu1kNZ+0Fyso3RoVATL1OtE/B+o7iV8+HNUSb7MbeR1bJgk8CTdNgA2uMuNRx
	BZZYUQvlWbrMT3XwkzkHCinSxwqLkbu0QUT7KXmN2iYjotSquiEQ4SwkDkjq/zK2cM6mD
X-Gm-Gg: AeBDiesDXAdCtC0RJq9HAFSBk35rkB8gwWKHw/SRDIKgm+GVV52Ikqcqw43aqHqcUbZ
	KAzqGKWZftBohRxRs69fo8TBGHBGLbS+FN5QZEaijLutZ3ZavI0n5KzxUO8+PNbJwgmJ5C1btTC
	zQR1kRKH+NOHSGYmhk40nxU/VCgm1gFGL+g453yIzveKp5+8OEFfZWlVpvhCcUOLYiL3O/UU04v
	KF7OmujNmJlAPVN7tVjhmnaLuJU7E0N/5yItmotPf/VZkTfzPAnQ3TlbslzOkr+DZ/uFsxg91ux
	MK+inwBLX8+OXI8u8ju4X+CJF9SaRucTK2QMJ73f/ANTDHE45fURJSn8DPt+JAYBOy2oBdF4GLj
	M149xqewKgPUd/5r5ucFezKYYUMvNrUPKhP5mTxJbmBLm/Xbk9ea/87OSqf2t9nGDq9I=
X-Received: by 2002:a17:902:f785:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2b97c3a2264mr22624955ad.1.1777365459623;
        Tue, 28 Apr 2026 01:37:39 -0700 (PDT)
X-Received: by 2002:a17:902:f785:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2b97c3a2264mr22624595ad.1.1777365459144;
        Tue, 28 Apr 2026 01:37:39 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm21645315ad.84.2026.04.28.01.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:37:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:07:17 +0530
Subject: [PATCH v5 3/3] PCI: qcom: Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-t_power_on_fux-v5-3-f1ef926a91ff@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777365442; l=2457;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vt5YE7wXt9WaDQtNgVd28OtMNl95FIkNup1m283AaoU=;
 b=FidNjQAujwlIm+A0h9RRZoa+4kbabjKGMaKc/8qzpAWtr5be0ilcW7O8gNKHjqgkVJdYTVUp8
 m4yODhxBGK5BiIwXU1YNdyAkA7CQCn0yW94tbTr3DKKNJkMmI1OVlvO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: b6iZKW-Z14ShGnyhUxBU-ihetcMFLnaX
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f071d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wXczfBY3881IDOTkNB0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: b6iZKW-Z14ShGnyhUxBU-ihetcMFLnaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OSBTYWx0ZWRfXxqvg+ayxSPEa
 5dIGj5eJwDwTvn7YR+Nx7haVuuXpyqp+2n+gttHRMrepbUoJ7tXI/jr4ujSufWIyQabXqlZcgzh
 Q0wCFPOj533mtcYdMhcA4yQgzI6GdyOKUr+XM8a7OFsIG5zU7w172RWQegWEfDL32DE/FxFENM0
 ysUxVgzkqgRg13dc4Lpqu4+yOE15vdZBDKn8nmZDojCEX60PEv3tbbzO1AtZd7VsPzg4StG70kP
 ao/66rwn6rly8Rgd6XDNL2kY5MR0D7tEC40qaG04vAQgYG9oxGj96Hb2hw090f4v0BJV28wZVD5
 1oVMQqAsO8qwG8iWhiCKgR0+rO2r5iv3aYzr0jNT/48wadOtV2EoHHUDKlDg8/EcMhFKVhRHbJU
 X4bIhQt4J8Da9T7DaNme8dqi3ZTZ5QLwF7Q9iREtVTS+fJuz/RLw+NCKmxLJ1PbZ2+leFyuQeyA
 u7+Rie8lweEvDW0ejEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280079
X-Rspamd-Queue-Id: 0005E480C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
index af6bf5cce65b..4864e152625a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -269,6 +269,7 @@ struct qcom_pcie_perst {
 struct qcom_pcie_port {
 	struct list_head list;
 	struct phy *phy;
+	u32 l1ss_t_power_on;
 	struct list_head perst;
 };
 
@@ -1288,6 +1289,14 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
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
@@ -1322,6 +1331,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
 	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
 
+	qcom_pcie_configure_ports(pcie);
+
 	qcom_pcie_perst_deassert(pcie);
 
 	if (pcie->cfg->ops->config_sid) {
@@ -1764,6 +1775,9 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 	if (ret)
 		return ret;
 
+	/* TODO: Need to move to DWC core once multi Root Port support is added.  */
+	of_property_read_u32(node, "t-power-on-us", &port->l1ss_t_power_on);
+
 	port->phy = phy;
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);

-- 
2.34.1


