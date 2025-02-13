Return-Path: <linux-arm-msm+bounces-47934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5EA34B5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F0F1888451
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E4B1FF7B0;
	Thu, 13 Feb 2025 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJNxy26v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFC28A2AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466264; cv=none; b=eJqrSa5rHTcO+19pKVOLwUddYMjtlkAxw2PitlvUXo3lSkkfDgMCWeQP5CFiKDv6KsMscwkvCCp3RSdAjzynXXfTzDMCJM2fV5Cjw7DnFYJf7UTXoVNBsXV66/ew3DRyQswXlwGomjOoftwzPviADM1yXnNbBHULFXEtqMQw8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466264; c=relaxed/simple;
	bh=UxujoObsRMePbbJAebzGVUGsG/FjQpg8nn1wclSSvk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jsa0dRwiKkqdNP3UGj67mjzA3pfPfLs/ugzKJrG3FQOu0jlxi3S+lDIiRIcSOxWWJCCTOVO9MLGWmOf9/D4CnKl9S7Pmvhpkl2tNBWbCSOriCtRF2i3Udw6qlxtjru49PgvnZ1jzIdbVD3lcvSkHXo1+KnhSqUqhX30ZD56yfXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJNxy26v; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4395f66a639so7748265e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 09:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739466261; x=1740071061; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oga1ZrT528saYrM/3p6zFxJtS4TBk8uWtZwbddbjGow=;
        b=iJNxy26vir20C3cTWI0AGPzusr1i07WqreHWVca1PH7W8Z5+V8UmzsuL8NX4W6s6e7
         MO5oFqisq4sNyQUc7b7rx+3W+b5lNdBZB3/8VEzKrTCuMbyV00HE7nty8Mnh46nnIGKp
         PJiw7o/YrudSfSkE8s5qiuk6CHc2oRXRUuqkUXRB5wnEbVTiNj5I2d9hWyrqvJkONG3z
         CdTLFinpjqpROmicGQmlQ1RtODpaVKqE7f+aJdqOkxGyVOqtpuxfcWLvEwNC7DLDP9mF
         VQA/AwXG13R1NCU22/OLkiqg75WyhnlpNd7OG1no+WMFmZKML2bbcEV7q/y+XEfLMis3
         olrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466261; x=1740071061;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oga1ZrT528saYrM/3p6zFxJtS4TBk8uWtZwbddbjGow=;
        b=mBeCMlrEoB36r6zq/I8IRIvpE8VJjsH+bI3LE9S80oGiiYs0TW0v/YbipObEnbO5/F
         VlDIrvjgVO6fqTRK7xvS/tx4UvqAPCCld9tKZ0srr3upoNfXXFIgNWTVCMLVZa94aloj
         molN3PcSEam3MY0SaUzk6a4wQ0YcFkPfMcZudOt3qQm3fKiEcA15w9KjgULwkon9lkCl
         erNAXL/o/2+OJSR0IQRyFHFLcolkojR+N5e2bebEXWRuSlfhcFatUDMUptWe8Te7TP7n
         KOGWXrZ9/9yZMXydHHazCqnZujGpvoPkJ1UkKZ+svQm5Q5Kv/mtcVk52g8UYrtWMg6Ub
         eN+w==
X-Forwarded-Encrypted: i=1; AJvYcCWF1Y6jjepen9rRELYXLpDwbLYF9gF4WzIaQL6k2a2a6EiCpFCfWB4WaiegehjMrJft0PaZYzgwUZMIlIrP@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3FwGChEgJWADwCcyUBWrzcwLKgW0oFI4vQ5DX4JIK+/sAtzh
	tdV7KfuX+EiTa19uKACySDIJiuOOB1EVXai+5UiBfzo2Rskb3UKoIlY96u+k8mM=
X-Gm-Gg: ASbGnctK8OGv5O8BJkuMsb0GzFRgaLwB2BnzW4W29nDxETGZcIDREggR/fGcByCExYY
	QsU1L7EKaf+lngfCdqeTOe063CRfNmb12UR8J+ICfUOw4ajNbQEuFSOnTJztizCe3napU/zmkCu
	AsrSHCFkVfpx3dItexooTHeJlmD5p78y4kH9SKFu6xgaae6Fa4QH+vQgloZuZ+3/+XtoXuRqQ80
	gW9mx9q2it/tgE/ogw0Wfm7FAq3gaKzIT33AqgoHQZo75t17TBb4lQ25tfuFIMvBl1bDQj9fLS+
	PrfBFZM1M+MKaHrfNHnYAm33WuOTfw==
