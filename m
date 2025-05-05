Return-Path: <linux-arm-msm+bounces-56806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D9AA95C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 16:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7223917A693
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8752725E452;
	Mon,  5 May 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUbfuJVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30A2512E1
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455103; cv=none; b=bxPIJM9qti+dkPwvWJUviZ6JZambM2kK3tJA65jBInZ8zcTLSQtULnwE9lCrEhNMN1RtmyAYrEHCqUD/uMxRFhXFz0vbDeGtZOOu3st1tWqxVKCwuQSIpEp46QmXcCqsfZxzWQPrf3zXF28fCdKrQFEI2CyQflQlUmtvHTZqWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455103; c=relaxed/simple;
	bh=MQI7x+2bzxEiz2my2LBn5UBgh4WmR81LcSuFOrKT62A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KahrRbmGmb5yS2S+3U5LIXWtQJoXRk3VS0zkZd+OD4wpHee/ZNiNP1QhUKQnVf6PeLhkOUNWLaHPL0ykrKxjlxZvAmVR7CdkFdtEIGmKGur4CSy/wcL3jxMtnlb8ovBJf9LomieGBlZXoDclBMk7B9PNlrJkV9x2AXLHI2f4EzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUbfuJVc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f4c06e9fso40067295ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455100; x=1747059900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Low4erwL3oa0dp3wrF/kyPMepthvimkBrp2z0FVOA6E=;
        b=PUbfuJVcmUNhX0P9G21aRU5nyiacV8GMIEULpNhK9v+0EsULgp+oxXf+J3usE+0nKT
         RM0rSxdvpNw7RIPryYIYBBeFkgEZzINROwhoQu/cP8CUYvxPXNdBmEro3efndIIgOEfY
         d5L/N3W7KyRSzI/zsRdjRy2IkZbwbYWT58SAklBb5cI+Wjy3gxlC73sWNPHkVOtKkhiN
         2ftsgVBihD6aqHkCueTANRgliIsS8zlXIiOpv/8QQzAuXBQ1wrCeIdNAWmvy+O8NQgIG
         1F4txNCpWDuMyXr5k153hHCznYVTVvX5Bq0pag1QIJDQmvPBUwGIdUih3txxR1alfw13
         OSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455100; x=1747059900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Low4erwL3oa0dp3wrF/kyPMepthvimkBrp2z0FVOA6E=;
        b=Cv02HV3JhoCrycvLk6XL0WfJht7mfp0k9M6ipJuACqBM3OBrT6r/PIzs58KS+AGZDX
         nBH6VIIHYhbV1iVgcskmzwY/Xw8X3E94+8TQqxoMNOYqF9XSTweYKWpRPj0GLaByPR6s
         U2RnX/ddGQ7lxNQs8sIFpbT2fjoHByN2YHp6qeaYUsOn68sClrxs1zyNyJ5kbk7junmV
         546IWfgMHFVtvAPOIqV2wc1lNaUQCj4k6qqzhXXZVwasBhKWAxTF9oXY8x4LzgdnbG1a
         t+VEVkUS44tU9vYSo0v8JKXS+xASv8o/gOwbjeFJ9xLd6AAwcvciINRUWpu/OJr9dRyD
         U8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhQsBKdnSoTLNX0agdcoOLgRpLRv0OL78+U65dDkIRorHGTn4FT9IMqOdof8hh02YM85oBRh0IQZqLaKz3@vger.kernel.org
X-Gm-Message-State: AOJu0YyDqdLZk1eJFXF14moDYNXeMBlcjtM+3x50fatC0LDn/k3g32Zc
	VoUKn+bz0RqrgMutescYcpK6yx5JpfE1D5kY6a3L3Jcn9n8ps4bdCxI3l1dsCg==
X-Gm-Gg: ASbGncvl3HX9mBDB7Fn1Prrzy5WpbB0o3tPpbTiGhffSIIKJ8bCRCrltcoj5HGajhLM
	4Z2Asr5IbNugBprcONewSFVr6XX+R7tTLSKM+qJPrD0z8AWVC/3xr2Bj/SfHkl9d6nU9400fFtP
	ZLSgiDSwG0wTA5zcRkP6gYDY7ZyZqwULEJma+z8nPq7Dn2a5RWet+JrqMyBER0lgrvxgdSOfXg8
	nSMEiq2RTynqlvVL/qVLYmxJh5uPRpLYw5k0LWjQOpJAnKyYVMpb/nOsJAI9AuFfLNjm+FVbVbT
	L9VxN1vl2ttEkY7fOe/RFHPpQNjLaYooWCA5zeq7oKizyGKrFv4Hung=
