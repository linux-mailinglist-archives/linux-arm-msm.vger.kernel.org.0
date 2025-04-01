Return-Path: <linux-arm-msm+bounces-52951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADB2A77814
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEC8E3A95DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD091EBA08;
	Tue,  1 Apr 2025 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWS8mkLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B771E5B7E
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500773; cv=none; b=NLVG5pOEJqroFtS+anItw0cOuhQPqG1Fxbz7sLTFmiNxNweKCwv3hLNbDmYkN/KtAbQjftYdx6cwkzaxCXWwl9HeEGDU9nhOL6BwEY+gnADhFeEpOgrJHJfDROErKmQDV1MZ56VGKvyHKH8WpX/ybs36SkHc2UFWal/uy7VSHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500773; c=relaxed/simple;
	bh=Tcp9HZvb/PCjmWGO0vLFRf9U5b3H4XvfILX8CiczJ7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCiS10q6kEEn94qqqT9Cy5cLKWu/3bsuVGOPVNnyO7uR4xvaJiVAIChUbuXJg1TKoQGO8ecFnZ1Y9jl1yqsCRxLKq3PK+epI6u4my6zQaQx7qdWWOuvj6cvkgwzb8bYanEvEYbKZXV8HRT0Ty5vZw7Jj3fI3qAZsBw0TEdLQhS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWS8mkLV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3996af42857so4197212f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743500770; x=1744105570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7+YdZHx61WuTchvbidr6WBqABkO4VpBqCfmvieNgI8=;
        b=EWS8mkLVu6w3xxh232z4oY7bb0tF0zlkADT4OP07SKpgyettCoCY8g8p2QwhShgXkx
         et2AaSTCfFD6zhrMAQiPZrZUJV84BTGNYyqlrgIKNvtBdi5ua9f/5GOIWavbKcK/cOpo
         QarR/Q5mZ5snvmTTlbxA97ZupoEJEJqQQdAyim0NuNLXnRTFVOH6lg5EB6o3ZUi4++Po
         aKSH8CQwjppUqwaEZN3pvQUGQ0jP5oPi0jOdGdMvItLM9Q+NYF99zzdXFlOxHU8J6fw4
         Q3uY9nWiOTOKsNElW30xrBommMOFkq5fJbKr6yE2romNOy4cn90KF+HXE3PYQwh/3bl/
         H/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500770; x=1744105570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7+YdZHx61WuTchvbidr6WBqABkO4VpBqCfmvieNgI8=;
        b=KrZaZtxEGy7JsAsteiJfEFw6ZUg8Z7Wo8mStGUXlm5L8OS9zAA0052L/VtP4YgEQwh
         cdMUxy1NXSQL+woudzEiq3fZjtjmoSQLcMyuzgjtDkSHY5QJeGtbO+6MTrty4hIgSUOK
         c2fQSjFMD4mHvY7506qSEDR2Ts+aBeTsUp3GOh/jalzGLFYI4l9rC8/+pNPM9F1/msIv
         MoNKJg0ysRwpu8oxuJsAUcKg/tMfKuSU805fqr6sSmgRQ9PjC0X3bLdhnHLtHtD1oDM2
         DWDMPLDVBTY6hOtpugq0LvTT9HSV2bOSkGd9GRiEVKdqX9NA31lKt4N4d1hAQZfqZxtJ
         G4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfGXTQ03RutxcuOPE4knhXOjmqfS3ob8E5I0aJStaa66tTMsSDK60sNQNg2nO/eXQPho9hTx3NjMjeBzaU@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpqkKMbtlID+6wPNHjXs1q4gVhvr/uhUqEyTlBBMSGHU8S3GV
	Z8zx46XVXz/z9clntSdamYiPX0tKDZeZ3wlHKEex/tY5zxrKrMfM
X-Gm-Gg: ASbGncuEbNVKGu+cntX288FYNN4qJNMvjJmfn0p6oL43zu2MAahUG+GsgKqjGirkkjI
	X2I0/qQIkGGMOW9swgyxtiACjjTdGX2ZcZBBhZ2FSNRvLpaeOueQImQLVAK6K6ClTTt01Qdc3A3
	+CBYYk62W3Y28nfSCYvXR2PLI5s3gRH3OOzdZfAuoryYZP/Nxh7OhDA7iQXlm1rLJ8JiGiuL0LI
	wxh15eRxR8LRJDDulcdJAnPRAkJhBEg3y29d75temg8Sy+J51P9y2Q+hMbRxosG5XVeLb+7DtV8
	77gO24mpnDOzsBeJAB41NiXr18bEBDuwHVqJlWTUeN56nDHr2j+BPpjT4st1DIZtmPBxyX/wjaD
	r6Z/J3iLUTOymTpadyRbT2FnQ7JEk93H6uyf6KHGZQA==
X-Google-Smtp-Source: AGHT+IEfTiqdPr7CDdHg9a2sCxdofzFSZuIHFyBZIk15u9z3/nLhzGyPEhb5orbSu5hzrs5gh+i4aw==
X-Received: by 2002:a05:6000:40cb:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39c1efbfcaemr4268918f8f.25.1743500769928;
        Tue, 01 Apr 2025 02:46:09 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm13788511f8f.71.2025.04.01.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:46:09 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
Date: Tue,  1 Apr 2025 11:34:58 +0200
Message-Id: <20250401093458.2953872-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX35 based modem Telit FN920C04.

$ lspci -vv
01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2020

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index efe43592e170..57e2360c397b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -782,6 +782,42 @@ static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
 	.mru_default = 32768,
 };
 
+static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static const struct mhi_controller_config modem_telit_fn920c04_config = {
+	.max_channels = 128,
+	.timeout_ms = 50000,
+	.num_channels = ARRAY_SIZE(mhi_telit_fn920c04_channels),
+	.ch_cfg = mhi_telit_fn920c04_channels,
+	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
+	.event_cfg = mhi_telit_fn990_events,
+};
+
+static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
+	.name = "telit-fn920c04",
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
@@ -806,6 +842,9 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sa8775p_info },
+	/* Telit FN920C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
-- 
2.37.1


