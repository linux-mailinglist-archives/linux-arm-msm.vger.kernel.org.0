Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 593CF24BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfEUJfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:35:33 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43754 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfEUJfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:35:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id c6so8760934pfa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=FnxOSFCClFXBL/MQEoj2x4esQGTm7evFd77Wm/m1NK4=;
        b=FFvJMEerPN6RTzJ+NEOY16l+7iMM0ppRraH6BWkcq2lCBKg0mIogK7V9VC0mYcnoFC
         lpcwM2Gk+YfdcAdRsD1nkSSdLsZUylUpeLVeBwh0oBruUCaG9/tx8N6CnMySTJwPQVOp
         4Zcw1MxuGUvdcMaMWCGCeZXje44wam6ITlpgXVwK6Dc87G6IaG/nRabVCKTEJLTppkUO
         i3lgHNB01l3pm9EN1IpqlE91qR/FgJv4Ca/zhN6x8+WEkKKyLjd2ZBLFT4BAeggnr2C9
         7U7qr/o1nxk0MfPBf5UVzNw3gO95qTis3Vw3EEfBCyjpdLtzvF/AH8mrQuUsFr4CIwaK
         Q+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=FnxOSFCClFXBL/MQEoj2x4esQGTm7evFd77Wm/m1NK4=;
        b=lerQhofBGNINlFBwh08gkbv/R1D0GG2BeczqiW/G36I7Grioca+sL7n1u+Wu/1tlCZ
         mg+C7ctV5FRCG99+77yGrOVa7BVr9uH1d3sr+NePX/shIX/ro1r601ET/hjcwYN48ID2
         jT6QpPCdX6CET4B3tIARgfPjXOsxjH8zNMJxD6ko4Atf/cOgdOSKbOfDfm8PPgvZvtbr
         g75ykwysKeOCpFBlpO41U8v9r/atlDA58MnV8lEVjlWXU39fJONx1xfXNP+uHz1wp3nP
         ogLptbHJbRJReqK4QGgzpEwUqhnE3YEuQJC7K6YJ3rSGRQVIVOlr66QIS1g0fL+H+YK9
         C4Gg==
X-Gm-Message-State: APjAAAUO62zSx2JktvN45zjt/y4hFwSVJP7mDjlwgdQDVfwKQyiBa0kc
        LcMTpUMl7CP39xl6d/kySlBx5Q==
X-Google-Smtp-Source: APXvYqwADQFmBLmMydAb2ax1jzlS0xwcSIkCQrM5GCjaAteOFtjZewJqH81wNhkrczg63VjCnLukfA==
X-Received: by 2002:a63:1354:: with SMTP id 20mr79407935pgt.356.1558431331764;
        Tue, 21 May 2019 02:35:31 -0700 (PDT)
Received: from localhost ([49.248.189.249])
        by smtp.gmail.com with ESMTPSA id l21sm28759496pff.40.2019.05.21.02.35.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 02:35:31 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 2/9] Documentation: arm: Link idle-states binding to "enable-method" property
Date:   Tue, 21 May 2019 15:05:12 +0530
Message-Id: <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "enable-method" property for cpu nodes needs to be "psci" for CPU
idle management to be setup correctly.

Add a note to the binding documentation to this effect to make it
obvious.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../devicetree/bindings/arm/idle-states.txt         | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 45730ba60af5..3bdbe675b9e6 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -241,9 +241,13 @@ processor idle states, defined as device tree nodes, are listed.
 			   - "psci"
 			# On ARM 32-bit systems this property is optional
 
-The nodes describing the idle states (state) can only be defined within the
-idle-states node, any other configuration is considered invalid and therefore
-must be ignored.
+This assumes that the "enable-method" property is set to "psci" in the cpu
+node[6] that is responsible for setting up CPU idle management in the OS
+implementation.
+
+The nodes describing the idle states (state) can only be defined
+within the idle-states node, any other configuration is considered invalid
+and therefore must be ignored.
 
 ===========================================
 4 - state node
@@ -697,3 +701,6 @@ cpus {
 
 [5] Devicetree Specification
     https://www.devicetree.org/specifications/
+
+[6] ARM Linux Kernel documentation - Booting AArch64 Linux
+    Documentation/arm64/booting.txt
-- 
2.17.1

