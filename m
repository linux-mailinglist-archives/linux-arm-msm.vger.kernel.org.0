Return-Path: <linux-arm-msm+bounces-56485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDCDAA708D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E8F9815FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB0822FF2B;
	Fri,  2 May 2025 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bme3YeOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279DF1E5B62
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184968; cv=none; b=YuqFiQzDI51J7/mDvZavJYUHjFX6I2sM34MhFSWA1Tq1FuahYaQ/SeC/vidVpeOvbO1ez6oaQXwtQXrAGmua052PcrhFZwSxzcafkBTsI3e2dpifw1Torqw25+5zbWROqPMCkxwOTo8MZcs34EpzK8LiEUubI3/ZyqV4z53+F0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184968; c=relaxed/simple;
	bh=3TIzpFAkAwmJ5Ai0fCUIFb6sFww9WxO8C3aUIXLL09Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oZORr+F1R521wLfqPyUxhGXD2/yIfa3LI3a1duA/vzwBbd7hD94x79PEpeZxgYuWRT/UDH5cxvuelZRsJZBOa1TeaZ+FHJKAKwInLH8quIfmDW4g40tb5J98BOOna4riTvCot4PHpgOJPKqWv4E0CcwFecoOUNtoj+QDhREChRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bme3YeOH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso2767325a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 04:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746184964; x=1746789764; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqfMYbE/OTW0Ee2/eXWBsydPJFNpOPTDdKFpdPQUKCU=;
        b=bme3YeOH4T0dKwoFVPaW3wQmL/VfgooS8sXnpgXTyv9/ToHEKcDLOCV5ARQVLHNEve
         6VKK2yRN8rtfkDUQs+v69zLC+5ZTzessxATcekMH0gQ2WcrfYHpCeWKi7jIo8iaqY7UE
         lEsxtg1niy4HOo3sL3HL188gvz00Ez5kTKm2qQm3xAZOJr65GWm3cB4gCyU+q8ADMe3f
         f2KbkUBdsHsSQEhkbXux0fqcWRzk8Xc5/zLdGicsoV0nGFwzIasXVGDLTml8npblT8SY
         mVMlIL+kkhaZ0xWGBHzU8P2oGjuubM3CiybW0Pb2txJ+7zu8n5r9ZQJqcnXflyRztBBi
         h1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184964; x=1746789764;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqfMYbE/OTW0Ee2/eXWBsydPJFNpOPTDdKFpdPQUKCU=;
        b=YRmIIm8Xh5I0nqYILvQIsdzOsAWV5e/uelQrICKAPj+Yi4oH1nFGE7E3pmyfzYEpO0
         gx+5j4XLYhdoPEHkMvN1Ge+dsi8XJhZ9CN20kp51G63WEgcdg1X2zo9vRbWxqd/CW4d2
         2HHIhs8Vsaafch2j4xHU1oWRx8SLQ9Uzq38N45vx3jN9b3EVZGvOpnwKIisUOrMGAMTJ
         qzhpUXL039fYqwCualbVPo69LkI0bigXOmGqcktfqGjf/VfKy7q5UVv5GZtCSR5bnsze
         BZqKXcynIilYVqHnFM8234+3qpjh4gq/0dmYp8i/6AmuLXCuCeNfNYawY9u0QU178puf
         6GhA==
X-Forwarded-Encrypted: i=1; AJvYcCUWUxcQ5h5NC9fEXVokCnZuk0wtC5RpG427WFhzxbqaqR68ri+0sMMo0mdg47WLZQRYCISmpWjcBa23Q7uI@vger.kernel.org
X-Gm-Message-State: AOJu0YzRc9Af7NIo5bZrZJPI85/PXDQarL1UaA0UnWlXABX3bMSjcuB0
	hp5kPsYYfm1PwYsAYqGKfues+fFfX8knKH2/FEetKj/t31R9W+Wz4vKIoyyzHdw=
X-Gm-Gg: ASbGncsU1yfPOdiCU35Es7ENgp6v/9+KDPMYdXgrmuyfx90eN8C4JO5tX6l5D9KcAEq
	b7khZ51QnA7ooR7ZFlHS1JqQUEbTfmI6TmwszwNpG5rXP5aBX7c1+Wys46wfgM8FTOFjkRHta4D
	r8UCnCTLpJs3YzaiSFSJD42wY3OfHYMdKbSkuOpmv/XOJcCY7bJj9E/Fgwkh6AplG0fBgKDZUdW
	7to5kLCAH9M0XptA0GqeESO0941CjFUcIZVg4reLBvY2W0O01ipc4KFD6a5gH55QRtWlhPm7uKZ
	VjHQrbKUxuxLAnZoZONGAEdFnlQ4WSyDQ9ur3BH/WvRCR00NxmXrqD0=
X-Google-Smtp-Source: AGHT+IGhvBVIBFVtHBjng4vUf55rIcK1Nc7ggU/9+PFpPWuDtRvXkmQ3OGrZUveVFEdPd39HlFp12Q==
X-Received: by 2002:a17:907:6d14:b0:ac6:fec7:34dd with SMTP id a640c23a62f3a-ad17afbe974mr219003766b.52.1746184964389;
        Fri, 02 May 2025 04:22:44 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f2f:46a0:5bf3:f8f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2b6esm36062166b.42.2025.05.02.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 04:22:44 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 02 May 2025 13:22:28 +0200
Subject: [PATCH] irqchip/qcom-mpm: Fix crash when trying to handle non-wake
 GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-irq-qcom-mpm-fix-no-wake-v1-1-8a1eafcd28d4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPOqFGgC/x2MQQqAIBAAvxJ7bsE2guwr0SF0qyXUUqgg/HvSc
 RhmXkgchRMM1QuRL0kSfIGmrsBss18ZxRYGUtSpThFKPPE0waE7HC7yoA94zzuj7XXLjdbUWgU
 lPyIX/a/HKecP+M52P2oAAAA=
X-Change-ID: 20250502-irq-qcom-mpm-fix-no-wake-d893e19923d0
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

On Qualcomm chipsets not all GPIOs are wakeup capable. Those GPIOs do not
have a corresponding MPM pin and should not be handled inside the MPM
driver. The IRQ domain hierarchy is always applied, so we need to
explicitly disconnect the hierarchy for those. The pinctrl-msm driver marks
these with GPIO_NO_WAKE_IRQ. qcom-pdc has a check for this, but
irq-qcom-mpm is currently missing the check. This is causing crashes when
setting up interrupts for non-wake GPIOs, e.g.

 root@rb1:~# gpiomon -c gpiochip1 10
   irq: IRQ159: trimming hierarchy from :soc@0:interrupt-controller@f200000-1
   Unable to handle kernel paging request at virtual address ffff8000a1dc3820
   Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
   pc : mpm_set_type+0x80/0xcc
   lr : mpm_set_type+0x5c/0xcc
   Call trace:
    mpm_set_type+0x80/0xcc (P)
    qcom_mpm_set_type+0x64/0x158
    irq_chip_set_type_parent+0x20/0x38
    msm_gpio_irq_set_type+0x50/0x530
    __irq_set_trigger+0x60/0x184
    __setup_irq+0x304/0x6bc
    request_threaded_irq+0xc8/0x19c
    edge_detector_setup+0x260/0x364
    linereq_create+0x420/0x5a8
    gpio_ioctl+0x2d4/0x6c0

Fix this by copying the check for GPIO_NO_WAKE_IRQ from qcom-pdc.c, so that
MPM is removed entirely from the hierarchy for non-wake GPIOs.

Cc: stable@vger.kernel.org
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/irqchip/irq-qcom-mpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 7942d8eb3d00eae5fa7e5718a05ef889bb8a82f0..f772deb9cba574b9f70649e1646f16a993eba58a 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -227,6 +227,9 @@ static int qcom_mpm_alloc(struct irq_domain *domain, unsigned int virq,
 	if (ret)
 		return ret;
 
+	if (pin == GPIO_NO_WAKE_IRQ)
+		return irq_domain_disconnect_hierarchy(domain, virq);
+
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, pin,
 					    &qcom_mpm_chip, priv);
 	if (ret)

---
base-commit: e6a3fc4f10b872d02e25f83227e725c79b25d893
change-id: 20250502-irq-qcom-mpm-fix-no-wake-d893e19923d0

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


