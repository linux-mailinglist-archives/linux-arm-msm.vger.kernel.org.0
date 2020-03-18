Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3EA189573
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 06:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgCRFqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 01:46:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39992 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbgCRFqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 01:46:24 -0400
Received: by mail-pg1-f195.google.com with SMTP id t24so13048827pgj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 22:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wP5msWs+H65dtiCoHZMzY1KxEhCfiPf43beyeK96JJo=;
        b=DyUKc0WoN764jAONlN34IdUIF+JaIJ/8zjaKAOm62CXLomzbzdcCvDBbscthJO+/4/
         HUQc5JeCIlCKeDJVSNGIztS+uufYFrp0cNZ9um/3WnFzpTchsPxWJ3X7Dt6YWGIPCuIh
         lopK9XbixgTN7jbqM7R8gah+p0UmkOXGLsBlHi53U+nSXKrTf9DcyKdStD4Bk/vZR+5n
         62E4hBBBKmbeuU+9U0SSm2hVD12MwJHDVQxwE/lj3Y+nBEQ7oZKeEwxhko2qBkX1TZVq
         Wctb6+M6NBIsjTnYIRYV/jOIMAUXnrZGNPWNEBAyoojAA5goIXBO970mvCRMnrEDA/a5
         DkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wP5msWs+H65dtiCoHZMzY1KxEhCfiPf43beyeK96JJo=;
        b=roZ9GzRVC6ZOfwQxaRIfLH4uEZMbbY/vo/DX63D/kdflSqd+21gVkScPWgacY9qaNc
         WWiVT/Jsy87yQaTBzGngR5wPiFTpUQNvTGuLy/ONaHMQGozuKjrnaMM8uLFQmH8QBTU3
         lPpGXPU8rzHjDUr+PnH19O23x+4/U8+4RFysQdCo1C8BZHyc9bLWXXhyLKqQq8J7jIfs
         LEWSR9TUg20kjN/rd5YR0j/5xMRLcnaTQs+ueB0lndMmxV2N6LRHyO//zzdnmvcJkPs+
         TI9QM/8ODbQu6QL4b0KjE8cP0fhSqIiJMXOVGQIGorYMz1RK8iKfYA6qDfxSi8QMm8q9
         6skQ==
X-Gm-Message-State: ANhLgQ2HpSJ8hkg0UUTwQ8CtKxpkozhuNYNtX8ZzoRuFaiHflGablyAb
        Z0QCCN1Y/j83kfnSZZTOVlxg+g==
X-Google-Smtp-Source: ADFU+vuDWULEK8ztlmXQd1G6mb8a4Xbgj98e4GwLuLlGS8GYoD7fM220tTPWyUhythBWGnl8atQ+9g==
X-Received: by 2002:a62:cdcc:: with SMTP id o195mr2579575pfg.323.1584510380719;
        Tue, 17 Mar 2020 22:46:20 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm5128686pfb.153.2020.03.17.22.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 22:46:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: Reduce vdd_apc voltage
Date:   Tue, 17 Mar 2020 22:44:42 -0700
Message-Id: <20200318054442.3066726-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some msm8996 based devices are unstable when run with VDD_APC of 1.23V,
which is listed as the maximum voltage in "Turbo" mode. Given that the
CPU cluster is not run in "Turbo" mode, reduce this to 0.98V - the
maximum voltage for nominal operation.

Fixes: 7a2a2231ef22 ("arm64: dts: apq8096-db820c: Fix VDD core voltage")
Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index af87350b5547..4692b7ad16b7 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -658,8 +658,8 @@ s10 {
 	s11 {
 		qcom,saw-leader;
 		regulator-always-on;
-		regulator-min-microvolt = <1230000>;
-		regulator-max-microvolt = <1230000>;
+		regulator-min-microvolt = <980000>;
+		regulator-max-microvolt = <980000>;
 	};
 };
 
-- 
2.24.0

