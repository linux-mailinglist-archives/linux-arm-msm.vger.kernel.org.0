Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA2611A010
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 01:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfLKAge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 19:36:34 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45132 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfLKAgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 19:36:31 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so821581pfg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 16:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YgLOEq+b3z3/DTsjuxwC7KLaORE8dq4xMxztFesSO1E=;
        b=dDPPKNbrgbLGmMbRNeNgFCRoeauYBwrY00fbTjRfRSmxMpI2OpLj9AtyX7y2oPRgR6
         d4I5SVqsBlXmaqb1+77ddPC5CfFwyJMR96XAaSBkO1Vrqw1lgldlKHJA2puQAKdgKKiM
         NU/GaCpRjAa/67cieZTL6Nn4UliUEpYmfjKF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YgLOEq+b3z3/DTsjuxwC7KLaORE8dq4xMxztFesSO1E=;
        b=Khm3Q94Z7+Vm2pPILMSNDgsUrUYbVQQ0od7msm332r/mDXc0QtLMDZjovpd3J1EMtQ
         8q5EBZ1kmc0egXq0mUbmAmKIvNb/s5jWmi3rpU0dOZPnjhI7RuqVO7hJRCryZi3oiZrA
         5pBvIfbWJzyC+0jGjmM3QGMyjPfuasGdylN0hBee25QSDh83f62HODdez1i867icN/v4
         R1JdJ3No907ph9qU0mmanZETkjsJDdwnzvVs7sZZPL7XpTDs8g1a5/FtNykWGNLJ7rQm
         v3yC6O9iIb4WYkp8PlQ+rkRxkK9MA4Z9DXkV6HnuPM/gCRcp6j7g5B2uQtXZBBQbSJy6
         LyfA==
X-Gm-Message-State: APjAAAVmz7jSbZFgudVshjaeQ4R929PzRDh5r/RzY7VQqYE+j7CYob+q
        kI+TSoYLpbHhg/OrZbvPMY+vKg==
X-Google-Smtp-Source: APXvYqzDHrJPYBFC/4ZRlo6kMRGcctk9Da8+L6mFYu9ZNYUFhmEDZGFglvH1i+JoExCrNLitCmIaUA==
X-Received: by 2002:aa7:9145:: with SMTP id 5mr779281pfi.74.1576024590404;
        Tue, 10 Dec 2019 16:36:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d38sm159954pgd.59.2019.12.10.16.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 16:36:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mka@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] arm64: dts: sc7180: Add a comment to i2c7 about external pullup
Date:   Tue, 10 Dec 2019 16:35:40 -0800
Message-Id: <20191210163530.2.I8d4cbb3d7ac5824f8e950c53038df8c27a512905@changeid>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
References: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make i2c7 symmetric with the other i2c busses and comment that we have
no internal pull because there is an external one.

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 5eab3a282eba..05d30a56eca9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -311,6 +311,8 @@ &qup_i2c7_default {
 	pinconf {
 		pins = "gpio6", "gpio7";
 		drive-strength = <2>;
+
+		/* Has external pullup */
 		bias-disable;
 	};
 };
-- 
2.24.0.525.g8f36a354ae-goog

