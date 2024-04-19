Return-Path: <linux-arm-msm+bounces-17963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA98AB197
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79EDEB222ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF88E130AFE;
	Fri, 19 Apr 2024 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zs4XPMpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A312FF74
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713539890; cv=none; b=UJMEjY9DXuvPZM6lsYaKz5owTV9eJr6ZuhcEAD/gjnq/GhEfuQ57ifOBxayHGu1ODOQDh7wtaUC0u3CuuNqSC3KGb2w9NvZO8KhGPLV5L0p34Y1QKwZTjj9vOwirHi/K/BGISQPHHhmUCT222xwaLIC5CbHBPz0sb/8WD3VTB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713539890; c=relaxed/simple;
	bh=Q0E7FhXIRDhGAblpeieYVhQkwbjvfK6IuTNLIIQZVUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EgJRVL31CVSD2RnVG9AwbffFjW0MnhoUs4liuQg+ozpLi1ItG9Q1Wu97idx4wYK44lKY2RGsWRAtBSl6iZ+5T4Er9M/v01GVwIP6TegtwEg6sJ533L7lnbFOq36TkJP/9wAY9QiBc5kSZcEVe3ZDBpbtI8rKGDyOxJr7cJciAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zs4XPMpR; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7d9f35fcd2eso85228539f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713539887; x=1714144687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHMnYNBF3duo4/+KlP8bC20trtUqzEZR9+R77ODU+ms=;
        b=zs4XPMpRES3TNyK+j9+QHQTgL+NJShzfWixar8oc/Nzf3mZ8uKQvG6E/kZEY4u4IOO
         IajvXiPrBbc8T6ituCkQjP0raFR7nD8GJ0vdpfZRo5eDfvgfInct1m/Usnbv9Yo89aCs
         ZGzBEhoPYlHdfw02udGGlJo2ETffqxAyHHqepWsQzmC6v4e9+Xi7pyK2BJ3ycoQ5m7Hh
         /TRlrYInI0DLXiTet/5NzEz931+/q44n464D35PW+JgPEmgUURP0K4CqKcoRJ7OQsFAG
         eVV7rueNix9HwHMXdS6NGraHLiMKB/kihBo1tNQNqKsAhbBCHhP59hIJJhLBvlDG2g7V
         yrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713539887; x=1714144687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHMnYNBF3duo4/+KlP8bC20trtUqzEZR9+R77ODU+ms=;
        b=QUavGLzediud/VlEOUBuzIRupxnkaFB6QBcFtRzt4qCzXBCWjEOmYy2kivLw89ZoAA
         bW8kdsu2PFNKdKnyzOjTfEHknI4dXEDFu3DUQ6vefx222QM/94i5UTTdhrR42fmCsus9
         r0tYKK2wh3h0Te+DfuEwkxsXEL4riflBDDj4TICgDxT2TfvP6OoplUR2m/kI6a/Q81NK
         9NnF4HdLyA08DFmPcaiu1jAUQBE6KKLvG0TQBedLWvS2uD4OhDhDaVPbzVTEjN88kpyZ
         +M98u2BnF9RVvtqPCK8i4EotQEhfwGEHlMD8Je1hanba+uYqe+bWAWd50CvEPJD45aAy
         QFuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7fI35yOCMqnsV3yZy37zSo0yRgLuBB47k//dULfABFYmCd9Zq7Cjr551E7Jb7S5sMF1SzZJt3FZ6Oy6Zcj5nDWytCvvOn2v65wO+qjg==
X-Gm-Message-State: AOJu0YxWWrmKXcElLkSpwLHpFQrdtN9l9vs79oxMUzzTQF0r2FElF5m3
	478q+zIgxyrW4TBiPYweK8LKVv8gkQtytHfX782qCoD7JZte0vDXjoYX1vFvvuE=
X-Google-Smtp-Source: AGHT+IF7GPcHIRyDVCOIwyo6NIzltkE/fTfp0QyP4PY6C2+tHxBzXNvbfCeSsFlZBX8lhUSM7W80YA==
X-Received: by 2002:a05:6602:1d52:b0:7d9:6474:812e with SMTP id hi18-20020a0566021d5200b007d96474812emr3076780iob.2.1713539887321;
        Fri, 19 Apr 2024 08:18:07 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id lc8-20020a056638958800b00484e9c7014bsm116126jab.153.2024.04.19.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:18:07 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/8] net: ipa: call device_init_wakeup() earlier
Date: Fri, 19 Apr 2024 10:17:55 -0500
Message-Id: <20240419151800.2168903-4-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240419151800.2168903-1-elder@linaro.org>
References: <20240419151800.2168903-1-elder@linaro.org>
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
index 2ef640f9197c7..245a069970556 100644
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
index 6523878c0d7f6..b13a59f27106d 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -119,10 +119,6 @@ int ipa_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = ipa_power_setup(ipa);
-	if (ret)
-		goto err_gsi_teardown;
-
 	ipa_endpoint_setup(ipa);
 
 	/* We need to use the AP command TX endpoint to perform other
@@ -169,8 +165,6 @@ int ipa_setup(struct ipa *ipa)
 	ipa_endpoint_disable_one(command_endpoint);
 err_endpoint_teardown:
 	ipa_endpoint_teardown(ipa);
-	ipa_power_teardown(ipa);
-err_gsi_teardown:
 	gsi_teardown(&ipa->gsi);
 
 	return ret;
@@ -195,7 +189,6 @@ static void ipa_teardown(struct ipa *ipa)
 	command_endpoint = ipa->name_map[IPA_ENDPOINT_AP_COMMAND_TX];
 	ipa_endpoint_disable_one(command_endpoint);
 	ipa_endpoint_teardown(ipa);
-	ipa_power_teardown(ipa);
 	gsi_teardown(&ipa->gsi);
 }
 
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 1a413061472d8..65fd14da0f86f 100644
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
index 3ffaa0687caa8..a83524a61c28b 100644
--- a/drivers/net/ipa/ipa_power.h
+++ b/drivers/net/ipa/ipa_power.h
@@ -31,20 +31,6 @@ u32 ipa_core_clock_rate(struct ipa *ipa);
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


