Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C57BC5744EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 08:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbiGNGMg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 02:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbiGNGM0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 02:12:26 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4571831DCA
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 23:12:24 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id i8-20020a17090a4b8800b001ef8a65bfbdso1761834pjh.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 23:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gZyhuFG5d+vLE7E3cs3GPiS+/kLdkFYk6kxnyEhMdQM=;
        b=k/v4zjmAQW9Wh4qvVmiK/VkmCkpFTmHARFcwMF2GDMaBKS/H7UG467Eb0pgP5hdJfr
         yjHYWLjG5nZKx1ejISlG4aGxyEiX4RpWiuXMPcc1xtIBPz9/jC6GQ1Qmqp9PxOWrrnUd
         nZvFuoT0M1YCQaaYh9yF+PkGS63DYXRVorhro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gZyhuFG5d+vLE7E3cs3GPiS+/kLdkFYk6kxnyEhMdQM=;
        b=gqR+xatVWHNvdhDgAWOhZ1ocLlX1txlbP+8sgEcsGL1sUDiDBMpWVTWVm13Ep+SuJM
         iyG6tpOIDWGNH5xDwmMJEQPEoVUF0H3fsUWa2P/yUNwg+Dya1maS6Ce9Znqj20sia5LA
         bMiEht6S+QqLTtjBhLJEz0XRtHXSTxhQaOkCgFaE4p/cGM/mVu5LdTvlY+UilbG1W3/b
         uW0rs8ctN5kc8IDE6KSfVpDgAcehGxqzKZ+ys159b6Or3BwoULABSoQXLu70a2R6Vo0K
         EJzW5p25OJcZqh+sc31YhxsAgost9/tnX7PfzP+jRc2McodsDZvNKS26CPjhSoOmDTvs
         fQfA==
X-Gm-Message-State: AJIora9n37ylimh5K1vvz2rtfFDIJLb3BpkSN0oSqjN2IIltjRmhZ26y
        eW56ji9ROVLYpGzOMdQg02UoNQ==
X-Google-Smtp-Source: AGRyM1utcVRvtqwzH/GkdBj9fzus+d0urr+B8L7BDv9yOl4Q/WFGlsHlqBp+jqxiqTZJrkC5lnMu8g==
X-Received: by 2002:a17:90a:bc95:b0:1ef:8b48:fa0b with SMTP id x21-20020a17090abc9500b001ef8b48fa0bmr14098354pjr.189.1657779143640;
        Wed, 13 Jul 2022 23:12:23 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902690a00b0016a17da4ad4sm509683plk.39.2022.07.13.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 23:12:23 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v1 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Date:   Thu, 14 Jul 2022 06:11:51 +0000
Message-Id: <20220714061151.2126288-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220714061151.2126288-1-judyhsiao@chromium.org>
References: <20220714061151.2126288-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
these boards use rt5682 codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index c1647a85a371..98280436813d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Herobrine (rev1+)";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
index cbd8a2d1ef2a..077c58c93a65 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Villager (rev0)";
-- 
2.37.0.144.g8ac04bfd2-goog

