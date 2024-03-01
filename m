Return-Path: <linux-arm-msm+bounces-13099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62286E699
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 18:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50455287104
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F875CAC;
	Fri,  1 Mar 2024 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7w0WpsL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C14404
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312570; cv=none; b=HHJmpVx9lomQMNJ2Zs0giw9HKYOayTwiO0BI2c1B3iYlJ3ML68UHpixBAquP0u8NLqaJfFQpMjb/avwNRZDfcqVxMJQmWDAArW+KnMF7sEv/7/4wuQTmxp5GjuGsWobWuto2qHYRwSNohfcGtUQZRjKda7kgE/iKdh4fBmOh2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312570; c=relaxed/simple;
	bh=iBfmq8FiW83RHkKaeBd7C85lcsS1UP1JRKzZ4ojGyyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rvtw9J7gAmn3VY+tgbcl+CNNiq9hstJfWNN/T/SyFqN70YmXnZXhORM6pMPKlNap8+TE4R6RATX67JqgrHpb7xWsI7oHdMnEVH+MEqlU+e8nb/f0ZRWTvFBrhC2jmNhyjo7g+EnSocEWxaJ4kbmmA6apMw6R+mC4IyshS1PG574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7w0WpsL; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso121765939f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 09:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312568; x=1709917368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaMlwQQ3/GUmxQKOFUy5DpH0QO/BlGNt49LLq8M56yQ=;
        b=f7w0WpsLiACwdyMQpSnRkhRes4nHQH53/bAp/im8zZTnZbqseMxpaCs0iBigjjkJeY
         4gIcJdQ6CpE2Mq30zzi7PMdVnOTElirueux5qVQaSos2JEEwt97gNMVQPTaeiezoKbuE
         koeT1mp84WNKLJZjvUzamnPiTq7coIkCEpg+viHJoWU8w0f7QQiObjpExLJduzP5TVJk
         oNLbg5dXoLB7p/dnkC+bjnsiX8Fk7KEnWo3cQXXYAvmnlRFaET2ypw0t39JYKv2w7eZG
         CH9NsyrV/xPacwSbvxEC90vlj/nwhRQB49nL5AFg2SqijWgHJpDwMCCsKOSjHTK3QqqC
         y4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312568; x=1709917368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaMlwQQ3/GUmxQKOFUy5DpH0QO/BlGNt49LLq8M56yQ=;
        b=D6GZisrXnHhTda0wzpqvA7BFd/prv0NFjJhmK1Tvkq6LgXjSiGiDjTZa9BWYPXF3OG
         wcnqrQCyLhRc5et6Gmk1vcRppW1KKbSygJVEkTt/KVGc7qMW+uecj8GTBihYn4WKdmVv
         LCC4g7drQnyxWV9Kcd4jjquLOA0axwWctC1RiPtkfxyPvSvOWMKEaOzh94nwYtzt3qNt
         PbD98hLUkwTpMIREUXXfFJTBKS4KICLyImgkhjDDov1kfVHGATh1xXu/LIlMw30mGV4S
         aBvuVPTq/UNrZRJoNn166vDCvSDjcvTKgsEfSB6Bx03mgXI2SeQQBj995vmqH0HW4Dp9
         5Yfg==
X-Forwarded-Encrypted: i=1; AJvYcCWpls+8sICnYiQ5n7iUJIPpau4t57h7Kq6YOVnqbFkMNC9chVX1tQEyTGoQOKbnHChh3N1+5QARzwUws4pSPoMpNZ8kw2bHcDg4apRtfQ==
X-Gm-Message-State: AOJu0YyvyE66mL65g9X1ykmim5kSn3yqc8WuCVMa4EkTcPyHjpMl9c5J
	zfXts0vqd8pZjpj2BzP7dXztez31V/YyjG/EA0etwawBBPr6x33q4pfhZD75S5Q=
X-Google-Smtp-Source: AGHT+IHSx/ZMCskHwH0MKILf0qUluUBJVrdyd/ZzLLEnZgQemtbczKtFo9BeZ2YDZECdrl/gYlM6CQ==
X-Received: by 2002:a05:6e02:12e1:b0:365:25c0:c82d with SMTP id l1-20020a056e0212e100b0036525c0c82dmr2548448iln.28.1709312567811;
        Fri, 01 Mar 2024 09:02:47 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id o2-20020a92dac2000000b0036581060910sm991430ilq.6.2024.03.01.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:02:47 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/7] net: ipa: change ipa_interrupt_config() prototype
Date: Fri,  1 Mar 2024 11:02:36 -0600
Message-Id: <20240301170242.243703-2-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240301170242.243703-1-elder@linaro.org>
References: <20240301170242.243703-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the return type of ipa_interrupt_config() to be an error
code rather than an IPA interrupt structure pointer, and assign the
the pointer within that function.

Change ipa_interrupt_deconfig() to take the IPA pointer as argument
and have it invalidate the ipa->interrupt pointer.

Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: Make sure all returns from ipa_interrupt_config() are ints.

 drivers/net/ipa/ipa_interrupt.c | 25 +++++++++++++++----------
 drivers/net/ipa/ipa_interrupt.h | 10 +++++-----
 drivers/net/ipa/ipa_main.c      | 13 ++++---------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 4d80bf77a5323..e23c9a5942eda 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -236,7 +236,7 @@ void ipa_interrupt_simulate_suspend(struct ipa_interrupt *interrupt)
 }
 
 /* Configure the IPA interrupt framework */
-struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
+int ipa_interrupt_config(struct ipa *ipa)
 {
 	struct device *dev = &ipa->pdev->dev;
 	struct ipa_interrupt *interrupt;
@@ -246,15 +246,14 @@ struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
 
 	ret = platform_get_irq_byname(ipa->pdev, "ipa");
 	if (ret <= 0) {
-		dev_err(dev, "DT error %d getting \"ipa\" IRQ property\n",
-			ret);
-		return ERR_PTR(ret ? : -EINVAL);
+		dev_err(dev, "DT error %d getting \"ipa\" IRQ property\n", ret);
+		return ret ? : -EINVAL;
 	}
 	irq = ret;
 
 	interrupt = kzalloc(sizeof(*interrupt), GFP_KERNEL);
 	if (!interrupt)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	interrupt->ipa = ipa;
 	interrupt->irq = irq;
 
@@ -271,24 +270,30 @@ struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
 
 	ret = dev_pm_set_wake_irq(dev, irq);
 	if (ret) {
-		dev_err(dev, "error %d registering \"ipa\" IRQ as wakeirq\n", ret);
+		dev_err(dev, "error %d registering \"ipa\" IRQ as wakeirq\n",
+			ret);
 		goto err_free_irq;
 	}
 
-	return interrupt;
+	ipa->interrupt = interrupt;
+
+	return 0;
 
 err_free_irq:
 	free_irq(interrupt->irq, interrupt);
 err_kfree:
 	kfree(interrupt);
 
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /* Inverse of ipa_interrupt_config() */
-void ipa_interrupt_deconfig(struct ipa_interrupt *interrupt)
+void ipa_interrupt_deconfig(struct ipa *ipa)
 {
-	struct device *dev = &interrupt->ipa->pdev->dev;
+	struct ipa_interrupt *interrupt = ipa->interrupt;
+	struct device *dev = &ipa->pdev->dev;
+
+	ipa->interrupt = NULL;
 
 	dev_pm_clear_wake_irq(dev);
 	free_irq(interrupt->irq, interrupt);
diff --git a/drivers/net/ipa/ipa_interrupt.h b/drivers/net/ipa/ipa_interrupt.h
index 53e1b71685c75..1947654e3e360 100644
--- a/drivers/net/ipa/ipa_interrupt.h
+++ b/drivers/net/ipa/ipa_interrupt.h
@@ -76,17 +76,17 @@ void ipa_interrupt_irq_enable(struct ipa *ipa);
 void ipa_interrupt_irq_disable(struct ipa *ipa);
 
 /**
- * ipa_interrupt_config() - Configure the IPA interrupt framework
+ * ipa_interrupt_config() - Configure IPA interrupts
  * @ipa:	IPA pointer
  *
- * Return:	Pointer to IPA SMP2P info, or a pointer-coded error
+ * Return:	0 if successful, or a negative error code
  */
-struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa);
+int ipa_interrupt_config(struct ipa *ipa);
 
 /**
  * ipa_interrupt_deconfig() - Inverse of ipa_interrupt_config()
- * @interrupt:	IPA interrupt structure
+ * @ipa:	IPA pointer
  */
-void ipa_interrupt_deconfig(struct ipa_interrupt *interrupt);
+void ipa_interrupt_deconfig(struct ipa *ipa);
 
 #endif /* _IPA_INTERRUPT_H_ */
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 00475fd7a2054..0c6e6719d99e3 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -542,12 +542,9 @@ static int ipa_config(struct ipa *ipa, const struct ipa_data *data)
 	if (ret)
 		goto err_hardware_deconfig;
 
-	ipa->interrupt = ipa_interrupt_config(ipa);
-	if (IS_ERR(ipa->interrupt)) {
-		ret = PTR_ERR(ipa->interrupt);
-		ipa->interrupt = NULL;
+	ret = ipa_interrupt_config(ipa);
+	if (ret)
 		goto err_mem_deconfig;
-	}
 
 	ipa_uc_config(ipa);
 
@@ -572,8 +569,7 @@ static int ipa_config(struct ipa *ipa, const struct ipa_data *data)
 	ipa_endpoint_deconfig(ipa);
 err_uc_deconfig:
 	ipa_uc_deconfig(ipa);
-	ipa_interrupt_deconfig(ipa->interrupt);
-	ipa->interrupt = NULL;
+	ipa_interrupt_deconfig(ipa);
 err_mem_deconfig:
 	ipa_mem_deconfig(ipa);
 err_hardware_deconfig:
@@ -591,8 +587,7 @@ static void ipa_deconfig(struct ipa *ipa)
 	ipa_modem_deconfig(ipa);
 	ipa_endpoint_deconfig(ipa);
 	ipa_uc_deconfig(ipa);
-	ipa_interrupt_deconfig(ipa->interrupt);
-	ipa->interrupt = NULL;
+	ipa_interrupt_deconfig(ipa);
 	ipa_mem_deconfig(ipa);
 	ipa_hardware_deconfig(ipa);
 }
-- 
2.40.1


