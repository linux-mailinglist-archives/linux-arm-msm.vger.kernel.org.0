Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88914D5364
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Mar 2022 22:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343857AbiCJVF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 16:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343814AbiCJVF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 16:05:59 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7946913FADC
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 13:04:57 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id q19so5739381pgm.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 13:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=obuJZgA+9h3Opi8fGV6bTwbs6NZXXhZ7phVpG6fqysw=;
        b=nmuW8+Zw/Wnq9ASRMeWUjtleyefNkOnr5Xl9IcWParCYOXgIKxEstVkLvoSug3n7ts
         D79JI/9OgoasVnoS4QPPqj4j8za7JS74qqmMYEs84F0XSxoYFMhjkggnJ/fscQpTl2Kd
         6IjtX90d+wg9fU5ZEzMtuJXTKqlZ/YJjPdVFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=obuJZgA+9h3Opi8fGV6bTwbs6NZXXhZ7phVpG6fqysw=;
        b=1B587IPy2yvk2M6AjiVZ6GD45L3KtXSV7DrwYyYJYNGVlrPmQL0YKNpZ87fKpFLcqv
         AeXIEXo6GGvN/KByAx6LG+UJ7c2Cjd1wo60HObrmy4Tv3NxlHCv7fFZ1rWmYKpXmOnap
         pjH49ws1xqVN/AmGiNwXJ8gjdCz0FF5tTn1z6BNojMaRN09aZzjy45FPFTI1bIELPlOy
         JRKaS8hK0a6tOswG6FKKwp851os+XZa+QBFupEfZLtsBu3aG2FLy4MNy8jp6a0aT/N1o
         W16e5ZwULEA2XI/V0TR9gE/nkP/CNHGodN68ePYGwO7gaKC0KFT2NLao0PLFcgqmuxbh
         MZEQ==
X-Gm-Message-State: AOAM532/BLCYV3JjoxupeQY9rCvw+6Q9+YfWoo1wED4lSDKwVNSyCT8w
        Il0PqSPIusJkHzWFHN4exkvd6A==
X-Google-Smtp-Source: ABdhPJxjl6idbl313Fxh9KypXJMEBJWhLPUFn0GIjpVVjzV6fmTbq2x0qU3kJNA+tWIFJSJVQESrcA==
X-Received: by 2002:a05:6a00:234f:b0:4f6:f0c0:ec68 with SMTP id j15-20020a056a00234f00b004f6f0c0ec68mr6801201pfj.14.1646946296960;
        Thu, 10 Mar 2022 13:04:56 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:9116:709a:646d:1f5f])
        by smtp.gmail.com with ESMTPSA id y21-20020a056a00191500b004f78813b2d6sm315898pfi.178.2022.03.10.13.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:04:56 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280-herobrine: Fix PCIe regulator glitch at bootup
Date:   Thu, 10 Mar 2022 13:04:34 -0800
Message-Id: <20220310130429.1.Id41fda1d7f5d9230bc45c1b85b06b0fb0ddd29af@changeid>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
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

While scoping signals, we found that the PCIe signals weren't
compliant at bootup. Specifically, the bootloader was setting up PCIe
and leaving it configured, then jumping to the kernel. The kernel was
turning off the regulator while leaving the PCIe clock running, which
was a violation.

In the regulator bindings (and the Linux kernel driver that uses
them), there's currently no way to specify that a GPIO-controlled
regulator should keep its state at bootup. You've got to pick either
"on" or "off". Let's switch it so that the PCIe regulator defaults to
"on" instead of "off". This should be a much safer way to go and
avoids the timing violation. The regulator will still be turned off
later if there are no users.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index dc17f2079695..042a4a59e3dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -178,6 +178,13 @@ pp3300_ssd: pp3300-ssd-regulator {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ssd_en>;
 
+		/*
+		 * The bootloaer may have left PCIe configured. Powering this
+		 * off while the PCIe clocks are still running isn't great,
+		 * so it's better to default to this regulator being on.
+		 */
+		regulator-boot-on;
+
 		vin-supply = <&pp3300_z1>;
 	};
 
-- 
2.35.1.723.g4982287a31-goog

