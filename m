Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77F912D7A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2019 10:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfLaJtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Dec 2019 04:49:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38078 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfLaJtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Dec 2019 04:49:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so34782815wrh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2019 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QlynVDqq1junwnny5y2Xt8oOjXoq/q7cxOkJicwDmw0=;
        b=GYOFKPSJ/A0He7qVKqsX+ck1wLJ1VWEkOGADBzw9nQm/8qJtN1iMJHrRZnSvddDBXd
         pS+OWcV5QzmGjHPtUE4+ELg2gCtJuq70kEdsZgeQ0Bv/bEX0m2txgawv2mgbtSknxX2S
         e7UqLvxCtz4n9Nkgla89NjNgn+OmgtoSjTLFiAAbEKWBFERXquNv3pM+o0263tvFs8qS
         T7oYcrxeM6AcCjAKCQUIUtyLsFs9fWixdjIunTv6Z3m4tS7/tPE8jd6LhZC6PQS/0WDk
         TPsswuUmYn/nRb06FHd2FzMwILentshjNK8KHDEDJsDyQ6IeLEIqhhWbOTVxdu1ma2Jp
         F96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QlynVDqq1junwnny5y2Xt8oOjXoq/q7cxOkJicwDmw0=;
        b=fUz1RBmkWSjIYVjCHNUnZwpgUlKW1j86qysf2NrT7HCge5aJYkPeyW71+HYgw97OWo
         dhrEuO8v0nHf5N75MnTiH2EEaPaWUbsIQcsNhEi8xOj6KRMg+dTOXFkm9N+TZSW40oka
         OLS5v1y2EIR4SHa2EDgCMqIwdXS/srakwLzngiJQ09YLplLkiKO1V3GLAmWrwzFWitK9
         Mj9X2knmKkBX1VrwUCo9QmpL/NtbSYoqkvoZNxEc2vH9ZRywAGwVy+WwUcAvRHjoZo+o
         IFUl1d/zZe10u6CkIzbOeDJBjo9njPlEER2L9zvlvHl/0hCrm+mz9yXgy13yWx5dj6AD
         Mxlg==
X-Gm-Message-State: APjAAAVw2HdaVOQsEy5u35HpjjymtBezabg9+cBBOQKs/jXq0LjpAqFm
        wIS10E3ea7kHOrB0m5YLtK7c7A==
X-Google-Smtp-Source: APXvYqzl/jUDnbUgODbzSj3rPw8tZ7hVTwh/mwDxVtOwl/+umsbZhbMP1jzLZe9ZihpzCqzuQ4hXSQ==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr29943856wro.310.1577785763831;
        Tue, 31 Dec 2019 01:49:23 -0800 (PST)
Received: from lpoulain-ThinkPad-T470p.home (amontpellier-651-1-422-191.w92-133.abo.wanadoo.fr. [92.133.205.191])
        by smtp.gmail.com with ESMTPSA id u24sm2092949wml.10.2019.12.31.01.49.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 31 Dec 2019 01:49:23 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arm64: dts: apq8096-db820c: Fix VDD core voltage
Date:   Tue, 31 Dec 2019 10:52:37 +0100
Message-Id: <1577785957-31291-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

APQ8096 has its VDD APC (Power for quad Kryo applications
microprocessors) powered by PM8996 PMIC S9, S10, S11 tri-phase
regulators (gang). The bootloader may have configured these
regulators with non sustainable default values, leading to sporadic
hangs under CPU stress tests (cpufreq-becnh). Ideally we should enable
voltage scaling along with frequency scaling, but for now just set the
regulator gang value to a sane voltage, capable of supporting highest
frequencies (turbo).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index dba3488..8cde693 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -493,6 +493,11 @@
 				core-vcc-supply = <&pm8994_s4>;
 			};
 		};
+
+		saw3: syscon@9A10000 {
+			compatible = "syscon";
+			reg = <0x9A10000 0x1000>;
+		};
 	};
 
 
@@ -681,6 +686,25 @@
 			};
 		};
 	};
+
+	pmic@1 {
+		spm-regulators {
+			compatible = "qcom,pm8994-regulators";
+			qcom,saw-reg = <&saw3>;
+			s9 {
+				qcom,saw-slave;
+			};
+			s10 {
+				qcom,saw-slave;
+			};
+			s11 {
+				qcom,saw-leader;
+				regulator-always-on;
+				regulator-min-microvolt = <1230000>;
+				regulator-max-microvolt = <1230000>;
+			};
+		};
+	};
 };
 
 &sound {
-- 
2.7.4

