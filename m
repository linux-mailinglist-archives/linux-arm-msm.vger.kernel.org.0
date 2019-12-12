Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B875611D732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 20:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbfLLTgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 14:36:43 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41898 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730679AbfLLTgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 14:36:19 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so1077921plb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9lBMtFL9Z5icRxLop3LLb6oDnFoI6ElCPHqhjraXO9E=;
        b=XfhnylYKjhMJsSQEUHNlA8miXb6TZ1WBwAaGjKiKWZvaRUM4r6KA8hEfJkaeiLnQS0
         kEWTAu0XumkznVLHHipEC9ziIFbbnebvMJWz52tTcrUNvtiMc2XtqfZ1M7Dj/i1j4J7C
         VTPMI+Dp1WOL1lT+2QBBW6B4gvZOGsBMqGflQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9lBMtFL9Z5icRxLop3LLb6oDnFoI6ElCPHqhjraXO9E=;
        b=F8vj7Tfa8Y19pL46Y7PgzTY3L/7Fk0vp7v7r+a0S8QprsY3mw4TMxudguX73RZP7jE
         QQ5/68amVAWg7cb4O9rYsyiBcGRJMnLQaHKvuUPDk9gSy14+K/JtNHylZ6lv/fYwl8cc
         ZAwL84ZON+Ql5ykhgXQRPDyyYDVHV5afETlp8fYnLoQ4xkMH8YfG83eZEaupddTYD6Zm
         sJMOiBKBYwIBnxpvDh7aKtrBCDL6wrYGcC1it1v72rZlhRtirQPqf65cu1NTDqmEbVug
         ONYvGjiLNh7lAhAhvCFUN8QpA2z61UnkHNYRDEKoFoR31K2qUPU76JM1cSd62fjushO1
         gY+Q==
X-Gm-Message-State: APjAAAXi0GMYEIneD7EJm1jS6WZVyEEsaO4FCUz93jO7S1HEkhkjg9ra
        KarDKHILqe/X2x9pEfOXrtamIQ==
X-Google-Smtp-Source: APXvYqwH2Orm4MWO7tGMP8Tttd7dqIu91Ux9k7g1LMyOoTM4ZVPVjW6/er8/IXzFvv3m0iWdBdMkvQ==
X-Received: by 2002:a17:90a:bd8f:: with SMTP id z15mr11691370pjr.54.1576179378761;
        Thu, 12 Dec 2019 11:36:18 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id m34sm7568302pgb.26.2019.12.12.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:36:18 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/7] arm64: dts: qcom: sc7180: Rename gic-its node to msi-controller
Date:   Thu, 12 Dec 2019 11:35:38 -0800
Message-Id: <20191212113540.2.Ibad7d3b0bea02957e89047942c61cc6c0aa61715@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212193544.80640-1-dianders@chromium.org>
References: <20191212193544.80640-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Running `make dtbs_check` yells:

  arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: interrupt-controller@17a00000: gic-its@17a40000: False schema

From "arm,gic-v3.yaml" we can grok that this is explained by the
comment "msi-controller is preferred".  Switch to the preferred name
so that dtbs_check stops yelling.

Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 01bbb58ae516..1b2bb0b9c9e8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1189,7 +1189,7 @@ intc: interrupt-controller@17a00000 {
 			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
-			gic-its@17a40000 {
+			msi-controller@17a40000 {
 				compatible = "arm,gic-v3-its";
 				msi-controller;
 				#msi-cells = <1>;
-- 
2.24.1.735.g03f4e72817-goog

