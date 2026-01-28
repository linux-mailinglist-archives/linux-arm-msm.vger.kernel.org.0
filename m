Return-Path: <linux-arm-msm+bounces-90987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGU8Cff4eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:54:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA9A0E4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAC5130616D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88D434EF0D;
	Wed, 28 Jan 2026 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8RYbQiU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtfEmv2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4168A34EF03
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600459; cv=none; b=OHZx3NX8/XpS+9TPCJY377gMd9AdAGVGtx0qMYxw6MjIp07VYC8jWZnmuSAhoVwpOS0+h1CMCGEKebVZxo6D999BU0S3uvfiZkfCUVxxfAEPLKyAkwBw9FcMTNwjnoNfn2sjqn1zJKWiomtF2GNvDvx8F+mMP1xDvWSwxB5Xc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600459; c=relaxed/simple;
	bh=2/RHS3VB+9/ela56gcCfKz5EhOgp8MbiqRV5USDd5Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoNjiVFYXi84LVLf/w+4zmI5ftEu6KnZVGa+TJnUnzT4xJq5Pz0pxNsUYZbDfBOCp0C24fnM8ZQH9RmTBYndZeeZIoz3Zb/IBVrkWjse7Y7SbtfKA9V6S3g3wGl24KDBs65dRI8y8VY25fhcowyd/C3tpEilFMU0RIjrFLYRU20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8RYbQiU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtfEmv2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92Tan3907664
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=; b=P8RYbQiU17NBiLJI
	Aqiq4/+WZO2pvPZm/LkwqpkLQ8KWPo0Gw4ClFGSJngWW0mp63MLm5jbfn0nIQFue
	mFZmsfeiG+H+hs21ctEhqZI5l7ytzHdzxjFeCrPXeUOH9szwmcpB5o3amv/q4291
	bsymptpgkWzz332RAd13uGxXTzGHMr8XHIsJZcyhkSlHnDQDduZdFYEopnGXjYh6
	GznBC0CFSCVYY966uhnloEp5jNsmj5l17GxjSHShdNL+7b+ByiLKDee3glfMLO6w
	1Cldlr4Bel+mCwA67Xcrs7XsvMYp1nufzh503woCnjSyMdfgUu6qN9MuZOrGB+C2
	Kr+EWA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0bkxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:40:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6187bdadcdso3866257a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600456; x=1770205256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=;
        b=KtfEmv2pQ/6Epd66qkASK7Gc8mh19O34hU4fwakf+AY6Z3vXwiyVZHqp3cPwhRAFlH
         efKJRQOET24YvvTxCJDf3DvoaxSBF8Aea1YXT7CjFRubI+vo5qEtyPKD2lv0KEm70VVH
         LB3zc+Cq3cLp5Oy339v94n/5ekOjeg2FlYQnZ1wrcVAac4TzSbGO1k/bbRJfYyEMyan3
         UgeU6Rk8t+Cg/L25Q2IU6nxgqJaY38in4vkGBpK9wy0uVafUJqq6BVTLrNgWrA7WFxm6
         y7g0XGEHkqCajWEcbSn2yFic6+nkrrG8vB5QfJGzzSdclTHhBme0P5pNzN48wrTmBRUV
         z/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600456; x=1770205256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=;
        b=D+GoasQa4ML2Iw0H6fyLgCpDz3crzpsUSu9T/mfkqnmBc0IpW14QxGYIhBrAC4Ugwk
         XZj3hBpWPW85A0LVCTYKvN21sPaVtqlLdFE6EfdUQZYB9npAmHkg5H3t38oMgNDq4DNY
         b5b8tMqohKjeDkn17Os3CxUdBun3QFMXoDbvrtkYZdE/KUflNaBh47aIbK28vB0domeD
         LWGmC5QELItgIr41Rpim7zpvDUVjoyJic4XsfLJiQYvuwYY8SJ6W+J357Jz+zLtAD+8n
         2ZxCT+ez9u1UxZrid8sGxKkI2OILZ4HVLXDOc/lNsUg9r/LbC7jCIHQyedbirOCYqcOM
         O8fA==
X-Forwarded-Encrypted: i=1; AJvYcCXIbh/EMPM7FrpJhxWnunkIFaQz6ImgcB8Lklj07I5Tj0Q07aHzEte0X2gI8z2hhmzxsilw17959Mj7OLf9@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYylGznv8f+tmwG+hDOvOEayUWLwECtZkWwxqhkzMAhHwfqay
	qaiy/olVlooFBua4Yr4ddKYpSFZ/I1as6ivLlcNdsSlUC7pzfZc/e0cjVsoPrvfhPCrInpT4TVv
	9wUGrZoXD3QWn91QABF+B9E0HIY//9LbUvo7dtmn6bYFY62aRyuknvLO53+u9OOb30tVk
