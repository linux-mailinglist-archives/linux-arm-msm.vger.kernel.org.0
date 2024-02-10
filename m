Return-Path: <linux-arm-msm+bounces-10477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E03850313
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 08:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9C81F24C90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 07:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA7C39FDC;
	Sat, 10 Feb 2024 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ITvZnoCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A9638FA9
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 07:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707548997; cv=none; b=XDnTwXmc1IHjtzpsyY1uVpDBOE678YFJtvZyak2CjxbC5kZAMxM1LbYLohERT4UsOXUFINgYGmVIOoHroKoiUVmysf49aoNLKF2MUl02WrL6rIzasfDH0D3pi24Yr1hz3F19oFDGPm7Yz+SXKHQ8CYpvi/DNhRsmjYbiuMpW68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707548997; c=relaxed/simple;
	bh=Z2VNjfcE3E5eWdhGG5oCDx/zw3CYXQmcbgOU3PEqB0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHVwXWQNiNxQ9mEzx5DunbwrHIsufCRopJpn6/ljrhQ7q1b+3UOzxj6YjJjqARSGTF742nCZoZZEyiTTARWdf5GKVBLN925aHk7WZAdXJMeaOBPli90b6b8GxJGTyT35ZOJK2CBnhX+014Q2LFyP7UgcCvHZgkQwifctJLezwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ITvZnoCo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-296db7e258dso1207941a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 23:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707548995; x=1708153795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/bbTxm+QSm0yQFEh/0bzSR3JAbVtUoJm+LTlB5jixM=;
        b=ITvZnoCo3sbMz8CKHhyJKsfnXc8lW5oo2FAY+67dcn5PyBnoL4Xz9eBq6iMm/zCQYG
         tEC4D1tD/G0dSVziWwYe73xZWkTXUSbZ2vHkewEWosxg2Ppt254uws9dpH4DmJ5LdgGw
         RBY6erTC6O1Q4kHfCdVAzQopD8YLbgYEdjap4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707548995; x=1708153795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/bbTxm+QSm0yQFEh/0bzSR3JAbVtUoJm+LTlB5jixM=;
        b=ii42od8TIu4Td4yJ1vGK4LNij1Fc2Vt4a1+wucm5RzW/zHE4WCq2DuQZpg11lJqRyu
         73mQrHc0Ns4U0GOhc29VczYQ6S7HahOg/aUgtlpbOz909ma+JPSRZyIorKj7AlRivPgg
         Wfj2CJi3WYY03Ez4DwuCIZdddsgKLMtm+C9N4s9IC18B6uGBNM5b5bMG28tyb2Y92fCq
         X9yxjxCp8KhidYf64f4JosJbyq/zbhFkNPQYhLfBK7e62Pmui+9MPWXHzCkVbL2ntcA3
         yXKZk557V978GLAEYfDqz/MT6bCQTL1t3WUqQmSnY+p0gMNq8YZzcxz6cgYi7A8yvQEE
         gR6w==
X-Gm-Message-State: AOJu0Yxfqik0RIgq46jSYCCaQres9VesMmyr7oR7CrG2xBmuBaIwYABQ
	blyK3lL9SgeL7JE7JCf8f/zsD3a1p8sEkpre2n0louIrKPlCToD2l/58mZjROw==
X-Google-Smtp-Source: AGHT+IHMkhHNa0ZG+OIplO1cmtR6bvKFs84rw5E2biQpiJzOSRE7LnelgiFtjJYp99/EbnlOI57YdQ==
X-Received: by 2002:a17:90a:b881:b0:296:1dcf:c297 with SMTP id o1-20020a17090ab88100b002961dcfc297mr2038905pjr.7.1707548995258;
        Fri, 09 Feb 2024 23:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMBbmOEi0xo6ox6Wu38zgJl1YBIA9riNYFCafGlKAAN8+ZPlZ1F0jEvy+MUZ3tc1A0V3HjPW8DiWhK+yVH42jv2NvxaLqGPMd2bVdadwnobW/q9lAIQrHQdK5F03bwogZKK+ILzFmzkzfbRQlWt1ARp3meQ8e0OfIPHFbh8QM6uYJRAebiYG85x9mDSD6CEM52nrEQP9skTJpBxSYPbOVns1y1hktPql80CxyEL0isVwWU9NpD0jozK5EGEvhh7wxGC6ot7Rn3wf9s9Gu3/9tp65gjUDuFteXi2cfKL+FyWQtRPF1PyUNDInAIns030RQCnsYv6BEto50mq4NYzAIYIn7qZrHlMK/Y35iJoLfYGbiLAe9eWA==
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id ip3-20020a17090b314300b00296fd5e0de1sm2828227pjb.34.2024.02.09.23.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:09:54 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 09/22] platform/chrome: cros_typec_switch: Use read_poll_timeout helper
Date: Fri,  9 Feb 2024 23:09:20 -0800
Message-ID: <20240210070934.2549994-10-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's possible for this polling loop to get scheduled away for a long
time right after checking the status on the EC. If that happens, we will
never try to check the status at least one more time before giving up
and saying that it timed out. Let's use the read_poll_timeout() macro to
construct the loop with a proper timeout mechanism and the ability to
check that the condition is true once more when the timeout hits.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 07a19386dc4e..a23fe80d9d4b 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -8,7 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
-#include <linux/jiffies.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -108,7 +108,6 @@ static bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int por
 static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int port_num, int index,
 				    unsigned long mode, struct typec_altmode *alt)
 {
-	unsigned long end;
 	u32 event_mask;
 	u8 mux_state;
 	int ret;
@@ -134,18 +133,14 @@ static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int po
 		return ret;
 
 	/* Check for the mux set done event. */
-	end = jiffies + msecs_to_jiffies(1000);
-	do {
-		if (cros_typec_check_event(sdata, port_num, event_mask))
-			return 0;
+	if (read_poll_timeout(cros_typec_check_event, ret, ret == 0, 1000,
+			      1000 * 1000UL, false, sdata, port_num, event_mask)) {
+		dev_err(sdata->dev, "Timed out waiting for mux set done on index: %d, state: %d\n",
+			index, mux_state);
+		return -ETIMEDOUT;
+	}
 
-		usleep_range(500, 1000);
-	} while (time_before(jiffies, end));
-
-	dev_err(sdata->dev, "Timed out waiting for mux set done on index: %d, state: %d\n",
-		index, mux_state);
-
-	return -ETIMEDOUT;
+	return 0;
 }
 
 static int cros_typec_mode_switch_set(struct typec_mux_dev *mode_switch,
-- 
https://chromeos.dev


