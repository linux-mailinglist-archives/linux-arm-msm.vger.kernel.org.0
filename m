Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E5346B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 14:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfFDM3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 08:29:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32854 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfFDM3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 08:29:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id v29so8197977ljv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEMpjywarvEIBpqLOs0vJ3c4H0FioFO5FH41QQdLsTU=;
        b=l31B3A5DK5yaDaUiuO+4HGcagdn0NkvHuppeEAbpodeU9ctKE/fsIFO4+B2QfE/e7+
         G4cnqbrtvFi9AdL7LGafgtKNNbtaQH6MQLkvq7mvfC8wtRHAr4Sv62e9MbAURw95Sb1u
         FqCRGz7XfbCA0quCluQSn7QJlMLjuDlQdrlNEF2mMN1qJU2TFZAwQauDB92Oqd7rwz9u
         0Gyet5i9HEFB/jdW2Raxdn7K/E91xo2e9nhjWC+uuyhTE8vxwD5WAjwSsRPoCAgcICsm
         nJj2IlOT8k03uRjO3xFSFcG5ntXYi3dTqwH+UiVY8aHQJ1BPRGguknNx1ot+0vZC4PHP
         /rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEMpjywarvEIBpqLOs0vJ3c4H0FioFO5FH41QQdLsTU=;
        b=VB2YWG/9NbSeGeH0aly6wAe/8XOZwIefxqKOdDExWoVF/Rg5mHfgkCUnoP2z73zVS6
         MOz9VtlIs2iwQ6dqPtMUsPegb1h2Ii1Qts7Plixq3bqk4KwJSnJo5jqHcfb5HW2K1uuF
         DUMeQBhjFvQgN7eavt6zwiSWOHJhxnNnfsAZY0aFKcXWV3VFnpThsooEhrexpXZkOGmi
         nhR5C/BFxramFaLeOD+c8/ZAunwZIJnvB1L18gX4InoLHQfmEJyW0hdxRaTtjXxbIn1/
         od2CNnBPIx7KysmA+0cNFNdBKUpH3ypCQrt5Oxyn2WEPk1LD5Bfu5WyLRdxOb7il+wwu
         fJ4w==
X-Gm-Message-State: APjAAAU3bEkl8+yrPn2u5091cp5dRrMfZc1YRYkQaUwaMlhR4Y98KF1g
        hX7bRKdMLYuX+41ElCQvVGeRzw==
X-Google-Smtp-Source: APXvYqwV+FwOVL156Jwgxn4HfmhR4c4RJUEji+CigP/7IgjPiauVSOU7vsxfGGhUtHXXXb6eAGi7BA==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr16520655lji.107.1559651375370;
        Tue, 04 Jun 2019 05:29:35 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id l15sm3754389lji.5.2019.06.04.05.29.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 05:29:34 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: msm8996: fix PSCI entry-latency-us
Date:   Tue,  4 Jun 2019 14:29:31 +0200
Message-Id: <20190604122931.22235-1-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current entry-latency-us is too short.
The proper way to convert between the device tree properties
from the vendor tree to the upstream PSCI device tree properties is:

entry-latency-us = qcom,time-overhead - qcom,latency-us

which gives

entry-latency-us = 210 - 80 = 130

Fixes: f6aee7af59b6 ("arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states")
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b7cf2a17dcb5..e8c03b5c8990 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -174,7 +174,7 @@
 				compatible = "arm,idle-state";
 				idle-state-name = "standalone-power-collapse";
 				arm,psci-suspend-param = <0x00000004>;
-				entry-latency-us = <40>;
+				entry-latency-us = <130>;
 				exit-latency-us = <80>;
 				min-residency-us = <300>;
 			};
-- 
2.21.0

