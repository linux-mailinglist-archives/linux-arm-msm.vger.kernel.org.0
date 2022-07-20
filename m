Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4230157AFA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 05:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbiGTDxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 23:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238594AbiGTDxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 23:53:17 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DFA6D566
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 20:53:16 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id f11so13827152plr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 20:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u6f/TW2lK+Z6PHiB8sDnRQTHwsczaRjv5MXneVlIaMQ=;
        b=juPVXMrbS2z9kh47D+ilwcQvWmxqKyFy59QnQEXlFPHErQANIDdmkJ94pEKszs7LVH
         11McA5QwlW5m2hXr13BzNjONzrdE6PdeJoZHz08lYGEFnuPta0iNv4spyN1rUKMhtAAY
         jZqJLx2jvAnjyUN6gl+G3WS+7B6zdt5+gyU5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6f/TW2lK+Z6PHiB8sDnRQTHwsczaRjv5MXneVlIaMQ=;
        b=sHGyi4OJ5U2WfbrQoB8U84yP+YIsltTYzbVwr/fU1Jf5mVFiuPPsjCRcQcLNLPMGso
         BSi7AHafWptiHEKyTpyOwNqOhU8E9p7D6f0aZNdc8xgBPQ4aekhpEwGtnQ7TZ/Y3LQFX
         xs2/GfecXY/gdTZyiH6wwln5CKQWpDF3EmKaezLbM3dq8bI0EbuQEoDDFFqXrwScBnke
         f766byniaHMtvZXvGN6qTHUIqzKDsmtc/q4jgqd1w7zbLWoffst8Eg9sS9+L8/N9JEvn
         9Q29Qei/1DqaYnvJiidZWjeCRfqQvB1ecTn8F9y6LqJ1q/F1BA7mZyaOLy8ZjuiAqyWj
         2E7g==
X-Gm-Message-State: AJIora/7N8SJAyJdIPX6jNqQVxQUWVTXGXYAw9NpwpjckTyN94Ne+zeM
        vElRqAInaS1MrRRNM+7ZugF7vg==
X-Google-Smtp-Source: AGRyM1vgdgXehQ06PxCM+weN+8/HaGoYpCkfAjzpKaTH6W4CMVSaGfq/8M0BZ3ghFgv3Wzj1zbzX/Q==
X-Received: by 2002:a17:902:b08a:b0:16c:68b6:311 with SMTP id p10-20020a170902b08a00b0016c68b60311mr34874711plr.166.1658289196255;
        Tue, 19 Jul 2022 20:53:16 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902d14b00b0016648412514sm12378346plt.188.2022.07.19.20.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 20:53:15 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1
Date:   Wed, 20 Jul 2022 03:52:54 +0000
Message-Id: <20220720035254.1411959-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220720035254.1411959-1-judyhsiao@chromium.org>
References: <20220720035254.1411959-1-judyhsiao@chromium.org>
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
Change-Id: I53e237add854fadd51a748a7ca13e4cc88440306
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

