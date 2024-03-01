Return-Path: <linux-arm-msm+bounces-13100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686EB86E69E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 18:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88B391C25597
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F2F9F6;
	Fri,  1 Mar 2024 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ds4Sjysy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB701538B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312572; cv=none; b=RqqI94dX4DsQjBL1w4cRI21936jOVYHnWcgbzz8/474mV/D/R4GYChIbazY2jNPWN1TkHKJo02g2Ow0LwJY2z+m2dz0SPQ7bAZkHT5B8Zkd9fnDdmnAD3djBZI9EHkpufCu+UbDoxaZ3x1N1E648JCSpXhExofYNHnZchhMjpIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312572; c=relaxed/simple;
	bh=g9icqaFUX1RcE7FU17Pn10ZHapUyO6Ps4WVZPo13UvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X38g6iYCWnLJMiXfViniiuuHyAvuhfOaPcs4Kqd5lCj/LRN43j85E8ieWjNf9+06enhlYLz36rmZqyWgAtsD7u7tohG+27mBMlXptSkJSenwJ5fCS40RKMT5/yOXStyS2ZPlghljukj3R1llvztMpl+LG+htsAxwirNe93/IpaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ds4Sjysy; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3651c1e1022so11107165ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312569; x=1709917369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr0sPFq1qDPx+8llR1pfou4QHoPDxxC6Fwf1wZxXaxw=;
        b=ds4Sjysym7OC0p47Vnhn3PAtHEIIICdWFXC07/RL2ecqVTkXrdJjudgLp8nP5eDzcE
         wEnR7gbSzlXYWI+osll3ujOE5hB4JZOCrpZXn9yIr53Yl0ivszOiJETzjqoG4MLrjC5X
         yMpZXkKJz/mT3w8drW8A8cwMuyd4NrWNkkgmM71NSSYfUjWAbFZjre7lANaw2iwTn+gf
         ALlYD5e+DFgDPO2xoh/4pknU7XDEy65vTBNCzgQfsDiMO1oy8rWk4+vE82C2npmNzGV4
         +2SXUOC94lWO+aeR3PWzmNSIWegG6Yzu4Im9Uby05Y+fweIAWILWl3+T9RZmIQUF3ABx
         WD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312569; x=1709917369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr0sPFq1qDPx+8llR1pfou4QHoPDxxC6Fwf1wZxXaxw=;
        b=KMG5aB0LhBoT9eLAHfunTx4z8yCDNtr9r6XkdUhD0Ld30LVGZey1+Nleg6Q8ikae1q
         aWW4oSI/hmEo85Q8wgT/TUAJrYfV6bXel5j2IR32REPF/QlzlnC7nBeD5UVxADI38R+l
         05Hz0FclUmFmJoAVwfBRZNYp6ZCYGCIllhJCcyrQV9+NEKZ6z/vjmYfPdstb7FdsJnxc
         iOVR8lZyOTZ1iI5do9rHkJCO4Rvpv6HlAUgmBytPVl1Bx4+egQng2HgpI9vqQBsVP+mJ
         4/amykWghN8cUQdY8w/Ij8klv8R2Ybeef3RyKC4JF95WuhSU5pE7umucM5dZAVtTmqKz
         f5lA==
X-Forwarded-Encrypted: i=1; AJvYcCV1zCP8KSrG3zP4ySIUGWFXtuERAAXfKtaVPysBZhNBOP9kaDOgH2sKzVcyxW//qTwdI5otxI6Rl21UrufkflFD4MS4FnS2X8ydyEkzJQ==
X-Gm-Message-State: AOJu0Yzz6yNzQgasqnp8mU9tbwfGL7V+K5KHrcplRtW+H6cQPjcUK36t
	y+jTq6oSktthD/NpJDztfBthQH43HS9KxcjTaod8HNhp1MuHhICLgSWNB1eFAEg=
