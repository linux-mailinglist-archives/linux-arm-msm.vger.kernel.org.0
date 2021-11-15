Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E5344FD28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 03:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhKOCfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 21:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhKOCfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 21:35:46 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E92C061746
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 18:32:51 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id b11so13119971pld.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 18:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ws7B5AGNFnBmBgOnVAMCyoWGf/w6+PN/PCOXBtdlww=;
        b=yVp4708CojenC4AW2oMUWxRj8TLwPP9TZxz9Ijb2/izg9RvtVCEmFMQ5oX/0/V8+OO
         mWiQQbgvBMah7ieDPw9bB5SG4O38v8L93qxsZO8pNM1eO6yM1sKeKgK2lbTbUcx/Xh1S
         K7sF4Wmq8MKx8HuHzApTMFTxHFQOD50fqbelYH0maslkoENACr4Rs1L16Pnt46s8jsqC
         6QoDGbOjzqu1J+EglQu/Aew60YVTTKN2ZRBwP+KXZ7Q8GYfW7Z9C0m1QCBPUdBoHqQ5L
         aZiLsnlyYbwnqEhFaOkqX0Zl4fINvif5siAA/D8CCIOFiuw+choprDAGFsae4MiVmaZd
         dSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ws7B5AGNFnBmBgOnVAMCyoWGf/w6+PN/PCOXBtdlww=;
        b=anjvq5mBOGyxhm82G8/Uv1dtm1Yv4X3E3MihS7uDIGSG4pwDTVqkHTdBThtE25MCng
         ChnPSlXTbMymiDR1gLPXVDnjfSTJFYxVGySojy0Tj4X3F5IW0EeolzaJzeTxEdiS+G83
         rggiIv4EmgEJX3WUXo3gmNhzDMbZetPl716uU1kHKyH6FW55hDlurMs1jdp0ElBFaHM7
         86y83q7FUxnGcBY275dwcqEqpLyyirm/PyyJSRVd0yZjdp8kZ2yOP/YYWMtaLTtCiHao
         nBXy+AAEXbSIU1FMACgjczGqZ0feyTBGM+KtrWPtQGzgYKlLO+o+Ex9a9IiJsgkMg0H5
         7U+g==
X-Gm-Message-State: AOAM532YjIVCvvlmLCe37KTgXEtfGQVifOCwvJmqyCTT1sOwEPcoLG3s
        RSnlg9UpBTCratz1t3T300mwEw==
X-Google-Smtp-Source: ABdhPJyaLaKsv8Cf4LNU1XBi2ckCWL7EsgL/tnwVI7YQiV+qt7t9OCKi/8cIXWcrtqr620fERd2K3Q==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id rm12mr41317436pjb.75.1636943571107;
        Sun, 14 Nov 2021 18:32:51 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id a13sm14121605pfv.99.2021.11.14.18.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 18:32:50 -0800 (PST)
From:   yangcong <yangcong5@huaqin.corp-partner.google.com>
To:     dianders@chromium.org, philipchen@chromium.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] FROMLIST: arm64: dts: sc7180: Fix ps8640 power sequence for Homestar rev4
Date:   Mon, 15 Nov 2021 10:32:41 +0800
Message-Id: <20211115023241.7120-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When powering up the ps8640, we need to deassert PD right
after we turn on the vdd33 regulator. Unfortunately, the vdd33
regulator takes some time (~4ms) to turn on. Add in the delay
for the vdd33 regulator so that when the driver deasserts PD
that the regulator has had time to ramp.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
index fb27106bbb4a..ddba26c1a4a2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
@@ -15,3 +15,7 @@ / {
 	model = "Google Homestar (rev4+)";
 	compatible = "google,homestar", "qcom,sc7180";
 };
+
+&pp3300_brij_ps8640 {
+    regulator-enable-ramp-delay = <4000>;
+};
-- 
2.25.1

