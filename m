Return-Path: <linux-arm-msm+bounces-52514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C273AA712C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 09:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7E147A5F36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 08:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19A41A5B9E;
	Wed, 26 Mar 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKnjiw2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317D1A314D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978199; cv=none; b=iI3QlqCqeViZOomOyapKL2G9N/HFb7TsMELDEmBFbh8O4FE9TC8dbWRiURGTuRtABgt7tbg4aqpMtsC1IhAUZIlWehE//czJ5u2Ed0gcLmBzEYW7SGlTWBqWgIqRKeq4ctv+9ktEtNrh5eybKMg1YdrLeXf1Nm/HHgmaHWikTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978199; c=relaxed/simple;
	bh=wE8gm9EgRvG/eMhMjuvwanQvEYBa02D0Xd2GnqsJRZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1693lUqAeN3LX3elLfxvHhkgyuvESG/zfEh8xxffGS81qQTQ+z78Tkl+Wqx/qp4428FpbkzwzGi/8R1jApBW557sHOssE574iEUnUxc0E7oDyTYxY+3Cy0yLSgSu007d5r9MvMZoqeHPojE+8B8p+CnoOCNVRupOWDXRkTfT14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKnjiw2o; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso44617205e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 01:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742978196; x=1743582996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sXhQr7pB1oHUL5QRg4aIUf1ZBqM0s1gNre1HeSuBZY=;
        b=tKnjiw2ob3bcCxOku+5sP6cqjtbUsuglW7ot0NaXlxRRIkCvtxEQBbZ07oyAbdtVy1
         5Nx1oYCVuiUvWV1jtsMKwXGGG4QFiPyQ/HlVpDEeP1OtsmLhU93nUpyCQn6bUG0Mg/BX
         IT2RTNrEwmA0wq04Zs3FKi0J2tP+wjOyW2Gw8ADEzV3IQBlVRbqrA2TNhXq18QYlEj/6
         z/S+AWqSyv3MSQcIu12cw7nyXevNrZoqFxJxTvdzjg+gf2NEhsb0aXyRTbh0Js9F0xnj
         v3QTgtFqvF9XerVPaLNz4wTj32Mg8Md8vJgic1HDQMQQnkKwafCVdl4INd8d9wxC/R7/
         7/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978196; x=1743582996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sXhQr7pB1oHUL5QRg4aIUf1ZBqM0s1gNre1HeSuBZY=;
        b=BVdoQNyLwojzQ/tLfIM3W5SZ65tI7l6IfjpVoj9Hptz73yOQo5l9y96/FsItb9wQFb
         VMCTQbnjtAWs8xuMZXU/JjXvUgKmp6v3KLJV1EcwA41oNY8u6pljcSK9XVQ/OUE9yaGN
         lfYifyTSDLgRIHy8SSah96aohIjzf5kLMQTCd0mdaTdPfh7b6JwdIdG+cLdPwolvVUrJ
         lvxRCdmAT01vEVyCGpNgD+tB7GrNw14c0NdZZnolU4DLqtxwBkEZVTDDh6GNGvVcR2R5
         6iDz1mILU4pYTD/5qKbhJtkFmlTTqSoqI+PCAS8Kk72QkGYfEvvHVioNahC4JTxH5ewK
         y7tg==
X-Forwarded-Encrypted: i=1; AJvYcCUBUTtkWFBZDb30KsAN+2y5psexxuW/KPuleJt2r7O/EiZGb84DRfVQnOgUdT4UQi1XZjdKH+LVsaodT1SC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/55GDQFqDai0dQdrmuuKfJJNHkWVx9fN7DSUujLwTrmVwQuIa
	ZV0WpJQZKTkKLMHyTEAAw92Q0rq2JHvU7EmyOPGxWnPTcRibe+A19GaI87muYDg=
X-Gm-Gg: ASbGncvDSErtLYzRu4YhQv1MJUnHAuuYUgxCstoxTx/gr+TLPYbPa2wK/1VQLDFjF9O
	pwkjzjfcwsXSSQjbBUlshpKf25wnrq65qNB7QrCwvOPaBlZdjGG+4hG1fWj9S5H/Ob67yTjxRhH
	eOvlMesH79URCRS2+du6llpG+YyDDj3EkmnJAJtcKs6ymlbrTReCdkvJPd2bjemv4VWj0WApyQf
	YmL7ZcsMW4wxksjtbh/oQhuKrOGyYqVadWs2b2RGXGsaC4vlJTHLojFu0rCaMnUUuuPAh3KJmWi
	McENNB2fSrJAt6PG1FdYnL/j6nVOLH6J8ZcswiBQ5EIy7NgpOKzAU/eeEHwuTqjfog==
X-Google-Smtp-Source: AGHT+IG1Q4B0jZrBWVEeQlwx58g1s02zlaV9ZCA48T2H2C8bquy4+GUMl9fJnB7E3asz6f++aEx6jw==
X-Received: by 2002:a05:600c:1e18:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d509f64b8mr212933905e9.18.1742978196325;
        Wed, 26 Mar 2025 01:36:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea400sm176823365e9.2.2025.03.26.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:36:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Mar 2025 09:36:33 +0100
