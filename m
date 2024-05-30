Return-Path: <linux-arm-msm+bounces-21161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831638D55B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21FEA1F25915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA93182D37;
	Thu, 30 May 2024 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kb3Lrb30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74191186293
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109187; cv=none; b=pIrgyXC78lEUs+flox4PGiIGyy4tTejHCtVnkLPGidwKEiGJ7Go6+I51KxPZ7iqT99gQnHFAq0qMV9sNKQyzUp9FV2lwlplcpPG+DtaPEm9o2rkUqpbbR6Gb6yWZzWf4GO24xIKYJ/yYdK4z5APUuAyegiZvUNsa2KlIbr4O5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109187; c=relaxed/simple;
	bh=OHNRIjCt/AbOcKb2xouTeXmLM+pYeA2+sCM+PeZUBHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJW+z0zJ1tfF5BCEhSCToXLt2XoujEFjmHoJJMWfaERPapdWAa6OLhZjeJktxPdf9AOmJrFsKhSfhaYyWHcoe2F1iuBTTvOa/jMYkJp+MySKdLzOrt4wbOtmHTEcw2cqL8OC5iYGluqzhvJqMpIzZujC4oSEkbqgp66czia44qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kb3Lrb30; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f4a5344ec7so10870375ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109186; x=1717713986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNGi3BaacIMJpkAV5tddhgVoLNe/JGSac2Iso/bclHo=;
        b=kb3Lrb30Bzxzp4hqWqNBdk2HVDHGurJUy1K2epaQtYVdH3NSQLgbkcZ4rUmblVRjdp
         wQChU1otXpzX/uRYQ4yYrshdLOI2d6/Il9Gkdbge3kmVAHYtqwwWNcWaR3xTUSzmnSa8
         +u7X/etJRzqyqVl1iWIJbm1ShV2NtofjvS0pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109186; x=1717713986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNGi3BaacIMJpkAV5tddhgVoLNe/JGSac2Iso/bclHo=;
        b=TbkNeFCccLp2VFrzipeC5EmmOk+TZDYCWOUavzX67ZUrLfKAB8d0c6E660S41xd8Sr
         JLbXOR/NOwOgpmhcdc5182/7PDbPrcVrSRfelKw3d/LwTPKMOmW+G1Z9pKCyAX9SP+4m
         fu3wXiqTj2Rw8o6LaUgsFUFN5Idnqcbnbbm2As8Q3LOD+k4K2/k07DTqAVZ1pfatki4b
         GzT3MIPax4kRUwELe+BEB+nK6OoVeL7sH4uxoksBXgwcGYT8t4KeLFH8q+3iJ+LoDWSj
         qNwD21KAes/JNpnPi3UlnMRnsMAtI8uA6ZWFrriBnELw/bx5xjvYD8mruADEHy/EKfpx
         +wVA==
X-Gm-Message-State: AOJu0YyAzc9L51/STqkrkh2wVBvIzMzegr+hRBz5wQvalr4aXA8AuOw1
	sUScEI8a3k/FkCexxtbyby065M8ueAQ//GYxWrZg745j2rcGHYFsMssC2VG3GA==
X-Google-Smtp-Source: AGHT+IGPRBGVd/Uds8lu/CwCOmUT5FA6Rwai1ahagYPAZWNotAwpSu3qyKimjG2+vC0ln3VA0ZBt+w==
X-Received: by 2002:a17:902:c401:b0:1f0:8cbf:c1b5 with SMTP id d9443c01a7336-1f6359c9c78mr3578145ad.16.1717109185878;
        Thu, 30 May 2024 15:46:25 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:24 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/7] serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
Date: Thu, 30 May 2024 15:45:55 -0700
Message-ID: <20240530154553.v2.3.I24a0de52dd7336908df180fa6b698e001f3aff82@changeid>
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

The "offset" passed in should be unsigned since it's always a positive
offset from our memory mapped IO.

The "field" should be u32 since we're anding it with a 32-bit value
read from the device.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 32e025705f99..71258eefa654 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -266,7 +266,7 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 }
 
 static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				int offset, int field, bool set)
+				      unsigned int offset, u32 field, bool set)
 {
 	u32 reg;
 	struct qcom_geni_serial_port *port;
-- 
2.45.1.288.g0e0cd299f1-goog


