Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8DD2A380D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 01:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgKCAyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 19:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgKCAyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 19:54:37 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A92EC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 16:54:36 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id x6so17155389ljd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 16:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MAoskpdgpwqYFVZy1SWoFP45MNq0LuspN6fWJIM1v0A=;
        b=gVNuAJqaTXBQnqR7XiKpLSC2+28r5a6+eyyRDk7me37u3V18j1zJYLZQR1gGxMGVg6
         ZZ+XmHlXA2/ZSjbyYHeDglKvtcbNy9lXQtNHy6Lw8WvhZxlaxFNU5QQWElg5q4geR/rK
         DZPg9PvZkTMOmpa5ugIkborkEUXZzXE79zJJVsUGgxeg00+MjCrbSSh1lFzTUJUmyBeW
         nGs+VtJ2h/9y3uW3e/Y+vnl+lTqQz6ee83EufKLsAsbCCwja2RxsOAsTSj7t2iZ3t5Lm
         3dOdGcu2s7owtK8o3ydGolOwMdCStpuVGgwFUEw0pARJX2Mg/8vqhqeR+amC3Mt7veOd
         f9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MAoskpdgpwqYFVZy1SWoFP45MNq0LuspN6fWJIM1v0A=;
        b=GDaxITyIE0SjoJYUX4LMAwGvvdHwUiHsFLCfXsLd1U2y4Dh5bQhhky8sF+F8KxjJCt
         bg2ss6SNGmC1ycdOWIiJU7t2PiL/49DGwX74lPAxvYmfgLvdy336I5UgGqqUNGYRKDCV
         RDGWhOzrYyfqoBImm+3Xi9SyfTJX/D9PF2OqB99XXDv3xS4yfHKzKRdb0TUebhPzRqhA
         dmaWAPgThSfeqwYmNQPjP0thJk9MWVQ5FncX7hfTs5hlGSLw7k7S0KLumLfsR4IC422w
         nEPTlrMpe3EWJ6Lm9wWintcHihLqgWuEUNaQAOEHv7c1wcC/No/qOTVp4mQma7PF3pqj
         MPUg==
X-Gm-Message-State: AOAM533G0xiNj3usXS8VX/znKyEmSdiUUSL8V/A+zM3J0FAPQ+jEyaTR
        Qg6BP6oq6uSDc2GAFWFAPgR3TA==
X-Google-Smtp-Source: ABdhPJzQPf5m3MC1z8NsEsHmXtYLA+Z3S5Mv9jz6+Sxvz67LTrC+J91LM1gG759UoVfOagAcV47TJQ==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr8032677ljj.194.1604364875047;
        Mon, 02 Nov 2020 16:54:35 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id x20sm3298976ljj.139.2020.11.02.16.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:54:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RESEND 1/2] arm64: dts: qcom: enable rtc on qrb5165-rb5 board
Date:   Tue,  3 Nov 2020 03:54:31 +0300
Message-Id: <20201103005432.1181832-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PMIC's RTC device on RB5 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 1b6406927509..a53eccf2b695 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -97,7 +97,7 @@ die-temp@6 {
 			};
 		};
 
-		rtc@6000 {
+		pm8150_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
 			reg-names = "rtc", "alarm";
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 1528a865f1f8..fec31655141c 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -459,6 +459,10 @@ &pm8150l_gpios {
 		"PM3003A_MODE";
 };
 
+&pm8150_rtc {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.28.0

