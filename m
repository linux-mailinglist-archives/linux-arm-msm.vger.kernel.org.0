Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CEE4A53D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 01:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiBAALI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 19:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiBAALH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 19:11:07 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14823C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:11:07 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id s6so8424686plg.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+cijBLvhJxxRYTV1vDRfsp76gMHCb5POk8j3TEiH8M=;
        b=Jm2CaDN2N7qqGbiD2LddLHmzL00xLkXv3Y3pOSGVcnR7GXM8amxWj2yM/Sle/RNG+S
         f0i0SumDRisGYCqyxMGl4b1wnjKO3oBK8VAKQEOjXmriLtMaL4N+usgJvc2y7F532veE
         IEZcTA3+GAq//gjof5wktp2Ofbrf2vXKPkBuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+cijBLvhJxxRYTV1vDRfsp76gMHCb5POk8j3TEiH8M=;
        b=kMSomXF6MO3wX3k6j5hWnZeSJntdrb1HoIz2pe8TagOSelS2hzYlkOyURa2swvZjCN
         8ytbF1Ccf3g1qGywkGL44LWYkas0UtFhvyTLYHUDUvf2gSMIif1eZ1R0fUwoON0cZZTy
         7e90ljEMAzTnURR0wB7E5nrT6LH6BwyZ31adKNpaDrV5mrMNIuBnUocJ+khN/u7BdDUM
         8iMGYj7mMQVHyTvWKN232Y7GhcK9wNNjq4nHlJwca5Tg5RDzN5gLMB1UoU3Of36kKAF0
         /nEbM/Fn1LwToaQvzJJ98jlDkreNa4k62kI+biJme2iGD5kMAqgr8f2bXY3BBlS1IpJV
         ltsg==
X-Gm-Message-State: AOAM531QGuJ1GUUBgDmiPBTTXGlHgNDqUGbjBSZxWNm2kC3ThKzH2I+P
        C0ASVFzCeLCEUYyOWvPzGXobOA==
X-Google-Smtp-Source: ABdhPJxTTHmLgX2FBxja2v32QILtVmEmRq+EQJCtJOkQ8TcW1LZIjWolmzbSDg7hA1u4ZNmSzIyxrw==
X-Received: by 2002:a17:90b:4c43:: with SMTP id np3mr36977906pjb.88.1643674266633;
        Mon, 31 Jan 2022 16:11:06 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:c47e:986d:769b:ead2])
        by smtp.gmail.com with ESMTPSA id oj5sm424024pjb.53.2022.01.31.16.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 16:11:06 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>, mka@chromium.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: sc7180-trogdor: Add "-regulator" suffix to pp3300_hub
Date:   Mon, 31 Jan 2022 16:10:38 -0800
Message-Id: <20220131161034.1.I7b284531f1c992932f7eef8abaf7cc5548064f33@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220201001042.3724523-1-dianders@chromium.org>
References: <20220201001042.3724523-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All of the other fixed regulators have the "-regulator" suffix. Add it
to pp3300_hub to match.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 7d8bf66e8ffe..78296ed6fd29 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -284,7 +284,7 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
 		vin-supply = <&pp3300_a>;
 	};
 
-	pp3300_hub: pp3300-hub {
+	pp3300_hub: pp3300-hub-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_hub";
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

