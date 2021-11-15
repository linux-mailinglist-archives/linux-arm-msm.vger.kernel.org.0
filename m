Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FE144FD42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 03:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhKOCxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 21:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhKOCxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 21:53:44 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91F4C061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 18:50:49 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id y7so13326208plp.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 18:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xTQKF545WIEv8NdbUMDtNn/xAn3UO8csU7nGyHdHUKs=;
        b=xnwL9CgNsexzlT2llqqeRccotpktnnLwncyi8BsuXEvL21WSAQOjVVkxXGSuHuPgrY
         n5VviS+yG3tw+yMa3OVTG769loAkPMngx5z9F6SsQVf33kJysqfOEM6kEr9rugBe0eVu
         zo/uFKJisuhzpN1Nxe4YsCgLvmYTuukgGz4v/iVJB6bgL5lSwGK4pXF3WUOy6NyVh+Uy
         Bx3ASqLyiQPNw/5BXuEY4XHIbUX+SqDy4a5veOoXw87UUM1mb6T1zl7yMFmwCVlq9CGW
         Eiiqhu1fgjVIwG8BiHAU6A+b3S84H4KY9DtCHDTAoxbCG7j76a4qoOYktGCYEBwpITIV
         3dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xTQKF545WIEv8NdbUMDtNn/xAn3UO8csU7nGyHdHUKs=;
        b=QtOAw31oULSFGUDEiPESvDIZ/EQAbEdKLrG/JPeYLwtneabX80VSwT1gnDyL+vafbF
         rnl+CpcHBMgVi2LswaD9TCqJeoWN0zWkWsauDFllq3O19xire/w8M9bHmH6OmkB4cpvJ
         W2lkVWh3jDMdl5KdrpWjoT86NqC90tPeMFa9UCqVBeKxC+7qrS4RhNfZSkkDKMDrzyQA
         GRXeoMwrxaujWW2GiMp4O5RVpz7SKnnEOKJ95CwR+hVeLYTOVixtTooFUVZxNLFStXou
         2krs4LxIXnpM3kaE2G+VuY0hhXr2+aSckD4HIrivSdIgMJEdAv8LELcBzZaqfV36ZdQk
         X6GQ==
X-Gm-Message-State: AOAM530TvnVwoBAtZu/SVxfB2IgSaf9VDdRUV7UIb7hTLwWlPAL5n+9A
        CBmFAq5OMkvD4CZ4PgeKu23kiA==
X-Google-Smtp-Source: ABdhPJz9lnphc4vhvYMArsSyNpyQN3UcfLrSJp3rtQA5c7BraubLe7ZY6GUT5ZRY0J+4cnlnvi776A==
X-Received: by 2002:a17:902:e88a:b0:141:dfde:eed7 with SMTP id w10-20020a170902e88a00b00141dfdeeed7mr31667800plg.17.1636944649180;
        Sun, 14 Nov 2021 18:50:49 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id p19sm14817056pfo.92.2021.11.14.18.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 18:50:48 -0800 (PST)
From:   yangcong <yangcong5@huaqin.corp-partner.google.com>
To:     dianders@chromium.org, philipchen@chromium.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] FROMLIST: arm64: dts: sc7180: Fix ps8640 power sequence for Homestar rev4
Date:   Mon, 15 Nov 2021 10:50:34 +0800
Message-Id: <20211115025034.8603-1-yangcong5@huaqin.corp-partner.google.com>
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
index fb27106bbb4a..0de0c97f5728 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
@@ -15,3 +15,7 @@ / {
 	model = "Google Homestar (rev4+)";
 	compatible = "google,homestar", "qcom,sc7180";
 };
+
+&pp3300_brij_ps8640 {
+	regulator-enable-ramp-delay = <4000>;
+};
-- 
2.25.1

