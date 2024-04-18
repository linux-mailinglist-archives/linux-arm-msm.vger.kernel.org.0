Return-Path: <linux-arm-msm+bounces-17884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FC8AA445
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9FC1C22727
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC85199EA3;
	Thu, 18 Apr 2024 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbKW/29n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E82194C8A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473262; cv=none; b=FnRNLiqkRk7gDhZNMh7KFYcNAOOheYhAPT9W/UrVbeCyTvbo9cPNM7a8Aa2BzPVGC4RGYkp+j+YvAkYsaNyCVvlO3heU8cy3Bn7jAmmmxZI3Tx5VOFwnn4R/llb6DSNAHxGTaWUArRgIX4Omil2AXHi1/Jgbi71uuP63L1I6Gv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473262; c=relaxed/simple;
	bh=my3ly2Wt8vx7EPER+SS+EO/A3WGEO8ar2dDMeRrSXqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WIb364AwEQli6FhgkabWI4YyGnLdNdfZfm0Xfh18TdzMGmncXqdkZVJJn4zWhxjTQ5UErTjP272OcLMefM9F9Q3mUzVv2+fgfXUA2eat6usFYhEOVEdkMO/kqEswmNIYslbr+BkB0E7zuE+zKqkgl91J0MxGIqdyXoZyIFmZSXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbKW/29n; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36a17999886so5321655ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473259; x=1714078059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFdFgfCb4QOPydRGJlzZ64gSPyRyXCV7EEtNqm4BTfY=;
        b=AbKW/29nNF7+Qsr8Gn2DcHE4JSwEwYEs5fgbAVEiOvl8Iz4xeDfydcSQWKeLy/3Anw
         /h2VhME0gHtTaL4yM/AeQFWVr3aEdEYy6XNdH2W4WSciHLWXqpci5E1A4y2OpNsD1fuX
         8htgsCzbBLMjYIW/WbSa+JhySOvzixVVuSDRYJAajBr2JmtBknF+H2ve6EuFj5UOd+FF
         micIqPMcRgQ3xsDkvehPVujNoEVFBBfeJ3iPaL0e+Cwc78doTiihJ26+kIp3SmpGYTma
         ajT/AHAflZ25kY4TpoWKRRJpTzZxSCpLyVIgaH0nmazeAZPmnnbhXOFHVel90fGhPxCn
         cv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473259; x=1714078059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFdFgfCb4QOPydRGJlzZ64gSPyRyXCV7EEtNqm4BTfY=;
        b=NjQzFoAPfUlQ3CVFM7lQRxG0Vw604PrasdJFlnqXyW3qy8WtLiYXHHpphjz+9Bu3+J
         BPdLywA8MYVJ4wWVn6LpmHpY7LWXt4whHuItmJ6ZpTMQja3w71z2uZ51KOd6AcRZ6o7O
         svcHeyEIm6QT4+0V86T/KgUzUAuQefn6gy0Afs3L58izoSKunipi0g/jVq3tAdy/WElC
         EGHr/BIZVwqohI54EwZS2jMT2EDJm4k2myvV01YSBfucEr2qT2ii1srn2G9AHHTzW2o4
         U4OvNe0u1JekRj4AoaHsCj8eueH15R8UwyNm6xSmeAgE/+BQTWfs7tnYuArofYyd8Pnk
         8NDA==
X-Forwarded-Encrypted: i=1; AJvYcCUESiN0N0JlJSehXEZtjsxfMzTy+EzodT/IOc+r1FYDfoMc4XLrkFZB35MUJ21e/2rnonThNOpGiVUEppOnxT5N/181faFlEYVcZtce2A==
X-Gm-Message-State: AOJu0Yw+keVuODyhSq8kvvGbCR4cQJ9eBuKq0x506H4+PQBhG7nJzBaY
	/B4EC0vrFdRupal50W+M8fHi/GTtEa+ZGCz87EUnmRD6uCQ+yLz4bmFVRT2bSbY=
X-Google-Smtp-Source: AGHT+IEVvi8jk4ox6CtFUWga062IqyvpAfeDY8vVQOMWIqClYhZqkkPQVN715E8NcqDiYKetdI1f6w==
X-Received: by 2002:a05:6e02:1ca3:b0:36a:b4f3:7731 with SMTP id x3-20020a056e021ca300b0036ab4f37731mr361266ill.7.1713473259548;
        Thu, 18 Apr 2024 13:47:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:39 -0700 (PDT)
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
Subject: [PATCH net-next 3/8] net: ipa: call device_init_wakeup() earlier
Date: Thu, 18 Apr 2024 15:47:24 -0500
Message-Id: <20240418204729.1952353-4-elder@linaro.org>
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

