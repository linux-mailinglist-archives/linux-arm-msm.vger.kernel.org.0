Return-Path: <linux-arm-msm+bounces-53358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF7A7DAE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EEDC1891977
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 10:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4416323312D;
	Mon,  7 Apr 2025 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JexIb2gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C13230BCE
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021032; cv=none; b=qcejrzr1b4OgpOQMJHTPsC3rrmvCwUmhVEKkAbHsR32kbQ9pBnXhI/1u3oAk/NXC4ErG5De1uCdgLxXNTmUbtZhMm4AigvObh96QVeqqZsBcbmMahAWllu+wBUwAymAcApCRaNIKfDN+XEhlQZ+QlpvHqB9vE9DHj/p/rJKezfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021032; c=relaxed/simple;
	bh=GJ/3LoYhjreXCmlje4HGApIZSD0dopghOnCCoRTD310=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFe2sS64u4I9+trj3WD+yT8uByuZ78zrvQhAOjME9I+CJ0LbJB1tXDpbb2GmsYA9Ky0SwPiOlgV+2OF5ycQ4KVxDv9r2DWOb/2l2pbpKdOCOCKlMJF8fbox2HX9tdBg5RqFHuCbHpebfQ49PgX2D109W2FKj6P6EKfViV+rh4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JexIb2gj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso2358419f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021028; x=1744625828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxuAzzqTN8Esy+3wBd10qAHGJHFzExg1oERBNtTrUmM=;
        b=JexIb2gjNt3Gy/0s2IiYAJmZpxFMHlk8DtcWbR7rtyvXNqYfH8Hl+Byo5o47fypklG
         tQnm8mHpZ/MSG/9yObjvvSjQmv9tFsh+Y7VzULy7ZpOkc+w5PQzZFxkcSb7LUXDX2Git
         5ca/Sz0R4mmXboyU3kA+/PK0rCyH6nJs/5Kt4c90/gE/tOCaP7KZ+7aL0RMLt1QJdkpi
         3FW/qt0sJx2Sv41pXbYN49/eloQoDgA7j0EhAYixmItwtUKd/R61WLx8tEW61VoB5rZT
         70+RXV4cNuB/TimQGcMdu+7Eai4Amo7f2tqL1XAyXHO8uUfZ9eZ8ZjCU5VtXtgf++2fI
         ZXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021028; x=1744625828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxuAzzqTN8Esy+3wBd10qAHGJHFzExg1oERBNtTrUmM=;
        b=P/HJJYgfMBTLi7sfuFlOfimEM7kUl3lcBCePRCwMkQb49U6CUV4+dminrLNG/YmWh9
         Ssf7IIPXbJb29OHkQKtoa7fhSZAEfGNh7Tj8g2UO6MwmtjX2WuJaX2N/rFsDmMgt9pAm
         JY+VjW1o3P6u/d41bWaaZ+7Bi0v2yarvFYV9JbLN+gJrtkcKn8DZ+jcI6U06DanocmGc
         nZhBffBPv7D0AGdM39W5m7gs1eWIlW9B80CTYFTnLeJu6YO3/l9nhqHHqGyJrUaUXO1Y
         OtW7kAKfS780kYTQvULlgZJbjeMhhHwv2W9IneCRscv5tLdqIcS4v7MckT/qQSa2ZcQ3
         gRbA==
X-Forwarded-Encrypted: i=1; AJvYcCVywYca9Y7NZL7NgN6tfdbExwfDLLYYx1qqCdrb5HxR2wu9uz3UVbMo1BdptkB7etmLERRe9lqSLPF9U+gG@vger.kernel.org
X-Gm-Message-State: AOJu0YyFx9e1+d5aA5wUPbRD8dOKOwlpmwQ7nmDXzSxJsgLxLoAaQVEe
	yiTZaRfQXxhjwPIvqe9YqopJm4LyRFYo7HJBZcIek1cDCe4cBB6IsFiUeLsh4pE=
X-Gm-Gg: ASbGncvBuzqNnP90keEv9ILPjNCw2bkxOwFOnlt5gh+Z1O0FeYe9OH5UEdEUH89r3Jw
	BrZmJks3hBl6HeuhlcqSKvQpkLkx5PCdAmr6M9kpbK/xttz28nx064Dop+l9MdO0omh+QYEfP5w
	XhRxBz1cIh1/Y43pvfWpVnRD668NeaOj8J4zpufuxoTT4+JtMwfC4Avq46tR+ed1kw/2QbhL3Qi
	mWdiWOqx/1tl9BX9vJESgdwL+FZ9cGC6XOWkSD1Z/TSaQ0WaSb6XTuXLlhRlmCxXZXUHI/65vog
	SapsC5G1BCI+Qa2O58uDnwPGMVAdrLsXSLcfY6GseloWm9jXS4pmFTgfR7E8Ssx0yQ==
