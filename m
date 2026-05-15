Return-Path: <linux-arm-msm+bounces-107978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAd2EjevB2qrCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7AC559659
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FD86301F5D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0BD3F86FC;
	Fri, 15 May 2026 23:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbcc/ABJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0938D3EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888494; cv=none; b=VqR57Rz8UZ/rKIqiBf1iCMEMqWdBJ/2GXKCSGj47Ti0iIlzasi7bx1cH2oRyYTlUINUAccounc9HANAt8elHnNJQ23dGCA87yQjJDmeaBr5ohCEDaiXXW/BsqsoMJKlNKspa/y1LKItidp9yJ5DCsbAJgoyqIOv+gt5OE1fRDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888494; c=relaxed/simple;
	bh=rW5n7OqbSCAqxVhlwKXH9xQUGgQISNsL2fWviW3pC1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKr+qIovKAgs+Y1d74L1aKzXLeOl96xNnbhquLWvlyY9rDdl7PjMGhFnm4LSd7wutzrZhMe42MbQVYjpjyy6FP11VReoqcc/evFa4S24QUUH4qbW86tE0YEb1CFpyaFVMZTDQN2PuZtwRrAgbahEbE/CuntrPKJ9fHv+vhiAQzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbcc/ABJ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38ec6e3de84so608021fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778888491; x=1779493291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKAOTSOlzS3MEHwcMlGimMeAY+aTNXac4GDWI+Xw68c=;
        b=vbcc/ABJmUb0mQ9J4gbqCau2XP8jJ+N11i+s6OA1qYdtipxq+1R8YmTjKiI31HVkG4
         +KtoXaVUYA2NzDdo6EaRF6xwi3kujihU2rIP2ILOw805fbNdlH+w7oP5goVpidcsFVdM
         w4lW7NVf1PS55cpvNUU1+0ZnAyR5nLoPQNY+qH6RsZWJ4HD6RpzJrnVmNb82w+n6XAFm
         fvakLmr0Oxrzlxh5JriBwc715Y5EvCIDbas0OdN11tsPEjhn80CApBxRkaRjqTUfRz9n
         4PDnBPlBMsT+g9Dee4wSQ77KXK1SXu+U+OZKSPJw1HaFCo5fD6/wMuP0S9s+kmq0VKFi
         R1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778888491; x=1779493291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKAOTSOlzS3MEHwcMlGimMeAY+aTNXac4GDWI+Xw68c=;
        b=qhGn/4fFgQDOpGXacrxuHCs3JtIQj4CczL4WNtUkUqvBBIsW9Rl7nr2nEdzS1vqA2S
         pL2z4bqnti3MEWaMuO7BSQAt1aM2N8yAp83G/CGqFylFrgHr9f+54Inwr3QfX3ZFPwXq
         OwBnAbMub5wfYhamcfHUyk/7iOHvwMiLWJOW+9RNTag5hKb7riAGUQ0Ip4XEvUHF1uJx
         yiuWSKT2g0VH86plVr3SNZ1WS4ajI/g73UZyvwa2fO2lsTDwi8pSmiJ4VE7aQl9dvKSK
         9VPEeRGxb9IC+Pb5AoNgSIdUFYya7lZdE8FMPl9ZAS1t+7FPmcyUa3ixHBTBznNQaRUv
         x9hg==
X-Forwarded-Encrypted: i=1; AFNElJ/Tg9mjfcRqq13YUCqcek9CYLTHCbjy7kbO7Ct1OKkhC47Il8dXB6zcxpZqDZmeflbXyWvrOmsINeswarba@vger.kernel.org
X-Gm-Message-State: AOJu0YxhU2WeMHs8B99PWFhZ9BlmJ05PjQihMgfk63Ae/fAfe81x2ONo
	/5K8LkQ5RZkxug99Jm8IcioIaSAVmO0Z2ti95vdvHPxVNpfPtU8Yk4ikvwebMItpPqc=
