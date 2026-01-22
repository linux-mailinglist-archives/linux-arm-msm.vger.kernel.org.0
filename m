Return-Path: <linux-arm-msm+bounces-90120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMZ8A2rXcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:53:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4E362AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 608F65299BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154BC47DD57;
	Thu, 22 Jan 2026 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2ZPIGdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNoCa10s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633839B4BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067937; cv=none; b=ENaDRcNCffHQe/rjcw85ehEN5HvXU11nvvkodEXQSCdq2IrXCXIub5AC6jFmzvUHgGUUKisyxkkIUp8Oe3AXHZZOCSopaY8q+DZ4rFCQcLUaeB49pm6wyhcrtFpZD5aeNMOtaRZlHF9PjXqomomzUKtt2UolAD9fiAEnBSXgeuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067937; c=relaxed/simple;
	bh=n2nGPFjnScHpzXJ+RD7+63IUXth3XpnixQPXv9q9I18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGVQ7aTDKCoWRfJj3ACzY3B3CrXqveorAHJOFR3zAO6454t0eqq3I0wtEUdeh67avTAiQjgOe0n4YJ8YleE0lv2F4Tkf4DMYNc+HAmA9A8jgFmMf9Akymr/lAhq+F2G5eph9rJR6P9cK+5iq7Eir5LZ5MWB/OixJ8f9NaqTAqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2ZPIGdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNoCa10s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M75x03485061
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUN1OBp4kIEhPf3pIRjZb2ZW1SGz8nbeNf69mcSi52o=; b=o2ZPIGdWWOh5dRLv
	7f3Mk6xp1LYfwSU/Bzx1MHjmmFC7741Dk0/FETdjVI1fAwaTqFgPweAAzYL9kV3z
	MwDgJHgGlTfW6pbIqfl66XEL4HrSijkKE+bi8IgaHxxYZqw1rzhjLZaP3tmqtX8N
	vHyr92xGI/3PZI4A8hIf9fBN7AvoEqetMdlJ/qIWCwPcGDHDu38KTjhqeeFFV7uV
	Vt4CElpITYXSjquK0V9bf2gokCllI2vKN8BzzbVGj0L0lBUZ+BZjdfDRDlfBaU+x
	9MV0Hd4WZtvb09foz/wPRb+A2MOTcXXGNYwO+nKI7QkFJtoPuE/ipR8uTbOHVkgX
	H7nRXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj1hrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so3885512eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769067928; x=1769672728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUN1OBp4kIEhPf3pIRjZb2ZW1SGz8nbeNf69mcSi52o=;
        b=RNoCa10sCZPFZKGa5yH5hkvIKiQ7AxQeEqY0m508rx/82NdJFr/Q+il2kc/S6PWK0s
         TaZqXOIB1aUoWb7VA0ieW4Jv7diKosw0wgU9hLkYxFk2UCQ08WC/lTi1nkH9rBqdyq0l
         h5mSa7EtfHjcnkHHe1mAuQQWLD5Dv4Z2ZNR8QASRzybMrml9fJrHfIPqjn5EVJwdryy4
         dC0NiS6+xt6urW/vVQrVmbwdVPGgvdLc815iU85mMP9lydCmJmo+x9+UIje9lzN0fHeF
         etVid4ut7MeSfAO5IorLFKNg5YKB/troIjY8dhYp6kYvWz17CwmuLVGFHIpxIxPUwXKT
         Gmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067928; x=1769672728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VUN1OBp4kIEhPf3pIRjZb2ZW1SGz8nbeNf69mcSi52o=;
        b=OF/9hvJrMn/rWM1VoNPth/d25xRZkja+lBpejGj1lvgRRf3/OoGtUGmiU4H8t4qPj+
         DBW9D0aeEAi3Lo2Q29TOPjFG7U0SocjYVw/oGmPuTVbghoMGOKFCDlOyGD1R6F78Joe7
         KcmmFNmfqIJISlM20ITNWQ76qjhQJZ79FWozwigoU8XC8hBAZZZ0OVmKl+Z8ucjidLXp
         T0Dv5y5U3/s88aBZF+HtMUPlsvHwZ2pkX+y3P5dswBDJ0c6UZFUiULtaeHrULRCiUoU3
         YJWjDmfwhtzG9iP13YpVAINl8PBj0LfKirndC6EimIksBKaWYIVewU9IDyRZmh3UORDu
         FcYA==
