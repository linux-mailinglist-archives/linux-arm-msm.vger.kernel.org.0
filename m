Return-Path: <linux-arm-msm+bounces-104913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHzdA9t28GkMTwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:59:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAA480C15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9637332715E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A3E3DBD51;
	Tue, 28 Apr 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ju8d2tQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un0j7zxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C513DA7F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365458; cv=none; b=FiL/U5c12QxTBzmQ1lXmb7r4otlg0RNc44cCH1bQo+3WICgYHPJBjQJUf1Qd3MYi6gCM+pV4P5T116xlUcXFwP18QvAeCww+/rvU6MdqOt+T6gdxxUJ1GmCPmZF0+WTwawmllYqoCA08+p9yZ3Jz1wAJ2CJ6o9m1lQgx6gcnjOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365458; c=relaxed/simple;
	bh=uCwOE5ysFbUangZmfLBwMHPVZzeHW0tDINBDTiiyaU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwNCzxt1a1fBt2qwNUcbUuGGd6phn0j8LBNpBSckv4tlOycnj+V+7PBDq+7icfezf4cf7+dB0VyMdHISRRKO9fgkXINy0vgEkJ7ScNWSbKQWJgNfeAGCHss92zD3iCf6yzmi8Apt1pAMZtrYQsTn5CMvN5TMVelBA/PRXvumH6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ju8d2tQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un0j7zxs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S8Je4S3123629
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfcCQvuSso/xHWrZ/kCjiwskfxgO+M/Nup3A47O1qUc=; b=ju8d2tQvc5OkPt+Q
	CsmSzLZNVRYeQCQWV8twjRwdxGq2Lu4FaAdo/Q650VB5fqBl7vi2UjNLVahvKuL8
	0yWzrOZgob4iZVINq1L/7Jk5CWlw1r3HerRcjlm9G78ZNeaI4JWt31XIKUPSjp9q
	mXWNYz4EMN2zdlVXKOktTIASSSlNeOcWAuXroiv+LNhxHwwiDzK2CvfRfAoDBBnL
	WRbcy6IoFoF25xZkBZYcfbLZYdGrKRJI8vt/ja8el1iIOxkhkBen/8+VJemM4+wj
	d1Jdr2iE62TsMzpuH03p4VlkiQ3acRt9Qtx486bMMgECbf+hQD5z1lO4hosRtCmw
	D0lrLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmm6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24308165dso157544405ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365456; x=1777970256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfcCQvuSso/xHWrZ/kCjiwskfxgO+M/Nup3A47O1qUc=;
        b=Un0j7zxsxFFoNUdUKO3q2Jh52NET+kKK5TxbMg8Ygmf/489k9vpu8uzijaAP4iNtIn
         iVLo37nDYugSFA4IDhSNA2VG/HHYMSEsJ+voM/+/CY3qJlzhhhLKdHwmMEUoDrjFhdji
         CrdseHh3n89ZlSenOM6iwR+Q9a5MkGvpXJt0PDbfy1FbDfUP9KDVB9h4EJUozg+Nh+Gp
         LX19G63hHZL52tkM6M9/aD2pN/0LKPdP1K0CvHSyP0OyBZyyIumsCnb8QCEsyFi2bwXu
         +DaflWOWVCOfvxLg3ZfhMbqEcWqWRFLzLW19j/IdINOFA0lZ2XBRzIDme1gt6wry1Jw1
         Uw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365456; x=1777970256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfcCQvuSso/xHWrZ/kCjiwskfxgO+M/Nup3A47O1qUc=;
        b=FTspCjuMM/e3lonel+bPIu50FvtGV3M36Dd2dyd8cOfNluQ5PxpLeCTQ3Igy3uaA2C
         BT79tPqUwQSM0N73Q4XS6RNcdZB7VBb4Rh+2vBQcJbeK6YBRLwKp9Q9RrlUmbK0qeF9r
         Fp2a5OLJGJFxNfvrQQLXFuSR5vi574K8qdaCJwTJQvcl8xrxHlwYQnl7jycslqBeTuG6
         2wxmScaOMuE0GmAPDa66imWAFau1BKdzy+gSAdeJ/Wo7XCMq7RUgP7BQ9uTVAgNcjaGi
         dmW1ggolVFfP9ObR+x3wBsDPIaspy/nz5St0FZMbFfKwqyTbR7Rn7c6+NgmytuFSo7Ug
         rzdA==
X-Forwarded-Encrypted: i=1; AFNElJ+nLJeQnjaukqxzDOdtVGR10wR0xIO0D+R1yTT8zXlfs7oquH0hZCbtmMIhVT+fXR0w+e3AXcMjlv30eQkH@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqsHkUaMVXZVvAAKBdybc3oBGDm5IiNCJ509Gi3OC7c2PHKQk
	3w6ZBSJenUEutPOGibSCmTtyoiCjociJNC2beks1QoWMyZcp0b6+TYOWXO/dcoo0nEEbnQihpsC
	VMiH8bZ0FGgqZyvNihnwBWh2CJtZTtx4+EciY/EaQQ3ofmYAARWvILQrPUsUIcc8BVvaBL/i9U2
	vT
