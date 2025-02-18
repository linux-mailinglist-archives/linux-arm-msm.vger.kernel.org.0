Return-Path: <linux-arm-msm+bounces-48396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B72A3A1EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB7043A456F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2262326E168;
	Tue, 18 Feb 2025 15:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdAWlPlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15EF26E155
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894380; cv=none; b=DE9T82wWxeP7B3I6aftDa8ru+LzXvfULvr5oy4f+v8G+upAhAj8FCiz9gSuqiC6/KkUApkX9H2ycnMZxt4SzmANIoM1gEZc7jM5z6qTYk5ncptiKVJrgt4aV/JE7PM0/wjIloiPpkyaX82q0HIkp1u1E85e99eUeXUjGwD4Xk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894380; c=relaxed/simple;
	bh=abZZ89F53lA1OV0ELTX+9LFdB3L3bVnVCnIAbwmMOCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dUUZ0nRywl7WayJm9Kx5nJj+HKwgAo6LtjpZgcwCH3mP4s3w60KbqPQlHipM2M7yljm9sv0OiG6AZ6v7Y0bg0frsNJaui7242YNm7avGw5ZOXYukAvooYRM3zeJabm6KKt9szorxl0ZijXYG/nhPQl0C+gyxQylMgs8X2Xhti70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdAWlPlO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so38366915e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 07:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739894376; x=1740499176; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLiPp+tksGtaJoVcenFPvqvMvCo7VgKfvGquZJ1SEOo=;
        b=LdAWlPlOCoOO6bUPNU2qFHhcpUyDnyNvK03/fzAleSsSTE4SG0+s1v1dLSsnlzX1kz
         adOhhO22P3qmVO6FFLrYw92G9xuRigwNOnziApCaZonre8WtctUb0s8b0miD5GBf9C8o
         dMkXIppqcbAX5N6uUfdKlNc4Nuwe/HIZsy0pRGCtHLu7K9zEgk2RCegHppsyWkKj9g/Q
         ysLQntaNIbjHVDqnrGQlHnjC4SmjVXuAkP0NAoy4lJDefAB/db0WI1tPyujwSVoV7dCz
         AaYTG1ZPrIwoJvFhhE/qbudy2NDABNXryT/iZZkKiK4baw63U9N5z2MmE4QKyeIjEA0G
         RTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894376; x=1740499176;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLiPp+tksGtaJoVcenFPvqvMvCo7VgKfvGquZJ1SEOo=;
        b=mHxPTlv96DtjN7RyUKphWhUWm9BV4NoFD5k+E9S6eeK/r9Tl9Qq+gxsmywKQZ+DLR3
         +8UGALGFTUUbTt6RlhD86khwwtxtkVFxgNgzkFUypgr9lBqPLz3+7z4lxCOYq9kh83bT
         7KwJ6tVRUSqbSEo0KHxGKvzAu+RcEtTfyTKNnS1XHs19kPjXOBzJE+47WZszag/XwouK
         ireoEHjd2eyFMP0miXITuIetjeBvAMD2hcdKeNDwNu3NBvr3gRsTDNXhT/jZotxfwjKr
         WS02MQnErqJZK7A47K6XMxepp8DADFlydlDhEEgR+BVCbF1e5ndPMkIV+PHaPztV5QSi
         weng==
X-Forwarded-Encrypted: i=1; AJvYcCWViYMrFQ7TwxuHAYD7jjTuhB4Ccpq9cc4yOwotOF3vgfBEYv8EF7YJQIM15k8dQWx847pHzmGitaoPdi+5@vger.kernel.org
X-Gm-Message-State: AOJu0YyJd+TWjazats378mwr/g/NbUKfvIsyvX6Y/MTw6yBEnBfkrfnA
	fIneBeJLeYUof67favh5BfjVI1pEbrRXRljaAJaFH26Z4hET2KNJpFWaZfzuvAY=
X-Gm-Gg: ASbGncu06SbUI8e7vp6UB/ac1vGqBt+Qq1QUyIrBzcMqHVWfu7aqy3i377meJhrTUmv
	GNjCMQ7YzFBLhj6c0qlYRHnmOFw02Yie9q9iQ6MtQmqaGUaZTTg/i/gugecTLRDf9rAP6lWPNNP
	Dz/pvp7QSMosVHE+CzH2MGW6CVwZY53Ha4wDU2R7+gaYp5vbRTW5gwVYfVV0htj6G0RPpSZX88E
	eeCGEE+pYWwN5J4IuSRbe1IXnRls6xIXJ2scgpBQdeolyiHMELNmAyeXSQxfeNYo4gFbSilrVWb
	2mPq5jbi7uObcD5S9tpIW7nI/FuDoA==
