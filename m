Return-Path: <linux-arm-msm+bounces-93664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEc9HBs4nGlCBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:20:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F30175673
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A81730229A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFD63612E0;
	Mon, 23 Feb 2026 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaYVxQCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hv32Uw1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999DB35CB8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845657; cv=none; b=UsjUmIzeabPJHai8xANfSs/ozAiXNdAjy4pfwCS5z0nRnCzLTh5FzN3XtwtofoMEvcndRvL4GqYv+3RPD6+27LwpfRs61xAsArBzcNxO8jZLae1dxaCrFpfOpaw6D6ivs/cxmMJm3fNbtwpF3LmIn5J9NXsNoeXWqmAAv6kX38A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845657; c=relaxed/simple;
	bh=USOtUqoO0pBSXaqNzhOk6NTS6nVdSU0vA+aMkk6Ry0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PK7R8CNSUjV95zMDBnsoBQ25KL9PC8LaqDpROpbGUE11aD2PUjXIL2OmM6uuv68RhHP2Vdx9JF4MZRxwLYmo2gZD45yTdE9QNS7Hzle19WdWExeW5LdS3rY8uRognk1mDWdVlNNN26TvM46FZj9M4tKZREhyaPhVRW9hg+3irvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaYVxQCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hv32Uw1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8hSJW766639
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zii6CigRbD5HDl5umrJGDYGIgq6jxY4yjDjqN07MxHc=; b=QaYVxQCE97aD5NgI
	oiJstlNa0F3GT7XjJpJeMvCg/hdJ5lWwt6JXm28paTe82cawR6y8u0r/n1x+z30L
	ZqSIJJDaJnpB9LS1UHGOYq8cM20mMLmlW6NO80/ixC0rBG03U/RvF2K4zUH6Rjgq
	MMELVzdDD2Hdw5UEI9a1BXbnktDFcNV7g3QgwrqjUVWuCmXPNRMEvO4s+NlpZpuF
	eiYALPG+oYvL4Tpa91Xv6u5vBbf1dwXR+7jr4DcS1BmemmaipKiavtpxAJiIX/xg
	ZFruflaLuShRLNssywJ9iLCwRQKJkC/ehBLi8RHFN+SqXINS6mGRbKcfybljNtTU
	Wv+RXQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7vh5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824af3c6c0cso1758929b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 03:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771845655; x=1772450455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zii6CigRbD5HDl5umrJGDYGIgq6jxY4yjDjqN07MxHc=;
        b=Hv32Uw1l7UyFOC1WW+ZNIPag/BZbGxn8/8SW5YuOfaarx0QhPH8ZY4mEayPqYKfnQB
         Zv0ngFB9gj3ff7J4Kgh+sKwOGLnTLtpraVZKvWO6G0SR6sSiLUUWckLDlYhPCYJiixBH
         ebwaTfubS2zH01MWKI3IPbCrA8LAUyCG8+ATlWZKaLxdJ6I0N9aE7bINtZWK7BlrjjE/
         MQrNahdQ85jeRTC6dObN5VNLxWOTVXmLXB17uQIQdg3oiTikZarWTYaRIRbyZ1VkBqM8
         1cJV/nGeO7PVtBB2C6id+aoPnNrr1k4AKAsmTW6z7RzuDgfVss2jkVdUzg8tKjE5atdv
         u/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845655; x=1772450455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zii6CigRbD5HDl5umrJGDYGIgq6jxY4yjDjqN07MxHc=;
        b=fe6mSlugBaG3OFBNLObbT4GqAl4FH4cHQ+13Gh60PVwuogUoOiSzeFTijFglbvfmzz
         bjHP0TELayy5V/U51FNq8keyOo7dvTq9Tia0vCvpzUDIzpui3iZ4Clqt8uIbZ5RjaYxT
         N+9fNsh4TwHGewmpThusiZyNsRlOU3N34GcEHYu4gm+3z3uptQgtx5+VPKvgwiDgp4L0
         zcbkj1fbyRuRP4A/BKhPe4Q6M/f64VfpflObpgQigXTzInc0OEiZQcRIPft6mcZNbdIW
         xAR8CHP7v83aMBnxElKc02dSByah7UrneMWMS7oxAwOjnvs9xzTWes/i3WYl94uvoURG
         Nl/w==
X-Forwarded-Encrypted: i=1; AJvYcCUb4mOHcbiI8CGsj9cZjCwbW7fXqg6HO7IbsZ6Je/I8iU5VVUsoAutC/cmiVJF09O0CUwziu64JXVw2dcLf@vger.kernel.org
X-Gm-Message-State: AOJu0YxJcw6SM82OrEaMqt9r2vwsXBIWUPVHRLjBtOBctinNweom4gi2
	z3Dxi/WJ8rQ8QOVHBygLz9wr+Ra3cX0DTtl/UMpV9mKcaoHbb1YQoX8Zoc4e0QCEmerVPUJbF1O
	zJmx1T7fSbvuoKE2tnDEOIj0OTktAzCDseu2fyisnQZV2n2QQUr6wQ6RuiqmdLiPU5n+2
