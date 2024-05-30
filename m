Return-Path: <linux-arm-msm+bounces-21159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798A8D55AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3EC1C23C2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0615C1836CE;
	Thu, 30 May 2024 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCdoY4tn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D44D8CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109182; cv=none; b=ajc22DbZgHrAe3fBk7J8m7oJ0OXGf4PHjE3lFx9sdbASv3AcuqyQeZWleuvnR7hnDsKooJEsZCKb5r7fuT6bu9YY2udPV2ZqABQe9GICb9nwPTMhtywBwi8cLi1m+e+HjCTpUEYl88nmlABrBYqCOxd/YjQHxjlt5zv70+Q78dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109182; c=relaxed/simple;
	bh=WlTgC2HNp92PM3IzRTxNjM3/DoK9im+ZJtxtFVePiKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAk7EcqgT9rVypgQCjOUGU4cpoUG5vslwu/picOf/3v0C/PP0GIFaI8RxCkv/wRFhIQlqGryz6nOHwxNz+v+Bx93HqYzhUhmAMnuWHPx0aOyrtaZCYlSdcwaB2vxZkI+GGOpeTB+7s5CsyPgdVdtws/5iw63Wf5WML0meZ3jOHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCdoY4tn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f480624d0dso12000995ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109181; x=1717713981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVpFUdiW0gzcPxqtfC6QLNluJtCBHWicwGU5cZiObSw=;
        b=JCdoY4tnGqJZjLn3taXF+EYCT8VvA1MiSxfiGbBmpH2XFxMJVvJtRUmHcN6RcDI7oE
         0RkQa7FVInoDi3HjJNLmyPR0U/filKQ3VjMT2xgzqpyPTMUZk5Yxz0DTvsesyQ9VM5Bu
         nuE0oJX0L4MMkFTCmfju55IG+LDEbTAaTEDW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109181; x=1717713981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVpFUdiW0gzcPxqtfC6QLNluJtCBHWicwGU5cZiObSw=;
        b=SgtRVjZEJclD9gvBb+9Nn4PM2OuA8lNewKVkhAUzye6MJGEMx5IkogfRgJ4vJSIx6+
         U2Wa869WDunPGGn94OrsZt3n+5G7dRiJ2H5JFohWZqa78WE7LyLgSZ9G1BiF1h7keKy+
         7Hj0V2HD4T3TX+YYV5Cphy5QdHRNV0uhNw5srNiW+kK+PaRHWXgRQabVkhXZaVyAIfVM
         alNAcZAKSzsVX2j99ZyUciy8Fq/j7XYRxHhB+Tr1pn/sRiD4V5wtedTVLpAouf92t4Gm
         rkEijhN+ARieARCg3DPohDQKO3TXqKkLzpvVkLiL61HqKkWHKxwF7y3VmGzrfae4ZSTg
         4BNA==
X-Gm-Message-State: AOJu0YyKYqX2ff6pvJxE5hm35Peo1VuglgJbUZbAq2oXBKMFcKzcGGN/
	rebrTpKIxumusptCKO62Ff1Tdu/Szg8pz1T3IEUzscq+hGRg1jT4i+jx4vP5GtAdOeidDggZLxY
	hnw==
X-Google-Smtp-Source: AGHT+IGf9zImQ/nEpQVPKVJ40w4LoZIcowQSUQ0pEx+3OA9SDdDSLgvm0fteajfMt17dU+D0vVNWDg==
X-Received: by 2002:a17:902:e5cf:b0:1f4:71f1:d5f with SMTP id d9443c01a7336-1f63707e8a4mr2856975ad.47.1717109180980;
        Thu, 30 May 2024 15:46:20 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:19 -0700 (PDT)
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
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 1/7] soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
Date: Thu, 30 May 2024 15:45:53 -0700
Message-ID: <20240530154553.v2.1.Ife7ced506aef1be3158712aa3ff34a006b973559@changeid>
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

For UART devices the M_GP_LENGTH is the TX word count. For other
devices this is the transaction word count.

For UART devices the S_GP_LENGTH is the RX word count.

The IRQ_EN set/clear registers allow you to set or clear bits in the
IRQ_EN register without needing a read-modify-write.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Since these new definitions are used in the future UART patches the
hope is that they could be acked by Qualcomm folks and then go through
the same tree as the UART patches that need them.

Changes in v2:
- New

 include/linux/soc/qcom/geni-se.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0f038a1a0330..8d07c442029b 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -88,11 +88,15 @@ struct geni_se {
 #define SE_GENI_M_IRQ_STATUS		0x610
 #define SE_GENI_M_IRQ_EN		0x614
 #define SE_GENI_M_IRQ_CLEAR		0x618
+#define SE_GENI_M_IRQ_EN_SET		0x61c
+#define SE_GENI_M_IRQ_EN_CLEAR		0x620
 #define SE_GENI_S_CMD0			0x630
 #define SE_GENI_S_CMD_CTRL_REG		0x634
 #define SE_GENI_S_IRQ_STATUS		0x640
 #define SE_GENI_S_IRQ_EN		0x644
 #define SE_GENI_S_IRQ_CLEAR		0x648
+#define SE_GENI_S_IRQ_EN_SET		0x64c
+#define SE_GENI_S_IRQ_EN_CLEAR		0x650
 #define SE_GENI_TX_FIFOn		0x700
 #define SE_GENI_RX_FIFOn		0x780
 #define SE_GENI_TX_FIFO_STATUS		0x800
@@ -101,6 +105,8 @@ struct geni_se {
 #define SE_GENI_RX_WATERMARK_REG	0x810
 #define SE_GENI_RX_RFR_WATERMARK_REG	0x814
 #define SE_GENI_IOS			0x908
+#define SE_GENI_M_GP_LENGTH		0x910
+#define SE_GENI_S_GP_LENGTH		0x914
 #define SE_DMA_TX_IRQ_STAT		0xc40
 #define SE_DMA_TX_IRQ_CLR		0xc44
 #define SE_DMA_TX_FSM_RST		0xc58
-- 
2.45.1.288.g0e0cd299f1-goog


