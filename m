Return-Path: <linux-arm-msm+bounces-21162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF58D55B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900E51C23B02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6425F186E55;
	Thu, 30 May 2024 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iFIMusMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BBA1862BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109190; cv=none; b=YS+jj21rN+ovFM51ugKgZN65z4ED5VHp+B32cSCxHHzou91wVJNnJJ/HlnDf6Ca9Rnw7/RW+urwoSRQIXQN+1MeH/C6IvvtdSTqmMIiWIkT3U9tVU+DxXU/8ZxTYr0EK2dm52IQcspcHG4ssWk+AujflwBtp6nr09Hr4DbsnhZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109190; c=relaxed/simple;
	bh=cQNJ3XMzHwi5FaJGdzzeq5t/gSbidgfxwp2JxpD4I2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxC+iT6qVk1mCmb1O3TJ9TtuSaMQEartCZ17TJP08IHy3KzpnhvZfe4zy1z2Xpq7CMghDB9ZslluyXhTXQueOadZmdaKZpVIslbDc2QDgZ2KALIateUXKxeHWs60ZAWcmgSUdVgzRV9+oBIhn5mtKjQEaR7rIC9BmfcnBNfEH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iFIMusMJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f4a0050b9aso3378945ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109188; x=1717713988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGiOTL7ihlI5Yhs010iFkTmajDvoSp2W9SJUSNub5/M=;
        b=iFIMusMJDubVZ/kcABU8xhG0Ad/x5rACFtKQ+tQNrW/26dZpeEaREYmht8dyfH9lqB
         0KNmgDAB37VbA3//YyU6RRbR65eLMbpg8JUhIiDNlCstF4u6OZzbQbgpZBEI1PBhFOFH
         EzDgx4PAFmxHB7W98te9SXmXLB3sgX2hz+aLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109188; x=1717713988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGiOTL7ihlI5Yhs010iFkTmajDvoSp2W9SJUSNub5/M=;
        b=TOtVEXwzXs/pidRxjjHLr2ak2zWMMqmLEBQwkUmVZallsZ1Hc/M8ik5jRBwdzHbsHF
         1ba5cwVoBjyJEdu3RSiB7TYYRkTI7h+FiOHKoaGb8V5KhpByPQNIe+HrSnMgkDr6z3Jp
         MKydVBScG3a109Q0y70a/TAsBmE1Ym7qGCBLHJapwQYzk9Y+snOc9XqyTbuuaDug3IHe
         ifQEhXaI1U44loe3dT0TwYp5+E+Oz9c/0NnaGEPW343cEAJHOEBoTnmFM3tLTUqHDGeO
         TNt0vX9Ztu15X42hSQcPWExzQMXhS+fSDfVLqlxIWgluZFO9y7NWu/uBuiuAK6t08cqr
         bdIw==
X-Gm-Message-State: AOJu0YwfZ6GQVd31aKsEpBNgGK8S43/3mpXZO7WcCGp9BQv0djk+93hx
	W2iP6O7nKm6sGMEj+X9O2QdiDYkoRWpri/XgcrXmb7SMmik2v2scLrNY046N9w==
X-Google-Smtp-Source: AGHT+IGuNQy9vE7scNu6gP4OcjlhzBXrYXmV0BA270Yt9wNFVO3IPAIRHxMOBYrMyEWGHmskZxQBhg==
X-Received: by 2002:a17:903:32c2:b0:1f3:b55:e247 with SMTP id d9443c01a7336-1f6370a783bmr1589435ad.55.1717109188230;
        Thu, 30 May 2024 15:46:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v2 4/7] serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
Date: Thu, 30 May 2024 15:45:56 -0700
Message-ID: <20240530154553.v2.4.Ic6411eab8d9d37acc451705f583fb535cd6dadb2@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530224603.730042-1-dianders@chromium.org>
References: <20240530224603.730042-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a small modification the qcom_geni_serial_poll_bit() function
could be used to poll more than just a single bit. Let's generalize
it. We'll make the qcom_geni_serial_poll_bit() into just a wrapper of
the general function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The new function isn't used yet (except by the wrapper) but will be
used in a future change.

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 71258eefa654..539a6ac85511 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -265,8 +265,8 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 	return readl(uport->membase + SE_GENI_STATUS) & S_GENI_CMD_ACTIVE;
 }
 
-static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				      unsigned int offset, u32 field, bool set)
+static bool qcom_geni_serial_poll_bitfield(struct uart_port *uport,
+					   unsigned int offset, u32 field, u32 val)
 {
 	u32 reg;
 	struct qcom_geni_serial_port *port;
@@ -321,7 +321,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	timeout_us = DIV_ROUND_UP(timeout_us, 10) * 10;
 	while (timeout_us) {
 		reg = readl(uport->membase + offset);
-		if ((bool)(reg & field) == set)
+		if ((reg & field) == val)
 			return true;
 		udelay(10);
 		timeout_us -= 10;
@@ -329,6 +329,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	return false;
 }
 
+static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
+				      unsigned int offset, u32 field, bool set)
+{
+	return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
+}
+
 static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 {
 	u32 m_cmd;
-- 
2.45.1.288.g0e0cd299f1-goog


