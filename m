Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F58F57C690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 10:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiGUIjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 04:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbiGUIjO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 04:39:14 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF60402D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 01:39:13 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id r186so1058515pgr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/BNkggYGO5wbhXNiM6UQj7ulNxqOcTRhO0RLDvuzKM=;
        b=jdCG6+nifZGncJSVnMdZqWcPjB8hTEnufni1x24Oe2zkcR6ptHZNYFJrjGjt5OfhID
         FH9IMr+HFxCZaLnyI2Bky2/JAJNvjn3uFpBEP8luR59eI4vrZNfvUXosVYBL4rsfH7CX
         rxiyS8JXf6tbqMladHEzyG9kguZI0+2IFtbi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/BNkggYGO5wbhXNiM6UQj7ulNxqOcTRhO0RLDvuzKM=;
        b=IcRaJPkKTApQukl/R0LjSGlA7qNq8pcfdbiY2BQhPnnMSn4lW+TyZFlKXcCDoJiQKE
         CVcsFyTRjFkn8Y/3LmN8fxikLmL73Vu8encnsmJ4ABaXhfb0cUO+28ZQSMm5mgmUufAL
         CTFjFn7eh2s9wN7NNxzSEpagIt9AHubh5HN0TwoNiXrgfAIsww9d+7PMWwx4AxXolLMg
         qs5mkVJrCFD4dHIetIroui22c4EKDtSZ3IEC3612sHN5nWTMmBLboFXlK03Bx/myco44
         44qJo/7JQxn/FLwZUHNNtNjsevTB2BhBE5ykITaKKdQKWOmk+gOujw1a1kOZXP5FNjlX
         G+yA==
X-Gm-Message-State: AJIora/CDzlr2oMWmb1qx1FQd9QOZ2rTjq90F7hBSvMYq4tYSG1xckJR
        4zCGxrsn6j7ZbbwNn6QtHR9JrQ==
X-Google-Smtp-Source: AGRyM1u2dh8hcZHr6mbWIJJwSX9EOohj8nIWfo64hoGPL2tA8Bq50XE9v2BEM8Gz72vRy0bGBjk0GQ==
X-Received: by 2002:a63:1759:0:b0:40d:5aba:4bb0 with SMTP id 25-20020a631759000000b0040d5aba4bb0mr37760805pgx.496.1658392753209;
        Thu, 21 Jul 2022 01:39:13 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b0016cd74e5f87sm1025943plh.240.2022.07.21.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 01:39:12 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: qcom: sc7280: Include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1
Date:   Thu, 21 Jul 2022 08:38:49 +0000
Message-Id: <20220721083849.1571744-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220721083849.1571744-1-judyhsiao@chromium.org>
References: <20220721083849.1571744-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1
as it uses rt5682 codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.37.0.170.g444d1eabd0-goog

