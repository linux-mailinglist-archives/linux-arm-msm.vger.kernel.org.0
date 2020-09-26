Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77518279978
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbgIZNDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729391AbgIZNDO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:03:14 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD6EC0613D4;
        Sat, 26 Sep 2020 06:03:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v12so2117620wmh.3;
        Sat, 26 Sep 2020 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7xRN6JM6gVfHYFeOzAKEvV3V8gg06g9vTPez6zHGQOE=;
        b=fu+fFhMbAdn+utrBsyfDXK2kOfKO2jHdUXkN+4eWjxuQeaAaqAuUOS546QeveDU7fn
         AT0YkK2Qo5FUw0YHfnD8ZYON3/0ESlVpwurpPxoEy/5JrIuQzRqzOCX7PBvWHH+FXwHg
         DVqhGAbWdlrcJ2kWV5zvCydsF0TM/8PD+kzTgFjiBDGgMbqAPdK8GlRq5bjXvKHCmdpq
         DtcECehTcmDZq6boDRa5UkplBx9pl3USN1MuAEfPvYCiFCKv3xEy4hX44ToTT7N6EHd+
         qYwSfL9FemZPJqbs5g7LQX9N8/m/IbwqsfIcpNnE0Q3xpPn81h9KpV/0IEMXVEaNIlv1
         4sLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7xRN6JM6gVfHYFeOzAKEvV3V8gg06g9vTPez6zHGQOE=;
        b=PuYaH1lQ8MneqIc33BQXVEpWfb52dnrS/js7rua1tv0i94hWxaYArJ6Kjs7IXKeXXS
         77XZFwS7fIBWVLMXisOwvdJCjLC3/6NwtAbAi5VSlLuFdhV9Kz4xfDjd/YcG5Q/eq29n
         lS6OSLfhS01rQV8F60O9dlNjer08wRU6X9MFhq+eep530dNKMsTewTjUtETScNPAa3Vm
         2vBFY7ynxQysVObXm+vfUukEX8moj+M4d03Lueg0ctWou7cSnZKUrH8WpZEO1JnimgVh
         WJCpcb7p0prsS2n9An8WzKlmN6idJz9bc9OeDLk3PnfJWp4U2LhKU2RQMgmQRfBxYdKk
         RbGA==
X-Gm-Message-State: AOAM531dTtkajtW4hSWJPh8RypJP2sf+iAJsbM3zK7NsXuNkledLWDxB
        2Doy/d5AZDMzlZbuadhgZ46dAKB/+77KgA==
X-Google-Smtp-Source: ABdhPJyiwc6uccnkTQUaHiHSNCRW3WnKv8dZ9vDjqU2c0SQw5NSlLor9g1OVqEyvHxnIT6geGs4jMw==
X-Received: by 2002:a05:600c:210c:: with SMTP id u12mr2725954wml.185.1601125392593;
        Sat, 26 Sep 2020 06:03:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id d83sm2853213wmf.23.2020.09.26.06.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:03:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] clk: qcom: mmcc-sdm660: Add MDP clock source CXC to MDSS GDSC
Date:   Sat, 26 Sep 2020 15:03:04 +0200
Message-Id: <20200926130306.13843-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130306.13843-1-kholk11@gmail.com>
References: <20200926130306.13843-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

It is required for optimal performance and to avoid MDP stalls to
retain mem/periph on GDSC enablement: to achieve this, let's add
the required CXC to the MDSS GDSC.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/clk/qcom/mmcc-sdm660.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 234aca7c873b..7b1384cf8506 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2572,6 +2572,8 @@ static struct gdsc mdss_gdsc = {
 	.pd = {
 		.name = "mdss",
 	},
+	.cxcs = (unsigned int []){ 0x2040 },
+	.cxc_count = 1,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.28.0