X-Google-Smtp-Source: AGHT+IH1YMPyiqFwHzUGBiXqMnPayaKJMizJnHFRkvNA08F0Uz2My0MWNu0JzFe3LytxAx8/k0XH5g==
X-Received: by 2002:a05:600c:450c:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-4395815f428mr85597685e9.3.1739466260444;
        Thu, 13 Feb 2025 09:04:20 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:29d1:1370:c895:9654])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b84bcsm55990785e9.40.2025.02.13.09.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:04:20 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 13 Feb 2025 18:04:00 +0100
Subject: [PATCH] irqchip/qcom-pdc: Workaround hardware register bug on
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP8lrmcC/x3MQQ5AMBBA0avIrE0yUxrqKmKBDmaDtAlNxN01l
 m/x/wNRgkqErnggyKVRjz2DywLmbdxXQfXZYMhYMsyYWFpiIjz9jNuN94hTU7XeOVlq6yCHZ5B
 F0z/th/f9AK6l91hkAAAA
X-Change-ID: 20250211-x1e80100-pdc-hw-wa-b738d99ef459
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Maulik Shah <quic_mkshah@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan.hovold@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

On X1E80100, there is a hardware bug in the register logic of the
IRQ_ENABLE_BANK register. While read accesses work on the normal address,
all write accesses must be made to a shifted address. Without a workaround
for this, the wrong interrupt gets enabled in the PDC and it is impossible
to wakeup from deep suspend (CX collapse).

This has not caused problems so far, because the deep suspend state was not
enabled. We need a workaround now since work is ongoing to fix this.

Introduce a workaround for the problem by matching the qcom,x1e80100-pdc
compatible and shift the write address by the necessary offset.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/irqchip/qcom-pdc.c | 51 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 74b2f124116e3415d77269959c1ed5e7d7efd671..9ce44121db21ac05b370046feb09c17122f80b19 100644
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
+static void __iomem *pdc_drv1;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
 static unsigned int pdc_version;
+static bool pdc_x1e_quirk;
+
+static void _pdc_reg_write(void __iomem *base, int reg, u32 i, u32 val)
+{
+	writel_relaxed(val, base + reg + i * sizeof(u32));
+}
 
 static void pdc_reg_write(int reg, u32 i, u32 val)
 {
-	writel_relaxed(val, pdc_base + reg + i * sizeof(u32));
+	_pdc_reg_write(pdc_base, reg, i, val);
 }
 
 static u32 pdc_reg_read(int reg, u32 i)
@@ -60,6 +69,26 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
 }
 
+static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
+{
+	void __iomem *base = pdc_base; /* DRV2 */
+
+	/*
+	 * Workaround hardware bug in the register logic on X1E80100:
+	 *  - For bank 0-1, writes need to be made to DRV1, bank 3 and 4.
+	 *  - For bank 2-4, writes need to be made to DRV2, bank 0-2.
+	 *  - Bank 5 works as expected.
+	 */
+	if (bank <= 1) {
+		base = pdc_drv1;
+		bank += 3;
+	} else if (bank <= 4) {
+		bank -= 2;
+	}
+
+	_pdc_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
+}
+
 static void __pdc_enable_intr(int pin_out, bool on)
 {
 	unsigned long enable;
@@ -72,7 +101,11 @@ static void __pdc_enable_intr(int pin_out, bool on)
 
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
@@ -324,10 +357,21 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
+		pdc_drv1 = ioremap(res.start - PDC_DRV_OFFSET, IRQ_ENABLE_BANK_MAX);
+		if (!pdc_drv1) {
+			pr_err("%pOF: unable to map PDC DRV1 region\n", node);
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
@@ -363,6 +407,7 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 fail:
 	kfree(pdc_region);
 	iounmap(pdc_base);
+	iounmap(pdc_drv1);
 	return ret;
 }
 

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-x1e80100-pdc-hw-wa-b738d99ef459

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


