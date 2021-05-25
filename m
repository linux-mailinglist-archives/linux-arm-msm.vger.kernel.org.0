Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F078E39028E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbhEYNeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbhEYNeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:34:23 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50901C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:32:54 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id s4so14798715plg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+QStyVVPj08Hs4Si7JrnO3JRYDXcCrB3sX1OrxqUj6E=;
        b=glWhvmrqEcb9c3Lo7vJ3WE3ir+QPGpMWWBFnPXE9hLJOJTXfPlbjF2FgGETlA/XE5/
         Zyy5GD1yTysqlKA58aUGOKw1oEH7xVVQ8SCOZA6sUtUOEmXseMAgJDjx6/4n1F5GvYbI
         v0EorIQkQwHd2RrTqjO2wnyIgCCtFAelYDWBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+QStyVVPj08Hs4Si7JrnO3JRYDXcCrB3sX1OrxqUj6E=;
        b=dEpnqDZMxIyfH4TpKAl6xyUu81r5lJItyr7/9GdcY1TB9eVrRrNvwHtjpUhXexe+Wg
         fG9iogHh6hT6I4Fe/+YVF5apebe21N4VAhOhLREIMtFxP2CcSkTh3B3bCzSTnwI2IsbT
         jyvs2ulSB77zR9vuHGjCmbCHNiS1B4bEDzKiPvYtt8wouYMn4rWERyPbZxHqtjPVItyY
         8yE77uk+2H7I/rBeupkLflNIZ0hmzWPwckvSxWRe9rTW5gedlbmri8QWL692ElXSgbaZ
         nKzF6DFxioF30oRYtNpBBKthYtsUxJ7m1k8LstH/EPc8qAqZNn7Kvt4TSTzOVYdUarvb
         UGMg==
X-Gm-Message-State: AOAM533u7VQYu+3aPD9pRi+t9s5uAi4m0qOhOmN7K1BJhQpSsZ8UGdcN
        fkcistH7o+1EnqQkEn44TtR27UsskBjTrw==
X-Google-Smtp-Source: ABdhPJwgPpHU9r7rGU5NSJSRK4go5ONu7biquF7SbK5A+rDT6ceU0lEwS2a9O6Q72iATpRjzZYu0Bw==
X-Received: by 2002:a17:902:f541:b029:f0:7088:95e2 with SMTP id h1-20020a170902f541b02900f0708895e2mr30885254plf.84.1621949573821;
        Tue, 25 May 2021 06:32:53 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:4dc5:c248:c4d5:68b8])
        by smtp.gmail.com with ESMTPSA id jz7sm2103317pjb.32.2021.05.25.06.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:32:52 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] arm64: dts: qcom: remove camera_mem region
Date:   Tue, 25 May 2021 22:32:42 +0900
Message-Id: <20210525133242.188603-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom camera driver allocates the ICP firmware memory
dynamically, so the carveout region is unnecessary.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..b89e6f78fd20 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -64,11 +64,6 @@ mpss_mem: memory@86000000 {
 			no-map;
 		};
 
-		camera_mem: memory@8ec00000 {
-			reg = <0x0 0x8ec00000 0x0 0x500000>;
-			no-map;
-		};
-
 		venus_mem: memory@8f600000 {
 			reg = <0 0x8f600000 0 0x500000>;
 			no-map;
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

