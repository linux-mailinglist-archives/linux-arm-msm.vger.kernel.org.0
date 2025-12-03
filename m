Return-Path: <linux-arm-msm+bounces-84233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F374C9F322
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 245F3348763
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A532FBDE4;
	Wed,  3 Dec 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKAty9kX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F12FB963
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770047; cv=none; b=J/CWdmoDxM96w+l1qVjRP3lUeqdYNcDrIHUyraZnnoo1fwF81YFhEGMaE2+n30L4dhKKN/LB4qNHkfopIA1/WQikhK+3K7ptySKCmBl2zO59o12XyxbRbrfMCN80xlrz73P4pawNBpeBG+kbNOxJoNEwxrdeoN6cYzJogiWVOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770047; c=relaxed/simple;
	bh=DF6G/XFdIfJQ7qeQs0VYU3rAkTrUx9BZ15KmoHCPoLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzNMcIa0yxn3G147TXr04vJwl+F1+RKL9/37c6+74UyXhjy6tJHbG7Q1WOSdBt78nI47m2ibWikARXhDgp6KxYBKQepKn0x0RmuRPSN2lLIKhvdO+eFKgR4Lj4ZxwsNENJScb3WDbZGBwPaXLC+qtN8Rr0LcYUpWGOkQ2RaTWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKAty9kX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477aa218f20so47310925e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770044; x=1765374844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU5E10zMYIkw7ZF/4aNGAYwgRL3UWcgkSyY4TJegpo0=;
        b=jKAty9kXCw7FtGhUxU6i/YkBqAtihXDoZc+bYNU4BDccya2pAg/i6TkoOpSZzOdK3F
         OF1ufFJl8uWYHedeIAwt0s7v/1uYizz5tUutcK7fHpwhNzAzqkBFJg+qs2NU7wQvm3pz
         bn79LnenpiHDnUpnch270XbmBuFzdUa4TAeqJBHXQpr+8t2IzUOCKhniOUkg3HuoThqH
         NEFatmw32+GrbfrkYq5Ew83bFM9obnTIPOqv2CGL4FQY4pqoTmCau63M8ZX0RYvPEeSz
         0N68W7yInOPlJ9iwtTTIIT03zfOYO8p0Bb585d6asxYjuUqjSxzFuONFzdD7MgH9JvFH
         Z8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770044; x=1765374844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kU5E10zMYIkw7ZF/4aNGAYwgRL3UWcgkSyY4TJegpo0=;
        b=uBsZqkEaTA2gJ9HkO3lX6YtMNdS5Nj33y9sWLMJYLv7ZoQOOrENJ3p07J2xr+IIsTx
         NilMaKEZ3aRaIKfda1WzrStLpVV9bdLNCcpK+K8vOqr8oo2L3pNgnOty26UKGExG4NJs
         AE00WxLXqV+ERsl360wqMOmOMhUIqvv18Xw7fooWywoGPPCL/qLBGquJMMm/aDkT3Ha6
         xQPxzUhbGN05SJzpETTYAikzz+g9eyxfBgFd2yqm7mF+dQ2duyIffHfUysNqg9hZjy6M
         8RfKe8t0sny1S5JX6KW6MQGGr/eCZk+M0YRKB0WfcCP2hrtdnZ4Qn8A8RXt3uJUfkFE7
         YCmg==
X-Gm-Message-State: AOJu0YyGEp1i2OppmkUQS4if5Expljq2GySHyPV+jnKWxCaVwervJmzH
	RGGDIvWov8pQP/XwSMHAsRe2MEILsCrvY6Rh0G/EnSdsy/sAsBthMiaU
X-Gm-Gg: ASbGncvl8SJAG3hE5K2yuWk490rOQZjQfoy+86SfndW/E8KLprFy+VJEw3FWl9aPyZ8
	y718orlcT91kJZ/nEvmb8taoqIR6Gdmvq5/CWsBQksusy8S4k2HVvRaOHwDPh8ylJddRXMRw1pQ
	6bhRuHwo5iIjx8qaudBfst8Wq9dLvJhKC5774AXmi3s0ldI5LTN7YI1BRu+B62K9i5DRN3flc6A
	Y5fStwWaZLEUzWRLlyY4QFpFARLlLXx5q+gvS5aZVZ73mPFmzBDEIl9BcVeV2EqpjNksRzMK0pG
	9kNmNGkFAWSLyCmTFrJxsKiSkbV3A3OUVMeyw5AZSnrmpnOeZMNmnqUBCMuIvsLZQu0JOI4NekK
	CJtsroA0QcMsRfNKrDL2XE/zaoKwLATe8ayOM5GD83tmZeYXGB+NuzkuH4JejlxU7m245HZLLe7
	51MHnZb99DFp867d2XtqGMOOLlo6HL2IpMD9S/tNwtuP4xlQb4/w0B3ga7AV4oaueELX7YkU4as
	m86y/CQ2coiCHOfdhbjw/wgALEN2mK3WtitYdNuQw==
X-Google-Smtp-Source: AGHT+IFXgqjYg+s9C0ZBpSRfYz1JGeFjdbj2Fq/FubajeWelCOReDZbc8uwYFRx72hU/FuPHbhayig==
X-Received: by 2002:a05:600c:524d:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-4792af30ea0mr22550265e9.17.1764770043606;
        Wed, 03 Dec 2025 05:54:03 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm40433575f8f.34.2025.12.03.05.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:54:03 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Daniele Palmas <dnlplm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 6.12 2/2] bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
Date: Wed,  3 Dec 2025 14:53:53 +0100
Message-ID: <5091bf715f9ecf449b270af23352be15e4560df7.1764769310.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764769310.git.fabio.porcedda@gmail.com>
References: <cover.1764769310.git.fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniele Palmas <dnlplm@gmail.com>

commit 00559ba3ae740e7544b48fb509b2b97f56615892 upstream.

Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:201a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
[mani: added sdx72 in the comment to identify the chipset]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/20250716091836.999364-1-dnlplm@gmail.com
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b8520ca40e8c..abf070760d68 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -734,6 +734,16 @@ static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
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
@@ -779,6 +789,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
+	/* Telit FN990B40 (sdx72) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
-- 
2.52.0