X-Google-Smtp-Source: AGHT+IFw2yEsc638t4zZyaoR0WMQfmLTA17k0XxZa1HgN/3Ss35g8oxCxQF7rbItfRiCgwpuMm0QqQ==
X-Received: by 2002:a17:902:f745:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-22e1001e466mr197856615ad.2.1746455099809;
        Mon, 05 May 2025 07:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522ef9bsm55387685ad.217.2025.05.05.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:24:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 05 May 2025 19:54:41 +0530
Subject: [PATCH v4 3/4] PCI: dwc: Add debugfs support for PTM context
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-pcie-ptm-v4-3-02d26d51400b@linaro.org>
References: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
In-Reply-To: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11810;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=MQI7x+2bzxEiz2my2LBn5UBgh4WmR81LcSuFOrKT62A=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoGMou5nvzQNKCElUmJ2FQqKlAYoqZMRw6lpczQ
 ZbVhR0FynaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBjKLgAKCRBVnxHm/pHO
 9aPVB/9QPwL+bmSP0b2QczpsPLOWIUTM7EsFveId6D40nBjMEsjVZryZVK9d13BhRbT2IDlsBcH
 7dglX2GKMLuVMJgJ+PcQS1Z76fjiYcAGQgF6s3AaUiEkyQgepSWT/EAAxxSg9ftP/hpeACwoSpU
 B83LnVkvgm/ZFa5jbtwWuxI2ziMFV+JnjlPMjbxPNKKeNNu0hpIgwA5QVl5n1M3cBRVof4lf0sH
 7wQAfYAE3sIiUt7+PRpTxGCYRjkfhUzjs+/m0zrmlLObxk/G/d8S5qmA0qUi33zE1W01KG0t83h
 Z/anAuFyQN250M7O5QnPxrBhUBsoXrL3N5Y51iO2V51k4zPO
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Synopsys Designware PCIe IPs support PTM capability as defined in the PCIe
spec r6.0, sec 6.21. The PTM context information is exposed through Vendor
Specific Extended Capability (VSEC) registers on supported controller
implementation.

Hence, add support for exposing these context information to userspace
through the debugfs interface for the DWC controllers (both RC and EP).
Currently, only Qcom controllers are supported. For adding support for
other DWC vendor controllers, dwc_pcie_ptm_vsec_ids[] needs to be extended.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../pci/controller/dwc/pcie-designware-debugfs.c   | 248 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.c       |  14 ++
 drivers/pci/controller/dwc/pcie-designware.h       |  18 ++
 3 files changed, 280 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index 896c387450ca45d979f6baa04e6b3ae3e4be167e..c67601096c4827b144d624dbaf18091eea2a0d5b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -642,11 +642,257 @@ static void dwc_pcie_ltssm_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
 			    &dwc_pcie_ltssm_status_ops);
 }
 
