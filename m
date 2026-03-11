Return-Path: <linux-arm-msm+bounces-96965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGf+K+NisWnQugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C77263B64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CD45304D1D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AF838F232;
	Wed, 11 Mar 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZv3SF96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avgmS9sp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1D37CD40
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232858; cv=none; b=KP6kVnslZGXOLEPeBZTz45CDuSYpW7gWUKhBjVu+5cztOiV06qA1rdpup80ZepgvAJzCDezX+6BVrap2gKhTz10FvLFjkjydj1yYDOympMxgBio+q2o+kEPRLZ0m9czgGMzYcUwfBJwmKN6s1ZHpwVs+v++o6eKiqkItl+B0xhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232858; c=relaxed/simple;
	bh=P7eBKgOTVNbd2AU6d6k1MmcyBnI7wcKu6MKbMkU3hvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDcA8nXPCWJR/86MYSHJzrYkahsk2OGKSq7jU5wVcXe9uUpLgK9ddQO93iX0teONTGHRzTmHt7w8NET+vSUETQTem8Dl8F+sk6WasqSoOfIxPFxKJL/xq4XsCc+iA+MwkqPpTm2WPB1ATA8RsF8/l5ciGyEUp6/o2KXD6ToIcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZv3SF96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avgmS9sp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7QIZ02031208
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z15d13ybfQqYpQ5QfjD8B6GQqnkhmB5ANu1YfYyMoY=; b=XZv3SF96eK/jNY6Y
	SnaGOuiUVK6hri5FnzU2HIRhv3JMwyc0EDby1gpOiyvm1t3lMhU2uLi2oQ2r54YZ
	kdCjVHSx1B/64iXTXo7U9ITZjZix8Jj1NVzD1+g3GrXhS8awkLL5GR1c2zWz5FTs
	xA2w+MvaU0WnKl0gmn/rIXrWamIZHPxh72Lx/lvSrK/MfouCRSiW+EBhyB444O7h
	uneIDFEuWDqxwNBz5FpbvEMlntNGf2/cG+ba6WteyXtA6C8F8xq7Cy+yvfrbR5aS
	wasS2I8z5S1aAZNtkMRAIoI+NWREuKjPC+Zq0ZhBVz4Q8zvNAhQ8dhhK1OyOt2gs
	7Sspxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h15q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae50386da7so6578725ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232854; x=1773837654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Z15d13ybfQqYpQ5QfjD8B6GQqnkhmB5ANu1YfYyMoY=;
        b=avgmS9sptaORT6JKa42ynj4o91HJEgVz+BtrfeYvxKOm5Oxe1a93BG1rGR0dC64lig
         QUsVf3ntSLn8/EWGCCNczugbs+hHVdS2drWQ8m4LBdfwj8XjzFeTLnrrOt+z1pzl9vmU
         nEN7/ykjAylJbsQrpU9g+Lu/WPigBcCyqT1zsHxHqrC2riQ1iT32IXpteL3+AjjbE2L1
         9cvzM5YqxXhkU3eijN0BsWGRjjv5HCHrLqV2ngIYtpxo/OIEYrCdmBGZNBaCG0nf13ak
         oLY2imK7BY5TR9D/j298esBIra+TYF2rtgF7L9Q7VvF7KRY+3M+URrAQdxfnt9CIqR17
         WRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232854; x=1773837654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Z15d13ybfQqYpQ5QfjD8B6GQqnkhmB5ANu1YfYyMoY=;
        b=u8C91VbS7k5csFXC9u3eWO4tslpLbZvPiqjGk1llAKb73vVlSW696T1XjXzGdsMcki
         LKXVUZfPmVq6vwOC2C4abC/7HWiy2GZExBW0rT7/K6jHWzJ9JXrz2sN4TmUcqf9+PqYN
         Pm/Xtpn9fdroICHYkUZ87uP6hocD7I4+O3F/90rM6Tw3XO9vkD64cM9JJ6n0mFP1fDnr
         zye2r50cA2TXbKZyt7+PaQQ5h8JT6b0KaP34UFa7LP6N8fzXYtQzue5pQ1D0yY7yH+OS
         Q9N9BWKIa0CumJozl8zoE1mnljRcQkB2mt49ACpFHVSq6E2W1xoiGMN7wV0VW+FEDG9a
         2rHA==