X-Google-Smtp-Source: AGHT+IFFPfR802qDKzGf8EpcaA/0PrAJS+U9zhmkfvPjSsbnNFMbY1JWC1vsFmrEkwOr49Qwmkd7iQ==
X-Received: by 2002:a05:600c:5110:b0:439:5ea4:c1e8 with SMTP id 5b1f17b1804b1-4396e762833mr119637905e9.26.1739894376111;
        Tue, 18 Feb 2025 07:59:36 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7bb2:512b:ca43:946a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7ecsm15174942f8f.49.2025.02.18.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:59:35 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 18 Feb 2025 16:59:18 +0100
Subject: [PATCH v2] irqchip/qcom-pdc: Workaround hardware register bug on
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFWutGcC/22NQQqDMBBFryKz7pRMVBq78h7FRYyjDhQjSVGLe
 PemQnddvgf//R0iB+EI92yHwItE8VMCfcnAjXYaGKVLDFrpUmki3IiNIqVw7hyOK64W21tuuqr
 ivigrSMM5cC/bGX00iUeJLx/e58dCX/vL5f9yCyFhb5wujC2Ma239lMkGf/VhgOY4jg/DIw6gt
 QAAAA==
X-Change-ID: 20250211-x1e80100-pdc-hw-wa-b738d99ef459
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Maulik Shah <quic_mkshah@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2

On X1E80100, there is a hardware bug in the register logic of the
IRQ_ENABLE_BANK register: While read accesses work on the normal address,
all write accesses must be made to a shifted address. Without a workaround
for this, the wrong interrupt gets enabled in the PDC and it is impossible
to wakeup from deep suspend (CX collapse). This has not caused problems so
far, because the deep suspend state was not enabled. We need a workaround
now since work is ongoing to fix this.

The PDC has multiple "DRV" regions, each one has a size of 0x10000 and
provides the same set of registers for a particular client in the system.
Linux is one the clients and uses DRV region 2 on X1E. Each "bank" inside
the DRV region consists of 32 interrupt pins that can be enabled using the
IRQ_ENABLE_BANK register:

  IRQ_ENABLE_BANK[bank] = base + IRQ_ENABLE_BANK + bank * sizeof(u32)

On X1E, this works as intended for read access. However, write access to
most banks is shifted by 2:

  IRQ_ENABLE_BANK_X1E[0] = IRQ_ENABLE_BANK[-2]
  IRQ_ENABLE_BANK_X1E[1] = IRQ_ENABLE_BANK[-1]
  IRQ_ENABLE_BANK_X1E[2] = IRQ_ENABLE_BANK[0] = IRQ_ENABLE_BANK[2 - 2]
  IRQ_ENABLE_BANK_X1E[3] = IRQ_ENABLE_BANK[1] = IRQ_ENABLE_BANK[3 - 2]
  IRQ_ENABLE_BANK_X1E[4] = IRQ_ENABLE_BANK[2] = IRQ_ENABLE_BANK[4 - 2]
  IRQ_ENABLE_BANK_X1E[5] = IRQ_ENABLE_BANK[5] (this one works as intended)

The negative indexes underflow to banks of the previous DRV/client region:

  IRQ_ENABLE_BANK_X1E[drv 2][bank 0] = IRQ_ENABLE_BANK[drv 2][bank -2]
                                     = IRQ_ENABLE_BANK[drv 1][bank 5-2]
                                     = IRQ_ENABLE_BANK[drv 1][bank 3]
                                     = IRQ_ENABLE_BANK[drv 1][bank 0 + 3]
  IRQ_ENABLE_BANK_X1E[drv 2][bank 1] = IRQ_ENABLE_BANK[drv 2][bank -1]
                                     = IRQ_ENABLE_BANK[drv 1][bank 5-1]
                                     = IRQ_ENABLE_BANK[drv 1][bank 4]
                                     = IRQ_ENABLE_BANK[drv 1][bank 1 + 3]

Introduce a workaround for the bug by matching the qcom,x1e80100-pdc
compatible and apply the offsets as shown above:

 - Bank 0...1: previous DRV region, bank += 3
 - Bank 1...4: our DRV region, bank -= 2
 - Bank 5: our DRV region, no fixup required

