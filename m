Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2B2B179878
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 19:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388329AbgCDS51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 13:57:27 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41200 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388328AbgCDS50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 13:57:26 -0500
Received: by mail-pg1-f193.google.com with SMTP id b1so1421215pgm.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 10:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idtFy8s7OaNPWyKbg7P+1dRKvA+ZRf5zuxknR7OyW1o=;
        b=P+wHUgAfTLxMQ2NcHR/tTiyoigV9cEhyD/cKtzqf91Cc47F9lSfj2Sbn3vBkR8MKA4
         HKATzrSgYdIqrlRSJ+u52MpPHsjvVLLagl6mT+sTceC5IVRaJI/IVta88WVHPHpDjCi/
         MdtGjOBHDRAVq41VdjCz1mMvtjAHJogDft0A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idtFy8s7OaNPWyKbg7P+1dRKvA+ZRf5zuxknR7OyW1o=;
        b=Bdnew4fMqdACNP8J7hQyjtPs5ge3sh9pF5WyPWPrFD4t3qHmesgRdkU5xvqVodRI2o
         uKZPc6Whjl54pWLzpy00H0B311e/KgsYOwfCndTKE/CX2F4SsryIqcUhhpTOnjwN/CDH
         14a9VFu0tmMN2zwBtdJmO3xl8llBbPHgr3N7akdPiZrwFA0JEe5WNta8dqR2fEqwekO0
         8VC5tJ9kpxBYncrwcwVox++PpRvgk8w3bWngqjsTi0Etlh9p1Hc2sTS7DhCBxLMckFhd
         rnZmHr+78TIyvGArCY0zDO+zRzo6+D0lsfRV141q+x6hc/TFFSBsBGwmWkU4FTlz8f+4
         LpyA==
X-Gm-Message-State: ANhLgQ2X19R5N+6Gw5KO+ZP4E0qnmt1j3ALeEqMMctkZrrXy7g06Z/+G
        ByzchnfgQrj2XY85pCojtozvGw==
X-Google-Smtp-Source: ADFU+vsFNLAgknRkVaIM88rGnq3JGV02sq8SLXTLvL9+Yxwez8qby8TqAzle/IPrOWuYWkvutiT15w==
X-Received: by 2002:a63:5859:: with SMTP id i25mr3699184pgm.74.1583348243434;
        Wed, 04 Mar 2020 10:57:23 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id cm2sm3576394pjb.23.2020.03.04.10.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 10:57:22 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sc7180: Add unit name to soc node
Date:   Wed,  4 Mar 2020 10:56:56 -0800
Message-Id: <20200304105638.1.I9ea0d337fcb927f52a28b20613b2377b6249c222@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is just like commit a1875bf98290 ("arm64: dts: qcom: sdm845: Add
unit name to soc node") but for sc7180.

For reference, the warning being fixed was:
  Warning (unit_address_vs_reg): /soc:
  node has a reg or ranges property, but no unit name

Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 253274d5f04c..8e71f543819e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -359,7 +359,7 @@ psci {
 		method = "smc";
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
-- 
2.25.0.265.gbab2e86ba0-goog

