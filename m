Return-Path: <linux-arm-msm+bounces-107080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFQDLWATA2r20AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:47:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423151F8DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E38C53008785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6014A282F3F;
	Tue, 12 May 2026 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRqQROV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1519360EF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586336; cv=none; b=NCoFo2kFpIk+/NDeIW46OHdYZ48MJ4ZRVDWAE6eiwhxOJ+ix3GQURadMd97MGYhAUOVCeKzTUEq/TDx5uLcPnHcpCFmJjAckDvSY/IiWoEX/AEbJB9w1MGs4S3b43HzczF4Tp8Zn5do1XTnT98O5XXWA1XwHvnMffKAa9LWOCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586336; c=relaxed/simple;
	bh=ZrEzIHpJKUH04VIV1aOFXpMO6x5uT0snNxYaIEv5MRc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QD9HK9gnPYZRj6pJuls+1BhevhDIDwgIs4EraOx/qjK0nPH7SWIXsU6GngTpVkVUGuf7VAT5mnlLH27c4RadgbYNlk3RCc6MjCZzttGuowAcjTFSYZJgv8OAByS8/1Wae59zzoNKBRcdrAce4QFIUoyOG2sTsO3QQQIOPjXhnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRqQROV1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso46450935e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778586333; x=1779191133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHeRIq3gd81J0mQ1jp9zUiVyyBrvNpsMzoSo1odTZjU=;
        b=fRqQROV1qMbv2z7T9aqZjuPntLlIanOGqnCt3D+WBQqLOGZUt1vNf1ysWSblN3/MD3
         47TzErSRSe71kdbmM+tN50gk0y4BOsmTNvDXFtxyrJlTDV8uTBBmiHISy/EmpzJQnZwS
         83ugwW6OxEHTyFmS7Xn2ilGZT+8azhz3AhIYbYTb0bS88Syqy4XdwoRuICdyFwocx7dT
         xMO2dmXKLjv1u3CK7Fce0IrJfNO9zUnHNpWbKVP06/RY/MT/0abIw3u2ieSiHt/Q3LHa
         ydql3sc4LTsFxqj976OOYJM1wMrbhJg/5iUMqswa/DXYeUkSm2bVki9AVzfk2PUA2G98
         ws6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586333; x=1779191133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHeRIq3gd81J0mQ1jp9zUiVyyBrvNpsMzoSo1odTZjU=;
        b=LEzlUf4xhrdNxPmkVYdD/xys+48DsW3lY4jC51wcEXzFiEAYDzYBlG0AUwnCOo2vrX
         qHtYma4mHc6Q8r0DZQSf4gN2dHIwHL9YlW+nErb02MIbmk3LN9TC51Gvm/PEtNd72of5
         SPbZuQLKEt0Y+HBSJTtMdZzoYhWZBo05mfLlSsZvs/VIQiYaxO81XW6n7h8BECX7U6Wl
         0kkFikUHtmofpBQsDT7ILdbGcbk+hyQAU793FrkHJ5PMQ4U4x63Z/IGt6RfhzvQcWr/Z
         B3pb+IAHVu5m9nz4zyS28jRsbuGhp1mfrxblCw0hbDKYt/G3fp5bONo3MuwDpMglOg2V
         QSqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aqfM+eigUrImpYZlM9RjQLgPGmU3nT4/7iz2eHTPcpacWH/ONvgo2dkfiarVDjZKn0u/ggO3FIR2QnryA@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9Q3O+MZVlcCWJMGJJ8T/Q3jVzT1l80RPIROr6Sp8QbpDIdOG
	3F36bxyNTSYGEGUuvLE08cQPGwVXisoJf2LhZoEDJUhQAWjturcQft9B
X-Gm-Gg: Acq92OGYr8PavGl3Gx6Zq31iBYQg2jJLZObsyL4xBtamTJ+lM9UiKm6pthXLaB5Hzj+
	HrbEDGjQ816XP79rXNcy9NU5MOBfW8854OZQ6E/OAvU5/fP2utpOoRxhqFEuuHM9Nqsb9V4GKy2
	k/51BffDBOxmk5Ak6jp6EhKbG5zxzpkzZi62zwukEgJFMlBfdq0UGpNnLJe4lfh8qOrUrOlV207
	qvb2j1Rh/FsU4HN6tYlz01j3+AYaKEtiLxKtrFlW1t4Bx9/Bomsm8FbkArNSWS7wtFuoK/NjcqN
	N8QdqmNlaEtNCH/o6k1rAlIIptu6+EuoBLq37/ft2p26Qiiqxj1TWOkv+n8nhIvDvaj7mBL4luH
	MHXUh04HpAlVaZzRPcp+0YwhovS3wD5+r3+qwDam6AeNGkwVEOjjzSvfWzMHp+Kv7slM7r0ONIv
	R32/4h3aN2Kk4jfUgjSCXZSq8gYs7diNGadPuNtV8rAuRNIguC1DWjNgaklXAvydlTUH0n9KxiA
	XtQxkP2bwjX
X-Received: by 2002:a05:600c:3510:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48e8fe50c53mr35510305e9.11.1778586332917;
        Tue, 12 May 2026 04:45:32 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm28438525e9.2.2026.05.12.04.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:45:32 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE910C04 modem support
Date: Tue, 12 May 2026 13:24:58 +0200
Message-Id: <20260512112458.1048999-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1423151F8DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107080-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnlplm@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add SDX35 based modem Telit FE910C04, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:202a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..947ab89a09b4 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -914,6 +914,16 @@ static const struct mhi_pci_dev_info mhi_telit_fe912c04_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe910c04_info = {
+	.name = "telit-fe910c04",
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
@@ -941,6 +951,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	/* Telit FE910C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x202a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe910c04_info },
 	/* Telit FE912C04 (sdx35) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe912c04_info },
-- 
2.37.1


