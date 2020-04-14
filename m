Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B040E1A8A56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 20:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504524AbgDNS6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 14:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504519AbgDNS5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 14:57:50 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39684C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:57:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k18so285573pll.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=eLhNg8kDFNpBIRgI1oareY/yJAWpxKnYxH3HqcN0OKc=;
        b=ez1U5xHOxFaBocYyvpYcUW3fff2IH0WXHGkc5ZTFQ9vHmRlorLGiAGbqRVF3ylGzl6
         aQuz4yVKzjIFAREzZf8GrBsBXWjVIBOjMo5r3VdcGcdKizW34CI91N8KY/0Fp0Ij+jLe
         3i6A1zhISgRJ1FvCLFcHCSxzTQE3IhloAOm6a10IcaU/DwxQp10GpZxVQES2LrO8RaWs
         Yk7lMqRiNiXoPWrx6+7aZoRGI77G1c6nX7wOfiF4iKknvXx70ba7kqkM6lMPqmLOEmCi
         8Anbggy4C2herkaUy8MlH3ygKEbO4ekWk1bdySIiPLiy1wadSFSJfb1EViD49iJxegxs
         gEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eLhNg8kDFNpBIRgI1oareY/yJAWpxKnYxH3HqcN0OKc=;
        b=a5HlTGcKd0N01p9YHJQ0MqNC3bqxVsAYnxgP8Cn/h/ax2TxHZpFSBw6HdSq49vBZll
         PPJjV6n39l5wnjYtNGo3OMyKzy65td/VMLyjRJZhOiyegI0wF9o7/6twyvEsE6T7WfRL
         DgGZQgRL3AdNXhO42B8pu0BQa9IEjEIAeNkg+He3EyKhgJf1G7d8BTbqcOOjPRu0z1jJ
         aN3x/BUXjU/Yv+ydjNp/9ljieQ1/bk+rIwk4GhRkGAjqXWgMNKH+yeNIFJ+k6mrNud78
         K6v9GLeYbNpXaoZbPqK1r1GMB4NPxuqGUZAUdW2r/BFa0u+Y6RVW5P/CGQBhugSCanGA
         N9PQ==
X-Gm-Message-State: AGi0PuZJxv8kZUybFJljdru275EgyIyvtREMIQ13LqjNC94OatvSXIQG
        9+c+L3DW5qW+7XEJgjPpwAPuiA==
X-Google-Smtp-Source: APiQypIQqv3aTGpX5KMbNC05HSpYyKy/zSB3plcdQbijP6ouAUwBS3T+FFgq7tSGMMQkTN4B1//L6Q==
X-Received: by 2002:a17:902:8a89:: with SMTP id p9mr1280398plo.286.1586890669483;
        Tue, 14 Apr 2020 11:57:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a13sm1865870pfo.85.2020.04.14.11.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:57:48 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RESEND][PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
Date:   Tue, 14 Apr 2020 18:57:44 +0000
Message-Id: <20200414185744.84581-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes a regression in 5.7-rc1.

In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
PHY support"), the change was made to add "qcom,qusb2-v2-phy"
as a generic compat string. However the change also removed
the "qcom,sdm845-qusb2-phy" compat string, which is documented
in the binding and already in use.

This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
which allows the driver to continue to work with existing dts
entries such as found on the db845c.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
Reported-by: YongQin Liu <yongqin.liu@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Add deprecation note on "qcom,sdm845-qusb2-phy" string
    as suggested by Doug.
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3708d43b7508..393011a05b48 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -815,6 +815,13 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		/*
+		 * Deprecated. Only here to support legacy device
+		 * trees that didn't include "qcom,qusb2-v2-phy"
+		 */
+		.compatible	= "qcom,sdm845-qusb2-phy",
+		.data		= &qusb2_v2_phy_cfg,
 	}, {
 		.compatible	= "qcom,qusb2-v2-phy",
 		.data		= &qusb2_v2_phy_cfg,
-- 
2.17.1

