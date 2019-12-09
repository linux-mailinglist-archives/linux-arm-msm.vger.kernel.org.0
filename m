Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9841178F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 23:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfLIWA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 17:00:28 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39331 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfLIWA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 17:00:28 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so7914943pfx.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 14:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YmSFLr+tHs6Mw5x0YoU7ewKo0pzNEADd7F+PT0RTF9w=;
        b=SBqfoDW1wHdULJCkfeE9+tHwFn8CKdjjeNWENWvFyiBDueWh6zgCqYioruFUb1g4J9
         mppx6PrU7iTgEge5oCEubOcOrrtxe0r1fJhvMGsTAKabZfJKPdhNDm4IYCYup6Dc47R6
         wgbwlUeqBELwn12H2+nT3NJytfhZ6jbgfo6xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YmSFLr+tHs6Mw5x0YoU7ewKo0pzNEADd7F+PT0RTF9w=;
        b=sxRnjr+ZQF+5p1mIYAJQbAQZA69CCUbKpUjMm8DxV9Iki7Qq8gLoVCZk3n1ebBJO/U
         LKY9FddO6QMSMsYaueJVBm8RLpjv4PWvpJGYZ082u+NyVMNcI4jHt6174dhjT0P6LY1Z
         S0f2zdQPT9vSDTPi1KSyRZMfOpro08QuNJEY/RQnykKjOKIR3Els9pcCbr9KxRO/i5yb
         +xhieNB6ole8YtGlWedR7XIstWQwwtqk8jLiTDlehJ7HxX+3UDfZGDOYQVP2vUACvKJh
         6/6ED1/5Ii8t8NehQfVEKVO0PCEhGEgrYPKYA3GxyY51icqpgaBWZNvof1LezyAs43xl
         3RFQ==
X-Gm-Message-State: APjAAAV9DFJjmipXCd9ntw4pFqVtfzJxJ01qrL2974W5O62yBpcD2dbL
        5pRfIuS/mSVeM3BRa6RKga+tgA==
X-Google-Smtp-Source: APXvYqyORjj+Abls7PjxItJE0P59u54wNgNM9bKPcftHXnslnyLl1+eNOLqLpY8Z5oMIlGV/ViZuRg==
X-Received: by 2002:aa7:9118:: with SMTP id 24mr32973317pfh.182.1575928827975;
        Mon, 09 Dec 2019 14:00:27 -0800 (PST)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:ffda:7716:9afc:1301])
        by smtp.gmail.com with ESMTPSA id f13sm450355pfa.57.2019.12.09.14.00.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Dec 2019 14:00:27 -0800 (PST)
From:   Evan Green <evgreen@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Can Guo <cang@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] phy: ufs-qcom: Invert PCS ready logic for SDM845 UFS
Date:   Mon,  9 Dec 2019 14:00:12 -0800
Message-Id: <20191209135934.1.Iaaf3ad8a27b00f2f2bc333486a1ecc9985bb5170@changeid>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM845 UFS phy seems to want to do a low transition to become
ready, rather than a high transition. Without this, I am unable to
enumerate UFS on SDM845 when booted from USB.

Fixes: 14ced7e3a1a ('phy: qcom-qmp: Correct ready status, again')

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Bjorn,
At this point I'm super confused on what the correct behavior
should be. Lack of documentation doesn't help. I'm worried that this
change breaks UFS on some other platforms, so I'm hoping you or some
PHY folks might have some advice on what the right thing to do is.

---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 091e20303a14d..c4f4294360b6e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1657,7 +1657,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	if (cfg->type == PHY_TYPE_UFS) {
 		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
 		mask = PCS_READY;
-		ready = PCS_READY;
+		ready = 0;
 	} else {
 		status = pcs + cfg->regs[QPHY_PCS_STATUS];
 		mask = PHYSTATUS;
-- 
2.21.0

