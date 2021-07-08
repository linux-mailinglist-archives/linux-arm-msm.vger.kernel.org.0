Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE53BF747
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 11:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhGHJLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 05:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhGHJLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 05:11:23 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024D9C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 02:08:42 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id d12so5264673pgd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yg6Z3gvRm/WxFc49h9ykaSeGxX205qh/XOHqR1NLiv0=;
        b=D86zu17peaSI05ZGtRayzJkiERzzC389M/vpUzxYKRPppRcPvGh2WCkxqGTfwF+rca
         bjKDJeII8bS/dnXI9as+S8WMV67p7eAmz/QRPDyfnYlK9XFqq0m9RNvUZk91YSWE4caw
         e1d4ajWd7acS76uFFMfkNNVEj71v+0nJI8CzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yg6Z3gvRm/WxFc49h9ykaSeGxX205qh/XOHqR1NLiv0=;
        b=EILyedmWZEtO9J42oI/RyPwNUk3NQPZyi1LrgGJzAubkMKcOzO309PO1zvSwXZ7O0j
         PQI5qKwtvVtdLvr/c/hZz1y+s1CvMZOuLBvdDim/rqxvGtqQwTU60UKEXHb4AQ96HZlx
         O+NhqF1N9lgWAuW1/p8kQWl4nWheHUtK8so8PiBMxAk3uCUOhhAVBKJ8Rf9dHqRxd2/g
         3nNFUAr5tipSnxUVKYjYtqwgEVCafC3dARNfKavapti+j/VUbBjSguQGBfIDxzNfLQNd
         M3VvbE3WLuUMGEkVZw/b5vy3kaXUjj2AdgF3W/xS+p9NuLBj3tmEBMihDCHUOo/R2GOv
         Ve8A==
X-Gm-Message-State: AOAM5312ZevGNFJBEKCAn60AVCHqiCIIytj8O0iF2A4XJWK6GZnik0bY
        9gr22gstq4dlSbTie9vDOh059g==
X-Google-Smtp-Source: ABdhPJxOnkscBdonJ86nK9tc+Wc4YdX/kKAb4TDhNGLDEIRbN+1e04A66g4E3wdaWfoJcqWtxAvFLg==
X-Received: by 2002:aa7:9407:0:b029:31c:c870:4b05 with SMTP id x7-20020aa794070000b029031cc8704b05mr23767424pfo.23.1625735321487;
        Thu, 08 Jul 2021 02:08:41 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:2693:9a12:155:84a7])
        by smtp.gmail.com with ESMTPSA id g10sm1677024pjv.46.2021.07.08.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 02:08:40 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, dgreid@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Set adau wakeup delay to 80 ms
Date:   Thu,  8 Jul 2021 17:08:10 +0800
Message-Id: <20210708090810.174767-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set audu wakeup delay to 80 ms for fixing pop noise during capture begin.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 6f9c07147551..a758e4d22612 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -23,7 +23,7 @@ / {
 	adau7002: audio-codec-1 {
 		compatible = "adi,adau7002";
 		IOVDD-supply = <&pp1800_l15a>;
-		wakeup-delay-ms = <15>;
+		wakeup-delay-ms = <80>;
 		#sound-dai-cells = <0>;
 	};
 
-- 
2.31.0

