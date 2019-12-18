Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079F3123C7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 02:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfLRBgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 20:36:44 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43028 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfLRBgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 20:36:44 -0500
Received: by mail-oi1-f196.google.com with SMTP id x14so255068oic.10;
        Tue, 17 Dec 2019 17:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7We/VEpgPiMO8619gdnlWocsaTJDXOtjnUr1/nSx8fc=;
        b=o5sn19xYpsolLUaVkAhovodFsZ6cH479qBZHqe8Sd4qEQq8R7uKRLI8d1Y3ujEPwuC
         QSYoAYPqDfS9uR+QpH0vvw47Vc335cPD0qXi97g5xHuyl6QAHyTilCPG0qnAHoEbPknx
         VyzS6XGPd//b2SovmNEcNj9dyOW4VV8tlcO0HYfwCqxZm6mq+9EJCFYeit4plT/V+K8Z
         ogf14LiwD1lKm4sS9Mb2TcpL3GGKIi2fdCney7o4q4lHN+g+tzWM9ZaC1LPhbUFFNqB5
         jWb7CWBbRBC9TnvbZhgAVJlzBSue2D2Heim/a35fVllyjiz1y+3WxGY94m36N/neI5AU
         EvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7We/VEpgPiMO8619gdnlWocsaTJDXOtjnUr1/nSx8fc=;
        b=End1jk61cNSLn8/Jn1I0Mf0JdBUP0mkKog4QOi78ktPWCx2gebCHqrPZvJfz/YSLXq
         FVOZzaDFXfYB2cue23xfm8Ep+4WXI02A1c9hKzjYCwQdIcDLknE3rMhr52726wF12QOY
         +p5h0y/f8F5f9J67JupRkY4eoPox7J84vcSLZFdjo64xvJPi1xodu9iDeoDcnfoXn5Pt
         716/VBMQQU+PyJvW1fMF9v9fI890T5MyyhVI1B5vyHsMcT4pzM1t9riQjdBmnv11NwRu
         JXIXAmmrHnQcrNeObhoYWWZr+b6Zq5BVUrI2VOiQM8cj40WeqEPJZoQuzxLPlQFax9jo
         bEng==
X-Gm-Message-State: APjAAAVG2YK4xxKUseP8cstsdvVi0Mp9+s1sq46j3TeKhQ93YlP8HYIJ
        v4t6UKkq5c8WXI6rxpnfVVI=
X-Google-Smtp-Source: APXvYqxfBKcwX8aeW0HewfvN2cqmu2c2ajYXbN+QgfEowi0MlYsJjMGfXm1hIlLrOKU+SJzHeeobjQ==
X-Received: by 2002:aca:1c09:: with SMTP id c9mr60123oic.85.1576633002813;
        Tue, 17 Dec 2019 17:36:42 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 15sm253487oix.46.2019.12.17.17.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 17:36:42 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] phy: qualcomm: Adjust indentation in read_poll_timeout
Date:   Tue, 17 Dec 2019 18:36:37 -0700
Message-Id: <20191218013637.29123-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clang warns:

../drivers/phy/qualcomm/phy-qcom-apq8064-sata.c:83:4: warning:
misleading indentation; statement is not part of the previous 'if'
[-Wmisleading-indentation]
                 usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
                 ^
../drivers/phy/qualcomm/phy-qcom-apq8064-sata.c:80:3: note: previous
statement is here
                if (readl_relaxed(addr) & mask)
                ^
1 warning generated.

This warning occurs because there is a space after the tab on this line.
Remove it so that the indentation is consistent with the Linux kernel
coding style and clang no longer warns.

Fixes: 1de990d8a169 ("phy: qcom: Add driver for QCOM APQ8064 SATA PHY")
Link: https://github.com/ClangBuiltLinux/linux/issues/816
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index 42bc5150dd92..febe0aef68d4 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -80,7 +80,7 @@ static int read_poll_timeout(void __iomem *addr, u32 mask)
 		if (readl_relaxed(addr) & mask)
 			return 0;
 
-		 usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
+		usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
 	} while (!time_after(jiffies, timeout));
 
 	return (readl_relaxed(addr) & mask) ? 0 : -ETIMEDOUT;
-- 
2.24.1

