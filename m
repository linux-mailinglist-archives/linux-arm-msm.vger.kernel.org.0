Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94EED19D5EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 13:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390739AbgDCLk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 07:40:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51813 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgDCLk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 07:40:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id z7so6801448wmk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O50Gx6rk+wnrYYoowjLyR0iGzy1NO7KyGopLJExdfSE=;
        b=z9abDNdIei6Jogiontn/W6q8FgmXjboqlQnpVhtcCA7XD7FJVj5qaJyDQcuPm4ZI2o
         RhbXgNPXza5zxHBVUOseYHCPkUfaH1SCQz5U0OKGUUqNUmzPIFiCbAiiEzPnQu7lvARM
         5MNmtHpmIkYezDSJPZGNCCvBa/Y0WpEbsMyHdqfLa1yqtA8Vdot6T+XJBPdhS0l6ZhBq
         2P19Kv+H/K1PLmo74xHKbxd7335m7xzfsLU4m+9+ZqprAeoJsOVLC/lQZw36sgr/Hb/C
         c1oZPIMkU2EoI7yHNlOaKH7Yk4iVHFx0ISkdwiSpjFKE7T8FNXXhH0rsyZfeODNn2Gc7
         Tamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O50Gx6rk+wnrYYoowjLyR0iGzy1NO7KyGopLJExdfSE=;
        b=oWxjIkA6czZzNQFU9lbPjZCKgbM/isbYZK3elNXwFQ61NHJmR+40jRF2FQBAWUE8be
         lMvkUI9gQAS27e2JZ1TPDbNhAFzcXdLE5d7W0HwNEmlWKBBr/daMoa6sOaCfgw60+4kp
         tlk4AnnO3qNThpc4/k6LSQz9U+FqvjSs0NFgF7ky0362iwZlKx5HT9JliUkhk+WI7QZp
         5kXOS9CdlIlCnE2+cT5KyDRAVZxa/yvqh2oJn009kJrIdQQtSOFouD2WT8YRvRSllCo4
         mB59weS63FNtJlZWQuzmaOdgf337jOUBcwmvhtLHgSkuXqauO5KJ0UTYquuJnYXBJ2x3
         cNAg==
X-Gm-Message-State: AGi0PuaniS5JK5Gv7OVKilafvZCwcq0MfxZeqsKrsgIjUINlk/OYvdtx
        XlKIdNsfghktbt/0VJXkvZRCUQ==
X-Google-Smtp-Source: APiQypJkSanW+EcNhfC6YNTQD6pFP9FvhotDhVGxwUvZOc++TU5vRmEFsilKl4bwzNtedter13VIiA==
X-Received: by 2002:a1c:418b:: with SMTP id o133mr8582992wma.165.1585914057449;
        Fri, 03 Apr 2020 04:40:57 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-48.xnet.hr. [88.207.96.48])
        by smtp.googlemail.com with ESMTPSA id s9sm14477643wmc.2.2020.04.03.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 04:40:56 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Pavel Kubelun <be.dissent@gmail.com>,
        Christian Lamparter <chunkeey@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] ARM: dts: qcom: ipq4019: fix high resolution timer
Date:   Fri,  3 Apr 2020 13:40:40 +0200
Message-Id: <20200403114040.349787-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhishek Sahu <absahu@codeaurora.org>

Cherry-picked from CAF QSDK repo.
Original commit message:
The kernel is failing in switching the timer for high resolution
mode and clock source operates in 10ms resolution. The always-on
property needs to be given for timer device tree node to make
clock source working in 1ns resolution.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index ee45253361cb..b4803a428340 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -166,6 +166,7 @@ timer {
 			     <1 4 0xf08>,
 			     <1 1 0xf08>;
 		clock-frequency = <48000000>;
+		always-on;
 	};
 
 	soc {
-- 
2.26.0

