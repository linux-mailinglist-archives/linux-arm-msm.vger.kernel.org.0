Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FC846CB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 01:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfFNXPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 19:15:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38476 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFNXPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 19:15:00 -0400
Received: by mail-pg1-f196.google.com with SMTP id v11so2341575pgl.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QDDURWlUIkBem+8Px1iuYauus00ZwA+eO174Z2pwlBA=;
        b=sdp/0ej3rTCJaEMMi7NPSSimBJnCnh9meuvszGKdQx0N8fq3z7KoSt9YKiuIzepVam
         khf0r2UBtCtNxVWXPsG1uK4h0gTqPqM1Fh7pX0AJMRQRO3YtkXDpDynnSzt5AsogxRBg
         /OWopd3+QFf5k4B8zzfzfNfz6bZOD4fYeLoTBzCLVaIRrZYxMgQTiqlwo6NA9V0HDf+z
         I/3QR9xV0ycb4dYuEQOIhHpaaQ2iC36wLnF5IWcRZUG/bvsucXQIUIB1oeb77WcgAWF5
         wgSK7zzb1YiPng3iIGf5owzX8dv1t0lxerWQt4TbaViSYzff4vwdrBcSd7ql5bfk89YF
         iwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QDDURWlUIkBem+8Px1iuYauus00ZwA+eO174Z2pwlBA=;
        b=kdj5Gr6fniAQkEqRjDj879HjKHoVrJ6lIfIn+zBxOToNbCAmlvIwMrYg0VX8yb4WDC
         Q7YDvoRM7UZgMIG0cvtNVieonsZgRX8sLEdp9erINFk8AeMpFWLS5oEm8ovi2MsTQw+1
         /IBzahQD964FWXQWpbmSxno0txnlAwSYyFhTVQUEEmiltVBApm922798WrUXND50kaRK
         v4kO5+7yOY3Su/U5YkK5FVYrA5QfiXa+Jm+n54GSqlKeBiARlWLB8jzve+gD44yVRQZ9
         rLXH/+MaQDY+284S/YMnQmWjWrJOwrGHqkl+jBRCXUqLFfhgjVBzR8cFA2b8z5h6LhE5
         09Dg==
X-Gm-Message-State: APjAAAWQaRdb8sOjOgtVsX3MC1Kt9jmSmsWd6WTHNU0vuVKITIsGYaZM
        2Ij9haCNYZKbefa1ICTE3U/4mw==
X-Google-Smtp-Source: APXvYqx9jnjWVJBhIcrRWaOSM4DlC1VnTWIPv6OcbVnNMdbv99MXOwW3fuo59oqYVp1rS24CjZVhhQ==
X-Received: by 2002:aa7:956d:: with SMTP id x13mr62314991pfq.132.1560554099521;
        Fri, 14 Jun 2019 16:14:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id w187sm4486445pfb.4.2019.06.14.16.14.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 16:14:58 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: pm8998: Use qcom,pm8998-pon binding for second gen pon
Date:   Fri, 14 Jun 2019 23:14:51 +0000
Message-Id: <20190614231451.45998-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614231451.45998-1-john.stultz@linaro.org>
References: <20190614231451.45998-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This changes pm8998 to use the new qcom,pm8998-pon compatible
string for the pon in order to support the gen2 pon
functionality properly.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index d3ca35a940fb6..051a52df80f9e 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -39,7 +39,7 @@
 		#size-cells = <0>;
 
 		pm8998_pon: pon@800 {
-			compatible = "qcom,pm8916-pon";
+			compatible = "qcom,pm8998-pon";
 
 			reg = <0x800>;
 			mode-bootloader = <0x2>;
-- 
2.17.1

