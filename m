Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2FC20EE3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 08:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgF3GWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 02:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730005AbgF3GWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 02:22:42 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FBAC03E979
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 23:22:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g67so8560301pgc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxI0dB1QFgZNIVokC1hI+G+Iqlv6A0nmADwj9+78Tks=;
        b=CdZajyIJHDjOv65E77khrmmw03A7NqdRALdHclmEq43x0A5YERCb9uk8uLW+tX46JL
         zSfex5IBG8VNGN9gNc70Fxurl907/DAYftlHGmLH9BFvsGGy8nIXnFHWNmHXHSpaSCz/
         qDqUQZaZcpY5ijqfUZnFDGCWEx6Lgt2HkKvc8oc/Ao9Z0RLEFiXPgur13RH4msc0NuBO
         7hSiDCK2LgMP9EW7nWsi0kh1ymWFCECLq47QkmJ+3IeZnRZoEHNQl8Zxe/GFOuFd5Q0D
         YXp8LhRkXDNS1eig3k5dfutAxsToJhnqtQW+V4e/4F7uLVYKOPTTAG6CHrxxWGv12DlY
         WthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxI0dB1QFgZNIVokC1hI+G+Iqlv6A0nmADwj9+78Tks=;
        b=n3Fa9x5VC4ngOUgGY/guwdBOPQvNjKuOf9mqpysESgMTfquXeGeh/2UzYYmVtIR8hF
         GpSjpOp+XZnDHDjn5hmMFQbrI41Cxx86SyOAMoIKv2QyP3zLVJ38oKxAqXP3Jl+u0e0D
         WKyu6TnEj9Ym71XqIWslUsThLmZIkH/Fzzmh1/PwZPRwGu8v4MAnQTC0qJtmdyUfB9Jq
         b+COhs8rMzXeuFiWPB6Krg11mx3XMLiKppQBsH4cWhjmwnHeBets5u5f4KaEtFRYckOm
         Egf4SKP04rxv41TnbOaT0oLTKsB8S4FUfQT7qX/0iFdATb25GYJcIifN1Hz7MyQTtXUB
         8YtQ==
X-Gm-Message-State: AOAM531hwjDNrLA50t9Zbp3Xc3bjR2BMggBat1n9xeZj1/0baLiae3x0
        qMB3WjHpyuUzS3xWYqJhxAbHWQ==
X-Google-Smtp-Source: ABdhPJwkpX+UqkRhUMU2StSSepg0T7aIZhYVKhSZq4GziMwUla8dN0NFMDLDBH2U3p99v/31HC6nbw==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr2228098pfr.41.1593498161157;
        Mon, 29 Jun 2020 23:22:41 -0700 (PDT)
Received: from localhost ([103.208.69.16])
        by smtp.gmail.com with ESMTPSA id n37sm1486372pgl.82.2020.06.29.23.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:22:39 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update Amit Kucheria's email to a single email address
Date:   Tue, 30 Jun 2020 11:52:32 +0530
Message-Id: <8cbb7004a6a9b846a8d827f514f33f1a265dd5d4.1593498024.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Emails currently go to different mailboxes. Switch to the kernel.org
address so I can forward them to a single mailbox.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 +-
 MAINTAINERS                                               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index d7be931b42d22..0985e65a9d871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: QCOM SoC Temperature Sensor (TSENS)
 
 maintainers:
-  - Amit Kucheria <amit.kucheria@linaro.org>
+  - Amit Kucheria <amitk@kernel.org>
 
 description: |
   QCOM SoCs have TSENS IP to allow temperature measurement. There are currently
diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68c..f80cb6185662f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14230,7 +14230,7 @@ F:	drivers/net/ethernet/qualcomm/rmnet/
 F:	include/linux/if_rmnet.h
 
 QUALCOMM TSENS THERMAL DRIVER
-M:	Amit Kucheria <amit.kucheria@linaro.org>
+M:	Amit Kucheria <amitk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -16930,7 +16930,7 @@ F:	drivers/media/radio/radio-raremono.c
 THERMAL
 M:	Zhang Rui <rui.zhang@intel.com>
 M:	Daniel Lezcano <daniel.lezcano@linaro.org>
-R:	Amit Kucheria <amit.kucheria@verdurent.com>
+R:	Amit Kucheria <amitk@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-pm/list/
-- 
2.25.1

