Return-Path: <linux-arm-msm+bounces-77364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD9BDE075
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551DF192539F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE78B2010EE;
	Wed, 15 Oct 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fp4K/hmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032132494ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524540; cv=none; b=NNCmCk9bi1xqIlXEeLUA/iUyCaaVLLU2npIsKsCBse0ZUVK6G/CFeVaJqGTyY5NOURxb+mCiHMFdkq/lJ/d+x6HqPrKHFL2HNttJrQ/7JiJ35KCb0QxgOXSSoh+EPPY//yxgbPXe0vJilyx1KJZ+LN3zwWp2UwcUzYp6WJwYO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524540; c=relaxed/simple;
	bh=wrYtQbKMdePmpurgrmRwrJx3mIKCnYPozkCXHxbd1is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m8Iys1NBG0dhTCnIkNWhNZ3snysVsFqsTr/zZU5BD+e8kJzOQQj28vZYBGgqDnjqtExmbrHufdgem20vEeyW27aCnr9qJ6VGob2XBNU4jJbI2kTUfgYT6V7tT5om3uFPm7cnzIgRNE7zUCZQYSjRlz52VzTDFdjWYi9cZCjZ/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fp4K/hmm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so2514745e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760524536; x=1761129336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu1nsBP84jDmwrrdXdGOmf9QTsYF1hFDTo/FbFzpjBE=;
        b=fp4K/hmmWl1k8QCqcernq+Ki8fc8ZFDcZxKJAEMB+W6Wad0lUQtZm2BwWTrojYBqu+
         7b4zpN1G6JsbNJwaed7iN3//8Tolvzb0699lpdIRbQLvzRBCw6Rn+YR4hOGqXUngmNX8
         7gCXRm5ZwDgqwfRcoJSMRZSEjhv0Xsq9R2uLzuJTGBHfWiRLNDH9qbM3EeiMtQ2gT41V
         qoRp3oXiay+yw+EqCmHN1d3dGWB3g5fRY1lZcHHBPxIm8efXExkt/LP+nHB4NpfQe/vk
         7DY8HXn6YA039qR6gzBVp41dep3QySRhWJbMp6W5tSDC/AVkHRMDysVJ501jFqJi3q/c
         Srvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524536; x=1761129336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gu1nsBP84jDmwrrdXdGOmf9QTsYF1hFDTo/FbFzpjBE=;
        b=MKDoo52kMlUxwno4KgcDbvv+khE7+uYnBfSfDwjh943ke0Oqm8Yk7fyaUHSIQGkRo+
         JqLrxrte+4+8OUJVSzgDhJIIstwLEBu1sSp3Bz0MqTQRZxhDtkt8Dxou74PcUwRfdx3t
         EPrQOJjsLSLAZipLcECdKsTUbUF/B8bYjH2/2LxKtIkVmQwhpKxP5iglNENdlhTA0Hl4
         ghdcLYQt0/kuLq1gu5BFtmWIjKfXOivFOEl/pRTZXPBvdfYWvslMyfDvLWYbcLwjfPTT
         PS1x6Fgyu1Ttsts0UXSHDCpsmQtiOgEyMcNX87PvQ9giqkvHa4/LxG4lSr0kp80502R5
         j4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXSiWFxNs8OufevTwmvBQq0rUQpGCm5QM3+7T3TW4wtZORQIUrSTn9HSAxxUVARtFbBIZg88KQ8hYdakiPn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuv/qOCI/45i93wFqNqbAijMJiSPodbHjE2qqIGtmCeDJk+XY4
	xTSZvD1qJ6zTezqfIkjhPZKNubt9NaEtt20ow2ZYI1XrDiR6dun9yzcY
X-Gm-Gg: ASbGncslICQDJSa8lOpwruS09WcMPi/8ZmjfzzdKrGMjy4WXeNVtjv4dDlD4ztXoD08
	BUmwnocAXL+T46fnnYE4qH/3VOiQMTFUvZpyhV4kNFO457maqTmljKpqr8XJUVLU3IE7CuVJ/YE
	hEKM0ZtNEtj25Dlm5Mos10KKpCKFqhyVkOHIRvWnTo9S6vYAm/0vUKFWf4Rb5jPMv96Dawe3n9H
	233528cVheGkmXUiXvoEDT7iCVyMtvbiEs3us8vGbBpxw5JZLuZkn3/UgmbT+cKJX0fOn9yoDPC
	LF9tkbmqD2Nl8JdTkV0e8fEUWXAoz1qrMdb5/IJkZSE6mQxo1NyiVPXR4wQe/osmvg+WsqJPjmn
	eEuzAQUzJ/cUsJjAxNuwkoT6M99XG2spYGUmDzN2O2/gimo35yazt+v82+8yMFVI+tYZQ/OqGzr
	lh9YKPSDB9kUmN9GAD3v89JKp0o5Q=
X-Google-Smtp-Source: AGHT+IGXXSxOEnx0micwjWYM8733husUPk8MH/ndkS4hv+5XE6L0m44UB2hxHV1pzm56wpUwxdpWpA==
X-Received: by 2002:a05:600c:6215:b0:471:846:80ac with SMTP id 5b1f17b1804b1-47108468140mr698725e9.18.1760524536016;
        Wed, 15 Oct 2025 03:35:36 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm28580093f8f.44.2025.10.15.03.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:35:35 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE990B40 modem support
Date: Wed, 15 Oct 2025 12:20:59 +0200
Message-Id: <20251015102059.1781001-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX72 based modem Telit FE990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:2025

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b188bbf7de04..3d8c9729fcfc 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -877,6 +877,16 @@ static const struct mhi_pci_dev_info mhi_telit_fn990b40_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe990b40_info = {
+	.name = "telit-fe990b40",
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
@@ -933,6 +943,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN990B40 (sdx72) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
+	/* Telit FE990B40 (sdx72) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	/* QDU100, x100-DU */

base-commit: 54c67740fff7360b6607d02b8499d09b944b3fda
-- 
2.37.1


