Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C1D2D64D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 19:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393039AbgLJSYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 13:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393033AbgLJSYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 13:24:03 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEAFC0617A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 10:23:05 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w16so4972734pga.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 10:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V8NX24ubqKWwH6xcjmH3A9pX91w8R968uRF5N8yhVWE=;
        b=X1NfbcczKoiYmOYzwW198suAQMOFZglPRX7eTrZfPsVcAbxctN96ddIgRSk+VptxUW
         rm/bjqHurs7HwEsywnBWkhhSNVsem3OCFjT4bN7/GOjLVJdoa4XEVqi5IlLd1L7CecD9
         hEdbHq99Ys+fdrvB2QgmOmW30beJfWKf26cRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V8NX24ubqKWwH6xcjmH3A9pX91w8R968uRF5N8yhVWE=;
        b=cX3BhylAIkHAtxkc7+8gRB6giaJXRiz6S2qhZrosiReRPxQtRtRo5GcT3K5JQcXxyy
         aNijfd22bNg2kSEa28Me5B3zXxa5tqUjI9T+iWE2a6573cz5GYK+QauG07AnuOasF5aY
         ZM7k1KHHbLECzSeKbLBKgSp+g3BG4Jp+3GVb038Nsg2r9PQ/ZmnC2lTw8KB/iT+3m7f0
         QWOJY7CcIofy0Bk8aGXnJVjT54npUjrTHfMw/62IwFLqWw5c5wK0jDCjWKbNhBLIuDdY
         hDDxCZn1rddf5spbjkNO85G0FPT+fRcUeZwWKTA0c8USfZUtVNQvLllILL6ql/vR9RJ3
         rsbg==
X-Gm-Message-State: AOAM532cMEdUBxPjFkYpOY9tuNa51JFp0nwm80rysEn5w91+mxX6YFLd
        brfKdNdVvrFCfCzlasIf9rfjWA==
X-Google-Smtp-Source: ABdhPJzc1Cqx+KcUzhvwKx11PppWAktpydpvH6zqRuG+56ah0c3TI6CMKpRwNO7UMWe+aI5oW56wPg==
X-Received: by 2002:a17:90a:f412:: with SMTP id ch18mr9070061pjb.69.1607624584641;
        Thu, 10 Dec 2020 10:23:04 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id a10sm6898376pfi.168.2020.12.10.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 10:23:04 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-sc7180: Add 50 MHz clock rate for SDC2
Date:   Thu, 10 Dec 2020 10:22:39 -0800
Message-Id: <20201210102234.2.I26dcc0cee374f5571d9929c9985f463773167e68@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

50 MHz is an incredibly common clock rate for SD cards to run at.
It's "high speed" mode in SD (not very fast these days, but it used to
be) or:
  #define HIGH_SPEED_MAX_DTR	50000000

If we don't support this then older "high speed" cards can only run at
25 MHz or at half their normal speed.  There doesn't seem to be any
reason to skip this clock rate, so add it.

Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/qcom/gcc-sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index b080739ab0c3..d82d725ac231 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -651,6 +651,7 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(9600000, P_BI_TCXO, 2, 0, 0),
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
 	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
 	F(202000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
 	{ }
-- 
2.29.2.576.ga3fc446d84-goog

