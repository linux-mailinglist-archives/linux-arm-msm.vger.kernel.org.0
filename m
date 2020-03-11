Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E94518193C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 14:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgCKNJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 09:09:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33161 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729320AbgCKNJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 09:09:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id r7so3143624wmg.0;
        Wed, 11 Mar 2020 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJVm6/W/dblC5li5BDXut06eK44rSmFM2nibZMhRJDo=;
        b=BWbcIJHoZwo9oAvL97RDHBdAr9fP8kRFLjxrO14whg3Xmm3XixNXV3x/k2NanQGTuF
         W4SDNsNuGw9ohhTCjpp87w7loUocSf3Iy13sx8CWXEJFIpqnA6W5qUeJLolBqRlUxw3A
         Sw2vJQUKcjPUDyx4sjL8ymmqA88Rp0UPdUKMOxFPE0nKSritIDG8g87hHwHplrupaCL4
         6yHqzfx4HdRp4axZnZe9f/Dm4ACApZowgTya5LajwJesH/Lc1Ra8nvYSCR9rO5AfI/43
         N1RdEIfhU+1LRKekrX7KozOA3eZ+38+hCJ3WP6/HwY2KflrglJ7hp4tbxwWTcsQv4m5e
         JHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJVm6/W/dblC5li5BDXut06eK44rSmFM2nibZMhRJDo=;
        b=PNbcXn3z0+k0Z0SUglBYNXB751Zd2Am1mGUkMrMB01ILuLDQs+4+GXBa/wikpvhs97
         7c6eJLQKIHmTBgHRX9ymhE8HisE+9yVTOTBhKn4fe5kntlEIslEj9tyraDx77coSwMiN
         iVk0deZ2Lu3EIiiViAjc/ulwk+zOvduKCsUE6Eqb4hKTEqPxQ3aDFmNyQgAPN4oPc/q7
         BoxniRk2uR0xGxVY0uO+JMyNA3W6Rlp5cj65FhuD4Ul3PqS5Zuv4usnFR700/2rrTPTZ
         ykfr8YpDUDwpgbt6KSQoxsZ/QXV0+tTqkLcdCgzpxygmwRW8vUa67k2b9n9Wyf73b9Va
         G+Rw==
X-Gm-Message-State: ANhLgQ3f3CdXfDhKQL0Hqj7RX1WuYTJhw8lVWz9GmEfJROAX+LDuC7Lx
        ozd1k185k7dxSe20sNHFc+g=
X-Google-Smtp-Source: ADFU+vvnRqN0lS4mnL0B64o23avXBDhQxgQee42NMi5dTA5M2tbGj4N54ks/aPJbrEnGRZXSBJj5xg==
X-Received: by 2002:a05:600c:204:: with SMTP id 4mr3656396wmi.112.1583932166510;
        Wed, 11 Mar 2020 06:09:26 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id f187sm4984036wme.31.2020.03.11.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:09:25 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     agross@kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: qcom_scm: add ipq806x with no clock
Date:   Wed, 11 Mar 2020 14:09:17 +0100
Message-Id: <20200311130918.753-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ipq806x rpm definition was missing for a long time.
Add this to make this soc support rpm.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/firmware/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 059bb0fbae9e..d13ef3cd8cf5 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1144,6 +1144,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 							     SCM_HAS_BUS_CLK)
 	},
 	{ .compatible = "qcom,scm-ipq4019" },
+	{ .compatible = "qcom,scm-ipq806x" },
 	{ .compatible = "qcom,scm-msm8660", .data = (void *) SCM_HAS_CORE_CLK },
 	{ .compatible = "qcom,scm-msm8960", .data = (void *) SCM_HAS_CORE_CLK },
 	{ .compatible = "qcom,scm-msm8916", .data = (void *)(SCM_HAS_CORE_CLK |
-- 
2.25.0