X-Gm-Gg: AeBDieuwGcm0KGrrZ58J8KrNRljUeieupBEElLzbchbeVpt04DNKVzvar856hV+KRz9
	mKVz7Ekd9NRnlGjveE8uZyIFseTPQzH/ZsW4g2n0pF1Dgi7gYbKcylu68j6jMNNpLA/rTwJTuVQ
	/7jlWjD3lA9OLGrNFehtUXAKrHG7xOJK3o2N5TUhf/2FA4GkSNEEnTi8Xvs8dz50oziv75CrV6N
	d45RYpx5adPWtJ/ixpN1lqft63PNuGuhq2/C+tAol+T49mp51AEBAKCF0cgt/tviGaKCM56izVk
	HZpVPef+nHigLSYtK3LIfk1fSf7Rm7QSkit/Pheet+9kFzgOasdUNhJtzH6+R3HsC3ftAnSRkAa
	3S1meQEdLHa5FJ/jJZbenW5WnZ21NrDcn9RZJjb8vwD+3/v7q00NQkvDlclDbLtU37hI=
X-Received: by 2002:a17:902:f550:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b97c462246mr22697555ad.23.1777365455649;
        Tue, 28 Apr 2026 01:37:35 -0700 (PDT)
X-Received: by 2002:a17:902:f550:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b97c462246mr22697155ad.23.1777365455127;
        Tue, 28 Apr 2026 01:37:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm21645315ad.84.2026.04.28.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:37:34 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:07:16 +0530
Subject: [PATCH v5 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-t_power_on_fux-v5-2-f1ef926a91ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777365442; l=2919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uCwOE5ysFbUangZmfLBwMHPVZzeHW0tDINBDTiiyaU0=;
 b=JVjkJji61wI6a1eKinXgcH5AhzCDvNTpDoi/tKNk+aFklOUPuhvM+KsJ0w9o+z9PoxvXVRVld
 TJDxuns7HoND922F6EAZ+NI0u3YN2JJvp8Ue/k9HgI7yDUUXKCadR6/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OSBTYWx0ZWRfX6okGeT21SVul
 DhJdWZ+0m7jEwc9KifkRcE6NDba1+tfbqzbe7EKEZCHSpPiQj4hbCf6gzZWHSZTyxIAFZA4oHoG
 CIF5IfCjhZ1s93iydk/l4EGNPAfC0VcPkQ0t6GVyHP//zYrQQFXw3CPoUMNUaoxvOvGF1P32ivh
 P9QOloHzMJq2TuDXJ0BrUlGf0NM3rN156C8duEQZnlvslyNbpu5k68Y8q2NQVeAPlKjCmsfbau7
 hsxF64jSV628D5SHhxz6GFMba/Ru+PYi0OvrAU3ulXDt+CIGMhkrUIo/K3q7h1rSYovlPuZGoRa
 mzjm2ccsLt8WDI3P3XRLgXSlAoM2pA3cgrEqFyxZ28J15tvFh4KoeORvnyfIRmH06znTk/RdE5D
 YDEo1z6167cJ1thfaR6EJ1agfIb1a96wY6V0dWDaaTMyAa+5HWv4k8kRa1dy17dMw/gg4Khddqq
 yeSwJ6Kbx8KWuGiVUlg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f071d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: tch-Kgn9ID1KxkFXN4QJskCydzybfsu0
X-Proofpoint-ORIG-GUID: tch-Kgn9ID1KxkFXN4QJskCydzybfsu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280079
X-Rspamd-Queue-Id: 62EAA480C15
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
	TAGGED_FROM(0.00)[bounces-104913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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

The T_POWER_ON indicates the time (in μs) that a Port requires the port
on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
asserted before actively driving the interface. This value is used by
the ASPM driver to compute the LTR_L1.2_THRESHOLD.

Currently, some controllers exposes T_POWER_ON value of zero in the L1SS
capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
which can result in improper L1.2 exit behavior and if AER happens to be
supported and enabled, the error may be *reported* via AER.

Add a helper to override T_POWER_ON value by the DWC controller drivers.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 28 ++++++++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c11cf61b8319..9e5fc9935a4e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1249,6 +1249,34 @@ void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci)
 	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
 }
 
+/* TODO: Need to handle multi Root Ports */
+void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on)
+{
+	u8 scale, value;
+	u16 offset;
+	u32 val;
+
+	if (!t_power_on)
+		return;
+
+	offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
+	if (!offset)
+		return;
+
+	pcie_encode_t_power_on(t_power_on, &scale, &value);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, offset + PCI_L1SS_CAP);
+	val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
+	FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_SCALE, &val, scale);
+	FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_VALUE, &val, value);
+
+	dw_pcie_writel_dbi(pci, offset + PCI_L1SS_CAP, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 void dw_pcie_setup(struct dw_pcie *pci)
 {
 	u32 val;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 3e69ef60165b..6f741fd9d753 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -605,6 +605,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
 				u8 bar, size_t size);
 void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
 void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci);
+void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on);
 void dw_pcie_setup(struct dw_pcie *pci);
 void dw_pcie_iatu_detect(struct dw_pcie *pci);
 int dw_pcie_edma_detect(struct dw_pcie *pci);

-- 
2.34.1


