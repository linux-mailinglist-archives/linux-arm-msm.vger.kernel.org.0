Return-Path: <linux-arm-msm+bounces-14751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726F885AD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 15:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C50F1F22E87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 14:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACD02BAEF;
	Thu, 21 Mar 2024 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="ZXKNLi5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DBF1E53F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711031439; cv=none; b=oPG4J+KE9lWFeSpsk8eyiszSoHw2Dyme/gH37uMX5cZvy6BDAsU/Q1JeJLXzSbujxz8+qsqmx9yodxckhqwVRvo0xxTLeMGDtNEjaLwcq1HAypCYkHHBAbn5UiiMq4LYwmx1D0X2KC5wSPZSJry629DtZWc7zCtzEkJCw8AAJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711031439; c=relaxed/simple;
	bh=ZEnKwn1pljAqClK9lIpYqWnyIzvmySMS+ZtbJrW7WEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NCsWGGcGIc4DHQU0dWUFn6FiN6pexPQreamL6UAlaxw9luj2zwxSR1CXWbYpTWDwjdn3BOnoQ5x/F5DXOfrnCq5heRUM3mZmF07PIhPRF0DIz9pa94wvtm2keDB6IRD9S2YcBxCVFWECA368hVZTqy/diabJHgGiuuAEVcLXM3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=ZXKNLi5v; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51381021af1so1675957e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1711031436; x=1711636236; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltbLavQ5SUcMxu21+LjsrYSC7bOM0HmRwXGhQIaGSpM=;
        b=ZXKNLi5vGx6Qqqes3qPNtWUHuCIKDp8+7Z1VVaTrEHkrjC+89N+b6izkKcmm3UwSfR
         06JaCoV83MtzMFboXuVBoljyI/096EMzcSmxLr/ZEEjmzpu8OBh0nbktWf57qB+ChLXw
         Ss96gZuYXh/wNKsKVGa1SRo9b4Ovi+QXlm9ux1/STsExfpqpaD8V080eKLNjm1DzOdLZ
         i6rIWLAMDoQkO2WEQ/MTgGiVfHbAIKVl5k9HMhqlWXtLGDTzVY1SJ4FIeESrKj0yJpma
         jetcPWmO5v2zBX6T8MoBGN/bPgaTIg1uB+V5maNhvu3fQQY0CLDQC7nutwDRDJyeytcL
         FBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711031436; x=1711636236;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltbLavQ5SUcMxu21+LjsrYSC7bOM0HmRwXGhQIaGSpM=;
        b=LpIfpjDrwDKqp+Nid4/YpZGQ2bALTIPYZryUEPNoZoovBaIYOK2+gu5Rov9TwJq4Yx
         kmwVYnpKN2czIpFaPpIeNDhUmDk75tToPRYjiFtHA6GP5vgtzPgXkjy8+yFv95CO+lck
         R59cOjEBPyr6bdwovkFEbUG//d44P5gUDDps04plqyUwKTwEqd3HMVBmV6Rb4zWYEDhv
         rzbBhgWILl10TQv6wvs3a2wVTRYcMI55DbqOGkOfAKV0zHs7LsxL06ae7GVFmzF4kXSm
         9zXwYnoNE1x2Zl8XasklXA9l2ZuKpBTOOw7vCFFMQTrMUYFIfWmq6SXQlJjeuYe0De+7
         +ZYA==
X-Forwarded-Encrypted: i=1; AJvYcCUijO5YUSj7UAdb2JQx0B8fFpZFfl+bZ+0UhEeSeYq2Mh/yn64rWS68Xw/vAqCZZ0WmsP08va/YVoLYoEqlzsu9pvFSHoSoTK0IQNyoFw==
X-Gm-Message-State: AOJu0YxS5Z6yqjolCB1SO0andmgScPx8t9koHHzNPDqPSP4OiKQYZrZK
	JTFFNVI6P4OKVq8b3XH/jrklxo/Livq/YX0iTYP/xgS8MB99ms8wtgi6X3we3l8=
X-Google-Smtp-Source: AGHT+IGtiSfxAmmmSwcgiI4O8Un0r0P1k50Fzz5fGBX+0wUWSXNGcbRyG3rdADr57MC+iqV+aU+PPw==
X-Received: by 2002:a19:2d05:0:b0:513:cc7e:9919 with SMTP id k5-20020a192d05000000b00513cc7e9919mr1987885lfj.7.1711031435740;
        Thu, 21 Mar 2024 07:30:35 -0700 (PDT)
Received: from [172.17.0.10] ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id b17-20020a17090636d100b00a47090964casm993330ejc.184.2024.03.21.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 07:30:35 -0700 (PDT)
From: Mantas Pucka <mantas@8devices.com>
Date: Thu, 21 Mar 2024 14:30:01 +0000
Subject: [PATCH] mmc: sdhci-msm: pervent access to suspended controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-sdhci-mmc-suspend-v1-1-fbc555a64400@8devices.com>
X-B4-Tracking: v=1; b=H4sIAGhE/GUC/x3MQQqAIBBA0avErBtQk4iuEi1Cx5qFFg5FIN49a
 fkW/xcQykwCc1cg08PCZ2rQfQfu2NJOyL4ZjDJWDUaj+MMxxuhQbrkoeRxssFvQXplphNZdmQK
 //3NZa/0A/rL1Y2MAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Ritesh Harjani <riteshh@codeaurora.org>, Georgi Djakov <djakov@kernel.org>, 
 Pramod Gurav <pramod.gurav@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mantas Pucka <mantas@8devices.com>
X-Mailer: b4 0.13.0

Generic sdhci code registers LED device and uses host->runtime_suspended
flag to protect access to it. The sdhci-msm driver doesn't set this flag,
which causes a crash when LED is accessed while controller is runtime
suspended. Fix this by setting the flag correctly.

Cc: stable@vger.kernel.org
Fixes: 67e6db113c90 ("mmc: sdhci-msm: Add pm_runtime and system PM support")
Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/mmc/host/sdhci-msm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 668e0aceeeba..e113b99a3eab 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2694,6 +2694,11 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned long flags;
+
+	spin_lock_irqsave(&host->lock, flags);
+	host->runtime_suspended = true;
+	spin_unlock_irqrestore(&host->lock, flags);
 
 	/* Drop the performance vote */
 	dev_pm_opp_set_rate(dev, 0);
@@ -2708,6 +2713,7 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned long flags;
 	int ret;
 
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
@@ -2726,7 +2732,15 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 
 	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
 
-	return sdhci_msm_ice_resume(msm_host);
+	ret = sdhci_msm_ice_resume(msm_host);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&host->lock, flags);
+	host->runtime_suspended = false;
+	spin_unlock_irqrestore(&host->lock, flags);
+
+	return ret;
 }
 
 static const struct dev_pm_ops sdhci_msm_pm_ops = {

---
base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
change-id: 20240321-sdhci-mmc-suspend-34f4af1d0286

Best regards,
-- 
Mantas Pucka <mantas@8devices.com>