+static int dw_pcie_ptm_check_capability(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	pci->ptm_vsec_offset = dw_pcie_find_ptm_capability(pci);
+
+	return pci->ptm_vsec_offset;
+}
+
+static int dw_pcie_ptm_context_update_write(void *drvdata, u8 mode)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 val;
+
+	if (mode == PCIE_PTM_CONTEXT_UPDATE_AUTO) {
+		val = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL);
+		val |= PTM_REQ_AUTO_UPDATE_ENABLED;
+		dw_pcie_writel_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL, val);
+	} else if (mode == PCIE_PTM_CONTEXT_UPDATE_MANUAL) {
+		val = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL);
+		val &= ~PTM_REQ_AUTO_UPDATE_ENABLED;
+		val |= PTM_REQ_START_UPDATE;
+		dw_pcie_writel_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL, val);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dw_pcie_ptm_context_update_read(void *drvdata, u8 *mode)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 val;
+
+	val = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL);
+	if (FIELD_GET(PTM_REQ_AUTO_UPDATE_ENABLED, val))
+		*mode = PCIE_PTM_CONTEXT_UPDATE_AUTO;
+	else
+		/*
+		 * PTM_REQ_START_UPDATE is a self clearing register bit. So if
+		 * PTM_REQ_AUTO_UPDATE_ENABLED is not set, then it implies that
+		 * manual update is used.
+		 */
+		*mode = PCIE_PTM_CONTEXT_UPDATE_MANUAL;
+
+	return 0;
+}
+
+static int dw_pcie_ptm_context_valid_write(void *drvdata, bool valid)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 val;
+
+	if (valid) {
+		val = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL);
+		val |= PTM_RES_CCONTEXT_VALID;
+		dw_pcie_writel_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL, val);
+	} else {
+		val = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL);
+		val &= ~PTM_RES_CCONTEXT_VALID;
+		dw_pcie_writel_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL, val);
+	}
+
+	return 0;
+}
+
+static int dw_pcie_ptm_context_valid_read(void *drvdata, bool *valid)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 val;
+
+	val = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_RES_REQ_CTRL);
+	*valid = !!FIELD_GET(PTM_RES_CCONTEXT_VALID, val);
+
+	return 0;
+}
+
+static int dw_pcie_ptm_local_clock_read(void *drvdata, u64 *clock)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 msb, lsb;
+
+	do {
+		msb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_LOCAL_MSB);
+		lsb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_LOCAL_LSB);
+	} while (msb != dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_LOCAL_MSB));
+
+	*clock = ((u64) msb) << 32 | lsb;
+
+	return 0;
+}
+
+static int dw_pcie_ptm_master_clock_read(void *drvdata, u64 *clock)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 msb, lsb;
+
+	do {
+		msb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_MASTER_MSB);
+		lsb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_MASTER_LSB);
+	} while (msb != dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_MASTER_MSB));
+
+	*clock = ((u64) msb) << 32 | lsb;
+
+	return 0;
+}
+
+static int dw_pcie_ptm_t1_read(void *drvdata, u64 *clock)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 msb, lsb;
+
+	do {
+		msb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T1_T2_MSB);
+		lsb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T1_T2_LSB);
+	} while (msb != dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T1_T2_MSB));
+
+	*clock = ((u64) msb) << 32 | lsb;
+
+	return 0;
+}
+
+static int dw_pcie_ptm_t2_read(void *drvdata, u64 *clock)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 msb, lsb;
+
+	do {
+		msb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T1_T2_MSB);
+		lsb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T1_T2_LSB);
+	} while (msb != dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T1_T2_MSB));
+
+	*clock = ((u64) msb) << 32 | lsb;
+
+	return 0;
+}
+
+static int dw_pcie_ptm_t3_read(void *drvdata, u64 *clock)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 msb, lsb;
+
+	do {
+		msb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T3_T4_MSB);
+		lsb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T3_T4_LSB);
+	} while (msb != dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T3_T4_MSB));
+
+	*clock = ((u64) msb) << 32 | lsb;
+
+	return 0;
+}
+
+static int dw_pcie_ptm_t4_read(void *drvdata, u64 *clock)
+{
+	struct dw_pcie *pci = drvdata;
+	u32 msb, lsb;
+
+	do {
+		msb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T3_T4_MSB);
+		lsb = dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T3_T4_LSB);
+	} while (msb != dw_pcie_readl_dbi(pci, pci->ptm_vsec_offset + PTM_T3_T4_MSB));
+
+	*clock = ((u64) msb) << 32 | lsb;
+
+	return 0;
+}
+
+static bool dw_pcie_ptm_context_update_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_EP_TYPE) ? true : false;
+}
+
+static bool dw_pcie_ptm_context_valid_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_RC_TYPE) ? true : false;
+}
+
+static bool dw_pcie_ptm_local_clock_visible(void *drvdata)
+{
+	/* PTM local clock is always visible */
+	return true;
+}
+
+static bool dw_pcie_ptm_master_clock_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_EP_TYPE) ? true : false;
+}
+
+static bool dw_pcie_ptm_t1_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_EP_TYPE) ? true : false;
+}
+
+static bool dw_pcie_ptm_t2_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_RC_TYPE) ? true : false;
+}
+
+static bool dw_pcie_ptm_t3_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_RC_TYPE) ? true : false;
+}
+
+static bool dw_pcie_ptm_t4_visible(void *drvdata)
+{
+	struct dw_pcie *pci = drvdata;
+
+	return (pci->mode == DW_PCIE_EP_TYPE) ? true : false;
+}
+
+const struct pcie_ptm_ops dw_pcie_ptm_ops = {
+	.check_capability = dw_pcie_ptm_check_capability,
+	.context_update_write = dw_pcie_ptm_context_update_write,
+	.context_update_read = dw_pcie_ptm_context_update_read,
+	.context_valid_write = dw_pcie_ptm_context_valid_write,
+	.context_valid_read = dw_pcie_ptm_context_valid_read,
+	.local_clock_read = dw_pcie_ptm_local_clock_read,
+	.master_clock_read = dw_pcie_ptm_master_clock_read,
+	.t1_read = dw_pcie_ptm_t1_read,
+	.t2_read = dw_pcie_ptm_t2_read,
+	.t3_read = dw_pcie_ptm_t3_read,
+	.t4_read = dw_pcie_ptm_t4_read,
+	.context_update_visible = dw_pcie_ptm_context_update_visible,
+	.context_valid_visible = dw_pcie_ptm_context_valid_visible,
+	.local_clock_visible = dw_pcie_ptm_local_clock_visible,
+	.master_clock_visible = dw_pcie_ptm_master_clock_visible,
+	.t1_visible = dw_pcie_ptm_t1_visible,
+	.t2_visible = dw_pcie_ptm_t2_visible,
+	.t3_visible = dw_pcie_ptm_t3_visible,
+	.t4_visible = dw_pcie_ptm_t4_visible,
+};
+
 void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
 {
 	if (!pci->debugfs)
 		return;
 
+	pcie_ptm_destroy_debugfs(pci->ptm_debugfs);
 	dwc_pcie_rasdes_debugfs_deinit(pci);
 	debugfs_remove_recursive(pci->debugfs->debug_dir);
 }
