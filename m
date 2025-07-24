Return-Path: <linux-arm-msm+bounces-66572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F414B10C8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B94C17B642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7F52EAB69;
	Thu, 24 Jul 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJGzWX/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DAF2DE709
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365407; cv=none; b=Zv7RbQKQbJiZIXK07ur98JQ5S4OB7RULy5HHPNEnAlP5meKTTAXK6KoSLrIo1YXk+QH7jOZDpObt4URB1NyZti7tqCHeYvYgkdmTLdDsgK4bN8Jal0UftDwl40tfc2OsCEQEUOtZ+RAfE6IaeXRQ0SKoXQRF5PnDx0wETMMd+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365407; c=relaxed/simple;
	bh=wYMeidmYjvDlycPH4G07GZhntMp09MWX5qBkhRN0CfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFy3cic+eC+m7BcE9VL4Z4OjYjAwKrDj6/+sEJj7XT0A9Ru/Ey4VwzARcVooApytxxFrOifWuOC7HOcPnwTjuujjkHzGFLJYkyfVZfbuYTcO3nSX0SXJpp7jmTiWILuuCYAzCJ8P0EkZu7+BckGyQ6EN5HOHd51xEl81b5bFRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJGzWX/6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso11043865e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365401; x=1753970201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieqGzTCdj4VITWiplNNA/VccLe5fuArNXR2nSJt3s9g=;
        b=TJGzWX/6v2x3LKFOGORhb25GV3SG3O5lJhLzN12s/kz3xZzSeCM2F/DPwP25r/rfjt
         tHSsxbljdsMdjhPrIByOBKv+U7WX0wlixs7UQeh/CpNrBitqyYW2s4gR8dLIRyOm9RTb
         X5gLNzW6X1Te9HXIZwJfvz9l61YLYNyHPE5jJHkr6haAkWG8sJitt9NfyZ7VW2oAURPh
         3aZKnmcEKHumzKpIpyRxJjLWney0vVSv2+GaknSiXmiCIuku4s+m1scu25JSQPYnO7qg
         AcwqG7YrjHPSLpIuX1y6I+spSSKnMA87XLj0W6wfJfgAlwNIYFEfR3n11iV/luMdlKDq
         7xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365401; x=1753970201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieqGzTCdj4VITWiplNNA/VccLe5fuArNXR2nSJt3s9g=;
        b=YKJt0z2h6EVMVQG8p+tZOE4/3VSBtHLqXEUAZMCJCkl9VjUg631suXZdYBZzDWX+Fy
         dNCW38ppfq3j4wcQHBDFvfnnHlkQMuBpjBZEYjp2LP6v9uH+v2sWUeeh76mBT6IP4iQA
         k3wjpFLCH7sFf0ZCnkkg9CJB+ZHbBUqskFletht5ZeskBROheeW4eUgmrAOV9mhVrau4
         +F7KCLiANgFj+MQMWbPEv2yybVec2XOBvdg1u4TikNFF8lsehhdXfb+spp2pXbldAdD3
         WhUrm0uiLKwITb5IDJEH7PbsnVyv4YQwNhzWuOjVFEq6nYT86QZ4r4AyJg7bY0TlsXhQ
         bLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiR43lEf0jPcUDstC4cORY8SSHjUfDOHckT5uA4gh3G5zn4wvPhNuFw5j4xQ/XuBreiMuYnagCFc1rXcN2@vger.kernel.org
X-Gm-Message-State: AOJu0YxO23/NCygKMs+OJgTMCm9LDSI0z6KnIfBlYBHQkx/82emtPhfi
	9sdCyH4w2cvRtltM9xJAbpfg4BGDIzHsFGIwy3i+NVR0Np//zfkyrl4BKr1Vi4EaroknLxRWr16
	NbkVjWR0=
X-Gm-Gg: ASbGncs4x3tt0wybor5xBUvUll7VNEXbCLcPuIShzhoEGqu0Dgr5/jgOq+P4biMMkh+
	QIxfIbtG8G+LKMP8M8gljURifrOsBO6c0c6flwUE4FlQm8FsE9wNtoyDyvcHtZ5pwo/a3ErqqCY
	ijU1JNdoZogzqiy1ugjJjFXUajKZnRq/wUVGNPubO86lHYuE/sWZregV/Kw6DUGbb/Vmx8zr3V4
	vfdSPtX4mw8OAOddbknj2DmTZfprnthZQ1W0c2oafyWUfMAYimJmYbUJ3eCZra1vu3PSFllh4e7
	fJF3ueQftBftVvQgpIxzdunh36a8pdGj217i91m8hJY4INQKOeJWwtSJeLTnlLUKDirgT0BXUQx
	9vF/K8iRihtKQXFOVD5yr57rpQWlrV0g56WNpiYCsAFqRF9SfzRtL1pVBHUncfIyj/vwYIon4Ps
	uLGVlQNuYOnJ6K
X-Google-Smtp-Source: AGHT+IGXEHFsoY1KVpxzOAw5TwDBINg782dVci0CvVy56NLBcwsZCPP5/3Z/QT3qLnRYduHfxvJiyA==
X-Received: by 2002:a05:600c:c167:b0:456:1c44:441f with SMTP id 5b1f17b1804b1-45868d7266fmr61139855e9.31.1753365401169;
        Thu, 24 Jul 2025 06:56:41 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 21/29] kernel/configs: Register dynamic information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:04 +0300
Message-ID: <20250724135512.518487-22-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register kernel_config_data information into kmemdump.
Debugging tools look for the start and end markers, so we need to capture
those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..ec94b695f234 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/kmemdump.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 
-- 
2.43.0


