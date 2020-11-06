Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B532A8F41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 07:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgKFGOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 01:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgKFGOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 01:14:47 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1655DC0613CF;
        Thu,  5 Nov 2020 22:14:46 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id z3so356181pfz.6;
        Thu, 05 Nov 2020 22:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5wJhSF1myKTxNCEOkUYzTRb2ml1CsAb8yYtcmdDQEc=;
        b=j3j3Ypm3ruFiRx011vvNly7A5X1a5FTVUBD0VHrZdFLR2zwy/mlqzqfssGSOSUX7kz
         MieivpEEWrdLOc1R3xFYVIB6oKzXWqyW4jFiVluwTwT7K0Wbt4oe1XsifHVWEtD43WcU
         SlDwmaEtn8FUGoMr8wiBnYXLRcgTTLoT4eAheSe/5hKUMRdJvbEDhfIYPXZAygzxdIj7
         2jzoJ4zmcQqY7LZwBHvbNQGtCDMPML/lCvfroFN7BxyVdyxgKc9qCIFMRS6bAOJghScK
         bcNOSO/xGqt+3tAZfI2Ner2fjeGL3GWjaTzijlUDG5a1GJGBN1Uio3icMREanKlpTI5T
         I8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5wJhSF1myKTxNCEOkUYzTRb2ml1CsAb8yYtcmdDQEc=;
        b=fprR8dYU68P2wnyqu3Kd3cB0wg4F9bzaBhDxdtPCH1LZnPNeHA8FCPWgxtargCe+IR
         3sRhgiimTTaqLBWJLIkO8O8hHqy2we1Z6WxDoQKEURLOOHywC8G2yDWet0eUD5XL+2TI
         tsuEHNDLtIP5IjTHWoN6XJbgcgQ7wslFU9xyy+grzSFbVjy3K5tpch+pP0A0wV5mYdb1
         k7cwVuMR1gZqlGOvOYxqwjmRXVmecIb8xaz+npXfgdIS7KVQWjTbtlNa95Oo/6NlyeHi
         3THnVljn+IsyXeAXmKgX7Yd0euaFVtK+/Rtr+dDst4f+yiCsOPcKOhYr8whcJbhl+RYO
         USfg==
X-Gm-Message-State: AOAM530XpJVdcP14MmTPDYfW94miocMlCXBDqC7/XqXxD8aR4N6GXev5
        zQGDh+mElMXIwMZ7SoKdua+5ggx0e/Qo4A==
X-Google-Smtp-Source: ABdhPJx3Ggm4pls83AmffE9szLmq4frqWWbLnvgrh2jxFHSlCYaeyAYS0j8558fwaKy/sRuhwrFFhQ==
X-Received: by 2002:a62:17c8:0:b029:18b:5a97:a8d1 with SMTP id 191-20020a6217c80000b029018b5a97a8d1mr467274pfx.15.1604643285394;
        Thu, 05 Nov 2020 22:14:45 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id q5sm746472pjj.26.2020.11.05.22.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 22:14:44 -0800 (PST)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, robh@kernel.org,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v6 1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
Date:   Fri,  6 Nov 2020 14:14:32 +0800
Message-Id: <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../devicetree/bindings/sound/google,sc7180-trogdor.yaml  | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index efc34689d6b5..ce050a9dec94 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -34,6 +34,10 @@ properties:
   "#size-cells":
     const: 0
 
+  dmic-gpios:
+    maxItems: 1
+    description: GPIO for switching between DMICs
+
 patternProperties:
   "^dai-link(@[0-9])?$":
     description:
@@ -83,7 +87,7 @@ examples:
   - |
     sound {
         compatible = "google,sc7180-trogdor";
-        model = "sc7180-rt5682-max98357a-1mic";
+        model = "sc7180-rt5682-max98357a-2mic";
 
         audio-routing =
                     "Headphone Jack", "HPOL",
@@ -92,6 +96,8 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
+        dmic-gpios = <&tlmm 86 0>;
+
         dai-link@0 {
             link-name = "MultiMedia0";
             reg = <0>;
-- 
2.25.1