@@ -676,4 +922,6 @@ void dwc_pcie_debugfs_init(struct dw_pcie *pci, enum dw_pcie_device_mode mode)
 	dwc_pcie_ltssm_debugfs_init(pci, dir);
 
 	pci->mode = mode;
+	pci->ptm_debugfs = pcie_ptm_create_debugfs(pci->dev, pci,
+						   &dw_pcie_ptm_ops);
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 97d76d3dc066efeff093de28dcac64411dad51aa..4a9b1ebda67993104233c48eea217d36da42f353 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -54,6 +54,14 @@ static const char * const dw_pcie_core_rsts[DW_PCIE_NUM_CORE_RSTS] = {
 	[DW_PCIE_PWR_RST] = "pwr",
 };
 
+static const struct dwc_pcie_vsec_id dwc_pcie_ptm_vsec_ids[] = {
+	{ .vendor_id = PCI_VENDOR_ID_QCOM, /* EP */
+	  .vsec_id = 0x03, .vsec_rev = 0x1 },
+	{ .vendor_id = PCI_VENDOR_ID_QCOM, /* RC */
+	  .vsec_id = 0x04, .vsec_rev = 0x1 },
+	{ }
+};
+
 static int dw_pcie_get_clocks(struct dw_pcie *pci)
 {
 	int i, ret;
@@ -330,6 +338,12 @@ u16 dw_pcie_find_rasdes_capability(struct dw_pcie *pci)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_find_rasdes_capability);
 
+u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci)
+{
+	return dw_pcie_find_vsec_capability(pci, dwc_pcie_ptm_vsec_ids);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_find_ptm_capability);
+
 int dw_pcie_read(void __iomem *addr, int size, u32 *val)
 {
 	if (!IS_ALIGNED((uintptr_t)addr, size)) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 7f58c94b5b1e9a590692474d5efa80c5b5ed9b8d..4d41274a69379f2c563e509df6a8c169c17f9f3c 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -260,6 +260,21 @@
 
 #define PCIE_RAS_DES_EVENT_COUNTER_DATA		0xc
 
+/* PTM register definitions */
+#define PTM_RES_REQ_CTRL		0x8
+#define PTM_RES_CCONTEXT_VALID		BIT(0)
+#define PTM_REQ_AUTO_UPDATE_ENABLED	BIT(0)
+#define PTM_REQ_START_UPDATE		BIT(1)
+
+#define PTM_LOCAL_LSB			0x10
+#define PTM_LOCAL_MSB			0x14
+#define PTM_T1_T2_LSB			0x18
+#define PTM_T1_T2_MSB			0x1c
+#define PTM_T3_T4_LSB			0x28
+#define PTM_T3_T4_MSB			0x2c
+#define PTM_MASTER_LSB			0x38
+#define PTM_MASTER_MSB			0x3c
+
 /*
  * The default address offset between dbi_base and atu_base. Root controller
  * drivers are not required to initialize atu_base if the offset matches this
@@ -504,6 +519,8 @@ struct dw_pcie {
 	bool			suspended;
 	struct debugfs_info	*debugfs;
 	enum			dw_pcie_device_mode mode;
+	u16			ptm_vsec_offset;
+	struct pci_ptm_debugfs	*ptm_debugfs;
 
 	/*
 	 * If iATU input addresses are offset from CPU physical addresses,
@@ -531,6 +548,7 @@ void dw_pcie_version_detect(struct dw_pcie *pci);
 u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
 u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap);
 u16 dw_pcie_find_rasdes_capability(struct dw_pcie *pci);
+u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci);
 
 int dw_pcie_read(void __iomem *addr, int size, u32 *val);
 int dw_pcie_write(void __iomem *addr, int size, u32 val);

-- 
2.43.0


