Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8635A1B630F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 20:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgDWSLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 14:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730235AbgDWSLB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 14:11:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C39C09B044
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 11:11:00 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p8so3278720pgi.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoJh63kKG0D1+kAjjOCcewUCrHwScAwF4fHmVhu3yEY=;
        b=L0AntvfFKEA4nZ8QFmeepfjDCUe1xnSA9QJTsWXvTnYODCycIN8mNS0gJEzeGP1bSm
         wAKsdRcfKn9KaXt/gq8ndbLWHH2gdqKsRHAnbuE0qS/y1T1uJTkskpHaDDwLp/nRJBwE
         Pz48JtbiG88ZSUwUhkb6gOIErAL4odG5iY1q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoJh63kKG0D1+kAjjOCcewUCrHwScAwF4fHmVhu3yEY=;
        b=hmgunnszarpd6ogR4LJprnUzFyVZ4+rxdeFfWLlFOHBUZCv+fnJog1TEsiqrTnC5jJ
         iC26L29RW5pJu03nuuKq+ELqH8k7izEIJngBLBXvGzj1sJpswVufpc/P5d25Fd2FdCyS
         uaNKGQ4dqqqIx1wTvb0JiFNvrgN93cI2HNF2TK796dku6a0Xs81M1RLehpT9543Swj3p
         jb3X1ixpI3f7PjOHMwgpDMvUFs9nT2YM8dnEwg0cjwxsZ6cl9TbO1QQqmiBtf0dBiPjv
         eoRYO1ltEaDamjOcMu4L1wiEZBLQayFoCelYX/YLOG7UswxlF94dMeq46oKBH0YFkVPW
         3D9g==
X-Gm-Message-State: AGi0PuaH8f4ZVg8Tp8iuoVzHEnoB4e4QfclF2ubYOZnFdYpy8hVjuZfV
        DAYsNr0ULe5LxlWSFlDP9TeNSA==
X-Google-Smtp-Source: APiQypI8KmAiqWhTqcfvYHF1yYC3JCBs4eDoNyXAdnzNlAEdjbJVyLX6yor26Tit0MPP0rQlJBaAjQ==
X-Received: by 2002:a62:e306:: with SMTP id g6mr4896489pfh.182.1587665459750;
        Thu, 23 Apr 2020 11:10:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u9sm2858156pfn.197.2020.04.23.11.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:10:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>, mka@chromium.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: qcom-qusb2: Fix defaults
Date:   Thu, 23 Apr 2020 11:10:27 -0700
Message-Id: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The defaults listed in the bindings don't match what the code is
actually doing.  Presumably existing users care more about keeping
existing behavior the same, so change the bindings to match the code
in Linux.

The "qcom,preemphasis-level" default has been wrong for quite a long
time (May 2018).  The other two were recently added.

As some evidence that these values are wrong, this is from the Linux
driver:
- qcom,preemphasis-level: sets "PORT_TUNE1", lower 2 bits.  Driver
  programs PORT_TUNE1 to 0x30 by default and (0x30 & 0x3) = 0.
- qcom,bias-ctrl-value: sets "PLL_BIAS_CONTROL_2", lower 6 bits.
  Driver programs PLL_BIAS_CONTROL_2 to 0x20 by default and (0x20 &
  0x3f) = 0x20 = 32.
- qcom,hsdisc-trim-value: sets "PORT_TUNE2", lower 2 bits.  Driver
  programs PORT_TUNE2 to 0x29 by default and (0x29 & 0x3) = 1.

Fixes: 1e6f134eb67a ("dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters")
Fixes: a8b70ccf10e3 ("dt-bindings: phy-qcom-usb2: Add support to override tuning values")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 144ae29e7141..f8bd28ff31c1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -97,7 +97,7 @@ then:
         - $ref: /schemas/types.yaml#/definitions/uint32
         - minimum: 0
           maximum: 63
-          default: 0
+          default: 32
 
     qcom,charge-ctrl-value:
      description:
@@ -130,7 +130,7 @@ then:
         - $ref: /schemas/types.yaml#/definitions/uint32
         - minimum: 0
           maximum: 3
-          default: 2
+          default: 0
 
     qcom,preemphasis-width:
       description:
@@ -152,7 +152,7 @@ then:
         - $ref: /schemas/types.yaml#/definitions/uint32
         - minimum: 0
           maximum: 3
-          default: 0
+          default: 1
 
 required:
   - compatible
-- 
2.26.1.301.g55bc3eb7cb9-goog