X-Google-Smtp-Source: AGHT+IEc8WDbH71aOYiXRryhVbw4XxkINw9m3SLDaj3comAhKmzbtzJgyh1FFXIpoFXfgyaJePYm6g==
X-Received: by 2002:a05:6e02:1d18:b0:365:696:2817 with SMTP id i24-20020a056e021d1800b0036506962817mr2440997ila.3.1709312569049;
        Fri, 01 Mar 2024 09:02:49 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id o2-20020a92dac2000000b0036581060910sm991430ilq.6.2024.03.01.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:02:48 -0800 (PST)
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
Subject: [PATCH net-next v2 2/7] net: ipa: introduce ipa_interrupt_init()
Date: Fri,  1 Mar 2024 11:02:37 -0600
Message-Id: <20240301170242.243703-3-elder@linaro.org>
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

Create a new function ipa_interrupt_init() that is called at probe
time to allocate and initialize the IPA interrupt data structure.
Create ipa_interrupt_exit() as its inverse.

This follows the normal IPA driver pattern of *_init() functions
doing things that can be done before access to hardware is required.

Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: Updated based on changes to patch 1

 drivers/net/ipa/ipa_interrupt.c | 45 +++++++++++++++++++++++----------
 drivers/net/ipa/ipa_interrupt.h | 14 ++++++++++
 drivers/net/ipa/ipa_main.c      | 28 ++++++++++++++++----
 3 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index e23c9a5942eda..7399724160a89 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -19,6 +19,7 @@
  * time only these three are supported.
  */
 
+#include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
@@ -238,26 +239,15 @@ void ipa_interrupt_simulate_suspend(struct ipa_interrupt *interrupt)
 /* Configure the IPA interrupt framework */
 int ipa_interrupt_config(struct ipa *ipa)
 {
+	struct ipa_interrupt *interrupt = ipa->interrupt;
 	struct device *dev = &ipa->pdev->dev;
-	struct ipa_interrupt *interrupt;
+	unsigned int irq = interrupt->irq;
 	const struct reg *reg;
-	unsigned int irq;
 	int ret;
 
-	ret = platform_get_irq_byname(ipa->pdev, "ipa");
-	if (ret <= 0) {
-		dev_err(dev, "DT error %d getting \"ipa\" IRQ property\n", ret);
-		return ret ? : -EINVAL;
-	}
-	irq = ret;
-
-	interrupt = kzalloc(sizeof(*interrupt), GFP_KERNEL);
-	if (!interrupt)
-		return -ENOMEM;
 	interrupt->ipa = ipa;
-	interrupt->irq = irq;
 
-	/* Start with all IPA interrupts disabled */
+	/* Disable all IPA interrupt types */
 	reg = ipa_reg(ipa, IPA_IRQ_EN);
 	iowrite32(0, ipa->reg_virt + reg_offset(reg));
 
@@ -297,5 +287,32 @@ void ipa_interrupt_deconfig(struct ipa *ipa)
 
 	dev_pm_clear_wake_irq(dev);
 	free_irq(interrupt->irq, interrupt);
+}
+
+/* Initialize the IPA interrupt structure */
+struct ipa_interrupt *ipa_interrupt_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ipa_interrupt *interrupt;
+	int irq;
+
+	irq = platform_get_irq_byname(pdev, "ipa");
+	if (irq <= 0) {
+		dev_err(dev, "DT error %d getting \"ipa\" IRQ property\n", irq);
+
+		return ERR_PTR(irq ? : -EINVAL);
+	}
+
+	interrupt = kzalloc(sizeof(*interrupt), GFP_KERNEL);
+	if (!interrupt)
+		return ERR_PTR(-ENOMEM);
+	interrupt->irq = irq;
+
+	return interrupt;
+}
+
+/* Inverse of ipa_interrupt_init() */
+void ipa_interrupt_exit(struct ipa_interrupt *interrupt)
+{
 	kfree(interrupt);
 }
