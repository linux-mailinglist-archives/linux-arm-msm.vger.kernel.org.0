Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC381367D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2019 02:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbfEDARl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 May 2019 20:17:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37177 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbfEDARl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 May 2019 20:17:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id e6so3486360pgc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2019 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=T0GFsU5iTOyCwj8QNb5BtH0GpMGDHOczgY1Uj/CZHXk=;
        b=oeQsoIXnKAJoKnIszLlOgMj6J9duncW8mzUEey2yO4oNzCVnmVL0XX+8v9FM5pIy2s
         lj2aO3Aoo+Ij4241jr1fnMBi8z2hYk1KgQr7A2eOY8hTzfApsR4JhFNawomFUYNI1rzI
         8kKJt+eaMdWlosvTyjoMnPmu5jUASwgPiJ2D49QPZe5GVpAGEHSdgtJ2pp0tvNrK8/nP
         YD0IxCHRQojMDUkPcZQrUq/fYJcRrENPVAf7wOFaRMVYXyqZsqNu2kP0a1NL/B9+izSu
         WMuD+dGAQClX7s8+hSZr27NH9SDNlHuoEMnsc31/PEFQyzW5OUmzcrzHkI6/MnOawgA/
         VMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=T0GFsU5iTOyCwj8QNb5BtH0GpMGDHOczgY1Uj/CZHXk=;
        b=XccBXdPhuYKFq/5Nhs+v0k/qirKelZ+Ltr6yRrSsAXLMLQB1C2VMwE5PFytjOKqMgy
         R1HAbtUJFyIrvXVMYTFxIodQ/91z+qu2UNcu+zSV8PL6sqx3XHsr+seVBTqthuj59Ij2
         cgMvuS9ivL7bh2WfbhZi2eClz7lFyXoKc8+ko7bSGqsNtT9t3CQaLkgPG8kc2FhzPCE6
         l4RfINmvRrTqiovckbBzjBeLeVn2nX/0wRtX9qOPfNPJfye/spqpMXpn3ou7q7KFiPGF
         uFRmYUBVdgeaCyYnJniLWWwG0Wi1ZRarIXpHSkB+3LKFKYO0fHdMQLfDQyq5O7RwxZwa
         lx1w==
X-Gm-Message-State: APjAAAXYIdJoMorPkON404RJpYEZXJuZVGKTx2cxmjFt4Kph3cbMONzQ
        n01khVKtVOEMHy31w++Peu/dPQ==
X-Google-Smtp-Source: APXvYqyEjLXIJyLHnBMCT+wiJSfzdTRGABuxSLtEAXX8MsYrKBxK/Ma8r1oNRsXOlNMqaMEy5XECgw==
X-Received: by 2002:a62:4690:: with SMTP id o16mr15035772pfi.166.1556929060198;
        Fri, 03 May 2019 17:17:40 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm4364785pfy.49.2019.05.03.17.17.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 17:17:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: WARN when failing to toggle
Date:   Fri,  3 May 2019 17:17:36 -0700
Message-Id: <20190504001736.8598-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Failing to toggle a GDSC as the driver core is attaching the
power-domain to a device will cause a silent probe deferral. Provide an
explicit warning to the developer, in order to reduce the amount of time
it take to debug this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index dd63aa36b092..6a8a4996dde3 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -149,7 +149,9 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 		udelay(1);
 	}
 
-	return gdsc_poll_status(sc, status);
+	ret = gdsc_poll_status(sc, status);
+	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
+	return ret;
 }
 
 static inline int gdsc_deassert_reset(struct gdsc *sc)
-- 
2.18.0

