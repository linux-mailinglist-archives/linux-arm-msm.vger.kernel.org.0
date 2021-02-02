Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09E30CC43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 20:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbhBBTta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 14:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240120AbhBBTs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 14:48:59 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837BCC061788
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 11:47:54 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id e9so3094739pjj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 11:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=19MA6VmZ1TXGx8xgl9B9Clwb3xJWJIXQ38902RwSETk=;
        b=EL9fLzJ5P3xbNoPG8Vlm3VM/gRsuPNy/rlkgBwqU+bfbZUtgTS8ZiUYTrOCFk6Tpdt
         /2Ivlcgw/W5ksz7SjXnpr+qapDNeWulA/kGj/NkvEiLhh9o8p37NXDSt3Ip71keOqeDf
         z/4COF+i+KNTUQ8Dw+uakxac8ZS7upbcIPJic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=19MA6VmZ1TXGx8xgl9B9Clwb3xJWJIXQ38902RwSETk=;
        b=bDqb7fhas5c9Er54nUG2/vQWrUJc08cW85UHFtnbv+OPrLBOXg/BdGszezISLCCLFt
         sFkFAyS9CMphvjyfFY3OX5T+yQ7vb9zjS9VZkZQ6LLVav78a+Tfy7aODXIchGeMLES4e
         zXj3yujqGyDeofqr+quHE5vMq56QPsp2jtZVgddT6d01eh40soBr4hJed91xNgFXgYmq
         mu7bne1Q+1h7Xp7kDl4zldjWEO5i/2OO0/Co6fdernumnL4jDdhjV9HaX06d5JD+l5WP
         XCHOBgfmdBmaObWTQ9ula2ybQCq2VYtrJ1LylqyV7NSeH6T+CNZJ9atOqiyWGVFaXxRB
         GLbg==
X-Gm-Message-State: AOAM533x3WBJYIIblkzab7YRdncdRBr8arjDTsJ5hxlL2iBHi5HWCA1n
        dfH1QIHfJRy1SCebgAk1HSvV/1MTA0+RJg==
X-Google-Smtp-Source: ABdhPJwSL9tHYTjbifQL+Zy89Yj6xktCPVIn0O5ReEMsqIDmMMYCKbhDZN7ISmPAgxVTvhZ/nTKhog==
X-Received: by 2002:a17:90a:5318:: with SMTP id x24mr6051241pjh.226.1612295274185;
        Tue, 02 Feb 2021 11:47:54 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3571:bd6e:ee19:b59f])
        by smtp.gmail.com with ESMTPSA id j4sm17021751pfa.131.2021.02.02.11.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 11:47:53 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH -next] media: venus: Include io.h for memremap()
Date:   Tue,  2 Feb 2021 11:47:52 -0800
Message-Id: <20210202194752.247301-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This file uses memremap() now, so we should include io.h instead of
relying on any sort of implicit include elsewhere.

Cc: Dikshita Agarwal <dikshita@codeaurora.org>
Fixes: 0ca0ca980505 ("media: venus: core: add support to dump FW region")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1471c7f9c89d..915b3ed8ed64 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -5,6 +5,7 @@
  */
 #include <linux/init.h>
 #include <linux/interconnect.h>
+#include <linux/io.h>
 #include <linux/ioctl.h>
 #include <linux/delay.h>
 #include <linux/devcoredump.h>

base-commit: 0ca0ca9805055bb0efc16890f9d6433c65bd07cc
-- 
https://chromeos.dev

