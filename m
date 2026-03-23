Return-Path: <linux-arm-msm+bounces-99241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAPIACI3wWl1RgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:50:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAEF2F238A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBD4D304A9FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBA33A9D9F;
	Mon, 23 Mar 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/rNbZVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F73A963C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270074; cv=none; b=QBEJifLn2XWhq8jTALKZp9XCebH/e9gGQYLZ1Q1Xe5PG2Dq/msS3Tdh0dQvYqQpbU+kZRQCgtv4tlh3tJYFx17huDvq6GIOCbTZycudelvwSE8lcFsw4drqrNGsriHuUbwM6cWtuFWFQJB5AMsTkbKO0YHYNdGkfBJ5kX21L1N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270074; c=relaxed/simple;
	bh=kwPIZbAhSt9tPjm+XLgH9wG/LUFAeuGiPKIiLe/hoiY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bvkIk/4DAkjzNevU1h/IqbVj28aYaXRDRn7g4brnp3Axidr8rzOj4DzhkxSMohrjkd+Y0Avih3/bLAlK58wPkh/t01GdmxpKlucQnidlwRdJuJgmEahM/tuVLwnhBRZO/HwOGCxh37K8N0Ndk9XX9b6zOCSPmK/vtsrQVO20+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/rNbZVX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so26740225e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774270070; x=1774874870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7mf4ZvvRjCHnVoYzPX8lyAdXXnyrNgsXi8PVr3ZaFQ=;
        b=C/rNbZVXTfsoAr+N46YheUu/H09vw2kHZ/s+eRmCyXaw+b+FYmhQ98RxgbcdIqTyTv
         HgOxTOtkXHmUqDiEojMpV6BHPCh6fXDK9vexLgXymLTFNwscA6eDxiXBFPITZG1ly7hd
         Z9OPcY/pA3QNmdUYEqNxsNyk+XJ6bEuA8PTpvwdtM+PGkozj7ZUO3aY0eE/AQ12tHjvY
         NtDoHfrXeXX2jAXX8DMnzYN+Zkx06AY9u2seQ3OOpduMvxGswmeFq35vO8FMjXtC5xaR
         R2d2g8PMIUEk/3a3FHQYXl81350gct7tNNAy46t0V5BGA90yvt5CFbHjYsgye+lXROUE
         m6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270070; x=1774874870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7mf4ZvvRjCHnVoYzPX8lyAdXXnyrNgsXi8PVr3ZaFQ=;
        b=Q0zN1APEm6d2AFKUD2PLKukGEdXin/x2IxQkVYvuQ0nIRRkvbn36tly5d/+PK4RE+y
         Lp3wMsliZ9yFHJvsmxk3lipoLFf64CpAcJMGUof8/xeVFBlM/LP4lXGHQLSN6AgvBTaU
         oJB+gSN2GbjX+aXVtK0ipBss2KMcYuQp049skX4/N81xH2oV/EgGhe8Sy0xsURypDBFS
         nTISkRlpuwB179+V9xaNBSXcHnBv5A4XyrvxkxZqTdA/c8FHf2vmKyHXGD5xW3KUBbqB
         MV6UIS/tieo+ga1+/VM54H112y3SqWpafDrfK3e+RJieOlcVjAID9YW3XlfRzklS2Nhq
         vCrA==
X-Forwarded-Encrypted: i=1; AJvYcCXufAd/JaBYNnEp9H5EMQvy4Yl5LVD29fqSEpN1o62Br9dN2pmVx5pNwrkBEgYSJAKUO1KFujuJe/62F8MI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8K4GJT3U6BvkFDxRs+r3DmS5QRrKxjF/uDUkMUkFl0I3rl7fA
	SoD1Kh5/9Lhri430UiDwj6AvQ8WxLCZX5kSHp+q2xQc1Frq3INoPy+A8
X-Gm-Gg: ATEYQzxqbaQvjfgHbPOf/Ka1lsXGOgw4J67JDmC9BQGv4zR21N+fHhH84HvsfJfnn8w
	vTmX3diJlnE24zYhnW7lp7moe7Lr2IhojsPxMovNHoJOTuWepIGPTs2LH7jkDz8XWwQkREYcIMr
	RNIATghWCmZVd7YHgZlxa/2FMSXQ0Pr68Bq75lphOGsrgvhwqzfCOei326i3TEjfjPP4PktYd1X
	dFw3PtVuGTpI6V7QiTrGjUUE9WdplHgjL1EfMYrL2cXjWerTm+BEoYgNN48izXbuSw/u8+g4Pt6
	tl72D1t5nLD8OJMOuWp20P2QvyH/VVa+nDRICE/nLc45l1L+OWfE15LAfcYdbVm2FY4QOOvxIN6
	g53TQMw6ivYHuxFtZHpl4q8y8Up/irIuohFOpCf8KXTuLEY8Hd9UccJjXxnzUzdaX3WMHLpqzMt
	lVAmM7HOsbLk3gr0cn5AkAGlMRwoQtsnuq6E2a7MJarqQYuCvBJfuCvKY5HhmsKhTSzLEseu1cC
	N+uNLYdJaXClyZZhqJaKrQ=
X-Received: by 2002:a05:600c:8710:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-486fee01a9cmr165094995e9.13.1774270070262;
        Mon, 23 Mar 2026 05:47:50 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d370sm86475785e9.14.2026.03.23.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:47:49 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE912C04 modem support
Date: Mon, 23 Mar 2026 13:28:37 +0100
Message-Id: <20260323122837.3406521-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99241-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnlplm@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EAEF2F238A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SDX35 based modem Telit FE912C04, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2045

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501..750da3dbb4c6 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -904,6 +904,16 @@ static const struct mhi_pci_dev_info mhi_telit_fe990b40_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe912c04_info = {
+	.name = "telit-fe912c04",
+	.config = &modem_telit_fn920c04_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
 	.name = "netprisma-lcur57",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -931,6 +941,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	/* Telit FE912C04 (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe912c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-- 
2.37.1


