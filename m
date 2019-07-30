Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83AD17AC37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 17:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732286AbfG3PYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 11:24:49 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35690 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732278AbfG3PYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 11:24:49 -0400
Received: by mail-qt1-f195.google.com with SMTP id d23so63461561qto.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a/t4nyA1Q5Ire67bzt1cmZdzjlm5dY9UznxFZlUXgxs=;
        b=Oy/OpaLgFDIl3Ho9McyAVLGL+eOwG/Nb5xH4IwHyDPX2I0P3C74EQUIty8j0aZM2qo
         QhVKHBa3BNey7q6HFjovwuHmrYTAHL6wXvX1vFs6T2tbiep4xqaaFCX0wIrrgVlpQ09R
         ZIwX7eFrvkds0vdWy9VV87a3STHK+RwqtBxubT19kppdZCk7e4sgfV2ekW4LZja6Dcj6
         AtRAHG2BRPQahofXl9ztc7tIFqXkVxY0xS9NRQ6vO3VL834ArmywoTV5u7f/8uUwm1xL
         p9MevdZpy/3K0TWQg+1prqlCdNlR6iHgiKOhu9DbXGhp5a6TNlbFEYx+96Mn4PzMtbr3
         RUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a/t4nyA1Q5Ire67bzt1cmZdzjlm5dY9UznxFZlUXgxs=;
        b=uAuj5GdiRSXDlk4BqImPKg8UwbdYCdg3cUO2Xuk/Fxi0Cf2JTdOP1TAt9tnpkj1rMR
         cfef+SyWW6Zo0La3oQFVlTVYZkV84t1qkDoGaoNJ/HdrrzFS+bQlVcdN0hXbHirAWLkd
         Bk0fsd7wPB+S3Cf5FQ9YrgXdtTMWGHILuzEDsNqFl0oC1m5T+OBSMb+MMbYp/WQoUE1h
         sG9ZfNqKuutIJPrPDzx58fpES9oz3mDwLWDGc0+uVTWeXTsOB6OL5/N3PY8Jr7dvMAS6
         pPpcw6VExb7//sNvtqdTI8RgalalYrNejj/xV2XaCMt7KIkwESjQav2GQW5vBV0+a8w+
         AELg==
X-Gm-Message-State: APjAAAUZjVPbNjsM756dB8PYdsvGN1kguB/wdf57Zc39heELJz4zE4TE
        UAB7M2aiAb1ndE0X4mTGmAxyE5leurs=
X-Google-Smtp-Source: APXvYqx94Ov7Y1nbCbkAGqV/v3t1tnEO2PycbrrXn68BGCtCdHxwCjJWcu+t1wo1xR/RxzXC20qszg==
X-Received: by 2002:ac8:72d7:: with SMTP id o23mr74071688qtp.98.1564500287809;
        Tue, 30 Jul 2019 08:24:47 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-245-97.washdc.fios.verizon.net. [71.255.245.97])
        by smtp.googlemail.com with ESMTPSA id r14sm27251082qkm.100.2019.07.30.08.24.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Jul 2019 08:24:47 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, amit.kucheria@linaro.org,
        vinod.koul@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Patch v2 2/2] arm64: dts: qcom: Extend AOSS QMP node
Date:   Tue, 30 Jul 2019 11:24:43 -0400
Message-Id: <1564500283-16038-3-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1564500283-16038-1-git-send-email-thara.gopinath@linaro.org>
References: <1564500283-16038-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

AOSS hosts resources that can be used to warm up the SoC.
Add nodes for these resources.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5..d0c0d4f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2411,6 +2411,14 @@
 
 			#clock-cells = <0>;
 			#power-domain-cells = <1>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+
+			ebi_cdev: ebi {
+				#cooling-cells = <2>;
+			};
 		};
 
 		spmi_bus: spmi@c440000 {
-- 
2.1.4

