Return-Path: <linux-arm-msm+bounces-22225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7ED902B93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAAF3282829
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0BE152537;
	Mon, 10 Jun 2024 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L9ESeeFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94A15251C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058349; cv=none; b=IPsz0gRui+DxjOwbgRGfQTIJoM4N7Sspl6KglQE7WXP5xya/AxM1kQUNupsR5drbmbp+BDT9M6pl3JrWalexQDdnZmW610kKdmbo09EuwjXmO/ec4hK9JJ2q+jHvrKMGdfyEdUPpP/cljcShFUKvWR/A78AVOrYWaNqVZ8EuK6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058349; c=relaxed/simple;
	bh=Ovh+os1hrOCrDiD2AXmjdnbk4SgeS/pEWCXqKaF+Bbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqRLCagiA6RYQlSPVIPRCJlUrIgGCQCgnP0DV0v71LRE3gt/Ovjmoga5UkfvVbMirALTNugaTuINkxxLgeozMl/CDzbkjAszPCCyHTMsHV2FvqEcziyMXUyDJ6C1z/atzXv/buZDnwRQYQzOZEMYlWWiT1QLTtKHOjAOBtdGx0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L9ESeeFT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70109d34a16so4622348b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718058347; x=1718663147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/e81yWihMIIF3LSLYKYQMUC2dNN8trSfh+gNIU5e4Os=;
        b=L9ESeeFT1Us9TlkOMaFUC8MmywCIeNXIk1aK5wMiifmQFIjd2Fd2afhH6mr3oXZwFE
         rNN4B8fe+sEM5+5/kmas/cUrrySDYAlL04acZ3NK1sYFuQTKqsJ33Q3YXzKqXEkPYE8P
         NHb79fXLOfbqWhwnoRqBhTKf+bW00rhO98GkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058347; x=1718663147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/e81yWihMIIF3LSLYKYQMUC2dNN8trSfh+gNIU5e4Os=;
        b=dCdqLfqWNJkNt8BSyd8Zg2tH1fAM08+epop/hBRvr2c5zcPscHRfrrfnYDfnn2kxR9
         UfGq+asXzmgVsH5DLiyWxXbsaP60luL+F5ECYJ1oc5n7a+uATyBDbuHldn1tDk+jmiaU
         UlBnbGw2uoVz4MhK+JL0L9SSeOKeBoWHjlp+rRfYTZ/1gksh76imwYfL1HjeIq/oawyi
         YTskUq3Atdj8sbCMntkflDGbfREmpFIhvq7tibWbUofu48AvdCtcBUiHhUMvwTW3gmUP
         koNrOeCXX10wYx79XWayG+1d3gAF67A+HIo75d4vNLOjUpcDi5mAQycdDX0yEHyzss38
         dWJA==
X-Forwarded-Encrypted: i=1; AJvYcCWcIM/FrbcApeZagN7HnEJFMJHeA+cbjJg+E3VzNIkh0n7gu6YtSt3HriF3oI5zREB3A/h87njxdEhKIiTwpkO52aiyX4ftr9R/+9rX0g==
X-Gm-Message-State: AOJu0Yx8u0W0gW7iCihZMU5gOlAIwvl8+B+wwHc88TuDaJUUukopY47U
	fF79/XKzdWVqLUgAmNzG4yB0K+jspqAhbAENHH7pXkIhcByb/CIxcWaolUw1Dw==
X-Google-Smtp-Source: AGHT+IH+lrAj2yY4EXnKLpxmaVMU9JPChZlgs48h9rtZLjlN5ZBgV25rBpmsjMuO7Bod3cm1rgi/yg==
X-Received: by 2002:a05:6a21:998d:b0:1b6:dffa:d6ec with SMTP id adf61e73a8af0-1b6dffad7a4mr5342931637.46.1718058347194;
        Mon, 10 Jun 2024 15:25:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:bba2:69f4:1b51:d0f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71029e223sm29212325ad.170.2024.06.10.15.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:25:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v4 4/8] serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
Date: Mon, 10 Jun 2024 15:24:22 -0700
Message-ID: <20240610152420.v4.4.I24a0de52dd7336908df180fa6b698e001f3aff82@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>
References: <20240610222515.3023730-1-dianders@chromium.org>
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

(no changes since v2)

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e44edf63db78..db933a1549ad 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -265,7 +265,7 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 }
 
 static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				int offset, int field, bool set)
+				      unsigned int offset, u32 field, bool set)
 {
 	u32 reg;
 	unsigned long timeout_us;
-- 
2.45.2.505.gda0bf45e8d-goog