X-Google-Smtp-Source: AGHT+IHh+6UGrJ/XHf2b1137nkPVPeuW5PoXq2uwhIcmz71829sHC5RKQ4MEcbte47SAnkiXo4gpRg==
X-Received: by 2002:a05:6000:188f:b0:391:3915:cfea with SMTP id ffacd0b85a97d-39cba93329amr9862933f8f.38.1744021028483;
        Mon, 07 Apr 2025 03:17:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11476831f8f.24.2025.04.07.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:17:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 12:17:05 +0200
Subject: [PATCH RFT v3 3/3] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3901;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GJ/3LoYhjreXCmlje4HGApIZSD0dopghOnCCoRTD310=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn86Yh9gJ5axoT/EQbGWoqm1NFW5vkB2viScmVj9lv
 3zyu8NeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/OmIQAKCRB33NvayMhJ0faSEA
 Cda9fOHkeTmvfwyg0O+9OkwVmMxfblxX9lpBagC/2+wG542TmQ/IznGMbYXZn/h3UmpJQgAcpKt1Dk
 DXIzZRFBxs17dffzTsGbFmp+EKhVmBoQPCDqH0YPHBcMM8R8I/yQT33v3ygS6PkvQQO9/nFyXmnokE
 Llrr+gCJW6jG5FXPjEVLJ6aKTcOtOj3mMp5p1FsxbOTI+TtOhM5pOomdZrVuUzyHLqrQ+R8xMr6BGo
 3+6zc5klY7QEsJv4LIFzklaGh1pDbEqeYgT2WS+rJtJkGkxXEqD8At5DrbjU2fDLrJgJWxc2ZvN74I
 2rz2//vS7H6zmXsbo73NOPVuMvL1Zu+eWseoUs1qkGaLI1BSyLeGjUSNGF7PUPV011hAC0KHAPTQ7v
 cJJLItL/eDavPoRw1Hpf9C5ORd4EuY48CibS9VveKTMd4HLDqhwDszEPCz/2L07pfVgrM/nmHAGxGv
 qSWiw2NzS1HE2kKuH3chhPNgiQDCsxZM1LGI7W9hniNBXFuV8/67myXyc1osPrwsuNgMEVcxFn1hxh
 GmdKebccIDYdWwiJGM72YAhh1UXfwcKtAepsOFO4yoAS7gVPKlzeOzvQm/qTN9OYPJAlK2Koj25Ug1
 fPqAWLx6u4daaV/0A3bWBo1es/VvlfKMopdmwBilSYgBRA56C4eqYGkpl9FA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On systems with a large number request slots and unavailable MCQ ESI,
the current design of the interrupt handler can delay handling of
other subsystems interrupts causing display artifacts, GPU stalls
or system firmware requests timeouts.

Since the interrupt routine can take quite some time, it's
preferable to move it to a threaded handler and leave the
hard interrupt handler wake up the threaded interrupt routine,
the interrupt line would be masked until the processing is
finished in the thread thanks to the IRQS_ONESHOT flag.

When MCQ & ESI interrupts are enabled the I/O completions are now
directly handled in the "hard" interrupt routine to keep IOPs high
since queues handling is done in separate per-queue interrupt routines.

This fixes all encountered issued when running FIO tests
on the Qualcomm SM8650 platform.

Example of errors reported on a loaded system:
 [drm:dpu_encoder_frame_done_timeout:2706] [dpu error]enc32 frame done timeout
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1: hangcheck detected gpu lockup rb 2!
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     completed fence: 74285
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     submitted fence: 74286
 Error sending AMC RPMH requests (-110)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7f256f77b8ba9853569157db7785d177b6cd6dee..b40660ca2fa6b3488645bd26121752554a8d6a08 100644
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
@@ -7018,6 +7018,29 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
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
+	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
+	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
+		return IRQ_WAKE_THREAD;
+
+	/* Directly handle interrupts since MCQ ESI handlers does the hard job */
+	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
+				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
+}
+
 static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
 {
 	int err = 0;
@@ -10577,7 +10600,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
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


