Return-Path: <linux-arm-msm+bounces-65190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2DB071B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4874C5018F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F802727E1;
	Wed, 16 Jul 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iekojeQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E31FC7E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658285; cv=none; b=gK9l+1UQYCeXnAFQTUwraewox7HniDBRRm0MOI+Z4nSZjWfc7yoAi3hEucRdvM0EN9d7Cv6CWSeqfEKwzLCrI+QMpeAC9P9Qc34jzed7Xyep5EJzosnmEi2PtdK87QkUdScT6eflvdBgeXlv5DwtTuQXTHCy9/vghfaKd77Lgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658285; c=relaxed/simple;
	bh=ej+5hkCMRkx/GE1qcDYWd0xc2QxcktAYnQnGWSkkqpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hSIR5oPHOUwZPfdDLHHnDT8snRw6IiygOH5oQw/7SQQCuphl0D26zQGsRbSWTNaF77PYYDADbvc9W+lVfWNIGjmBUkCTISRQUUz+x1quZNgmHKwVhoAUtK0mQmkcxlqtiVGHFmZ2SAXCDyBezexF90Z3zYOcnjwtISSiJ+ye0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iekojeQC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454f428038eso45741145e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752658282; x=1753263082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG0tZ6GuO2rfXlaJ2pbUobsFrC3TERYmTm+061kXYtA=;
        b=iekojeQCXHFEHwlWhHtWwF79L0RG0cnEw245moHAYEp7n/JJwe+gfW0j5FfezaFpc5
         wy9Cp7Z7D1QYxGcEC0kKTdCrRYIXYrfncT7CpQaYt46c0DN/86zaS39FAftHQbUwbI6l
         xvBApcpNHkJsB4h3dE24Pr2LMwXK/cwl4Zy8oqUPgN1lQaNdI3MEIOtDCrLSCYyHBkpr
         KyaqkC3tZt3aUmuR+3zerxcrnFObp1k2G4FktxHG/fwqDiTNKvkSu6TtibSrOAzaBX8f
         OD+3b7t1zn6Lhaboz8ghh+rFnKOqSSAjX16R00Y201SENDaHh7bCVC1zUWaZRf4JnaG4
         Aj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658282; x=1753263082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG0tZ6GuO2rfXlaJ2pbUobsFrC3TERYmTm+061kXYtA=;
        b=lLbod235YMiSBbXs/lml7FvoFLHBVWtj2JnNiXzwWZhzrWNZKHiX44U79o0BYkBLZq
         SbNmdbWnHMcJEXDS2ibfrdWGjKtH7DwSmcKr/2R1LQzrhRJDCVj4+nc5vG3sl0nJ6xZu
         tMALrK52DUdfyHontiJd3/91Xuy7ExIlljoIKMgPva+KAZbRblTeH1TASoJqmzO5GrfN
         19s/orOSfTCbSL6KrWwHuzpM0CEFnc/wPSmHWSWk0GzPwq8ibNsSp3wa/mPzHih/qBoz
         5PPDSrmXqaWTEG1DZEx01BenB4r1/jgoUWBHRzSvYJ88gJCSXXp1q1QZ79YMssvgEJOC
         XYsA==
X-Forwarded-Encrypted: i=1; AJvYcCWqMzcHcRUSTYRu2nfLVnE7lbyswAeMDv3rcqmujwLhjxt7PGv1l+ouL9uhVjoPXLT9Z/JQcdXosv5H08sf@vger.kernel.org
X-Gm-Message-State: AOJu0YxJjzEucmmUePcW2dWGVlLx0DS9i4IVJmBNfESuAqYNsw0Uq5KC
	TYLRrM85mz5tW6cAWTKG6G9aldRINZPlM59jwzNjtLf+zUapjTYMLHNy
X-Gm-Gg: ASbGncuhjdZ+lk8FxsYe14GnuLIMW6J931nvCq20Fb4OKP22VhO6R0qiCQQ841xqfRF
	Y/KsZqWYfp0ASX2i31oHjftDJZU/C+44v/umzcrnYbprRWgKTSnu6d/ae+DsJaRrSKdUT7l3e7k
	jYKShRqSaNH8Q32N7dyDcCAaRzEsYM6AcYy7ZHXSXjqUPgJ9V261jPjO0UnUiN6kHsuSEwFvanA
	rPZUTBX1aBaCZtfQIg/0yGEC0vd9a4ygR2wa2Q3l3Y2UeJVhzpFoVcBknA0GgfR/zfi8rBFQLhp
	69Rz2Lgiani65KhGAe4brqZN44c9q+D6g3Ev+ISsNVRVBWv+HYbEVUPjg4Vstjv8k4XDRUMixOs
	KQjw3dmWMqhm+fxyGfaXyF5SXW03BPUTJKTnXXfSDlUgjzfp6w7Bgi4fLroeDOs7+0/LT7ONDyP
	AGiG3Gms3x
X-Google-Smtp-Source: AGHT+IGymcNYqKVn9PbuWWgMCBfnL2OyVM+FICG2nm+gz961Q3FNsg5yfkRvxn/+Iahe96pjcUCCcQ==
X-Received: by 2002:a05:600c:3496:b0:456:1b8b:b8c6 with SMTP id 5b1f17b1804b1-4562edaa066mr16201335e9.14.1752658281904;
        Wed, 16 Jul 2025 02:31:21 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e82cf22sm15396205e9.26.2025.07.16.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:31:21 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
Date: Wed, 16 Jul 2025 11:18:36 +0200
Message-Id: <20250716091836.999364-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:201a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ec2c7410ce62..48f061e1eb06 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -859,6 +859,16 @@ static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fn990b40_info = {
+	.name = "telit-fn990b40",
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
@@ -924,6 +934,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
+	/* Telit FN990B40 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	/* QDU100, x100-DU */

base-commit: 0bfe192d90fea2c1b523868a9c110d176a2be741
-- 
2.37.1