Currently, enabling wakeup for the IPA device doesn't occur until
the setup phase of initialization (in ipa_power_setup()).

There is no need to delay doing that, however.  We can conveniently
do it during the config phase, in ipa_interrupt_config(), where we
enable power management wakeup mode for the IPA interrupt.

Moving the device_init_wakeup() out of ipa_power_setup() leaves that
function empty, so it can just be eliminated.

Similarly, rearrange all of the matching inverse calls, disabling
device wakeup in ipa_interrupt_deconfig() and removing that function
as well.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c | 11 ++++++++++-
 drivers/net/ipa/ipa_main.c      |  7 -------
 drivers/net/ipa/ipa_power.c     | 10 ----------
 drivers/net/ipa/ipa_power.h     | 14 --------------
 4 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index e198712d46ebb..a9a2c34115b5b 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -277,17 +277,25 @@ int ipa_interrupt_config(struct ipa *ipa)
 		goto err_free_bitmap;
 	}
 
+	ret = device_init_wakeup(dev, true);
+	if (ret) {
+		dev_err(dev, "error %d enabling wakeup\n", ret);
+		goto err_free_irq;
+	}
+
 	ret = dev_pm_set_wake_irq(dev, irq);
 	if (ret) {
 		dev_err(dev, "error %d registering \"ipa\" IRQ as wakeirq\n",
 			ret);
-		goto err_free_irq;
+		goto err_disable_wakeup;
 	}
 
 	ipa->interrupt = interrupt;
 
 	return 0;
 
+err_disable_wakeup:
+	(void)device_init_wakeup(dev, false);
 err_free_irq:
 	free_irq(interrupt->irq, interrupt);
 err_free_bitmap:
@@ -307,6 +315,7 @@ void ipa_interrupt_deconfig(struct ipa *ipa)
 	ipa->interrupt = NULL;
 
 	dev_pm_clear_wake_irq(dev);
+	(void)device_init_wakeup(dev, false);
 	free_irq(interrupt->irq, interrupt);
 	bitmap_free(interrupt->suspend_enabled);
 }
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 57b241417e8cd..59e7abb4a0d19 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -120,10 +120,6 @@ int ipa_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = ipa_power_setup(ipa);
-	if (ret)
-		goto err_gsi_teardown;
-
 	ipa_endpoint_setup(ipa);
 
 	/* We need to use the AP command TX endpoint to perform other
@@ -170,8 +166,6 @@ int ipa_setup(struct ipa *ipa)
 	ipa_endpoint_disable_one(command_endpoint);
 err_endpoint_teardown:
 	ipa_endpoint_teardown(ipa);
-	ipa_power_teardown(ipa);
-err_gsi_teardown:
 	gsi_teardown(&ipa->gsi);
 
 	return ret;
@@ -196,7 +190,6 @@ static void ipa_teardown(struct ipa *ipa)
 	command_endpoint = ipa->name_map[IPA_ENDPOINT_AP_COMMAND_TX];
 	ipa_endpoint_disable_one(command_endpoint);
 	ipa_endpoint_teardown(ipa);
-	ipa_power_teardown(ipa);
 	gsi_teardown(&ipa->gsi);
 }
 
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index bdbcf965d5a30..881bf9147b190 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -232,16 +232,6 @@ void ipa_power_retention(struct ipa *ipa, bool enable)
 			ret, enable ? "en" : "dis");
 }
 
-int ipa_power_setup(struct ipa *ipa)
-{
-	return device_init_wakeup(ipa->dev, true);
-}
-
-void ipa_power_teardown(struct ipa *ipa)
-{
-	(void)device_init_wakeup(ipa->dev, false);
-}
-
 /* Initialize IPA power management */
 struct ipa_power *
 ipa_power_init(struct device *dev, const struct ipa_power_data *data)
diff --git a/drivers/net/ipa/ipa_power.h b/drivers/net/ipa/ipa_power.h
index 227cc04bea806..df93b07415f2a 100644
--- a/drivers/net/ipa/ipa_power.h
+++ b/drivers/net/ipa/ipa_power.h
@@ -30,20 +30,6 @@ u32 ipa_core_clock_rate(struct ipa *ipa);
  */
 void ipa_power_retention(struct ipa *ipa, bool enable);
 
-/**
- * ipa_power_setup() - Set up IPA power management
- * @ipa:	IPA pointer
- *
- * Return:	0 if successful, or a negative error code
- */
-int ipa_power_setup(struct ipa *ipa);
-
-/**
- * ipa_power_teardown() - Inverse of ipa_power_setup()
- * @ipa:	IPA pointer
- */
-void ipa_power_teardown(struct ipa *ipa);
-
 /**
  * ipa_power_init() - Initialize IPA power management
  * @dev:	IPA device
-- 
2.40.1


