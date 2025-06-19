Return-Path: <linux-arm-msm+bounces-61822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D72AE096C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9666D3B5D9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9664828B7F1;
	Thu, 19 Jun 2025 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbTjSoQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BD233D92
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344924; cv=none; b=AoGGyPEt63Cne3TJaNTev8Iv7t1TzOq9fcOqfIKYtVuW45hl56BKMdEQWRz0unJTqwXuKwC7b9vsqi+ByiIMi7oyibe1Rm7lDWNkihWo1WlD2ouyoQYKCfFcKVmSrQwyhyekFI15rQXhb9laeoe7t3hr0x+McTQSJhudnCCspiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344924; c=relaxed/simple;
	bh=6Z4D16SkPJ8yBSytHwVl7DqQPX/xHbOuvdjyNeV7Wm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJDzTYfaUV451bNxYVUEpkmX9mbpXhATQuznZhoCHWvcZxEbSTn6jX+tTeZnMFqPrtOPPRzj456HiWYS2KZhkCESfk5ecsEBa0TFRCX6pGYqxHPv5kzGWbPseCtjvMyAEVyNpn3Zha2XigIYBSypbUaSnNkHn8hDpBGVqVD24qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wbTjSoQ+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso560588f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344920; x=1750949720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEHr+JFKq0mjjtdNVZ8KWmf7N7HSZ0JZspgwtDVrdBE=;
        b=wbTjSoQ+TSYlMS/h+iShp0+5ton1au/W30Fnq4R2IhpJO2/BmODFJ5SKIyeavg/5hb
         eIWDQGZyaRwok6dYCC2Zgvqwc0bEbgl0ijj18avyvtl4w896uifKXCsSKaUWsk/x4R18
         4a1PJoXnaXDIfo2qm/FnBx80iXL2B9MlxkrBokXTXL8R8YYDwUQJZOhAz0C+n7adBTce
         LJxUxZTjAs4irM2FiZGnUEUnajy7C0H7aqR1FkwYoPqcxzXP4CYl1k0oqljCDR/QNgVM
         tn+aZT4IvranYYw0/ORE2rUTCuflcUQ5TV8u4nlnkKU3mrwrtovtOMXHmzT1i7YDQceC
         N6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344920; x=1750949720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEHr+JFKq0mjjtdNVZ8KWmf7N7HSZ0JZspgwtDVrdBE=;
        b=KtXxqCKBnoL9iphZPqZUwJh/Z2LyGG1IQA0PPpQFvDyvWt+9g+V5G7KCbZjsNgU3yY
         M1ysTRdfnaWx/T+FowIOip5rwKvMXrxNGOhe3slGrBUXYdJtmJcHIeoy7D6jykIfa8Sr
         xLdIjgyYvTdKerlCh6LRqdJYM0okW0NJWHh+g0LdpD3TWMvefLajbnI7L4BUVphA9XhS
         RGrJoOVaVG6ZNKaYYznBN8zFS+XyquFwzwJfm1ACfmJyaKtBNJFqE9ASee8o2Ff6Ep61
         yxtuPdlRCJbRuBsMmY1XldG5k/56qySMmrqdg78HwxNh9zoTuCl0n5EgqvSiET0YU4KE
         32hw==
X-Gm-Message-State: AOJu0YzMhaK1GM4JNMW0c7Rs5GwzWd/uruYEyXWAfiwvcXhRRegG11qJ
	hcA52TvRhWVeOv1PjR45RAro7naGQ4JCKeHgPDoAyLCQyNOaPk8xiieOW8O/Ovpj3TOPW2Bdh5Q
	2oM3Y
X-Gm-Gg: ASbGnctOxDQKMUlUQEjeIyc64yfi4sExOeJrACJ9L/68GuTH+FFJkRCVExWDFpcTSCv
	40DyQtN2sSO81MqhOfyKuMbIVYQhkjiYccDPKmKcX35foMZs0A2Xv7fk7lHMJZgGrPIdueskDdA
	TcM/dJvn3FNgNhWD0EvHREprOvXyDpYMOQzQNfj8tgZLK1M6lYtLf8e9lge5ydDwZNtOPYMX7bl
	it0U1V5PoBAb88EGmh4ahJpFW5HYcaGF68xIr4CZQJ6ZldQQDtQdQKxweagOImW3nXUSoqYYvsj
	eZVjHeKyHOqisC66Bd4iuhdaTel/RGPL4/lOGXqPrFomSKT8Bw/erY/ejuamKKahqnpWqtOk1jM
	sOBeGQnMDzHM=
