Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CD91DC6CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 08:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgEUGEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 02:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbgEUGEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 02:04:30 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2277C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 23:04:30 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so2674450pgv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrczHrPxmDimhB0/0NhkdkJAAqMI1FXR2cfHE8LPPuw=;
        b=DkXKFqyffhopz4NwbPl/fCxYBCpjpkQxwbDhRe0RUw/0i3pGXZNj5k9ckrmZ6QPsFQ
         V9rj/yOL43qEhl9wMacg4mtbJoXeNHfw9/bOHy2t6JwOqWI4WIcYNTWFX4XiNPblmCCW
         Tv5wCnrNEk90bcB8j30HJ/LC1oKhJUUlhuV+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrczHrPxmDimhB0/0NhkdkJAAqMI1FXR2cfHE8LPPuw=;
        b=GENfQxvYlkp6TznKLQPGJLfuqObmX3b3l0zLp4ThrEbe8Ntav9x8QkbOxKMNStXXQu
         9heVwv61waYpCPfmtcRMv6qclZD5y48JNNN9SN0yYgEep1zEOZhdFHXA/+zBy4k1HryW
         5xLCueodcKYKAcvx1FSkIHtz1Bw3b0CC2Dj8WCFuSYUUodYiSyWuxYRCINNFUVJ9Hj8y
         7B7QXtfCbhnV+z3KQ4RSBGfqL+qTYe/zkfeYWTQLV1sTLdHvAJvcSC66NaViVmsEmXlC
         uCUUtSH/P4AYqniXeBR166TCI8GSroGzO/WRLgQu2V8AgmrqEM7PM7Damt3/heiz94oJ
         74Xw==
X-Gm-Message-State: AOAM531HCzh2L5AN408SD40o5yK+xszpBLknaFvoyskJi2M4MOjdyKUP
        gBekWvfuyJsnLROVKfL4SM6nhA==
X-Google-Smtp-Source: ABdhPJzHcQpJ2Uhf5/nuD8OHTpeaxu6Fxj7Zae/4TDavTQ4WzKGzxsX8Csvylbok0M8FpG1epS82KQ==
X-Received: by 2002:a62:ddd6:: with SMTP id w205mr7790955pff.291.1590041070323;
        Wed, 20 May 2020 23:04:30 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k18sm3590146pfg.217.2020.05.20.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 23:04:29 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCHv3/RESEND 2/3] soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
Date:   Wed, 20 May 2020 23:04:24 -0700
Message-Id: <20200521060425.24285-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200521060425.24285-1-swboyd@chromium.org>
References: <20200521060425.24285-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

readl() returns a u32, and BITS_PER_LONG is different on 32-bit vs.
64-bit architectures. Let's loop over the possible bits set in that type
instead of looping over more bits than we ever may need to.

Cc: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 60fc56987659..ce725d4ff097 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -383,7 +383,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 	irq_status = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_STATUS);
 
-	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
+	for_each_set_bit(i, &irq_status, BITS_PER_TYPE(u32)) {
 		req = get_req_from_tcs(drv, i);
 		if (!req) {
 			WARN_ON(1);
-- 
Sent by a computer, using git, on the internet

