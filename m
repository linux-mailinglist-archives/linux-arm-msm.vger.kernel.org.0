Return-Path: <linux-arm-msm+bounces-17961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921E8AB190
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91AA028218E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7507312FF93;
	Fri, 19 Apr 2024 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkeoN7vB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B1512F59B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713539888; cv=none; b=fXMRyG3r0xrSUedchIRDZ6xlC75IbPP8g/0gWXDfM5LCK5DdAnrDX51GOqKcB/Ys23u31aqfqzCZX5KW98wctKBh9SzQbRSUba1a7GcULNZRXgIBj2cqhFhirXE5DA8fWN592vCxlqyF098iT4Lnpsf7PwZ3I4uiq1uQCTncr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713539888; c=relaxed/simple;
	bh=e14D7TKpEvZf5OnwvIcuBGe61+yGxis+fUvADt/aWF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D/7BvTuhFbCY1yAzNZacVsCNDPA22cuHd02375sn+3YOkv/508pc7FLQN1/xNTaE6TFi3WPDvJkY0lBytVR2JcKMmyw5fBiQIpM35VPhYCMYV1oQFbmrBuVtONbwsMo6X0arIM1JUxXPlKopWbNlRkGStQcKX325FfaXWgSyaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkeoN7vB; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7d6bc8d4535so81013639f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713539886; x=1714144686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1/gGz9kpYbLFaH+UuJD8Tkj5MFD/GFitlOxG2qqSIA=;
        b=DkeoN7vBIArbqwo5yn5aa+wB11wkFXPKDN6Wur1K2Zk0iJFcQ9jraGQgq1VPAMZAUd
         CGyu/2R4yY+pbEQnTJRMU/xRoTEzegwxL95PSzJNkhCjbf8PxR/O5gWP8XxHx3iYeuzV
         crV7IysD6L7iZ/SaQIvZbJ8ioinZ8XrHP2AZLR5RKrVlkt6F6PNf22f2atWsUit7JmNt
         V3AyEMuiL4M9Gc5jS22XWvANxPJG4bi20RU9ZasNXhaqz78a6FUHBBGE9wtyihno9bvg
         AW32otsPUocuv0AmvwojygcX5pOW3wackxw7lr6EV7AP9+YZBkLbYTNBbjHAamUBsJtS
         dpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713539886; x=1714144686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1/gGz9kpYbLFaH+UuJD8Tkj5MFD/GFitlOxG2qqSIA=;
        b=g+vVRhktJBpCc9TMFM24TCrfgLFlswnk8bV0US1KCWrSalWoRMeZq83YbR8Ne6ddHt
         OcXy74b0UeS4KA67pIlQQTAeGVn2A1lKB/v7aP6i84vMb6L9IRMedEjOK4yLazYdGwe1
         3hOiuq/VSir6H9i24+uReorqV5iBe37lnKKwrcqqLZRJG9lbvD19r/dmcsv5B9euawHh
         8VE1VWIUaRF/zw9zuiRQnK4c4gGXmwzoASCbb30E9o4TT+WdHCXDmaIOQOBZYP5jz2LX
         V2O3PHIS1BVG8a5sazWKS2VzlSNxTbzVz9GrZYOWYCIlWoqBKWXt3TQRt/y+wij/0uTs
         7LEg==
X-Forwarded-Encrypted: i=1; AJvYcCU3nyBES9vyxCffqz+SfZ8iGdZoVl9BMFmAdvlHRdJDJh/7/T5zpDs/R09J65Wpi5UPVfFWfUUGIVYZtt3J9h3cyl/Zhb+UIEt7iOpDTg==
X-Gm-Message-State: AOJu0YywGNLpFM1y0IWptffrd1KyYdOgGWf1e9E25y8C3yT84SZChPZV
	ZGuH6byRgDBjCUQRT3hThYPNqdjMolH/u3l1bvfxioqbKgi+lfxxl7PpYJfH0K0=
X-Google-Smtp-Source: AGHT+IGmMBrA8dMR9MNSQF58KLAm84ynEVXwhg/TqwiDztGgWaBhEIIt+WXVFFaf50zLl0b9PEK4AA==
X-Received: by 2002:a05:6602:4a86:b0:7da:1885:50b5 with SMTP id ej6-20020a0566024a8600b007da188550b5mr2631577iob.9.1713539886236;
        Fri, 19 Apr 2024 08:18:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id lc8-20020a056638958800b00484e9c7014bsm116126jab.153.2024.04.19.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:18:05 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/8] net: ipa: only enable the SUSPEND IPA interrupt when needed
Date: Fri, 19 Apr 2024 10:17:54 -0500
Message-Id: <20240419151800.2168903-3-elder@linaro.org>
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

Only enable the SUSPEND IPA interrupt type when at least one
endpoint has that interrupt enabled.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c |  8 ++++++++
 drivers/net/ipa/ipa_power.c     | 11 +----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 18036e9cd161f..2ef640f9197c7 100644
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
index 3a7049923c381..1a413061472d8 100644
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


