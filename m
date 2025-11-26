Return-Path: <linux-arm-msm+bounces-83454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271AC89BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 13:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA01A3ADB4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408E732548C;
	Wed, 26 Nov 2025 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bRgcFxH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC201324B3C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764159754; cv=none; b=s9TH3i5H71dpf1XCuoKGIjB4hl9GxJjc39Dm5i59KaO2tFRE7OqeuH1bGBOqvMEhrVGaS+/6vw91Mjn/sberSAw0Hx7csqqZmUiGMQ5UYUYZ6wHD0Dl5xIkvIElVIQVoPI0rLDljUmJn7kyIasRL5s0BeHApoKdrZmq2XzEd9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764159754; c=relaxed/simple;
	bh=2+VAOmWz9et0UUjpPkVqfC+IdwUvWdpOacB97kIfSEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHwTdWwpK1V6WSwehzPNw/GBUhcVEAiVLD7jgq9BJ5QojnoaGtChOCOQs0pnKXtlJtYUiqhV0l0AvJEWgD7QlGxThciw8KdLWEgrj7cspoVOsGFkZiddoJHydyFXWU4w941eudjZPaVEVHtS9qcSJUoc9lj92j9CGlU2YWtk31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bRgcFxH9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so54645205e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764159750; x=1764764550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nb8J59nTRhuMgqiDZt7LhAGF4nSCUqiI5XGaUGNyCZM=;
        b=bRgcFxH9pH2aZ6nqwlEv1/86nNS0Z5Zmd4Np1ZDbRlXuLyCEJQLMYCyHKGB3yJMxj/
         0U3fpAHaXEuxKbQEnOc/iukEY5u12KuJMGazVi0yxdiHKVr94CaFJfM08XoXQnLfYyaG
         Hkr0ve7VTx1Cyvv17e2uiktlsWIE9blhe+l/guky2DeIjUM9M/xu8C/2uCrYXzc0V+WB
         YzMsYNmuRHyKs2DHbQw8Nnd1CcIrR8//P4p+mZCmSl7UGwFF83LU2blYvBYeAtM6zc3p
         yntE/zOOTK1HOVyoxWn7mcmyBfRfpzcJhLGMAO8kRlNiUjRt0p1JCaLse5Ak3tHZBnSz
         1MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764159750; x=1764764550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb8J59nTRhuMgqiDZt7LhAGF4nSCUqiI5XGaUGNyCZM=;
        b=aiAOZTB/YGJ6GzvdRjHXIyYxONGtemdLIkPLrE7YWLgM7HinsdAr+YRyr8MqO3AlBO
         BSpCE6DAJaaU/uA2mbmEzmBEF5zCeleoKp33id6n2dzzEeoWaxndnbd9E8nooDyBCaQV
         BALmR66A5hGHZ4dTg7pmgrzrQAzaPbBza0NhKFqFWysDtV4PEmJGUAlO8TOhqHT16KDu
         QajeK4eaMv5CDRaSplksPnMrqlRooM3mFL5rFqA7vVcVmM42flahw5nPHw3Hehqb9etc
         EHsZc145S75VxXBUTVXxa995+mtNBhrwW1n1M8qSbV2Q/kI0/33aTMOEW1fO4JEFMiNX
         047Q==
X-Gm-Message-State: AOJu0Ywaftq01r7WjAyaAWkWjJBYDqqO3pvYbcb2QHg6wOkt8p+I4NVw
	tjuOxZUp+K6VTpibhULLIRf4fZZekII/YiCK0x463Vin7b7FRo9HtAVIwJbvuysZh2U=
X-Gm-Gg: ASbGnctcWVxk93i1qNoNiOby9G+zff4DnG6aCQtfwYH/5lh1poiLa4nL7Ts609eMk4E
	BHVYK0QUG5EoljQWVWnsMZV5FVfbHSnu4jx5IJbExMVloRsY7aioZiwPgELqxFMM38MwkQ3fdGV
	PaWl1sAPIulyrdqNakxH6yNIgczGKgiiqegg3LLydN1FG34vXLsOv7iLg/fklIpQdOOicKiJ05n
	wGX2WDeaci1zKkjZVG2riqa/P0IVLkPxk7umJeFxotHxdp99Eyq8negvxREoyqr4zuv71gkunkZ
	Gmscoa3ZPo1kLs36M39Xngf6NXTlt/C/XRsG12xMUN/qImfBpFpR37z3exutrp8/YKQ1TOIyCIZ
	uZ4KChMGyQAJ96uajNa+zwhcm1Heq/1VZPD4kM1LOVp/UMnIW3m8uPLWX+G0mmqUEcxl+4EJY0P
	7nNWpn
