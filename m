Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88FA13886EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 07:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244695AbhESFry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 01:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347581AbhESFpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 01:45:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEEDC06135C
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 22:40:32 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g24so6744795pji.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDPqv+AGN7wtbpPjjahbn+dmEBiJeJla+NXHuJgGztY=;
        b=CFQ2rkcRD6NXzil9QEv8Tknv9r0y7aBoq2LLzhrcPDhbUokV0C0i1tEXOwxu0WZM9W
         Gi3RlTpbKvocPxUvEJk87GTdzFUA9+4x2kYv8mtG50MaqqyAu+1CENotNi6tJLzBjrGy
         r6BVr0BrchfI4OTTn256dH0pKhIBFwT41GrNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDPqv+AGN7wtbpPjjahbn+dmEBiJeJla+NXHuJgGztY=;
        b=U6aD0WqCnzB2ZjTglqWgBqpYjAesuMAdWllS1z2qGuIKNM444g+Fk91Atd6qswB7UZ
         /srkhCm8tuj5OQum3nNjFaFPy74GT6TGC78/vy0s6SBCzohPkmjKBo7u/XWjwHEmogVD
         H3OxzpToGvp8p96W3cnVNAmiYnbp9PJe1ehKb1iUDanIaJo6vqJUeIYP/z5JUOUcOTHX
         8RHL/AxYNkp1wKX5EBMbCtWhmuyZ/EyHVOTjc3T4i2JZVKVPeQdohy4p5rJbz+Ue7Z+B
         xLvR8Fo8hULS918VOt9t1ttr/iPCtPDk3UIvKOhfQuCk9QK00D8pzhIZXJOkfUK6kPbD
         d0Mw==
X-Gm-Message-State: AOAM530oxYQw4ZLxm2+4NoPTy12qvSEBlh4B8+336CLK/OCUWdgCeQKG
        GI1gMteb8juxez7hCRD2RmnJ9g==
X-Google-Smtp-Source: ABdhPJy35T58OKPGSuAkd/FwUh7fXr6tPkdLI26vFEGAVr1Dixf9LwhbZ9/exYaJMJoHhOJr29bIkA==
X-Received: by 2002:a17:90a:aa12:: with SMTP id k18mr9391167pjq.232.1621402832054;
        Tue, 18 May 2021 22:40:32 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:e494:25a5:1a6a:5b32])
        by smtp.gmail.com with ESMTPSA id q28sm4081171pfs.197.2021.05.18.22.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 22:40:31 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Update flash freq to match reality
Date:   Tue, 18 May 2021 22:40:30 -0700
Message-Id: <20210519054030.3217704-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This spi flash part is actually being clocked at 37.5MHz, not 25MHz,
because of the way the clk driver is rounding up the rate that is
requested to the nearest supported frequency. Let's update the frequency
here, and remove the TODO because this is the fastest frequency we're
going to be able to use here.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..af3c0e1e2223 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -335,8 +335,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 
-		/* TODO: Increase frequency after testing */
-		spi-max-frequency = <25000000>;
+		spi-max-frequency = <37500000>;
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
 	};

base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
-- 
https://chromeos.dev

