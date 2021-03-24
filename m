Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F8F3481B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 20:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238058AbhCXTQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 15:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238059AbhCXTPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 15:15:51 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6A5C0613DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 12:15:51 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f10so8265420pgl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImvU2fZ+ScriPP8OZqBrmmiLJWQ8IFUi+RbbrLbT96Y=;
        b=e+eg2o9vdPCG+GPSMqoFB0Hih5xw8rh8B6IDIVwSjlYVwWexe+LIOJVWeyyhVz4BLe
         jnYt0BgVtH69cFsswuOU+Q73RGT5CsLlXtAKYI3qbDENioxBnyoojzhalpaM6ZUgmqHu
         JVEflbpHkB4yLxy/abPUK0XeM8kkSQuLosxPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImvU2fZ+ScriPP8OZqBrmmiLJWQ8IFUi+RbbrLbT96Y=;
        b=r16UV9DJ9RwbXiBPMUiHx/nDMiZqGDHgIqPOvSu0ZZ6bFpjfRoXGf74ymXtpl+WCp4
         L9n70b4aNRKMTWdjQvbu6A7FuPpSmSN2nILSprZVUGTjBW6uqI/RmlpiKa7YyGSgPIh9
         2Rfmwj65/paH8hSXbQUHm/soXdgMaO0gomXBVQlW+5OnP0kBze7TWZDkQ4VLGFWhZ4jo
         u9Y8aluVASALeI61vv7Yu4viKTbJbiaIkV1+qpnslxsnTEqehqLNfWP7Jy3eBOppYUXJ
         Tv3k86A47v4l4+1eagZeEvlpSYqmXIusJ/F5WaT6yEbYcpoLeiDg4E9NkZAUJj+hqEoM
         /XJg==
X-Gm-Message-State: AOAM530aDAwrefIil336DBOwM58GuZKX18VbU/h/NM4QEbcj2HbZwNox
        BUC8mdjUUOxW+t8ydxIi44K3/w==
X-Google-Smtp-Source: ABdhPJyqFgwk3xLUDfFAlb7TeNecxtytJKBprIR+BJv239+QVbYjRS9mmDN5+6LTxeu4RhAv/vvMIw==
X-Received: by 2002:a17:902:d2c7:b029:e6:34e2:7a83 with SMTP id n7-20020a170902d2c7b02900e634e27a83mr5093376plc.60.1616613350891;
        Wed, 24 Mar 2021 12:15:50 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id y22sm3216495pfn.32.2021.03.24.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:15:50 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
Date:   Wed, 24 Mar 2021 12:15:49 -0700
Message-Id: <20210324191549.2043808-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We should indicate that we're not using the HPD pin on this device, per
the binding document. Otherwise if code in the future wants to enable
HPD in the bridge when this property is absent we'll be wasting power
powering hpd when we don't use it. Presumably this board isn't using hpd
on the bridge.

Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Douglas Anderson <dianders@chromium.org>
Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 140db2d5ba31..c2a709a384e9 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -376,6 +376,8 @@ sn65dsi86: bridge@2c {
 		clocks = <&sn65dsi86_refclk>;
 		clock-names = "refclk";
 
+		no-hpd;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
-- 
https://chromeos.dev

