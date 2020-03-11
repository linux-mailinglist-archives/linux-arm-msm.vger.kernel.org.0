Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C50A1825AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731493AbgCKXOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34605 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731502AbgCKXOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:21 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so2032206pgn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mCMQ2OChqTGNObRkFX9H0wPC+5YSQubFFV/J730ew5s=;
        b=jRtnocXHHMUP3D+7tOmcprsy5ijnwFjDJ2i50lUH6gswsfBQnvJKVqfR5jpnGxFwWA
         ce1P1tv5x9Mli/4UNjaB5lE2ae20TKIRXhYPr4twa0iJ1ggbqNqpwjBcmQ2OG/7ZBSjR
         1y1aCxYUhYpaVcihAXvzY+Ycp2e/5Am4O665o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mCMQ2OChqTGNObRkFX9H0wPC+5YSQubFFV/J730ew5s=;
        b=mwnWr0kJiHFYETREtvmWWZgQYRonNsqDD3wtWc+fWGvGUUvG/lbH9K5Ibl+BRx49Wg
         YTVE+N1QsYtKMSfoyvDRS9wwOeCRdYyGoIeXE78CkevKFizaShhoZo9UAxrADDUw2Xph
         FxHWZx2+B7TuzyFOPKFXgQnKCLo9XQ7g3sCYYD7ew60Rg0OF2nrM7ShdJ9EY95aJ1/v/
         D05OK9pf5ZAfCQLiy4gkLIxX66qnzDRLKlzwD3+YrAeUD+hPkNYov62/J3EA2zp/XHFw
         Ej+UKyGDpD9inpAgEAJe8/Rk0gBtIX/SkTIF6DslwXN2AK62iwKXZc88kWXJAYghSFwc
         cJaQ==
X-Gm-Message-State: ANhLgQ0+UzQANQk2NHpDDlXx8nzZSTPw871d/stL4318C52gXvVqT93S
        QWAmIW1DvD/y610kdbi5q4mYXA==
X-Google-Smtp-Source: ADFU+vtMFl8p/co8i8x5gkeIQK2jVDPcbsl/SIL1NLHshjUeTo67wxI9RgvSkAVSGhGTpySbG2k2Tg==
X-Received: by 2002:a63:4555:: with SMTP id u21mr4952213pgk.66.1583968460689;
        Wed, 11 Mar 2020 16:14:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:20 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 07/10] drivers: qcom: rpmh-rsc: Warning if tcs_write() used for non-active
Date:   Wed, 11 Mar 2020 16:13:45 -0700
Message-Id: <20200311161104.RFT.v2.7.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311231348.129254-1-dianders@chromium.org>
References: <20200311231348.129254-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tcs_write() is documented to only be useful for writing
RPMH_ACTIVE_ONLY_STATE.  Let's be loud if someone messes up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 93f5d1fb71ca..ba489d18c20e 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -573,6 +573,12 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 	unsigned long flags;
 	int ret;
 
+	/*
+	 * It only makes sense to grab a whole TCS for ourselves if we're
+	 * triggering right away, which we only do for ACTIVE_ONLY.
+	 */
+	WARN_ON(msg->state != RPMH_ACTIVE_ONLY_STATE);
+
 	/* TODO: get_tcs_for_msg() can return -EAGAIN and nobody handles */
 	tcs = get_tcs_for_msg(drv, msg);
 	if (IS_ERR(tcs))
-- 
2.25.1.481.gfbce0eb801-goog

