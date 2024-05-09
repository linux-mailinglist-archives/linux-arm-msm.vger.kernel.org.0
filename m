Return-Path: <linux-arm-msm+bounces-19601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BEC8C14F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 20:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C294B2204F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 18:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1342B7F7C7;
	Thu,  9 May 2024 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VezJEGLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B57EEF3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280094; cv=none; b=mLmItzpXs5Sksj1pEXBVhIcexCEA9bazbx43kES++Jws6OaGQUFvlsiV4dBroVNC0hGA09/PSEqeT7HrQAFrRN9Lz5thT5TnQi7GzHNQPZJjGOUSW1Z6oPb+gdKtLBZg64RBBNhqYarbceijoBOhVG46NaulXM+dNI46sCqKWMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280094; c=relaxed/simple;
	bh=7ATk15QdB/S5pmSsD6KGzazuE/GKwaK5QgCjJGDzFlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACZ/0LIAGBIGbpLxt6J/EzZFEFJiH7fIDLKl5M6f/zzCtorn6vszE7WCgdMcojx/BAHJ6FPhVXRQI2ZhQLDr132/hjyVlse4F1LyIvYY6dOYNYLZcji5GLe7NziIoooDj3iot4YWFmqUGfv09NDb27f1+zQ6dFbX+JhxgBSLhOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VezJEGLA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e3ca546d40so9989005ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 11:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715280091; x=1715884891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbK4EEbe0hcgx1L+Qk+amL1rZ7gk1BOQN0FHx81DIZc=;
        b=VezJEGLApANFh9JbDBmg7UgsEHFxvPumB3/+g1EHz/1vTD9taJpNAz29yWInuasd3h
         p/fF9hThrvcMfGSGxtuzSrsf3xxh/mOdHDZ0RBL7RRwBydyubwlgS5vTpuFX1MhLhn2Y
         PHldBQVRrgI6li4KTY9mla+MboxwpQsEZEfQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715280091; x=1715884891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbK4EEbe0hcgx1L+Qk+amL1rZ7gk1BOQN0FHx81DIZc=;
        b=B++9OLeiyaSL3kVP8K4yUXtlpC240natDCnbW0Wevok+dViY7jmz1K932xNS23l6li
         cPL7h4GHJT0gcqon4/kLUgqJjOyuTNTRQHsvELhdFUdYbP1a1tXGI6Wa1YE+NgtIZJEJ
         IU0PbwKoOIHTkJFIwa5p1pB+jq+5faDrR0iAwzkT068++pSKr7L0/39LcB68CApxgyQd
         7RYykHWio3VNrdpfaJCrVGOTfNzBrU931JaUakri1B5L4UHYds+Pqaxx5bedFu/ZWIE2
         aK5/Auw8iFUkcLsazn+hIIrKLHtBIhyXqKvf5c/daklIQS0S3qGn/OkIrfp5qDlKYLZo
         75NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWttHsJJSp44sjcEjsjOCu5xD3A3kjY6WilZNAakXBU4+n6bj/c1br+35FlQ5oDJczHOnEzGlNIixJjlkNb3Btw8XsMbrehFqCrnoKuQA==
X-Gm-Message-State: AOJu0YwyjJbW6SZQ3/l0d8d99cFtr6/Ypbi03TTBMC2kiOKKb9XvOrdd
	lnAwQDiCGd0LdgFcHuymLvB+MQKIo6dU3bdpvHLOpEvHPQYitF9Y0XqJNelySw==
X-Google-Smtp-Source: AGHT+IEBLu7hk4BBeGG3wbznANriJSjMk4kzbAb63zB+bN0rkgoA0AZC4i4t3YoYXORKce9BUP+Htw==
X-Received: by 2002:a17:902:efca:b0:1eb:ed2:f74c with SMTP id d9443c01a7336-1ef440596b4mr4519385ad.67.1715280091590;
        Thu, 09 May 2024 11:41:31 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1ef0b9d40c9sm17904075ad.49.2024.05.09.11.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 11:41:31 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
Date: Thu,  9 May 2024 11:41:28 -0700
Message-ID: <20240509184129.3924422-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dan pointed out that Smatch is concerned about this code because it uses
spin_lock_irqsave() and then calls wait_event_lock_irq() which enables
irqs before going to sleep. The comment above the function says it
should be called with interrupts enabled, but we simply hope that's true
without really confirming that. Let's add a might_sleep() here to
confirm that interrupts and preemption aren't disabled. Once we do that,
we can change the lock to be non-saving, spin_lock_irq(), to clarify
that we don't expect irqs to be disabled. If irqs are disabled by
callers they're going to be enabled anyway in the wait_event_lock_irq()
call which would be bad.

This should make Smatch happier and find bad callers faster with the
might_sleep(). We can drop the WARN_ON() in the caller because we have
the might_sleep() now, simplifying the code.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/911181ed-c430-4592-ad26-4dc948834e08@moroto.mountain
Fixes: 2bc20f3c8487 ("soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free")
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 7 ++++---
 drivers/soc/qcom/rpmh.c     | 1 -
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a021dc71807b..568d0b8c52d6 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -645,13 +645,14 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 {
 	struct tcs_group *tcs;
 	int tcs_id;
-	unsigned long flags;
+
+	might_sleep();
 
 	tcs = get_tcs_for_msg(drv, msg);
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);
 
-	spin_lock_irqsave(&drv->lock, flags);
+	spin_lock_irq(&drv->lock);
 
 	/* Wait forever for a free tcs. It better be there eventually! */
 	wait_event_lock_irq(drv->tcs_wait,
@@ -669,7 +670,7 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 		write_tcs_reg_sync(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
 	}
-	spin_unlock_irqrestore(&drv->lock, flags);
+	spin_unlock_irq(&drv->lock);
 
 	/*
 	 * These two can be done after the lock is released because:
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 9f26d7f9b9dc..8903ed956312 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -183,7 +183,6 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	}
 
 	if (state == RPMH_ACTIVE_ONLY_STATE) {
-		WARN_ON(irqs_disabled());
 		ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
 	} else {
 		/* Clean up our call by spoofing tx_done */

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev


