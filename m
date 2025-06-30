Return-Path: <linux-arm-msm+bounces-63100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9506AEE5A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 19:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31B81881BE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B0829898C;
	Mon, 30 Jun 2025 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OekHvoln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1EC286D6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304228; cv=none; b=bW9JK2wtfHQk/hEEbKgF/oUFZa392iqqiCBHuEEvC9h6P3vuBZYtpjJ+qsbB1MVJqXjr0QXszIQiliwaG27mGJ8P/nqKO0+8wF5lL19WSjjm4l/sRa42FdDzWih8lruGPMTqcVg3+Bhs9Tcel18r0klRFKpK16Mj6bhPjObDmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304228; c=relaxed/simple;
	bh=+iLdMF3LWPBEWCi1/m9p2rx5jzc1sOFaLqoYEtOs55c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xo676Wfm4uIPJrC/wVX9PlFHYiZJKYbEdw4FkzkAY9NXLYyYsimxmIyQG8PUVEugbrkzHAlvjEp69h8ZWY5PEoR/5V1iYUxm4qTVOMCA/6yCvrvj2pFuz84BlXrdabOD8yTJNW+TojExChM7SV7ZEonvjE+AvkBcHaGcH4LIPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OekHvoln; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0b6532345so1119470066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751304224; x=1751909024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSVonj7bfDqPq3Y3uOWrAoecetVr832ilrAPmyWsTzE=;
        b=OekHvolnPIXBMcNjkwE401yAYYanM7nU1buv/XlHe+HRitehxMhkUiSB3GvOK5eYhh
         lppA18pgtRBUSr8hjhPJDunztvZqB7lUdu6UyMYwisK3d5WcFndOBf1iGoHZUsSwBkEx
         yJHezUJPXdHSOZ7EBXUzk20tmOry4vru79qTWswD0fP/T9IQx+VbrEJkMwPv+4OFfG92
         rRjgfRlpdtpZdQ4fk8hiCEjdOruq26medHSvnyKVOV+xdYzWmwDOdeQMLIWKh1xApHLc
         /sR8tun5mIB433b5hX3svtXR1EUs0OkndCriMR12s4tBBHr6wQQ+LOSj1ClywwG5gtDO
         4eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304224; x=1751909024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSVonj7bfDqPq3Y3uOWrAoecetVr832ilrAPmyWsTzE=;
        b=akxPrmg2lVVs1tsKSXvW2uI6h9DeeRzD2qb27Jt0WzicX0kM5r0xnGbOqUSGq/f+xs
         T5dV6/F7RjPWA0TfyoBnotX42vGDtkM4tyjKQHxiLGlH2tJaGbVUYdRlEb88gcKi2qnh
         pXjXC3a+ek5NG1b6NEsZj94wvZdoLqu7oZymxVal4hV9EIa/Hbxafti/6u3ABMM4kfMq
         a+Zf6NF4hlAPeq5lnwL11jxsfPSiBVIlyRfxQzqSbHMN2jrdapnfAjxlpvfBHUCIOeeB
         Q96+qvGEAKZtAcnKcrLBjxg0E+7/iW6AlxXXHWGOeHmzPC25CzfiG0jdidZmldRyt6rf
         zvIg==
X-Gm-Message-State: AOJu0YxfzJvKbowGFatVEbSy4sK9sExfW9T8h/NlQIgud5skHWJIWIOy
	eUiY0LX0xNTfzvnFdfNq43IQtM9rvquRNSRWzGIX1xN6fillSfKLx04qZqCxl26tbjc=
X-Gm-Gg: ASbGncv6a3nIisV8mdwirsIvXtQC1XIHw5teIRr/uN24cW1yY7g/M7S+ryiDrm+JZ5C
	CysVfgRsAecSw2Hywp8FI5gIwPwYEjHfxZoZ/s3FOXPkMfNhQo4xw0wqndNi+c+Xz9LMimNT4pz
	rDtQ2dPN9V7V9RRWxU3RS3FrihbH/CRx8nSs6fhK0jZqzOesF9ZAIdsXief+svOso5eZDZ7H7QN
	3mr6eLNSNaNdUuSUHEH7dl1mjC94+oDPinm6H2D/32BNxyzSaecRejInrWa0WxkUAMsIYESX30a
	W5w+tkR+dhw7rBv8bYcYBadN43BcXSX1AUVVz3FBzTOLjTd6XE7JgKTOCyHh4QvzsRdrihSBLs+
	OmpjMNBI2K2EugLbRMEEgPHJdZ9pN
X-Google-Smtp-Source: AGHT+IGk3tSIK0h8RzI6ilmKDWkC54Zqo7CgD6HQFghtS+TAD9sYMu+ROZZeAcfJdcRUTYDyOXsQLg==
X-Received: by 2002:a17:907:9452:b0:ae3:7070:1fc5 with SMTP id a640c23a62f3a-ae3aa2ef4f1mr41979766b.20.1751304223818;
        Mon, 30 Jun 2025 10:23:43 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353c015b8sm707074266b.78.2025.06.30.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:23:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Agustin Vega-Frias <agustinv@codeaurora.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in _driver
Date: Mon, 30 Jun 2025 19:23:32 +0200
Message-ID: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+iLdMF3LWPBEWCi1/m9p2rx5jzc1sOFaLqoYEtOs55c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoYsgVMRE1+8AhqJ8vM8cILdAL+8lZlZ+NLJtbR KxuXudrQ6mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGLIFQAKCRCPgPtYfRL+ TuRyB/9QjdYDw/9FOLmshYPLnvs9jipUCj6EwLgewoFXBmsXypCVEOuZVozS0LFYihiEfbGcwvW h6p3TIJNDEQymk1lA21HzrqEJ4b/8pfQcR83ZDe5KCvUvRpTo2y7Rzf78YRO47ruoDDetY3dC3v MsU09jXjcSq6GXDjJ9+uUm/2T7h1oX+UL9hfDoJSKX0tft6goz4n3g9AFB7ITCkZdYeZtlSQj+C 712bv6POg6JJRvN+rYAoiWdlXVa44uaxyW97JDoOX2XFG4QP1wtrkh6xKiZxNrIKfSd/O1WvJWe pAVP4nt0lGuNkrzgR+8k1pJMdPWDYx8PsIVtF392vsu7/59j
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The modpost section mismatch checks are more lax for objects that have a
name that ends in "_probe". This is not justified here though, so rename
the driver struct according to the usual naming choice.

Note that this change indeed results in modpost identifying a section
mismatch in this driver. This is not a false positive and should be
fixed by either converting the driver to use platform_driver_probe() or
by dropping __init from the .probe() callback. This problem was
introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
driver").

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I don't know if platform_driver_probe() works here, it might happen that
the driver is probed before the matching device appears. As I don't have
a machine with such a device I won't create a patch fixing the issue,
but if you have questions don't hesitate to ask.

Please consider this patch as a bug report and better only apply it when
the issue is addressed to not result in build regressions.

Best regards
Uwe

 drivers/irqchip/qcom-irq-combiner.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 18e696dc7f4d..e92baf20c7ff 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -266,11 +266,11 @@ static const struct acpi_device_id qcom_irq_combiner_ids[] = {
 	{ }
 };
 
-static struct platform_driver qcom_irq_combiner_probe = {
+static struct platform_driver qcom_irq_combiner_driver = {
 	.driver = {
 		.name = "qcom-irq-combiner",
 		.acpi_match_table = ACPI_PTR(qcom_irq_combiner_ids),
 	},
 	.probe = combiner_probe,
 };
-builtin_platform_driver(qcom_irq_combiner_probe);
+builtin_platform_driver(qcom_irq_combiner_driver);

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0


