Return-Path: <linux-arm-msm+bounces-84232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D524BC9F31C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066F43A51A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42486DF6C;
	Wed,  3 Dec 2025 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sj5ilBPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE542F83C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770044; cv=none; b=CqkzjEgayk6KPew1ErvMwXcFPF9YRROhMh35rjEoptVcSi5AKP9lgCr+sAAFyEMa0nlI9bupl2UDe02vlWhwqxsRXu0hMDZbXbJ9ZHu0DzWVsgh9e2jUi61ESVgqzgB7GRwENHhoN5+c7FvE3PbhN2ReuA5pvn7XDW6CCs112X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770044; c=relaxed/simple;
	bh=zH2PKrfPlxwtdF3X9LqBt5Z/eXC9XeGkjygYrrB/tYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuh+wrgd1rmB6N+0QhZYSd76RyfHCZ3uo5ddtkuBNJiNSNDx0VyP2RKMHZhVoJa3pMt52BZx6PHQWtkVuwrVKE1CsYh2zI8ZzhB3xIzkobBujSiuvd7vn5MUrp6z14artTKcStGM7KaqQ4n5w4r6P1rC5adR55HTpDEahzHqv4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sj5ilBPc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477aa218f20so47310545e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770041; x=1765374841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gmAM79L0urJOkGk5BdJYyX+Tz0Pp5q3Q6ArqpzSYNE=;
        b=Sj5ilBPc/4ajbmOHXTuHDU9GM3aKusutiJyJfgBkZZubc0jPFVh/h9UPrrN45GFYTB
         Pahsz63L/RDNochMcxonPj8ZwE67DlFZgFoCp49I5ag5KClxRu9ihT/ksKx0+JfuFezd
         AcbVFCfkete0kTQLmawb+EeKOsraxVpSct7jnE7Fmsd8xyOe9xoVgM6m6Oc1TZ3wGamd
         IrfnSqQFGKMLJSb770G5BfG3k2/ekpqDOoDoBLNQ1dnkKZdgFVLfo67AbtDsVNKDnHX8
         4lMMMb2ypUvStaAoVJ5VtPcRMtfpBRBz//xObjAmpLQ8MtUeXiGbYGBu1zQ9Owr/70CE
         Op2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770041; x=1765374841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gmAM79L0urJOkGk5BdJYyX+Tz0Pp5q3Q6ArqpzSYNE=;
        b=VJ3m+B4aVNenRj8Dw+iqpTFXrV7wXi2L5TI7H0VCiNWh7RPpnka00Ipv5Wntj+ui/k
         DanOSZyDYIdKtr5e/od+68B9lxWl2fswefA7JFpKZmAC4B/76GjNEIzXVXW4QsTotLNI
         tVoWgf91IpZxS6bTp7pnzXhZrLnbUwQOUQLbmI+UffJA89henY3xfVrsluwY4p9NH88l
         P/KMPDbcSZ2j2ryB2HNmlrvIA00imKjrCJ70quq5Mo+WvGgqaGxsosrWtrL6fcNcixWw
         6tm+erFnhN3HRrjYMRJRT7EXwSwk9TLzhcRnkloCrBYhpxebpTQH0WT9OWGRONKuvs8T
         mDIg==
X-Gm-Message-State: AOJu0YyILz7cyuSpAa0zdg4my4jvukVwEOEiE0Y2v7bdL+qoKOKVfvtI
	H+DfYgXr8rQlxC6z1f3vwftziHlSYPmNRmMYgDTjV0qf72jv1V3NzRXt
X-Gm-Gg: ASbGncugy60AlxKowANs3kYaP9tL+UdvpjUGpE1UBhFqNm3OHaVNy1QIkbnWBIxM6kN
	7IIC0DbS7ZHMMI2OhPCEUCzN2DG0/JuAsgHb+LP/IFxqI7NLpHzk2T5RL3T1L9luO8zpNwKtPwI
	GDFh/C94EtDRqQPjrrsvzVnKlUev3s1VHbUzepjzaIyoEFihaLi09tVlFuD7WLjd/jkkbxZJiER
	HdWYjnSNqGFLkoX5FMO4y1rRSLa1KNR7ZDkC5AnJV6OLgYSPBAyD6/7E1YFKLLjzXGeg/isijdI
	REN4r9IpV687uwewbrp5z8SulZTnMEoz2vfuVhm2PEBSTXY3Nq0oQV9XJWt1dCeZdA4HICH6Sbg
	L2Z4eC8wJq3axGv6bQb9l/vLnea0v4zml+Uv7buR8MFkVEO73oQsyAKCG6Y7Z2HRi8htWzWk9MW
	qci/z0Jw8Q8WjISm9fJLXzxsjiggfv+0rQemXVRBlEKxhVOmA4byX6aEVK6YHZGQrurH460mhlF
	OtjhwqoE5L5K84wdpI5o2+SmAeksPc=
X-Google-Smtp-Source: AGHT+IFNsQjyU64y9iSDrc/RmB+GP+KFMTNCOG7l14/Rm9rfloIWa0YLlJjHBN7TJSs2QojrjfBpqg==
X-Received: by 2002:a05:600c:8b16:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-4792af31394mr23140715e9.21.1764770040594;
        Wed, 03 Dec 2025 05:54:00 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm40433575f8f.34.2025.12.03.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:54:00 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Daniele Palmas <dnlplm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 6.12 1/2] bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
Date: Wed,  3 Dec 2025 14:53:52 +0100
Message-ID: <d2b91b3097c693f784393a28801a3885778615df.1764769310.git.fabio.porcedda@gmail.com>
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

commit 6348f62ef7ecc5855b710a7d4ea682425c38bb80 upstream.

Add SDX35 based modem Telit FN920C04.

$ lspci -vv
01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2020

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://patch.msgid.link/20250401093458.2953872-1-dnlplm@gmail.com
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 6505ce6ab1a2..b8520ca40e8c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -698,6 +698,42 @@ static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
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
@@ -720,6 +756,9 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* Telit FN920C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
-- 
2.52.0


