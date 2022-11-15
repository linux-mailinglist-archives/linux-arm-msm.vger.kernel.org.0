Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEC6628E55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 01:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbiKOA25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 19:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbiKOA24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 19:28:56 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BC6DF4E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 16:28:55 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id l2so11629209pld.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 16:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqa/dCF09CYPtWcDPmDkdrHUgSo98MYhImja7LLpGWs=;
        b=R1dyKlEbVlo8osVeC8VlsU1VGebUwP2GvJlvEm4xVz+0ATcqxmYKgySABUPBaeH0Fc
         MWgfxgOqOowYjPLJ73IkGsqE09IgBMVwc3kyUsuE13dCU1mvfdOL4l6VvavK37MhnNqJ
         149ieoGKMOo+nQuXLO7wizlKxhVf8y/xwFiik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqa/dCF09CYPtWcDPmDkdrHUgSo98MYhImja7LLpGWs=;
        b=p/svjpgMmTJ3RTS5MunNswYXFBSUEIrYc3ZsU17GZiV6C53YOeqowNK8wgmQd/6eOy
         9czqlZXXQYjt/fsWZBgPHl3XBnmH3xk9pLx80el5FkTAjUoPMKTWrsn/2qQMZCIHpLDm
         5zRiGrgDdWwsg+DaxsYXqDBBKOl4K2CBbdHP+p/Eag/ZvR+XTidU6JHoJB9swMqz3SON
         KzcuCORbqAmrIE/4KvJyIA3olAXWhy/YIW7ibTrmtTrPuIm2l4H3DboI+QgjIGlpRyce
         kLTPlDUG7J0ERrtUQAaASDpIuyriFdMQxVX5TUqsMOGaRfZEXcTfy4dsbwqhFz7xrynV
         0yNQ==
X-Gm-Message-State: ANoB5pkRm2IIHZx02xIiRK4Ql5BUN5p5/tjLok6EPZdewX7786a8xdLm
        NCRBvW8ykl9hpvWxHhgDaLk7hQ==
X-Google-Smtp-Source: AA0mqf6UKV2CzeJLo8vDh5mePFoQP48h80o3f+bXxackBSbgzV9ujCMML6wLgaNd6BNUG6nhrUfKCA==
X-Received: by 2002:a17:90a:4d04:b0:212:4544:2170 with SMTP id c4-20020a17090a4d0400b0021245442170mr16419488pjg.66.1668472134603;
        Mon, 14 Nov 2022 16:28:54 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:7c63:b1c:8df9:ea0d])
        by smtp.gmail.com with ESMTPSA id d12-20020a630e0c000000b00470537b9b0asm6521983pgl.51.2022.11.14.16.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 16:28:54 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        judyhsiao@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280: Make herobrine-audio-rt5682 mic dtsi's match more
Date:   Mon, 14 Nov 2022 16:28:28 -0800
Message-Id: <20221114162807.1.I0900b97128f9bb03e5f96fcb3068c227a33f143a@changeid>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 1-mic and 3-mic dtsi still had two minor cosmetic differences
after commit 3d11e7e120ee ("arm64: dts: qcom: sc7280: sort out the
"Status" to last property with
sc7280-herobrine-audio-rt5682.dtsi"). Let's fix them so the two files
diff better. This is expected to have no effect though it will
slightly change the generated dtb by removing an unnecessary 'status =
"okay"' from the sound node.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
index fc7a659dfe4a..af685bc35e10 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -19,8 +19,6 @@ sound: sound {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		status = "okay";
-
 		dai-link@0 {
 			link-name = "MAX98360";
 			reg = <0>;
@@ -96,6 +94,8 @@ dai-link@1 {
 	};
 };
 
+/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
+
 &mi2s0_data0 {
 	drive-strength = <6>;
 	bias-disable;
-- 
2.38.1.431.g37b22c650d-goog