X-Forwarded-Encrypted: i=1; AJvYcCVAboAx+AsIzaR7ZM8yfMumyhxAFsoPSQG+39O70VXz7gMFd5ksMT4CJkVB1HqbtJ/gTH3u8UpI6LcXTimX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9g/l0q9wPJf6MpZqRU+yYEgc3KHBM+pJYSUScnTKirqFUev+D
	JT84ECLyQ7Sex/wzz7duKu0vt8VTn0T8du5iOrUJ8fFBQ8RQdnG0QTraVaqyFqb+SJQ75r5xrev
	eNzZb9cK29N7AHNbtiioP91MAf6R0vvgK8wh2UuCehIqDLiVrzGU+2wfg+D4OHiGVSmMv
X-Gm-Gg: AZuq6aIXN0wvi5kKUjebVfnPzpO1Xj1vq+tqgh1jTJb1+OfICKTPShEuBWsGcp66rGt
	TteWDg8ECRtALq/YKGjgop2sBNHJKzvFd+j2Exc80+pGMGFBwC43JLNPb+Y7MbfW8rfVq6Rm9cz
	J3hF1U4kIm9ZYaRIhz8CXnp8+slJAbyibJJ+s/nSAigvv12m8Q4R90MaLDrWbN2VAPXVCLbwetW
	oKasD3ycPfWU//4IkTtuYPHWi8xWUIXb9hh+2k+ImY8nB6wR/gI7NgpBXsIYZ4E8r2nR8cyiWD/
	J+OOZdimIP0aKOPn3jO9HlGwfp125VlIuvk7NPbH+3MJON25BWJnPoTTK/mD+CPoVJFCxuWr4Wf
	oThG8y7vvLP+JbtlFo+yL4NqI7vCZRi3dl9qkf+kw6c93ByPyVd+MFYV+
X-Received: by 2002:a05:7301:5795:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b70f7f0a85mr3659433eec.32.1769067927844;
        Wed, 21 Jan 2026 23:45:27 -0800 (PST)
X-Received: by 2002:a05:7301:5795:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b70f7f0a85mr3659410eec.32.1769067927293;
        Wed, 21 Jan 2026 23:45:27 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm24875278eec.25.2026.01.21.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:45:26 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 23:45:19 -0800
Subject: [PATCH 2/2] PCI: dwc: Rename has_msi_ctrl to uses_imsi_rx for
 clarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-remove_cap_clean_up-v1-2-e78115e5d467@oss.qualcomm.com>
References: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
In-Reply-To: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769067924; l=4649;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=n2nGPFjnScHpzXJ+RD7+63IUXth3XpnixQPXv9q9I18=;
 b=W47RVrStErji2+Pfj0C5yxNiqm9lGH5m0TJCGp0mn1J4BrepbOLorRyhye0BZHdHhc9Ye+mBA
 a7Twsi/BjaOBqhIeQ3eeNceJHMkN3yw+Z9nid6bpnHI0cXVYioQCQy5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=6971d598 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=udIbi99VXrYGKsD6_S4A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0OSBTYWx0ZWRfXzNl8j+ah8Osb
 V9oWQ441oyHoimPohe7QVdp2NANa3BflRh4T0srPeLqx+h4DArvXqFsu/fwrMfsqy2rgZCYmn68
 4T39zgqoguV9iqZJeNsx15ws3C+TyT7MN2o99frMQVG9wmSFl45kiB5OpuFsyS8QSKQZCK0tb1O
 B1tLybUHrludnCRsihqzobm5EHddhECSJynqnLxtepX6PTZHWgudiDgtP2aZ1U4ztSpm78EhmNr
 RZCvDbqUsU1IdgiBewCUOMPgtQJ+p2vefWfPONaDMdLAxM3+JT9gIPMk4Q2aAqFpYtKHfDZc74l
 aMLUiYRI8Xd+FWyiRo3j/ONDjj3jQxoFYZzaXtS7VXbkWRmmGkSH7JA8Wca6v6cOqQQKxc7V6WS
 tGoVPHYgrUQXe2Ip+oYVgPG59IyVihp7g5rzPMW4xWe2Ou5Q3mintmhjLrev9fslaRO0xoaoGwY
 aobZ7XjiODelfRUcDhg==
