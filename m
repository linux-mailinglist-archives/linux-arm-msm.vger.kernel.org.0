Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10CB05EA6EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 15:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbiIZNRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 09:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233785AbiIZNRG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 09:17:06 -0400
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C9448E80
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:44:56 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id u16-20020a05600c211000b003b5152ebf09so4759014wml.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2uCwmHdjg21zPOoZO9GyiM8A7cUULvVI0yDuz4f3uYI=;
        b=TERL3inRZq0WCbTMsYxYubxRLl19MBHAR6y43iE2+Y3K79F2k1sJgP8lWn5pU6tB4H
         gjnfZDpgdVrDYvUb/Hq8j+M9ntTgND+qM9eyR003CiHFp41Ohkk1CxJ4w3lcllnLtpbB
         yxtwc6FuyGOUtwCY4ae7R0nhCYQgzWe1PGX226pRQkKN9a+5oIHIOQYkMVwYAq20ZUAz
         1bHzptIjfxbTQY6Kv/sbXgwO/GUkmltk5MQsL5RqHuOs20EgYAOmDjL0y+zlWdA3vEJN
         /BwBoF1ka9daQPM5rvEmH1dtDkfE9d0klBrmuhslpk6ug56x1mXPvZ3D3szXb/hY5C9E
         EZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2uCwmHdjg21zPOoZO9GyiM8A7cUULvVI0yDuz4f3uYI=;
        b=6Id9cPv42ab6bn4MLpkC5J0JvEavlxLxXWhHQhTA7k6zEM7zMJyojlK/YC9NYLB7XM
         PtJgsIOK2T69zL9fBxF5bdRwxiLseugppc9cSKwJnHJjhDyrgA9urhFuHxnKxJ1Hd2kS
         4R0k6n2tUMFBbn7DKbZCXJq/u/0HIoGYxJ1jDwzdlXDmZPohyQ4xWYYDa9Wtoi08/38p
         oGfyGNKTOvsLI8VkoW50sMuHOyj9AWTYpSxVTF77OlBVeqSwMRB3yarZM8gme9at3dxl
         Ddg04a2jVl3kY9x/9px53ENc2WoGVljMbc9JhqTIx8N+yMJD64fNpja6DOz4n3UkRRJS
         53ww==
X-Gm-Message-State: ACrzQf1QkCjxkydibHdVXAYyL1IbjaXIxeXZsj9kKkkdU79+PsOKjGcx
        Y4N0jIg1pI9+Rx5swbw1rk/3ysyddjXQAg==
X-Google-Smtp-Source: AMsMyM67FSLuZm5iPgZXwZg/yCN/P6KABChWbV6u33cpUuEe6UxI042iPcC5ny1YUZOonUFsggRoJA==
X-Received: by 2002:a7b:c84c:0:b0:3b3:3faa:10c3 with SMTP id c12-20020a7bc84c000000b003b33faa10c3mr21612635wml.94.1664191906169;
        Mon, 26 Sep 2022 04:31:46 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8-20020adfdcc8000000b0022a2dbc80fdsm14064882wrm.10.2022.09.26.04.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:31:45 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     myungjoo.ham@samsung.com, cw00.choi@samsung.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        aghayal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
        Rob Herring <robh@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 1/2 RESEND] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
Date:   Mon, 26 Sep 2022 12:31:42 +0100
Message-Id: <20220926113143.40768-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
References: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dts validation is throwing an error for me on 8916 and 8939 with
extcon@1300. In that case we have usb_vbus but not usb_id.

It wasn't immediately obvious if there was a valid use-case for the
existing code for usb_id in isolation, however discussing further, we
concluded that usb_id, usb_vbus or (usb_id | usb_vbus) are valid
combinations as an external IC may be responsible for usb_id or usb_vbus.

Expand the definition with anyOf to capture the three different valid
modes.

Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index 6a9c96f0352ac..1bc412a4ac5e6 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -27,10 +27,14 @@ properties:
 
   interrupt-names:
     minItems: 1
-    items:
-      - const: usb_id
-      - const: usb_vbus
-
+    anyOf:
+      - items:
+          - const: usb_id
+          - const: usb_vbus
+      - items:
+          - const: usb_id
+      - items:
+          - const: usb_vbus
 required:
   - compatible
   - reg
-- 
2.36.1