X-Gm-Gg: AZuq6aJRguI0L/Ua6WWvTISPnWahkLTMfjp+QHuMOs0bMXF64usWxe08L2e01nJ7OwE
	xX63t1XmERAl7XKUuJoGQ5wgEc+05FjOTDA8xEDXef1epXUnETgwLXlfumKzKKYEMHuoG2vrTOG
	hT9NDwswGINVFmWOA/RockbM+46fbcWO19PGhw6EbG1fD9Y9ktHrK/shERxPyjzdLb12in+pIUB
	jADmjO+heBL1XObYmeM5uhgyF9dWC84d9aOi4ba9JvLPnaCMReqNWj8GyNrNyQrNVBJjZSMVGdT
	ZI/4duzKrygg8NPRzjvyG5ThCx70NwBSTVPQXjh/TgZGzcTpRctsD0vfOJqt4HB3kEa3lrdIMDq
	JRlNJvoN5zGhagmJu0x6MVns2IkxGbfQ5fujqndBxmgW3
X-Received: by 2002:a05:6a21:7a90:b0:35d:bb66:5ce3 with SMTP id adf61e73a8af0-38ec6287db1mr5032434637.12.1769600455883;
        Wed, 28 Jan 2026 03:40:55 -0800 (PST)
X-Received: by 2002:a05:6a21:7a90:b0:35d:bb66:5ce3 with SMTP id adf61e73a8af0-38ec6287db1mr5032413637.12.1769600455424;
        Wed, 28 Jan 2026 03:40:55 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:40:55 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:10:41 +0530
Subject: [PATCH 1/3] PCI: host-common: Add shared D3cold eligibility helper
 for host bridges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-d3cold-v1-1-dd8f3f0ce824@oss.qualcomm.com>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=2595;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2/RHS3VB+9/ela56gcCfKz5EhOgp8MbiqRV5USDd5Bg=;
 b=9+Uq3obX1/upVJ1jSgLEdlZDN14hf6EC2Z5l3sJYRX+e2KMzaMrGwzdlT8eEsRE2LClbxTJKD
 nw9j0LzsDcpBv/30rGcMussGSOFuzmC9sfng9UFkEgAb0iNNoHU2HR3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: FycrACXfWNbsP5Ys47jF_RI1Sdc9Kyr3
X-Proofpoint-GUID: FycrACXfWNbsP5Ys47jF_RI1Sdc9Kyr3
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6979f5c9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX0rOicwTbAC9V
 LVuo402+KCj43YjkHCuAm9/7j+Jg55KdXJMz0BPMOd8xldoxuImPZK3VjYtv8QlIMoWVCrZPmDG
 lFs5/9cxMV9+w4RHTns3kD7Fd9nlaZunscHIOf+WmmO+PclHZ39KYhjsqriU5xG7zL97SUDUfDp
 tXcs9PnlFXdJzB4IO1eqddTyC22TXEv7M3PrASJ5sYlVYJLJhCObrg89Pe/SZerQR5WgSUaFMWe
 Wum+hrteIGQPR9K0fCMssRgsKScqQ+N4Th8xaUehuFWOfyzcr+op/85+actm9sk2hbGEIv17qBu
 6WR44G4GP31Ws3vUtutT/gTRRcVh++HKfTOFOG6vzQs+bXTet+wGcgN/1tVPI0X8HoXusPt12zf
 2UOIOVrDgchoN76eePe1b3ctawWx4BoPOQ2w0TfchAfUI/lPmKQMB9sssRq9xU6KNNE3+ozk31p
 eDnOI82iEJ8CsoLf/oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90987-lists,linux-arm-msm=lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[104.64.211.4:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[202.46.23.25:received,205.220.180.131:received,100.90.174.1:received,209.85.215.199:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EFA9A0E4C
X-Rspamd-Action: no action

Add a common helper, pci_host_common_can_enter_d3cold(), to determine
whether a PCI host bridge can safely transition to D3cold.

The helper walks all devices on the bridge's bus and only allows the
host bridge to enter D3cold if all PCIe endpoints are already in
PCI_D3hot. For devices that may wake the system, it additionally
requires that the device supports PME wakeup from D3cold(with WAKE#).
Devices without wakeup enabled are not restricted by this check and can
be allowed to keep device in D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 29 +++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index c473e7c03bacad2de07c798768f99652443431e0..225472c5ac82c6c5b44257d68a0fc503ec046ff1 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -106,5 +106,34 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
+{
+	bool *d3cold_allow = userdata;
+
+	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
+		return 0;
+
+	if (pdev->current_state != PCI_D3hot)
+		goto exit;
+
+	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
+		goto exit;
+
+	return 0;
+exit:
+	*d3cold_allow = false;
+	return -EBUSY;
+}
+
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
+{
+	bool d3cold_allow = true;
+
+	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
+
+	return d3cold_allow;
+}
+EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
 #endif

-- 
2.34.1