The PDC node in the device tree only describes the DRV region for our
particular client. We also need to map parts of the previous DRV region to
issue writes there. To maintain compatibility with old device trees, obtain
the base address of the region by applying the -0x10000 offset. Note that
this is also more correct from a conceptual point of view: We don't really
make use of the other region; we just issue shifted writes that end up in
the registers of our own region.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Clarify why memory is mapped outside the region defined in the device
  tree (Dmitry, tglx)
- Rename _pdc_reg_write() -> pdc_base_reg_write() (tglx)
- Clarify what "DRV" stands for (tglx): The PDC has multiple "DRV"
  regions, each of them provides the same set of registers for a particular
  client. Linux is using only one of them, but we need to issue writes to
  the previous region to workaround the hardware bug.
- Use "switch (bank) { case 0 ... 1: ... }" style instead of if statement
  for more clarity (tglx)
- Extend commit message for more clarity (tglx)
- Link to v1: https://lore.kernel.org/r/20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org
---
 drivers/irqchip/qcom-pdc.c | 67 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 74b2f124116e3415d77269959c1ed5e7d7efd671..52d77546aacb9526a8856c9338965bd4ee7e63b7 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,9 +21,11 @@
 #include <linux/types.h>
 
 #define PDC_MAX_GPIO_IRQS	256
+#define PDC_DRV_OFFSET		0x10000
 
 /* Valid only on HW version < 3.2 */
 #define IRQ_ENABLE_BANK		0x10
+#define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
 #define IRQ_i_CFG		0x110
 
 /* Valid only on HW version >= 3.2 */
@@ -46,13 +48,20 @@ struct pdc_pin_region {
 
 static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
+static void __iomem *pdc_prev_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
 static unsigned int pdc_version;
+static bool pdc_x1e_quirk;
+
+static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
+{
+	writel_relaxed(val, base + reg + i * sizeof(u32));
+}
 
 static void pdc_reg_write(int reg, u32 i, u32 val)
 {
-	writel_relaxed(val, pdc_base + reg + i * sizeof(u32));
+	pdc_base_reg_write(pdc_base, reg, i, val);
 }
 
 static u32 pdc_reg_read(int reg, u32 i)
@@ -60,6 +69,34 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
 }
 
+static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
+{
+	void __iomem *base;
+
+	/* Remap the write access to work around a hardware bug on X1E */
+	switch (bank) {
+	case 0 ... 1:
+		/* Use previous DRV (client) region and shift to bank 3-4 */
+		base = pdc_prev_base;
+		bank += 3;
+		break;
+	case 2 ... 4:
+		/* Use our own region and shift to bank 0-2 */
+		base = pdc_base;
+		bank -= 2;
+		break;
+	case 5:
+		/* No fixup required for bank 5 */
+		base = pdc_base;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
+
+	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
+}
+
 static void __pdc_enable_intr(int pin_out, bool on)
 {
 	unsigned long enable;
@@ -72,7 +109,11 @@ static void __pdc_enable_intr(int pin_out, bool on)
 
 		enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
 		__assign_bit(mask, &enable, on);
-		pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
+
+		if (pdc_x1e_quirk)
+			pdc_x1e_irq_enable_write(index, enable);
+		else
+			pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
 	} else {
 		enable = pdc_reg_read(IRQ_i_CFG, pin_out);
 		__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
@@ -324,10 +365,29 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
+	/*
+	 * PDC has multiple DRV regions, each one provides the same set of
+	 * registers for a particular client in the system. Due to a hardware
+	 * bug on X1E, some writes to the IRQ_ENABLE_BANK register must be
+	 * issued inside the previous region. This region belongs to
+	 * a different client and is not described in the device tree. Map the
+	 * region with the expected offset to preserve support for old DTs.
+	 */
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
+		pdc_prev_base = ioremap(res.start - PDC_DRV_OFFSET, IRQ_ENABLE_BANK_MAX);
+		if (!pdc_prev_base) {
+			pr_err("%pOF: unable to map previous PDC DRV region\n", node);
+			return -ENXIO;
+		}
+
+		pdc_x1e_quirk = true;
+	}
+
 	pdc_base = ioremap(res.start, res_size);
 	if (!pdc_base) {
 		pr_err("%pOF: unable to map PDC registers\n", node);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto fail;
 	}
 
 	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
@@ -363,6 +423,7 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 fail:
 	kfree(pdc_region);
 	iounmap(pdc_base);
+	iounmap(pdc_prev_base);
 	return ret;
 }
 

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-x1e80100-pdc-hw-wa-b738d99ef459

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


