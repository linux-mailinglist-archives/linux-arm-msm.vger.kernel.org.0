Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303D43E9781
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 20:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhHKSTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 14:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhHKSTa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 14:19:30 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2197C0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 11:19:06 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d17so3739899plr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gKVoI857eV59yGVCpnpGmuE3eZ6QKq/ygbPwI02F10E=;
        b=iIKu8JcDcnXwDVZ2Sbgt1DUtxcgjpRp5KmKvVaZuaRfpjwnQtZehUrZEmBUzmSoYFk
         o2OAq1h/lQTaEQQsP5jd/nx1d4fog4ZRZpmZJ82DSeDEoAxb/dZSyZBgRJEk1OdMFq9U
         pYquPwFdWsG3veZTCyWio7whBKm82rrXO+b8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gKVoI857eV59yGVCpnpGmuE3eZ6QKq/ygbPwI02F10E=;
        b=HR9nITIjuswOSWxObSwqkrt02Vl8opZLpYsqa5xdU2QMbbgmPp9KV7SfOqBvpHXHBH
         ZLVccBt3jOLR3e3syCTnwMqgCk8z/QBy2lCoSTI5PFPINBJ2dzAd25bjqow1H+o2BCqj
         34M67pbXTyOyV6+AqDXWJHxrKu+YWDVE4oYzspbCxy50YA84xkYOcDkBIkI79FWr/DWw
         VsxTsMPp9Rc/7tyPNBxvQ+kV6T4XlXy4xLiSC8pb6cAbThUXmRDv70QmDd+Sey13moqX
         NtMt8Dz3r61mOqObM+KBBpTYcwFyxi4Sg1PF3iY9WTVbENVLCCVmgWTfEpHaEiZL6Mr2
         T4Mg==
X-Gm-Message-State: AOAM531fUdEcjPYVL2d+hGsgOr/o2Dq83uMNQZ2z7j57Po6VE/UJ7pu9
        cDVtrVB+sD2UMDYOMwrFyC56TA==
X-Google-Smtp-Source: ABdhPJxIkBUVFl1x4qjyNrZuRkWAOfGzFoLEWZR3B6lokmBF52NkFwJ8aG0iGwB0LGEOhhsvPiCtHw==
X-Received: by 2002:a62:8042:0:b029:3cd:8339:7551 with SMTP id j63-20020a6280420000b02903cd83397551mr60343pfd.79.1628705946146;
        Wed, 11 Aug 2021 11:19:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:1c85:53f6:c893:55e8])
        by smtp.gmail.com with ESMTPSA id nr6sm7222027pjb.39.2021.08.11.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:19:05 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Alex Elder <elder@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Use GIC_SPI for intc cells
Date:   Wed, 11 Aug 2021 11:19:04 -0700
Message-Id: <20210811181904.779316-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's use the GIC_SPI macro instead of a plain 0 here to match other
uses of the primary interrupt controller on sc7280.

Suggested-by: Matthias Kaehlcke <mka@chromium.org>
Cc: Alex Elder <elder@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index f70ab3c5d08b..569802536321 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -598,8 +598,8 @@ ipa: ipa@1e40000 {
 				    "ipa-shared",
 				    "gsi";
 
-			interrupts-extended = <&intc 0 654 IRQ_TYPE_EDGE_RISING>,
-					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
 					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ipa",

base-commit: 97ec669dfcfa22f8a595356ceb6ce46e7b4a82e9
-- 
https://chromeos.dev

