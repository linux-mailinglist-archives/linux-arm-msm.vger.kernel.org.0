Return-Path: <linux-arm-msm+bounces-17882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376648AA43E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 971E2B21706
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0E7194C66;
	Thu, 18 Apr 2024 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sp7hzYh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0119067B
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473259; cv=none; b=LLzt/ybop/jccBWj3j+P6HmNVkzy6bEFLm3e/1E3bH4b3cKyxCXQ95tRsXt/wSsVWEQkgZd+ughpWS4S8Ofso4ZnJf0O41pdJgnu6dgbMBQcLEWx2ks38OVl4yH+JSPryC1AV1nNyfpYywf/mJ1to8GJe0Mtl+c4/Msjt/J2w8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473259; c=relaxed/simple;
	bh=wOZ29LhTx7wkAYOpITTHRSLIJcO3BmrsfUA3gU19uiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tvqIDAJGIPgdBRi1GwUJrnBqi2uxHtaDnnYynwPmWGa0xv3mA9bS+xuFor3PgXGPLX7l7nLfJ4kDnQruUs6st9V2z84IiRjKQgMRlVhM/MfkOck4VgohI5JvmAZAGpcCiXQjXGD5/uojoxo6Ot/3OYSvS3R/VG75L+hhprIX7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sp7hzYh/; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7da42caa377so18162739f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473257; x=1714078057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LzULljTo8+N+96QvC2qoioFAtmWDPdfpszoy4xuRkk=;
        b=sp7hzYh/vnpXl0kDurNytDvVYou5VVMG/nV/QX69u5/jedeyFyQTl8g9KWp/YGhLv5
         I2F6KhK6BxRs9k9TWVzV/o5k4VPyx/5iAcpWkcacotk61zD3qWTApwbiqbeKNXAMPKRt
         Ib55CzRsWP70QU7miXjUcPcGm1J9rgqlvvfc+pPaJf7AECop/HBng2uaZ1ceEoUmSSTn
         507zP0vzyPxWKlKAiTD9Tee5mhLdk6omuCKpGgwdBCjKod5TTDnw3mB+YZJiKn0rCIQq
         pmZAUSUM/1ghcCcY0flR8uJH6sDMhoXEjbBFwrUiWoBQ3Sr86CZ248PjQeLxMmeyHk05
         SCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473257; x=1714078057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LzULljTo8+N+96QvC2qoioFAtmWDPdfpszoy4xuRkk=;
        b=ZK0P6r7+iPiTBfIbfysXpzpUBLhCqAQaIBD1a/NdpaMEcWMw3iu7aiOaGFXTV3z4cq
         9ZUu34qgYwcqUYTcbF3uX2FurjZ9/qAsCJoTlULpX+KGFfoil8ziap1ZHlyJYq0eJWpi
         hZB4N9IC6qQ7v3hzAQC1vnssyOKkuZhxHxm3VBooFidgzDcKSRCwdKOi1f7IAQZbAFxl
         nGe1tnzLZ5A0X6w3xNzZFSi64wiDrzQvKYUmpQdR+ZnHe1H4DTtJlQnitHbLeYSxot1n
         YHY49T4QDEgtp0R5QSEhH4YhkBDkDWSmssbuTaSzNT2wRAd3GN6/vaf7TkPptaL61pN3
         a0rw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJda0U2T3iMwNv9C6yJYqD7gZMKsEvvcYJp8xjOfvybLiIHMWzCUs4OFO++YX1kzagtb6F8qWLiKhSRTMqzzRV9zQTqSCyWFfT1pXkg==
X-Gm-Message-State: AOJu0YxPhMIEvrPPYfrY20Cqr3qEcAsevCMZ6acTAc8P8SrcHrgtmrae
	uYJBDNaUyx1sS12vcc/DeXKFhXhPqAEFowmNPK7fhKLC3AviYizkrOOcob4wytk=
X-Google-Smtp-Source: AGHT+IF/8sENsUBtrRO5r7kTRYkTSjppW5lU/+XdQth1kzRoara79a8dQ3dQQLUx9E2VuyuprtPmOw==
X-Received: by 2002:a5d:9a9a:0:b0:7d6:5fb2:56bf with SMTP id c26-20020a5d9a9a000000b007d65fb256bfmr399803iom.11.1713473256983;
        Thu, 18 Apr 2024 13:47:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:36 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/8] net: ipa: maintain bitmap of suspend-enabled endpoints
Date: Thu, 18 Apr 2024 15:47:22 -0500
Message-Id: <20240418204729.1952353-2-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240418204729.1952353-1-elder@linaro.org>
References: <20240418204729.1952353-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep track of which endpoints have the SUSPEND IPA interrupt enabled
in a variable-length bitmap.  This will be used in the next patch to
allow the SUSPEND interrupt type to be disabled except when needed.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index c44ec05f71e6f..0e8d4e43275ea 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -37,11 +37,13 @@
  * @ipa:		IPA pointer
  * @irq:		Linux IRQ number used for IPA interrupts
  * @enabled:		Mask indicating which interrupts are enabled
+ * @suspend_enabled:	Bitmap of endpoints with the SUSPEND interrupt enabled
  */
 struct ipa_interrupt {
 	struct ipa *ipa;
 	u32 irq;
 	u32 enabled;
+	unsigned long *suspend_enabled;
 };
 
 /* Clear the suspend interrupt for all endpoints that signaled it */
@@ -211,6 +213,7 @@ static void ipa_interrupt_suspend_control(struct ipa_interrupt *interrupt,
 		val |= mask;
 	else
 		val &= ~mask;
+	__change_bit(endpoint_id, interrupt->suspend_enabled);
 
 	iowrite32(val, ipa->reg_virt + offset);
 }
@@ -246,7 +249,16 @@ int ipa_interrupt_config(struct ipa *ipa)
 
 	interrupt->ipa = ipa;
 
-	/* Disable all IPA interrupt types */
+	/* Initially all IPA interrupt types are disabled */
+	interrupt->enabled = 0;
+	interrupt->suspend_enabled = bitmap_zalloc(ipa->endpoint_count,
+						   GFP_KERNEL);
+	if (!interrupt->suspend_enabled) {
+		ret = -ENOMEM;
+		goto err_kfree;
+	}
+
+	/* Disable IPA interrupt types */
 	reg = ipa_reg(ipa, IPA_IRQ_EN);
 	iowrite32(0, ipa->reg_virt + reg_offset(reg));
 
@@ -254,7 +266,7 @@ int ipa_interrupt_config(struct ipa *ipa)
 				   "ipa", interrupt);
 	if (ret) {
 		dev_err(dev, "error %d requesting \"ipa\" IRQ\n", ret);
-		goto err_kfree;
+		goto err_free_bitmap;
 	}
 
 	ret = dev_pm_set_wake_irq(dev, irq);
@@ -270,6 +282,8 @@ int ipa_interrupt_config(struct ipa *ipa)
 
 err_free_irq:
 	free_irq(interrupt->irq, interrupt);
+err_free_bitmap:
+	bitmap_free(interrupt->suspend_enabled);
 err_kfree:
 	kfree(interrupt);
 
@@ -286,6 +300,7 @@ void ipa_interrupt_deconfig(struct ipa *ipa)
 
 	dev_pm_clear_wake_irq(dev);
 	free_irq(interrupt->irq, interrupt);
+	bitmap_free(interrupt->suspend_enabled);
 }
 
 /* Initialize the IPA interrupt structure */
-- 
2.40.1