X-Google-Smtp-Source: AGHT+IHWbjMlG2E6TzWb22wDzJtnoqglGRvEM5is+uCoWk0J9I5KSBBT9LoIyRfmFnTQymBf3ofmdw==
X-Received: by 2002:a05:6000:18aa:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3a5723663c3mr16381011f8f.8.1750344919992;
        Thu, 19 Jun 2025 07:55:19 -0700 (PDT)
Received: from toyger.tail248178.ts.net ([2a0e:c5c1:0:100:b058:b8f5:b561:423c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm31343715e9.40.2025.06.19.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:19 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Jun 2025 16:55:11 +0200
Subject: [PATCH 03/11] power: supply: qcom_pmi8998_charger: fix wakeirq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-smb2-smb5-support-v1-3-ac5dec51b6e1@linaro.org>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-hardening@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=6Z4D16SkPJ8yBSytHwVl7DqQPX/xHbOuvdjyNeV7Wm4=;
 b=owEBbQKS/ZANAwAKAQWDMSsZX2S2AcsmYgBoVCTRhc+icEuxNhuT86NLqeDxQeR4vqH+O6CVX
 1VOLWhF6VCJAjMEAAEKAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCaFQk0QAKCRAFgzErGV9k
 tmGRD/0R7yKQaE0xf7lUByZ4lt/WrVrHsd4lwLP0Knrr7xy4r0l8x++FJhew8FlK7XIXTmj+Enh
 KQGn7Mz7pWIFuM0PU9KhXDvL2J2NKnXljq1yVW2mok7ZQCxzIw1a8OnG2ua5jC/hine+eCOopO5
 lGejGQMGussxPINrRMwSI0JKl9+ikufSc24PaxvoIf3tqgqL5ToUNlA0byiMPdkuDjt5SzE8NQw
 V7s++GnqrkYBoMb5yjr6+LfSVgRWGAXvDM6SzmXjy6UI3KX9FsWNxjYtxTLGzvBmqWUB1iRwQul
 SBI5SN6+KMLgyi6sitxK/8BY7cUwHFaH6MAUC1W36WAHiqP/5gUgbG7P0kvCAfMVQhCOtXGUN9o
 WU1/Ib4FkHzWIuMnLNS77ImL5kjgT1VKwkhT18hIEUmhfH5gy2ISzOD0mHV9xhyR/7A+TptTZEh
 VpX5OSoG26TolQdYbdexzlBdWT2eYpeepbSEzNqcvVKwmSRVNrheIeiwr3JMqTiGcHvLuaG8Kby
 tsxx2VjhvbjuyRhB7KZtHquxA2M6YAYHk7t/xTohzT+4Z5lRaiQ/R0IkmvrQ6Ph9qYWiHevzIr6
 ALWLa02Zs/mG6XyvdmA4jUpolpYZPhdv8C1fhsy6MvH/eOb3GKcXy4YdLJczUzsk+BNu78ISCv8
 nQ3uWO2t0nceVcQ==
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Unloading and reloading the driver (e.g. when built as a module)
currently leads to errors trying to enable wake IRQ since it's already
enabled.

Use devm to manage this for us so it correctly gets disabled when
removing the driver.

Additionally, call device_init_wakeup() so that charger attach/remove
will trigger a wakeup by default.

Fixes: 8648aeb5d7b7 ("power: supply: add Qualcomm PMI8998 SMB2 Charger driver")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/power/supply/qcom_pmi8998_charger.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/qcom_pmi8998_charger.c b/drivers/power/supply/qcom_pmi8998_charger.c
index c2f8f2e24398316ac5c491eaaabe4c455e875c47..cd3cb473c70dd1c289cc4094e74746e3c6dc16ee 100644
--- a/drivers/power/supply/qcom_pmi8998_charger.c
+++ b/drivers/power/supply/qcom_pmi8998_charger.c
@@ -1015,9 +1015,11 @@ static int smb2_probe(struct platform_device *pdev)
 	rc = smb2_init_irq(chip, &irq, "wdog-bark", smb2_handle_wdog_bark);
 	if (rc < 0)
 		return rc;
 
-	rc = dev_pm_set_wake_irq(chip->dev, chip->cable_irq);
+	devm_device_init_wakeup(chip->dev);
+
+	rc = devm_pm_set_wake_irq(chip->dev, chip->cable_irq);
 	if (rc < 0)
 		return dev_err_probe(chip->dev, rc, "Couldn't set wake irq\n");
 
 	platform_set_drvdata(pdev, chip);

-- 
2.49.0


