Return-Path: <linux-arm-msm+bounces-25400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56123928E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 22:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA48285F19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 20:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8638178CC8;
	Fri,  5 Jul 2024 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghqX7XYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF1176AA6
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 20:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720211234; cv=none; b=CL5j1Y1IMJOOsHzCfzvcLCgE05rGkPmXoKGhaEKs4dqvO3F9/QVRPyWGZvO7Wg81KXUflNkij8yvzuaMMDLaZMSFI8E1xvK84QA5OnGIbS65PuRB9UQUsGr7GakcKlHff0LCBHXnHoOdfhaFZBu8cRS68v1llGnTwKFPYAWVy7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720211234; c=relaxed/simple;
	bh=BHZpwUurXz6EHmSePeAstBj5C3my+ISMfUE7d9hT6nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGeXcuzBFN5GQrjebJGVQcaaxPgkhxf6RTpIATTfblWtekD8/W99nRnmw9FCAjgUC7EgH3uzZZ75Lparceoe1rqzVXSOFKgrYDFwLLNCHWyf5tIbvwfPC/y9XeGbDYtxcO+Zm5TIFyaTLMmkmX+ZaNdj8seK1wFX3fFQxY0QI14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghqX7XYU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so12575465e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720211230; x=1720816030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhxeWNbsehkvTYXadehkR5iqHrP46Gy95tZ+1/cyqoQ=;
        b=ghqX7XYU0OeltDmllXgwh3jERx7z9YusVk/KrllXGMjss19RAA26jgumpLdJSK9UV3
         upcND/mU6qucHhM4nFBTVx2HZjtP2FuwRju7pNzSqKlGvqSOd7rHoG69aTvgWR9LB+vW
         goB/hy3WBHbHyRZxXawVPyHvBIl+ioX1CB1Y4TppOLHK3goG0jG+5k+UG3frrZf2xFfX
         UJ2gq/IgVfB7QNmQnUGv6FXHDsiYll3VJmgMVEnceSV7SzSDvchwSqMN/K1sQbhzEhkm
         mc9ERRzRHr5jNhSoNGBGax7E7UPFxbgCPuud3cN6K9ykH6nf4JlVl/1K6n1YsJTNgoO8
         mYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720211230; x=1720816030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhxeWNbsehkvTYXadehkR5iqHrP46Gy95tZ+1/cyqoQ=;
        b=EJ8Fx/5TEpa5rByuQ3+ceJ7ycE5Y6YHXeXGHtxwWBpe79OMXbPLpG4ISRpfEdC8cUO
         uqniqVQT3VmiMZ3OeAmeb2a8uNOZgHJJamdXhJwHw7ZT1cWnajTnLP2dB6FL6gbjKR1H
         6gD0FT9/LMuw5qirngYB/xpcjbYssOMgj5KBOKv4g2EAFtWWph3kgLNuxWwo8HyIY9AG
         uGjCsigj4Kvu71IwGmo2tJEFvUT3vqCj2ENkRYXgjgu6eLLU2K0ZIgeyHPbWuFRg7yaU
         nmosaC7KQhWzWXP1HtyXVlX2VlR1Gz5nBPnU1L/udV54OyT7rNVt/AHSdb5t4Vrbzj1b
         zwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5wp98RveTc+lsqnnmdyIiFEdaxMTSQ7IuAfQItUwI8FWBdukL3pgbsio76H/FQ0EZzzyiq+p6OwGoeQqRNcdq/+otOhKlGoDVMlsFLw==
X-Gm-Message-State: AOJu0YweG66k/fw4QB1scGS/qnIqKDR3JuZEukru8h4Ubpc4YN+blh5d
	bPVMWQ28xGAyClW3LOOgd6oFY2IgIlcL8BGbI6PvVOJvfzgrP7c5atgvIif1WUQ=
X-Google-Smtp-Source: AGHT+IEhEdRIa0FfJfC3c9Ak5qO6SfMmWAfIVvgBak2MobkC2CRcPCUQJyJZWnWfde4yEeCXAFECFA==
X-Received: by 2002:a05:600c:3547:b0:425:7aa7:e490 with SMTP id 5b1f17b1804b1-4264b0c50ecmr48207955e9.3.1720211230038;
        Fri, 05 Jul 2024 13:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d5116sm74397625e9.10.2024.07.05.13.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 13:27:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 05 Jul 2024 22:26:36 +0200
Subject: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>
References: <20240705-hci_qca_refactor-v1-0-e2442121c13e@linaro.org>
In-Reply-To: <20240705-hci_qca_refactor-v1-0-e2442121c13e@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ioulty3Koez8d+kC3c/wVdy/glxCtXawrHUZeGjPJfg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmiFcYktlTUSh5+2R72g8hp1y+NQBm5mc2IAjPl
 60MEldV/RCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZohXGAAKCRARpy6gFHHX
 cqkUEACTILPVYt3HW639Sz4v+7V7oRX/iHEZ9svUqZt8Dgv12PpnpGQqJ3BnagDOTwEU2de+/jN
 iOO6/tmwAda1LUxNpUIFx6xSLZhiICcdPGd46xkjEl/XDyfPZSpSIQYOCkQ30gItLhlYvXMnuCk
 LH4FXCuA2S38ZpiTOWLmVbQODeUz9AK1HRbMjm6vp68zH3A72MXj2pM70HJzy/oIsjLWgEDBbqd
 t4assCUa3wIYL+KlMqwPZ8dvjnDYkRw4/uNLeGIMQlqZ5uyIiNEJrxDTozXwKqOnxkwPq0U8ABS
 heqLpiKLWxhDbNERciw3yR64CPYAR7aQaD++oWQ7WVTgrKbzL4cBMza9o4WIYif3htIRobQe1+w
 G16IydvNtwKDmvY5fhvoxlHCOKq7nzvJYRZDMn38V6aCVl37d88CTqBsfSXhvuzPD/hle2YwWiC
 OxRDwjRVcG1ZmomC46SWNh+CjuynLT/JlfaWFDU6VBK8tNDyCmEasPTRQOE6nOXl2j6gucwpTO0
 tN6rLUgHztZ/Li/NI12Vw04C4DfZR80afUJYXMKMX4b5OYfZXIxnC1/RkYQaYqy+RpNG5ibT6Jf
 xX/1gF49OK+/84lQVT7WTZ4dMUbT3vmiTK0PGmXNyZbL4Cjrh7oQF5dXAIwGl9gjRfDd2MxjtTp
 sdXDacC+Zt4szhw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for unduplicating the hci_uart registration code,
schedule a devres action for disabling the SUSCLK rather than doing it
manually.

We cannot really use devm_clk_get_enabled() as we also set the rate
before enabling the clock. While this should in theory work, I don't
want to risk breaking existing users. One solution for the future is to
add devm_clk_get_enabled_with_rate() to the clock framework.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bc6a49ba26f9..895ce8e11da8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2295,6 +2295,13 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static void qca_clk_disable_unprepare(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2434,10 +2441,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (err)
 			return err;
 
+		err = devm_add_action_or_reset(&serdev->dev,
+					       qca_clk_disable_unprepare,
+					       qcadev->susclk);
+		if (err)
+			return err;
+
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 		if (err) {
 			BT_ERR("Rome serdev registration failed");
-			clk_disable_unprepare(qcadev->susclk);
 			return err;
 		}
 	}
@@ -2484,8 +2496,6 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 		fallthrough;
 
 	default:
-		if (qcadev->susclk)
-			clk_disable_unprepare(qcadev->susclk);
 	}
 
 	hci_uart_unregister_device(&qcadev->serdev_hu);

-- 
2.43.0


