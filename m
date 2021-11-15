Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5100144FD51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 04:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhKODE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 22:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhKODE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 22:04:56 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C83DC061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 19:02:01 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so12003157pjc.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 19:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xTQKF545WIEv8NdbUMDtNn/xAn3UO8csU7nGyHdHUKs=;
        b=KTR1gjsiglaMRgP/7eQtLxW0PKTm6j+UrgdfSMdVyf7zz5QsSkvRO0Zh3L04t5aPeO
         nJhDNMyRqxCwH/qujK9VJtoSWsqgwGHf2BxFuebhcUFY8qnixgSlBoV370HLRDviuI8m
         YtsfHcyV9Vop6JlS9+9zCbsro5QqtCrto6mbGgEN7AFf1X9z4s+Dea45FHxVpfnUn3Kn
         DA20xb0AzDeinywAb0sOy1+SIjPEk6kf2IOxI6npkegNKeYjrF8PdHmTemxuDwIx0Nud
         SkUYy3OfjHSpdYI+95gPACxbzZ2DQQ3q0fd1bY73bjH/IVNhAlUJ4V3jZC2dM1pcZFPy
         a57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xTQKF545WIEv8NdbUMDtNn/xAn3UO8csU7nGyHdHUKs=;
        b=sgvS5Z6Yw1wKYIUKRaRUQmFHKG2xrbUJQLqoFbju4vJYzSjgMw6uiYP1U2dqKPI5Dz
         GFiPGTmOCPVLh0VIZik9x4gJUBcMTOf99FjVmwjEnUuzjlRoIl8s0EhZzvmKZs6qZh0u
         EInntONQYnRVQ9FhMRJjelkD7N7lwbqnfEjNohhhSKTWdouB3rAmjYHYBAf7yDXhoYAt
         9LRfuVe8Hn8aqEBrR7ZNOubf+WabIlSsVN+y31zHAl6Z28sbfVrf2t2z7XtQttl42QtG
         WO7/44lo+P3o6A0bnW8dXHacr1nJ9Bel8lMrxJz63Db6E7OKEQ5SaNf7r91XfZ6e7qM7
         t43A==
X-Gm-Message-State: AOAM533Jbke2KtMFQdN2RDFli1vVSIjG47UM14qQy9lOqeRiJyZgu5w7
        p/qayWIhV7sWpd0TvSvKMaYVOg==
X-Google-Smtp-Source: ABdhPJwQ0EOqOL31j8Wqhc+LAHhYt2fcvFgI4lRQO2/c0y7AoYkzEsYOUhxC2qY3akhJL5KNWYw2aA==
X-Received: by 2002:a17:90a:9294:: with SMTP id n20mr41537292pjo.69.1636945320760;
        Sun, 14 Nov 2021 19:02:00 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id hg4sm16696068pjb.1.2021.11.14.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 19:02:00 -0800 (PST)
From:   yangcong <yangcong5@huaqin.corp-partner.google.com>
To:     dianders@chromium.org, philipchen@chromium.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] arm64: dts: sc7180: Fix ps8640 power sequence for Homestar rev4
Date:   Mon, 15 Nov 2021 11:01:55 +0800
Message-Id: <20211115030155.9395-1-yangcong5@huaqin.corp-partner.google.com>
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

