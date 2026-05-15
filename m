Return-Path: <linux-arm-msm+bounces-107943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOaXHCU8B2ottwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E316552269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA7AD3063C40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F571492185;
	Fri, 15 May 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cE/p4Uxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEDD48B388
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858413; cv=none; b=MslIpyWuYbgIbYJXUc+N+fDNokcLoR3TnqoYNqWIAQnmzTHxS+kqQYV69Kv/bgFmtrfmO5yyFmJmJTsreNnuS4jPTSitZ4Qxx5QiUbw94hxvj/d0/NPvutao7taiidtPvoYRN6L5xPg18pEPBS74a4rQKYPodAUDH0dWFTBasns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858413; c=relaxed/simple;
	bh=rW5n7OqbSCAqxVhlwKXH9xQUGgQISNsL2fWviW3pC1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h417E7rSYXWNyRIDVONMa4vMKs3dt5iyTusS2YEKOZi4swF23qdkAgq/Rrpk0mnLsmeQs4GzEv3IlhCl3v37gQi6Nxzs16pGENC7aAV5stBknJ3DxcNZv0SxAFuuFJtV+w5qInU1qvAJr+jHPBuOs3R0xlYywkMU9oSXSe4d7n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cE/p4Uxh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8c0c19195so474605e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778858408; x=1779463208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKAOTSOlzS3MEHwcMlGimMeAY+aTNXac4GDWI+Xw68c=;
        b=cE/p4UxhFZbRDvdzgriOqqlKmxZmcfVDDLIRopCdehFdQySuv0mVnVkbngigwqm70B
         H1dwJRqKp4/TngP0Ma0aYm8A4R0vnP3nOTndTOKhnpbbAd78sZTNLef6E+bo79/Am9Tr
         xFUNxg99E6WxjITm4kXE6XI6tWksO6LuRXgG+B0UtQRHT2tJUtteG+nw9ZdpP/VnzTxJ
         jfMm8wvY7nC8hSsAhsEKZGgVNy7kra01PgaGBYfAEgBV/bKyewmFF7OEbFjtZXxl5kRj
         v8ZFThsBB4csQ9Va6Oc4B9OoYlzXLEcRxqw6wcsPiSbHlNcqSN1XwITFgE/85RU/Jgy/
         XHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858408; x=1779463208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKAOTSOlzS3MEHwcMlGimMeAY+aTNXac4GDWI+Xw68c=;
        b=UqWUcXUU+JTVng8sca2TRfBvN6nz8qLCs/kmR//WNwQ09ypOQqbREVKY+EuoqAo/AI
         yXMg0T3MkSlVT1IEJ96kYW9LaYoqAFP0VboYfc5SRPENbc5kSeNbMW0hRufoPCiWxNn9
         LEsJ+LrHmTLhD+tSfbfGX983Qm2EzlzoGTEhX59Eym15FluL4bk42sVYjMID0ar5QdH/
         KU7tcZCisavRNeca/1DRpANg2NK6oupGU5j4++PA8XJEYMqk1U/F7QITQs8C9UVJSJ+a
         app+IOEW/6qOYejXhNiq0O07ghoqUYiqZp7TS8jh3a2YllcYIcXbLZzTRFG64A0SEn1b
         rXIA==
X-Forwarded-Encrypted: i=1; AFNElJ8YWAKBMd19l3OaIWyjX37jkrIlVZkDmSBPwGECUB1tilhEhp7LSWK2xp1Gu/mgJXoVzISc/JdqIvnwd/WR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrkm67ZDCZaGfUnamgn8bBHZqcuikjfYVXjgTvTEeWj2anqyig
	23E7sJYgn0y2N35leuBFWpjWZoQ74kB5AYhcPwciYxHdKBHlcQwgDIq/h9sp3KjYzcI=
X-Gm-Gg: Acq92OH/XYqcBWFo3HdxmAQOOzKpmYXH0xThJu8eUVvFj2Wq/djvUIe3801YpVOMYOZ
	VfjUlLIRNbSrxaKfnFpSKtGETgfISuIWOGrmgC6ve56u+aQQW7naslcGVn7xk6DyifGPSzcBnRK
	Z9K2fSt6cZs9TUXcHOYmcc4TgnR6bePuzLc9X129DYMPZ8aiqhN3gPUPSIuaEos5HBup4vNmNpR
	EAxkWsGQWcWgVVlkmPDniooex/mxd7+UknbVul8rcRtlWW8hKlpCxx4LZOCG+7OTUb7ARX+f7RY
	u5v5ipN4QQ+ZOfg2siJiqWjJo9nr1hHYJXdpE9RWb5dnSt4vOuYZKwahuiDwV+PtDbUam+NyL/X
	EV+mYnK3WFPaW/z+T0hJjc6sQ3knpWv5MpTCvWi7HEqPvOlZGxotC7h2QkF3S+/vLkpBqNY9uXv
	O9DgiVxRrb24Wi4kSR43IvZ5mxMS7hXpmC6AmU9xvORW2UDcFzzhUWNvfv0BuhoMTlGw==
X-Received: by 2002:a05:6512:1254:b0:5a8:7c42:bebe with SMTP id 2adb3069b0e04-5aa0e97f14emr666583e87.4.1778858407611;
        Fri, 15 May 2026 08:20:07 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm1392418e87.43.2026.05.15.08.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:20:07 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/4] i2c: qcom-cci: Move cci_init() under cci_reset() function
Date: Fri, 15 May 2026 18:20:02 +0300
Message-ID: <20260515152003.1604187-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
References: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0E316552269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107943-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim]
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