X-Proofpoint-ORIG-GUID: aLSTylCDmVQaAYa3W1metdm1GDps0DX6
X-Proofpoint-GUID: aLSTylCDmVQaAYa3W1metdm1GDps0DX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	TAGGED_FROM(0.00)[bounces-90120-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF4E362AF1
X-Rspamd-Action: no action

The current "has_msi_ctrl" flag name is misleading because it suggests the
presence of any MSI controller, while it is specifically set for platforms
that lack .msi_init() callback and don't have "msi-parent" or "msi-map"
device tree properties, indicating they rely on the iMSI-RX module for MSI
functionality.

Rename it to "uses_imsi_rx" to make the intent clear:
- When true: Platform uses the iMSI-RX module for MSI handling
- When false: Platform has other MSI controller support (ITS/MBI, custom
handlers)

No functional changes, only improves code readability and eliminates
naming confusion.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 16 ++++++++--------
 drivers/pci/controller/dwc/pcie-designware.h      |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a17833dd6f9d4b4aa06dc1fe09ffed5e2c28a82f..e7dbdf3670b426783e778be5064def10d2b209b1 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -255,7 +255,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp)
 	u64 msi_target = (u64)pp->msi_data;
 	u32 ctrl, num_ctrls;
 
-	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
+	if (!pci_msi_enabled() || !pp->uses_imsi_rx)
 		return;
 
 	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
@@ -603,15 +603,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	}
 
 	if (pci_msi_enabled()) {
-		pp->has_msi_ctrl = !(pp->ops->msi_init ||
+		pp->uses_imsi_rx = !(pp->ops->msi_init ||
 				     of_property_present(np, "msi-parent") ||
 				     of_property_present(np, "msi-map"));
 
 		/*
-		 * For the has_msi_ctrl case the default assignment is handled
+		 * For the uses_imsi_rx case the default assignment is handled
 		 * in the dw_pcie_msi_host_init().
 		 */
-		if (!pp->has_msi_ctrl && !pp->num_vectors) {
+		if (!pp->uses_imsi_rx && !pp->num_vectors) {
 			pp->num_vectors = MSI_DEF_NUM_VECTORS;
 		} else if (pp->num_vectors > MAX_MSI_IRQS) {
 			dev_err(dev, "Invalid number of vectors\n");
@@ -623,7 +623,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 			ret = pp->ops->msi_init(pp);
 			if (ret < 0)
 				goto err_deinit_host;
-		} else if (pp->has_msi_ctrl) {
+		} else if (pp->uses_imsi_rx) {
 			ret = dw_pcie_msi_host_init(pp);
 			if (ret < 0)
 				goto err_deinit_host;
@@ -701,7 +701,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_edma_remove(pci);
 
 err_free_msi:
-	if (pp->has_msi_ctrl)
+	if (pp->uses_imsi_rx)
 		dw_pcie_free_msi(pp);
 
 err_deinit_host:
@@ -729,7 +729,7 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
 
 	dw_pcie_edma_remove(pci);
 
-	if (pp->has_msi_ctrl)
+	if (pp->uses_imsi_rx)
 		dw_pcie_free_msi(pp);
 
 	if (pp->ops->deinit)
@@ -1130,7 +1130,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 	 * the MSI and MSI-X capabilities of the Root Port to allow the drivers
 	 * to fall back to INTx instead.
 	 */
-	if (pp->has_msi_ctrl) {
+	if (pp->uses_imsi_rx) {
 		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
 		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
 	}
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 53b65428fadb3d905b02bdcc06667065574f4f9d..33154bc89dd3b7d7fbe0ea749ca22bdc8292489c 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -416,7 +416,7 @@ struct dw_pcie_host_ops {
 };
 
 struct dw_pcie_rp {
-	bool			has_msi_ctrl:1;
+	bool			uses_imsi_rx:1;
 	bool			cfg0_io_shared:1;
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 13e6c334e10d21b9ebfe5f82de0aff3bce6191e3..999f5e083cef4e78b85a0111d2a90c3de65c83b5 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1633,7 +1633,7 @@ static void qcom_pci_free_msi(void *ptr)
 {
 	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
 
-	if (pp && pp->has_msi_ctrl)
+	if (pp && pp->uses_imsi_rx)
 		dw_pcie_free_msi(pp);
 }
 
@@ -1657,7 +1657,7 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	if (ret)
 		return ret;
 
-	pp->has_msi_ctrl = true;
+	pp->uses_imsi_rx = true;
 	dw_pcie_msi_init(pp);
 
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);

-- 
2.34.1


