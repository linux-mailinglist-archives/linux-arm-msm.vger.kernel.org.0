Return-Path: <linux-arm-msm+bounces-15667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D7C891396
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C411C20E38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8C03FB9D;
	Fri, 29 Mar 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UueKZhN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A7A47F6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692950; cv=none; b=qIaX1YPtIil01CofNiQ9MYn9QbVpVzATUO8ejOwZzWjOYCmXtKWX3Rxv8z6N6+yCUn23Bx7qu8SASyUuAHamlPkX9k1vKu87V4qm93+VgsRdUdQIZFUnjjZd68hc+4nkgdIIxiMCuor3G5ALxiFoBUJQDTnx4FQdNn34yQJC6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692950; c=relaxed/simple;
	bh=kmMve1a3CmfaOFv3SDIzmvJNqeQvsNyV9CV0U+g19u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOktUMUR5BRBU3NBCyI5v1KLoUoRIJIcRu9YbF259KSL5H3CXgx75UjFwrbi7bvUMuCQoltlXeu8XGBDrpH8CTe0dB/eBl5Ortpd9/e5OtQK9VKf4RXnUI/whnbkOc2lZpDhCwafWHwjDy9RDuffXs09gPvYJ5DAk0f1Px2pw/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UueKZhN+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515b43b39fdso1486458e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692945; x=1712297745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9WARr5PJTGR4nF8MM4y5LncWxqcV+RaZxFc0nIkpX4=;
        b=UueKZhN+Zm6IDnhirvWzykv9kbKko0oCJ3fnc3qS4EPKx8+dSlNt7JTh2RS2zosL9p
         d4rC02v0W2cUW/U2D+qWZJQKxKqz5+CfxqNnwzwZVJM4Au6bc5f499rXhf+l+sxpq58C
         ncrPoWJK9OYWuGc6sAL6haGbK3UsVu4GfbvLFc2D049EzQIn/USY52Crm9CqeUduPRqc
         oC14eqhxIzO1wsaihJav6djdYyHWlCm6faGrSwuBDe+aZ9wQuua5iupt/BqrN8xFkqwq
         lZopyyzQzkJhepf/HXXYHbR537WyHmaD5r8y6i8Okpa2nG7KTG2/KqYlpIXo7VgZgH0h
         c/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692945; x=1712297745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9WARr5PJTGR4nF8MM4y5LncWxqcV+RaZxFc0nIkpX4=;
        b=OBYDs52la4RnN7QXwCqsNw4ymI2/X+xZIrgO6xCQwHwWTnZT47Iuu0RrTJRnrXxKB2
         pMThIN1BYP/Zbgx7zrFjHvVF5e8lWf7a++qBv3oB++3CxIvuw2DEqpmvGSYlDbi2wi+q
         ArOoaMq7cca6FIVmOk1N3Jwcz//qi6mnlPPmIpHKQok+zRDBVpiprTpomRSHn6YXOobe
         WgGKH0iOwsUg2HZiTfZ1J27fT2jbWjGnE1Nq6rDoK9sjNf8Rxs2z0oWREqzeQYHQtwp3
         4uclcEA3MAzxMVRtz3xbyFRuha5mBdD1RTsmByLNbl4IBdAZ0MpThR0dbrRay7+gH9uu
         64RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsryl6KhBV6n4TyIYV/Lgovfet/qK/O0nXr2kdLBpyhJfntEaLommxE9J79u7PA4eMwHI+RJ78Prw+Te4Ry+QvR5DpvNiO7ZJqD9/vCA==
X-Gm-Message-State: AOJu0YyLX9y3yH1wryEAEi2klUcSzchPFyQcqlvssAcLuzuULu7GLv+e
	4dANUPSt0W5uFQ0wCJ0NR+O2xNsz99jW7GEWa0deiSb/dL5if5HF5JyM6bQKw5c=
X-Google-Smtp-Source: AGHT+IGvQ8f9YXAn2iBrH5LnwrMLoOtI6yPr6IJfNELlL4AzDEj4+oxrhpSjjNxTw9KzBJL0mbX5TA==
X-Received: by 2002:a19:7719:0:b0:513:df5f:38cd with SMTP id s25-20020a197719000000b00513df5f38cdmr1477031lfc.4.1711692945235;
        Thu, 28 Mar 2024 23:15:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:36 +0200
Subject: [PATCH v2 04/11] usb: typec: ucsi: always register a link to USB
 PD device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-4-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kmMve1a3CmfaOFv3SDIzmvJNqeQvsNyV9CV0U+g19u8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyMKc1GZtj7L3z/cE0m+6ByGZsSzcBpBZtgr
 dDygFKIaDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjAAKCRCLPIo+Aiko
 1W7jCACoXQgcUo0h2r1jBpKnUQNK/A4bS6/1KLnS1l5qFNRmfXfn3pdUZH8TxWPZVKywadqhBim
 YSgAYFjTrh4ogqyEjgyny/ISk9UJSNVOkuo9YurQB7x7GumwY7Yz+otgZS59c82SB9DslApB3DZ
 lZGXv4pWOg1s89eWyHeeb0nlFL9Vn3r30dtF7Vyue2KNWS3VGMjeKqjHFqFL36C0L/55kNp2/TE
 HyJK8s47d+8MhlCzNM2QPf4i/hYFxdipkFXGnkvxrU4rKH5RPbKqCZvmvh8MsYyebkPnXhlzFWd
 H55Zy7oK1oEjEwFr66esnVWt4U2tH7HaZXCvAu6uwrYYGMIB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

UCSI driver will attempt to set a USB PD device only if it was able to
read PDOs from the firmware. This results in suboptimal behaviour, since
the PD device will be created anyway. Move calls to
typec_port_set_usb_power_delivery() out of conditional code and call it
after reading capabilities.

Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7666142d8bbb..d1a45ce7f660 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1569,7 +1569,6 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		}
 
 		con->port_source_caps = pd_cap;
-		typec_port_set_usb_power_delivery(con->port, con->pd);
 	}
 
 	memset(&pd_caps, 0, sizeof(pd_caps));
@@ -1586,9 +1585,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		}
 
 		con->port_sink_caps = pd_cap;
-		typec_port_set_usb_power_delivery(con->port, con->pd);
 	}
 
+	typec_port_set_usb_power_delivery(con->port, con->pd);
+
 	/* Alternate modes */
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
 	if (ret) {

-- 
2.39.2


