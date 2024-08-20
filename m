Return-Path: <linux-arm-msm+bounces-29064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6C958074
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E764A1C210E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D66176AAE;
	Tue, 20 Aug 2024 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O31bAxDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE11C6A1;
	Tue, 20 Aug 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141097; cv=none; b=AfZTjlfuDn716BDEZjNGtcM6RkTPcOPwc3qvKqWXjqpL+nvUAWsbv4Capm5bOr1asmeeSZOOC4PO5PSvH8aReKiJwBPeGoigebITkkNwO4oFumRRGzd9lhOwnX4Ic52aCY+IqllE/w6Hap9PId3bCwQa8qQ6JGkgfyUlZry1594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141097; c=relaxed/simple;
	bh=nLDE8aqv7ibiDI+AnLjAU/rDCYSS1DmP41EiC6RFcmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhvgR1RuDMTM9jDm/xKyXuXL+oCTRgqVbXfHAex+n29xEmRsYafXV+EuPWQPVGUDNYnQezMLKQTAwoJJ9C3OKLma6XN/jxXDhJYHhRajLl0y3KTynCWBLeWmR39WArT1GKOEk79zGabPdcm19DpjGM/cpfnU9x4cXDN/g7vI0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O31bAxDS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a80eab3945eso524042866b.1;
        Tue, 20 Aug 2024 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724141094; x=1724745894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWFgus7bmtmFt8A1IpRat5xjHQCJCzf5TqRiBZFH+5c=;
        b=O31bAxDSg2V3F+VjVa6T98/wsGh4t66rmr4J6wgco8e/PfwMlJnvbDmPExfqhcuPhc
         SvKQ4h7WDrEICNVCb0FD4cG3lQhAoPSJ3Gjtr+DUtz69Zp7vu4uixG6+zXMaxKFxJIfc
         mWObX4jdlTDGJpPtBXl6bpT5WkRoOQZbLX9Um34rKQMNmRrP2HhWju5bA1cJua3KUhDV
         xKdGz/IopTKXbxWZstUWbYhHO+QirgdnRfITqBqofuMFIy9xVjH+agKzRz2L3u/1VJoP
         Az0IL1cbLbA3HFX3NMr/MxU4mpubfVR478I/MGU4cB0R7ja+/f0Z2GRHTZJp0DKyjnvN
         HY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141094; x=1724745894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWFgus7bmtmFt8A1IpRat5xjHQCJCzf5TqRiBZFH+5c=;
        b=STA0jPsMFB52Ey7g30xiZVigbwGG/QtcjSVB303+Rp98UPIal5QIUVC2oYxZsA8kfi
         uziWzN26cuVZ9efr1pXUvS7lRvwIOD4EpZf21CUvTMgQhGBNMb5Taqas4ejRzE+nlUFH
         0UnMQSIWSg5vSx7HZMW51YFBlRKSgQcoTojlImrm4wzAGUdDbYF1fh4dUR5TVEkjLzJR
         txwcAoLbcYbyGDN2uskyh9Hu/FLjAPxIHu6IgePUKPgbTBQ7iCvlJjhwe6g3SpXQYYAA
         L2skGCZcFzQ2VOda4sDQb6IYCvTACqGndL/gNSNzXTGWpYzlITH0vSqnr4BhD7N3rP0y
         qlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJIxuR3ZbD2J0r/gJJIZ1bKYbA3krCYKioxheSBDgWLRhvDvBkarwc1k6eOx2gNybkeuNQ4y8p@vger.kernel.org, AJvYcCVmeScLfa6JCInfa64J07OebxGy+6pcJQjaC6LpCeJNSeRjRZaK1PzpmU+6vj9gZiTFHMfwnjqluazS8VOM@vger.kernel.org, AJvYcCWKdWmSFYOn7sBFJ9ujC89hEzuq5Ir35RqYmytQVbzxRVJCl6v2JXas8ziCoDeQhwADYjT3KQ63SbAQ0Mn6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ITD4bu0D54GmXS0dilZVsppRogDza15B8e1W+Ep0sWBU7o69
	SzoADZ8ohaoa6CMdlDZX9eIkzRQSdjMrbJ4Q8ITOuEfikl8eMaTqqXl63g==
X-Google-Smtp-Source: AGHT+IEylAwKGfhOSRiPpbSpW/mefft1BLen+BVub0FwVY6eJPQ1OxSK1kbb37LXb0EZJFVLDfx10Q==
X-Received: by 2002:a17:907:d581:b0:a7a:8cb9:7490 with SMTP id a640c23a62f3a-a8392a15b30mr943309266b.47.1724141093178;
        Tue, 20 Aug 2024 01:04:53 -0700 (PDT)
Received: from labdl-itc-sw06.tmt.telital.com (host-217-57-98-66.business.telecomitalia.it. [217.57.98.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383948d19sm728431066b.186.2024.08.20.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:04:52 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Fix the name for the Telit FE990A
Date: Tue, 20 Aug 2024 10:04:39 +0200
Message-ID: <20240820080439.837666-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a mhi_pci_dev_info struct specific for the Telit FE990A modem in
order to use the correct product name.

Cc: stable@vger.kernel.org # 6.1+
Fixes: 0724869ede9c ("bus: mhi: host: pci_generic: add support for Telit FE990 modem")
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 14a11880bcea..fb701c67f763 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -680,6 +680,15 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
 	.mru_default = 32768,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
+	.name = "telit-fe990a",
+	.config = &modem_telit_fn990_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
@@ -697,9 +706,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
-	/* Telit FE990 */
+	/* Telit FE990A */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
-		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
-- 
2.46.0


