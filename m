Return-Path: <linux-arm-msm+bounces-101753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOE3EizJ0GmfAAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:17:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333339A5FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB6223008C82
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 08:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DC533B6C6;
	Sat,  4 Apr 2026 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxAyVwWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTWWCWGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0573537FA
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290657; cv=none; b=UdUh+ISRSlCYNgsPSv16FdBj8k1FTDRYUhyumJVWL3R3fQPbtBrS3iG18BiUrHO6+YjjB7XBgYdEylTKUZhaBV1TjnXycVTDmeGYs8urmQuq8fk0LYg3ukM1ZLLvoEX/NFsGOR+MYt5kPPUTo/cGVljdwmo64DVRNs41eXHbOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290657; c=relaxed/simple;
	bh=WxyWJaM1nRlxUT9s9i7G0JqWO3oDpGfwYpYNm18PeQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ApuN0fx6nTXDtSRqU5OyKRMTGjERJIQ6LRhDkRqAhzievaA3W4uyJGdmXZazSGwTX+YXNIKsU2AqhnWUMnaljuY/Z1OPSF64yI7YHS1XPoty3V0q2gIoKLg/p/AWE6JiPvuD8PpBAiK/wCDDTQY+fhC0KJQSyNqutA5ySLYs064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxAyVwWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTWWCWGw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344Bjqr3884043
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 08:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5wgiGfuhLOG5aXzit2OLL975WIbQOoDmxtVx7USbCY=; b=TxAyVwWpGZC6atFF
	7mNBXXNI9dNq6tLgkqx0mhJdBmpsA/WT0pHJj6Ebe5BGjlfljqrtSJDJ8Gmil/HB
	Oml+ha8Rj3hErZ2O85+1XBfXpoUbsw0QZXWIoAx9gPIZiBSGw5we6XyApLIZjGvB
	lePqkl2T9/qUlMVQKR0BW8zfJGhiajl7DSScJBpsAIdSJ8eHRezVrd5wMuQTfrDS
	TgplnGlKUu9dzKMmHQUhdyLSe9hZiF4DPzzgHasXYTTA7+ohXtPDzWYV8WG2XZMU
	yC7dkpxP4IimngsWwcSQu98grCT9fU0Gcgr2P9ELk3V+wzXq7IjjqpyCOh9O0tWD
	EGMoqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd0dh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 08:17:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3595485abbbso2930082a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 01:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775290655; x=1775895455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5wgiGfuhLOG5aXzit2OLL975WIbQOoDmxtVx7USbCY=;
        b=WTWWCWGwe5KXXvyNcEEEPScGt1ctpojAsiDT8r04t9MKQMhwHVioEItjNFkS00CjfB
         cX/2mJl+bNCKyLltstXoWWV+b4Cne3a93BUlj8U3V5ymoDpSS7QB38Lf3jAFLYc7UZp5
         te9jRX5diF4sl23HNZDLz1ZSh50/sah8CQDWeuDENwPrekYJcbP5xxVHbUkxjc3/7Dis
         YuXzb5XuE+GcntYyD30kjQQ0W9zOJ+RcfA6DVdnTYh01Dm9BD3AksXbXKU20BUH4MX8C
         cv2txca3mVQ8uM3tMGtCSBmUXRQMSXVpnnaDrIe+HUHjZbPpfMhvKSFLJj3yAtpcRJhy
         opeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290655; x=1775895455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5wgiGfuhLOG5aXzit2OLL975WIbQOoDmxtVx7USbCY=;
        b=HW/jcbONQO9tvNOzf98U1IJA5RQ80C4vxgNcFqD36p6KNwYNWpeExvEmCSxb3ipg5A
         qTJNWOdjAc4yFwjs5n/GlKNE6BUMIbQUKrSv1jG3WyOwRku+DMMeCunO/S+y2oUCSf/D
         ea2Z01Euo97Ta58cjFOKaMyMtITwuHbuDYFXI3AquwtdMoqrLvlNQa3XS+hn9q3baJll
         ydM4vgcjJxDq0ogOyku8Nz/R/CmQf3ih2F5OA0rTwReqOUgogs550HpGEWQrmh2Xvh1y
         Pab3qQIPXGrgtsOz+wlVfdoSVzGb/CVgEPAx30rP4b+ceNnNjFIpqLMW7NYPQLaXq2ZB
         z1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWU4Gf1Q+9yHzWOhLTqRdmmYrmpdqK8VfqPf/kmpSCCk6OW800XKr8IBPbC9xy0KddPNcbQaRvTvBXZ+eu9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0g9WxNs1VlzNYJnhg41B/J71gX8ddnBfOlmgJen4Yp6/K9nG
	tzk77XvvhEVRjrgaB5DIwbEcekSNt7en4nwFwL0S/cgup8SXeRbvX+wgkDGgoouo8muv3vkDl6W
	4XLMOfOsh7nSa27qIXjhw/6SZ5kQIXlF4scB4AiVMGdQZ7xAfyr53TGMWnqGJ40IiKWmA3c2CIV
	tA
