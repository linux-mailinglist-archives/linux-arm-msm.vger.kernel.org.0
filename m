Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E84C52F023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 18:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344921AbiETQKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 12:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351436AbiETQKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 12:10:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FD017D3B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:10:18 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a23-20020a17090acb9700b001df4e9f4870so8267806pju.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZB7BWpRnlBzFfCqwBENpii045L63Udnz6UdJqFoKbrg=;
        b=I0LE2wWQ2QnnTRkMGZbghPAaiyy+lX9O4XcXktFWwJKbCuBU8bOcHmuCqIYjqvUjnZ
         nHRlcGZ1pjd8X6rDJteAQcOZ5hSCsoeh0wtwCgiLqx5VMIjiMqY0Yq5C8fLvXza+Fcpp
         KFj0etFjrOxY/oyoJk21aTWuCLNT3XdhiBd+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZB7BWpRnlBzFfCqwBENpii045L63Udnz6UdJqFoKbrg=;
        b=WF8edp57arw7OZDXX8x9XkToxuegvFuKtFhL2i6UV/X8jHwF7rV3q+fFn/SfMfQK2u
         CKiCifXIW9x4SYAmMsYTobLL/ySmbC4mnP5YNazFzYBj6ku1wdKE1PHxdvoAOwrMrYK2
         SXSNJJEjVAdLmNDgKcAYkUpjaK9+97Qe69TlPiNGnVru+YY2qmDIIE5a+a/M5vHQYfiY
         l2OxfICywk9oQNqlj6AMAkzlVK2dEgkGlcFCLzw655/cQ16FeC4HVvZ4CGIVh9LoD44h
         LLclrsDIdBlRSH41Ldl7zfWnOCGFoj9y+PIcUQoqjoyfx96sPpwadFz+E0Y+OHZi3A1J
         RAwg==
X-Gm-Message-State: AOAM5332di7AiZW97WYyot6OPGMvFvKUawcEX78YEA5MJwDCvLzHN76k
        cTOQjnRjP/bAUNR/g6a4KUnSFQ==
X-Google-Smtp-Source: ABdhPJw6Y+QsU+wL59UNz3ZhYLf2XrohRZPjujnkd3OM8I54CAsWA4NvQRR3sKJJa+8yEQLFtNkSLw==
X-Received: by 2002:a17:902:d2d2:b0:161:be0f:ccd7 with SMTP id n18-20020a170902d2d200b00161be0fccd7mr10361827plc.98.1653063017827;
        Fri, 20 May 2022 09:10:17 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001619b47ae61sm5855078pld.245.2022.05.20.09.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 09:10:17 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [v2 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Date:   Fri, 20 May 2022 16:10:04 +0000
Message-Id: <20220520161004.1141554-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520161004.1141554-1-judyhsiao@chromium.org>
References: <20220520161004.1141554-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
these boards use rt5682 codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index b69ca09d9bfb..f68d28f8701b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Herobrine (rev1+)";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
index d3d6ffad4eff..7a4acd3b9ee3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Villager (rev0+)";
-- 
2.36.1.124.g0e6072fb45-goog

