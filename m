Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DB760D832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 01:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbiJYXxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 19:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbiJYXxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 19:53:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D421C357F
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 16:53:17 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id r18so13124824pgr.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 16:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCKIRs2juRpOxcuLqZLoiU1AAv70RTf/UUotkX6pOzA=;
        b=fRuQ4pnpCKBf/E9KoIbatp8TjB8WK2/BB2xbZI+tMtBJ0tReVXPSX1p/+tBSZ2OuUC
         je21rjIEBUZBNrmbIxZXqHhyqXsgpz4LdxpeRSX7TVJ/vvLnryd/JJy0x64UV3RgGmcq
         XtWqMtpw70041rAUBzTC0TJWFh5hjURYWBrCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCKIRs2juRpOxcuLqZLoiU1AAv70RTf/UUotkX6pOzA=;
        b=ynbTw0mRlj59M7vb805uKOUV7dp3THUwg9uz8V3/Jk7AaLEWBOPeP6jQ4QrYYQBbGV
         5a8TfIIJLu9NzCfaJqNzv1yqVJ58VtBOMggmaRKBpv1N9YwCo3VsWPcNc5qevsMrkV6V
         FQZ03HAwU2XGhyFUCiXlxvRZBa0G7nq0Y+cLbpT5eacS8Hwk7lHk/YMi5IDcxULn3RWn
         I5tgX8d9vwlY+HtKZaKZ4ROoElR/x3kcz/bGkocvX22Pu1tmreVSTKn3ieWdgudSkpQt
         JgjKC76lniMfXmB3WLLgwivqsWxIqrMprCVGgfa/LdsYUTrMKxBaE5Bey6gj85QbXFpa
         +3BA==
X-Gm-Message-State: ACrzQf1eZZSIy5KLYzO8OBiAJVXaXhc+55MGGQp/agUbAeNqVZ9i2xLr
        N/AX91Cs4j66Hti/cpPBEnYjhg==
X-Google-Smtp-Source: AMsMyM74jxBu3Q4fJ9KsJ8ob380JDOKk706vrt/dBW/wjXa35U0bEFeLV1TjcmNHWHm1F+Q4kvLbbw==
X-Received: by 2002:a05:6a00:2c86:b0:56b:9145:2f27 with SMTP id ef6-20020a056a002c8600b0056b91452f27mr18790254pfb.68.1666741996798;
        Tue, 25 Oct 2022 16:53:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:3419:656f:5d96:4807])
        by smtp.gmail.com with ESMTPSA id x29-20020aa78f1d000000b00561d79f1064sm1917699pfr.57.2022.10.25.16.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:53:16 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280: Villager doesn't have NVME
Date:   Tue, 25 Oct 2022 16:52:39 -0700
Message-Id: <20221025164915.1.I38e2545eda2b3bd3fef6b41c98f451e32851ae70@changeid>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc7280-herobrine-villager derivative doesn't have NVME enabled so
we shouldn't mark the PCIe nodes as "okay" since they're just for
boards that have NVME.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
index 3dff610fb946..17553e0fd6fd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
@@ -78,16 +78,6 @@ &mdss_edp_phy {
 	status = "okay";
 };
 
-/* For nvme */
-&pcie1 {
-	status = "okay";
-};
-
-/* For nvme */
-&pcie1_phy {
-	status = "okay";
-};
-
 &pwmleds {
 	status = "okay";
 };
-- 
2.38.0.135.g90850a2211-goog