X-Gm-Gg: AeBDieuPskfUns0xFTmiNJIO1K7i1Q2h1m+Wl+hHYUm3Z4zskBPucqcZRFYXoaAWhrf
	0ZimS4syE4Cji/a2WFQRqhL9jJ9u54MdK54LUyB9UeiDh3O4IBycCL50GF5NRM0BN6gogxaW+5w
	KMFANrBx/M1Nse4ieNNn03lT66+6JFKX8m+h0pGzJWnFx/TSIz0PCcWuZkBdjgQC41ExpSYYZg0
	DErbCD62kG4h5YOtUTZHcXnYo8SRAt60Yxb+DsfweCCuQuDHepEs7h7ph8aD8h7ftdwyVJIf34a
	MM4nRKrbw1XrIR4Zls4i7FuXIvtouH+Y7Sk30MiN/vrfHhbchkNanaES5nzfvDvLCLN54tKvOdS
	MhJtRF8iAGUfRaqPRHS3hBOk01sKAc4sAmumWUC13TLl2f9Pvp+e115Hd
X-Received: by 2002:a05:6300:6d8b:20b0:39f:57b1:ede2 with SMTP id adf61e73a8af0-39f57b26e77mr421891637.37.1775290655015;
        Sat, 04 Apr 2026 01:17:35 -0700 (PDT)
X-Received: by 2002:a05:6300:6d8b:20b0:39f:57b1:ede2 with SMTP id adf61e73a8af0-39f57b26e77mr421879637.37.1775290654535;
        Sat, 04 Apr 2026 01:17:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm6786408a12.24.2026.04.04.01.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 01:17:34 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 13:47:19 +0530
Subject: [PATCH v4 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-t_power_on_fux-v4-2-2891391177f4@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775290642; l=3029;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WxyWJaM1nRlxUT9s9i7G0JqWO3oDpGfwYpYNm18PeQs=;
 b=NZPGIsL8x+PRfP7EAG/l0EzDeAARbiXQ3V/gQXfIIL33gW1mnESBNlL3uw3M8FpAVsO24W8Pk
 T5xV5lrUbFXDwQg/VXK9GyrUP3wLjqhT4w5LHBHuUSW5BYJGO0SWOtt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: GK_L7OkPCNpFPZOJTa2eeKh56hIazcFt
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d0c91f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA3MiBTYWx0ZWRfXxNJeYCGzs+nV
 hmisw1I+1q6OTxzab57W+U1biXVwGp+fVsp2JFF5IlMDTMEOYqQNZ1ukGVDMIHzS4xNsHDaI/mr
 ExpibrFA7PeTLIZsnY0svTIe3xF7sj39LMVRnSUkpnufnNkzvl8B+u87WdEu9dKAj+rki0LICPC
 49GZ7dIRHed7Q4a6OvNa3wR0zPZj+lvq9nJ4R6dQbFobpNw1BjDPfiCG0nWxErUfSCi2bGEV2XZ
 32RpHbYtvOwYyrFy9XabUKqdH+Zzi6cxrZewvphmG4H4yYTLvrqRox0MC/kJmHXBD2vT41imjgu
 gO4fZqNGTxwdQ3LsREb+kSiyb0xrkUzbqwT6JQRTf57YN0pububpPNXQtSQc333cv3ztxphChfm
 NOP8FVnr7dUSOeAgYYJnHGWwFCTM5Ubl9FhjCU2bbLr+aY0KM+4xEGayLdluoDgp9V77kAlAmQ8
 Dk8ImT7JsTOzHW2F9Nw==
X-Proofpoint-GUID: GK_L7OkPCNpFPZOJTa2eeKh56hIazcFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101753-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5333339A5FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 5741c09dde7f40487c6da6dfd66f7c8d96a74259..6289329ef2b2a4ac9264d1c6cb5ea4e88c261634 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1249,6 +1249,34 @@ void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci)
 	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
 }
 
+/* TODO: Need to handle multi root ports */
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
+	val = readl(pci->dbi_base + offset + PCI_L1SS_CAP);
+	val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
+	FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_SCALE, &val, scale);
+	FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_VALUE, &val, value);
+
+	writel(val, pci->dbi_base + offset + PCI_L1SS_CAP);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 void dw_pcie_setup(struct dw_pcie *pci)
 {
 	u32 val;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ae6389dd9caa5c27690f998d58729130ea863984..da67beece3f11e33d9a1937fa23d443feea3bbc7 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -602,6 +602,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
 				u8 bar, size_t size);
 void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
 void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci);
+void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on);
 void dw_pcie_setup(struct dw_pcie *pci);
 void dw_pcie_iatu_detect(struct dw_pcie *pci);
 int dw_pcie_edma_detect(struct dw_pcie *pci);

-- 
2.34.1


