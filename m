Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3AB41CF4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 00:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347282AbhI2Wk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 18:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347021AbhI2Wk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 18:40:26 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E03AC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 15:38:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id g14so3244213pfm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 15:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lV5xuRCo97FO+/YjOZoVXS4gdXQHaPC1UbDoCKlaVDs=;
        b=Cs/2B1s3XusJZNX2EAmJsThS72QYqL4+OFpfGGSEecNriNH4SxU1ge+7gzBxyLF+UB
         OhVjMXkohP423v/sc7lFfN6/gLgISlQd7qX9ne8pyCgwD9cFw2NVliVeX31vfTN0pR0S
         A1uYNnkHFpJkth9/9vwTFIumYZsM0U6SJIEX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lV5xuRCo97FO+/YjOZoVXS4gdXQHaPC1UbDoCKlaVDs=;
        b=Ajpe9eveXr5mjquBQXrJwq4XLhvRBMCOmjVu/SkFsV/DPQ+J7ChaHiP+iF2mMXjTO0
         Y68zj80/cMJAMzcYg0jCo5MkfflUErDo2NFNEAK6zJ+oIgJFyeu9yMDBX8g5bEKHunAK
         UTLLQyUlGRmRzX6KjaCOX4GYRcz5TFQkYBXr+IjLI81OIDfDbDjPadNSl7XVw1krmNDn
         mTqxg3VVC83VEvqJ9b2JbByaubQ/+kHJ017gHQ46S6OIWwvRNSBBot6ATudMQQ4rZgUo
         iErj1pSsne+9xhJU2/qlbz+VpV94RC+KiigamUKNpxoK3YWllzxDAQT/UP9Q0KclppmR
         OUnw==
X-Gm-Message-State: AOAM533dczIelHus3RkzaytHNMD70piy0XBKtKvUHHvw0VlgVpzOPUSb
        lBfZoiV2NCyITuycoc2LnlU38z9aOg6Y3Q==
X-Google-Smtp-Source: ABdhPJzROFeEh/I+CPoPCnPZGs6TN7BdSFr9TWP5SM864JfRr89Ikuw9DFNIAz34rER4AThWfWtM9w==
X-Received: by 2002:a05:6a00:b47:b0:43d:cac0:cbe with SMTP id p7-20020a056a000b4700b0043dcac00cbemr2136310pfo.79.1632955123366;
        Wed, 29 Sep 2021 15:38:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:ae60:9169:75aa:d8e9])
        by smtp.gmail.com with ESMTPSA id u6sm612471pgc.68.2021.09.29.15.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 15:38:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     bjorn.andersson@linaro.org
Cc:     vkoul@kernel.org, mka@chromium.org, swboyd@chromium.org,
        skakit@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pmk8350: Make RTC disabled by default; enable on sc7280-idp
Date:   Wed, 29 Sep 2021 15:38:14 -0700
Message-Id: <20210929153553.1.Ib44c2ac967833d7a3f51452d44d15b7b8d23c1f0@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RTC on the pmk8350 is not useful on all boards. Some boards may
not provide backup power to the PMIC but might have another RTC on the
board that does have backup power. In this case it's better to not use
the RTC on the PMIC.

At the moment, the only boards that includes this PMIC are sc7280-idp
and sc7280-idp2. On sc7280-idp I'm not aware of any other RTCs, but
sc7280-idp2 has a Chrome OS EC on it and this is intended to provide
the RTC for the AP.

Let's do what we normally do for hardware that's not used by all
boards and set it to a default status of "disabled" and then enable it
on the boards that need it.

NOTE: for sc7280-idp it's _possible_ we might also want to add
`allow-set-time;`. That could be the subject of a future patch if it
is indeed true.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/pmk8350.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index 04fc2632a0b2..769f9726806f 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -59,6 +59,7 @@ pmk8350_rtc: rtc@6100 {
 			reg = <0x6100>, <0x6200>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
 		};
 
 		pmk8350_gpios: gpio@b000 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22aff33d..e11412bae738 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -61,6 +61,10 @@ &ipa {
 	modem-init;
 };
 
+&pmk8350_rtc {
+	status = "okay";
+};
+
 &pmk8350_vadc {
 	pmr735a_die_temp {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
-- 
2.33.0.685.g46640cef36-goog