Subject: [PATCH RFC v2 2/2] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-topic-ufs-use-threaded-irq-v2-2-7b3e8a5037e6@linaro.org>
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
In-Reply-To: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wE8gm9EgRvG/eMhMjuvwanQvEYBa02D0Xd2GnqsJRZE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn47yRna6KR2O+2/McFt5fyFm0PMrm1cbhH9l1pHzK
 g1qu/BeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ+O8kQAKCRB33NvayMhJ0TzYD/
 0eCpa3SlSIbYqvFInXTVu4P0tKFO3IpuJhif3hUszZLZetR+HXaSpZKfrRCjmQbbIVxUmFxkir2lc0
 B/y1uC1O77OOUw2+2QGhyVgepk+Z1H5hCvNmz+U0N9xhumCSMjD1fiKk2u2Qn5YDzHxmENz5ap+pcK
 D4USQvC7aXT5UJJvMuVgs/LR6a6eLEziEhQmJ2bQeKIJNiWXv/Yt+10WDTtC3JDyqigA8QpvN1eo9R
 3wy+FhxmwGMD9xAZX+wtjzP/qXaiYH+lq/NVU3+VdyAGh+k3ibtrk3N4e1Nsxtu780N8qsIqFefvUM
 zNGPy8+kliMuo8zaAKcyJ3VrSiH1AOYFV7JP7KiKkVLZ/CT02XHBWFgapI0GA7mm0GqQqkJrZbU8NN
 QMvY4GsfK5NROXjz5UlvcLZ2Bkx5SzzmBc1T9A8RCL1Dsd/RKARu9GROm3Dci0ftdG3eKZLtdTb42X
 hiQTrs/zkrCjq6QWAsmZBVzA4M+HKdUke2p2WUqpLQIXdoVsv73qRyZIwkEiV4sxrKKuRNoE+nwR1m
 9RBHJV6za9v2FIEJm24BCSkfnes/Dg5/g0sdKKmrbAHA92DDWqKpnGB0HljD+V2ieMF1mcI3Aew/di
 gYn0CgM29pNf7KK2jkQbcYzIT3YPYuMgsanfBbBGmfT4k0b5kluyjMp2syqw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On systems with a large number request slots and unavailable MCQ,
the current design of the interrupt handler can delay handling of
other subsystems interrupts causing display artifacts, GPU stalls
or system firmware requests timeouts.

Since the interrupt routine can take quite some time, it's
preferable to move it to a threaded handler and leave the
hard interrupt handler save the status and disable the irq
until processing is finished in the thread.

When MCQ & Interrupt Aggregation are supported, the interrupt
are directly handled in the "hard" interrupt routine to
keep IOPs high since queues handling is done in separate
per-queue interrupt routines.

This fixes all encountered issued when running FIO tests
on the Qualcomm SM8650 platform.

Example of errors reported on a loaded system:
 [drm:dpu_encoder_frame_done_timeout:2706] [dpu error]enc32 frame done timeout
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1: hangcheck detected gpu lockup rb 2!
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     completed fence: 74285
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     submitted fence: 74286
 Error sending AMC RPMH requests (-110)

Reported bandwidth is not affected on various tests.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 5e73ac1e00788f3d599f0b3eb6e2806df9b6f6c3..5de25fc978dd7c4c1ac3b9ccbca2ab3f13d6aa65 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6971,7 +6971,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
 }
 
 /**
- * ufshcd_intr - Main interrupt service routine
+ * ufshcd_threaded_intr - Threaded interrupt service routine
  * @irq: irq number
  * @__hba: pointer to adapter instance
  *
@@ -6979,7 +6979,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
  *  IRQ_HANDLED - If interrupt is valid
  *  IRQ_NONE    - If invalid interrupt
  */
-static irqreturn_t ufshcd_intr(int irq, void *__hba)
+static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
 {
 	u32 last_intr_status, intr_status, enabled_intr_status = 0;
 	irqreturn_t retval = IRQ_NONE;
@@ -7018,6 +7018,33 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
 	return retval;
 }
 
+/**
+ * ufshcd_intr - Main interrupt service routine
+ * @irq: irq number
+ * @__hba: pointer to adapter instance
+ *
+ * Return:
+ *  IRQ_HANDLED     - If interrupt is valid
+ *  IRQ_WAKE_THREAD - If handling is moved to threaded handled
+ *  IRQ_NONE        - If invalid interrupt
+ */
+static irqreturn_t ufshcd_intr(int irq, void *__hba)
+{
+	struct ufs_hba *hba = __hba;
+
+	/*
+	 * Move interrupt handling to thread when MCQ is not supported
+	 * or when Interrupt Aggregation is not supported, leading to
+	 * potentially longer interrupt handling.
+	 */
+	if (!is_mcq_supported(hba) || !ufshcd_is_intr_aggr_allowed(hba))
+		return IRQ_WAKE_THREAD;
+
+	/* Directly handle interrupts since MCQ handlers does the hard job */
+	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
+				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
+}
+
 static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
 {
 	int err = 0;
@@ -10576,7 +10603,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
 
 	/* IRQ registration */
-	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
+	err = devm_request_threaded_irq(dev, irq, ufshcd_intr, ufshcd_threaded_intr,
+					IRQF_ONESHOT | IRQF_SHARED, UFSHCD, hba);
 	if (err) {
 		dev_err(hba->dev, "request irq failed\n");
 		goto out_disable;

-- 
2.34.1