X-Forwarded-Encrypted: i=1; AJvYcCXL6wFgWDkkMg63S8ZSpF/0bS/I9eQQsi1Tw2Wt22cRh1mJJTBj9a/bDnco33PG3y+4zOys+a83k+io3h1B@vger.kernel.org
X-Gm-Message-State: AOJu0YwbgvQVD2zdx4nf6phB7hEJPQRBcCshf1h4STB8aTcHB9tFP9ya
	vc9xhjhLG8tKS33xXVTjDRnx0phC9pb80fDjFF64+h8rBuTzStNiy8lOnZzjuN6vn8rX/4H547k
	jfAEP1qZwhDg5KwMn5BPkRRoarpy3mqtFlKkZ3DwOuBURXvvq1ZrcMiZSsog15pSxedpp
X-Gm-Gg: ATEYQzxUaEpR5U+NzgnKMD0wMKJnxyy8i18KEaN0RXouGAdCfMIWD9XomD2IEWF41fa
	Dk3wzC4BeKHQUs2Ll9uBcQD39S7FZNRPElyY9CJ1j1PmiQjZ+cnzhTF1oXaDTvi/FME0zkgY8Bs
	a+j4rjEshIUmQbuzcHbQ0rDX2k6lJda2uJljgDjFO2ZzX9OJCqBqbWOSNlR8MWu4F6lSJn8wki1
	ebrpdyCNhqdQ95QPLTiP3fSqwkuStYvLXji5SeyvlIW8THfM3z380hY6PnVDaUxggEs9iUZ84RW
	7/TzedtB0qPA9IrbUgC0e3uM8tXT5nGywXqvCO89EWpz1mCdwvAVoBiT8p5OKDu9OmWAgaTUsOV
	mdSkzBHvPFEE3d71xedFlHOS9r5HUniqt+lwwxtvro+hEXdgpr9mOiDO7
X-Received: by 2002:a17:903:4b43:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2aea1ba9876mr80596095ad.11.1773232853924;
        Wed, 11 Mar 2026 05:40:53 -0700 (PDT)
X-Received: by 2002:a17:903:4b43:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2aea1ba9876mr80595765ad.11.1773232853351;
        Wed, 11 Mar 2026 05:40:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae2466a7sm23304385ad.20.2026.03.11.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:40:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:10:39 +0530
Subject: [PATCH v3 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-t_power_on_fux-v3-2-9b1f1d09c6f3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773232841; l=2929;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=P7eBKgOTVNbd2AU6d6k1MmcyBnI7wcKu6MKbMkU3hvg=;
 b=xleuH3VgOgn7EvYNWW7rJTRN8DE5mC8MXKORI5WGxi1kXF0jqeOcM5ZZke1xLsKJx0QiVPNoS
 82R2YqaDOxzBhjMSwkW6qCY8XlghwT7d/CGXh/35fvYga4o9rKoOkx9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfXzheypOQtsnIs
 rjqVcnv9OMcOA62BOU2yX5cDu9aUcAIn4YVuNSL05HPhCk2pdZFjLC6dS1jJDDQc+jStF1TP6bt
 jNwl2iDmUJKq/veE3FPXW4lYVLgM1vfiBbuBjCZISzw6GlOUvJh+uRU2azpPiW6Gphu4AkMaCsr
 r2UlwCd9gnvpMbXVkNf0+s3GHqXj3QEfgftIDlYBHZ7+4Z9vQU8v0zlNBaZFkai6yJ28VHJDo9O
 erUtFiTqkSqAx4zptnArVMVFcLCV7ieEYB0cqpFzdnW4UIKuq2/yfaoL2UBNoShdtKvBwtrwEAV
 4jHluXELRGimyG0nAjApJbK0m547Nt/Dnmaa1cU8+Euyea17tKIicV3Fd5y16qbKXOA5FH83jie
 OKEzeUdCWGOwG/BhfX41ILSOtXCW6FB2/ar4ki7yQVgljZknvcJzfBodgA6/t+xhhM1KjoengAx
 PdjkYCEamt2eW0LflJg==
X-Proofpoint-ORIG-GUID: 72jui-yny2Uk2WGRTsePRl-6_1Qhc0Vw
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b162d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 72jui-yny2Uk2WGRTsePRl-6_1Qhc0Vw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: 73C77263B64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The T_POWER_ON indicates the time (in μs) that a Port requires the port
on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
asserted before actively driving the interface. This value is used by
the ASPM driver to compute the LTR_L1.2_THRESHOLD.

Currently, some controllers exposes T_POWER_ON value of zero in the L1SS
capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
which can result in improper L1.2 exit behavior and if AER happens to be
supported and enabled, the error may be *reported* via AER.

Add a helper to override T_POWER_ON value by the DWC controller drivers.

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


