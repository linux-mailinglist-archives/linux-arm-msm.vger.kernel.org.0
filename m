Return-Path: <linux-arm-msm+bounces-102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E47E43A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 16:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1EA51C20B24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 15:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2C8315A0;
	Tue,  7 Nov 2023 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bobyiEHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95812C872
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 15:41:16 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D1E9E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 07:41:15 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7788ebea620so371737685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699371675; x=1699976475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObVN4OHcPVQWsUpE/966fOo3IFl5zYaTQP4Ff/lWTe4=;
        b=bobyiEHOE/h+zyutQu+5a0gnvPgFSPrrT4+U1u8DurMIYe4ptBGJeD+tik60wnZi14
         72omqUgdyTtzYvpf356qjrkRaVws/loTRdm5KlRyVpTBW0zhKE5JbLFKRZkFfrOdKDFU
         W0pVty06+n2qHyLea6AMNi7REzYHFBeIxO+mDMaV9Wph0PJB//g1q0VcLoshD6I3LKzm
         UJCEjASGjIMYX4c53LIdEGBwkdutXq6GtDzYcXQuQf1AHeuB9swVe8xmvYLeHw+XN97j
         E11QS5WUQCHpoCiOI1HdaofNcbwYI3R4xJfEHc4xCizsje8/mdPL1VIg7PUNnrR/gYOd
         /pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699371675; x=1699976475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObVN4OHcPVQWsUpE/966fOo3IFl5zYaTQP4Ff/lWTe4=;
        b=lIv7VGxPVV26sxKGXdyyUmrHu9M+1JwnkAdYp/ltTC9lDuWspuSCAVKlKBv/VSFTNF
         clKvjUBrpJMzu2/8xVeVDeUx9Pa8TphcOWzygEv3SG1s72ZUJSLoMYQv29JOjdMjRLd3
         Rn74sn/o1rxURVNYw6KQYV1ZCZJVxMHklklpeFpWBaEN7TPIGrufg8F01ZcheVamc4nY
         s10ExzRPMAQ7fJpATc/xfv2nQJTjoqs+GCpWNEF58ZtxS+EHS2gtFG7UoJpt26imq7TU
         IvBt7Dl1gg3HmNAPyFKkHDvdSKb9ta1l45yidIklFXNy429m8P1ZbGXpErPfo9CQKAEX
         rObQ==
X-Gm-Message-State: AOJu0Ywj9ftVu/P/ByuO5nWJOjIG52CbUDZLFOIk9+DyVuceuh6pcmu4
	b9rZ0AL9cXDT8zy8FrrMdF3k
X-Google-Smtp-Source: AGHT+IHHqmworfLQWEekvi8UO9gWd02E+Uc289e8Y39lqPlgbomqRT6SyOFmuPC/YBTPy52YJ0fB4w==
X-Received: by 2002:ad4:5ca2:0:b0:66d:3723:294b with SMTP id q2-20020ad45ca2000000b0066d3723294bmr34665070qvh.64.1699371674936;
        Tue, 07 Nov 2023 07:41:14 -0800 (PST)
Received: from localhost.localdomain ([117.217.186.253])
        by smtp.gmail.com with ESMTPSA id u3-20020a0cb403000000b0064f43efc844sm4565789qve.32.2023.11.07.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:41:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: host: pci_generic: Add local VID definitions for Telit and Sierra
Date: Tue,  7 Nov 2023 21:11:00 +0530
Message-Id: <20231107154100.154492-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the definitions locally for now since it was agreed earlier that we
keep it this way until the definitions show up in other drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08f3f039dbdd..58ce1ecddd19 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -25,6 +25,8 @@
 
 /* PCI VID definitions */
 #define PCI_VENDOR_ID_THALES	0x1269
+#define PCI_VENDOR_ID_SIERRA	0x18d7
+#define PCI_VENDOR_ID_TELIT	0x1c5d
 #define PCI_VENDOR_ID_QUECTEL	0x1eac
 
 /**
@@ -585,18 +587,18 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_SIERRA, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	/* Telit FN980 hardware revision v1 */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_TELIT, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	/* Telit FN990 */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_TELIT, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	/* Telit FE990 */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_TELIT, 0x2015),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
-- 
2.25.1