X-Gm-Gg: AZuq6aJdDuauFrBMG8NbTGHbNPntAccZeWcv+TmYMtBHGxJJBdOf8VDyQ3UVU0R/lvh
	ZGS2URQvMKgtroLL3ky5F7oLfdmdOZOXGw3mNtJcrTrNqcr1F5W5D/Dr0UxeUfcoUxdTlHGe9VK
	b4LW3BXlGW9jNRV256ArOt9VET87eONlRe8PYU23s+MVf4VwSWW1k8ojoaOJxKI+EiaHQY236gq
	J5SvpUqdakecKmydoPOVZob+8U/CxWgsLoxGWp7/obhn5BojIfLr0TB6Hg1CzFwUkfe/jrdbF1A
	MT0XZncc9706xuiLEX0sVDt9Bl8RNXaSkbhnouCX/wGkEIQP12TFUf9deLZarwEg7Qwr/GFRMRK
	Utr+zOJF197JNR8DS70BO9MSodU3/BHxn1y1ABtmIqLEozq6gfJlApoJk
X-Received: by 2002:a05:6a00:148b:b0:824:cc05:ce88 with SMTP id d2e1a72fcca58-826da9f164amr7590947b3a.30.1771845654609;
        Mon, 23 Feb 2026 03:20:54 -0800 (PST)
X-Received: by 2002:a05:6a00:148b:b0:824:cc05:ce88 with SMTP id d2e1a72fcca58-826da9f164amr7590923b3a.30.1771845654131;
        Mon, 23 Feb 2026 03:20:54 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd899386sm6744057b3a.43.2026.02.23.03.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:20:53 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:43:32 +0530
Subject: [PATCH v2 3/3] PCI: qcom: Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-t_power_on_fux-v2-3-20c921262709@oss.qualcomm.com>
References: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
In-Reply-To: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845636; l=2371;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=USOtUqoO0pBSXaqNzhOk6NTS6nVdSU0vA+aMkk6Ry0A=;
 b=3Jc7Bc5o1Onuvgwj6TkaG0/UEWyM+HUbCbIX6omxJKs6M7Zhr1gmGVFlKmgLpXr4r1aW9ZX1o
 KMQRvDJdxN3B/S/Potiib7P2t+yWhIDRucfMU6ST59uzRoLDfsElsQy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfX7VeCMH8TAqpd
 peFXg46r8y9k1Tj+6Z2HJnAi+wom1ijWv7KeV8XNUJsiAMNeMf6L468j7rL5QoScaQt0+UIgvMU
 pevw5EKXB1CMfNFoTrpgIQe7QzmbSKMDij80HALTtQtjcX6PypMSHfeAbyKNG+FWdd9PgFHtEdR
 v/6lqi3BFmxtIKTgJBNRn5BSoqjy9B4Dw+3mCsVulld+JCg92qTpXg+3dPTMnKG5z0D/A1iKWJV
 0az5IOA1KircU0CyPgqGQlLFNdpFp3hQNNmdwthomnf3en5V8ztTu2BTaXgdqQ/0qrsDi4Pwy05
 IHWl8mX3Jb1SJRg/tschszOWIYlI2H+8DSX9OyhFFvM1FQKVhjIUsNoy++UvPS9cscZeuej+NCr
 DugVzFl/FEcvL04ttD6wUhZohYsJi+c3hkQCzijUPXn8QXtWuMIYtpDpozFhKK6SIDVsdStZPu4
 BMhOI+yNAkYNVmv2FNg==
X-Proofpoint-GUID: TTLBww30IYgUctkXR4PL3ze4rRLfgP7H
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c3817 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wXczfBY3881IDOTkNB0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TTLBww30IYgUctkXR4PL3ze4rRLfgP7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36F30175673
X-Rspamd-Action: no action

Some platforms have incorrect T_POWER_ON value programmed in hardware.
Generally these will be corrected by bootloaders, but not all targets
support bootloaders to program correct values due to that
LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
can result in improper L1.2 exit behavior and can trigger AER's.

Parse "t-power-on-us" property from each root port node and program them
as part of host initialization using dw_pcie_program_t_power_on() before
link training.

This property in added to the dtschema here[1].

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Link[1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
---
 drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..489ed64c1df0fa3ed9f6b0d4c3e0bb65cfc3308e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -269,6 +269,7 @@ struct qcom_pcie_perst {
 struct qcom_pcie_port {
 	struct list_head list;
 	struct phy *phy;
+	u32 t_power_on;
 	struct list_head perst;
 };
 
@@ -1283,6 +1284,16 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_configure_ports(struct qcom_pcie *pcie)
+{
+	struct qcom_pcie_port *port;
+
+	list_for_each_entry(port, &pcie->ports, list)
+		dw_pcie_program_t_power_on(pcie->pci, port->t_power_on);
+
+	return 0;
+}
+
 static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1317,6 +1328,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
 	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
 
+	qcom_pcie_configure_ports(pcie);
+
 	qcom_pcie_perst_deassert(pcie);
 
 	if (pcie->cfg->ops->config_sid) {
@@ -1759,6 +1772,8 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 	if (ret)
 		return ret;
 
+	of_property_read_u32(node, "t-power-on-us", &port->t_power_on);
+
 	port->phy = phy;
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);

-- 
2.34.1


