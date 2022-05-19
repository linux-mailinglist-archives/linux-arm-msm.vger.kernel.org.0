Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0EC52CE8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 10:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235543AbiESIl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 04:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235541AbiESIly (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 04:41:54 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC99669712
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 01:41:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k16so4558348pff.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZB7BWpRnlBzFfCqwBENpii045L63Udnz6UdJqFoKbrg=;
        b=eBu42ys+IO+PrtxiPquedThK1eYYkiOQ9y24LY+CRYn8KUWwW/USGjjydW7q4KauzN
         HNeOwV7MpJMqQBf54xArMEDqXhHOhRVSg7FBBzDBtUqtJX5WopXcBH0WZh7aeDhRNeCq
         zor0fg3418FPsOA+3KOz4Kxrxah+Tq3JcyF2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZB7BWpRnlBzFfCqwBENpii045L63Udnz6UdJqFoKbrg=;
        b=kckVbRZ8IbjUCzmcmIjXdt9fHif4pI5v4ABgQJAOHTqLTFuKiw40fNetVAmeLYrA4w
         Dqs8rMSmzgVaoqHVHE99IhHxsnA+LYh0KULUumeoaXsVX0AwEpUGY07dh7fvo2Xs9t/J
         7MY7n93LRxnu2m2XuMYPHWFZmHBp4GrmIho40+jfuBREyIbDRqltTaMenvEl6e5soXPc
         RGTQtcyv6gU2T7X//60PMhQXAvxFxsx9UqSDmwabUXsVt3HCqSTvNd777CsMgVJQfLK2
         sjmapa1gZSOcfJOlv8YL1KJLuFb3c6HVrE8ur5fWX3FEAZFzLtHpxKKGk7B4ZCkKCjPs
         hTIQ==
X-Gm-Message-State: AOAM530q3obt0jkJhKK86a3pTp54frrv/wxjNrmyhHMFns7t7Bn4ibuJ
        Ndt3x76vHlAx3WA6SX76X9VAjQ==
X-Google-Smtp-Source: ABdhPJwF4/cVUxxYJLVP49Ec+fM1+SLeiTfcIk2mNv3OvodJUJtgEWEcdDAlvxUs2qU7Hp9Y5zwzpQ==
X-Received: by 2002:aa7:9e1e:0:b0:518:3ee0:57a7 with SMTP id y30-20020aa79e1e000000b005183ee057a7mr2511884pfq.42.1652949712085;
        Thu, 19 May 2022 01:41:52 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902f20a00b0015f33717794sm3066185plc.42.2022.05.19.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 01:41:51 -0700 (PDT)
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
Subject: [v1 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Date:   Thu, 19 May 2022 08:41:19 +0000
Message-Id: <20220519084119.675990-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519084119.675990-1-judyhsiao@chromium.org>
References: <20220519084119.675990-1-judyhsiao@chromium.org>
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