X-Google-Smtp-Source: AGHT+IHSWyiPvjo6pfwtzQLGPlt73Ie+wpC27JU1nwVttO0MEHGbEomKIPCG3/Aoh1JNOO8u4xSerw==
X-Received: by 2002:a05:600c:46d2:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47904b1afcemr63214885e9.21.1764159749845;
        Wed, 26 Nov 2025 04:22:29 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:544e:b6f5:116d:4a8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm40179244f8f.2.2025.11.26.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:22:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
Date: Wed, 26 Nov 2025 13:22:19 +0100
Message-ID: <20251126122219.25729-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The gpio_chip settings in this driver say the controller can't sleep
but it actually uses a mutex for synchronization. This triggers the
following BUG():

[    9.233659] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281
[    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 554, name: (udev-worker)
[    9.233669] preempt_count: 1, expected: 0
[    9.233673] RCU nest depth: 0, expected: 0
[    9.233688] Tainted: [W]=WARN
[    9.233690] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 2.10.1 05/20/2025
[    9.233694] Call trace:
[    9.233696]  show_stack+0x24/0x38 (C)
[    9.233709]  dump_stack_lvl+0x40/0x88
[    9.233716]  dump_stack+0x18/0x24
[    9.233722]  __might_resched+0x148/0x160
[    9.233731]  __might_sleep+0x38/0x98
[    9.233736]  mutex_lock+0x30/0xd8
[    9.233749]  lpi_config_set+0x2e8/0x3c8 [pinctrl_lpass_lpi]
[    9.233757]  lpi_gpio_direction_output+0x58/0x90 [pinctrl_lpass_lpi]
[    9.233761]  gpiod_direction_output_raw_commit+0x110/0x428
[    9.233772]  gpiod_direction_output_nonotify+0x234/0x358
[    9.233779]  gpiod_direction_output+0x38/0xd0
[    9.233786]  gpio_shared_proxy_direction_output+0xb8/0x2a8 [gpio_shared_proxy]
[    9.233792]  gpiod_direction_output_raw_commit+0x110/0x428
[    9.233799]  gpiod_direction_output_nonotify+0x234/0x358
[    9.233806]  gpiod_configure_flags+0x2c0/0x580
[    9.233812]  gpiod_find_and_request+0x358/0x4f8
[    9.233819]  gpiod_get_index+0x7c/0x98
[    9.233826]  devm_gpiod_get+0x34/0xb0
[    9.233829]  reset_gpio_probe+0x58/0x128 [reset_gpio]
[    9.233836]  auxiliary_bus_probe+0xb0/0xf0
[    9.233845]  really_probe+0x14c/0x450
[    9.233853]  __driver_probe_device+0xb0/0x188
[    9.233858]  driver_probe_device+0x4c/0x250
[    9.233863]  __driver_attach+0xf8/0x2a0
[    9.233868]  bus_for_each_dev+0xf8/0x158
[    9.233872]  driver_attach+0x30/0x48
[    9.233876]  bus_add_driver+0x158/0x2b8
[    9.233880]  driver_register+0x74/0x118
[    9.233886]  __auxiliary_driver_register+0x94/0xe8
[    9.233893]  init_module+0x34/0xfd0 [reset_gpio]
[    9.233898]  do_one_initcall+0xec/0x300
[    9.233903]  do_init_module+0x64/0x260
[    9.233910]  load_module+0x16c4/0x1900
[    9.233915]  __arm64_sys_finit_module+0x24c/0x378
[    9.233919]  invoke_syscall+0x4c/0xe8
[    9.233925]  el0_svc_common+0x8c/0xf0
[    9.233929]  do_el0_svc+0x28/0x40
[    9.233934]  el0_svc+0x38/0x100
[    9.233938]  el0t_64_sync_handler+0x84/0x130
[    9.233943]  el0t_64_sync+0x17c/0x180

Mark the controller as sleeping.

Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Cc: stable@vger.kernel.org
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/98c0f185-b0e0-49ea-896c-f3972dd011ca@packett.cool/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 1c97ec44aa5ff..78212f9928430 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -498,7 +498,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->chip.base = -1;
 	pctrl->chip.ngpio = data->npins;
 	pctrl->chip.label = dev_name(dev);
-	pctrl->chip.can_sleep = false;
+	pctrl->chip.can_sleep = true;
 
 	mutex_init(&pctrl->lock);
 
-- 
2.51.0