diff --git a/drivers/net/ipa/ipa_interrupt.h b/drivers/net/ipa/ipa_interrupt.h
index 1947654e3e360..f3f4f4330a597 100644
--- a/drivers/net/ipa/ipa_interrupt.h
+++ b/drivers/net/ipa/ipa_interrupt.h
@@ -89,4 +89,18 @@ int ipa_interrupt_config(struct ipa *ipa);
  */
 void ipa_interrupt_deconfig(struct ipa *ipa);
 
+/**
+ * ipa_interrupt_init() - Initialize the IPA interrupt structure
+ * @pdev:	IPA platform device pointer
+ *
+ * Return:	Pointer to an IPA interrupt structure, or a pointer-coded error
+ */
+struct ipa_interrupt *ipa_interrupt_init(struct platform_device *pdev);
+
+/**
+ * ipa_interrupt_exit() - Inverse of ipa_interrupt_init()
+ * @interrupt:	IPA interrupt structure
+ */
+void ipa_interrupt_exit(struct ipa_interrupt *interrupt);
+
 #endif /* _IPA_INTERRUPT_H_ */
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 0c6e6719d99e3..6cf5c1280aa4e 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -803,6 +803,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
 static int ipa_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct ipa_interrupt *interrupt;
 	enum ipa_firmware_loader loader;
 	const struct ipa_data *data;
 	struct ipa_power *power;
@@ -834,12 +835,21 @@ static int ipa_probe(struct platform_device *pdev)
 	if (loader == IPA_LOADER_DEFER)
 		return -EPROBE_DEFER;
 
-	/* The clock and interconnects might not be ready when we're
-	 * probed, so might return -EPROBE_DEFER.
+	/* The IPA interrupt might not be ready when we're probed, so this
+	 * might return -EPROBE_DEFER.
+	 */
+	interrupt = ipa_interrupt_init(pdev);
+	if (IS_ERR(interrupt))
+		return PTR_ERR(interrupt);
+
+	/* The clock and interconnects might not be ready when we're probed,
+	 * so this might return -EPROBE_DEFER.
 	 */
 	power = ipa_power_init(dev, data->power_data);
-	if (IS_ERR(power))
-		return PTR_ERR(power);
+	if (IS_ERR(power)) {
+		ret = PTR_ERR(power);
+		goto err_interrupt_exit;
+	}
 
 	/* No more EPROBE_DEFER.  Allocate and initialize the IPA structure */
 	ipa = kzalloc(sizeof(*ipa), GFP_KERNEL);
@@ -850,6 +860,7 @@ static int ipa_probe(struct platform_device *pdev)
 
 	ipa->pdev = pdev;
 	dev_set_drvdata(dev, ipa);
+	ipa->interrupt = interrupt;
 	ipa->power = power;
 	ipa->version = data->version;
 	ipa->modem_route_count = data->modem_route_count;
@@ -934,6 +945,8 @@ static int ipa_probe(struct platform_device *pdev)
 	kfree(ipa);
 err_power_exit:
 	ipa_power_exit(power);
+err_interrupt_exit:
+	ipa_interrupt_exit(interrupt);
 
 	return ret;
 }
@@ -941,10 +954,14 @@ static int ipa_probe(struct platform_device *pdev)
 static void ipa_remove(struct platform_device *pdev)
 {
 	struct ipa *ipa = dev_get_drvdata(&pdev->dev);
-	struct ipa_power *power = ipa->power;
 	struct device *dev = &pdev->dev;
+	struct ipa_interrupt *interrupt;
+	struct ipa_power *power;
 	int ret;
 
+	power = ipa->power;
+	interrupt = ipa->interrupt;
+
 	/* Prevent the modem from triggering a call to ipa_setup().  This
 	 * also ensures a modem-initiated setup that's underway completes.
 	 */
@@ -986,6 +1003,7 @@ static void ipa_remove(struct platform_device *pdev)
 	ipa_reg_exit(ipa);
 	kfree(ipa);
 	ipa_power_exit(power);
+	ipa_interrupt_exit(interrupt);
 
 	dev_info(dev, "IPA driver removed");
 }
-- 
2.40.1


