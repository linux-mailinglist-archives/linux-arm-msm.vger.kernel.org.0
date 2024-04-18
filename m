Return-Path: <linux-arm-msm+bounces-17883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E178AA441
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992461F22C41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B469E194C99;
	Thu, 18 Apr 2024 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0RM36eV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F6194C60
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473260; cv=none; b=CmJkRBuxhStXjfWEpR4RK81NQ+z8VYNcWMpNylgWi+0PH5IHhIPzr7Sl67dZr85w7P6kuRpywOKFjFbal2rhuWmp15g69HYrOLDhfurkzBlO1UpL94XHEUih1VNARcvnOVZ7aY/Sjt4tW2H7NwWDu8IKF+Q3qrKUMM42ECibLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473260; c=relaxed/simple;
	bh=SvZGld3nMQ7dE2gk0jttFi3f7Z56qPw6gijv/jWfvuw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqOULaryOA2cO60RdURfqV8243/hOylKzwJLN2KFSS/ci5srxtsB/NjwjyQx5Q0CyTdOslard71Y8k8wFLEJlHLJgO61Ib63YYYpEOkaQ1zjS2yeNMAJj4PGOXurhvXLQuqRj0CaeI9xSvaIjcS5tVk9V9sNrGW2wkT+7sy83uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0RM36eV; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-36b2ec387a9so4918265ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473258; x=1714078058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03uMyBMor63/6Po8Y4dDq22jgMVPIQliIIsTiCDwZ1I=;
        b=G0RM36eVMkq+RjztfcJrrLXdtJTC4PaLmDraFFWHHHi/4HPlMgtIo5twMGvrScXlNc
         kFptF0IzjrlRiZj1G4OAYZ5vIZiZE0JfgqEAsywmg4ybKYlZxPu1NVyX+5spN60MBcV+
         cHZ7rd0w3sdaVzJouFjHvVcw/974z/WP9gHnc6mRLXMgTrgbjSeWiVaxYS6DWLg1boQ8
         VIRrU03UyKNQZDXaacyLYJZEnQDcOvOAZ7hUY0D7CgFvY3Snd5LlwdRWai5aCgZU7GD+
         mrAm358TQafIC9SehdJ/C0ADS3eaxBWmk9mKjXYCMOlS7NvTe7KqA7srYOumD7qOSCpu
         FUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473258; x=1714078058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03uMyBMor63/6Po8Y4dDq22jgMVPIQliIIsTiCDwZ1I=;
        b=jjkvAD3OidgqE0FVRrrgNDr6sWY8A7ZujpPbEs3VmZI7m49JhysCBIPP5Bwct2eokH
         K2cYZlewLWjAfm4Kc2yqTd2L1rJw8kjDdBwCmkpBHoKVDUuDnuadq/KCQe5dRrdychH6
         yerPnctjZ3K8i2bnQ+ML6uKbGEkgDLoiEjXSPUR3uj386T9KRWClfyHpiECDfcfPzA4z
         WD+O+g1GhkXUcrWkDeDhuM5fhr3QpVnOOUBVr++38oQbUGMgCGxlVelg79rA83sNVTbe
         3gZPyzm63RtWbgAhUkoFE8InjijDxh3f+/jokL0ddZfwd/yHfZTeqLB5cy5KtkQ3ghQp
         1w1g==
X-Forwarded-Encrypted: i=1; AJvYcCXg1DQMiBGGJrrQrbI+uuZP7GOa7Wo3Nibfq66I1LEfraE/yUZF58A2IB2VHhxB6Btkh7lTLU+ptt0yGlOSbMiwrOc+3lSOwrysDeyiSQ==
X-Gm-Message-State: AOJu0YyPZD+aExRBeJqwl05qRm/2s0RdjUzKnANTOWDpnH51PKe9KPBS
	gg7VLYOaFp37jJGRdmRJvlb0a/JD32JxD3S+hzmTI6iVjyJmYHWgNStPherjjHc=
X-Google-Smtp-Source: AGHT+IHi9nm9iUmihVl+nUYkbY20SKDAPRl8ovl9feERHmDZj2/wHFbeuoMxKwaBgbMtCXTT0l1DLA==
X-Received: by 2002:a05:6e02:1aa5:b0:36b:3c05:7163 with SMTP id l5-20020a056e021aa500b0036b3c057163mr309979ilv.32.1713473258189;
        Thu, 18 Apr 2024 13:47:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:37 -0700 (PDT)
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
Subject: [PATCH net-next 2/8] net: ipa: only enable the SUSPEND IPA interrupt when needed
Date: Thu, 18 Apr 2024 15:47:23 -0500
Message-Id: <20240418204729.1952353-3-elder@linaro.org>
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

Only enable the SUSPEND IPA interrupt type when at least one
endpoint has that interrupt enabled.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c |  8 ++++++++
 drivers/net/ipa/ipa_power.c     | 11 +----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 0e8d4e43275ea..e198712d46ebb 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -196,6 +196,7 @@ static void ipa_interrupt_suspend_control(struct ipa_interrupt *interrupt,
 	u32 mask = BIT(endpoint_id % 32);
 	u32 unit = endpoint_id / 32;
 	const struct reg *reg;
+	unsigned long weight;
 	u32 offset;
 	u32 val;
 
@@ -205,6 +206,10 @@ static void ipa_interrupt_suspend_control(struct ipa_interrupt *interrupt,
 	if (ipa->version == IPA_VERSION_3_0)
 		return;
 
+	weight = bitmap_weight(interrupt->suspend_enabled, ipa->endpoint_count);
+	if (weight == 1 && !enable)
+		ipa_interrupt_disable(ipa, IPA_IRQ_TX_SUSPEND);
+
 	reg = ipa_reg(ipa, IRQ_SUSPEND_EN);
 	offset = reg_n_offset(reg, unit);
 	val = ioread32(ipa->reg_virt + offset);
@@ -216,6 +221,9 @@ static void ipa_interrupt_suspend_control(struct ipa_interrupt *interrupt,
 	__change_bit(endpoint_id, interrupt->suspend_enabled);
 
 	iowrite32(val, ipa->reg_virt + offset);
+
+	if (!weight && enable)
+		ipa_interrupt_enable(ipa, IPA_IRQ_TX_SUSPEND);
 }
 
 /* Enable TX_SUSPEND for an endpoint */
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 41ca7ef5e20fc..bdbcf965d5a30 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -234,21 +234,12 @@ void ipa_power_retention(struct ipa *ipa, bool enable)
 
 int ipa_power_setup(struct ipa *ipa)
 {
-	int ret;
-
-	ipa_interrupt_enable(ipa, IPA_IRQ_TX_SUSPEND);
-
-	ret = device_init_wakeup(ipa->dev, true);
-	if (ret)
-		ipa_interrupt_disable(ipa, IPA_IRQ_TX_SUSPEND);
-
-	return ret;
+	return device_init_wakeup(ipa->dev, true);
 }
 
 void ipa_power_teardown(struct ipa *ipa)
 {
 	(void)device_init_wakeup(ipa->dev, false);
-	ipa_interrupt_disable(ipa, IPA_IRQ_TX_SUSPEND);
 }
 
 /* Initialize IPA power management */
-- 
2.40.1


