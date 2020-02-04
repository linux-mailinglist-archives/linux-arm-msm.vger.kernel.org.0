Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51DB152127
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 20:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbgBDTcJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 14:32:09 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39457 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbgBDTb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 14:31:57 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so7685452plp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZS1QaVzaL6lAdBtnF8TiXHFpeIBpZHSsvKjHWm+HbIg=;
        b=Z7KaXVwTDC2U9AnpnBw8pkuAdK2Vw3+CP+Ef5xTQKKmDI8AvHhl/vLU1bbq+YOIZNV
         Pcnb6D6+57sVHrMt8DDd+Z4vblrE5E0/t4P8AiDsOehQRoM9MQGtl40M8V4e5YwQiO1y
         /hWkftP8Jk2ht7YfQqUIcfS+vD0dS5AJSZp2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZS1QaVzaL6lAdBtnF8TiXHFpeIBpZHSsvKjHWm+HbIg=;
        b=rarNwgvmppgBsxgIloHHAfBDyl4ZULCkwybr+1+LbrPO0xYtdqS/vMnnf/YyFWttOx
         gxSGZo/UY8/iaiVtZdwRlkJyvt4p7hTSePHoIsPRlevvKxXeQdP5MfUoT155dwafLyy/
         8vCfcMibMJ9/GgOyArxLcGvkKD+wlcxPrpP4lImmEoz3AWrbwvjEYwGGyX9mfIXuvpPG
         BBucP4rfx8y9OumZSPhI5x/gj9Hf4O4co/lrEWXwY62nEsbYv7VeFGojBwUoCBSs0Mu8
         a9zcqs8afSvidz9MKRzCKy4GcIIE0ArqUVnrPueePOy5azvBB9/TGwTCiVBo55OzCN16
         A82w==
X-Gm-Message-State: APjAAAVOPAZiTszJCq9A7rzYprUtpZKbMIo2w1mtunjz+bxHg9MRxRoR
        77Q3kGVPK/ZvuszDpFom6npLPA==
X-Google-Smtp-Source: APXvYqx2iAESMw7/Six55EXTjJijW5Oc8a+eFWhBfTpqIYQo4lKZL5esJqIgY96smpydAy6yWm2duA==
X-Received: by 2002:a17:902:bc88:: with SMTP id bb8mr26260899plb.274.1580844716920;
        Tue, 04 Feb 2020 11:31:56 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g18sm24956626pfi.80.2020.02.04.11.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:31:56 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] i2c: qcom-geni: Drop of_platform.h include
Date:   Tue,  4 Feb 2020 11:31:52 -0800
Message-Id: <20200204193152.124980-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204193152.124980-1-swboyd@chromium.org>
References: <20200204193152.124980-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver doesn't call any DT platform functions like of_platform_*().
Remove the include as it isn't used.

Cc: Girish Mahadevan <girishm@codeaurora.org>
Cc: Dilip Kota <dkota@codeaurora.org>
Cc: Alok Chauhan <alokc@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 192a8f622f3d..4378eb7b6633 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/qcom-geni-se.h>
-- 
Sent by a computer, using git, on the internet

