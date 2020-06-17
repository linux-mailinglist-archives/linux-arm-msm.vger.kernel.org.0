Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B79C1FC687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 08:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgFQG5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 02:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgFQG5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 02:57:13 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4177C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 23:57:13 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d8so473556plo.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 23:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MPJxEon2gYUIC1eBRZV/RlBMiONJCU2XKZGULfkvGk=;
        b=rHoCnRxvnrmgaj4fRk0J1CrA8J4Mo5Qe2GvZDECUAIAb/dJ5HFpgTiXEDdaz10gbnh
         qQ5Z/gLuhIAntuE+LHvNr+x471YNOePTowZIu0TeSRchYXULqbz2sA5b1b1ZvTkx3LxA
         MLDVhWknz8CCuv3dGmXA3sDQxvSexvAoUOzI25yvjkwCjuAqrXQZS6sYEkpWMYdaZEhF
         FWVYgsh1DrdB4BFiGfFx30RBCtcSVvjX+WI97PvXpNS9hwvqluqucVvaYzOw8B4vmNVL
         OJdx3zFGeGqO/UcKH5YyzcG5Gxg39PsPPBFS79H+F9ARxraVkKLzakd2Xay2QDm4EvDe
         qK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MPJxEon2gYUIC1eBRZV/RlBMiONJCU2XKZGULfkvGk=;
        b=sS0W5ArKfYZJ9vJZg91d376TyqLXiuqhTnwR8XTxXwnZPCIXrwjHKylDbq9RFQX4nu
         7ttY9n3MTd4PQM8RgXc7a0MiL9Su0BS4yL7i/rGeleZetFyQVCS7PP8QOdb65JA/3H5d
         XfosbvHGop0CREhJFADbXpEg8Q2uMIjVUJx9J7FuxwASLKmWpSMEXKQd7q/REhXtWg2q
         MbtaRvhFt4HQ9fDXAF4LYbDdFMovpmiVPZEXb9fKoNiSNPzqbHGpppZ6T2zRL7NT0d+P
         aE2rE3gtE9w4GnNNcyDMd6yaorQFyOu3xCk77V+4gAdkrIpo4mSH/DvGpnMsNowf++dN
         nfXg==
X-Gm-Message-State: AOAM531tWEFEi1Iwf26Vx5zmtpOP2novvHKsMMz5hQUkxrkQ0rgO6fTS
        66OiuBSloj1SfiH8LQ5aHT4uC7aUBMx8Hw==
X-Google-Smtp-Source: ABdhPJyRVPdDLYlf95aL0FMxAeW3J9UbAVTBuGtdTo7AGeDrvdDRy8/hJwujfN+ifRR95lmvjw+t6w==
X-Received: by 2002:a17:90a:aa8f:: with SMTP id l15mr6837206pjq.211.1592377032700;
        Tue, 16 Jun 2020 23:57:12 -0700 (PDT)
Received: from localhost.localdomain ([124.123.30.142])
        by smtp.gmail.com with ESMTPSA id x1sm4467625pju.3.2020.06.16.23.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 23:57:11 -0700 (PDT)
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
To:     linux-arm-msm@vger.kernel.org, inux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     sibis@codeaurora.org, vinod.koul@linaro.org, agross@kernel.org,
        ohad@wizery.com, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de, Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] remoteproc: qcom: q6v5-mss: Fix kfree build error
Date:   Wed, 17 Jun 2020 12:26:58 +0530
Message-Id: <20200617065658.27567-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds linux/slab.h to fix build error in qcom_q6v5_mss.c

Build error:
 ../drivers/remoteproc/qcom_q6v5_mss.c:
  In function ‘q6v5_mpss_init_image’:
 ../drivers/remoteproc/qcom_q6v5_mss.c:772:3:
  error: implicit declaration of function ‘kfree’;
  did you mean ‘vfree’? [-Werror=implicit-function-declaration]
   772 |   kfree(metadata);
       |   ^~~~~
       |   vfree

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index feb70283b6a2..903b2bb97e12 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/iopoll.h>
+#include <linux/slab.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
-- 
2.17.1

