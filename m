Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51763BB551
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 04:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhGECxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 22:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhGECxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 22:53:34 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D03C061764
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 19:50:57 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so7866771pjl.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=77N/67rSOupK1Chm3/4oKVH0HtWBRmi/Fw54y3WWFfQ=;
        b=S6Zwf1e/LnhulYerNCjOfNqfeDM2VNDoZdMluwc3wcHJSiqhctzalDIDSatEGVnmOB
         VQkDMHBpuhJEsiy2S27bV/QZly6xp8pB747+9EbgURxw2OCg248OBM4ZmZIYdlbTyqI2
         NcCI/WwKylPxOgQaMxi4dmS4tZlIxQUOIzCqeIzbxR/JUzuw7v2l0y52xwnRcFzi0Sjt
         KmOZVzz9Vl1L2EizywSdr42sg+iGV5zyo1yI712mGkDA/ivTAlkeyKRGX9ZUnra0vByF
         cWSnCKx9r6sb80MUZfwir9AVb2w3mBmQmwcf0Xrzg788T8txOttYtmh7AJ21irw2iMpv
         SZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=77N/67rSOupK1Chm3/4oKVH0HtWBRmi/Fw54y3WWFfQ=;
        b=q+GdPkwi3fhS6TTowHXzlBsuSJPME8h5/BDtv4AcCK95aG3KfTp9YnsAp4/VCaAvRo
         tivXpn2orU13iGHVOuTJ29Po5lrZ4GjnF/oWv24V7rDWv6XpqmHVeaZic49mt89VfIxc
         NxD/DkDAMyVxrJHzLRZ670RbEIfbD6RmnMp0LNmOoQQwg2d9RhkWIegQivlBr9ZM8Ql0
         n0cy2PxB89qTuKJcl9eQJ5oyfEFvwl4Up9W+t7aq3OBsppPU1elMIrXayiIjk9mvxnKH
         A2WdAZZo0ipt17wPLykl3blxpbQrQkvH7BpsP4Zq3uySipPL0tygytPakH4lmD9dBiaY
         K/3Q==
X-Gm-Message-State: AOAM5322jKi/pwUWWufZ+d2kPork4udHWtVMshCuipqEBhcAVdOq5VM5
        K4cDSQXHVbhuDdYZZvfnRkUVCQ==
X-Google-Smtp-Source: ABdhPJzY3f2gHVvXij7AuGGJdzr5F1gId59J7RbuJOiaJF1b0tz0kXpXacL91zrmEuq87bpq31xp6Q==
X-Received: by 2002:a17:90b:1085:: with SMTP id gj5mr12758117pjb.166.1625453457107;
        Sun, 04 Jul 2021 19:50:57 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i13sm11891041pgm.26.2021.07.04.19.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 19:50:56 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] dt-bindings: qcom,pon: Add 'qcom,pon-reboot-not-used' property
Date:   Mon,  5 Jul 2021 10:50:31 +0800
Message-Id: <20210705025032.12804-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705025032.12804-1-shawn.guo@linaro.org>
References: <20210705025032.12804-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an optional 'qcom,pon-reboot-not-used' property for devices, which
do not use PON register to pass reboot mode but other mechanism, e.g.
particular IMEM address.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 7764c804af1d..584eff179904 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -23,6 +23,10 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,pon-reboot-not-used:
+    description: Support of reboot mode passing through PON register is not used
+    type: boolean
+
 patternProperties:
   "^mode-.+":
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.17.1

