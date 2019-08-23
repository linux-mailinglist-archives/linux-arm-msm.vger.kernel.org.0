Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEE59A8F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390303AbfHWHe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:34:56 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46341 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388420AbfHWHe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:34:56 -0400
Received: by mail-lf1-f68.google.com with SMTP id n19so6402956lfe.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aLw4CRSPJ3WKrmTX2TV02F/5DZkmqEb7ZJ94kU2yaI8=;
        b=mphS1O4ssdOoGeOzJ5pPlICCD+JVCVu7mO1MYI2hIn4o48+vvTMUX6lt5XrggcYA32
         3In3CIS0bcTGBJwH+b1sZUdhF/nQD37bGMatfAZpEdoazdQHOLooCOCJ1pWPa3JpUSFp
         s/s1cqjf5sVKoYN7NiOpW2LyVU6l4EtZ5sdFNNiKvnc0dy8TNTNdKsG/aH+lB5k1Jsi1
         sdntV9G3GRZAv74A3j7jm4q0qvTQN+sTzDNn8VmGxd9kJmr5KxouK+7IDh1pQSWaobo8
         vYI0wikqg9vW9Iv6zET6CYfA6LUFuA3q6HYz41laNEhEJRUKglRPTb7n9qTylzzu8y4k
         11bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aLw4CRSPJ3WKrmTX2TV02F/5DZkmqEb7ZJ94kU2yaI8=;
        b=YhaylM7kMIZvCeUDSk5szqC897LiI6AManADJ1XuT7RzD6/R5TdcXNOdNoJPhlVnXG
         St/dcEIw6Ko8CL8/f4eMffgiS/WF0AJzLJiLGUlK4KPlcyo7fg2+15J81w+d/nbb5Vfg
         M9poQ9+HunFu1xmN3pc76cYEko0NSqDQf+SKUKK8vSdQr/WMNIDA0DMxdxQQ3wbfgna8
         m7385GHhEFl2Mio3L0XuWcPTT7g8BvHXYyDfy8rlkqGcOOvBOVI1DGaMBmJ4xM2MyXMk
         hA4ijRslFvF14VdLbG7vmbWigoagxdWLGNsDYLZmQNYaRAMM8VOMm6VHpImo4VweEhfe
         OK+Q==
X-Gm-Message-State: APjAAAU1UTng328BJt/vcPNyDgutMI4bvK3wfOideGboOIt3tJEuF+B1
        CEKgvZQ7ILGAUwJpZWmEtJdSzw==
X-Google-Smtp-Source: APXvYqxxsyuYmqHanoZNUMD5o5aUUSlZcJr9+cGYQ4QpjraO5WVJnV9YZinq5/Pk3jeJh6ojZT+g4w==
X-Received: by 2002:a19:5217:: with SMTP id m23mr1846635lfb.124.1566545694604;
        Fri, 23 Aug 2019 00:34:54 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:34:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/6 v2] drm/msm/mdp4: Drop unused GPIO include
Date:   Fri, 23 Aug 2019 09:34:43 +0200
Message-Id: <20190823073448.8385-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This file is not using any symbols from <linux/gpio.h> so just
drop this include.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.3-rc1
- Collected review tag
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index ecef4f5b9f26..9262ed2dc8c3 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -5,8 +5,6 @@
  * Author: Vinay Simha <vinaysimha@inforcecomputing.com>
  */
 
-#include <linux/gpio.h>
-
 #include "mdp4_kms.h"
 
 struct mdp4_lvds_connector {
-- 
2.21.0

