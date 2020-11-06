Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D0E2A97E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 15:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgKFOss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 09:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbgKFOsr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 09:48:47 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A35C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 06:48:46 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id c17so1585600wrc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 06:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKUVdCXUzjzLxhYYwZ9oyOQfl5zsmsvI+sfdYUlShXc=;
        b=Lv+WXdyd4ryinhARuEv8v1Ng3HyuRyBWyQmuuR3lozyQ5XKqcmeJuXFDhpAxNArAPw
         UqTuNiMKkMNAFshYcuw99anJkxXLhcLqWkJvmyPROYdj5bMzxG9dxnhRmygG8QaXDZvp
         vV7j6n3oXwtLOS42Xhy6Odx1ggkz+uiH8y66zylZFdoXAskBfbsrhRktT1wTdj2lzfMx
         wLN6rt++C0nvgoJrKxuaYh4XgbTDb6TbIhgSYj5VelHNJGFTwO+EBpkmXqy3dw4KZu+3
         4j9PUT1ybDiaOtmD4yeHvVeFHI4EJ4eY+YiTHiUm+V0xGc0kwzBkHF7FyD9ETaqtCV/a
         I7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKUVdCXUzjzLxhYYwZ9oyOQfl5zsmsvI+sfdYUlShXc=;
        b=O4KNw098s3DYFDrAwfozWgX1NnDWgoV4Hg2Jksn9V4vYOVUWxhWKfUbhjj2h4RZVFR
         mIXRmUNaqr0xSs95g8Iv+GoFlh5htPervnv6akoeTZMAS8IeQrNZXIJoXwF/3pSn5dn1
         m+eGbNB5wTXe30SWK8eA+LZprQffAVrL5OCQXB38/fJ+6SPV3sy6zvshQeSAgKQuRFL8
         m9yvgtLtfe157GLMziG9+w57AeZUDkr/kOLt52bcPfXnNTcWtMLS2gDL7/ARo7+2tMhX
         AdtzwYxeVdMRG6AtCNbiHXbLIAL5QtX4h8sNV5ThTYS4XSeCC3fbHFJlnsugluu2cZZ7
         tAyg==
X-Gm-Message-State: AOAM531PSk2F81AO8llDJKa2YT/2Smqo3LjXnNMJa3yZ82tWPx51xUjp
        ttM+tAXGpS7YZMN6YqMy73/gEg==
X-Google-Smtp-Source: ABdhPJweQj0LMObZld5wEpdU1lXP99No9zh+9pUYIqc4JskDsA0ZPDRp0vfYD6EaUDWFj6x9ALZuxQ==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr3294056wrw.201.1604674124796;
        Fri, 06 Nov 2020 06:48:44 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id z2sm2657136wmf.45.2020.11.06.06.48.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 06:48:44 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org, luca@z3ntu.xyz, masneyb@onstation.org
Cc:     bjorn.andersson@linaro.org, saravanak@google.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] interconnect: qcom: msm8974: Prevent integer overflow in rate
Date:   Fri,  6 Nov 2020 16:48:47 +0200
Message-Id: <20201106144847.7726-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When sync_state support got introduced recently, by default we try to
set the NoCs to run initially at maximum rate. But as these values are
aggregated, we may end with a really big clock rate value, which is
then converted from "u64" to "long" during the clock rate rounding.
But on 32bit platforms this may result an overflow. Fix it by making
sure that the rate is within range.

Reported-by: Luca Weiss <luca@z3ntu.xyz>
Fixes: b1d681d8d324 ("interconnect: Add sync state support")
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/msm8974.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index 3a313e11e73d..b6b639dad691 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -618,6 +618,8 @@ static int msm8974_icc_set(struct icc_node *src, struct icc_node *dst)
 
 	do_div(rate, src_qn->buswidth);
 
+	rate = min_t(u32, rate, INT_MAX);
+
 	if (src_qn->rate == rate)
 		return 0;
 
@@ -758,6 +760,7 @@ static struct platform_driver msm8974_noc_driver = {
 	.driver = {
 		.name = "qnoc-msm8974",
 		.of_match_table = msm8974_noc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(msm8974_noc_driver);
