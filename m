Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E323356A9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 12:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245379AbhDGK4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 06:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245237AbhDGK4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 06:56:04 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31A3C061762
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 03:55:54 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id qo10so16534095ejb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 03:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Ia0McVxup9Hx79aZ0xKYTAalm8Y6geuZEijF8tLAAw=;
        b=XjgKN8sK4jSrmryecclw+cUT1T4/mjWQ6GWSdwvGq7zPmhu3BiGFu5N7kLd7PxMptK
         GtfKxTXRcVmuhpAqPDYnIkAmK1sw2ByTabVw6E8tJLhtZJ0RsMVNC1FticcyFGNlySUQ
         iGSXsSpFOLKHNGdQYnk2Lv5uHZdBDbfkKRK9kAd372ftyX466HBZkIIszHmm3ZTv+jlF
         H3dJeBaJ/wUp74Wai2h+GhEJTaq6ONvcF1rNRuU5Yo2ZjstjtpRstsaRStK/YR+tU5Fh
         INHT2WTETjuxM3SM686wOpm3SqLlyy9iUn6pmOIeiGEiPSbV1H21t8PjDqGAnchZ2D5t
         s+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Ia0McVxup9Hx79aZ0xKYTAalm8Y6geuZEijF8tLAAw=;
        b=F4MyyfshlCiqOHPxVvaReR92+L6pesKV90Ros3nXf7S8xI/LXkVrY35jYEZ4QnNYfi
         jdZM1xS59PKTL904Zjo+Ipw36cFzMJhTNwnQJQijT1hEGsM/VxxKhM4X7TOUunOqJsZx
         OFTz2HBPjWA/5/rrZkl9JiiViV/O+INwiFAk4p9wcgdwPE0sJSWj4Ry4Bfn3P8VIX/HQ
         CyRYK4DbTUibSg6InDype2e7kTIsU0nZsFtupQfJX21Buu+aGRchZaWfXMq8j5n/pbKQ
         vfC7PKTioq9d2pGf4ylrSMZ/Kum5PlvH+FcA3EDlp/LomDm6v9KiAlVSB6uZHkNzD+AP
         4JSg==
X-Gm-Message-State: AOAM532PYyZGUL6iwAs4BiKGylh77nOfuu2jxHmO8Y5OviF7wQhRtNy0
        /sFASuE8Euu2GoVYm6Hd5CEDBQ==
X-Google-Smtp-Source: ABdhPJzkl/D7JffltlUnu02lHO0mcMYwj1pl6Z+yxBIKWESZPZWDJtbLK2iYEJlMr5qLoubg7LLx8Q==
X-Received: by 2002:a17:906:2759:: with SMTP id a25mr3092767ejd.122.1617792953545;
        Wed, 07 Apr 2021 03:55:53 -0700 (PDT)
Received: from localhost.localdomain (hst-221-20.medicom.bg. [84.238.221.20])
        by smtp.gmail.com with ESMTPSA id r17sm15463575edt.70.2021.04.07.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:55:53 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: core: Fix a warning in register offsets
Date:   Wed,  7 Apr 2021 13:55:49 +0300
Message-Id: <20210407105549.348178-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following sparse warnings:

core.c:227:41: warning: Using plain integer as NULL pointer
core.c:228:34: warning: Using plain integer as NULL pointer

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index f5b88b96f5f7..4451e3c11bc0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -224,8 +224,8 @@ static void venus_assign_register_offsets(struct venus_core *core)
 		core->cpu_cs_base = core->base + CPU_CS_BASE;
 		core->cpu_ic_base = core->base + CPU_IC_BASE;
 		core->wrapper_base = core->base + WRAPPER_BASE;
-		core->wrapper_tz_base = 0;
-		core->aon_base = 0;
+		core->wrapper_tz_base = NULL;
+		core->aon_base = NULL;
 	}
 }
 
-- 
2.25.1

