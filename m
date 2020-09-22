Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B29273CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 10:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIVICA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 04:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgIVIB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 04:01:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E7DC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 01:01:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so15925559wrn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 01:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KvUNVecRuswasTBUmRvR/hiS3vZeo5Iq8dsQzJ5frKc=;
        b=iS2QY1e+Y4tcJz8z1R6KHyt0Y3f4wqFiSKT3son1r5sy/EOGtPnOU7TzCHgjx4l1Mj
         NO8z1Bkxzg8O8PLwpwh5TRL1IozkfFjrXgw0cLN/mkoyfQnmfdbQL2sJ3+sTkYnytU28
         bmCkNwb5RcIuojBZ/TgEXJ6L+JUrXI40ysvHU+/RgDyQ1ywMr6QAK/e5/F+kv2uz58Vk
         a2GElRAd+5hLbo5O+liYHiVPBQPAbX0yf8lZ4vk51G7nYSYyUimm6TdkZkKH/ReDCdzt
         Ol3v8I2GMrC2w0TLGCobpiexuu7hNsr21IsrlY8Fncf1OI5AdWiDKPB6pjo1ko98ZzGg
         51og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KvUNVecRuswasTBUmRvR/hiS3vZeo5Iq8dsQzJ5frKc=;
        b=Z2bient/B4TTsyuPXQ3/QYUn0TRQgCZiB4Oe16/lWWhEPDi9TAkiA0CdQN7MA663LK
         9D40iFynECp7dY3zxcH5F0loo+cgmoIjl4fQRE6aUr1GNXHoiXbg1Ni8nUuT0NfM9gzN
         PtPg54nqpcyequBqGuvTgVLC9hAytQfIlRyC83mRbK95WnxOnuVNCRsB8YrVgBAobEN7
         l6QUog7am1wfQk6WiUpxaMZ0mvgGMuQnKBKoOlYJWA73VoEERvlHcAbwA2H1xFBAT7Kz
         +CRpfnXo3r4EQTwmm+7YKQplefIbMu+BkNtYo5+WWOuZetkjh5VWMVNZDxrwWVbodn5v
         eMgA==
X-Gm-Message-State: AOAM532rP9CLetOMu9Vg1lV2Yo8/fI5LQhyjw9r6wpH+YayPPypYzk6K
        30Jpombi01BcTcgqYd6rWbV0WmUqGjYQIA==
X-Google-Smtp-Source: ABdhPJwI3GLj22P99TK0IPw7dh06LOEpEoTlcsqqv3MjbmkDpYYQx6CcBJ77T0kA1IF5IuQpK1UOeg==
X-Received: by 2002:adf:f3c6:: with SMTP id g6mr4185103wrp.340.1600761718036;
        Tue, 22 Sep 2020 01:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:490:8730:8c80:20bb:41c0:95bb])
        by smtp.gmail.com with ESMTPSA id c14sm25965341wrm.64.2020.09.22.01.01.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 01:01:57 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Move irq check in controller registration
Date:   Tue, 22 Sep 2020 10:07:46 +0200
Message-Id: <1600762066-25849-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move irq number check early in mhi_register_controller along
with other mandatory parameters checking.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 drivers/bus/mhi/core/pm.c   | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index ca08437..34f9ae3 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -871,7 +871,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
-	    !mhi_cntrl->write_reg)
+	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
 		return -EINVAL;
 
 	ret = parse_config(mhi_cntrl, config);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 3de7b16..07efdbc 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -918,9 +918,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	dev_info(dev, "Requested to power ON\n");
 
-	if (mhi_cntrl->nr_irqs < 1)
-		return -EINVAL;
-
 	/* Supply default wake routines if not provided by controller driver */
 	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
 	    !mhi_cntrl->wake_toggle) {
-- 
2.7.4

