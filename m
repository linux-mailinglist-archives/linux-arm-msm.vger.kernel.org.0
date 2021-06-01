Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC139397A26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 20:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhFASqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 14:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbhFASqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 14:46:01 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132D1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 11:44:20 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id t28so179805pfg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 11:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2TX2Vdw/o0zaTAKknUFEUNmG6BDmXhWCNuSw8+ULck=;
        b=L1fnkDVpJ/NPH+VgFT9ATs+Iu0eyrT8uz6GPjPikqry3DCOwqwQAPAZn3xVm1R+j0A
         MJvVBxIUOv0EUZSF1rtfD5FwUeDp4UYUICoIZ93z1HODM7rdqgSCCaJMRjgRomuVCa9D
         G7exwru7qL82YjXqlJ0jOIbPxXSW1TW/WOK7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2TX2Vdw/o0zaTAKknUFEUNmG6BDmXhWCNuSw8+ULck=;
        b=CEsnpu+tf1C6ez0F8x5sMZug1uPndGkYlf9aPgoWdpDvLhGRZZnqqtimVMQ3Gp2Ges
         2Ug2eJVTRuK1I891iip/xaDc+BJ54qxIhrUooYO3vYyNFEBY1Etg0ewhxWt3nwLAfkg4
         q7OPu1SQcDuxi82Q+p1B6GVa3U3yRM64c+nLz0hSofS732Fn5hjS+PmaF5AIyXPfBHL2
         0tv5O08G5oY0UHyYW6LZJVZhokJkstDxd5fAFKQ0x+rpDA4cJ7b10TwOVTX5CKxMwc46
         ZusC2bJ/cuVWxTK3Ugn4K5pUDUNKJl2ddeIi3M/2seihM6//cZYlAqcEoHqBzIcuhsVI
         nRaQ==
X-Gm-Message-State: AOAM531ldzpD+p4wbv7UUy9gFbMaTW88Zik/q+XB1tOE2PNIJMqs/iPd
        JkIRUopTcirBaIvRbNGKd+weqQ==
X-Google-Smtp-Source: ABdhPJw9MH696XihyRpyC1GpZ6E1M8Ahri6D6zpRirylleIKHL4+GHBH7lfMIWvd4DSv+8WWxyD8Ew==
X-Received: by 2002:a63:5060:: with SMTP id q32mr29791486pgl.32.1622573059486;
        Tue, 01 Jun 2021 11:44:19 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ee82:b2a7:c8bd:18e7])
        by smtp.gmail.com with ESMTPSA id m13sm2846319pjj.18.2021.06.01.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 11:44:19 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: Disable PON on Trogdor
Date:   Tue,  1 Jun 2021 11:44:17 -0700
Message-Id: <20210601184417.3020834-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't use the PON module on Trogdor devices. Instead the reboot
reason is sort of stored in the 'eventlog' and the bootloader figures
out if the boot is abnormal and records that there. Disable the PON node
and then drop the power key disabling because that's a child node that
will no longer be enabled if the PON node is disabled.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..cbde625cbea2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -805,7 +805,7 @@ charger-thermistor@0 {
 	};
 };
 
-&pm6150_pwrkey {
+&pm6150_pon {
 	status = "disabled";
 };
 

base-commit: d07f6ca923ea0927a1024dfccafc5b53b61cfecc
-- 
https://chromeos.dev