X-Gm-Gg: Acq92OGMKJhSaCO5V6C8dAvOWDepYLpVmHJPScYd4g193yMYJ+LyfdB8zg3FnUhL8GY
	zwYB89M637Luxec8Cf4P5ej8AulYUqPVv+bmOPUa0jvZEMg5BgH+3GE3tFrHqJYMiqi2CBCNS7Z
	RTKl9FO0+vPkRFRIiEa49uDPhANys2yMWYA3qYqUOVvSsvP2oNbv490qTGHQJcmff52l5G3/wZR
	LBCrhih7R9DmXRDNTbwRu1VWbz5z+7VD3nOcyQwnDH/241/ZOU9YfBxeckSOOeYMW4c3nhj0Qd8
	f/Ki56LjX8TJEafmYrOLeb3Vvj1kEsYWYAbcMBAASi7WF0xridQ0xIjbJkemTy7PqjsfVcGnNit
	do5+lJPLt3YyEGw+YDjxzl1q4yPrb299IQZVi/Y1pLciEDBCTx1bywTDWcVuNA4EOQkNTYMdxhw
	pPcncRA8OqjLWdoU2CcMQbHK77dxDZd6/cW50/iFKeRCMM4VZgYZUdQe05vxpHTwc4yg==
X-Received: by 2002:a05:6512:3409:b0:5a4:1099:b16a with SMTP id 2adb3069b0e04-5aa0e5d8440mr743152e87.0.1778888490651;
        Fri, 15 May 2026 16:41:30 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c710sm1631384e87.7.2026.05.15.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:41:30 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/4] i2c: qcom-cci: Move cci_init() under cci_reset() function
Date: Sat, 16 May 2026 02:41:20 +0300
Message-ID: <20260515234121.1607425-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EA7AC559659
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On probe or runtime errors cci_reset() is called and it should be coupled
with cci_init(), instead of doing this on caller's side, embed cci_init()
directly into the cci_reset() function.

This is a non-functional change, cci_reset() and cci_init() function
bodies are reordered.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 41 +++++++++++++++----------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index be41a53e30c6..2d73903f14d3 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -225,24 +225,6 @@ static int cci_halt(struct cci *cci, u8 master_num)
 	return 0;
 }
 
-static int cci_reset(struct cci *cci)
-{
-	/*
-	 * we reset the whole controller, here and for implicity use
-	 * master[0].xxx for waiting on it.
-	 */
-	reinit_completion(&cci->master[0].irq_complete);
-	writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
-
-	if (!wait_for_completion_timeout(&cci->master[0].irq_complete,
-					 CCI_TIMEOUT)) {
-		dev_err(cci->dev, "CCI reset timeout\n");
-		return -ETIMEDOUT;
-	}
-
-	return 0;
-}
-
 static void cci_init(struct cci *cci)
 {
 	u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
@@ -286,6 +268,26 @@ static void cci_init(struct cci *cci)
 	}
 }
 
+static int cci_reset(struct cci *cci)
+{
+	/*
+	 * we reset the whole controller, here and for implicity use
+	 * master[0].xxx for waiting on it.
+	 */
+	reinit_completion(&cci->master[0].irq_complete);
+	writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
+
+	if (!wait_for_completion_timeout(&cci->master[0].irq_complete,
+					 CCI_TIMEOUT)) {
+		dev_err(cci->dev, "CCI reset timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	cci_init(cci);
+
+	return 0;
+}
+
 static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
 {
 	u32 val;
@@ -302,7 +304,6 @@ static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
 		dev_err(cci->dev, "master %d queue %d timeout\n",
 			master, queue);
 		cci_reset(cci);
-		cci_init(cci);
 		return -ETIMEDOUT;
 	}
 
@@ -609,8 +610,6 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
-	cci_init(cci);
-
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_active(dev);
-- 
2.49.0


