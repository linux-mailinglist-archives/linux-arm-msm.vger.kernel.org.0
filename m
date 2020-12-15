Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802742DA5E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 03:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgLOCAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 21:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgLOCAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 21:00:47 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0DBC06179C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 18:00:07 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id f14so272185pju.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 18:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vnlCzHUVCybhHldFJhWEPSZE9ZpbbHF1qUk9jUYAFQU=;
        b=aWdZIveoMtBwELeO863NjnSXIgTdt/yoPVdDhxd/+jEhFPgiqXDzgMIjLub02RBf+C
         qQerLkQ5tiHtF0MjgCc4H1sRfOZg52NgDJN5Y4hu4qlFGxNA2G3WDIflKCfd/M39pgsq
         huLwVqW5C4UZpXjsfkW2kc3EJHsnlzpl/18iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vnlCzHUVCybhHldFJhWEPSZE9ZpbbHF1qUk9jUYAFQU=;
        b=PeXLsu0Pvzcv6ec39Qa/gh4YYPlhgyAfnRNW3hfsObGzsdjZviExA/Jc5ucci4eo6b
         cVB34UgFHa+RCyarArljsrwgcJmKMv3a8Q2LduHiTTpCgCv3J3zBkP0fezYAd7rZPZTZ
         yLALj8U9+4IU3nq/zFjgS1O/zM6+pgMn13cmTWb2zmhNz14ERO6+pnO1xjQ+dT/8fn3J
         3SSMxfY7X2m4UTEHAkgI+7eBiPqqSzyc9ATBeOQDf8iykFCf8A8yLxi97iXw+znls9X/
         Th7GbPrmte7jTe+PYy/TzooNUTp/kklwIyY+MsmC6UNejIthk+rtLXXGHwIlCpqRswCm
         J1jQ==
X-Gm-Message-State: AOAM532/F0HDvgmyctSDqHYOkzYyIl5yr6bUGdHYHruEWfoibWp4EKuM
        b0B86wrGd+KOCTxt49MzWqh0PQ==
X-Google-Smtp-Source: ABdhPJwsA50X67NyFPXh45Vlde5fBA/radYRHZkQ2QeeSkumLCTrR4bFO4QEXRF+joLtMcmtOLGAcw==
X-Received: by 2002:a17:90b:338d:: with SMTP id ke13mr27738380pjb.48.1607997606792;
        Mon, 14 Dec 2020 18:00:06 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id iq3sm19549352pjb.57.2020.12.14.18.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 18:00:06 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Drop pinconf on dp_hot_plug_det
Date:   Mon, 14 Dec 2020 18:00:04 -0800
Message-Id: <20201215020004.731239-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We shouldn't put any pinconf here in case someone decides to invert this
HPD signal or remove an external pull-down. It's better to leave that to
the board pinconf nodes, so drop it here.

Reported-by: Douglas Anderson <dianders@chromium.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Fixes: 681a607ad21a ("arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 22b832fc62e3..268fa40a1774 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1468,12 +1468,6 @@ pinmux {
 					pins = "gpio117";
 					function = "dp_hot";
 				};
-
-				pinconf {
-					pins = "gpio117";
-					bias-disable;
-					input-enable;
-				};
 			};
 
 			qspi_clk: qspi-clk {
-- 
https://chromeos.dev

