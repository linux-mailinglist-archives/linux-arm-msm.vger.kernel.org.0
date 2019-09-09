Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C82AD4A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 10:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfIIITW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 04:19:22 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35361 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfIIITW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 04:19:22 -0400
Received: by mail-wm1-f67.google.com with SMTP id n10so13524925wmj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IQx2hKMgmP9XOyhFpC2qn9Y+bupvqz+vNmxTVrE/dzQ=;
        b=owt9bXuU0Nf8BzM8qdIXU1q6gtY/bFx66KTZIb7Kjpj+IGXKChmf6uhXmbxQmtp/ty
         2OCv5Z4Yr4coK6NJbodfGPo4mz3jFJRCGX1pagnop3I+er8B5jY7UVlN9SiEO7KZjes6
         +5KaVSzTlmVE5tgHOSaUKp5W10aoq7lOHBRROnVpcw8SK6eDqzmgmXc/NzUVtlAUOJCR
         p66oOvuyXXWPpcOg5p5e1HL2+WGul7CIPNru5rWe6G9M+2ovTEEWJ5PlX3ukEi0VBhPl
         x4NjoETERFW7kvmV7XLAnqaOjycMuKEPsth+UZDQmPQWOyV6XMwohCckA+R3GAMZTm4J
         xqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IQx2hKMgmP9XOyhFpC2qn9Y+bupvqz+vNmxTVrE/dzQ=;
        b=t+huC9n5rw17UDCwRHEvg9qiYKh+sHkjF04f222QHOgHcJE7ul5vW1A9ay85y3Ft7u
         XwQpUVL/7clygFw+ITJ/XDWtSNiqWi975HzvJKx0q5yB4gW5/QKderh/yjo7yKRU9smK
         SdovXLDqT9wVfAMDwqE3eTrKz5e19jCCHqompQb8ugKRLaTKvMlx2Efjkc4FS76DdFIV
         LBeG8YcloKwDTEeCRdV1AL6XAHf8T5Vfgz8f3ij0u+dTlyaTx8X+eHd2U14W8iC4hN6B
         N9/t8Ia7Xv4Pou8gLs/ipWbtJX2W2Toocni759k+ZOobIIS0NAJ6EB9lF57nyt+9oGG1
         vf+g==
X-Gm-Message-State: APjAAAVN7qrMkh/6igbyBvqPGg+8Zm/p/VOzLAW7NoJQ8Qf3aAA4rPhb
        XD/6PYKFskMd3QyL7uuly770mA==
X-Google-Smtp-Source: APXvYqwps9lwJpFgo8szWgk2epskX4IHhTOjCIcIPUyAfdOHZ8J+CVjeDJAX6FtA5uz7TGHAgIQzlg==
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr16732930wmj.2.1568017160359;
        Mon, 09 Sep 2019 01:19:20 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id i9sm17332675wrb.18.2019.09.09.01.19.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Sep 2019 01:19:19 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, vkamble@qti.qualcomm.com
Subject: [PATCH] mailbox: qcom-apcs: fix max_register value
Date:   Mon,  9 Sep 2019 10:19:16 +0200
Message-Id: <20190909081916.4379-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mailbox length is 0x1000 hence the max_register value is 0xFFC.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479c..e5d6b1b70441 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -28,7 +28,7 @@ static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x1000,
+	.max_register = 0xFFC,
 	.fast_io = true,
 };
 
-- 
2.23.0

