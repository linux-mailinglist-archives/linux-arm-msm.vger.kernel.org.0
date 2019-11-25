Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58848108FD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 15:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfKYOZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 09:25:19 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43702 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728045AbfKYOZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 09:25:19 -0500
Received: by mail-lf1-f65.google.com with SMTP id l14so11163639lfh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 06:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EuFRcfNq3LsLJUbGBe/N0k0kxrqgC13hX5+2ejknKGs=;
        b=AkAOL4O//f/RtBY5VC03PxSWYUE6xfXln26RyI5bNloyd5gy7kJqQlMwwu91Oaz0ZO
         RHeLXkrD8E+/HVxzKXXpZ8Yg2m71+hIudIPVy9nlwgbwLaDUxhYOHoFMHeL5J/QYKI+O
         +1ko2kO8OHLBdd3Gn0NpIelexXRaE8FTXlGhEPWeqn7t3vTY0ogWRFyfyKBWX+P9Hunu
         /9y5p1pGDHOxWiwD0sklo209ARyQY1OjPi+FKaoCmMhR+SEa45qMXH9n2Ds335kHj/MU
         ioWhRFXJAjRiDvxzofqr3KDMrkX7UBPNRwXI7KnRUYWSK8Ypzqj38UNhhIIvXLnAHQfc
         2vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EuFRcfNq3LsLJUbGBe/N0k0kxrqgC13hX5+2ejknKGs=;
        b=kMYgoy3o9O7lsZ7lzk5TjyIF1/Z3jbSS4ApbdMelZfAu9BNRhxexN+++BzL1QAQbsT
         sPijOXrHbzQniy2If1sHC+czfhp2islvesA7hosnOVSzfy5Lgr6dc61V/UG6s6cAF3Zd
         ccIVGP2K3DSgGMMOHu/dLuOZPwMO+utuhJmFJO+5u9+iGxBgKzha9FwOKcnJpPrv/flV
         a0f0M8sbCSEYeffFaztY3roiFuHWEEqRQ0vV8WHupfKYkBBPd5sNgXblHfxWrHwJAuFR
         siaxhO4CEFpEHsuwKwyCsFGu+XvvPbM4G97f4I8VC7VeYLY6jleAW8UEg6+bRTzVd8On
         VWLw==
X-Gm-Message-State: APjAAAWHBgAml4TU+O1uyujwgzRYdNF1Dz0q5iusuIJ6ZyhveSumtZW6
        o2GV7Be6sb2OdfIxZVSJi77AvA==
X-Google-Smtp-Source: APXvYqzuq/eLmUxMrkGzcX3pUkJ6NfSsIbuDwa4XqpO40lHVmtRNc4qkwNjG1guC3iEzcehjjqVnkA==
X-Received: by 2002:ac2:5b0f:: with SMTP id v15mr10082682lfn.99.1574691916018;
        Mon, 25 Nov 2019 06:25:16 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id b28sm4595260ljp.9.2019.11.25.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:25:15 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: qcom: qcs404: Add HFPLL node
Date:   Mon, 25 Nov 2019 15:25:07 +0100
Message-Id: <20191125142511.681149-3-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125142511.681149-1-niklas.cassel@linaro.org>
References: <20191125142511.681149-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

The high frequency pll functionality is required to enable CPU
frequency scaling operation.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v1:
-None

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index f5f0c4c9cb16..78065fbb3626 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -904,6 +904,15 @@
 			#mbox-cells = <1>;
 		};
 
+		apcs_hfpll: clock-controller@b016000 {
+			compatible = "qcom,hfpll";
+			reg = <0x0b016000 0x30>;
+			#clock-cells = <0>;
+			clock-output-names = "apcs_hfpll";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+		};
+
 		watchdog@b017000 {
 			compatible = "qcom,kpss-wdt";
 			reg = <0x0b017000 0x1000>;
-- 
2.23.0

