Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D062A49C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgKCPan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbgKCP31 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:27 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAA2C061A47
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:27 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id b3so13090620wrx.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEacfaBdqZh0B7ZbNsNCq6KuBVk2JdD7zBiGgdEC+rM=;
        b=s+kNyl12YcpOWADRKsYIAX85d2Y+TyOnhAabCNx+LxR22W+AmrrYRBaMgLkPWopo/5
         7uP8bqlYAbV4+/XpIc3jPFk2zLocfTvOibSLY28XCdh4vX9CQ3A6S6obeCKSL128ZKde
         IUfCB2jaaXW4Aw0zAEcjiHTstIBCsV3o6WOPZkY6EoEmmnzhFgBNWQA2+q9QyBE6LxPS
         5hhAogHZCa3TySM2jWzne/oUbTXdd4XgG6rlImo+1uYOMZyx6W7BtMhxyKswW9JJ+eQ4
         n8J6xXJbrLi7f2az/euKyuH98sfpTpOeZQu1MJN6Jnsl+S6nwJiTFzixM+pte/8qeWq0
         Vr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEacfaBdqZh0B7ZbNsNCq6KuBVk2JdD7zBiGgdEC+rM=;
        b=Wh0BUZcnt2WCSKkC2z/mWbKlaC2DkwDIRP5Qn7NAzNsQ0vJJha5Mr5m094VbCdD0N8
         Fz8tI2thxuY3aFDpqJBKE/jNfc6O3zSqxqZpmNpI21+KTdMqANv9brtHfJUbWpCPqCey
         59d4f/FXM7jdjjWAf2ji1GZ3B9BLc/OvjG1DyK0c9gJFMnItSX9eO0Jx7mU3y4tvra48
         ENubqgroFjoJO6fahl5TPDuGHO4gw9r60l6G2W67sC4PKXjoaPAJCt9vFRHjOsIcrTNo
         Xyjn3KiN6AdNWp2pJ+48RFDMN/4r+jPtIjjlavLvD4gsts14MkNvQChQF69BQ2oxcwg0
         DN3w==
X-Gm-Message-State: AOAM532AnauYvwH0+lQAh/vfO/TBjjIxTNmGrUzdsCFO0+MNFyMmKh6J
        McutXmWJOmCz10yQ/LwN+TA4Tg==
X-Google-Smtp-Source: ABdhPJwn2pLskNkvhAY/Gr51lofYiHg1wmA60U4MxqpI2ygU/qoTBAf+G3wkkETqQEnhrErhskA1Og==
X-Received: by 2002:adf:8366:: with SMTP id 93mr26923191wrd.6.1604417366022;
        Tue, 03 Nov 2020 07:29:26 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:25 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 12/25] soc: qcom: qcom-geni-se: Fix misnamed function parameter 'rx_rfr'
Date:   Tue,  3 Nov 2020 15:28:25 +0000
Message-Id: <20201103152838.1290217-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/qcom-geni-se.c:85: warning: Cannot understand  * @struct geni_wrapper - Data structure to represent the QUP Wrapper Core
 drivers/soc/qcom/qcom-geni-se.c:246: warning: Function parameter or member 'rx_rfr' not described in 'geni_se_init'
 drivers/soc/qcom/qcom-geni-se.c:246: warning: Excess function parameter 'rx_rfr_wm' description in 'geni_se_init'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7649b2057b9a7..9da904d137dc3 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -82,10 +82,11 @@
 #define NUM_AHB_CLKS 2
 
 /**
- * @struct geni_wrapper - Data structure to represent the QUP Wrapper Core
+ * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
  * @dev:		Device pointer of the QUP wrapper core
  * @base:		Base address of this instance of QUP wrapper core
  * @ahb_clks:		Handle to the primary & secondary AHB clocks
+ * @to_core:		Core ICC path
  */
 struct geni_wrapper {
 	struct device *dev;
@@ -237,7 +238,7 @@ static void geni_se_irq_clear(struct geni_se *se)
  * geni_se_init() - Initialize the GENI serial engine
  * @se:		Pointer to the concerned serial engine.
  * @rx_wm:	Receive watermark, in units of FIFO words.
- * @rx_rfr_wm:	Ready-for-receive watermark, in units of FIFO words.
+ * @rx_rfr:	Ready-for-receive watermark, in units of FIFO words.
  *
  * This function is used to initialize the GENI serial engine, configure
  * receive watermark and ready-for-receive watermarks.
-- 
2.25.1

